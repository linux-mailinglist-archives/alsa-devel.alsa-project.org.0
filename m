Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5F8CA3D2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 23:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C001FF;
	Mon, 20 May 2024 23:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C001FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716240836;
	bh=WrZ5Vf7Jh3/G3dGoiHMd/08geH9pMlfqTaIaOal5dMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oJYI9mIE9kWGKi9RKsFaERqOqmRjPz0GYC20v5jleY3SlqCq/Q28TtGR7w9lXP8Y6
	 T6K7+UurmgYKjbCbtJYkvmIwOjsu8Y43i6H/mTtzQpK/SScfdAwNmKrSUMb4jEHZTi
	 O02ADOY/7bPZkRmI2az4HjSqHWEO5BwnQc4FqkfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01DDCF80525; Mon, 20 May 2024 23:33:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A8BF80525;
	Mon, 20 May 2024 23:33:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECEC8F8026A; Mon, 20 May 2024 23:33:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92A42F801F5
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 23:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92A42F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XBp1liKj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716240804; x=1747776804;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WrZ5Vf7Jh3/G3dGoiHMd/08geH9pMlfqTaIaOal5dMk=;
  b=XBp1liKjP/IPxnOv7nzgij451Zj1xKj9rvzbgQcJ9+o2vuvCK7uAG3T3
   KsS6UF5YHol0s7ZeHpaqiEXptXpIwMBeJn+fg6UMilmFctaDy+wax/aCw
   MqeCW44nm803gXThBKUqUukR5GETanwju0jY8PzfEknSXUhI+RWg1WnYc
   meRTM++s/HKDgdngApgLyO1pcxnQ5H/aF3Ying8DSek8ocI909uq2BrpT
   VFsGq8EAkfx4DIeLhhpF+2gtWr7ST6fOP1llV/IRySXl1C7ZebjhgvEtv
   w4PJ28WmBlQKdqscukiCxAlc+tqR+o+16EE+szpsERExPhlktBKyDA1AY
   g==;
X-CSE-ConnectionGUID: RBiOJbAgTRa1DzeuMKJapQ==
X-CSE-MsgGUID: CsxMcY5VR26oOoU/GyqrTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29922093"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000";
   d="scan'208";a="29922093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:33:19 -0700
X-CSE-ConnectionGUID: u4AE7DrRRte9dwLdiod1Kg==
X-CSE-MsgGUID: K2cU40uRQLSWHZ62riEPiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000";
   d="scan'208";a="32552694"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.125.109.51])
 ([10.125.109.51])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:33:19 -0700
Message-ID: <4884ef78-2b86-4dcd-bec4-d6e111fa5455@linux.intel.com>
Date: Mon, 20 May 2024 16:33:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: intel: Constify struct snd_soc_ops
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
 <2f0613bf4c6018569cdaac876d0589e49cf38a80.1715622793.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <2f0613bf4c6018569cdaac876d0589e49cf38a80.1715622793.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6ZG7PBDPPVMLJZGO2DIF2BI4VUGICKYY
X-Message-ID-Hash: 6ZG7PBDPPVMLJZGO2DIF2BI4VUGICKYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZG7PBDPPVMLJZGO2DIF2BI4VUGICKYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/13/24 12:57, Christophe JAILLET wrote:
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

We don't test all the boards in CI but I don't see any issues with
https://github.com/thesofproject/linux/pull/4993, so

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
