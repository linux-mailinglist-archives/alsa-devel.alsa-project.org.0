Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C608645B4E3
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:07:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643E3167A;
	Wed, 24 Nov 2021 08:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643E3167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737635;
	bh=VoRdcfm6Z8tkxBKhyLkAVsZCt+6MsPvI2L2OpfufrCY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tW06YiWuu1Op/YtYaRo7/W9j4iYNNmtKevEROT02XC0RWKIfuYcPYhcB+qvOH3lo4
	 ZFPeDpJZqkrnvCErQrg9fEZAg6dvbiebrGhURjU7zcWnPZ3St6J7/YHPR2WROWo67u
	 WnqBgNiMcGaYLnij56Ik0amelG2GtG8IMfRNRwTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D0C2F8014D;
	Wed, 24 Nov 2021 08:05:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE84F8049E; Tue, 23 Nov 2021 17:22:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1338F800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1338F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.b="NrW0vwQB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=T+McMKyDOKDOU+PBL1nHadWch3B4nQMaS2x2M/9vBbU=; 
 t=1637684564; x=1638894164; b=NrW0vwQBdibwPyqD5b2Cpb9/PenuqhigsRLky7aZfd02kLh
 Jwbi41c7xi3vq//vM489NVskeHJYpj1jcph75JLJaeY0CNkWB7uhkXsQDYoGvraTe03IUp4AMR3x8
 ARaJiFs9miNcbQqpXfcrI4Zh5aB6G42PA4N9j6WbW3m3QOQ/OS1quL5cZqkAagPAc+g2kIQkBVMq5
 RBOnojPg8EcVl63jSBcmDC14opN8ctRNw7PlZpmXEM31TLbT57iD8THl52bLFy2YYM22gOLIBVSn2
 FWnuK7RcnJPYFimZWx6wKing/7gFA7+Z87yC3OZbfQuqiAqfoim+SdhHaIrgw8og==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mpYYB-001ofh-UH; Tue, 23 Nov 2021 17:21:44 +0100
Message-ID: <12825803045d1cec0df968f72a9ef2724a2548fb.camel@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Nov 2021 17:21:41 +0100
In-Reply-To: <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <CAMuHMdUnBgFpqhgjf5AA0LH9MZOFALeC=YinZ4Tv_V+Y9hkRSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael
 J . Wysocki" <rafael@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-iio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
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
 linux-mmc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, "David S .
 Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On Tue, 2021-11-23 at 09:30 +0100, Geert Uytterhoeven wrote:
> > We have the upper-case (constant) versions, and already
> > {u32,...}_get_bits()/etc.
> 
> These don't work for non-const masks.

Obviously, I know that. Still, just saying.

I'm actually in the opposite camp to you I guess - I much prefer the
typed versions (u32_get_bits() and friends) over the FIELD_GET() macros
that are more magic.

Mostly though that's because the typed ones also have le32_/be32_/...
variants, which are tremendously useful, and so I prefer to use them all
across. In fact, I have considered in the past to just remove the upper-
case macros entirely but ... no time I guess.

> > Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
> > architectures (afaict), so that seems a bit awkward.
> 
> That's a valid comment. Can be fixed by using a wrapper macro
> that checks if typeof(mask) == u64, and uses an __ffs64() version when
> needed.

You can't really do a typeof()==something, but you can check the size,
so yeah, that could be done.

> > Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
> > if it is indeed a constant? The __field_overflow() usage is already only
> > done if __builtin_constant_p(v), so I guess we can do the same with
> > __bad_mask()?
> 
> Are all compilers smart enough to replace the division by
> field_multiplier(field) by a shift?

In the constant case they are, but you'd have to replace
field_multiplier() with the __ffs(), including the size check discussed
above. Then it's no longer a constant, and then I'm not so sure it would
actually be able to translate it, even if it's "1<<__ffs64(...)". I
guess you can check, or just change it to not use the division and
multiplication, but shifts/masks instead manually?

IOW - I would much prefer to make the type_get_bits() and friends work
for non-constant masks.

In fact, you have e.g. code in drivers/usb/chipidea/udc.c that does
things like cpu_to_le32(mul << __ffs(...)) - though in those cases it's
actually constant today, so you could already write it as
le32_encode_bits(...).

johannes
