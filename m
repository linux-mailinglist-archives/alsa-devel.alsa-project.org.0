Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8108A6D3B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 16:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4634D14DC;
	Tue, 16 Apr 2024 16:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4634D14DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713276200;
	bh=aq4WULx4oU8PWVFDbyE/q2y5CCkeP+pW40hjR/O5U5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gaZTxi0CPOuiooKH7lI+8B2VilZadXT5M88JkjuMEiUNIqxxuKqtB6r7uoGvkqiON
	 SIC2JMn/gS+GkLiMPuCTvfPPx3Y2aenrX+hDJQfYgtv12B4f9D7nQkHkwGlx2KRru2
	 1KOt5uia3d6QkV1TZdTML4jWFgzCjKe403+Z8CBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4BDDF8058C; Tue, 16 Apr 2024 16:02:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB048F805A0;
	Tue, 16 Apr 2024 16:02:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46D38F8025A; Tue, 16 Apr 2024 16:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4C63F8003A
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 16:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C63F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y8bbwDPw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713276155; x=1744812155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aq4WULx4oU8PWVFDbyE/q2y5CCkeP+pW40hjR/O5U5U=;
  b=Y8bbwDPwYuvZ9SrBQO/y8rUtINKvYLIhOheSbBNuJiNlLa3E6HckuY8v
   Z6bU7q15WoZ/ArYSO0VooifN5d2+/r9XidilW7J4x7Kb94Km/HD4yBanD
   0TwobIUfz7fn5nTWELtSCd3jtmhSQUyA9suMR4lfoCDgX5bOmdQOblDDS
   nd0EqVZPCx0V/WcHiJYmkTnDiV9yzqyGSnbXRgwze8Xq8eOshy3qEey4v
   rihPWwQCtJjUN9h4G6Nkk54zLtfL5u60wlnhs51/b8hHHzy84sbCxpA65
   LbNjPJD3u5DqjJMkV4cWgGoBk9Gg5G7WpivaB1nGAK+H2/nV8F84NfQaN
   g==;
X-CSE-ConnectionGUID: HGFxbq0TSKeCF4Yptf3IMQ==
X-CSE-MsgGUID: xe0JFOqLQUGGB0vOMiXj/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31194930"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000";
   d="scan'208";a="31194930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:02:20 -0700
X-CSE-ConnectionGUID: icVMWAgLTwW81gHbqyIMKg==
X-CSE-MsgGUID: WApQUCbISDWHDcL4/0VG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000";
   d="scan'208";a="22744751"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:02:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rwjO1-00000004iJI-0sDY;
	Tue, 16 Apr 2024 17:02:13 +0300
Date: Tue, 16 Apr 2024 17:02:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"Lu, Kevin" <kevin-lu@ti.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"soyer@irl.hu" <soyer@irl.hu>,
	"13916275206@139.com" <13916275206@139.com>
Subject: Re: [EXTERNAL] Re: [PATCH v2 1/3] ALSA: hda/tas2781: Modification
 for add tas2781 driver for SPI
Message-ID: <Zh6E5PzTfxawXVbT@smile.fi.intel.com>
References: <20240409024816.1180-1-baojun.xu@ti.com>
 <20240409024816.1180-2-baojun.xu@ti.com>
 <ZhU8fCOLOlu4azGL@smile.fi.intel.com>
 <9287a3c1a2384cacad92652fdd1cac2e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9287a3c1a2384cacad92652fdd1cac2e@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 5RNQ5DNCJUZVSULQZEM6PLPS6LCBCLL4
X-Message-ID-Hash: 5RNQ5DNCJUZVSULQZEM6PLPS6LCBCLL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RNQ5DNCJUZVSULQZEM6PLPS6LCBCLL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 16, 2024 at 07:45:21AM +0000, Xu, Baojun wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: 09 April 2024 21:02
> > On Tue, Apr 09, 2024 at 10: 48: 13AM +0800, Baojun Xu wrote:
> > On Tue, Apr 09, 2024 at 10:48:13AM +0800, Baojun Xu wrote:

...

> > > @@ -39,6 +39,7 @@ snd-hda-scodec-cs35l56-spi-objs :=  cs35l56_hda_spi.o
> > >  snd-hda-cs-dsp-ctls-objs :=          hda_cs_dsp_ctl.o
> > >  snd-hda-scodec-component-objs :=     hda_component.o
> > >  snd-hda-scodec-tas2781-i2c-objs :=   tas2781_hda_i2c.o
> > > +snd-hda-scodec-tas2781-spi-objs :=   tas2781_hda_spi.o tas2781_spi_fwlib.o
> > 
> > Actually these 'objs' has to be 'y', can you fix it in the prerequisite patch?
> 
> Do you mean set CONFIG_SND_HDA_SCODEC_TAS2781_SPI=y in .config?

No. I mean the Kconfig syntax in use. -objs is for user space tools. Kernel
code should use -y in this case.

> It's m now.
> 
> > Also wondering why fwlib is only a requirement for SPI. How does I²C work?
> 
> Because in I2C mode, one probed device driver will support all devices,
> firmware binary is only one file, include all of devices.
> But in SPI mode, multi driver probed, so we use single firmware binary for
> every spi device.

But does I²C version still need the firmware? Can't the FW handling be factored
out to a single module for both?

-- 
With Best Regards,
Andy Shevchenko


