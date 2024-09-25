Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88767986203
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 17:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57BBEE0F;
	Wed, 25 Sep 2024 17:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57BBEE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727276762;
	bh=T2zrorYH38ZeDMov/K20BC/o421pWzvHIB0IRUXQoGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jErywvR0fohu49o0Ujpek50slXp8jbib6/skWJVvJ/N1Wsbmw/rGB3UBSfS9P+5cR
	 dfz+XwhVp9FQWQqPQjVzJ7FB2XsFd6ndlSYzswOFY3P47GAzn4wgEzQaqWWcSHTI3w
	 hDj/ZXNfeDzgdKSMr/2IlYPDw2rMWCXLtcjbDr+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57293F805D9; Wed, 25 Sep 2024 17:05:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CC44F805DA;
	Wed, 25 Sep 2024 17:05:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 448D8F802DB; Wed, 25 Sep 2024 17:05:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 280A4F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 17:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280A4F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RzYZ2baj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276714; x=1758812714;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T2zrorYH38ZeDMov/K20BC/o421pWzvHIB0IRUXQoGU=;
  b=RzYZ2bajevu++GK0NeSd1SUtRSFiljBETf2saiV8X289feu8UhaeRcxB
   4FvutvFslX0Qw6HtuCzgv9OPqzFubpXD9b5kBzA0+zBhVynLqDd2jGIlA
   jkb+rHw/PpbfBaZOf3PZ0uOKfi8jYoPdPkGsDk82bEmbdF19lIT2Dhpky
   LP7V+AgqDnxHTxFHUuXnSqCBm5laEVFo6EOPNvEC7NqaxsBgiVitXSOX6
   Am4bBjgzIj7HTALEP1tQJC27eRESHDqZ8ASLCdT6kxYJsuV8x575MHD2d
   4VehKb0Uq10h0pRWLWLINGFkLG8kJjS7VdqE4RqANtYI/hd2X3fOCVnHz
   g==;
X-CSE-ConnectionGUID: yTF/Y7yaQS6oU/Jhoyka8Q==
X-CSE-MsgGUID: tLuqDFIHRA2xpxUMKtb9PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482900"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="26482900"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:13 -0700
X-CSE-ConnectionGUID: IjO7nbUrSZOqVow0coJEug==
X-CSE-MsgGUID: VVIHvXAeRGu7a+YerlxuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="76317677"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30])
 ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:07 -0700
Message-ID: <86c557ca-2b86-4334-bc42-40dfe8203b71@linux.intel.com>
Date: Wed, 25 Sep 2024 16:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 18/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZCHSQJEHCBMVQFZHATIN6J5OEZJLMYL3
X-Message-ID-Hash: ZCHSQJEHCBMVQFZHATIN6J5OEZJLMYL3
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCHSQJEHCBMVQFZHATIN6J5OEZJLMYL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +	int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +					struct snd_soc_jack *jack)
> +..
> +
> +  - ``component``: ASoC component to add the jack
> +  - ``jack``: jack component to populate
> +
> +**snd_soc_usb_setup_offload_jack()** is a helper to add a sound jack control to
> +the platform sound card.  This will allow for consistent naming to be used on
> +designs that support USB audio offloading.
> +
> +Returns 0 on success, negative otherwise.
> +
> +.. code-block:: rst
> +
> +	int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
> +..
> +
> +  - ``component``: ASoC component to disable the jack
> +
> +**snd_soc_usb_disable_offload_jack()** is a helper to disable a sound jack control
> +on the platform sound card.

is disable_offload_jack() the companion operation to setup_offload_jack()?

it's not clear to me if there's any relationship between the two.

> +
> +Returns 0 on success, negative otherwise.
> +
> +.. code-block:: rst
> +
> +	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +					     int direction, long *route)
> +..
> +
> +  - ``dev``: USB device to look up offload path mapping
> +  - ``card``: USB sound card index
> +  - ``pcm``: USB sound PCM device index
> +  - ``direction``: direction to fetch offload routing information
> +  - ``route``: mapping of sound card and pcm indexes for the offload path.  This is
> +	       an array of two integers that will carry the card and pcm device indexes
> +	       in that specific order.  This can be used as the array for the kcontrol
> +	       output.
> +
> +**snd_soc_usb_update_offload_route()** calls a registered callback to the USB BE DAI
> +link to fetch the information about the mapped ASoC devices for executing USB audio
> +offload for the device. ``route`` may be a pointer to a kcontrol value output array,
> +which carries values when the kcontrol is read.
> +
> +Returns 0 on success, negative otherwise.

please clarify what happens if there is no offloaded device for a
specific USB card. from [2] below it looks like the intended behavior
for a device without offload capabilities would be to return 0 but the
mapping would use the -1 magic value to state there is no offload?


> +**snd_soc_usb_free_port()** frees a SOC USB device.
> +
> +.. code-block:: rst
> +
> +	void snd_soc_usb_add_port(struct snd_soc_usb *usb);
> +..
> +
> +  - ``usb``: SOC USB device to add
> +
> +**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
> +Once added, this device can be referenced by further operations.
> +
> +.. code-block:: rst
> +
> +	void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
> +..
> +
> +  - ``usb``: SOC USB device to remove
> +
> +**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
> +After removing a device, any SOC USB operations would not be able to reference the
> +device removed.

I don't think the last sentence is correct, below [1] you show an
example where the free_port() routine is required...


> +
> +	static void q6usb_component_remove(struct snd_soc_component *component)
> +	{
> +		...

[1]

> +		snd_soc_usb_remove_port(data->usb);
> +		snd_soc_usb_free_port(data->usb);
> +	}
> +
> +	static const struct snd_soc_component_driver q6usb_dai_component = {
> +		.probe = q6usb_component_probe,
> +		.remove = q6usb_component_remove,
> +		.name = "q6usb-dai-component",
> +		...
> +	};
> +..
> +
> +BE DAI links can pass along vendor specific information as part of the
> +call to allocate the SOC USB device.  This will allow any BE DAI link
> +parameters or settings to be accessed by the USB offload driver that
> +resides in USB SND.
> +
> +USB Audio Device Connection Flow
> +--------------------------------
> +USB devices can be hotplugged into the USB ports at any point in time.
> +The BE DAI link should be aware of the current state of the physical USB
> +port, i.e. if there are any USB devices with audio interface(s) connected.
> +connection_status_cb() can be used to notify the BE DAI link of any change.
> +
> +This is called whenever there is a USB SND interface bind or remove event,
> +using snd_soc_usb_connect() or snd_soc_usb_disconnect():
> +
> +.. code-block:: rst
> +
> +	static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
> +	{
> +		...
> +		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
> +		...
> +	}
> +
> +	static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
> +	{
> +		...
> +		snd_soc_usb_disconnect(usb_get_usb_backend(chip->dev), dev->sdev);
> +		...
> +	}
> +..
> +
> +In order to account for conditions where driver or device existence is
> +not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
> +connect events for any identified USB audio interfaces.  Consider the
> +the following situation:
> +
> +	**usb_audio_probe()**
> +	  | --> USB audio streams allocated and saved to usb_chip[]
> +	  | --> Propagate connect event to USB offload driver in USB SND
> +	  | --> **snd_soc_usb_connect()** exits as USB BE DAI link is not ready
> +
> +	BE DAI link component probe
> +	  | --> DAI link is probed and SOC USB port is allocated
> +	  | --> The USB audio device connect event is missed
> +
> +To ensure connection events are not missed, **snd_usb_rediscover_devices()**
> +is executed when the SOC USB device is registered.  Now, when the BE DAI
> +link component probe occurs, the following highlights the sequence:
> +
> +	BE DAI link component probe
> +	  | --> DAI link is probed and SOC USB port is allocated
> +	  | --> SOC USB device added, and **snd_usb_rediscover_devices()** runs
> +
> +	**snd_usb_rediscover_devices()**
> +	  | --> Traverses through usb_chip[] and for non-NULL entries issue
> +	  |     **connection_status_cb()**
> +
> +In the case where the USB offload driver is unbound, while USB SND is ready,
> +the **snd_usb_rediscover_devices()** is called during module init.  This allows
> +for the offloading path to also be enabled with the following flow:
> +
> +	**usb_audio_probe()**
> +	  | --> USB audio streams allocated and saved to usb_chip[]
> +	  | --> Propagate connect event to USB offload driver in USB SND
> +	  | --> USB offload driver **NOT** ready!
> +
> +	BE DAI link component probe
> +	  | --> DAI link is probed and SOC USB port is allocated
> +	  | --> No USB connect event due to missing USB offload driver
> +
> +	USB offload driver probe
> +	  | --> **qc_usb_audio_offload_init()**
> +	  | --> Calls **snd_usb_rediscover_devices()** to notify of devices
> +
> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.
> +
> +Implementation
> +--------------
> +
> +**Example:**
> +
> +  **Sound Cards**:
> +
> +	::
> +
> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
> +						Plantronics Plantronics Blackwire
> +						3225 Seri at usb-xhci-hcd.1.auto-1.1,
> +						full sp
> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +  **USB Sound Card** - card#2:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> +
> +The above example shows a scenario where the system has one ASoC platform card
> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
> +the available kcontrols for each USB audio device, the following kcontrol lists
> +the mapped offload path for the specific device:
> +
> +	``USB Offload Playback Route#*``
> +
> +The kcontrol is indexed, because a USB audio device could potentially have
> +several PCM devices.  The above kcontrols are defined as:
> +
> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
> +    card and PCM device index.  The output **"0, 1"** (card index, PCM device index)
> +    signifies that there is an available offload path for the USB SND device
> +    through card#0 - PCM device#1.  If **"-1, -1"** is seen, then no offload path is
> +    available for the USB SND device.

[2]

maybe I got this wrong but you may want to clarify that the kcontrol is
always created, but the values indicate if the offload support is real
or not?


> +
> +USB Offload Playback Route Kcontrol
> +-----------------------------------
> +In order to allow for vendor specific implementations on audio offloading device
> +selection, the SOC USB layer exposes the following:
> +
> +.. code-block:: rst
> +
> +	int (*update_offload_route_info)(struct snd_soc_component *component,
> +				int card, int pcm, long *route);
> +..
> +
> +These are specific for the **USB Offload Playback Route PCM#** kcontrol.
> +
> +When users issue get calls to the kcontrol, the registered SOC USB callbacks will
> +execute the registered function calls to the DPCM BE DAI link.
> +
> +**Callback Registration:**
> +
> +.. code-block:: rst
> +
> +	static int q6usb_component_probe(struct snd_soc_component *component)
> +	{
> +	...
> +	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
> +	if (IS_ERR(usb))
> +		return -ENOMEM;
> +
> +	usb->connection_status_cb = q6usb_alsa_connection_cb;
> +	usb->update_offload_route_info = q6usb_get_offload_dev;
> +
> +	ret = snd_soc_usb_add_port(usb);
> +..
> +
> +Existing USB Sound Kcontrol
> +---------------------------
> +With the introduction of USB offload support, the above USB offload kcontrol
> +can be added to the pre existing list of kcontrols identified by the USB sound

is this 'can be added' or 'will be added'? The latter seems more correct
to me, I don't see anything optional or conditional in the description
and the example below.

> +framework.  These kcontrols are still the main controls that are used to
> +modify characteristics pertaining to the USB audio device.
> +
> +	::
> +
> +	  Number of controls: 9
> +	  ctl     type    num     name                                    value
> +	  0       INT     2       Capture Channel Map                     0, 0 (range 0->36)
> +	  1       INT     2       Playback Channel Map                    0, 0 (range 0->36)
> +	  2       BOOL    1       Headset Capture Switch                  On
> +	  3       INT     1       Headset Capture Volume                  10 (range 0->13)
> +	  4       BOOL    1       Sidetone Playback Switch                On
> +	  5       INT     1       Sidetone Playback Volume                4096 (range 0->8192)
> +	  6       BOOL    1       Headset Playback Switch                 On
> +	  7       INT     2       Headset Playback Volume                 20, 20 (range 0->24)
> +	  8       INT     2       USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +Since USB audio device controls are handled over the USB control endpoint, use the
> +existing mechanisms present in the USB mixer to set parameters, such as volume.

