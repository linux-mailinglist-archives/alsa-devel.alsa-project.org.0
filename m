Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F27B9CA3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 12:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43882AE9;
	Thu,  5 Oct 2023 12:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43882AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696503570;
	bh=lpZA39v5SnIRDC7l7LsxZrl19vs2WsIC/6TcqgPdEjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ep8PYfeEEWImHRS7zRI6U4hvkDXQm5O61+DM2edcwAjPRaOiarHciOtmwiL3xbYly
	 KY55hl0V0Bnw3vcR29WMvHoQHIoxeXh27xbzWusosUUwH2DIYWsUbqyuRHmhkPzgpm
	 eU2gUZfgOroyw4/Pro7S81OTqSn8lrr/U/AZnnvk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B66B7F800C1; Thu,  5 Oct 2023 12:58:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E16F80310;
	Thu,  5 Oct 2023 12:58:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 533ECF8047D; Thu,  5 Oct 2023 12:58:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AA33F800C1;
	Thu,  5 Oct 2023 12:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA33F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VRL82jfi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696503508; x=1728039508;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lpZA39v5SnIRDC7l7LsxZrl19vs2WsIC/6TcqgPdEjk=;
  b=VRL82jfiP1E9Y9TJrCYeyqRxrbwWcfaAYfnMCATYIPg89hnpdVWaG/8u
   o5bZgvCH2HpEdd2J07s5lFZk3GB62wnQGusxaYgcS0LnOFzRcyojZYqvn
   7AYOcqn/hluToUchUVoPBhcvg5N301eSTCFdhSDwHLmtMjXbsMyCXnXcR
   XDoHgwdngX0uzpkqEszF7IjjIFnnRtKmw+EWlGlGsvBKpySuGGMg4vMml
   u4eDMB8m2Tn7Xq6EXGrcG+UIkDggS/eNN4I+oLnomrbTN7ZOfS8T8lcdN
   MnkG2ahaRsbmFjSZb3lD769Q4ZbJ5GfKQS8ldfzqIdGEnWQeoT+shz0Ae
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387340124"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200";
   d="scan'208";a="387340124"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 03:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751739054"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200";
   d="scan'208";a="751739054"
Received: from szeseong-mobl.gar.corp.intel.com (HELO [10.251.222.152])
 ([10.251.222.152])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 03:58:16 -0700
Message-ID: <b4a010aa-b547-42ad-844f-849f287abd54@linux.intel.com>
Date: Thu, 5 Oct 2023 13:58:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/12] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 Maarten Lankhorst <dev@lankhorst.se>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
 <20231004145540.32321-12-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2310041953090.3390143@eliteleevi.tm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: 
 <alpine.DEB.2.22.394.2310041953090.3390143@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MJ35HXJDWKPEK5XCZFHHU2NVW3H66H2R
X-Message-ID-Hash: MJ35HXJDWKPEK5XCZFHHU2NVW3H66H2R
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJ35HXJDWKPEK5XCZFHHU2NVW3H66H2R/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 04/10/2023 19:59, Kai Vehmanen wrote:
> Hi,
> 
> I'm good with rest of the series, but one patch requires work.
> 
> On Wed, 4 Oct 2023, Maarten Lankhorst wrote:
> 
>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>> the snd_hdac_i915_init into a workqueue.
>>
>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>> probe function.
>>
>> The previously added probe_early can be used for this,
>> and we also use the newly added remove_late for unbinding afterwards.
> [...]
>> --- a/sound/soc/sof/intel/hda-common-ops.c
>> +++ b/sound/soc/sof/intel/hda-common-ops.c
>> @@ -19,6 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
>>  	.probe_early	= hda_dsp_probe_early,
>>  	.probe		= hda_dsp_probe,
>>  	.remove		= hda_dsp_remove,
>> +	.remove_late	= hda_dsp_remove_late,
>>  
>>  	/* Register IO uses direct mmio */
>>  
>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>> index 86a2571488bc..4eb7f04b8ae1 100644
>> --- a/sound/soc/sof/intel/hda.c
>> +++ b/sound/soc/sof/intel/hda.c
>> @@ -1160,6 +1160,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
>>  		return -ENOMEM;
>>  	sdev->pdata->hw_pdata = hdev;
>>  	hdev->desc = chip;
>> +	ret = hda_init(sdev);
>>  
>>  err:
>>  	return ret;
> 
> I don't think this works. The hda_codec_i915_init() errors are ignored in 
> hda_init() so this never returns -EPROBE_DEFER.
> 
> So something like this is needed on top (tested quickly on one SOF 
> machine and this blocks SOF load until i915 or xe driver is loaded):
> 
> --cut--
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 9025bfaf6a7e..8b17c82dcc89 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -863,13 +863,20 @@ static int hda_init(struct snd_sof_dev *sdev)
>         /* init i915 and HDMI codecs */
>         ret = hda_codec_i915_init(sdev);
>         if (ret < 0)
> -               dev_warn(sdev->dev, "init of i915 and HDMI codec 
> failed\n");
> +               dev_warn(sdev->dev, "init of i915 and HDMI codec failed 
> (%d)\n", ret);

we should not print anything or maximum dev_dbg in case of EPROBE_DEFER.

> +
> +       if (ret < 0 && ret != -ENODEV)
> +               goto out;
>  
>         /* get controller capabilities */
>         ret = hda_dsp_ctrl_get_caps(sdev);
>         if (ret < 0)
>                 dev_err(sdev->dev, "error: get caps error\n");
>  
> +out:
> +       if (ret < 0)
> +               iounmap(sof_to_bus(sdev)->remap_addr);
> +
>         return ret;
>  }
> --cut--
> 
> Br, Kai

-- 
Péter
