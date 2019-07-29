Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FE8792DC
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 20:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A820180C;
	Mon, 29 Jul 2019 20:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A820180C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564423872;
	bh=d8X/qS/I5n14uIVIyjP+jJBsiddSIwyvE9YEnVoYT2A=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWCEnzjozporuQ2/rQ+MU5FLXpNC1BSCudTzYxXoD1Qwkd/netqXe8AglM0WoXOXJ
	 qNUNHplid31WaWzQhO8806igf1AIE7NrkSVIn6NLbBF1/kBcqgnPGbLkCNifGkumtn
	 H4Bg6u+a7yInK4riyJjWD6q4Th0Dd5F+VEytR7A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75ABFF8049A;
	Mon, 29 Jul 2019 20:08:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A932BF8048F; Mon, 29 Jul 2019 20:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31674F800E4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 20:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31674F800E4
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E832A60632C0;
 Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ehX5VuQgnl7G; Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 70E276083139;
 Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XjNoOe8nauWF; Mon, 29 Jul 2019 20:08:38 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D590B608311C;
 Mon, 29 Jul 2019 20:08:37 +0200 (CEST)
Date: Mon, 29 Jul 2019 20:08:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <339409106.53616.1564423717793.JavaMail.zimbra@nod.at>
In-Reply-To: <1564419921.1759.1@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <CAFLxGvyi0+0E3M12A7cRoHfEKd8-7Yr8EMG9J=2XcjCxPWY5pA@mail.gmail.com>
 <1564419921.1759.1@crapouillou.net>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: JZ4740 SoC cleanup
Thread-Index: pyW9XJwx/g8VXIVrZC/ODWU++joHAw==
Cc: Mark Rutland <mark.rutland@arm.com>,
 alsa-devel <alsa-devel@alsa-project.org>, James Hogan <jhogan@kernel.org>,
 linux-fbdev@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, od@zcrc.me,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 00/11] JZ4740 SoC cleanup
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBXYXMgdGhpcyBzZXJpZXMgdGVzdGVk
IHdpdGggdGhlIEJlbiBOYW5vbm90ZSBkZXZpY2U/Cj4+IEkgaGF2ZSBvbmUgb2YgdGhlc2UgYW5k
IGZyb20gdGltZSB0byB0aW1lIEkgdXBncmFkZSB0aGUga2VybmVsIG9uIGl0Lgo+IAo+IFllcyEg
QXJ0dXIgKENjJ2QpIHRlc3RlZCBpdC4KPiAKPiBZb3UgY2FuIHRlc3QgaXQgeW91cnNlbGYsIGFm
dGVyIG1lcmdpbmcgdGhpcyBwYXRjaHNldCB3aXRoOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Zrb3VsL3NsYXZlLWRtYS5naXQKPiBicmFuY2ggbmV4
dCwKPiBnaXQ6Ly9naXQuZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0tbWlzYyBicmFuY2ggZHJtLW1p
c2MtbmV4dC4KPiAKPiBUaGVzZSB3aWxsIGJlIGluIDUuNC1yYzEuCgpBd2Vzb21lISBUaGFua3Mg
YSBsb3QgZm9yIGNsZWFuaW5nIHRoaXMgdXAuCgpUaGFua3MsCi8vcmljaGFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
