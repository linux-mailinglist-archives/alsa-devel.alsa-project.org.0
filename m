Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C58B7773
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4A3820;
	Tue, 30 Apr 2024 15:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4A3820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714484742;
	bh=2UDOlMajI8DsE4OHRS3aVKxvrNd40hazdzrDjFIsdXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iqTaovjvB/9KtNietOdM1Xr2d6cG7bkc+LdB+z/5t8kAyvWDvJNVHxVCTl/4Wrrvu
	 WUhSe+jv/MIEGIhJkSlzG6Y/fSibuUI576AM8igleFEzA8/7HdcKBlgTqpFEM+2wvc
	 EqScX6uBDiL/GLkE3smugiHa4wkTirUxjRZX1W04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C21FF805F0; Tue, 30 Apr 2024 15:44:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE44CF805E8;
	Tue, 30 Apr 2024 15:44:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 139DAF80266; Tue, 30 Apr 2024 15:44:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59FC8F8003A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 15:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FC8F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hizNiqrS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714484668; x=1746020668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2UDOlMajI8DsE4OHRS3aVKxvrNd40hazdzrDjFIsdXE=;
  b=hizNiqrSAr6urB2Wap6NPUTk7i8GLFaz40S2RT/pr9kuA3LWNCnMW6mH
   tUjAz+GAwmc3uZx4wMvidHa1JHVn8dFBxmY+LsO+9I9wSDSyAIe4aeTfk
   QghhuoXjS6F5w33+JePbOerFv4rP+h8Phkd8dtH4FWPp00F/SGwOKNlKn
   hzXthn9DdBZICb6lOuH5JrnfduKP9+2rMP5AHJifYhbdthhD6W8tWXwL+
   rg7o3HSeQ7pb3bBVbjycRRT6tjaDeVlgOqCRdsQw6l0KT3wT/KV2IhUDi
   BKwb+xkFMXJbmsB/BzaY+tZCefsamCQDozadTb7y8dp2RET5DKY3/liaS
   g==;
X-CSE-ConnectionGUID: NWV5thHlSHicKCACVQG6gg==
X-CSE-MsgGUID: NlZfsLF1TrWYPN/7LlY2ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10729734"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000";
   d="scan'208";a="10729734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:44:22 -0700
X-CSE-ConnectionGUID: mgmnKKShQMG9iua9PfZIfQ==
X-CSE-MsgGUID: spqYxkyUQHScc8boV0HzRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000";
   d="scan'208";a="26964803"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:44:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s1nmI-00000002g1m-0sDM;
	Tue, 30 Apr 2024 16:44:14 +0300
Date: Tue, 30 Apr 2024 16:44:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-po@ti.com, niranjan.hy@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v4 1/3] ALSA: hda/tas2781: Add tas2781 hda driver based
 on SPI
Message-ID: <ZjD1rSJDXugxtDy2@smile.fi.intel.com>
References: <20240430072544.1877-1-baojun.xu@ti.com>
 <20240430072544.1877-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430072544.1877-2-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 4HMOMV2JIQDZSXW66P4JNZYHKIZBUYLS
X-Message-ID-Hash: 4HMOMV2JIQDZSXW66P4JNZYHKIZBUYLS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HMOMV2JIQDZSXW66P4JNZYHKIZBUYLS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 30, 2024 at 03:25:42PM +0800, Baojun Xu wrote:
> Integrate tas2781 hda spi driver configs for HP (Varcolac).
> Every tas2781 SPI node was added by serial-multi-instantie.c as a SPI device.
> The code support Realtek as the primary codec.

...

> +		{"TIAS2781", },

Is this for real? I mean you really abused ACPI specifications to get this into
the real products on the market?! If so, never do this again.

_This_ one is non-conforming abuse of ACPI specification and has not to be here
at all. But, if the above is the case, provide the models of the devices and
the excerpt of the DSDT where this broken ID happen, also add a big comment
explaining how comes this happened and that you promise to never happen this
again.

...

> +	{ "TIAS2781", (unsigned long)&tas2781_hda },

Ditto.

...

> +config SND_HDA_SCODEC_TAS2781_SPI
> +	tristate "Build TAS2781 HD-audio side codec support for SPI Bus"
> +	depends on SPI_MASTER
> +	depends on ACPI

No compile test?

> +	depends on EFI
> +	depends on SND_SOC
> +	select CRC32_SARWATE
> +	help
> +	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
> +	  in snd-hda-intel driver, such as ALC287.

-- 
With Best Regards,
Andy Shevchenko


