Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92178AE10
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 12:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725D19F6;
	Mon, 28 Aug 2023 12:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725D19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693220178;
	bh=93Q1+09FZxhS4XNoxqvDb1t4zqKJ0lCyw9SI6NZjvGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NgR01PYietIaBg3Ihs6TiN8xMSPJM3iiPIze6I6MaBBGWzqd9NcTLdm0W4C41zsml
	 U03oxCN3P7EtQmkykjyn7lQK/DSrey1+547er4cXWtRSeNkUJASU2VQT9FHzsiu4s9
	 xEOCn2LG2SUEL2CR2FF11WdZ9ugL7ZWKee791RK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7626F80249; Mon, 28 Aug 2023 12:55:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C4CF80155;
	Mon, 28 Aug 2023 12:55:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3EE0F80158; Mon, 28 Aug 2023 12:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63F23F80094
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 12:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F23F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UPnxuJD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693220123; x=1724756123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93Q1+09FZxhS4XNoxqvDb1t4zqKJ0lCyw9SI6NZjvGQ=;
  b=UPnxuJD3r9HNmK+pDa7d2SMHCJYC2rcQNfAVTb99WeFIwBPSEjHNlSHW
   0+zHvRABzutUMGuFGs96otHPZ9QP2fuiJ0PHf4yFRa+SYUtm5L3luaEtw
   iUJX6y6XmTJyEPNFxv+F6kUTZdCypgBDG1q3EXOCAwIw/v3z2gXymWaq5
   4Bf1TYQetjHf5VdVPNtzdAVdLng0gFhCIPWmq4LKMxV4ZzvmE94tZHKeF
   PGbanIqK4k42YJ+061/ezfHAFTGLLMKvi/+dXqnsdDMUOotS5ndOR4Qu9
   LXmTdjfbL7NmiYo2f/ppDRkb2uBSBw8KUGD2WT6zUnmTZWJ8rvNtAh8uj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373962709"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="373962709"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 03:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="738201863"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="738201863"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 03:55:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qaZtr-00F6Ig-0Y;
	Mon, 28 Aug 2023 13:55:15 +0300
Date: Mon, 28 Aug 2023 13:55:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: madera-i2c: Simplify probe()
Message-ID: <ZOx9Ei3PIioXdQLu@smile.fi.intel.com>
References: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: AZINCICXE3WZT5HWH2Q3VRYKZNFRYAMW
X-Message-ID-Hash: AZINCICXE3WZT5HWH2Q3VRYKZNFRYAMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZINCICXE3WZT5HWH2Q3VRYKZNFRYAMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 26, 2023 at 10:17:51AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().

...

> -	of_data = of_device_get_match_data(&i2c->dev);
> -	if (of_data)
> -		type = (unsigned long)of_data;
> -	else
> -		type = id->driver_data;
> +	type = (unsigned long)i2c_get_match_data(i2c);

>  

This blank line is not needed after this change.

>  	switch (type) {

-- 
With Best Regards,
Andy Shevchenko


