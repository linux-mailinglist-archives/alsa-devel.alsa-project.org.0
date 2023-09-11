Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BD79AAAB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 20:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9044D93A;
	Mon, 11 Sep 2023 20:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9044D93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694455261;
	bh=87Two69lOIG3wAq7/sY1g81F7jv+LQDOSQZzC1nyMl8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQIGGEQkZGi50YtyjZ/gHlInLfCNo+WAXDqfCmTlu4Qxwyt3lIRdC0gdRIfrbD4Al
	 NKXd7zxMgOWgl94Z3/1CzOI3+C0UBDiOhxeYzEne616bQrSFCzTWlTE/2qtD/HnfJc
	 nbOGjkR8JN0rAM3kUAKf9JuVEPTxoHs7yb5B3O+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0521F80431; Mon, 11 Sep 2023 20:00:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4042EF80431;
	Mon, 11 Sep 2023 20:00:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18537F80246; Mon, 11 Sep 2023 19:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CF16F80551
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 19:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CF16F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=iHNrhf/9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38BEfMvf012701;
	Mon, 11 Sep 2023 17:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PeQHtPpk5JOrsMlNiiPboshfw1HH4mh9rMq+8dlgflc=;
 b=iHNrhf/9PKvS8HmRJc/rmi9cmePzZo2vLIAAOuiwsM/QYRFIAPFwvHG0n93gRVi0yw7V
 xIuKe0cdAYYi0fFU4gbnprnJGTP+yg0Q2CQxGrQJ/4PaC3s/LSSfLzjKob5b9zWkuvDR
 6bHm5Z9movOsm/LRCf4CLZp2fvjlo+Ctgy+EEIYj4T0dRdLjurvzCzoF3bIlY4vGVLJe
 F6MqE+EoCHtvnDd20jVB6IKELKiGqSZ3RLJLtl12WRZq7rtKFGnVc3hj5Ef2H+XpwRXp
 LGKyP6+RWtYx+XAudrSAPy+HpGeVq/jgITdOjPcQ8/j7PukLl6n40c12GKk4nzedhpEu iQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1whx9ksa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 17:59:42 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38BHxMGs022130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 17:59:22 GMT
Received: from [10.110.109.129] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 10:59:21 -0700
Message-ID: <cbe35766-a805-3791-3ff8-93aef4dc9f4c@quicinc.com>
Date: Mon, 11 Sep 2023 10:59:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 18/32] sound: usb: Introduce QC USB SND offloading
 support
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <quic_jackp@quicinc.com>, <quic_plai@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-19-quic_wcheng@quicinc.com>
 <8734zqasmz.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <8734zqasmz.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: U_IGeaWnzPKkXe9MF91P2eA5e-XGQJrg
X-Proofpoint-ORIG-GUID: U_IGeaWnzPKkXe9MF91P2eA5e-XGQJrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=835
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110165
Message-ID-Hash: TR43W6OQYKVS3A6U5HFYMRQ6NZS6BP74
X-Message-ID-Hash: TR43W6OQYKVS3A6U5HFYMRQ6NZS6BP74
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TR43W6OQYKVS3A6U5HFYMRQ6NZS6BP74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 9/7/2023 8:51 AM, Takashi Iwai wrote:
> On Tue, 29 Aug 2023 23:06:43 +0200,
> Wesley Cheng wrote:
>>
>> Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
>> support USB sound devices.  This vendor driver will implement the required
>> handshaking with the DSP, in order to pass along required resources that
>> will be utilized by the DSP's USB SW.  The communication channel used for
>> this handshaking will be using the QMI protocol.  Required resources
>> include:
>> - Allocated secondary event ring address
>> - EP transfer ring address
>> - Interrupter number
>>
>> The above information will allow for the audio DSP to execute USB transfers
>> over the USB bus.  It will also be able to support devices that have an
>> implicit feedback and sync endpoint as well.  Offloading these data
>> transfers will allow the main/applications processor to enter lower CPU
>> power modes, and sustain a longer duration in those modes.
>>
>> Audio offloading is initiated with the following sequence:
>> 1. Userspace configures to route audio playback to USB backend and starts
>> playback on the platform soundcard.
>> 2. The Q6DSP AFE will communicate to the audio DSP to start the USB AFE
>> port.
>> 3. This results in a QMI packet with a STREAM enable command.
>> 4. The QC audio offload driver will fetch the required resources, and pass
>> this information as part of the QMI response to the STREAM enable command.
>> 5. Once the QMI response is received the audio DSP will start queuing data
>> on the USB bus.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/Kconfig                 |   15 +
>>   sound/usb/Makefile                |    2 +-
>>   sound/usb/qcom/Makefile           |    2 +
>>   sound/usb/qcom/qc_audio_offload.c | 1813 +++++++++++++++++++++++++++++
>>   4 files changed, 1831 insertions(+), 1 deletion(-)
>>   create mode 100644 sound/usb/qcom/Makefile
>>   create mode 100644 sound/usb/qcom/qc_audio_offload.c
>>
>> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
>> index 4a9569a3a39a..da5838656baa 100644
>> --- a/sound/usb/Kconfig
>> +++ b/sound/usb/Kconfig
>> @@ -176,6 +176,21 @@ config SND_BCD2000
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called snd-bcd2000.
>>   
>> +config QC_USB_AUDIO_OFFLOAD
> 
> Keep SND_ prefix for consistency.  And, at best, align with the module
> name.
> 
>> +	tristate "Qualcomm Audio Offload driver"
>> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
>> +	select SND_PCM
>> +	help
>> +	  Say Y here to enable the Qualcomm USB audio offloading feature.
>> +
>> +	  This module sets up the required QMI stream enable/disable
>> +	  responses to requests generated by the audio DSP.  It passes the
>> +	  USB transfer resource references, so that the audio DSP can issue
>> +	  USB transfers to the host controller.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called qc-audio-offload.
> 
> Hmm, you renamed it differently, no?  In the below:
> 
>> --- /dev/null
>> +++ b/sound/usb/qcom/Makefile
>> @@ -0,0 +1,2 @@
>> +snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
>> +obj-$(CONFIG_QC_USB_AUDIO_OFFLOAD) += snd-usb-audio-qmi.o
> 
> ... it's called snd-usb-audio-qmi.
> 

Will fix this, thanks.

Thanks
Wesley Cheng
