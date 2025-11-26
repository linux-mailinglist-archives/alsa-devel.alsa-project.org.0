Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386B5C89947
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 12:44:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA9F60201;
	Wed, 26 Nov 2025 12:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA9F60201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764157475;
	bh=m5OALvI1QMR/zeo454RPq7TI+EJs8f9FBD6RwvET0JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nrOXGRJfViFJUBp41kwcvtXC6qRJ+O6vKsOWWByPZyAyGddUrn7bu/lFt/cG4P17O
	 BR6cqhMicYXUuNimysHTrzd3/40B7Sw4iUubFE+KaBX2y22YKzseVZ0EaCyDDqIbcd
	 oiXizlPH75jKXoD7saZeZfuyrQKjG8pZ7stET4s8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B0EFF805D7; Wed, 26 Nov 2025 12:44:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E3AF805BB;
	Wed, 26 Nov 2025 12:44:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 830B0F8047D; Wed, 26 Nov 2025 12:43:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A18BFF8003C
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 12:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18BFF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FwdYn5gi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764157427; x=1795693427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5OALvI1QMR/zeo454RPq7TI+EJs8f9FBD6RwvET0JM=;
  b=FwdYn5giTyT2XCQ6gBGaBT5vCRqXkqqfwUaKDpNU9hGKxm5LQLEa/LTm
   ZqLfiOcChIak2ZXnPPmaVQEt71n5SKWtPWCqkdd0Q6folt+dVoXnT+hXS
   0VN53J9iaThcWNQtOimwUrrzNnNMavfpi2343G3TVR5Jlz56ZIwtCNKhI
   c7kjOHwGLx0fDpXQ0EfzbGsh81x0pUGImNt03xxqJTXKfH6ZcL9TSHLRu
   8foNAT61+P9WBxwoqUjRkRa+H+N3sUmQtESE5uF6GmzipxSvbLaUWFiW8
   XtUwCHUs/dJ3Rg0vraMq/QkNiuyrrqfbPpV32ONaB+W92eSDf0TYoRKlu
   Q==;
X-CSE-ConnectionGUID: Df+r9m1kTMa6UsOewqfa5Q==
X-CSE-MsgGUID: UNv4PoV0SlCuIun0V7kQgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70055306"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800";
   d="scan'208";a="70055306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:43:42 -0800
X-CSE-ConnectionGUID: kuseI7STShSSIl428EGbWw==
X-CSE-MsgGUID: P9jok9XKS+6b5AsroJAFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800";
   d="scan'208";a="223638426"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:43:37 -0800
Date: Wed, 26 Nov 2025 13:43:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, letitia.tsai@hp.com
Subject: Re: [PATCH v3 0/1] platform/x86: serial-multi-instantiate: ACPI
 example code
Message-ID: <aSbn52j-CJp9gHzM@smile.fi.intel.com>
References: <20251126081741.10588-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126081741.10588-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Message-ID-Hash: 6RZX7EA2EV73KCD2UKNLRBM3A5AXUGHC
X-Message-ID-Hash: 6RZX7EA2EV73KCD2UKNLRBM3A5AXUGHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RZX7EA2EV73KCD2UKNLRBM3A5AXUGHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 26, 2025 at 04:17:40PM +0800, Baojun Xu wrote:
> The tas2781-hda supports multi-projects, In some projects,
> GpioInt was dropped due to no IRQ connection.

GpioInt()

> See the example code below:
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
> if looking for IRQ by smi_get_irq() fails, it will return an error,
> will not add new device, and cause smi_probe to fail.

smi_probe()

> So need to add an exception case for these situations.
> BTW, this patch will take effect on both I2C and SPI devices.
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

And as Hans said, please fold this into the patch as part of the commit message.

-- 
With Best Regards,
Andy Shevchenko


