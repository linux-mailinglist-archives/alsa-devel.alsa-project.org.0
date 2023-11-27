Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B87FA512
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA52EAF;
	Mon, 27 Nov 2023 16:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA52EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099835;
	bh=0rhUFKvAImg0DoQpIyV/pgM58toMDdCrae+OOckfr6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jp/7HjE2axtQ3lXT1fUmRYLcF7NBPrNYoCiDr3bsIWKYSRCMAcYDtqnYsdoOBlZSW
	 siplwom+BTackvR+yme+0tPjZIrt7lxOe3KlwHznGLD5yAv15mFLFZp6NPlT31wHpr
	 jQdS/3ooMHXcyfPDw3im0OtuF5JVaAY/aSJ/pEHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65E9F805AB; Mon, 27 Nov 2023 16:40:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8748F80104;
	Mon, 27 Nov 2023 16:40:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E0CF80246; Mon, 27 Nov 2023 16:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 845C1F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 845C1F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gZmraV8Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099628; x=1732635628;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0rhUFKvAImg0DoQpIyV/pgM58toMDdCrae+OOckfr6U=;
  b=gZmraV8Qc4JP7XsG//4BFLtau2rncCPR3e0rucXBKX4C5Jq8T4dQo5jv
   qpkfag+k+KKXwsx2qj23bPHson7xGi3itgJvxYO7gReCMNmo1MNyQPviz
   EfzhEYDqpbMwK4z+2BkQK3yOK02ejmc1cHPtmPWm33c11Z4Zw70uk7LLB
   dsTSXbkdGOhYQ503bgNl6Q0hqILGA88/niuE3qTqNoIPtVmrKIdc8A9hF
   KFIxVDnWjgrs2GYJmuUZXrUch9GTN9F7XwsU8/G2i7Se/888JRDOrwtqH
   w+ZQ62S5tyZpZRVgUBbkZlZe+cS7KzYFENlEQ4V+U5iPDgERRMBAKH9VF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372897430"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372897430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="16322740"
Received: from acornagl-mobl.ger.corp.intel.com (HELO [10.252.58.144])
 ([10.252.58.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:40:23 -0800
Message-ID: <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
Date: Mon, 27 Nov 2023 17:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
Content-Language: en-US
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
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <878r6jp6jd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VVX2O5SO3XLK45PFEP2BUGMGZDEJ3UDR
X-Message-ID-Hash: VVX2O5SO3XLK45PFEP2BUGMGZDEJ3UDR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVX2O5SO3XLK45PFEP2BUGMGZDEJ3UDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/11/2023 17:20, Takashi Iwai wrote:
> On Mon, 27 Nov 2023 15:45:54 +0100,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 27/11/2023 16:31, Takashi Iwai wrote:
>>> On Mon, 27 Nov 2023 15:12:51 +0100,
>>> Péter Ujfalusi wrote:
>>>>
>>>>
>>>>
>>>> On 27/11/2023 15:18, Takashi Iwai wrote:
>>>>>> +bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>>>>>> +{
>>>>>> +	int i;
>>>>>> +
>>>>>> +	for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
>>>>>> +		if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
>>>>>> +			return true;
>>>>>> +	}
>>>>>> +
>>>>>> +	return false;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
>>>>>
>>>>> I'm afraid that this will bring unnecessary dependency on HDMI codec
>>>>> driver.
>>>>
>>>> For HDMI support we anyways need HDMI code?
>>>
>>> But the ASoC hdac-hda driver isn't specifically bound with HDMI, I
>>> thought?
>>>
>>> With your patch, now it becomes a hard-dependency.  It'll be even
>>> build failure when HDMI codec driver isn't enabled in Kconfig.
>>
>> The change in hdaudio.h handles the config dependency, if
>> CONFIG_SND_HDA_CODEC_HDMI is not enabled in Kconfig then
>> snd_hda_device_is_hdmi() will return false.
> 
> OK, that's at least good.
> But I still find it not ideal to bring the hard dependency there
> unnecessarily.
> 
> With the introduction of a flag in hdac_device, the necessary change
> would be even smaller like below.
> 
> 
> Takashi
> 
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -95,6 +95,7 @@ struct hdac_device {
>  	bool lazy_cache:1;	/* don't wake up for writes */
>  	bool caps_overwriting:1; /* caps overwrite being in process */
>  	bool cache_coef:1;	/* cache COEF read/write too */
> +	bool is_hdmi:1;		/* a HDMI/DP codec */
>  	unsigned int registered:1; /* codec was registered */
>  };
>  
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -2597,6 +2597,7 @@ static int patch_generic_hdmi(struct hda_codec *codec)
>  	}
>  
>  	generic_hdmi_init_per_pins(codec);
> +	codec->core.is_hdmi = true;
>  	return 0;
>  }
>  
> @@ -3472,6 +3473,7 @@ static int patch_simple_hdmi(struct hda_codec *codec,
>  	spec->pcm_playback = simple_pcm_playback;
>  
>  	codec->patch_ops = simple_hdmi_patch_ops;
> +	codec->core.is_hdmi = true;
>  
>  	return 0;
>  }

I see,  so this is what I was not sure how to do ;)
I will rework the series and resend tomorrow.

Thanks for the code snippet, I will make you as author of it, if it is
OK for you.

-- 
Péter
