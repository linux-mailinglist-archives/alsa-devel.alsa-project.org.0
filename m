Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811836BBBB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 13:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2AE8167A;
	Wed, 17 Jul 2019 13:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2AE8167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563363969;
	bh=inmpXYwNkb90AJHMkHSkdOnj0anuCyDRYx7AaRF38sk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9T5dU/xBaBgpe+QCpu9YHcA0UYdkSbW6YN6GHQXtD/ZaVpca1FmTN2ozuanK/v9Y
	 ZnNo5UCSD7uQc7uL1n/AvXO2KU8slODK1xVhgqSg76sKedR6Rwcwq3WlRn1+E6+i8z
	 x5shZIPF3vGBms27lqSj6+g/H9AJSoz0RMwJf054=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD943F800C4;
	Wed, 17 Jul 2019 13:44:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43725F800C4; Wed, 17 Jul 2019 13:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D69AF800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 13:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D69AF800C4
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hniM5-0004z2-Dw; Wed, 17 Jul 2019 13:44:17 +0200
Message-ID: <1563363856.2676.14.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 17 Jul 2019 13:44:16 +0200
In-Reply-To: <20190717110632.GA4459@sirena.org.uk>
References: <20190717105156.15721-1-l.stach@pengutronix.de>
 <20190717110632.GA4459@sirena.org.uk>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: mark regmap as fast_io
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

QW0gTWl0dHdvY2gsIGRlbiAxNy4wNy4yMDE5LCAxMjowNiArMDEwMCBzY2hyaWViIE1hcmsgQnJv
d246Cj4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTI6NTE6NTZQTSArMDIwMCwgTHVjYXMgU3Rh
Y2ggd3JvdGU6Cj4gCj4gPiBUaGUgcmVnbWFwIGlzIG9ubHkgZXZlciB1c2VkIHRvIGFjY2VzcyBN
TUlPIHJlZ2lzdGVycywgc28gaXQncyBmYWlyCj4gPiB0byBzYXkgdGhhdCByZWdpc3RlciBhY2Nl
c3MgaXMgZmFzdC4KPiAKPiBBcmUgeW91IHN1cmUgdGhlcmUncyBubyBjYWNoZXMgdGhhdCB0cnkg
dG8gZG8gYWxsb2NhdGlvbnMgYXQKPiBydW50aW1lP8KgwqBUaGUgbWFpbiB0aGluZyBmYXN0X2lv
IGRvZXMgaXMgY2hhbmdlIHRoZSBsb2NraW5nIHRvCj4gc3BpbmxvY2tzIHdoaWNoIG1lYW5zIHdl
IHNob3VsZG4ndCBkbyBhbnkgYWxsb2NhdGlvbnMgdW5kZXIgbG9jaywKPiBzdWNoIGFzIHdoZW4g
dXBkYXRpbmcgdGhlIGNhY2hlLgoKVGhpcyBkcml2ZXIgaXMgdXNpbmcgUkVHQ0FDSEVfRkxBVCwg
d2hpY2ggZG9lcyBpdHMgc29sZSBhbGxvY2F0aW9uIG9uCmluaXQgYW5kIG5vbmUgYXQgcmVnIGFj
Y2VzcyB0aW1lIEFGQUlDUy4gU28gdGhpcyBzaG91bGQgYmUgb2theS4KClJlZ2FyZHMsCkx1Y2Fz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
