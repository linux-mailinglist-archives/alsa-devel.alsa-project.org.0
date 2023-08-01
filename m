Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775876B9B9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 18:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E98B3210;
	Tue,  1 Aug 2023 18:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E98B3210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690907764;
	bh=hGXSIomR/hYXqDdN43YsvF3tHJldhPsq0ZPOr50DyDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hdsgsgMRI6Le8U9jxYkJFV8DuF6PilUtZyt7avb6B9LqFlRr2U5gZOaGD3i5hSuQE
	 8mt92QW4TvCjdIhdm29pSld7+YMdyhmqByfRU4753AQFv3S/ezDdTfsjhGxUfxIIcU
	 OMzynHvUSXptpiyxLc3cvB2bnQhA2As/7rwpxebM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32707F801D5; Tue,  1 Aug 2023 18:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 863BAF8016D;
	Tue,  1 Aug 2023 18:34:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78868F8015B; Tue,  1 Aug 2023 18:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6527F8015B;
	Tue,  1 Aug 2023 18:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6527F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NtmFTIW0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690907580; x=1722443580;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hGXSIomR/hYXqDdN43YsvF3tHJldhPsq0ZPOr50DyDE=;
  b=NtmFTIW0OAq4yCeNcXCEfpEpY8N1rvOozjHL+e7JQVL9nuXjmN9+8tPG
   eGg+4vt/GwlIH6GHjerJib98wtMqy3h30ZcyuhwDgUNp275BQ0BXHA+p6
   9cM9DSk6vMdUnnDFlwdG2l9EXmKedPSB0/BVxptGvaVFQercoIQ2TWsfD
   WFUsU0+nONPlZ/IAdr1zxD1/cYnlYerWQVkZASAZThfMs38pB0QnFKs3S
   6Ad/2QOWIRf2/B5jrvGdycW8GLf2TNv04zJgeNTyRT97YooETaoTF8NEg
   cBgN3O8dZHIAEz6nz5sGILw1DELLBL4Guj5cS3UL0YGcpaHrq4PsyZaRt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368247294"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="368247294"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 09:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852533249"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200";
   d="scan'208";a="852533249"
Received: from gviswana-mobl1.amr.corp.intel.com (HELO [10.212.93.160])
 ([10.212.93.160])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 09:32:46 -0700
Message-ID: <f6efb6f9-11ae-e901-f2a5-a4ef94590290@linux.intel.com>
Date: Tue, 1 Aug 2023 11:32:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/9] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <87r0oohyea.wl-tiwai@suse.de>
 <ec653abc-f2f8-8a9d-4b8a-ea9d985d32fe@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ec653abc-f2f8-8a9d-4b8a-ea9d985d32fe@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: E3SL325HC7V6VMTCOPYHE2QUMB6PFPMV
X-Message-ID-Hash: E3SL325HC7V6VMTCOPYHE2QUMB6PFPMV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3SL325HC7V6VMTCOPYHE2QUMB6PFPMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> I've been working on a small change to keep the workqueue in SOF and
> only move the binding to the probe function to match what snd-hda-intel
> is doing, but I don't know if that is needed?
> 
> It was a bit unclear to me based on feedback if I should try to kill the
> workqueue on all drivers (but with no way to test), or keep it around.

My understanding is that we only want to move the binding to the probe
function and leave the workqueue removal for another day - possibly never.
