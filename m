Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEC233364
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 15:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA07C17A2;
	Thu, 30 Jul 2020 15:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA07C17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596117101;
	bh=emDEt9Fq0R1ZUT4hwRKaKscOn0wke5BKzDhIXYI54bQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N9ECl/Ls08XUHMZ3Pk6tkOKYaZeaAz3LXnU5KICkegHjP0G5rcXj8nwWKa/zj0tFT
	 YvIxbOVH+vn/7TpTtX+WrrNoYoTTG1Og2a/+/MCHUA4grDS5ME9CzfdHi1JeoPaqo1
	 RDd5daA9Xmtl2wct0bxqSbzfM+2g+JUR4enB4ji0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC64F80227;
	Thu, 30 Jul 2020 15:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79684F8021E; Thu, 30 Jul 2020 15:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE52F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 15:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE52F8012F
IronPort-SDR: iOxmRrna/UajVCTENnZXhAIdHyyDjZrcKstfafesmZyUD2WbaZZ27RbJ82eR8if2kjUr6eMDXJ
 ckV7WCm88HHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="152821046"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="152821046"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 06:49:42 -0700
IronPort-SDR: YfxvqpoKyzsmflNuxxBu6oPO+XZR32091cdTsL9vvl0irDWf+tVtZQf7QpLfYe2mK03lFSlx+h
 Ha7SQi7AyuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="490662970"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jul 2020 06:49:38 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k18wD-004xUf-Rl; Thu, 30 Jul 2020 16:49:37 +0300
Date: Thu, 30 Jul 2020 16:49:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Lu, Brent" <brent.lu@intel.com>
Subject: Re: [PATCH v2 2/2] ASoC: Intel: Add period size constraint on strago
 board
Message-ID: <20200730134937.GK3703480@smile.fi.intel.com>
References: <1596096815-32043-1-git-send-email-brent.lu@intel.com>
 <1596096815-32043-3-git-send-email-brent.lu@intel.com>
 <20200730084219.GF3703480@smile.fi.intel.com>
 <DM6PR11MB3642F476740FFDAB29C3B8DF97710@DM6PR11MB3642.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB3642F476740FFDAB29C3B8DF97710@DM6PR11MB3642.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Damian van Soelen <dj.vsoelen@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 30, 2020 at 01:23:57PM +0000, Lu, Brent wrote:
> > On Thu, Jul 30, 2020 at 04:13:35PM +0800, Brent Lu wrote:
> > > From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > >
> > > The CRAS server does not set the period size in hw_param so ALSA will
> > > calculate a value for period size which is based on the buffer size
> > > and other parameters. The value may not always be aligned with Atom's
> > > dsp design so a constraint is added to make sure the board always has
> > > a good value.
> > >
> > > Cyan uses chtmax98090 and others(banon, celes, edgar, kefka...) use
> > > rt5650.
> > 
> > Actually one more comment here.
> > Can you split per machine driver?
> > 
> 
> It adds constraints on BSW Chromebooks for same purpose. I don't see the
> benefit to split it.

I didn't get this.

Purpose of splitting this to two is to keep track on per driver basis what has
had happen there.

But it's minor and up to maintainers, of course.

-- 
With Best Regards,
Andy Shevchenko


