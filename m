Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55398CB0F7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 17:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3E11E7;
	Tue, 21 May 2024 17:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3E11E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716303901;
	bh=LHyhnktRlxOV6tsCGNkkOiYwXAA0r+NSWreDQMZB2tk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h8taP74siCCq1nzh8M7AHnzNTf06mHNaCFKYAxuDov5XUuPQZa5N0g425NqwK1JYy
	 SwcL/L7Cgqpv/RTxBBFPZ/O2ssTjnkBAdAZ2/IWoQlQbB3lDsr4dhGrV9MacJTVD7n
	 2cE3uuIuJr9UwxLg3wpFFFtYAaxPcWINhT7h5hts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB23FF805BA; Tue, 21 May 2024 17:04:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F89CF8042F;
	Tue, 21 May 2024 17:04:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 003A8F8028B; Tue, 21 May 2024 17:04:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5343F801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 17:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5343F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RS/PM/Ek
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716303859; x=1747839859;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LHyhnktRlxOV6tsCGNkkOiYwXAA0r+NSWreDQMZB2tk=;
  b=RS/PM/EkFKuVKxuVe3rv3hAwmOlzj+Jv3vZg3OlmHp/AzLJ1ZPEMZ16X
   aO3IuDac7I8xtZf+S5rG4Le1lBcWIw1X60r9nTBBy0ucDdTVCBl4ra7+T
   iSG3kpOONW/9Os92ey+GI2GxM5OyEXbU/34xPVSzLuHEoj8oCbQI6r5Fz
   hzY0X7bgOxHsTgBjctMvAvYfosU/X61Ts3wdwgcFhrk71ab9KuQvDObiB
   KomHndPHRuieU3fxKXbwZUcl4imVwg/3PeFV0iOKJjHSLTRZywd+AP9KB
   5IXk8llMiUtOP+DTyu+DrQHDWy0e9m4vjvoo6KDfCYn4VeZDQrbGb8w3Q
   g==;
X-CSE-ConnectionGUID: ip+6yDZ4TfGIX6DCj7C+Ew==
X-CSE-MsgGUID: 1UK+Lsd3TOuhvKxUu2GQ4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16343185"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000";
   d="scan'208";a="16343185"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:04:08 -0700
X-CSE-ConnectionGUID: KIxlC35WQvWJaX6TuFn21A==
X-CSE-MsgGUID: eLLmxfjDRS65DzvBphooVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000";
   d="scan'208";a="33369005"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [10.125.109.138])
 ([10.125.109.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:04:07 -0700
Message-ID: <bfab8baa-0e4a-456a-89c5-33586a90587d@linux.intel.com>
Date: Tue, 21 May 2024 08:45:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 pierre-louis.bossart@intel.com
References: <20240521084625.453554-1-shumingf@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240521084625.453554-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EFT6PW3RWQ7BN4LN4IR357CHKN74G2QI
X-Message-ID-Hash: EFT6PW3RWQ7BN4LN4IR357CHKN74G2QI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFT6PW3RWQ7BN4LN4IR357CHKN74G2QI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/21/24 03:46, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This is the initial amplifier driver for rt1320.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> --
> v2: add Capture DAI for AEC feedback
> v3: add some comments for blind writes/patch_code/calling sdw_slave_read_prop
>     add class id 1
> v4: add comments for different class id

Thanks for the update Shuming, looks good now.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

