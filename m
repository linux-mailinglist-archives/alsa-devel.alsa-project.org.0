Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAA9B5244
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2024 19:58:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED18BE9F;
	Tue, 29 Oct 2024 19:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED18BE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730228328;
	bh=4W0HlC2Kj2crp2BfxjlLbRWtQ2TtBDLWnNobKyX3lLw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A51BNNKDsy4JmB0rh37K7KE2zuZsXwsh1BY51G1qx2ZCdITTkbu207gWzm7Kvhzh2
	 AKK1vERoQuy8pTLjuAq8Pvx+rRuY2KmzRupuuCtVxyEVIzulc3aPIErm1j03rkSfHO
	 aEIBmO7Ao7eft28Uqh1vSSHPbq9rvP+xUQc9oiE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A356BF805B2; Tue, 29 Oct 2024 19:58:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71FEEF805AE;
	Tue, 29 Oct 2024 19:58:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BE4F80269; Tue, 29 Oct 2024 19:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4C05F800ED
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 19:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C05F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=GM6laftD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49T8kLjZ028808;
	Tue, 29 Oct 2024 18:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMCcaLZmre/30OJO8WljAYdE/vnQtOlJelWRG+D9fQ4=; b=GM6laftDmoACMeta
	BGKsZRxJqJKeXyKxqGjSiNchu2K5PA15B3h46GOvrHwp6Wtv6zSVqGsQv5URM09L
	UlyvGyeJusABpXzGrTci4IJP8MoqqwvAtZdAobJwEw8MDbXHTnXpAvFLbShPFZMN
	cGM2oWendTaWZDn3aue/EDMztyOZVzBtvmLaPFHg87vugWVzvKkZZedct0jN1jjL
	LsSWcbxL+0pRjInhfRZ9avM2w2QQ0PUu61MNeYTrUsrh0r1znk3aCbLZffibCSBi
	5bw1eOVXJEXBoh0PUO4MMhnYrQuRS5QjcepsdWgBnrL9JhxhtilF3KdZyXkA/uib
	J7zDCw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8heue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 18:58:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49TIw3DJ014208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 18:58:03 GMT
Received: from [10.71.115.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 11:58:03 -0700
Message-ID: <52ea0b32-79c7-42e8-8e2c-192d08f41e64@quicinc.com>
Date: Tue, 29 Oct 2024 11:58:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 04/33] xhci: sideband: add initial api to register a
 sideband entity
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "bgoswami@quicinc.com" <bgoswami@quicinc.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-5-quic_wcheng@quicinc.com>
 <20241025232252.wsk4lviqzyzqjzuh@synopsys.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20241025232252.wsk4lviqzyzqjzuh@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 47BSqjjk7MLktpZ_JdwbGROYbtTP0iEy
X-Proofpoint-ORIG-GUID: 47BSqjjk7MLktpZ_JdwbGROYbtTP0iEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=893 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290142
Message-ID-Hash: 2L4WPJA6I5OOO3X7WFFULCK7MHUVX77G
X-Message-ID-Hash: 2L4WPJA6I5OOO3X7WFFULCK7MHUVX77G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2L4WPJA6I5OOO3X7WFFULCK7MHUVX77G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Thinh,

On 10/25/2024 4:22 PM, Thinh Nguyen wrote:
> Hi,
>
> On Tue, Oct 15, 2024, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Introduce XHCI sideband, which manages the USB endpoints being requested by
>> a client driver.  This is used for when client drivers are attempting to
>> offload USB endpoints to another entity for handling USB transfers.  XHCI
>> sideband will allow for drivers to fetch the required information about the
>> transfer ring, so the user can submit transfers independently.  Expose the
>> required APIs for drivers to register and request for a USB endpoint and to
>> manage XHCI secondary interrupters.
>>
>> Multiple ring segment page linking, proper endpoint clean up, and allowing
>> module compilation added by Wesley Cheng to complete original concept code
>> by Mathias Nyman.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  drivers/usb/host/Kconfig          |   9 +
>>  drivers/usb/host/Makefile         |   2 +
>>  drivers/usb/host/xhci-sideband.c  | 424 ++++++++++++++++++++++++++++++
>>  drivers/usb/host/xhci.h           |   4 +
>>  include/linux/usb/xhci-sideband.h |  70 +++++
>>  5 files changed, 509 insertions(+)
>>  create mode 100644 drivers/usb/host/xhci-sideband.c
>>  create mode 100644 include/linux/usb/xhci-sideband.h
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index 4448d0ab06f0..96659efa4be5 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
>>  	  Say 'Y' to enable the support for the xHCI host controller
>>  	  found in Renesas RZ/V2M SoC.
>>  
>> +config USB_XHCI_SIDEBAND
>> +	tristate "xHCI support for sideband"
>> +	help
>> +	  Say 'Y' to enable the support for the xHCI sideband capability.
>> +	  Provide a mechanism for a sideband datapath for payload associated
> Please correct me if I'm wrong, but this doesn't look like the actual
> xHCI Audio Sideband capability described in the xHCI spec section 7.9
> but rather a specific implementation for Qcom right? For the xHCI Audio
> Sideband xHCI capability, the driver should detect this capability
> through the xHCI get extended capability. If this is not xHCI Audio
> Sideband capability, we should properly clarify this in the
> documentation and the naming of things to avoid any confusion.

Sure, that's a good point.  It does still currently rely on utilizing the system memory for USB IO transfers.  I can add some comments and update some of the documentation to reflect that this is different. 

Thanks

Wesley Cheng

> I believe your implementation still needs to provide the data to the
> host controller through the system memory right? The xHCI Audio Sideband
> capability may pass the data to the xHC other than the main memory.
>
> BR,
> Thinh
>
>> +	  with audio class endpoints. This allows for an audio DSP to use
>> +	  xHCI USB endpoints directly, allowing CPU to sleep while playing
>> +	  audio.
>> +
>>  config USB_XHCI_TEGRA
>>  	tristate "xHCI support for NVIDIA Tegra SoCs"
>>  	depends on PHY_TEGRA_XUSB
