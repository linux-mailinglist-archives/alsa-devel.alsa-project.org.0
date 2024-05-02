Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DA8B98A1
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 12:15:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F00E66;
	Thu,  2 May 2024 12:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F00E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714644908;
	bh=cAlBEvn7Zdg3rycQRTm8ybO0vKp0Bzcel9WMD2FX8MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mmDIdr+GEnloPHzWx0pXy34bcF257PE2gzuyBT7Sl4IvdGTL+OkF9jhXowGmzRzmZ
	 uQwV62R6cbvIbcSn1xRSOpxURqd/2l9LzOzcbzTQ5PRXSnn9cfxKc2GRB0ap2yJ6/u
	 x9IO2CAqT7YxGhe8W1OzEZN0dLHs7z7zSNPVYsIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED2EDF8003A; Thu,  2 May 2024 12:14:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14166F805A0;
	Thu,  2 May 2024 12:14:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24885F80266; Thu,  2 May 2024 12:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C891BF800E2
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 12:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C891BF800E2
X-CSE-ConnectionGUID: ALzmT2IqSyOB+r+kQGj2dw==
X-CSE-MsgGUID: BHKYcVR3Q3qjdxQzk83rgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10263027"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000";
   d="scan'208";a="10263027"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 03:14:24 -0700
X-CSE-ConnectionGUID: fnZO5GPrQnya113tbA4d3g==
X-CSE-MsgGUID: higjDwRMTc6kA2VzZ5EfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000";
   d="scan'208";a="27477637"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 03:14:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s2TSE-00000003HFH-14oE;
	Thu, 02 May 2024 13:14:18 +0300
Date: Thu, 2 May 2024 13:14:18 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <ZjNnekOAhhjGh-Ph@smile.fi.intel.com>
References: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
 <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
 <6uj2suuiu7tpomecii65f5lxuwgkhxnqs3lrpa54s2ptsorkh3@lzmnapdw4cri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6uj2suuiu7tpomecii65f5lxuwgkhxnqs3lrpa54s2ptsorkh3@lzmnapdw4cri>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 7ADOLK4MGXYWZ2PFUAQDQ6DE624P5CO7
X-Message-ID-Hash: 7ADOLK4MGXYWZ2PFUAQDQ6DE624P5CO7
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ADOLK4MGXYWZ2PFUAQDQ6DE624P5CO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 02, 2024 at 11:25:13AM +0200, Uwe Kleine-König wrote:
> Hello Andy,
> 
> On Thu, May 02, 2024 at 12:02:50PM +0300, Andy Shevchenko wrote:
> > On Thu, May 2, 2024 at 10:47 AM Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > These drivers don't use the driver_data member of struct i2c_device_id,
> > > so don't explicitly initialize this member.
> > >
> > > This prepares putting driver_data in an anonymous union which requires
> > > either no initialization or named designators. But it's also a nice
> > > cleanup on its own.
> > 
> > There are some drivers that have other (than I²C) ID tables, which
> > follow the same format. Can you also do the same with them for the
> > sake of consistency?
> 
> I'm aware of these and plan to address them in a separate quest once I'm
> done with the i2c bits.

With this being promised, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko


