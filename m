Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8172F78C829
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3385AA4D;
	Tue, 29 Aug 2023 16:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3385AA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693321184;
	bh=MvhqyS4ce7t8iByMHKHstZcA8GJKDvlSv2FT4RuSisM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZIvbF1uLGTikFRbdQCfquWj0MKXsItIpi+bH1+eJbhbEJJXmczz9UsgYY2RyehO5A
	 ksCvHDIFtRMnoEwCBIynomj4OnHGeKuEsGIojJ8vQACbG/p0duWKuHIzWg0OSK5S8M
	 Osrh4ZK96D8blbBQgTdCF8GXV3UQCPoz8YDxCxzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BAAFF800D1; Tue, 29 Aug 2023 16:58:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BBC8F8025F;
	Tue, 29 Aug 2023 16:58:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D61DF804DA; Tue, 29 Aug 2023 16:58:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5060F80155
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5060F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l9rc4x3V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693321128; x=1724857128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MvhqyS4ce7t8iByMHKHstZcA8GJKDvlSv2FT4RuSisM=;
  b=l9rc4x3VgQ3WZ8un2gP8BBa/shLO5KF1Bn3x5TkiWzTgVIFejfZbAJY1
   CAyYpGa31rqW4b4ALXPENegz0xDs5tUT5nue7/BXgknK1Ati9ZAipLpRf
   IzWhYF3lmFpvGJcb8IbLC8VKdnkY/rIkM0W/1Kc7a2R12kLgFg5d23c2H
   pXAh8WA92RJE5MzkZElrAE8gilaAacY4CjA5SEFWtFFkgfd8vLBtMii7U
   CNdB8ph4RuEu1K5YTF/3w5G5/MYQfhiYKwD1HraDEo4hc/spUS5Wd12q6
   zLO0jLpyOgHL2VN383DV/S+BcQgNGnXgdFvEJH5vn1E5BxXzqTO9AfhzW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355713108"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="355713108"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069489564"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="1069489564"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2023 07:58:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qb0Ax-004uOo-1m;
	Tue, 29 Aug 2023 17:58:39 +0300
Date: Tue, 29 Aug 2023 17:58:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Match data improvements for tlv320aic32x4 driver
Message-ID: <ZO4Hn8FrtqdVN379@smile.fi.intel.com>
References: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: B3EE2XCYJWX3WSACH5ERHUTFJJEGULEG
X-Message-ID-Hash: B3EE2XCYJWX3WSACH5ERHUTFJJEGULEG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3EE2XCYJWX3WSACH5ERHUTFJJEGULEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 08:10:12PM +0100, Biju Das wrote:
> This patch series aims to add match data improvements for tlv320aic32x4
> driver.
> 
> This patch series is only compile tested.

Also convert SPI to the new similar API.

-- 
With Best Regards,
Andy Shevchenko


