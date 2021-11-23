Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA5B45B4E4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:07:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910C21683;
	Wed, 24 Nov 2021 08:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910C21683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737657;
	bh=WWFsg2XL7Jfg8F/YJbyRuglLvJ2nac+1g9E+5f8f0cQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJpUCYaF6o9d29FLRhuo7a2JFGSTMAj5q/SLfEEsklmsXUSSskPc4ylvEjb5waMQe
	 bQgI51rVwWO7E/mKJxjDFNYk5SXf74Z7N3ufZV9VQtVhSzsVOBZHr8i4Any2jZ1G1X
	 OXaK8JTGHiawnkAWhJdTeS40uCyPhHcLn/um6hYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48B29F804AD;
	Wed, 24 Nov 2021 08:05:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3198EF804AB; Tue, 23 Nov 2021 17:25:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD2B2F80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD2B2F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.b="pVszpNUK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=YDWHeWKgv4r/9Wehkw2ZJglZ0nE6CAjALsQ8jZXrdcM=; 
 t=1637684699; x=1638894299; b=pVszpNUKolBwNWXaTC3vb4fqzU7kMotJOzGxEvOKA8Ex8ap
 H7tId4ajmAutTkgkGxNApV1/5CiPP9EWavuuxo0FGM4jmFm/FmMzibof5Vh9RIREVRR4+cUjdtApz
 O0ZxuWg3BlwWAVElYTUgpsjhEzWgkhb9grpqoE48OnmnmvOrAyragyP+/hQFgYRuNJW3zPL3wNpBZ
 IAoFIqmtmai2vQZdQXB0asS4zNNd7gf7qMBjyGvXHqeE1Plr/LppBuFgcOX/NpFNhVfiZN8HfXc3c
 2y4GCgzK6My8E9NkaAUc/rxD+gKCTPPYm+uQ9k1bn8QI8hEvzIOOzFTDd+93tkEg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mpYaf-001olr-5U; Tue, 23 Nov 2021 17:24:17 +0100
Message-ID: <637a4183861a1f2cdab52b7652bfa7ed33fbcdd2.camel@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>
Date: Tue, 23 Nov 2021 17:24:15 +0100
In-Reply-To: <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
 <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
 <20211122171739.03848154@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMuHMdWAAGrQUZN18cnDTDUUhuPNTZTFkRMe2Sbf+s7CedPSxA@mail.gmail.com>
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
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Joel Stanley <joel@jms.id.au>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
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

On Tue, 2021-11-23 at 09:36 +0100, Geert Uytterhoeven wrote:


Ah, here's your comment wrt. which one is nicer :)

> > > We have the upper-case (constant) versions, and already
> > > {u32,...}_get_bits()/etc.
> 
> TBH, I don't like the *_get_bits() API: in general, u32_get_bits() does
> the same as FIELD_GET(), but the order of the parameters is different?

I don't really see how "the order of parameters is different" is a
downside? Yeah it means if you're used to FIELD_GET() then you'll
retrain, but ...?

> (*_replace_bits() seems to be useful, though)

Indeed.

Also as I said in my other mail, the le32/be32/... variants are
tremendously useful, and they fundamentally cannot be expressed with the
FIELD_GET() or field_get() macros. IMHO this is a clear advantage to the
typed versions, and if you ask me we should get rid of the FIELD_GETand
FIELD_PREP entirely - difficult now, but at least let's not propagate
that?

johannes
