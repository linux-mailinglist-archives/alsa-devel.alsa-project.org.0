Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895288B777F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5198A4A;
	Tue, 30 Apr 2024 15:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5198A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714484776;
	bh=LE1sqgYmaqkjrr/mtuHnyNHvplOITrygz2qQHL+C+T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c+zPhJzM3QCbEZAkEoGXQLWXaYtb2CVrFdq+WJQxtemu3MDTs6FHemfH/CdBuaP0I
	 iqgwCOW218VwKz4r4fYvTGqDjPE5wDSEDyV48l/3KsWi3N9LsYr9J9CngJmJ3Vzuh1
	 qb7T+twdxESvsWv8v4P6523pHijOMW+SzcZnwSR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27BFDF80587; Tue, 30 Apr 2024 15:45:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C2FF80589;
	Tue, 30 Apr 2024 15:45:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B622F80266; Tue, 30 Apr 2024 15:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E783FF8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 15:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E783FF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FTzF9Z4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714484740; x=1746020740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LE1sqgYmaqkjrr/mtuHnyNHvplOITrygz2qQHL+C+T4=;
  b=FTzF9Z4C1jcD+kcH7soerlpcVgtq23oQuM3NemjMrgTp85ShwtsQv9TI
   BEac9vUO0IkgE0CofqG0ZZqs2hu/FaiAS4GhutSlCERFRRBjSUZR8MbHI
   MCsorzBt89tooZsENv5bE/UqnpsbK2jYF5APE/OdK+MgO1p08ZXvRrgv3
   h9hGr2ycgu8pdtk/P+K/v0Gj6NaULTjOtww9Cj7iAOr+nbc0ZSH1tezrg
   F82JwTARNidS7ZKgJrReAP9qwvhXV8HCzQaKdn3j2CgPrNjxedELTbC5s
   E5Ld1XAYi22+UmWzsduZ0bzmLSiRsDfZ/p0OydCi9Nhxzd6nQMvB4vZZn
   A==;
X-CSE-ConnectionGUID: ILET7vB0QvCdoWQbJXKTZA==
X-CSE-MsgGUID: 0Bqr3Ri+RfGhlzmCHBzyAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10313265"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000";
   d="scan'208";a="10313265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:45:37 -0700
X-CSE-ConnectionGUID: 1etnQxgPSYi82DvgybKGUw==
X-CSE-MsgGUID: ZIwCsDaxQN2rgsGx2ATvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000";
   d="scan'208";a="63954693"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 06:45:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s1nnU-00000002g31-3uty;
	Tue, 30 Apr 2024 16:45:28 +0300
Date: Tue, 30 Apr 2024 16:45:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Baojun Xu <baojun.xu@ti.com>, robh+dt@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com, shenghao-ding@ti.com, navada@ti.com,
	13916275206@139.com, v-po@ti.com, niranjan.hy@ti.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
	broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v4 1/3] ALSA: hda/tas2781: Add tas2781 hda driver based
 on SPI
Message-ID: <ZjD1-NSC3X_7JcQg@smile.fi.intel.com>
References: <20240430072544.1877-1-baojun.xu@ti.com>
 <20240430072544.1877-2-baojun.xu@ti.com>
 <87jzkfm2hp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzkfm2hp.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: LLXTIQ4KVL4XTFZ72437WYM3J4N4HEMN
X-Message-ID-Hash: LLXTIQ4KVL4XTFZ72437WYM3J4N4HEMN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLXTIQ4KVL4XTFZ72437WYM3J4N4HEMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 30, 2024 at 02:58:10PM +0200, Takashi Iwai wrote:
> On Tue, 30 Apr 2024 09:25:42 +0200, Baojun Xu wrote:

...

> >  snd-hda-cs-dsp-ctls-objs :=		hda_cs_dsp_ctl.o
> >  snd-hda-scodec-component-objs :=	hda_component.o
> >  snd-hda-scodec-tas2781-i2c-objs :=	tas2781_hda_i2c.o
> > +snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o
> 
> A nitpicking: better to align with other lines (i.e. with *-objs
> instead of *-y).

I object this. The better approach is to have a precursor patch that switches
to y over objs (the latter is for user space code / tools).

-- 
With Best Regards,
Andy Shevchenko


