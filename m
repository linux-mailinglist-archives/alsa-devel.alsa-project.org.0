Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E27BE5CF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 18:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85DE914CC;
	Mon,  9 Oct 2023 18:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85DE914CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867428;
	bh=Ey3XBOcNaPEGg9atuzfryV6OFS88AnMowraWktvyqqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=loCI25oZB3T0wUxgkaOKdRgbxM8VW969GbJxWogESyWDnIY4INxYR9qPz5ujg0mm2
	 3pH1GS46kocH34OUIDpREUL4KWGAErwvJ/EKueE13wSRJNgDnQeGilGN3XZ/CIgehI
	 zvtwNj5AYYqvc3SUNy1QDqGXPyHpD6NGzLX2iDg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C27FFF8065C; Mon,  9 Oct 2023 17:58:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF53F8065B;
	Mon,  9 Oct 2023 17:58:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 157A0F802BE; Mon,  9 Oct 2023 13:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F53EF80130;
	Mon,  9 Oct 2023 13:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F53EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XhgUyAES
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696852605; x=1728388605;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ey3XBOcNaPEGg9atuzfryV6OFS88AnMowraWktvyqqM=;
  b=XhgUyAESsMPrudVz3xLhMYfAC4aegUwAqrENAm/pzS4ijEbn2210jU1L
   1k5OIOGqiEIAoGS7nmJdQCCGQ4t+STh+xPxQ4zjhWqdQqp0da2dFjeVja
   ODX7gyWc8OofAZ0N14A7t4XTaJS9/w5FIBBI/IbIPbDIekyXgQO07Q+yA
   dyBO+9J8hOs6SgrhaT3ZQdJ/q5AJwxqKLDuCxkWoILhclbs3LCJ9hpNTa
   UNdM1a6Hk3y/Qhia3UfooymZ9jqGAhWxm791BJFx3DtiZBqgaVmqDjJUb
   bnC6gOUZyoWZSQ2UYj2B5ijRR+k/iuaWjb2OOumzml62CHobFBck9nFdT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="364417632"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200";
   d="scan'208";a="364417632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 04:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="782463584"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200";
   d="scan'208";a="782463584"
Received: from swoop-mobl.amr.corp.intel.com (HELO [10.249.36.226])
 ([10.249.36.226])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 04:56:35 -0700
Message-ID: <697abd63-3ed9-116e-a719-b9de74e6a8d8@linux.intel.com>
Date: Mon, 9 Oct 2023 13:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 11/12] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
To: Takashi Iwai <tiwai@suse.de>, Maarten Lankhorst <dev@lankhorst.se>
Cc: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Alsa-devel <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>,
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
 <b4a010aa-b547-42ad-844f-849f287abd54@linux.intel.com>
 <ee92964c-c277-a258-5081-cf0a19ccff79@lankhorst.se>
 <87jzrwtiuk.wl-tiwai@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87jzrwtiuk.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OYCT6BLEFPASIQPG42TPACSNYQU445W6
X-Message-ID-Hash: OYCT6BLEFPASIQPG42TPACSNYQU445W6
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYCT6BLEFPASIQPG42TPACSNYQU445W6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

On 2023-10-09 08:23, Takashi Iwai wrote:
> On Thu, 05 Oct 2023 13:26:18 +0200,
> Maarten Lankhorst wrote:
>>
>>
>>
>> On 2023-10-05 12:58, Péter Ujfalusi wrote:
>>>
>>>
>>> On 04/10/2023 19:59, Kai Vehmanen wrote:
>>>> Hi,
>>>>
>>>> I'm good with rest of the series, but one patch requires work.
>>>>
>>>> On Wed, 4 Oct 2023, Maarten Lankhorst wrote:
>>>>
>>>>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>>>>> the snd_hdac_i915_init into a workqueue.
>>>>>
>>>>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>>>>> probe function.
>>>>>
>>>>> The previously added probe_early can be used for this,
>>>>> and we also use the newly added remove_late for unbinding afterwards.
>>>> [...]
>>>>> --- a/sound/soc/sof/intel/hda-common-ops.c
>>>>> +++ b/sound/soc/sof/intel/hda-common-ops.c
>>>>> @@ -19,6 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
>>>>>    	.probe_early	= hda_dsp_probe_early,
>>>>>    	.probe		= hda_dsp_probe,
>>>>>    	.remove		= hda_dsp_remove,
>>>>> +	.remove_late	= hda_dsp_remove_late,
>>>>>      	/* Register IO uses direct mmio */
>>>>>    diff --git a/sound/soc/sof/intel/hda.c
>>>>> b/sound/soc/sof/intel/hda.c
>>>>> index 86a2571488bc..4eb7f04b8ae1 100644
>>>>> --- a/sound/soc/sof/intel/hda.c
>>>>> +++ b/sound/soc/sof/intel/hda.c
>>>>> @@ -1160,6 +1160,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
>>>>>    		return -ENOMEM;
>>>>>    	sdev->pdata->hw_pdata = hdev;
>>>>>    	hdev->desc = chip;
>>>>> +	ret = hda_init(sdev);
>>>>>      err:
>>>>>    	return ret;
>>>>
>>>> I don't think this works. The hda_codec_i915_init() errors are ignored in
>>>> hda_init() so this never returns -EPROBE_DEFER.
>>>>
>>>> So something like this is needed on top (tested quickly on one SOF
>>>> machine and this blocks SOF load until i915 or xe driver is loaded):
>>>>
>>>> --cut--
>>>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>>>> index 9025bfaf6a7e..8b17c82dcc89 100644
>>>> --- a/sound/soc/sof/intel/hda.c
>>>> +++ b/sound/soc/sof/intel/hda.c
>>>> @@ -863,13 +863,20 @@ static int hda_init(struct snd_sof_dev *sdev)
>>>>           /* init i915 and HDMI codecs */
>>>>           ret = hda_codec_i915_init(sdev);
>>>>           if (ret < 0)
>>>> -               dev_warn(sdev->dev, "init of i915 and HDMI codec
>>>> failed\n");
>>>> +               dev_warn(sdev->dev, "init of i915 and HDMI codec failed
>>>> (%d)\n", ret);
>>>
>>> we should not print anything or maximum dev_dbg in case of EPROBE_DEFER.
>> There's dev_err_probe, which is dev_err on error, or sets the reason
>> for deferred probe to the arguments if the error is -EPROBE_DEFER.
> 
> I expect you'll respin v7 for addressing this?
> 
> I'd love to merge the series for 6.7, and the time ticks...
Done, added the error handling early in the series as a bugfix.

Cheers,
~Maarten
