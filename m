Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 654FF94550E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 01:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2BDA3E58;
	Fri,  2 Aug 2024 01:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2BDA3E58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722556721;
	bh=SRe+HOduI9I/TTc5kqhaTutON7QjmRIiDJcjmvowtzA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZCCgeRg45FXssnP1J7QylhsSsdYaYRH5hIlTJbH6p/WzZiPZe7APKQu5tVM3kT3Oa
	 18CT6PlcliT9EyzfIw7tTDTs21l9e9bnKhcE6XlKvqyuOPS4ffVefi69grGhUYtUln
	 PaE2kcK9003gSbBt469iIPrczTE9uDHWMnzgKUvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B4DFF805AB; Fri,  2 Aug 2024 01:58:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A47A9F80588;
	Fri,  2 Aug 2024 01:58:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87163F8026A; Fri,  2 Aug 2024 01:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 655E7F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 01:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 655E7F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YAJq9/uq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 471Lbj5X028809;
	Thu, 1 Aug 2024 23:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+jSJ/zbzuWb9fsjty1sUBSDZFvEM1ajNsop565+wIE=; b=YAJq9/uqMKhHRCFo
	ZooUxgXjmrpO/Ux9ieZ4HcN5AMR//EI9F1OvSxLL6LpSHJN0iULFFp5D+WTt6izt
	RJhZ6Qn2r7OgTdqjJNCLdVCWRTe0oEDMVIiMVoX9gZQFNaYkn49w+GSWv2oBGU7Y
	wZvWQ496CuCv3WFJ/rrIFySIMSoau5d8ai7tVGUIwLnbGGaN7CTDCBxFIEoPf7Ut
	z71SUGm/zlc7GhD7qgXh66PqcR6R9r08ns+IjGsqhOI0zNFe745bX26VRNZ5CxSY
	JrAoIPotkVJgbylWZsr1nuXDmG/4Uxzk6am58Ugcu/r04ZvhGHxhSF3W01h6YFr/
	6T57Ew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rjefr6wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 23:50:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471NoDKl004700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 23:50:13 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 16:50:12 -0700
Message-ID: <f621ae59-7a78-4cd2-8eb7-eb02432e4828@quicinc.com>
Date: Thu, 1 Aug 2024 16:50:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-13-quic_wcheng@quicinc.com>
 <57c5af3e-3299-47ae-9e13-bfce077f5e23@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <57c5af3e-3299-47ae-9e13-bfce077f5e23@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zEn_n7EfQwr72h4zIsLzjWracdp5xdRR
X-Proofpoint-ORIG-GUID: zEn_n7EfQwr72h4zIsLzjWracdp5xdRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_22,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=579
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010160
Message-ID-Hash: B5KC2RDODLMAJB2Z7UPWDCGGWLVNNDJD
X-Message-ID-Hash: B5KC2RDODLMAJB2Z7UPWDCGGWLVNNDJD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5KC2RDODLMAJB2Z7UPWDCGGWLVNNDJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/1/2024 1:26 AM, Pierre-Louis Bossart wrote:
>> +
>> +::
>> +
>> +               USB                   |            ASoC
>> +                                     |  _________________________
>> +                                     | |   ASoC Platform card    |
>> +                                     | |_________________________|
>> +                                     |         |           |
>> +                                     |      ___V____   ____V____
>> +                                     |     |ASoC BE | |ASoC FE  |
>> +                                     |     |DAI LNK | |DAI LNK  |
>> +                                     |     |________| |_________|
>> +                                     |         ^  ^        ^
>> +                                     |         |  |________|
>> +                                     |      ___V____    |
>> +                                     |     |SOC-USB |   |
>> +     ________       ________               |        |   |
>> +    |USB SND |<--->|USBSND  |<------------>|________|   |
>> +    |(card.c)|     |offld   |<----------                |
>> +    |________|     |________|___     | |                |
>> +        ^               ^       |    | |    ____________V_________
>> +        |               |       |    | |   |IPC                   |
>> +     __ V_______________V_____  |    | |   |______________________|
>> +    |USB SND (endpoint.c)     | |    | |              ^
>> +    |_________________________| |    | |              |
>> +                ^               |    | |   ___________V___________
>> +                |               |    | |->|audio DSP              |
>> +     ___________V_____________  |    |    |_______________________|
>> +    |XHCI HCD                 |<-    |
>> +    |_________________________|      |
>> +
> It wouldn't hurt to describe what you mean by 'port' in this diagram...
Sure, as mentioned in my earlier comments, in the USB world, port and device is kind of interchangeable, at least IMO.  I'd like to stick with the "port" term, but if you see otherwise, let me know. 
>
>> +SOC USB driver
>> +==============
>> +Structures
>> +----------
>> +``struct snd_soc_usb``
>> +
>> +  - ``list``: list head for SND SOC struct list
>> +  - ``component``: reference to ASoC component
>> +  - ``num_supported_streams``: number of supported concurrent sessions
>> +  - ``connection_status_cb``: callback to notify connection events
>> +  - ``get_offload_dev``: callback to fetch selected USB sound card/PCM device
> I think you meant fetch offloaded sound card and PCM device information
> for a given USB card:device pair?
Correct, will change.
>
>> +Functions
>> +---------
>> +.. code-block:: rst
>> +
>> +	const char *snd_soc_usb_get_components_tag(bool playback);
>> +..
>> +
>> +  - ``playback``: direction of audio stream
> why not use the usual direction 0: playback and 1: capture?
>
>> +
>> +**snd_soc_usb_get_components_tag()** returns the tag used for describing if USB
>> +offloading is supported for appending to a sound card's components string.
> How does this work if the ASoC part is probe after the USB card? The
> component string would be modified after the creation of the card?
>
> A control is more dynamic by nature, not sure about this component
> string. Jaroslav?
Do we actually need to add this?  I think just having the kcontrol is sufficient.
>> +**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
>> +Once added, this device can be referenced by further operations.
>> +
>> +.. code-block:: rst
>> +
>> +	void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
>> +..
>> +
>> +  - ``usb``: SOC USB device to remove
>> +
>> +**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
>> +After removing a device, any SOC USB operations would not be able to reference the
>> +device removed.
> Not clear to me if the notion of 'port' helps, why not just
> snd_soc_usb_add_device() and remove_device()?
I'm open to either terms, since both mean the same to me :).
>
>> +
>> +USB Offload Related Kcontrols
>> +=============================
>> +Details
>> +-------
>> +A set of kcontrols can be utilized by applications to help select the proper sound
>> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
>> +callback that designs can use to ensure that the proper indices are returned to the
>> +application.
>> +
>> +Implementation
>> +--------------
>> +
>> +**Example:**
>> +
>> +  **Sound Cards**:
>> +
>> +	::
>> +
>> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
>> +						Plantronics Plantronics Blackwire 3225 Seri at usb-xhci-hcd.1.auto-1.1, full sp
>> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
>> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
>> +
>> +  **USB Sound Card** - card#1:
>> +
>> +	::
>> +
>> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
>> +
>> +  **USB Sound Card** - card#2:
>> +
>> +	::
>> +
>> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
>> +
>> +The above example shows a scenario where the system has one ASoC platform card
>> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
>> +the available kcontrols for each USB audio device, the following kcontrol lists
>> +the mapped offload path for the specific device:
>> +
>> +	"USB Offload Playback Route#*"
>> +
>> +The kcontrol is indexed, because a USB audio device could potentially have
>> +several PCM devices.  The above kcontrols are defined as:
>> +
>> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
>> +	card and PCM device index.  The output "0, 1" (card index, PCM device index)
>> +	signifies that there is an available offload path for the USB SND device
>> +	through card#0-PCM device#1.  If "-1, -1" is seen, then no offload path is
>> +	available for the USB SND device.
>> +
>> +USB Offload Playback Route Kcontrol
>> +-----------------------------------
>> +In order to allow for vendor specific implementations on audio offloading device
>> +selection, the SOC USB layer exposes the following:
>> +
>> +.. code-block:: rst
>> +
>> +	int (*get_offload_dev)(struct snd_kcontrol *kcontrol,
>> +			      struct snd_ctl_elem_value *ucontrol);
>> +..
>> +
>> +These are specific for the **USB Offload Playback Route PCM#** kcontrol.
>> +
>> +When users issue get calls to the kcontrol, the registered SOC USB callbacks will
>> +execute the registered function calls to the DPCM BE DAI link.
> Oh man, now I get what 'get_offload_dev" means: it really means
> "update_offload_info' or 'update_info_kcontrol".
> The 'get' routines usually provide a handle on something to another part
> of the kernel.
> Not here, it's an update of something to be looked-up by userspace...
>
I can change the naming for this if its not the right terms used.  As long as you understand how the concept works then the name changing isn't a problem.

Thanks

Wesley Cheng

>> +**Callback Registration:**
>> +
>> +.. code-block:: rst
>> +
>> +	static int q6usb_component_probe(struct snd_soc_component *component)
>> +	{
>> +	...
>> +	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
>> +	if (IS_ERR(usb))
>> +		return -ENOMEM;
>> +
>> +	usb->connection_status_cb = q6usb_alsa_connection_cb;
>> +	usb->get_offload_dev = q6usb_get_offload_dev;
>> +
>> +	ret = snd_soc_usb_add_port(usb);
>> +..
