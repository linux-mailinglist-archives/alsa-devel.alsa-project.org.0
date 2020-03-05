Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38F17A769
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:29:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E0C166D;
	Thu,  5 Mar 2020 15:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E0C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583418552;
	bh=jBQ42yPcKAqzlCl6rx6Raz7FUaUivnU8WHLnDiVDtRQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHDmzy9kazb2ubZbgfgtY2X4IG/0IkT8DQp7rsxH3TiZOtUYOqC+MZ4O7hbOa4fYC
	 OzGKpsEymZLUJFn+0JlhTYBovZHcgaeomW+V4w2dIV3xQQeY18s5M2UQUZ5a+ld9aR
	 L//+1Y40kW3yHoeB5ttDEHy60ZInCmfjGpaZb/Zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA0BAF8012D;
	Thu,  5 Mar 2020 15:27:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9767F8025F; Thu,  5 Mar 2020 15:27:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D2E0F8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D2E0F8012D
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 06:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="244287970"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006.jf.intel.com with ESMTP; 05 Mar 2020 06:27:21 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1j9rT9-0077W3-Ne; Thu, 05 Mar 2020 16:27:23 +0200
Date: Thu, 5 Mar 2020 16:27:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200305142723.GM1224808@smile.fi.intel.com>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, Mar 05, 2020 at 07:47:47AM -0600, Pierre-Louis Bossart wrote:
> On 3/5/20 7:36 AM, Mark Brown wrote:
> > On Thu, Mar 05, 2020 at 07:06:15AM -0600, Pierre-Louis Bossart wrote:
> > > The use of devm_gpiod_get() in a dailink .init() callback generates issues
> > > when unloading modules. The dependencies between modules are not well
> > > handled and the snd_soc_rt5677 module cannot be removed:
> > 
> > In what way are the dependencies not well managed and why aren't we
> > requesting the GPIO on device model probe anyway?
> 
> there are a couple of machine drivers where the gpios are requested from the
> machine driver. I have no idea what it is done this way, maybe the codec
> exposes a gpiochip that's used later? I was hoping that Andy can help,

I don't know the codebase, so, I was suggested this solution based on my experience.
I can't answer right now why that had been done that way (especially that it
had been done not by me or any my involvement at the time).

> I don't fully get the acpi mapping and all.

This one is easy to explain. ACPI lacks of the proper labeling / mapping GPIO
resources. _DSD() method helps there, but there are no Wintel firmware that
supports it (Google basically is the first who utilizes it).

That's why the board code has mapping table to allow request GPIOs by label
(connection ID in terms of GPIO suybsystem).

> see the code here for reference:
> 
> https://elixir.bootlin.com/linux/v5.6-rc4/source/sound/soc/intel/boards/bdw-rt5677.c#L250
> 
> The issue happens when running our test scripts, which do a set a rmmod in a
> specific order: rmmod of the machine driver, then doing an rmmod of the
> codec driver. Somehow the second fails with the 'module in use error'.
> 
> It's probably because the devm_ release does not happen when the card is
> unregistered and the machine driver resources released since we use the
> component device. There might very well be a bug somewhere in the devm_
> handling, I just don't have a clue how to debug this - and the .exit() makes
> sense regardless in other cases unrelated to GPIOs.

Yes.

-- 
With Best Regards,
Andy Shevchenko


