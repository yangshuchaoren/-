package com.zhiyou.util;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
public class SendMessageUtil {
	
	public static void sendms(String tel,String code) throws ServerException, ClientException{
		//���ó�ʱʱ��-�����е���
		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");
		//��ʼ��ascClient��Ҫ�ļ�������
		final String product = "Dysmsapi";//����API��Ʒ���ƣ����Ų�Ʒ���̶��������޸ģ�
		final String domain = "dysmsapi.aliyuncs.com";//����API��Ʒ�������ӿڵ�ַ�̶��������޸ģ�
		//�滻�����AK
		final String accessKeyId = "LTAIMbTl4gAERr4I";//���accessKeyId,�ο����ĵ�����2
		final String accessKeySecret = "kj1mEMHxPJ9awJD6znnjSwwz5H7y1F";//���accessKeySecret���ο����ĵ�����2
		//��ʼ��ascClient,��ʱ��֧�ֶ�region�������޸ģ�
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,
		accessKeySecret);
		try {
			DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		} catch (ClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		IAcsClient acsClient = new DefaultAcsClient(profile);
		 //��װ�������
		 SendSmsRequest request = new SendSmsRequest();
		 //ʹ��post�ύ
		 request.setMethod(MethodType.POST);
		 //����:�������ֻ��š�֧���Զ��ŷָ�����ʽ�����������ã���������Ϊ1000���ֻ�����,������������ڵ������ü�ʱ�������ӳ�,��֤�����͵Ķ����Ƽ�ʹ�õ������õķ�ʽ�����͹���/�۰�̨��Ϣʱ�����պ����ʽΪ00+��������+���룬�硰0085200000000��
		 request.setPhoneNumbers(tel);
		 //����:����ǩ��-���ڶ��ſ���̨���ҵ�
		 request.setSignName("zy��Ƶ");
		 //����:����ģ��-���ڶ��ſ���̨���ҵ������͹���/�۰�̨��Ϣʱ����ʹ�ù���/�۰�̨����ģ��
		 request.setTemplateCode("SMS_137810208");
		 //��ѡ:ģ���еı����滻JSON��,��ģ������Ϊ"�װ���${name},������֤��Ϊ${code}"ʱ,�˴���ֵΪ
		 //������ʾ:���JSON����Ҫ�����з�,����ձ�׼��JSONЭ��Ի��з���Ҫ��,������������а���\r\n�������JSON����Ҫ��ʾ��\\r\\n,����ᵼ��JSON�ڷ���˽���ʧ��
		 request.setTemplateParam("{\"code\":\""+code+"\"}");
		 //��ѡ-���ж�����չ��(��չ���ֶο�����7λ�����£������������û�����Դ��ֶ�)
		 //request.setSmsUpExtendCode("90997");
		 //��ѡ:outIdΪ�ṩ��ҵ����չ�ֶ�,�����ڶ��Ż�ִ��Ϣ�н���ֵ���ظ�������
		 request.setOutId("yourOutId");
		//����ʧ���������ClientException�쳣
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
		if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
		//����ɹ�
		}
	}
}
