Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D578C828
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C8A584C;
	Tue, 29 Aug 2023 16:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C8A584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693321169;
	bh=Ck545Pxbz0uvt5JTh4DBhYmcQrfA5M8/JWV7Pbu5juE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nDOjnMeeiV5ix/N2vB7urqyxm2RJymBzWS2NjhmnTlRQno2DpkTFlwaTkAD/9gtzk
	 fow63/WVTO5Qg7c+30T0FaDMFLHZ+2p6wl4hNvqk8pv2hdkmHXk8dmZuzabcZ6RHWa
	 LmTfjXTYGYb/tza5pMrarb6Fengjrjz5FU2a+rUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44BFBF80527; Tue, 29 Aug 2023 16:58:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C895AF80158;
	Tue, 29 Aug 2023 16:58:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A05CDF80236; Tue, 29 Aug 2023 16:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F02FF800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F02FF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T4X9UCxr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693321105; x=1724857105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ck545Pxbz0uvt5JTh4DBhYmcQrfA5M8/JWV7Pbu5juE=;
  b=T4X9UCxr9K3ppp18bXhkPPDJXtYuw7dBvzT1nGiq4pxHoXMlUfMgtav9
   qp/KmTr+LFQbLr5fH1KdNt0225sD80C5MvWJAbbqMcyh6RP8FtOMSLpdj
   kkd73e0qSucJrd/WZ7sLvSgTzwCKJyCf61yRq2Y6TRKPs80Hehd6OzfND
   nXo6g2V4QdquWPtjzicdgg8iyx4OHRm53KMqxnfeslNFYxFhw+fNJnPbv
   POhwrqs+xSBJLuFeBVi+m2yZr3fn2KLuqbwzehiuGTJA5pcImaC1HnOa6
   VREPlDCE1SL8+SgCjm/4qQD1Bi2GUIxt8Gf2dIGRwbe9/xp2qPQQF39DA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372799780"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="372799780"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732235172"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="732235172"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 07:57:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qb0AE-004uNa-1s;
	Tue, 29 Aug 2023 17:57:54 +0300
Date: Tue, 29 Aug 2023 17:57:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: codec: tlv320aic32x4: Add enum aic32x4_type
 to aic32x4_probe()
Message-ID: <ZO4Hci2jfp07U2Ne@smile.fi.intel.com>
References: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
 <20230828191014.138310-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828191014.138310-2-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: TSZ6OMNVRSIY4SXYSORKP6YQBR5OFJ2W
X-Message-ID-Hash: TSZ6OMNVRSIY4SXYSORKP6YQBR5OFJ2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSZ6OMNVRSIY4SXYSORKP6YQBR5OFJ2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 08:10:13PM +0100, Biju Das wrote:
> Add enum aic32x4_type to aic32x4_probe() and drop using dev_set_drvdata()
> from tlv320aic32x4_{i2c,spi} drivers.

Yep, something like this, which looks okay to me
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


