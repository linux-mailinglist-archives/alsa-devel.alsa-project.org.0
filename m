Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF66198B1CF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EDC284C;
	Tue,  1 Oct 2024 03:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EDC284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727746515;
	bh=KvRv3HPoCks40UF9WJLGU1n5KP/egUTkwFc+vw6xKVs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aqClRFqDu73IupcKL9jGD5UjL/sh9yb0Teg7zNA4YHUVN1L6q7KmpuKKcTvMtD8Y9
	 rgdcx1FewJk9o3vb0B7vM2OlwGYe9tdErZCHgAEG/9COf7OKw1vz7QOuVFQDqvGqbt
	 NaKmIvdkZelg9r29D8ooCiPpIt7Uk9YUZWhWqsD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44766F805AF; Tue,  1 Oct 2024 03:34:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD403F805A9;
	Tue,  1 Oct 2024 03:34:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE16DF80517; Tue,  1 Oct 2024 03:34:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2674DF80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2674DF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ayy5E3qA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4910dqCs002704;
	Tue, 1 Oct 2024 01:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHR3SFuJ30QEWYqARN/DWsz2+YsrlyYzUMhMJaMWu2Y=; b=ayy5E3qApDFWLTUu
	L1cGhKaUnfWB27R2Nh0snRoK9heV55HVfhNXvombFtEUeuhm0YCfvx/KAM/KI+FC
	hyimCycYUfLgqF0O0d1MHepaTY6xnviCYvMJq50zgTCi2+cDMIHH0TB8LB2n3ojN
	2Oji+yHlxaC+Jb5IcIcxL0CQOmNSqRxtPc7U1/7m08Xamkum1HwMX1VlCWTD1/Ov
	WwDy/SMM/KOb7yB2yZUU1LkCmjLWz+y9EcX2dMgLVmQKQzRtE8l9nehCplaOjDaZ
	tCBXctM5knGawQGHOV9y78ilWXK0sQlHKXWV1qaftwaxbcZuBBMWwpN/J9f5qKSk
	74QGvQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x7ge6sa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 01:34:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 4911Yf8j002469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 01:34:41 GMT
Received: from [10.110.124.200] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 18:34:39 -0700
Message-ID: <eec96e68-4fc4-48c5-b526-62166ab96d9e@quicinc.com>
Date: Mon, 30 Sep 2024 18:34:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 18/32] ASoC: doc: Add documentation for SOC USB
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-19-quic_wcheng@quicinc.com>
 <86c557ca-2b86-4334-bc42-40dfe8203b71@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <86c557ca-2b86-4334-bc42-40dfe8203b71@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KmBYZu2VdFx-qQuSiLPR_1h9Sy_5m9cT
X-Proofpoint-GUID: KmBYZu2VdFx-qQuSiLPR_1h9Sy_5m9cT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010010
Message-ID-Hash: GROLCU6EEARM6KDQ5PN2IT2NG7EG36TQ
X-Message-ID-Hash: GROLCU6EEARM6KDQ5PN2IT2NG7EG36TQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GROLCU6EEARM6KDQ5PN2IT2NG7EG36TQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 9/25/2024 7:43 AM, Pierre-Louis Bossart wrote:
>> +	int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +					struct snd_soc_jack *jack)
>> +..
>> +
>> +  - ``component``: ASoC component to add the jack
>> +  - ``jack``: jack component to populate
>> +
>> +**snd_soc_usb_setup_offload_jack()** is a helper to add a sound jack control to
>> +the platform sound card.  This will allow for consistent naming to be used on
>> +designs that support USB audio offloading.
>> +
>> +Returns 0 on success, negative otherwise.
>> +
>> +.. code-block:: rst
>> +
>> +	int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>> +..
>> +
>> +  - ``component``: ASoC component to disable the jack
>> +
>> +**snd_soc_usb_disable_offload_jack()** is a helper to disable a sound jack control
>> +on the platform sound card.
> is disable_offload_jack() the companion operation to setup_offload_jack()?
>
> it's not clear to me if there's any relationship between the two.
I guess there is a relation in that one creates the jack and the other will disable it when needed.  Might need to have a respective enable API, because I believe there are some situations during PM suspend where a jack may want to be disabled and re-enabled on PM resume.
>> +
>> +Returns 0 on success, negative otherwise.
>> +
>> +.. code-block:: rst
>> +
>> +	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
>> +					     int direction, long *route)
>> +..
>> +
>> +  - ``dev``: USB device to look up offload path mapping
>> +  - ``card``: USB sound card index
>> +  - ``pcm``: USB sound PCM device index
>> +  - ``direction``: direction to fetch offload routing information
>> +  - ``route``: mapping of sound card and pcm indexes for the offload path.  This is
>> +	       an array of two integers that will carry the card and pcm device indexes
>> +	       in that specific order.  This can be used as the array for the kcontrol
>> +	       output.
>> +
>> +**snd_soc_usb_update_offload_route()** calls a registered callback to the USB BE DAI
>> +link to fetch the information about the mapped ASoC devices for executing USB audio
>> +offload for the device. ``route`` may be a pointer to a kcontrol value output array,
>> +which carries values when the kcontrol is read.
>> +
>> +Returns 0 on success, negative otherwise.
> please clarify what happens if there is no offloaded device for a
> specific USB card. from [2] below it looks like the intended behavior
> for a device without offload capabilities would be to return 0 but the
> mapping would use the -1 magic value to state there is no offload?
>
That is the idea... If we return -1,-1 that is an invalid card/pcm device index, so it would signify that offloading is not available for a USB device.
>> +**snd_soc_usb_free_port()** frees a SOC USB device.
>> +
>> +.. code-block:: rst
>> +
>> +	void snd_soc_usb_add_port(struct snd_soc_usb *usb);
>> +..
>> +
>> +  - ``usb``: SOC USB device to add
>> +
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
> I don't think the last sentence is correct, below [1] you show an
> example where the free_port() routine is required...
>
The remove will remove it from the available list of SOC USB ports.  The free will just make sure the memory allocated for the SOC USB port is freed.
>> +
>> +	static void q6usb_component_remove(struct snd_soc_component *component)
>> +	{
>> +		...
> [1]
>
>> +		snd_soc_usb_remove_port(data->usb);
>> +		snd_soc_usb_free_port(data->usb);
>> +	}
>> +
>> +	static const struct snd_soc_component_driver q6usb_dai_component = {
>> +		.probe = q6usb_component_probe,
>> +		.remove = q6usb_component_remove,
>> +		.name = "q6usb-dai-component",
>> +		...
>> +	};
>> +..
>> +
>> +BE DAI links can pass along vendor specific information as part of the
>> +call to allocate the SOC USB device.  This will allow any BE DAI link
>> +parameters or settings to be accessed by the USB offload driver that
>> +resides in USB SND.
>> +
>> +USB Audio Device Connection Flow
>> +--------------------------------
>> +USB devices can be hotplugged into the USB ports at any point in time.
>> +The BE DAI link should be aware of the current state of the physical USB
>> +port, i.e. if there are any USB devices with audio interface(s) connected.
>> +connection_status_cb() can be used to notify the BE DAI link of any change.
>> +
>> +This is called whenever there is a USB SND interface bind or remove event,
>> +using snd_soc_usb_connect() or snd_soc_usb_disconnect():
>> +
>> +.. code-block:: rst
>> +
>> +	static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>> +	{
>> +		...
>> +		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
>> +		...
>> +	}
>> +
>> +	static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
>> +	{
>> +		...
>> +		snd_soc_usb_disconnect(usb_get_usb_backend(chip->dev), dev->sdev);
>> +		...
>> +	}
>> +..
>> +
>> +In order to account for conditions where driver or device existence is
>> +not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
>> +connect events for any identified USB audio interfaces.  Consider the
>> +the following situation:
>> +
>> +	**usb_audio_probe()**
>> +	  | --> USB audio streams allocated and saved to usb_chip[]
>> +	  | --> Propagate connect event to USB offload driver in USB SND
>> +	  | --> **snd_soc_usb_connect()** exits as USB BE DAI link is not ready
>> +
>> +	BE DAI link component probe
>> +	  | --> DAI link is probed and SOC USB port is allocated
>> +	  | --> The USB audio device connect event is missed
>> +
>> +To ensure connection events are not missed, **snd_usb_rediscover_devices()**
>> +is executed when the SOC USB device is registered.  Now, when the BE DAI
>> +link component probe occurs, the following highlights the sequence:
>> +
>> +	BE DAI link component probe
>> +	  | --> DAI link is probed and SOC USB port is allocated
>> +	  | --> SOC USB device added, and **snd_usb_rediscover_devices()** runs
>> +
>> +	**snd_usb_rediscover_devices()**
>> +	  | --> Traverses through usb_chip[] and for non-NULL entries issue
>> +	  |     **connection_status_cb()**
>> +
>> +In the case where the USB offload driver is unbound, while USB SND is ready,
>> +the **snd_usb_rediscover_devices()** is called during module init.  This allows
>> +for the offloading path to also be enabled with the following flow:
>> +
>> +	**usb_audio_probe()**
>> +	  | --> USB audio streams allocated and saved to usb_chip[]
>> +	  | --> Propagate connect event to USB offload driver in USB SND
>> +	  | --> USB offload driver **NOT** ready!
>> +
>> +	BE DAI link component probe
>> +	  | --> DAI link is probed and SOC USB port is allocated
>> +	  | --> No USB connect event due to missing USB offload driver
>> +
>> +	USB offload driver probe
>> +	  | --> **qc_usb_audio_offload_init()**
>> +	  | --> Calls **snd_usb_rediscover_devices()** to notify of devices
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
>> +						Plantronics Plantronics Blackwire
>> +						3225 Seri at usb-xhci-hcd.1.auto-1.1,
>> +						full sp
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
>> +	``USB Offload Playback Route#*``
>> +
>> +The kcontrol is indexed, because a USB audio device could potentially have
>> +several PCM devices.  The above kcontrols are defined as:
>> +
>> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
>> +    card and PCM device index.  The output **"0, 1"** (card index, PCM device index)
>> +    signifies that there is an available offload path for the USB SND device
>> +    through card#0 - PCM device#1.  If **"-1, -1"** is seen, then no offload path is
>> +    available for the USB SND device.
> [2]
>
> maybe I got this wrong but you may want to clarify that the kcontrol is
> always created, but the values indicate if the offload support is real
> or not?
Sure, I will explicitly mention that the kcontrol always exists, and if the path is not available, then this would show -1, -1
>
>> +
>> +USB Offload Playback Route Kcontrol
>> +-----------------------------------
>> +In order to allow for vendor specific implementations on audio offloading device
>> +selection, the SOC USB layer exposes the following:
>> +
>> +.. code-block:: rst
>> +
>> +	int (*update_offload_route_info)(struct snd_soc_component *component,
>> +				int card, int pcm, long *route);
>> +..
>> +
>> +These are specific for the **USB Offload Playback Route PCM#** kcontrol.
>> +
>> +When users issue get calls to the kcontrol, the registered SOC USB callbacks will
>> +execute the registered function calls to the DPCM BE DAI link.
>> +
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
>> +	usb->update_offload_route_info = q6usb_get_offload_dev;
>> +
>> +	ret = snd_soc_usb_add_port(usb);
>> +..
>> +
>> +Existing USB Sound Kcontrol
>> +---------------------------
>> +With the introduction of USB offload support, the above USB offload kcontrol
>> +can be added to the pre existing list of kcontrols identified by the USB sound
> is this 'can be added' or 'will be added'? The latter seems more correct
> to me, I don't see anything optional or conditional in the description
> and the example below.

Will be added sounds better.  Will change that.

Thanks

Wesley Cheng

>> +framework.  These kcontrols are still the main controls that are used to
>> +modify characteristics pertaining to the USB audio device.
>> +
>> +	::
>> +
>> +	  Number of controls: 9
>> +	  ctl     type    num     name                                    value
>> +	  0       INT     2       Capture Channel Map                     0, 0 (range 0->36)
>> +	  1       INT     2       Playback Channel Map                    0, 0 (range 0->36)
>> +	  2       BOOL    1       Headset Capture Switch                  On
>> +	  3       INT     1       Headset Capture Volume                  10 (range 0->13)
>> +	  4       BOOL    1       Sidetone Playback Switch                On
>> +	  5       INT     1       Sidetone Playback Volume                4096 (range 0->8192)
>> +	  6       BOOL    1       Headset Playback Switch                 On
>> +	  7       INT     2       Headset Playback Volume                 20, 20 (range 0->24)
>> +	  8       INT     2       USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
>> +
>> +Since USB audio device controls are handled over the USB control endpoint, use the
>> +existing mechanisms present in the USB mixer to set parameters, such as volume.
