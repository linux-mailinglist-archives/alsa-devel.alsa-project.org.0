Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF7771C1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 20:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37AA720D0;
	Fri, 26 Jul 2019 20:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37AA720D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564167586;
	bh=F+Nx3s1656zb71k4bSPTwyZv4X+1UgbGrFsn60OHZT8=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p1HAXJtUNujnDVfO7K/O06oC1Mt++nFR9A1mlmjlhXT3mYH+VLuT8E63G5zQWxvIS
	 lKx+s5nz8/KTAIB8iqzfmOQ/GRbiRYBMlOORwXHK37zm6eifebGO28f74pEDPUepk1
	 y8Q1HHRkItb8HfXAp6vq2JThwLmcO72G42Fa/1U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2217DF800E8;
	Fri, 26 Jul 2019 20:58:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73682F80393; Fri, 26 Jul 2019 20:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A83D6F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 20:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83D6F800E8
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8D5D2240009;
 Fri, 26 Jul 2019 18:57:43 +0000 (UTC)
Date: Fri, 26 Jul 2019 20:57:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20190726205742.71210c24@xps13>
In-Reply-To: <20190725220215.460-8-paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-8-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Artur Rojek <contact@artur-rojek.eu>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 07/11] mtd: rawnand: Drop obsolete JZ4740
	NAND driver
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

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBU
aHUsIDI1IEp1bCAyMDE5IDE4OjAyOjExCi0wNDAwOgoKPiBJdCBoYXMgYmVlbiByZXBsYWNlZCB3
aXRoIHRoZSBuZXdlciBJbmdlbmljIE5BTkQgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IFRlc3RlZC1ieTogQXJ0dXIgUm9q
ZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4gLS0tCgpBY2tlZC1ieTogTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
