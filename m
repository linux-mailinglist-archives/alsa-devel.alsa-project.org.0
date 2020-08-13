Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9A243F2E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 21:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4EFE1673;
	Thu, 13 Aug 2020 21:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4EFE1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597345609;
	bh=CRko2CnMzGkcV+lvuEBKcS9JlZ12plGDFjrO+o0+wYk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nVjXUuqhIeMNR8L8BS89l8tkXNf3ZgcTR8/h13ybLX5dkoXSowrJF3QUEWOFrW6Gk
	 b5xRkmB8s1WsCVN2/VShRqbsiCXo/us9uLgNn9jew/6C2Njd1651/4yFmbWvIcy9kt
	 /v23UHMgsYUCnAydMOebLEG8F5OkijIGAK/DLRSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 001D9F801A3;
	Thu, 13 Aug 2020 21:04:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD29F800F4; Thu, 13 Aug 2020 21:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D55EDF8014C
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 21:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D55EDF8014C
IronPort-SDR: 2q9gwpDm/He1ZKghg+KrowuYxb44QacXPSuKLMFQyoKET0BbF0EUIT+cSc2VTUdxBm60Pis2l0
 WaGeQnUKQaeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="153535688"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="153535688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 12:03:51 -0700
IronPort-SDR: Cdr/SWBcf2aPUcFaH+voIdvHS4T3dLlJjxqf9J6ApweuwPdjgszjIWTcanADoRN21luVuTk9Ca
 3x4M/45Vh72w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="369690710"
Received: from aatar-mobl.ger.corp.intel.com ([10.254.149.214])
 by orsmga001.jf.intel.com with ESMTP; 13 Aug 2020 12:03:41 -0700
Message-ID: <fe10ba5dd1fa8a6e72218b45fd7fba557a56eed2.camel@linux.intel.com>
Subject: Re: [PATCH v4 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Thu, 13 Aug 2020 20:03:57 +0100
In-Reply-To: <7eb3dd69-d45e-2915-c18f-de286b5d630e@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <7f6f652f36d8654560f038326f841624ffeb649a.camel@linux.intel.com>
 <7eb3dd69-d45e-2915-c18f-de286b5d630e@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com, tiwai@suse.com,
 krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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

On Thu, 2020-08-13 at 20:11 +0200, Cezary Rojewski wrote:
> On 2020-08-13 6:00 PM, Liam Girdwood wrote:
> > On Wed, 2020-08-12 at 22:57 +0200, Cezary Rojewski wrote:
> > > Implement support for Lynxpoint and Wildcat Point AudioDSP. Catpt
> > > 
> > > solution deprecates existing sound/soc/intel/haswell which is
> > > removed
> > > in
> > > 
> > > the following series. This cover-letter is followed by
> > > 'Developer's
> > > deep
> > > 
> > > dive' message schedding light on catpt's key concepts and areas
> > > 
> > > addressed.
> > 
> > Whilst I applaud removing the old driver I do NOT support adding
> > yet
> > *another* Intel audio DSP driver. Our goal is to remove DSP drivers
> > and
> > unify under one codebase (and this was discussed in Lyon last year
> > at
> > the audio Miniconf).
> > 
> > Please take all these good improvements and add them into the SOF
> > driver.
> > 
> > Please also remember that we are adding an IPC abstraction layer
> > into
> > the SOF driver so it can cope with multiple IPC versions. You are
> > most
> > welcome to help in this effort.
> > 
> Presented catpt is created as a solution to existing problems
> reported 
> by clients and users for WPT platforms. It is not "yet another" DSP 
> driver but an update to an existing one - due to high range of
> problems 
> found when testing it, catpt came as a lower-cost solution and
> /haswell/ 
> is being removed soon after. So, the status quo is maintained -
> single 
> driver for LPT/WPT architecture.

Its a new driver. Fix the old driver or (preferred) fix the SOF driver
so we can remove the haswell driver and have one less DSP driver to
maintain.

> 
> Please don't use 'our goal' term, it's misplaced: it was agreed on 
> several occasions that older DSP platforms remain with closed
> firmware 
> and are to be supported with existing DSP drivers.

I'm not suggesting using SOF FW, but using the existing FW with the IPC
abstraction.

> SOF FW does not support BDW and instead is tasked with support of
> newer 
> platforms. Neither SOF FW team nor Chrome support team agreed with
> WPT 
> being moved out of closed firmware. Please, speak with management
> first 
> before writing statements saying otherwise.

To be clear - I'm saying fix the SOF driver to use the old FW (not the
SOF FW). You know that we need IPC abstraction here (and for other
platforms)

> 
> I don't see your input for any of the patches. Internal heads-up has 
> been given. No review for either internal or upstream patchsets. 
> Afterall, you were the author of original /haswell/ and your input
> could 
> have proved important in speeding the progress and yielding even
> better 
> results to our clients.
> 

Please don't mistake silence for my approval. I knew that updates were
forthcoming but not a new driver.

> As you've given no technical points for denying LPT/WPT improvements
> and 
> your statement disagrees with management's decision, message shall
> be 
> discarded and ignored for the rest of the upstream process. Further 
> discussion will be taken off this list.
> 
> Mark, Takashi and others,
> I'm sorry for this inconvenience, such actions do not represent One 
> Intel and Truth & Transparency which Intel is committed to stand by.
> 

Seriously ? It's really simple for anyone to understand that
introducing a new driver introduces new bugs. It's also very well
understood that fixing or extending existing drivers is always the best
path forwards over adding another new immature driver.

I hope you understand that long term **convergence** is key for
quality, maintainability and reduced effort, if not, I'm happy have a
call.

Thanks

Liam 
  


