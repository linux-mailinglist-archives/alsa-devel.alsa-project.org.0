Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C579232B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 15:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1E583A;
	Tue,  5 Sep 2023 15:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1E583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693922051;
	bh=GGTb85SwmehwRQFdOE4/kZdtjUSb36Ogu5VpLNfqXYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DIVmZIipUqVWjFXsbIAr6RXDV+Kqb+sazD0UL9rGfwICfUBqhvTbyElRN3aIbgYBu
	 nuY75muMPUQCu1uQjD8Gbc0q79gM+cZ2uju5YNpulhLBJKGKONfoTpRNW0WF+LeMCX
	 r5k+fG2RCYLgwcgvPn4p81tf+wg5/x0yYVy2nG9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70FCDF80551; Tue,  5 Sep 2023 15:53:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06674F8047D;
	Tue,  5 Sep 2023 15:53:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D703F804F3; Tue,  5 Sep 2023 15:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E7D2F800F5;
	Tue,  5 Sep 2023 15:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E7D2F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WYXPihN+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693921971; x=1725457971;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GGTb85SwmehwRQFdOE4/kZdtjUSb36Ogu5VpLNfqXYs=;
  b=WYXPihN+bZnq79Dmm14Y2nzKTEbcATN6DPY8RZ7vbdDQzzpuiCd7cJM9
   7NCHDt1Hv5W1B3SLq3ozRPhNvvUVJthomrAOXRX5yBaiXQC01dVxNi1w/
   lUKe9SyksPMsX0/1IBXNvAAqTo1Lr6YCJPwRWVZ71WkGXsgDZ4O2JEH2I
   upAwrPumPglv8HuTUzrRGbZZJoExWoCL0z76OZl7KqsM/ma0/euAiJfR7
   oZ2gdD4KvATTQ7okYoFNJVFWE0j5Z8F9bns4z1MU1Y0NcPvs6avmhdYSA
   FucNS/DVca4Yuq4wh8iubgmeP9+BSGbSkGPmcTH8JPNoCNFGXky+RoapM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="463165896"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="463165896"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="741100793"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="741100793"
Received: from qatran-mobl2.amr.corp.intel.com (HELO [10.212.36.84])
 ([10.212.36.84])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:52:41 -0700
Message-ID: <4d84a799-c07e-e917-7c82-2f24456e3ac2@linux.intel.com>
Date: Tue, 5 Sep 2023 08:37:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2309011509200.3532114@eliteleevi.tm.intel.com>
 <4252a4dc-0cf3-4ff2-aa55-c03e56345276@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4252a4dc-0cf3-4ff2-aa55-c03e56345276@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JCPIF64GPBP6NCLYXP42WFEBQ2Q3PZFU
X-Message-ID-Hash: JCPIF64GPBP6NCLYXP42WFEBQ2Q3PZFU
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCPIF64GPBP6NCLYXP42WFEBQ2Q3PZFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/1/23 08:44, Péter Ujfalusi wrote:
> 
> 
> On 01/09/2023 15:15, Kai Vehmanen wrote:
>> Hi,
>>
>> On Wed, 30 Aug 2023, Maarten Lankhorst wrote:
>>
>>> With the upcoming changes for i915/Xe driver relying on the
>>> -EPROBE_DEFER mechanism, we need to have a first pass of the probe
>>> which cannot be pushed to a workqueue. Introduce 2 new optional
>>> callbacks.
>> [...]
>>> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
>>> index 30db685cc5f4b..54c384a5d6140 100644
>>> --- a/sound/soc/sof/core.c
>>> +++ b/sound/soc/sof/core.c
>>> @@ -327,8 +327,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>>>  dsp_err:
>>>  	snd_sof_remove(sdev);
>>>  probe_err:
>>> -	sof_ops_free(sdev);
>>> -
>>
>> this seems a bit out-of-place in this patch. It seems a valid change,
>> but not really related to this patch, right?
> 
> The ops needs to be preserved even if the wq fails since the patch wants
> to call snd_sof_remove_no_wq() unconditionally on remove.
> 
>> We seem to have a related fix waiting to be sent to alsa-devel, by
>> Peter:
>> "ASoC: SOF: core: Only call sof_ops_free() on remove if the probe wa"
>> https://github.com/thesofproject/linux/pull/4515
> 
> I guess we can revert that in sof-dev, if this is the preferred way?
> 
>> ... not yet in Mark's tree.
>>
>> Otherwise patch looks good to me.
> 
> I would have not created the snd_sof_remove_no_wq() as it makes not much
> functional sense.
> It might be even better if the remove in the wq would do the
> hda_codec_i915_exit() as the module will remain in there until the user
> removes it.

I think find all this very confusing, because there is no workqueue used
in the remove steps. The workqueue is only used ONCE during the probe.
