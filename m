Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 950908B98B7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 12:23:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8684A4A;
	Thu,  2 May 2024 12:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8684A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714645394;
	bh=AvAVxcbuo3Sx2lLGX3xwFNmeRI8WgjtQjlrG/vXHx/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EREvuE/OiEICZEhwuetJ3hGwycvK/Bo16qmNI7N1162DMaws+ULADEuN0qmw0aN//
	 4CFqGCzz37OtUpKXqzFtzKxWqkmgbqPSXQHSPCB31N13gohpZ44R/j7WH0O2GTUQsL
	 tLPhv+agG6wRt3EououFZ+dkXuBrRx8hMW5kaXAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8678CF805AB; Thu,  2 May 2024 12:22:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA8CF80579;
	Thu,  2 May 2024 12:22:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 949FDF80266; Thu,  2 May 2024 12:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9985F8003A
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 12:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9985F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FN8UKcKX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714645355; x=1746181355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AvAVxcbuo3Sx2lLGX3xwFNmeRI8WgjtQjlrG/vXHx/M=;
  b=FN8UKcKXfy8jSJ1WpqvI2nQYsHc0sbi3Cd/4VZYL+a1Oo0JA24llcYjA
   JlS+zyGzDgo8o8WovvBoO9yjaNCF6XBNjZccbRHnrAGb/Ks/X3jEi6gEo
   BOHfRpsBL0V1XhWLlaPTkZU9PtPrvjRTKfrtFkvJWHKkIzlGPtkPpH/fo
   AE+QpF68vYydjTgtixYxf67l2vetOempV9VAh/ebA1AFhftVQ5uzzv8bZ
   3T3XK9UpUJGhSaPWnpfdRXmH16a2EMsXkXPhmMA7BETbdQeLIvEzLoZZA
   bf86XFQ4xLw9zVut4JyEJd5S/2J718AzJ8jOcIiMYwFCfyMZ/c7zva7g2
   g==;
X-CSE-ConnectionGUID: 2FiDOFf1RT+C1fGfagqOZw==
X-CSE-MsgGUID: qp4IfVizQJ+TRrVBf4a11Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10533642"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000";
   d="scan'208";a="10533642"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 03:22:31 -0700
X-CSE-ConnectionGUID: Ng2PHk+GSbepSh3GnXNZMQ==
X-CSE-MsgGUID: ZDXuDu7SSouRUtNzWjIBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000";
   d="scan'208";a="64515040"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 03:22:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2Ta3-00000003HQk-3iDD;
	Thu, 02 May 2024 13:22:23 +0300
Date: Thu, 2 May 2024 13:22:23 +0300
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
Message-ID: <ZjNpX6TvB4Vv1akq@smile.fi.intel.com>
References: <20240418040240.2337-1-baojun.xu@ti.com>
 <20240418040240.2337-2-baojun.xu@ti.com>
 <ZiEKc4OTVlOt8llU@smile.fi.intel.com>
 <0c7b29075dc347299602668660adb4b6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c7b29075dc347299602668660adb4b6@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ZHF4TDMQEV7PIWJKL26EFJIEORJXJOWM
X-Message-ID-Hash: ZHF4TDMQEV7PIWJKL26EFJIEORJXJOWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHF4TDMQEV7PIWJKL26EFJIEORJXJOWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 25, 2024 at 07:54:41AM +0000, Xu, Baojun wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: 18 April 2024 19:56
> > On Thu, Apr 18, 2024 at 12: 02: 37PM +0800, Baojun Xu wrote:
> > On Thu, Apr 18, 2024 at 12:02:37PM +0800, Baojun Xu wrote:

...

> > >  sound/pci/hda/Kconfig                           | 15 +++++++++++++++
> > >  sound/pci/hda/Makefile                          |  2 ++
> > 
> > Is this correct? You are adding a dead "code", isn't it?
> 
> What's mean "dead code"? After add CONFIG_SND_HDA_SCODEC_TAS2781_SPI=m
> in my config file, the whole patch code has worked.

Is that file already in the repository?
If not, I don't see it in this patch either --> dead code.

-- 
With Best Regards,
Andy Shevchenko


