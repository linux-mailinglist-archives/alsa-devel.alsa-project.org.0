Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F225573ADFC
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 02:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24AFF843;
	Fri, 23 Jun 2023 02:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24AFF843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687481601;
	bh=8F3QLTypT8o8BKPr1qBiRaDEyhzGodljn7Dj+mPyyeY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lL70WmVTFsA/3tXyOAVuLV4sV5fBu4lmkWABUE1hq6rSWohyPYdgXEGcalsbIGTiB
	 C6qgaYIQN3sK2hxl9yFIhWkTx/W3zKPTB91UWwOiI2B02AyPTg31bh6jlkLIGlUTGX
	 nJPIjUHOBnV0rKlZ64CVaXRqHhYkoIdHVIFmRV1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E0A3F80163; Fri, 23 Jun 2023 02:52:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 963DEF80141;
	Fri, 23 Jun 2023 02:52:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FDBBF80163; Fri, 23 Jun 2023 02:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17FE5F80141
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 02:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17FE5F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=QDP/PYqu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35N0R5R1026701;
	Fri, 23 Jun 2023 00:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nb0gkvwePDE1+BINC+VXWChN6537cCXhu4XADvMOeq8=;
 b=QDP/PYquSWe0PH24muDrIpUqnvNcfVepE0M+pEhJqZshxfW+3NkyiAnZ+FHarRRRj3Ds
 DPk6wLPXf/2x8ve5STI0Usd3PZ+mrpAwUBZLwukZ11OanGxSzB6eDUFaK0/274/jqVaN
 blCI55GyZuvMHqcCm+BBPAoqRndf1ts2tAqrqCH+XqfX9DswPiJxAVqido1bGW+hy7rB
 HcV3vcLsCP7+kcF3YjNYiOIDMMWy5uO6V1KTcYZonBg3mIXk5aMnxgWt6hy8A0ue7AIv
 KG1wGPygoamPulWMh9mqQQeaoolDNRLir+3r88Sk3BxNQOH5Q5DC5KIzdxdkA+04XS5g Dg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc359m38k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 00:51:54 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 35N0pql8027064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 00:51:52 GMT
Received: from [10.110.109.161] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 22 Jun
 2023 17:51:52 -0700
Message-ID: <dea0a69e-7c5d-07ad-48da-71d19a7f75e0@quicinc.com>
Date: Thu, 22 Jun 2023 17:51:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 21/28] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-22-quic_wcheng@quicinc.com>
 <87f20b22-6305-7590-1dbf-014b5898b15c@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87f20b22-6305-7590-1dbf-014b5898b15c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mL6LnlnUdMfzV_lOLAVeCjfsLcopLIYy
X-Proofpoint-ORIG-GUID: mL6LnlnUdMfzV_lOLAVeCjfsLcopLIYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_18,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=780
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230005
Message-ID-Hash: E6DYBMU2Q5UO7HYWBP7POEJBVGIA3FWK
X-Message-ID-Hash: E6DYBMU2Q5UO7HYWBP7POEJBVGIA3FWK
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6DYBMU2Q5UO7HYWBP7POEJBVGIA3FWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On 3/10/2023 12:56 AM, Krzysztof Kozlowski wrote:
> On 09/03/2023 00:57, Wesley Cheng wrote:
>> Add an example on enabling of USB offload for the Q6DSP.  The routing can
>> be done by the mixer, which can pass the multimedia stream to the USB
>> backend.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> You still miss binding change to APR/GPR. Where is the USB DAI going to sit?
> 

My initial idea is to have it as part of the q6afe APR node (as a 
child).  It would need to issues some transactions over APR to the Q6AFE 
port on the audio DSP, which was the main reason for this.

Something like:

q6afe: apr-service@4 {
	compatible = "qcom,q6afe";
	reg = <APR_SVC_AFE>;
	q6afedai: dais {
		compatible = "qcom,q6afe-dais";
		#address-cells = <1>;
		#size-cells = <0>;
		#sound-dai-cells = <1>;
	};
...
	usbdai: usbd {
		compatible = "qcom,q6usb";
		#sound-dai-cells = <1>;
		iommus = <&apps_smmu 0x180f 0x0>;
		qcom,usb-audio-stream-id = <0xf>;
		qcom,usb-audio-intr-num = <2>;
	};
};

I think the only modification I would probably make is to have an 
example of how to add the q6usb node to enable the audio offloading.

Thanks,
Wesley Cheng

> 
> 
> Best regards,
> Krzysztof
> 
