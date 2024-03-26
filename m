Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFC388C694
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:16:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D752BAD;
	Tue, 26 Mar 2024 16:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D752BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466167;
	bh=14LLqfHRDImCwD3vmt3ns5M9+uGf0q9+6XiG8CQ/IWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=reXCSKhJA3USvxDHHjnWld5HtPHOJxegqm9/aWXgDFKwRfcz0xwKbjiMlNPT78mbG
	 Rlyyo68sWQ6vdhwTjRL/O3QLsdfgh036Yj7aM2FQzYkZzUIL5COolzVYUjB7EWBUvU
	 eg5Hk7b66e6VHZ3xnbkkXWdgOpLcT9JAKT4Oz/uw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E507F805B5; Tue, 26 Mar 2024 16:15:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF01F805BA;
	Tue, 26 Mar 2024 16:15:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CBDEF801EB; Tue, 26 Mar 2024 16:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2A82F8025F
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A82F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KyQmzDSz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711466017; x=1743002017;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=14LLqfHRDImCwD3vmt3ns5M9+uGf0q9+6XiG8CQ/IWQ=;
  b=KyQmzDSzeM4yeidp5t3UvQloYhQw5+EvYUYKoDlcqgGAROEO7NxOUwqo
   V/dgapFVS5dIdMuN8vOuMnx0+L5n8NKh8DUgN6slsZ033YG4Nckf3wdLo
   AOm0cenMn4J+evBS7PLKyL+o/3OOOBNWZlpTFYVo7L3i/sOoYV0PM+DDO
   9wki/xlYtz4WM9UuZbTv1MzQm1G+lCyQSS0mFCHDB8uCWr+9llqnKr8o5
   rJCB6psLnvHapcqXky7sQYQ+5tn0U5lvAP8JEtZd+HZkBanJwodG1kJLH
   2OrEG5d8vVG2a007mrGTNv/nOWvqBKm7VqwyEE3WNLtGGA3aWWv+xFHzp
   A==;
X-CSE-ConnectionGUID: K+B2w6CrTWyUVa7J8NaZvg==
X-CSE-MsgGUID: 26h5JDrBR3y6lFCjNejQSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="9489040"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="9489040"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="15862594"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO [10.212.65.108])
 ([10.212.65.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:13:30 -0700
Message-ID: <b4c5fb89-a43c-4c40-b729-a49a537f6179@linux.intel.com>
Date: Tue, 26 Mar 2024 10:05:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
Content-Language: en-US
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
 broonie@kernel.org, soyer@irl.hu
References: <20240326010905.2147-1-baojun.xu@ti.com>
 <20240326010905.2147-6-baojun.xu@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240326010905.2147-6-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R6HBT6XO25HMHSNHURENVEXBL43PMMX4
X-Message-ID-Hash: R6HBT6XO25HMHSNHURENVEXBL43PMMX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6HBT6XO25HMHSNHURENVEXBL43PMMX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +enum device_catlog_id {

catalog?

> +	HP = 0,
> +	OTHERS
> +};

Is there not a better way to identify solutions?
You have ACPI IDs, no?

