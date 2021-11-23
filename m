Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E73A45B532
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:17:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0DF217DB;
	Wed, 24 Nov 2021 08:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0DF217DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738278;
	bh=IW4qN8u05oVacusnPMH1cuKnY7vyge2dygNZ0jyMnfs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UP/C8rZyg6U+BvFkRVtl9HcDPeGFoZvcHbPGg0s2J+bngxzBZNVNRIRaiRROnFjZJ
	 6ltr3YCAKfx6NzyNgkD8JxyQfSa8TruEhXrtYs976hkGzIdL4TrEDR2B6seEr5CZFU
	 mJES8oypQD5m6eljr0moS6uutfMGTCCCKmnISmNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 791CEF805F5;
	Wed, 24 Nov 2021 08:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 873F5F800E7; Wed, 24 Nov 2021 00:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B846F800E7
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 00:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B846F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bMkLLetQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBAD760F41;
 Tue, 23 Nov 2021 23:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637711364;
 bh=IW4qN8u05oVacusnPMH1cuKnY7vyge2dygNZ0jyMnfs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bMkLLetQudL1AnjDLBkGz2KJV65XFDNAI+qMERM3p2htB/mPltEFDc0SoR5SG7cTn
 yUvjgLX4fj3iycoMCeZbceNqv8VJp4xXmhJ5j4daJdQUx70dPPE1ZSDF3I8EJ3CrBl
 FL9EHxBPJYKnvkt5L2363w5f8MTJ/hI+N0EksRg4Tqq2ECyAP9r+yfiU6OtA4c1HNW
 sJDJxZC66+IkfqVqHU0aoaIJ7PQLiQE76d+ztRn4+dA/AYxJtUD+/ZrA56NgYcGb99
 3NhcCdyp7MdhPQ2MlzMSxitFt7xyg2kF02pUQFCNG1ojXEWE+DZkeLhKg7BQKKAgjZ
 pglhaeH4khWUA==
Date: Tue, 23 Nov 2021 15:49:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
Message-ID: <20211123154922.600fd3b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <637a4183861a1f2cdab52b7652bfa7ed33fbcdd2.camel@sipsolutions.net>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
 <637a4183861a1f2cdab52b7652bfa7ed33fbcdd2.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>,
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Eduardo Valentin <edubezval@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Rajendra Nayak <rnayak@codeaurora.org>,
 Tero Kristo <kristo@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Keerthy <j-keerthy@ti.com>, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On Tue, 23 Nov 2021 17:24:15 +0100 Johannes Berg wrote:
> > (*_replace_bits() seems to be useful, though)  
> 
> Indeed.
> 
> Also as I said in my other mail, the le32/be32/... variants are
> tremendously useful, and they fundamentally cannot be expressed with the
> FIELD_GET() or field_get() macros. IMHO this is a clear advantage to the

Can you elaborate?

> typed versions, and if you ask me we should get rid of the FIELD_GETand
> FIELD_PREP entirely - difficult now, but at least let's not propagate
> that?

I don't see why.
