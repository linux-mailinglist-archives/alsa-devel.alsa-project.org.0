Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836EE712E7F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 22:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1706B1F6;
	Fri, 26 May 2023 22:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1706B1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685134312;
	bh=u2pUNkS5fZozLOh7rSHqZXHrI4TBQUdlzHCzUXGF1o0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QX7ZL8aDvlW6rugbVflNlTgydtTAl8THFS9lLeULsIZSDCghp5JvjIkXHyItjmd7M
	 1eebCbKX6f9frr+5Sm1lc/MCI1e3OLftJSQUWfKhuGfMotj5MgqdeVUIjYK7N5VDqU
	 fc/jrLLP/Ygjuu+BMSfhFXf6HSGDOGYC0NylpjUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F219F80544; Fri, 26 May 2023 22:51:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B24F8016A;
	Fri, 26 May 2023 22:51:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CAD9F80249; Fri, 26 May 2023 22:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23C13F8001F
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 22:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C13F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dppojxzd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685134254; x=1716670254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u2pUNkS5fZozLOh7rSHqZXHrI4TBQUdlzHCzUXGF1o0=;
  b=dppojxzdC2ahAn1vIVLuuGEyfaWWdmNOHrlVkMeDzy6J2YO+9fVp3+Zr
   arURtftjkoS2T9WfPDqGkfDgocM93m36z77m3kdDgIrarnBJDfOOXM2rl
   Nadb52ENgYdCMsqNVUjREIt66qKVUtoZueejIvD9lz2CFISjEhw21ZACZ
   ZSvS6sDsY5LCdQ3n7PghUVZWUJ8k6XAgXmkR2ezSdMK3SpIknsytqVMrP
   dAzfIYavJQzBIIoFCtZKtmX7fny9UrsxJe/WhmZoZM4cex1b1b0FNMX9b
   6o8QettYb47j4IJFGKRoACwMiT2LCRAHMjskUvKg4O8ZIq78Wd6NoE2Zr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="420061787"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="420061787"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682842266"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="682842266"
Received: from bedriarm-mobl1.amr.corp.intel.com (HELO [10.209.48.113])
 ([10.209.48.113])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:50:50 -0700
Message-ID: <145987ea-0706-9bca-dc75-803a0625a8a2@linux.intel.com>
Date: Fri, 26 May 2023 15:50:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: mtl: Enable multicore support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
References: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
 <168487142215.278276.6191766858062306959.b4-ty@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <168487142215.278276.6191766858062306959.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AJ347FW4NJO3YSBUCQWFSQYHVE4UZV5O
X-Message-ID-Hash: AJ347FW4NJO3YSBUCQWFSQYHVE4UZV5O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJ347FW4NJO3YSBUCQWFSQYHVE4UZV5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

> On Tue, 23 May 2023 13:32:14 +0300, Peter Ujfalusi wrote:
>> The following series will enable multicore support on MTL platforms similarly
>> to other Intel platforms.
>>
>> The TGL patch is included to simplify the core_put implementation.
>>
>> Multicore support can be enabled by updated topologies, with current set of
>> tplg files this series is not introducing any runtime change.
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!

Looks like patch1 was not applied:

[PATCH 1/3] ASoC: SOF: Intel: mtl: setup primary core info on MeteorLake
platform

was there anything wrong with it or is this a b4/script issue?

Please let us know if we need to resend it or modify it.

Thanks,
-Pierre


> [2/3] ASoC: SOF: Intel: mtl: add core_get & put support on MeterLake platforms
>       commit: c6d15567a4d5dd51ecccc332d514c6dc21bce652
> [3/3] ASoC: SOF: Intel: tgl: unify core_put on IPC3 & IPC4 path
>       commit: 1b167ba8a20152041d3af0c0cbbfd710f1e93e4b
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
