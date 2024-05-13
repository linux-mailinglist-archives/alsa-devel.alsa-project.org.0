Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1A8C4241
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 15:42:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF67950;
	Mon, 13 May 2024 15:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF67950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715607769;
	bh=NHGPLgtCUqCEfcn2vaIa5U959E4/fnbBgnnTfKGDUhM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WULinCaYqMqdZ/8zNZRBozzt/Jw1suInLuYG4kadNt04KTdjOkWzJN7m8f4TtFrCo
	 aPu+EsoB3dybjvVffgAB0UrugD0ofylFK/O5AWpjsjEvewa7k7WsjM0efpY/RhDXsq
	 t11xqQ8oPu5yF+XFxr8LvsibMUTl/mOC3e6Mimjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D15AF80563; Mon, 13 May 2024 15:42:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99BE0F80564;
	Mon, 13 May 2024 15:42:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A54BCF80224; Mon, 13 May 2024 15:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3066DF800E2
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 15:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3066DF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZSPIBpE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715607723; x=1747143723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NHGPLgtCUqCEfcn2vaIa5U959E4/fnbBgnnTfKGDUhM=;
  b=ZSPIBpE2W0FjtJSS7mEhmi5TD7nsy/+G79PfVfof+RCupvKYpNr1ceV4
   M4Iaw2CYdQodVPZu+WQFBfCeDhGgRVoAFzeRSJLbejtTM6pdoTujkOubs
   gwD/9X2NjuVpo0c/stOFGQVGsauOfybuKoTpl4LlJc+OBBiFT3h4YHaDe
   jo98AeUqsZRcToTh1CGiXe7UHT0ya0Fg1g4IQdc52lt5lkSt+5Ftt5rIx
   AczYOv81v2XNjcnDsb/vPixAeke39NFj4U67ijacnmVdB0Esr6sFAbtQT
   fQ2mTCCHqiWmJdzkLnSSySCfdZFgNiISXBZDiG1neueFjQbjIPX2XOp2f
   w==;
X-CSE-ConnectionGUID: ejnSgDCpTpepSRfaXF6/WQ==
X-CSE-MsgGUID: xWnVr/mSRbmtFiE0+IfkIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34055956"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000";
   d="scan'208";a="34055956"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:41:57 -0700
X-CSE-ConnectionGUID: IDlEf8a7Qt6kUtLIFkGQJw==
X-CSE-MsgGUID: kcqS9LquTyiO6UeF+3ehCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000";
   d="scan'208";a="30323298"
Received: from sgoshi-mobl1.amr.corp.intel.com (HELO [10.212.69.71])
 ([10.212.69.71])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:41:56 -0700
Message-ID: <88e6bbe3-94a2-4b50-b462-eb27376698c4@linux.intel.com>
Date: Mon, 13 May 2024 08:41:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: intel: Constify struct snd_soc_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: 
 <242aef53b5b9533ae4cca78148622f5fe752b7ee.1715452901.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <242aef53b5b9533ae4cca78148622f5fe752b7ee.1715452901.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O6QTJDVJV7XYGMPVUR6HKWZROJMXCDDA
X-Message-ID-Hash: O6QTJDVJV7XYGMPVUR6HKWZROJMXCDDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6QTJDVJV7XYGMPVUR6HKWZROJMXCDDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/11/24 13:42, Christophe JAILLET wrote:
> Constifying "struct snd_soc_ops" moves some data to a read-only section, so
> increase overall security.
> 
> This structure is also part of scripts/const_structs.checkpatch.
> 
> As an example, on a x86_64, with allmodconfig:
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    6315	   3696	      0	  10011	   271b	sound/soc/intel/boards/ehl_rt5660.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    6379	   3648	      0	  10027	   272b	sound/soc/intel/boards/ehl_rt5660.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> I hope that it can be applied with this single patch because all files are
> in sound/soc/intel/boards/

Doesn't apply for me, can you rebase and resend?

CONFLICT (content): Merge conflict in
sound/soc/intel/boards/sof_maxim_common.h
Auto-merging sound/soc/intel/boards/sof_maxim_common.c
CONFLICT (content): Merge conflict in
sound/soc/intel/boards/sof_maxim_common.c
error: Failed to merge in the changes.

Probably a result of all the changes in this directory...
Thanks!
