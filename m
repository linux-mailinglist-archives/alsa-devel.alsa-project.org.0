Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A695AC9C8B
	for <lists+alsa-devel@lfdr.de>; Sat, 31 May 2025 21:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07AB60235;
	Sat, 31 May 2025 21:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07AB60235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748719539;
	bh=QoW1cZnLsDPdSvpdagAs8C1xegDkUJmpgu3+tJGkGUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XLkWi+diFydJDPhQz+l2odlM/2oegQ+XDJr978zjr191Vx5uB+lR7OTmhUTMSHLKX
	 iDAe/sFo47fOiIvfI36qD0jv3fYtT6ZgxH0aBBKgU7fDOHyQ6U2uka7AD+txo4WYtH
	 /3G7feC1tgCSWKGYIHz2NQNEC6tLSPlOGZXIgI00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E350F805C4; Sat, 31 May 2025 21:25:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53222F8025A;
	Sat, 31 May 2025 21:25:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49514F804B2; Sat, 31 May 2025 21:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 154DDF8025A
	for <alsa-devel@alsa-project.org>; Sat, 31 May 2025 21:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 154DDF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ur4AqREc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748719498; x=1780255498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QoW1cZnLsDPdSvpdagAs8C1xegDkUJmpgu3+tJGkGUs=;
  b=Ur4AqREc0ttlmJ23MRHCZE/y/bWS82wNP4EVnsRuvCTWr7H06byO5pfo
   ZTy9LyN3EUEaz0aBpjYPObEh/Fr3/xF7dnQ3JZDEHd0SSTSXrEY+vThGC
   KHDpxMqPOozx4/OPFAjYjqfy/HKui9f+MIz2n0DYWUvmVU/k4smbWzVU0
   WhH2PmMsv9BGQYV+awAGvj3YKF9H2R0VsvLkkrV/XjRgkOQVS5zBaoJTM
   euh0Exm9aPi3eO29E9Bp/JE7n4Bx517fdPW6g1EIA9IwutgFmQynmv5EJ
   +mdbAsU45+CuRyap8Tq6tpBPNZVpIWm2fHiGEnudT4WzfcQsBdDzSC0c4
   Q==;
X-CSE-ConnectionGUID: ANupxG7hTp6fHNh9EGNiFg==
X-CSE-MsgGUID: KmHodTlYTxastNvk6+hXhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50840245"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600";
   d="scan'208";a="50840245"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2025 12:24:53 -0700
X-CSE-ConnectionGUID: xMObRWRgTri/DSa7qbRFBQ==
X-CSE-MsgGUID: TVm4YCURTCOp8aQ+zmD8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600";
   d="scan'208";a="144813500"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2025 12:24:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uLRp0-00000002Mr4-2ezZ;
	Sat, 31 May 2025 22:24:46 +0300
Date: Sat, 31 May 2025 22:24:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-hampiholi@ti.com, v-po@ti.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add compatible for hardware id
 TIAS2781 and TXNW2781
Message-ID: <aDtXfknr5yslSaM0@smile.fi.intel.com>
References: <20250531121733.17493-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531121733.17493-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: GRIZ5LEI2URHOJ4Y7OQZ3OLJQP4LJ442
X-Message-ID-Hash: GRIZ5LEI2URHOJ4Y7OQZ3OLJQP4LJ442
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRIZ5LEI2URHOJ4Y7OQZ3OLJQP4LJ442/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, May 31, 2025 at 08:17:33PM +0800, Baojun Xu wrote:
> TIAS2781 is unofficial hardware id in acpi for tas2781 in HDA,

ACPI

> has been used for several projects. TXNW is the official hardware
> id for TI, will be used in new projects, including device on SPI bus.
> This patch will support both TIAS2781 and TXNW2781 in acpi

ACPI

> with tas2781 under HDA.

...

> +	hda_priv->save_calibration = tas2781_save_calibration;
> +	tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;

No, just add these lines to a new branch.

>  	if (strstr(dev_name(&clt->dev), "TIAS2781")) {
>  		device_name = "TIAS2781";
> -		hda_priv->save_calibration = tas2781_save_calibration;
> -		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
> +	} else if (strstr(dev_name(&clt->dev), "TXNW2781:00-tas2781-hda.0")) {

Why do you need to match the full device instance name?
Moreover, strstr() is incorrect. Should be strstarts() or str_has_prefix().

> +		device_name = "TXNW2781";
>  	} else if (strstr(dev_name(&clt->dev), "INT8866")) {
>  		device_name = "INT8866";
>  		hda_priv->save_calibration = tas2563_save_calibration;
>  		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
> -	} else

> +	} else {
>  		return -ENODEV;
> +	}

Unrelated change.

...

>  static const struct acpi_device_id tas2781_acpi_hda_match[] = {
>  	{"TIAS2781", 0 },
> +	{"TXNW2781", 0 },
>  	{"INT8866", 0 },

Keep them sorted, please. Perhaps an additional patch?

>  	{}
>  };

-- 
With Best Regards,
Andy Shevchenko


