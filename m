Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40C952E23
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 14:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50EAA2B9E;
	Thu, 15 Aug 2024 14:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50EAA2B9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723724184;
	bh=7w2WAn9we+FD6ex2wl3Xn3ZqIPU69CfzpP3JIvlQ1uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QAaXMQV2imrjcs6LQz47z30hLTPBnL4Kuzevdx13GEHZfXXcKuPNrJppPmcGw79M1
	 bxxU97KnICCyXQDnkYgNVVGkcqm8516yBv/UvmWg/eS1UW70RuAcdZ3ZIdelHCdBZD
	 xPUS4WpjkscyRtA0+eZFAyP8mnNs8tirJcNMpDHw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA852F805AE; Thu, 15 Aug 2024 14:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66DC4F805AD;
	Thu, 15 Aug 2024 14:15:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB733F8049C; Thu, 15 Aug 2024 14:06:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFE70F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 14:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE70F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JIMQZKUN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723723344; x=1755259344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7w2WAn9we+FD6ex2wl3Xn3ZqIPU69CfzpP3JIvlQ1uA=;
  b=JIMQZKUNSTm5WgrRmbyANrnd96zuD3jfk/InzgGhW6PblqQki3I1b4Q6
   qi/Q1JVcB9J//V4lHkCTac9W9ejBJv6F8up3Z91mwIB0CbPLn3L4EpU3E
   i9RYQAJdbIcQJO5hRbMHL4O5FcGez18PFIIqionV9ZT+mmtnSPFTcYcOR
   dCXAyxgEDQT5tPFPMBzNVcRqCxtsVoFn5GmvxDIWIvJfePdD0zrDo6hnu
   B7Kbd06Z+Mnwqjbk6j+B3M398zpFmYoASGZQwJOls8bIpjES716xDJpZS
   qphAhxJjfEMWIvPcDHz3nlupPRzNnN14taKqfdrydvQvCW1vFawfTCsxJ
   Q==;
X-CSE-ConnectionGUID: bOtskXJAQUS9n6/9a3kzFQ==
X-CSE-MsgGUID: pSJUanJRRH+7y9qsEXt7Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22108613"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600";
   d="scan'208";a="22108613"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:02:20 -0700
X-CSE-ConnectionGUID: 7EqQnAK0TomwmR2fczP8uA==
X-CSE-MsgGUID: lRRRWmGbRk6GO2DkjkO1QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600";
   d="scan'208";a="82533379"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:02:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seZBD-0000000FXmp-2vKJ;
	Thu, 15 Aug 2024 15:02:11 +0300
Date: Thu, 15 Aug 2024 15:02:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Baojun Xu <baojun.xu@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-hampiholi@ti.com, v-po@ti.com, niranjan.hy@ti.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
	broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v11] ALSA: hda/tas2781: Add tas2781 hda SPI driver
Message-ID: <Zr3uQ7jdtxqF1FlB@smile.fi.intel.com>
References: <20240727085048.1092-1-baojun.xu@ti.com>
 <87ikw25f11.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikw25f11.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: FJIER3KYUIQAVO4QKQJ57QJAZG2T3HFA
X-Message-ID-Hash: FJIER3KYUIQAVO4QKQJ57QJAZG2T3HFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJIER3KYUIQAVO4QKQJ57QJAZG2T3HFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 15, 2024 at 11:08:58AM +0200, Takashi Iwai wrote:
> On Sat, 27 Jul 2024 10:50:48 +0200,
> Baojun Xu wrote:
> > 
> > This patch was used to add TAS2781 devices on SPI support in sound/pci/hda.
> > It use ACPI node descript about parameters of TAS2781 on SPI, it like:
> >     Scope (_SB.PC00.SPI0)
> >     {
> >         Device (GSPK)
> >         {
> >             Name (_HID, "TXNW2781")  // _HID: Hardware ID
> >             Method (_CRS, 0, NotSerialized)
> >             {
> >                 Name (RBUF, ResourceTemplate ()
> >                 {
> >                     SpiSerialBusV2 (...)
> >                     SpiSerialBusV2 (...)
> >                 }
> >             }
> >         }
> >     }
> > 
> > And in platform/x86/serial-multi-instantiate.c, those spi devices will be
> > added into system as a single SPI device, so TAS2781 SPI driver will
> > probe twice for every single SPI device. And driver will also parser
> > mono DSP firmware binary and RCA binary for itself.
> > The code support Realtek as the primary codec.
> > In patch version-10, add multi devices firmware binary support,
> > to compatble with windows driver, they can share same firmware binary.

> Now it's v11, and I'd love to move this forward finally, instead of
> hanging forever.
> 
> The HD-audio part looks more or less OK, but I'd need acks for the
> ACPI and serial-multi-instance parts below.
> 
> Put ACPI and serial-multi-instance maintainers to Cc.
> Rafael, Hans, let me know if that looks OK to take.

FWIW, the ACPI ID part is legit, if the requirement to include it to those
tables, it looks good.

-- 
With Best Regards,
Andy Shevchenko


