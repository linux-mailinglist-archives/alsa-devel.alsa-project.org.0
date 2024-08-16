Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABD954D03
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 16:52:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43A172BEB;
	Fri, 16 Aug 2024 16:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43A172BEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723819928;
	bh=pRyHlCh8aSYYzHXx34WfX5hxoAw8zCK3wnS3r5G3XYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HChkjkg/iMdIU2KE7IWvTynfnTxEHeW903CJjm7cfe9DRRqyjX4GUZuIuucpODvUQ
	 BqqA8ZFxt/YgeEhDq+EEP7AIZ6sIBtOqQx5jwbzLba99AvgTs+1A+JnXMqUPoalXGZ
	 VkTZzjCsoLsZCJRCXphUegF9b7Eu9y1xWyHTeVyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08F73F8057A; Fri, 16 Aug 2024 16:51:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D0EF80423;
	Fri, 16 Aug 2024 16:51:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D826CF80423; Fri, 16 Aug 2024 16:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CD6FF80107
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 16:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD6FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jHGZp1ds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723819887; x=1755355887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pRyHlCh8aSYYzHXx34WfX5hxoAw8zCK3wnS3r5G3XYI=;
  b=jHGZp1dskQpupaWu6DRfxle4wlyoZGChdMuA8E5SiNMnNBZTF96ru+D+
   WJbftZuP/96PK+Xgke5xNTjRALOIFoXhHl3DTWPxdfhgb+5k/+nM0Wlf/
   e0zGV6kXE1p8rpci1K//aLmg8LtQgtE6U1SwPXDhmOPf1hmxGww9uM7qv
   XrrOftvZc9AQgIhEv92c4cz411xiXqKQhLyT2+ODq6byP+FO99t56JSkV
   BjjAr6UXW/qYDmR4K4SVqC4sraxh5E8kxVRcZKSuyYAok/tL8XhNk3cgf
   YR46BxrU8GdnU/Tq27ItnIdEtOW3UOO75gUWEOM0RJpgf6/bOm7nKvQec
   Q==;
X-CSE-ConnectionGUID: 4Ae2RdP/RNKwncj6MaGwwQ==
X-CSE-MsgGUID: rEG4i1n/SAyH5kIbjnacVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33503187"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600";
   d="scan'208";a="33503187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:51:19 -0700
X-CSE-ConnectionGUID: 2WEn18WyQweCjl5zF3pxQw==
X-CSE-MsgGUID: 2rLDsdYBTRmn7nLy7PzoaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600";
   d="scan'208";a="64529984"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:51:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seyIF-0000000FwGC-40M2;
	Fri, 16 Aug 2024 17:51:07 +0300
Date: Fri, 16 Aug 2024 17:51:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"zhourui@huaqin.com" <zhourui@huaqin.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Salazar, Ivan" <i-salazar@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Chadha, Jasjot Singh" <j-chadha@ti.com>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"Yue, Jaden" <jaden-yue@ti.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Rao, Dipa" <dipa@ti.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>,
	"Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
	"Xu, Baojun" <baojun.xu@ti.com>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"judyhsiao@google.com" <judyhsiao@google.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"cujomalainey@google.com" <cujomalainey@google.com>,
	"Kutty, Aanya" <aanya@ti.com>,
	"Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
	"savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
	"flaviopr@microsoft.com" <flaviopr@microsoft.com>,
	"Ji, Jesse" <jesse-ji@ti.com>,
	"darren.ye@mediatek.com" <darren.ye@mediatek.com>,
	"antheas.dk@gmail.com" <antheas.dk@gmail.com>,
	"Jerry2.Huang@lcfuturecenter.com" <Jerry2.Huang@lcfuturecenter.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Rename dai_driver name
 to unify the name between TAS2563 and TAS2781
Message-ID: <Zr9nW-rIA0TpmYVj@smile.fi.intel.com>
References: <20240803032717.175-1-shenghao-ding@ti.com>
 <ZrovmRCPN7pc0n40@smile.fi.intel.com>
 <9ec30bafdec441078828cb0d7be93342@ti.com>
 <Zr3uwfNLtTdJWrz4@smile.fi.intel.com>
 <2a4f9f583b5e4495b9fb50a446c2c949@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a4f9f583b5e4495b9fb50a446c2c949@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: YJQIW2ZOIFUXGZMF2HSSX46QTTIZGGGW
X-Message-ID-Hash: YJQIW2ZOIFUXGZMF2HSSX46QTTIZGGGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJQIW2ZOIFUXGZMF2HSSX46QTTIZGGGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 16, 2024 at 01:41:46PM +0000, Ding, Shenghao wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Thursday, August 15, 2024 8:04 PM
> > To: Ding, Shenghao <shenghao-ding@ti.com>
> > On Thu, Aug 15, 2024 at 03:02:01AM +0000, Ding, Shenghao wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Monday, August 12, 2024 11:52 PM On Sat, Aug 03, 2024 at
> > > > 11:27:14AM +0800, Shenghao Ding wrote:

...

> > > > > +	strscpy(name, "Speaker Profile Id",
> > > > SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> > > >
> > > > > +	strscpy(prog_name, "Speaker Program Id",
> > > > > +		SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> > > >
> > > > > +	strscpy(conf_name, "Speaker Config Id",
> > > > > +SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> > > >
> > > > Why not 2-parameter strscpy()?
> > > strscpy seemed not support 2 params. Do you mean strcpy?
> > 
> > 1. It does.
> > 2. No, I meant strscpy().
> I have tried 2-parameter strscpy(), and occurred compiling issue.
> The first parameter of strscpy, *dst, must be array, but in this code
> prog_name and conf_name are points to the memories applied by
> devm_kcalloc.

Okay, I'm not sure why devm_kasprintf() is not used for these cases.

-- 
With Best Regards,
Andy Shevchenko


