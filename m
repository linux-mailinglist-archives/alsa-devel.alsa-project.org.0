Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7413459E1E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:33:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49BBA16E9;
	Tue, 23 Nov 2021 09:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49BBA16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656400;
	bh=b2PYjqn44UtPoTvXpYUvaFyZcOITEY4JwHD9z1V+VIY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EixZY0dcPA8YCXY6RPey9J1GFfoN69q+ZdLPOeIU9qU+EIWY6xfBGidlLhPdSSgDm
	 zdNr8tLqsSKl7aBYsKZ0hCxkzVafuzYICyYxbZfR6xv1BH18Qa1Bjg1ed88avLdob4
	 ZkjtN5dk8ZuIB4SFjP2JiX1BPkuL8xA9jqiQorSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF09AF805F3;
	Tue, 23 Nov 2021 09:22:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BD72F80212; Mon, 22 Nov 2021 17:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2150CF800E7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 17:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2150CF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.b="vQmJL1Hb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=kqBhSMWa3sOnZM39EObYBhGUKcC3oHWInrKZjV+i2aU=; 
 t=1637598883; x=1638808483; b=vQmJL1Hb+6jlzj8nLpLjdZk7DMRevR0ec6cMv57YxMsSxwk
 kzOb2q7wC50mLK81ofx94B6XwLpCus1rtiPQ/kw6hNQUOp7OtNvR7USgIrsWvAoHapGoM4WXi85AF
 lVddrBVnyGxDCaUn52EhdV0IkSnaeUwSLdC3kFnpsEWbBNElNIhtLUsKox+e6kciwAUMYfaPxuvOp
 0Uq3IiuQqq2RddqF/pb+bIm6+UT3eKLc87E/TJ7r3PbDPfyDmOJcliVEvlGNtR4klTzGNhmmODDx9
 UZQDO5cYEO7os7O6Ao/UsgSFdIlcJS6kiEUZBxiMbPdtcpuJdgdrRcVKmVz2phTg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mpCFL-001MvE-3o; Mon, 22 Nov 2021 17:32:47 +0100
Message-ID: <01b44b38c087c151171f8d45a2090474c2559306.camel@sipsolutions.net>
Subject: Re: [PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
 helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Rajendra Nayak
 <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Ludovic Desroches
 <ludovic.desroches@microchip.com>, Tero Kristo <kristo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Benoit Parrot
 <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,  Ulf Hansson
 <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>, Ping-Ke Shih
 <pkshih@realtek.com>,  Kalle Valo <kvalo@codeaurora.org>, "David S .
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, "Rafael
 J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Date: Mon, 22 Nov 2021 17:32:43 +0100
In-Reply-To: <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
References: <cover.1637592133.git.geert+renesas@glider.be>
 <3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:58 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On Mon, 2021-11-22 at 16:53 +0100, Geert Uytterhoeven wrote:
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> 

I'm not sure it's really a good idea to add a third API here?

We have the upper-case (constant) versions, and already
{u32,...}_get_bits()/etc.

Also, you're using __ffs(), which doesn't work for 64-bit on 32-bit
architectures (afaict), so that seems a bit awkward.

Maybe we can make {u32,...}_get_bits() be doing compile-time only checks
if it is indeed a constant? The __field_overflow() usage is already only
done if __builtin_constant_p(v), so I guess we can do the same with
__bad_mask()?

johannes
