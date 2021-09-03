Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C824001D4
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 17:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A5AD18AE;
	Fri,  3 Sep 2021 17:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A5AD18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630682160;
	bh=C5nXm0M+t2rPgWKmC7QH9OmY/LS8v83rWfblSw5clYs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFw65kcryNgBUftQtlgGJplZHF0QyyXOSHG2pLsjJxXqayrTxrIB/sh5YZldN+DdM
	 uA0FJzLU4Kb/CpVIkRI+DqCOtGQwT6PPE+4VtgVG6JcSmIzp/0BRM/dx27qrVGnLg3
	 HsdX5nOtyUtRGOEZu6CBxcdS+aFWEBUsd9FxC/84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0449F80256;
	Fri,  3 Sep 2021 17:14:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C6EDF80254; Fri,  3 Sep 2021 17:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1500F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 17:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1500F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QMXKc72j"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F3B761057;
 Fri,  3 Sep 2021 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630682076;
 bh=C5nXm0M+t2rPgWKmC7QH9OmY/LS8v83rWfblSw5clYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QMXKc72jGvB09FBO2ehj57A4HPS+XtythideFXCmZT9nYuHXyy1yXx2qehaWqpAMt
 2T7U6IrYdFKVCArqdcYpgN24Wiuz82npYN4Hz8/q4wdqU5BGclBznOOGVb/a6/Y8SP
 EqSpcMs9wpc18TlSB3ujzw2T+LoEu5l4g0alApgBVTTHCLFTQwseV9oMHSab1gl7Ft
 WiHbgbABMEjwj2qt/QTcKCQVIVEHLWqziW8mZqE0vIAAWbSuc29ccL3fagh4nPJL7w
 0nwB4DVyQj9JZO/W7A1xIVCzLSnTfWEsDcRVbSO9WK0+cAw4W+cK5Qr81kWti9PmsK
 KSo03seH13ulw==
Date: Fri, 3 Sep 2021 08:14:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH for-5.15 v3] ASoC: Intel: boards: Fix
 CONFIG_SND_SOC_SDW_MOCKUP select
Message-ID: <YTI71k5EsyTgstkn@MSI.localdomain>
References: <20210802212409.3207648-1-nathan@kernel.org>
 <20210902181217.2958966-1-nathan@kernel.org>
 <20210903102738.GB4932@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903102738.GB4932@sirena.org.uk>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

On Fri, Sep 03, 2021 at 11:27:38AM +0100, Mark Brown wrote:
> On Thu, Sep 02, 2021 at 11:12:18AM -0700, Nathan Chancellor wrote:
> > When CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH is enabled without
> > CONFIG_EXPERT, there is a Kconfig warning about unmet dependencies:
> 
> To repeat what I already said in this thread: the reason this will have
> got buried last time is that you sent the prior version in reply to an
> old thread.  This new version has also been sent in reply to an old
> thread which almost had the same effect.  Please stop doing that, and
> also please pay attention to feedback.

Sorry, I was not meaning to ignore feedback. I interpreted "this was
sent in reply..." as "Pierre-Louis's message was sent in reply..." not
"the v2 patch was sent in reply...".

> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

For the record, the documentation for sending patches has the "Explicit
In-Reply-To headers" section, which frowns on doing this for multi-patch
series but never mentions this for single patches. I have never had a
maintainer complain about me doing this in the over three years that I
have been doing this. It is helpful for me as a developer to see the
review history of a patch at times so keeping them altogether is nice
but if this is going to be a problem, I'll just get in the habit of
providing links to the previous postings on lore.kernel.org in the
changelog section. Maybe the documentation could be updated to frown
upon adding In-Reply-To headers to new versions of patches period? I can
draft up a patch to clarify that.

Do you want me to resend v3 without an In-Reply-To header or can you
pick it up as is?

Cheers,
Nathan
