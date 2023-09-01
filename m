Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C078FA41
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 10:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC74E0F;
	Fri,  1 Sep 2023 10:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC74E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693558359;
	bh=N2JhWu16noynEhUFQXj18o427aexXuBHoBeQG2E9mLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DWmib1DVXI0QmwwhtJi71YKGCN3HR2ln47ZyCfUSY5o9aryZ6DwNiFioWoZdp/fRr
	 em3vKsbWkdHk6fQqu8sQcrA2XaqiB2UeBfWq44pWTsWR1iOL7TiPrtdbD1qgy/pEdx
	 B9SxFPsbQw1IK0eSZmDt0219oQD/HE82ZHJAfkaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21BBCF80571; Fri,  1 Sep 2023 10:51:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8115DF804F3;
	Fri,  1 Sep 2023 10:51:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2115F80536; Fri,  1 Sep 2023 10:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F221FF804DA
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 10:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F221FF804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fIzWF9C/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693558268; x=1725094268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N2JhWu16noynEhUFQXj18o427aexXuBHoBeQG2E9mLo=;
  b=fIzWF9C/QQKw+dlhhhBKJc2p2EpFLKn3/RPKAwTrEeV3og05t9RfFrwV
   QumLi6btdQXMnX65MLHtg+rjlvMtAqeH8EhgltcbnL/QzWzsO9ZtjPwuN
   8qB93SUrGbzsUUGrLE1MmppxzAYhWaYsEVLNtiQt0m8KQYoHfIY254UqL
   fZG9zbeM3TGMxH63L5D53/EGk750GflNYsPRHCf5U1cGuB5OziDILFUEi
   B7e8y8HRMGwdrpOG1O/tuM0tmDif+kOkSJiBcdGmV1JAURolJ+ogtFbn/
   YxCYkd/41Neq7Xj86YbjDruR9BHwlg81iA1aqLZbaweRXaZKXQMPQaw87
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407164856"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="407164856"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 01:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739854298"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="739854298"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 01:51:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qbzrk-005co0-3D;
	Fri, 01 Sep 2023 11:50:56 +0300
Date: Fri, 1 Sep 2023 11:50:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] ASoC: wm8580: Move OF table
Message-ID: <ZPGl8CroYVfRUDwk@smile.fi.intel.com>
References: <20230831201429.94554-1-biju.das.jz@bp.renesas.com>
 <20230831201429.94554-3-biju.das.jz@bp.renesas.com>
 <ZPEiGxftpGsHrhdc@smile.fi.intel.com>
 <OS0PR01MB59225F3B6218648EE650606B86E4A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <OS0PR01MB59225F3B6218648EE650606B86E4A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ETJAZSZFECZIQ3ZT665PJ2RQF5S64JKM
X-Message-ID-Hash: ETJAZSZFECZIQ3ZT665PJ2RQF5S64JKM
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETJAZSZFECZIQ3ZT665PJ2RQF5S64JKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 01, 2023 at 06:33:08AM +0000, Biju Das wrote:
> Hi Andy,
> 
> > Subject: Re: [PATCH v3 2/2] ASoC: wm8580: Move OF table
> > 
> > On Thu, Aug 31, 2023 at 09:14:29PM +0100, Biju Das wrote:
> > > Move OF table near to the user.
> > 
> > It does a bit more that that.
> 
> OK I will send separate patch for removing trailing comma
> in terminator.

It's fine to have them in a single patch as they are kinda related
(since you touch the lines anyway). My point is that this change
also needs to be described in the commit message.

-- 
With Best Regards,
Andy Shevchenko


