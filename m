Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A7178C82B
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 17:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E697886;
	Tue, 29 Aug 2023 16:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E697886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693321220;
	bh=c4ZA78TdD4dLE0BOLrtYnIvKSfgxxvybhjyOfipu8sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nec1f9g+eWOjn3/PvfKvBmuBnoU9RSKfltSKEeOYlzG39LfMoocCIc9awLMAwl+gq
	 Ad6BxwExZnJTHXHXdA5PbA9z14AgCQe/EPx9oCFc5v7nPLltDVN0MgX9R7YjmGeMoq
	 w5qdHip0/WCLR8TBb6ptwp9vzyVWLZWuhn6fJ3q0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08922F80537; Tue, 29 Aug 2023 16:59:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A31F80094;
	Tue, 29 Aug 2023 16:59:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B96DBF804DA; Tue, 29 Aug 2023 16:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68E48F80158
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E48F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lr2yOHFK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693321165; x=1724857165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c4ZA78TdD4dLE0BOLrtYnIvKSfgxxvybhjyOfipu8sE=;
  b=lr2yOHFKtKrbOf/f3J70NuFZPVO7Yw5IwR8vkkZDUwrIpRZ9zD/iR2uZ
   z2nYR/BfHQMKLDO/OGzw4V+LG6Lh+jp6pfhR28F5jeOfdvy9dJWU41etu
   duKkZlVlKjbfc4tRHumCRdbmZzf/GFPKEzuo6DRBNZdlN+0I25qnU9AI6
   WeC6WxCX7w8MNd6G3P1hO+TVoB80nMHMwyZc919D0Jb+AwR4u2EV5RS3q
   P+/L3sMLCb0KhHL7CwkdLR9UYhH9l8LgkMZGP08ZkrUipihR+rOUz4/Vl
   n0RYdChTU/DU2c3gZXZklNd9cCjw1X49F1k3NByv5mioybeGzI/+O/m31
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379155631"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="379155631"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="808710875"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="808710875"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2023 07:59:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qb0BY-004uPL-2E;
	Tue, 29 Aug 2023 17:59:16 +0300
Date: Tue, 29 Aug 2023 17:59:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tlv320aic32x4-i2c: Simplify probe()
Message-ID: <ZO4HxMErjEPvHuM2@smile.fi.intel.com>
References: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
 <20230828191014.138310-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828191014.138310-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ADS6AV7XJB2B7UUD6VF6RGU2WHVS2R7R
X-Message-ID-Hash: ADS6AV7XJB2B7UUD6VF6RGU2WHVS2R7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADS6AV7XJB2B7UUD6VF6RGU2WHVS2R7R/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 08:10:14PM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_node() and i2c_match_id() with
> i2c_get_match_data().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
assuming that you finish this by converting SPI part as well.

-- 
With Best Regards,
Andy Shevchenko


