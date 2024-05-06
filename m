Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACF08BCA16
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 10:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF0584D;
	Mon,  6 May 2024 10:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF0584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714985741;
	bh=kLXepkGz2uLMYrQ6dyRebaRkz/kAt5RBr6pMLIinx44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=net/RLpHL/7Km0NuT1Ascv2YYX8GrlgquCXFw371e19JBJnvuY6dAwLOcmoUkH+pi
	 gEGqZnpgr+8RSwlLB5tYNCfLrG+r4hGD2X9G44Qyw/4qMhKXgP8SpEbvE4ZkuwmRB4
	 b83KVvRN8ygZUojxGT/8W3vVMiznsvpQV8rANAYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41121F80564; Mon,  6 May 2024 10:55:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D280F805A8;
	Mon,  6 May 2024 10:55:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69CB3F8049C; Mon,  6 May 2024 10:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CD79F8003A
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 10:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CD79F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aHihAahj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714985701; x=1746521701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kLXepkGz2uLMYrQ6dyRebaRkz/kAt5RBr6pMLIinx44=;
  b=aHihAahjmob2hiPw8AIt2ync0IOCKo89ic64nC0/5aCYPUM9PkjTdSRu
   p/Mm/jxm8QqJaSea5C2ErB1xZ9Vi/7RXhseTzqhvF15FQ0PrtrVFgCXJM
   ANg9w4BMnUHootxYTRJhOksWAspAf/hzWRenWlTYqB5nffjsRSAXn5z7u
   ad/xujA5KOM0Sv9jsTezNqumt6cPRybVC5n93DBqLJJct1pjfb1cqbINN
   Wh02qO+SObDldWpBuyr6y+4Q0LdioKRmVsNsxAIq2sBCJVEJrNT2rFf+k
   SeLAkz2lC9xeTIVDSky/5ZQs0Yc8ro6RSAmOORJrMmUzJ2Qg3krf+/pPg
   w==;
X-CSE-ConnectionGUID: Q/ukgcf7T1mz7WmplCgYJA==
X-CSE-MsgGUID: e1H0oBLwTIyPXatPb5r3lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14506475"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="14506475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:54:57 -0700
X-CSE-ConnectionGUID: JTNl4onvTMuZBXzq0/gDfg==
X-CSE-MsgGUID: FTDo8FpkTTmAgyhZOEDh0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="28055269"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:54:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s3u7V-00000004cH4-0rqU;
	Mon, 06 May 2024 11:54:49 +0300
Date: Mon, 6 May 2024 11:54:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
	cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com,
	soyer@irl.hu, Baojun.Xu@fpt.com
Subject: Re: [PATCH v2] ASoC: tas2781: Fix a warning reported by robot kernel
 test
Message-ID: <Zjia2LOnSk1H2zmK@smile.fi.intel.com>
References: <20240505122346.1326-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505122346.1326-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ESPCUDOCZM2HZSAXB52R2ZPXYN3TRAU3
X-Message-ID-Hash: ESPCUDOCZM2HZSAXB52R2ZPXYN3TRAU3
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESPCUDOCZM2HZSAXB52R2ZPXYN3TRAU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, May 05, 2024 at 08:23:45PM +0800, Shenghao Ding wrote:
> Fix a warning reported by robot kernel test that 'fw_entry' in function
> 'tas2781_load_calibration' is used uninitialized with compiler
> sh4-linux-gcc (GCC) 13.2.0, an update of copyright and a correction of the
> comments.

...

> -// tasdevice-fmw.c -- TASDEVICE firmware support
> +// tas2781-fmwlib.c -- TASDEVICE firmware support

Exactly a good example why the filename shouldn't be in the file.
Please, remove it completely.

-- 
With Best Regards,
Andy Shevchenko


