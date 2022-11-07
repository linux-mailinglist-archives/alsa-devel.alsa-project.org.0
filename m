Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B461F530
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 15:17:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28E03823;
	Mon,  7 Nov 2022 15:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28E03823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667830629;
	bh=DcDGcsM+G7CglgtzRKzAYxIrebBljZJiiO20FyXWofg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hx1YAkT1OFalfNoNN4+G64Z3f3MCw6mm1aeqHXTWWh14CIQctzizxNtVbSD1Dujf8
	 xjuYLP0kGTS4ekdripbSb1ZlZXgrpD/9j+enm4rQDBbsP8DAUC4vJMq0FRkux57pdS
	 /Y2W8HYmuawKUmZePTdOUxgHl5iwSZ9ewMoZrqCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCBEF804C1;
	Mon,  7 Nov 2022 15:16:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC871F80116; Mon,  7 Nov 2022 15:16:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CAC7F80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 15:16:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CAC7F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e4TgeECW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667830568; x=1699366568;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DcDGcsM+G7CglgtzRKzAYxIrebBljZJiiO20FyXWofg=;
 b=e4TgeECWEq+jRMgf8zJzlOb3C1Rykod945nwhEg+FfUwRlMdbF8/4OJR
 11j5U7R+ea8MFp2PJ1SX+YFukrVvCpzSOUAeH6CUTqQuWMrBk9sX8tq0x
 agHiuT2CeqdJ/qaFWAplPA6YZaCx2mc5yh32z0zH0QUdZ7grMuKBigfXt
 cbj1UK89imhP+9x5ZCn5DybiYavzF3uR+/1ea4XIqS3ciNc7yXwW3eEUj
 08FF3fX3mkYKpSI3DzaYE5puRs5ZYVyJQNbQgKNRkuAoDMYgTqSO5Oe/P
 9qbHfNlqVVzdLFyFvI8cF/SYAqXz2DSeyUSX5hUGHjl7unZPNOLlisFHT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374669603"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="374669603"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 06:15:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965162793"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="965162793"
Received: from seanabue-mobl.amr.corp.intel.com (HELO [10.212.82.80])
 ([10.212.82.80])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 06:15:45 -0800
Message-ID: <4d0038fa-ab79-e3dd-44b6-e8b90a836bfe@linux.intel.com>
Date: Mon, 7 Nov 2022 08:11:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] ASoC: component: Propagate result of suspend and
 resume callbacks
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-2-cezary.rojewski@intel.com>
 <b8bd9830-c933-092b-42db-75dd39bcb0c0@linux.intel.com>
 <c6ec7267-df1f-e119-7cbc-0d841085a1c4@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c6ec7267-df1f-e119-7cbc-0d841085a1c4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 11/7/22 02:51, Amadeusz Sławiński wrote:
> On 11/4/2022 3:00 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 11/4/22 09:12, Cezary Rojewski wrote:
>>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>>
>>> Both component->driver->suspend and ->resume() do return an int value
>>> but it isn't propagated to the core later on. Update
>>> snd_soc_component_suspend() and snd_soc_component_resume() so that the
>>> possible errors are not squelched.
>>
>> This looks alright on paper but could break existing solutions.
>> There are a number of cases where an error during suspend is not fatal
>> and you don't want to prevent a system suspend if this is recoverable on
>> resume.
>>
>> See for example the errors on clock-stop for SoundWire, which are
>> squelched on purpose. See also Andy Ross' PR to precisely stop
>> propagating errors in SOF
>> https://github.com/thesofproject/linux/pull/3863
>>
>> Maybe a less intrusive change would be to add a WARN_ON or something
>> visible to make sure solutions are fixed, and only critical issues can
>> prevent suspend? And in a second step the errors are propagated.
>>
> 
> Do note that thread you've pointed out handles device suspend, by which

If by 'that thread' you are referring to PR #3863, then it's an
excellent example of a desire NOT to propage suspend errors and at the
same time an example of a configuration where suspend would not work
without additional changes.

> I mean, it is modification of sof_suspend(), called by
> snd_sof_runtime_suspend() which is then registered as handler in:
> sound/soc/sof/sof-pci-dev.c: SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend,
> snd_sof_runtime_resume,
> sound/soc/sof/sof-acpi-dev.c:
> SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
> sound/soc/sof/sof-of-dev.c: SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend,
> snd_sof_runtime_resume,
> and then taking TGL device for example there is:
> static struct pci_driver snd_sof_pci_intel_tgl_driver = {
>     (...)
>         .driver = {
>                 .pm = &sof_pci_pm,
>         },
> };
> 
> And what this patch set changes is handling of .suspend callback present
> in struct snd_soc_component_driver, which as evidenced by followup
> patches is handled in ASoC core while audio is being suspended.
> As far as I can tell SOF makes no direct use of this callback.
> 
> I'm not negating that maybe there should be a bit of time when only
> warning is emitted, just making sure that we are on the same page, about
> what is being changed.

I don't think there is an impact on SOF indeed.

I was just making the point that well-intended changes to propagate
error status can break platforms. we've had a similar case when trying
to add checks on pm_runtime_get_sync() and saw multiple errors. Adding
more error checks when they were not there from the very beginning is a
difficult thing to achieve without regressions.
