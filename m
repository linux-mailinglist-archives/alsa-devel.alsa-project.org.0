Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E257679159B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 12:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A114174C;
	Mon,  4 Sep 2023 12:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A114174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693822727;
	bh=C1sxTWSukD5VjbJkhBh/4XO0u1A8SVO5BB9Wv/rZVKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fPap6VqJaa6lBmIMWIooXMI7IlgolHLgoQBTQOoe+gCE7XVxJK0zqZw1QohgNe4F2
	 kaSUSQOg7eoezlhKFWIQspvAUnGgB03UxZC//pOLNWOmkI5sZQ1RWf4SxipC7gObE9
	 0UDVwzxIClrl+yVKbsaM+zTu3Mtsp9RBecWZ/PRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D52AF80549; Mon,  4 Sep 2023 12:17:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5DEDF80431;
	Mon,  4 Sep 2023 12:17:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24FFAF8047D; Mon,  4 Sep 2023 12:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC145F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 12:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC145F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KOx/hgqY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693822665; x=1725358665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C1sxTWSukD5VjbJkhBh/4XO0u1A8SVO5BB9Wv/rZVKs=;
  b=KOx/hgqY4ZP4x8YVWZlFB4XPticbevQ1sPfOTdwepVbvG/RpBMoXMOqc
   cFnE2qsj5EXzp7BV+oKZIRBUlQKK3YhHeqPxP/TW5NfXonSVlewyH4klH
   xCHSj/Ohgl96CjmXMI2tSwc6jZLeSHIubt3g/jQ4Ste6QYhv5rOkCYHtt
   3aVt4DATEpScZJVagMaTMy/0FR4gTUaJ+jufACIJ1ieX+vyOHr1n95EVv
   cnsUwY4EdGFFXbeJdwMPMm1PIrMhucxQal8cSNUeKmqiEPgprRYhwIBk2
   zx3GBRBVcGDAt0tTop/JZwJ3NtYceEUL/Dqy46u5dp8nDjdImxioYF1HP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="462934043"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000";
   d="scan'208";a="462934043"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="810868946"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000";
   d="scan'208";a="810868946"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:17:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qd6e4-006OhD-0P;
	Mon, 04 Sep 2023 13:17:24 +0300
Date: Mon, 4 Sep 2023 13:17:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v1 1/2] ALSA: hda/tas2781: Update tas2781 HDA driver
Message-ID: <ZPWus9/OCJ/DJHQq@smile.fi.intel.com>
References: <20230903143759.92-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903143759.92-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: YHK4WHCZRNCY7EL6HTYTBCLLNLUSYGBA
X-Message-ID-Hash: YHK4WHCZRNCY7EL6HTYTBCLLNLUSYGBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHK4WHCZRNCY7EL6HTYTBCLLNLUSYGBA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 03, 2023 at 10:37:57PM +0800, Shenghao Ding wrote:
> Support ACPI_ID both TXNW2781 and TIAS2781, and revert structure
> cs35l41_dev_name.

...

> +	/* exactly match either TXNW2781 or TIAS2781 */
> +	/* the rest must be exact matching */
> +	snprintf(tmp, sizeof(tmp), "-%s:00", "TXNW2781");
> +
> +	if (!strcmp(d + n, tmp))
> +		return 1;
> +
>  	/* the rest must be exact matching */
> -	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
> +	snprintf(tmp, sizeof(tmp), "-%s:00", "TIAS2781");

Basically this should use acpi_dev_match infra like Intel drivers do.
But I haven't read code deeply to understand if it's the case here or
not.

-- 
With Best Regards,
Andy Shevchenko


