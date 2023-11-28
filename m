Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CFA7FB544
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:11:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D89847;
	Tue, 28 Nov 2023 10:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D89847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701162662;
	bh=HOzKkVTVh7JXfq8gy4qmefZpLCg2u46Kmb5aWdRTHCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N6HFNfnd2p+I/Y4HQWJCvqR4AZMXZqA4+RJ5POQ3LxKPV7vkdaZw6ngj6b2YyLrCb
	 3OtNdfKNvHfosaFe5reDbvn4szHTug0FGZ7WxesIjIyg3VUiym+yDHkoy3zX6gJpKZ
	 0YLpQjlybqwIz5N48uGlcr/ykm8MbJhX2LOB59YM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE3A1F80580; Tue, 28 Nov 2023 10:10:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB72F80568;
	Tue, 28 Nov 2023 10:10:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1448CF8016E; Tue, 28 Nov 2023 10:10:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C4C3F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C4C3F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y8gTU7XD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701162620; x=1732698620;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HOzKkVTVh7JXfq8gy4qmefZpLCg2u46Kmb5aWdRTHCk=;
  b=Y8gTU7XD1dF3VF4PPtxdP+4DGEVrR+Dw8dhbXnhtG0dxrHwhlGD/69Sz
   NzEXp+p78Mg56h8oGIXZABy7EEgn6/TOH3DIngF6F/JK/3zo+bdJ8mMNT
   EEl/4MtNtFPYtdmBAmbXSUGEfB+xbL4V2ahdv21ZPya4Smb3Bad02w5er
   gKkiTBvSvrNaOGSWXGb/RnGZeEMSvUKH3jM5b9aP6XM4x5eFjvlkgvKAC
   qPHySW2c9vNwtET80ZCC4dQY3R42AW3VMH+ng3sgBusivnAkqulffiXKy
   oh5InbEA6RJibZBVcMj+2qKFQ/NkcWsXuCGotRNT81EIiabSDILEF2XUH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="396788269"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="396788269"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:10:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="802914383"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="802914383"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103])
 ([10.251.221.103])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:10:13 -0800
Message-ID: <be4c418d-5147-4d4b-aa9b-a8e6f3c10a30@linux.intel.com>
Date: Tue, 28 Nov 2023 11:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
 <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
 <87jzq3pc6r.wl-tiwai@suse.de>
 <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
 <87cyvvp8t6.wl-tiwai@suse.de>
 <8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
 <878r6jp6jd.wl-tiwai@suse.de>
 <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
 <875y1np5g2.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <875y1np5g2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PQCCR3BUPUBXSJVUWCIUO26MO76MREAJ
X-Message-ID-Hash: PQCCR3BUPUBXSJVUWCIUO26MO76MREAJ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQCCR3BUPUBXSJVUWCIUO26MO76MREAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/11/2023 17:43, Takashi Iwai wrote:
> On Mon, 27 Nov 2023 16:40:57 +0100,
>>> --- a/include/sound/hdaudio.h
>>> +++ b/include/sound/hdaudio.h
>>> @@ -95,6 +95,7 @@ struct hdac_device {
>>>  	bool lazy_cache:1;	/* don't wake up for writes */
>>>  	bool caps_overwriting:1; /* caps overwrite being in process */
>>>  	bool cache_coef:1;	/* cache COEF read/write too */
>>> +	bool is_hdmi:1;		/* a HDMI/DP codec */
>>>  	unsigned int registered:1; /* codec was registered */
>>>  };
>>>  
>>> --- a/sound/pci/hda/patch_hdmi.c
>>> +++ b/sound/pci/hda/patch_hdmi.c
>>> @@ -2597,6 +2597,7 @@ static int patch_generic_hdmi(struct hda_codec *codec)
>>>  	}
>>>  
>>>  	generic_hdmi_init_per_pins(codec);
>>> +	codec->core.is_hdmi = true;
>>>  	return 0;
>>>  }
>>>  
>>> @@ -3472,6 +3473,7 @@ static int patch_simple_hdmi(struct hda_codec *codec,
>>>  	spec->pcm_playback = simple_pcm_playback;
>>>  
>>>  	codec->patch_ops = simple_hdmi_patch_ops;
>>> +	codec->core.is_hdmi = true;
>>>  
>>>  	return 0;
>>>  }
>>
>> I see,  so this is what I was not sure how to do ;)
>> I will rework the series and resend tomorrow.
>>
>> Thanks for the code snippet, I will make you as author of it, if it is
>> OK for you.
> 
> Sure, no problem.

The flag does not work with SOF stack which uses the hdac_hda codec driver:

patch_generic_hdmi() and patch_simple_hdmi() is not entered at all, so
the flag is not set.

The codec driver have is_hdmi_codec() helper to check the struct
hda_pcm.pcm_type, but that is not set early enough either.

The is HDMI or not needs to be known in hdac_hda_dev_probe(), I think
this was one of the reason I have opted to have the exported function.
We just don't have other information at the dev probe time.

# dmesg | grep peter
[    3.810841] [peter] hdac_hda_dev_probe: is_hdmi_codec(): 0
[    3.810846] [peter] hdac_hda_dev_probe: hdev->is_hdmi: 0
[    3.810848] [peter] hdac_hda_dev_probe: snd_hda_device_is_hdmi(): 0
...
[    3.814497] [peter] hdac_hda_dev_probe: is_hdmi_codec(): 0
[    3.814499] [peter] hdac_hda_dev_probe: hdev->is_hdmi: 0
[    3.814500] [peter] hdac_hda_dev_probe: snd_hda_device_is_hdmi(): 1
...
[    3.986610] [peter] generic_hdmi_build_pcms: ENTER
[    3.986627] [peter] hdac_hda_codec_probe: is_hdmi_codec(): 1
...
[    3.996383] [peter] snd_hda_parse_pin_defcfg: ENTER
[    4.001562] [peter] hdac_hda_codec_probe: is_hdmi_codec(): 0

-- 
Péter
