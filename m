Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4412A84FDAB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 21:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809A1857;
	Fri,  9 Feb 2024 21:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809A1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707510932;
	bh=AcZcr3f09+rD5Y7GuUWLp4tl4KPCmu+ts7Zq4Po7zKQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uLykHZszfBezL48Gbw/R5rs9GaUL0xrCFIjv6lX9H5TN3UEOpol6hSN2yB8XPVWC4
	 6G8q9j63s1DndvzXM4Kss5Y1xQJBLSoiRTvyNQyqSWWBiPxzDLIku1TsvGHirt8c4U
	 DSURrk+NUKlDQGbJV8lMex7qr8381VC84R0Vg2TQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE866F8058C; Fri,  9 Feb 2024 21:35:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F49F805A0;
	Fri,  9 Feb 2024 21:35:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2682F801EB; Fri,  9 Feb 2024 21:34:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA9A6F8016E
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 21:34:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA9A6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MVTQxeHc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 419KVEgL025374;
	Fri, 9 Feb 2024 20:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EcK6pRWGITTYQwRJIMt0XeWCySM/dPmPOKmlZyQFeLY=; b=MV
	TQxeHcKaUtkHSWaQIIKu4WTKh1B/4yD31xiBpsW+MLQSz2A8bG8zbdkSLGK3gJl3
	dH04youaGU1LSR5J0cPMJekgoGPdlM6xjnO3NMQxfDHshXyoszvcJvzMmZ/BDGuz
	+cYZR3hKhB6WF/sARfFcvddU6Q4enlUtNI12dkO/C/H8XQZoNXE2DKh8QKVpjNRW
	Y/lG6MuVt17x+pS/ZPD5qzKYdp//gmaNK8BXClHWhYfw9a1StmwlP50NkeBL2l36
	8IPXpPSEoEcJYyAL/fPVhbLudpovNQiPNCSog3ioquzLIMjYyb45Dvq0t1Fog1P3
	gMpRbi/HpO4CcG8lQoBA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5u4br0c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 20:34:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 419KYfxF021392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 20:34:41 GMT
Received: from [10.110.93.252] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 12:34:40 -0800
Message-ID: <b007a78c-b8fb-83bc-3be6-963708182cee@quicinc.com>
Date: Fri, 9 Feb 2024 12:34:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v14 20/53] ASoC: Add SOC USB APIs for adding an USB
 backend
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
 <20240208231406.27397-21-quic_wcheng@quicinc.com>
 <87r0hl29ha.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87r0hl29ha.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PRnU2u4QXt78XkFphwTc7NkRjdlhcKXl
X-Proofpoint-GUID: PRnU2u4QXt78XkFphwTc7NkRjdlhcKXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_18,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=884
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402090150
Message-ID-Hash: F456SS2ZIA474RPFIZTCBTVC2D57IYZJ
X-Message-ID-Hash: F456SS2ZIA474RPFIZTCBTVC2D57IYZJ
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F456SS2ZIA474RPFIZTCBTVC2D57IYZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/9/2024 2:54 AM, Takashi Iwai wrote:
> On Fri, 09 Feb 2024 00:13:33 +0100,
> Wesley Cheng wrote:
>>
>> Some platforms may have support for offloading USB audio devices to a
>> dedicated audio DSP.  Introduce a set of APIs that allow for management of
>> USB sound card and PCM devices enumerated by the USB SND class driver.
>> This allows for the ASoC components to be aware of what USB devices are
>> available for offloading.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> (snip)
>> --- a/sound/soc/Makefile
>> +++ b/sound/soc/Makefile
>> @@ -1,5 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0
>> -snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
>> +snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-usb.o soc-utils.o soc-dai.o soc-component.o
>>   snd-soc-core-objs += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o
>>   snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
> 
> Do we really want to build this into ASoC core unconditionally?
> This is very specific to Qualcomm USB-offload stuff, so it's better to
> factor out.
> 

Ideally, the SOC USB part shouldn't be Qualcomm specific.  Since I don't 
have access or insight into how other vendors are achieving the same 
thing, I can only base the soc-usb layer to work with the information 
that is required to get the audio stream up and running on the QC 
platforms.  In its simplest form, its basically just a SW entity that 
notifies ASoC components about changes occurring from USB SND, and I 
think all vendors that have an ASoC based platform card handling the 
offload will need this notification.

Thanks
Wesley Cheng
