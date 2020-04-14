Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA371A878D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 19:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088A016A6;
	Tue, 14 Apr 2020 19:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088A016A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586885589;
	bh=shV95jIRjaA/YgRO1z01RN7+yFNAm+lgotmrj1cbL2I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+5vYnUofFQUzk2tpenaVezFwarntU8kD3OnBFp+ueubGQZs9R90MrLF1Q2hTF27Q
	 mZqcxrQUbBT+MklW2b5+mJlj+oO4mqWm59G0uBqzPB+TNZm7mqfLTgEuwDYs2mW1vo
	 hf22SkxdHKcHkgmWaS8e/1voA2cIajqcfoCpPFFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E65F8014E;
	Tue, 14 Apr 2020 19:31:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E780F8013D; Tue, 14 Apr 2020 19:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6490EF800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 19:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6490EF800F5
IronPort-SDR: D/J3cejjgkaCsn9TtFwGr7sXxRERZtLHMghosy0LedUWUpN0TewYW26tNcHVdhCc6tHIZH7xUB
 bc7QXN3BulNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 10:31:12 -0700
IronPort-SDR: i0kCkIFUR74Blyj6EAjijEEDnrSwFH14wws42sXrehAbT0FunF8mp2lTkIzRnF/BHeIMtCRN+M
 ItQ5BGFfBK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="332246781"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2020 10:31:08 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOPOw-000Zxz-92; Tue, 14 Apr 2020 20:31:10 +0300
Date: Tue, 14 Apr 2020 20:31:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 07/16] clk: hifiberry-dacpro: initial import
Message-ID: <20200414173110.GG34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-8-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 DigitalDreamtime <clive.messer@digitaldreamtime.co.uk>,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

On Thu, Apr 09, 2020 at 02:58:32PM -0500, Pierre-Louis Bossart wrote:
> From: Daniel Matuschek <daniel@hifiberry.com>
> 
> This patch imports the clock code from the Raspberry v5.5-y tree. The
> ASoC machine driver initially present in this patch was dropped. The
> comments are also dropped but all sign-offs are kept below. The patch
> authorship was modified with explicit permission from Daniel Matuschek
> to make sure it matches the Signed-off tag.
> 
> This patch generates a lot of checkpatch.pl warnings that are
> corrected in follow-up patches.

I guess it will be waste of time to review this part without squashing it first.

-- 
With Best Regards,
Andy Shevchenko


