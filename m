Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EFB488BB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 18:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82F6816E6;
	Mon, 17 Jun 2019 18:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82F6816E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560788437;
	bh=qngzGHFhmVWGrTu/ir/QnRbVjzE+/Pk2oWqRHPxHCc4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nGjzEG3/YVUerCxkhixOIc2J+zF82tGJdMR25++gdX6DnVy4TMeRicF04WDCDBnoq
	 LVrRMTr6nT/x7P3iFQaxh0FT3Y+u4U3WXI4E3jMZCCeilpqtn9hzp67XKPN0hOe3kp
	 F+acLzt5G4sXYMxjHrbofGkTYBpLoI1FvSChaXO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1626CF89693;
	Mon, 17 Jun 2019 18:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3EF8F896C7; Mon, 17 Jun 2019 18:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1386F8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 18:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1386F8075C
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 09:18:29 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2019 09:18:27 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hcuKx-0007ba-E2; Mon, 17 Jun 2019 19:18:27 +0300
Date: Mon, 17 Jun 2019 19:18:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190617161827.GH9224@smile.fi.intel.com>
References: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
 <20190617144727.GR5316@sirena.org.uk>
 <29ad7270-9aa4-a002-0f0e-21b7a61fe8a4@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29ad7270-9aa4-a002-0f0e-21b7a61fe8a4@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: Intel: use common helpers to
 detect CPUs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jun 17, 2019 at 05:31:53PM +0200, Pierre-Louis Bossart wrote:
> On 6/17/19 4:47 PM, Mark Brown wrote:
> > On Tue, May 28, 2019 at 03:02:55PM -0500, Pierre-Louis Bossart wrote:
> > 
> > > 2. is there a better way to do this for all Intel chips or do we keep
> > > this in sound/? Andy?

It's better to discuss with x86 maintainers.

> > ARM has platform detection stuff in the architecture code, something
> > similar seems sensible for x86?
> 
> Well yes, we already have x86_match_cpu() but that won't work with
> COMPILE_TEST (asm/ headers don't exist) and this leads to duplication of
> code. All we really need here is a yeah/nay answer from a help that hides
> those details away.

I don't see much advantage here. Without specific driver data it will be
degraded to something like:

	if (bootcpu.model == INTEL_CPU_...)
		...

with slight exception to heterogeneous SoCs.

In order to be compile tested we might introduce a header under
include/platform_data/x86 with these inliners like:

static inline bool is_x86_model_XX(void)
{
	return bootcpu.model == XX; // it might be done in more generic way?
}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
