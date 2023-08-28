Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F009E78AE8D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 13:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F16EA4E;
	Mon, 28 Aug 2023 13:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F16EA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693221286;
	bh=gk4gPGTAOejxbqSkIPmv/XOWc0LmOYdvChlZ6KE109I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tFm0LSjFhqa+TKG4KsUSQyM5RlFgq6o9iaTZROCvc8OfpmrPVRM68ONA697HziLTE
	 WpvBZzirmyhaZJ/m1B6Hc3JqvbrrqS+n1bWhn9fgxDcnl8HzTMOzShbL7p1M5YM/rp
	 9hBjANx//b7q8cjJBHRV14xAV5e6RNSi8A7K2Q/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2858F8032D; Mon, 28 Aug 2023 13:13:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1422F80155;
	Mon, 28 Aug 2023 13:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B0DEF800F5; Mon, 28 Aug 2023 13:13:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF4CDF80155
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 13:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF4CDF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z0DVAZEn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221228; x=1724757228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gk4gPGTAOejxbqSkIPmv/XOWc0LmOYdvChlZ6KE109I=;
  b=Z0DVAZEn9fHYoSezDYsHXlia7B9DzvDNurZyGedFmD2rM+LoPopM7Tts
   0QX+B+IhXdDQ84x9dlEDW6gPBv3Nd9hEriSzcHSie4SiqLCDkdhawMln+
   rChnU66oY1lIclAdovZnNclLHeVjnqq6k9hF5FW2ya0X1ENXiPQBS080E
   giq5IWCYEB6diPKxcGHvqn54jbyqI9i5I/xEtrXyua3Fz8jUtS69Ei1LB
   QoF/cSeWmTk86WW3ZNZOwkfJd9wqcgTBhmWdsPfgHMBvSz3gL4FXwlmoi
   NVlBXzdhVEnQxYZop7NLhMqVqV1VeYwdu9L68UBvCh3ZIImpvW3aGPnRX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="360071926"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="360071926"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 04:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1069000045"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="1069000045"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 04:13:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qaaBg-00FhN6-0M;
	Mon, 28 Aug 2023 14:13:40 +0300
Date: Mon, 28 Aug 2023 14:13:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Message-ID: <ZOyBY9mpZ5wFVMfw@smile.fi.intel.com>
References: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: EMLSM5QSMVOY3KXYMSNGZX55FIRVDE4S
X-Message-ID-Hash: EMLSM5QSMVOY3KXYMSNGZX55FIRVDE4S
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMLSM5QSMVOY3KXYMSNGZX55FIRVDE4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 27, 2023 at 10:45:36AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_node() and i2c_match_id() with
> i2c_get_match_data().

...

> +	dev_set_drvdata(&i2c->dev, (void *)i2c_get_match_data(i2c));

You (potentially) drop const qualifier here. It's not good and it's not
explained in the commit message why.

-- 
With Best Regards,
Andy Shevchenko


