Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6959E629
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:40:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D8B110E;
	Tue, 23 Aug 2022 17:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D8B110E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661269224;
	bh=EY7ffbopHvWsKpBVtYBIrPDSyaNtMo8vstLMv2RbPi8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0xsXRTAL8Unz7yPKOd6w+m21+4f+CYx8T0MWh+/t7CM20z9TE6DJAXYgEZubG/o1
	 TcotT7EglKlQwrC9WwBWZWNndhsSIgutAJ7G/edWYZS0duz2gLunuJc+4FU+Wb0qIF
	 1cVkvgonMZKQsQNWgCy5TTjnGPdO/w8Zj0AVjLjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55D28F8027B;
	Tue, 23 Aug 2022 17:39:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD25FF8020D; Tue, 23 Aug 2022 17:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 703F8F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 17:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 703F8F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q4cLF4ai"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88337615FA;
 Tue, 23 Aug 2022 15:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C33C433B5;
 Tue, 23 Aug 2022 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661269157;
 bh=EY7ffbopHvWsKpBVtYBIrPDSyaNtMo8vstLMv2RbPi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q4cLF4ai88z/mqbFHfObkZHkx3eEi9LrgQNCu7fhOmP7r/F+1Nbz9zwGAI7WQkkJm
 M7mrxmZk6dSxVjdCXZCxnh3upzNpqzq8AMMlB+iXd/8UcwIYN2YyK9E2U6yKEVT70E
 KXaE7WVPdZKyOWP1DSMbaZxspsvmlQ0zGizbNpNDwyZ1Rd7xVxlpoIwLzfEkYi9sCQ
 vAmSz40YIMt3v6Z8gC1A5CyZfqg4yUWTja65AZMkdCvEJJwVsbS2sy6T1Qari0jJow
 TUI0EuTu5TiWchDhjT3A7bKme6PtqyolERQg1j5heVQ0PXDqZnzK7dJTo8dahQKadt
 Xo+9oKO4geaFQ==
Date: Tue, 23 Aug 2022 08:39:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Message-ID: <YwT0oUjo/lzBDRdH@dev-arch.thelio-3990X>
References: <20220810010809.2024482-1-nathan@kernel.org>
 <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
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

Hi Mark,

On Mon, Aug 15, 2022 at 05:23:15PM +0100, Mark Brown wrote:
> On Tue, 9 Aug 2022 18:08:09 -0700, Nathan Chancellor wrote:
> > A recent change in clang strengthened its -Wbitfield-constant-conversion
> > to warn when 1 is assigned to a 1-bit signed integer bitfield, as it can
> > only be 0 or -1, not 1:
> > 
> >   sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
> >           dev->gclk_enabled = 1;
> >                             ^ ~
> >   1 error generated.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
>       commit: eab9100d9898cbd37882b04415b12156f8942f18

I noticed that this was applied to for-6.1. I know you do not rebase or
change your trees so this request might be rejected based on that alone
but would it be possible to cherry-pick this to for-6.0 so that it can
be applied to Linus's tree quicker? We have had to apply this change to
our CI to keep our builds green in mainline, -tip, and 5.19/5.15 stable
with clang-16 due to -Werror. If not, no worries, I should have made it
clearer that is what I was looking for with the subject prefix.

Cheers,
Nathan
