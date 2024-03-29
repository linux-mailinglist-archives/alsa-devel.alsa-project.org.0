Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 941628927D4
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Mar 2024 00:29:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C90D2CB9;
	Sat, 30 Mar 2024 00:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C90D2CB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711754995;
	bh=FljFVK0LWL0DBJZBpjYAK+fE0M46Xdu18dgr3xy1rEo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=THIC0cv+y3gRHzXYb2dD63aoHaHkPImQgiD0SXbvh82ERgq7PRIkXiCiW2oJpc/5e
	 aL3yRavy2HahHe4H0k0a27qSjAxwGQ+U7jjblL3pLEeRkyTEgnZTGrfojnUF0DxOO/
	 /Qi00TKxKG/EdBlMTK7BqI6Qa6armBMiUJTiLnDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00EE8F8059F; Sat, 30 Mar 2024 00:29:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF79F805A1;
	Sat, 30 Mar 2024 00:29:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBAA8F8025F; Sat, 30 Mar 2024 00:29:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 402CAF801EB
	for <alsa-devel@alsa-project.org>; Sat, 30 Mar 2024 00:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 402CAF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=fJM2RB/W
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42TNMHWS018441;
	Fri, 29 Mar 2024 23:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bI0G/uiG1h+1qLw6ZNxCnhLtyJ0F1AJmbQvh02bXtl4=; b=fJ
	M2RB/WcQeiFYW5p/LrMXn0AtrzeYVmHZAdhFbZBrKs56Zl935Ns2CAOTiQ19konP
	ZHksVSvI/AU5VlhxumAJtyHtBonJQBemKB1Mc5HOk2c/WtDKxo700ifs7uCo47Yn
	DVdTRNsB2L70s6ymNLOdlurLYszmmat6RmUkCuuHqiEESsnuuqD0QQFHk+1xOG1k
	fsZZsDTzhfGUV7VbCe+QfpP95dCs/LuMV5fZB25zKFYRhqz+KZZY5wIVCPzrRGfv
	HAkgK4b6x7oiFxDHDZoD6n9l7iAeT3KPDVRCoopxXMIntKj0dXbxqcW9JqkuDAmx
	uZq85+Z6/RvSTKTs2Xvg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x60wd8w6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 23:28:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 42TNSuWx013284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 23:28:56 GMT
Received: from [10.110.26.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 16:28:55 -0700
Message-ID: <4ee6a5e4-0cad-ae44-2b42-d1b03c64f467@quicinc.com>
Date: Fri, 29 Mar 2024 16:28:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 00/41] Introduce QC USB SND audio offloading support
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240228013619.29758-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20240228013619.29758-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pMgXXbMWyru5-yP8KYxdhCnYAu_wDKrv
X-Proofpoint-ORIG-GUID: pMgXXbMWyru5-yP8KYxdhCnYAu_wDKrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1011 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290208
Message-ID-Hash: SEH2KS3CYIZP7WJA2W5XL3ZAP5QA45WZ
X-Message-ID-Hash: SEH2KS3CYIZP7WJA2W5XL3ZAP5QA45WZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEH2KS3CYIZP7WJA2W5XL3ZAP5QA45WZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 2/27/2024 5:35 PM, Wesley Cheng wrote:
> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.
> There are several parts to this design:
>    1. Adding ASoC binding layer
>    2. Create a USB backend for Q6DSP
>    3. Introduce XHCI interrupter support
>    4. Create vendor ops for the USB SND driver
> 
>        USB                          |            ASoC
> --------------------------------------------------------------------
>                                     |  _________________________
>                                     | |sm8250 platform card     |
>                                     | |_________________________|
>                                     |         |           |
>                                     |      ___V____   ____V____
>                                     |     |Q6USB   | |Q6AFE    |
>                                     |     |"codec" | |"cpu"    |
>                                     |     |________| |_________|
>                                     |         ^  ^        ^
>                                     |         |  |________|
>                                     |      ___V____    |
>                                     |     |SOC-USB |   |
>     ________       ________               |        |   |
>    |USB SND |<--->|QC offld|<------------>|________|   |
>    |(card.c)|     |        |<----------                |
>    |________|     |________|___     | |                |
>        ^               ^       |    | |    ____________V_________
>        |               |       |    | |   |APR/GLINK             |
>     __ V_______________V_____  |    | |   |______________________|
>    |USB SND (endpoint.c)     | |    | |              ^
>    |_________________________| |    | |              |
>                ^               |    | |   ___________V___________
>                |               |    | |->|audio DSP              |
>     ___________V_____________  |    |    |_______________________|
>    |XHCI HCD                 |<-    |
>    |_________________________|      |
> 
> 
> Adding ASoC binding layer:
> soc-usb: Intention is to treat a USB port similar to a headphone jack.
> The port is always present on the device, but cable/pin status can be
> enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> communicate with USB SND.
> 
> Create a USB backend for Q6DSP:
> q6usb: Basic backend driver that will be responsible for maintaining the
> resources needed to initiate a playback stream using the Q6DSP.  Will
> be the entity that checks to make sure the connected USB audio device
> supports the requested PCM format.  If it does not, the PCM open call will
> fail, and userpsace ALSA can take action accordingly.
> 
> Introduce XHCI interrupter support:
> XHCI HCD supports multiple interrupters, which allows for events to be routed
> to different event rings.  This is determined by "Interrupter Target" field
> specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
> 
> Events in the offloading case will be routed to an event ring that is assigned
> to the audio DSP.
> 
> Create vendor ops for the USB SND driver:
> qc_audio_offload: This particular driver has several components associated
> with it:
> - QMI stream request handler
> - XHCI interrupter and resource management
> - audio DSP memory management
> 
> When the audio DSP wants to enable a playback stream, the request is first
> received by the ASoC platform sound card.  Depending on the selected route,
> ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
> will send an AFE port start command (with enabling the USB playback path), and
> the audio DSP will handle the request accordingly.
> 
> Part of the AFE USB port start handling will have an exchange of control
> messages using the QMI protocol.  The qc_audio_offload driver will populate the
> buffer information:
> - Event ring base address
> - EP transfer ring base address
> 
> and pass it along to the audio DSP.  All endpoint management will now be handed
> over to the DSP, and the main processor is not involved in transfers.
> 
> Overall, implementing this feature will still expose separate sound card and PCM
> devices for both the platorm card and USB audio device:
>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>   1 [Audio          ]: USB-Audio - USB Audio
>                        Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed
> 
> This is to ensure that userspace ALSA entities can decide which route to take
> when executing the audio playback.  In the above, if card#1 is selected, then
> USB audio data will take the legacy path over the USB PCM drivers, etc...
> 
> This feature was validated using:
> - tinymix: set/enable the multimedia path to route to USB backend
> - tinyplay: issue playback on platform card
> 
> Changelog
> --------------------------------------------
> Changes in v18:
> - Rebased to usb-next, which merged in part of the series.  Removed these patches.
> - Reworked Kconfigs for the ASoC USB related components from QCOM Q6DSP drivers
>    to keep dependencies in place for SoC USB and USB SND.
> - Removed the repurposing of the stop ep sync API into existing XHCI operations.
>    This will be solely used by the XHCI sideband for now.
> 

Wanted to give a friendly ping to see if there were any more 
concerns/feedback about this series before I submit a new revision that 
rebases to the latest kernel codebase?

Thanks
Wesley Cheng
