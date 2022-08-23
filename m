Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CF59E6A7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6EC1660;
	Tue, 23 Aug 2022 18:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6EC1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661271137;
	bh=I2wMQlQE2ea0W3N6RNflFgDwWIvO1yrAEOonIAJwWe0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GphxmXxZtu8/eDOz6nBKP87DrUcYH6c8Udn3avCIbPJokoK8YABQjTMy3zSusLvyP
	 IcwDTT/A2XpA64tEvasF/uXCIOR3y14I87K2O6PDGql/iaxpEgZqtOO6as8P6sULqQ
	 mMoF0luOMTU7GsSykWI6cI8pKvDhSST3f6IUrM7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 935ACF8027B;
	Tue, 23 Aug 2022 18:11:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E2ADF8020D; Tue, 23 Aug 2022 18:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48FD0F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48FD0F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hSNdmwjb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7011EB81E65;
 Tue, 23 Aug 2022 16:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756FEC433D6;
 Tue, 23 Aug 2022 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661271072;
 bh=I2wMQlQE2ea0W3N6RNflFgDwWIvO1yrAEOonIAJwWe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hSNdmwjbSdgzxxiy2Qzow0e270Hch77B2bpGjSSvCsBEq0D2lu1fyHza6fmFyevSY
 I651tP7J8TQq8OWHcF3ddOmM58Q232mMCNLsju4WTWaGp1jQdjx9JpupezRSO216s2
 Gi+4M0GDMeNwY8EB83YKlpOnJeOoR4A0zBRIjE5TflYDFKivDoABAY4GrAD60t7vqJ
 WF4oASrfMmg6VsYGrsvEZNqwHqVNYBRDFaIKO5gPs5UamkOflYkkBJUcCqXGpX07wh
 5kBgJU/plegFl8P78+jzUovFOnAnyZvJEEFkpIVukrEMDVT5YZ70FbtqUvOfCKQgr5
 KG7LbnvSYLkEA==
Date: Tue, 23 Aug 2022 09:11:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Message-ID: <YwT8HYefLbFaOdJz@dev-arch.thelio-3990X>
References: <20220810010809.2024482-1-nathan@kernel.org>
 <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
 <YwT0oUjo/lzBDRdH@dev-arch.thelio-3990X>
 <YwT6bmqeBeoYcRi7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwT6bmqeBeoYcRi7@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Tom Rix <trix@redhat.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Aug 23, 2022 at 05:03:58PM +0100, Mark Brown wrote:
> On Tue, Aug 23, 2022 at 08:39:13AM -0700, Nathan Chancellor wrote:
> 
> > I noticed that this was applied to for-6.1. I know you do not rebase or
> > change your trees so this request might be rejected based on that alone
> > but would it be possible to cherry-pick this to for-6.0 so that it can
> > be applied to Linus's tree quicker? We have had to apply this change to
> > our CI to keep our builds green in mainline, -tip, and 5.19/5.15 stable
> > with clang-16 due to -Werror. If not, no worries, I should have made it
> > clearer that is what I was looking for with the subject prefix.
> 
> Hrm, OK - it's a bit surprising that this didn't get fixed in -next
> before the clang change made it to mainline TBH, it looked like
> something that had just hit -next.

Right, sorry for not making that more clear in the commit message. The
change in clang was made only a few hours before this patch so I did fix
it quickly but we do not usually get any heads up on new warnings. They
just appear then we fix them and move on. I'll make it clearer where I
want the patch to go in the future, thanks for accommodating this one
time.

Cheers,
Nathan
