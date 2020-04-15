Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14A1A99D1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 12:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C03851672;
	Wed, 15 Apr 2020 12:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C03851672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586944928;
	bh=LFemcOdm1Ppq1Vmy/M2H8Ve4zSk/HlnpiwyMGUVy/9U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHjtpPVLm17cvjWrry0vtwVGyHWe7Oxmm8evXjejQQv0g4KUDDRSwKEqJ0UbO0rdR
	 eEZ/biHG2ViKAzmmV251zul9ICj3N/wlhaXK5sbwmf9/kTaBkYz24m2B2YHGgKSHCd
	 ZUMWFEQHISoBiQlOa5ieNDdTVMvjKl57dvanTC/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6625F80229;
	Wed, 15 Apr 2020 12:00:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49E65F8026A; Wed, 15 Apr 2020 12:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_93,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B282F80229
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 12:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B282F80229
IronPort-SDR: c3mty3RBgDT2Vq7ZhHT3AqlwtQ5uWOMdFDreapnLQLHDPtS1qMYAZnyH/VRI7763iDOwhvZKmn
 aPlhatOXb0rw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 03:00:27 -0700
IronPort-SDR: Ar2EFutLqMhbsnWlBemUKP4XSSJ8a0f6fMvHaHDtIvtZ1DSoJ94PMS483/QAZD0YIhxFj5TQHM
 112+e9iRo6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="400264550"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 03:00:22 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOeqG-000kI3-Bw; Wed, 15 Apr 2020 13:00:24 +0300
Date: Wed, 15 Apr 2020 13:00:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 07/16] clk: hifiberry-dacpro: initial import
Message-ID: <20200415100024.GQ34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
 <20200414173110.GG34613@smile.fi.intel.com>
 <1483c322-66b9-d68e-c8e9-81f826b01108@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483c322-66b9-d68e-c8e9-81f826b01108@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 tiwai@suse.de, DigitalDreamtime <clive.messer@digitaldreamtime.co.uk>,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, linux-clk@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
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

On Tue, Apr 14, 2020 at 01:09:28PM -0500, Pierre-Louis Bossart wrote:
> On 4/14/20 12:31 PM, Andy Shevchenko wrote:
> > On Thu, Apr 09, 2020 at 02:58:32PM -0500, Pierre-Louis Bossart wrote:
> > > From: Daniel Matuschek <daniel@hifiberry.com>
> > > 
> > > This patch imports the clock code from the Raspberry v5.5-y tree. The
> > > ASoC machine driver initially present in this patch was dropped. The
> > > comments are also dropped but all sign-offs are kept below. The patch
> > > authorship was modified with explicit permission from Daniel Matuschek
> > > to make sure it matches the Signed-off tag.
> > > 
> > > This patch generates a lot of checkpatch.pl warnings that are
> > > corrected in follow-up patches.
> > 
> > I guess it will be waste of time to review this part without squashing it first.
> 
> I wasn't sure if squashing was desired, so kept all my changes separate.

At the end, yes. It's a new contribution that can be at least cleaned before
hands to more-or-less acceptable point. With so many subtle issues it's not
good that we dump an ugly code outside of drivers/staging.

> There are some changes from the legacy clk to the clk_hw parts plus
> introduction of ACPI support that are easier to review if kept separate.

Yes, for review purposes it's okay.

You always can put your name as a SoB + Co-developed-by tag or give credits to
other people in the commit message differently (depending to amount of work
they do vs. yours).

> Maybe I should have squashed the cosmetic parts in patch8, and kept the
> functional changes as separate patches.

Use a common sense, you know your work better than me :-)
Just explain this in cover letter (like you do for this version).

-- 
With Best Regards,
Andy Shevchenko


