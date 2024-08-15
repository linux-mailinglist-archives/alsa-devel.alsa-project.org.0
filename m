Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4551952E24
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 14:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB902BD4;
	Thu, 15 Aug 2024 14:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB902BD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723724196;
	bh=yHydkaB7mV0to4o1OlyyrC234NnyXN2FRI8n4mFL3ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SfoEuo4IRO7ENdNcBX4z+JzPiyPRIgqLp28hSIzDtRiQePTjNEwfq/o8TneZeZ6ZU
	 4CgHP4j5sr3mP/5w9GmIuRqCsSCpnwsUKFadzjhvmmd2QbA6p+VGQnGzG13piGUEuj
	 Lozd4b9Lat1w713w1+QU7sEAWe3pivZ8gV7qEyjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A727AF805D4; Thu, 15 Aug 2024 14:15:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D31B4F805B1;
	Thu, 15 Aug 2024 14:15:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1A59F80423; Thu, 15 Aug 2024 14:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3456F8047C
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 14:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3456F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UrhG4lHr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723723473; x=1755259473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yHydkaB7mV0to4o1OlyyrC234NnyXN2FRI8n4mFL3ds=;
  b=UrhG4lHrdWNKemHi2vjKIn1TN6/TL73vN4mMtHRY5ib0yst4WhDS8P1V
   oWS5SFolEMsPWl3WZOwPz611qaPe4DydIwG25WVljmHohy0pmYMKw4UWC
   2Vuo1p7R02dJ/uITvo2NrSxbYhoaSSzZKSCVDmwS0x+VqvhAemDipsaze
   Eai+NjzfJbahXVZ0VmMbCNCzC4pZfWPxnJSRt/fm1v9wJvKfF9PDHu6vc
   ObiKb4EXejVQ24v1F9H8x3gZcKQBk8u6I0nM/Uj7CBEH5yNnsF/GTH1qg
   E/0JdQVSxTnTvEUm17Xcc7vN05E7klUj3JVmurduZXranP5dd6h0uo4kV
   w==;
X-CSE-ConnectionGUID: jFyLuXf/SZiZpVK11YT8/A==
X-CSE-MsgGUID: DhbeY0liSKq9i6ntkpSb7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32608988"
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600";
   d="scan'208";a="32608988"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:04:29 -0700
X-CSE-ConnectionGUID: eLkWGLmqR+yANPMnofdrxQ==
X-CSE-MsgGUID: DTybqODiTZWVCd6mzcTxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,148,1719903600";
   d="scan'208";a="96852637"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 05:04:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seZDG-0000000FXp8-0mub;
	Thu, 15 Aug 2024 15:04:18 +0300
Date: Thu, 15 Aug 2024 15:04:17 +0300
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
	"Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
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
Message-ID: <Zr3uwfNLtTdJWrz4@smile.fi.intel.com>
References: <20240803032717.175-1-shenghao-ding@ti.com>
 <ZrovmRCPN7pc0n40@smile.fi.intel.com>
 <9ec30bafdec441078828cb0d7be93342@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec30bafdec441078828cb0d7be93342@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 3NHADDP4PZPSEZNI5OLD6TGOOWFRN2HO
X-Message-ID-Hash: 3NHADDP4PZPSEZNI5OLD6TGOOWFRN2HO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NHADDP4PZPSEZNI5OLD6TGOOWFRN2HO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 15, 2024 at 03:02:01AM +0000, Ding, Shenghao wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, August 12, 2024 11:52 PM
> > On Sat, Aug 03, 2024 at 11:27:14AM +0800, Shenghao Ding wrote:

...

> > > +	strscpy(name, "Speaker Profile Id",
> > SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> > 
> > > +	strscpy(prog_name, "Speaker Program Id",
> > > +		SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> > 
> > > +	strscpy(conf_name, "Speaker Config Id",
> > > +SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
> > 
> > Why not 2-parameter strscpy()?
> strscpy seemed not support 2 params. Do you mean strcpy? 

1. It does.
2. No, I meant strscpy().

-- 
With Best Regards,
Andy Shevchenko


