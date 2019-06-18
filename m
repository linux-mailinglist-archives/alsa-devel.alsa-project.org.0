Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7449EC8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 13:00:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 318E616EA;
	Tue, 18 Jun 2019 12:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 318E616EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560855604;
	bh=iL16yn/qTaYiKO2hmziGc9zgGW54oVxcY+9h0ul+KJ0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hpcH79gN577kvKK3qwZv6HUtIsJQz+ARtZmidzJ2ejONdqw0fBc+gv7Us1JZLdsBn
	 ug1ovNSHT1IhcU1OJL+QExx07ulQz5V44x5G8IiPr2mMqotbmVQ42/mQc8c5Rofs9N
	 b64weNQCguJzm5QIVhU/QOwYqXn0UfxQO10u37yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD30BF896F4;
	Tue, 18 Jun 2019 12:58:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6555F896F4; Tue, 18 Jun 2019 12:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=FROM_EXCESS_BASE64, PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E2D7F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 12:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2D7F80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 03:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,388,1557212400"; d="scan'208";a="161834251"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga003.jf.intel.com with ESMTP; 18 Jun 2019 03:58:08 -0700
Date: Tue, 18 Jun 2019 13:02:06 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20190618130206.2c2ad38c@xxx>
In-Reply-To: <20190617161827.GH9224@smile.fi.intel.com>
References: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
 <20190617144727.GR5316@sirena.org.uk>
 <29ad7270-9aa4-a002-0f0e-21b7a61fe8a4@linux.intel.com>
 <20190617161827.GH9224@smile.fi.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Mon, 17 Jun 2019 19:18:27 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Jun 17, 2019 at 05:31:53PM +0200, Pierre-Louis Bossart wrote:
> > On 6/17/19 4:47 PM, Mark Brown wrote:  
> > > On Tue, May 28, 2019 at 03:02:55PM -0500, Pierre-Louis Bossart
> > > wrote: 
> > > > 2. is there a better way to do this for all Intel chips or do
> > > > we keep this in sound/? Andy?  
> 
> It's better to discuss with x86 maintainers.
> 
> > > ARM has platform detection stuff in the architecture code,
> > > something similar seems sensible for x86?  
> > 
> > Well yes, we already have x86_match_cpu() but that won't work with
> > COMPILE_TEST (asm/ headers don't exist) and this leads to
> > duplication of code. All we really need here is a yeah/nay answer
> > from a help that hides those details away.  
> 
> I don't see much advantage here. Without specific driver data it will
> be degraded to something like:
> 
> 	if (bootcpu.model == INTEL_CPU_...)
> 		...
> 
> with slight exception to heterogeneous SoCs.
> 
> In order to be compile tested we might introduce a header under
> include/platform_data/x86 with these inliners like:
> 
> static inline bool is_x86_model_XX(void)
> {
> 	return bootcpu.model == XX; // it might be done in more
> generic way? }
> 

You might also want to look at other drivers that do some kind of
platform detection.

There is:
tools/power/x86/turbostat/turbostat.c
which has few is_xxx() functions, and:
drivers/gpu/drm/i915/i915_drv.h
which has quite a lot of IS_XXX macros, although they are used to
detect PCI VGA devices, but maybe some code could be shared, with
separate device specific ids.

Amadeusz
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
