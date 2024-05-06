Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C82BE8BC9DB
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 10:46:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D8E974C;
	Mon,  6 May 2024 10:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D8E974C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714985183;
	bh=rptVwfb1xtN9n0vH393IeRH5HJZCQBBxcHYPZ20BChQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pm5IqhDrx3VYpc1biwFBbkJ3VrDa8Q8SgwTBka2R+BCa7geSvAcSmCjLM0TOH0IsA
	 QAbnj3ONnj29mRJi7dHexk+qdEoEh2kSsPAMg/EzFPIXynbxET8Ih4ZJKY4NPHdiXz
	 6wXPLOx00oKlhe4v0+a2JMTPygrqh1uf+8nEhVe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA222F805A8; Mon,  6 May 2024 10:45:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8FFAF8057F;
	Mon,  6 May 2024 10:45:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 238AFF8049C; Mon,  6 May 2024 10:45:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26605F8003A
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 10:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26605F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q+izHRqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714985111; x=1746521111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rptVwfb1xtN9n0vH393IeRH5HJZCQBBxcHYPZ20BChQ=;
  b=Q+izHRqdud2pUocFhEupEz1y79fpDXWjXJ32Opy6+0H9ueFcP9cZm7X+
   xcvqx100TzbXzKHAqPtKqZZzlFuGOtoKKDKHUsQebJ48gW5kSiO1EwhuA
   EQs0TfTeW/+frUdlr/1levg+DfhUPiL62cWNt2vlCLK9M2Rdvp6DZYSP9
   QrkbHIPaFefvJgjHk1+XMPi/UAX4phj5t/ayBBuudfVPLWe57QpVkAm4t
   nePIlV5/QV3zcvQTMz6xDEDYRtIPQQnbzMibLgrDUZ/xyzGzS5bEaS7yu
   F/R9pBRJVypuZ/g8OwC6gcn5RktkFInW8PgrK/hEmmT8E/ASKh5kB2rJl
   g==;
X-CSE-ConnectionGUID: wSVSwIzTRBqVCpInh+qfFQ==
X-CSE-MsgGUID: +CPJBWboTzCSUhcU0PpQWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10563359"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="10563359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:44:54 -0700
X-CSE-ConnectionGUID: XqjTsAL5TTGRGmP7RZWP5Q==
X-CSE-MsgGUID: TX85tZunRoCaKYxlFs4B1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000";
   d="scan'208";a="32605261"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:44:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s3txm-00000004c5p-3lwj;
	Mon, 06 May 2024 11:44:46 +0300
Date: Mon, 6 May 2024 11:44:46 +0300
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
	"13916275206@139.com" <13916275206@139.com>,
	"P O, Vijeth" <v-po@ti.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v3 1/3] ALSA: hda/tas2781: Modification
 for add tas2781 driver for SPI
Message-ID: <ZjiYflatVz7F_2em@smile.fi.intel.com>
References: <20240418040240.2337-1-baojun.xu@ti.com>
 <20240418040240.2337-2-baojun.xu@ti.com>
 <ZiEKc4OTVlOt8llU@smile.fi.intel.com>
 <0c7b29075dc347299602668660adb4b6@ti.com>
 <ZjNpX6TvB4Vv1akq@smile.fi.intel.com>
 <d96bea0bacc842e0b30a100f43ff264f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d96bea0bacc842e0b30a100f43ff264f@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: GOU22G7ROJJ4ULTXPXVXSTHO2GDGUYQ2
X-Message-ID-Hash: GOU22G7ROJJ4ULTXPXVXSTHO2GDGUYQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOU22G7ROJJ4ULTXPXVXSTHO2GDGUYQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 06, 2024 at 07:44:05AM +0000, Xu, Baojun wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: 02 May 2024 18:22
> > To: Xu, Baojun
> > On Thu, Apr 25, 2024 at 07: 54: 41AM +0000, Xu, Baojun wrote:
> > On Thu, Apr 25, 2024 at 07:54:41AM +0000, Xu, Baojun wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: 18 April 2024 19:56
> > > > On Thu, Apr 18, 2024 at 12: 02: 37PM +0800, Baojun Xu wrote:
> > > > On Thu, Apr 18, 2024 at 12:02:37PM +0800, Baojun Xu wrote:

...

> > > > >  sound/pci/hda/Kconfig                           | 15 +++++++++++++++
> > > > >  sound/pci/hda/Makefile                          |  2 ++
> > > >
> > > Is this correct? You are adding a dead "code", isn't it?
> > >
> > > What's mean "dead code"? After add CONFIG_SND_HDA_SCODEC_TAS2781_SPI=m
> > > in my config file, the whole patch code has worked.
> > 
> > Is that file already in the repository?
> > If not, I don't see it in this patch either --> dead code.
> 
> When I integrated CONFIG_SND_HDA_SCODEC_TAS2781_SPI and compiled the whole kernel,
> it used to popup the following message for TAS2781 SPI module in first compile:
>  
>  Build TAS2781 HD-audio side codec support for SPI Bus (SND_HDA_SCODEC_TAS2781_SPI) [N/m/?] (NEW) 
> 
> Normally, selected m. And TAS2781 SPI module would be compiled.

The above is a dead code if this SPI driver is not yet in the kernel. Is it?
What is the path to it in the current kernel source tree?

-- 
With Best Regards,
Andy Shevchenko


