Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF978B11A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 14:54:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6E0DE5;
	Mon, 28 Aug 2023 14:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6E0DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693227256;
	bh=ZUnjt35nE8dBtenzhFEryEjn7xAx4rIKeA8WqVTq1Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BnYLpJ5YEyPGCc5yqVMFkat0ex3nLirsaBu8JtMW683Ac6Z2MzQAxEa4ecetTlXmp
	 9CQwHhWx7luQDweSYAjccdUh2jSSd1qnFgNeaGVjqtZJKQ3qC0SG7b0ZTvsriR0AAB
	 hy6/9YfBwR7JRQJmDFNamhFIJSZMlzwpTQd8bGg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 232B6F8023B; Mon, 28 Aug 2023 14:53:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB369F80155;
	Mon, 28 Aug 2023 14:53:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1963AF80158; Mon, 28 Aug 2023 14:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 189BBF800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 14:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 189BBF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bnKKTauj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693227194; x=1724763194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZUnjt35nE8dBtenzhFEryEjn7xAx4rIKeA8WqVTq1Tg=;
  b=bnKKTaujZIUw3uXVpUmd7TIE+EMKYBeevLs41oJsJFnk0Owe23KdIy/d
   iYoyIHzOlamo3wWDco4GDx+cgg1xwPYx4pkkirchqv7gMK32i1POEjH9Y
   SxtEcRSLSAxLk8HqCo/ch0u7JPhn/DyDaVX2+MHiqjWsURnBb01pHy1Bt
   rd5AwpobVp8+gDBUBZggw5UjDVeOnfv/jkyUTSGJ8Y1vF3CmQ0dA7WEhP
   QM/nTkc7XcAOSEyK/ombW2YhP6Baf2TIlYaOJBimXygcc5p5Rsj24gMml
   vnGYSMAvrvHUw1kvC3z3gRSc0K5U78vMMrNckFMofx6s2OrbWDE55XUIM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="377821031"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="377821031"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 05:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808271571"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="808271571"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2023 05:53:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qabjp-001JwD-2e;
	Mon, 28 Aug 2023 15:53:01 +0300
Date: Mon, 28 Aug 2023 15:53:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Message-ID: <ZOyYrVRkzmd3+W9a@smile.fi.intel.com>
References: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
 <ZOyBY9mpZ5wFVMfw@smile.fi.intel.com>
 <OS0PR01MB5922E9E9F406EF8F60C2A8C486E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <OS0PR01MB5922E9E9F406EF8F60C2A8C486E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: R2RNFAXTBPVBK47SRK6QW7RFWDNCATRQ
X-Message-ID-Hash: R2RNFAXTBPVBK47SRK6QW7RFWDNCATRQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2RNFAXTBPVBK47SRK6QW7RFWDNCATRQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 11:48:28AM +0000, Biju Das wrote:
> > On Sun, Aug 27, 2023 at 10:45:36AM +0100, Biju Das wrote:

...

> > > +	dev_set_drvdata(&i2c->dev, (void *)i2c_get_match_data(i2c));
> > 
> > You (potentially) drop const qualifier here. It's not good and it's not
> > explained in the commit message why.
> 
> dev_set_drvdata() needs non-const void*, otherwise I get warning.
> The original code also use this cast. That is the reason it is not
> explained in commit message.

Maybe it shouldn't use this pointer directly then?


aic32x4_probe() has these lines

        aic32x4->type = (uintptr_t)dev_get_drvdata(dev);
        dev_set_drvdata(dev, aic32x4);

Dragging data like this makes a little sense to me. What you should do is to
have a precursor patch that adds a third parameter to ->probe().

Also it makes sense to all your improvements for -i2c.c do similar to all
-spi.c cases where it applies.

-- 
With Best Regards,
Andy Shevchenko


