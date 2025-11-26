Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE0C8B515
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 18:48:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F35E60200;
	Wed, 26 Nov 2025 18:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F35E60200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764179304;
	bh=CREXnS7WogomLb2RYobjD6Y/Z7X01LZZcskfhg30vMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LnPIiiKgo+1APMbgFl9C+z0lA7bRScTUrGxgHeqna/1vyRTL0spKOs95h5F/X3Kb/
	 YZRdIpZq2h5WV/mcPk+mT9uo/pZOh0r8ikP5uKhb6HeUOyAj86mYO6Qga/KLRIssd3
	 jog6OB70O0vs/hUsmdgC5hRewcxvMOnstE6ofKpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7231DF805C8; Wed, 26 Nov 2025 18:47:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 327B8F805C2;
	Wed, 26 Nov 2025 18:47:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2894F8047D; Wed, 26 Nov 2025 18:47:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CBEFF80087
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 18:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CBEFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XEqOf409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764179257; x=1795715257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CREXnS7WogomLb2RYobjD6Y/Z7X01LZZcskfhg30vMY=;
  b=XEqOf409Cd6epCweg+bEEvFyZMT0Q4OXwTGh57GniGBNJcHkp1DHSSmh
   8Am/VHKiRSQZkMw4zZTSWzSaxo7TRn0ZuH8FxrV4Ur0wUwrO8fwal3/br
   YaKO2mkK74qOa7iq0AnZ/vNG5SfkSwHSF4SLpyM6rEaHWfVcQJMOc/VWP
   dERVHTId0UyYg6+TW+JWBYWpi3ANxNbDs0mYEmr72LOd7wCHzaLSys2nl
   W1y6E1OoCv1z+NcXHz5JtrnNLK942PNo+B0jQbOLSN+Hz70HT4Fm7fZX5
   6bKAa3PsjyL4aDX4RP3ll/IqSYxVAXz35ZZONl9IBpnfng6tw5YRzIi6R
   Q==;
X-CSE-ConnectionGUID: 8I47nx5AQxqf7Nw8/j9vEQ==
X-CSE-MsgGUID: OOStrsokRGuFFS6hOkY4OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66114366"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800";
   d="scan'208";a="66114366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:47:32 -0800
X-CSE-ConnectionGUID: 3namkLD0QZCVEqJ9Nxrqfw==
X-CSE-MsgGUID: Qitg+UGHRs6gUU8YfEERcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800";
   d="scan'208";a="192885691"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:47:29 -0800
Date: Wed, 26 Nov 2025 19:47:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, letitia.tsai@hp.com
Subject: Re: [PATCH v5] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
Message-ID: <aSc9L6KXG6oQubwF@smile.fi.intel.com>
References: <20251126141434.11110-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126141434.11110-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: H5BVLVQI3A7D6PWCBCJ2L7HUOBQKXKVW
X-Message-ID-Hash: H5BVLVQI3A7D6PWCBCJ2L7HUOBQKXKVW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5BVLVQI3A7D6PWCBCJ2L7HUOBQKXKVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 26, 2025 at 10:14:33PM +0800, Baojun Xu wrote:
> The tas2781-hda supports multi-projects. In some projects, GpioInt() was
> dropped due to no IRQ connection. See the example code below:
> 
> Device (SPKR)
> {
>     Name (_ADR, One)
>     Name (_HID, "TXNW2781")
>     Method (_CRS, 0, NotSerialized)
>     {
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0038, ...)
>             I2cSerialBusV2 (0x0039, ...)
>             // GpioInt (Edge, ...) { 0x0000 }
>             //"GpioInt (...) {}" was commented out due to no IRQ connection.
>         })
>         Return (RBUF)
>     }
> }
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c), if
> looking for IRQ by smi_get_irq() fails, it will return an error, will not add
> new device, and cause smi_probe() to fail:
> 
> [    2.356546] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: IRQ index 0 not found
> [    2.356561] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: Error requesting irq at index 0
> 
> So, we need to add an exception case for these situations. BTW, this patch
> will take effect on both I2C and SPI devices.

Thanks, excellent!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


