Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9D79D326
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 16:05:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CD5846;
	Tue, 12 Sep 2023 16:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CD5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694527509;
	bh=3dBjDgmrBFP08nM0ajOk8xWfobfDAyFlhnxcBaswFg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z2nmD9GucWy+MVey4t/bvZyF9b7ogAXkQIHl7WNriC3d22CD46aVt1HTvmVI4Ibsf
	 FheXET86MYKi0iozDW7E+h/nuJ8BPgPJh9ulmGurNUIbUXkmy4/kRnib+AgsOfLbaY
	 2zQqTCk6Cw9WA+kij4pXVo8ThM47lMTXgKe9uDS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B787FF8007C; Tue, 12 Sep 2023 16:04:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C95AF80246;
	Tue, 12 Sep 2023 16:04:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00429F80425; Tue, 12 Sep 2023 16:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51B4AF800AA;
	Tue, 12 Sep 2023 16:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B4AF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Atk5cd+g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694527448; x=1726063448;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3dBjDgmrBFP08nM0ajOk8xWfobfDAyFlhnxcBaswFg0=;
  b=Atk5cd+gnrxBnIaywKgq+uGDjCDHLMuw9Vs3whvbgg8Fwma/H4Q/5vsX
   fFT1XkF/m6NWE0R6itJMogehHBHhbAVQ4aRabLqXZahwHP8sKAAly13U4
   HSUmA+m5MIMM9FAeMTjfMsEhK+7wypDjeAolUIfkZZaFdM9lh+T71l+qQ
   Yio4ZDp3FmqV9nfqECV1wy9xlRICPYlkDOlJS+Yeu4R/h3XoyxrQ8ovvK
   Y/bJ27YBdsx/sGBPyfrfk/8qliCEeeReCZaiKnaqmKfInvWzmPI3pSIw7
   Ov+5vgERYnYWSBODGVybce8Mntge61kU9xSXinvEwFRjHskmi8T8IUasH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464753230"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="464753230"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917443074"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="917443074"
Received: from skotini-mobl.amr.corp.intel.com (HELO [10.209.169.137])
 ([10.209.169.137])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:02:05 -0700
Message-ID: <defa5f61-c4f2-aeb6-da23-a39539ec64fc@linux.intel.com>
Date: Tue, 12 Sep 2023 10:02:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
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
 <4d84a799-c07e-e917-7c82-2f24456e3ac2@linux.intel.com>
 <6d39eac7-06c7-45f0-0318-72be1753641f@linux.intel.com>
 <e8880daf-8f74-4350-96c4-d625272aed35@linux.intel.com>
 <34d34e99-c6a3-2d08-2c4b-c548b6b87e9a@linux.intel.com>
 <b878b564-8c18-4103-88d6-4f7b5fe01dba@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b878b564-8c18-4103-88d6-4f7b5fe01dba@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6OTCY24JXPASWFIFSEGMJXYDVBRPHYW4
X-Message-ID-Hash: 6OTCY24JXPASWFIFSEGMJXYDVBRPHYW4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OTCY24JXPASWFIFSEGMJXYDVBRPHYW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/12/23 02:10, Péter Ujfalusi wrote:
> 
> 
> On 12/09/2023 03:25, Pierre-Louis Bossart wrote:
>>
>>
>>> What we have atm:
>>> snd_sof_probe - might be called from wq
>>> snd_sof_remove - might be called from wq (cleans up the snd_sof_probe
>>> 		 step)
>>
>> I don't think it's correct, snd_sof_remove cannot be called from a wq.
>> The device core knows nothing about workqueues.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sof/core.c#n328
> 
> it is called on the error path of sof_probe_continue(), which can be run
> in a workque.
> 
>>> We want a callbacks for hardware/device probing, right, split the
>>> snd_sof_probe (and remove) to be able to support a sane level of
>>> deferred probing support.
>>>
>>> With that in mind:
>>> snd_sof_device_probe - Not called from wq (to handle deferred probing)
>>> snd_sof_probe - might be called from wq
>>>
>>> snd_sof_remove - might be called from wq (cleans up the snd_sof_probe
>>> 		 step)
>>> snd_sof_device_remove - Not called from wq (to up the
>>> 			snd_sof_device_probe step)
>>>
>>> Naming option: s/device/hardware
>>
>> I like the 'device' hint since it's directly related to the device (or
>> subsystem) callbacks.
>>
>>> However, I think the snd_sof_device_remove itself is redundant and we
>>> might not need it at all as in case we have wq and there is a failure in
>>> there we do want to release resources as much as possible. The module
>>> will be kept loaded (no deferred handling in wq) and that might block
>>> PM, other devices to behave correctly. Iow, if the wq has failure we
>>> should do a cleanup to the best effort to reach a level like the driver
>>> is not even loaded.
>>
>> If we have a failure in a workqueue used for probe, then we have to
>> clean-up everything since nothing in the device core will do so for us.
> 
> Yes, this makes the snd_sof_device_remove() redundant or at least the
> definition of it is no longer a mirror of snd_sof_device_probe():
> 
> snd_sof_device_remove - might be called from wq (cleans up the
> 			snd_sof_device_probe step)
> 
> Any failure in sof_probe_continue() should execute the
> snd_sof_device_remove(), snd_sof_remove() is only involved after the
> snd_sof_probe() have returned with success.
> 
> I think this makes actually makes sense and it is well defined.
> On module remove we need to take into account the case when we have
> failed in wq similarly as we do currently (the resources have been freed
> up already).

Agree, I stand corrected, thanks Peter.

