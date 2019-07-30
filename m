Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51E7A656
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 12:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EFE317AB;
	Tue, 30 Jul 2019 12:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EFE317AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564484264;
	bh=quIwpH5RmQBVa3ZAKt+3UN73sCDLgQwGd7JTRfn5M8w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pko1YvBj20WiVFpc7TZaMMq7UC/qBJTRlREJGTn0R61jZM/mKRiLJjhns8cOpH3UJ
	 jBZkTGYCRSppPt+wPhn/I8d0ky5at67IBv7OARJcHdiHAucpL/AgzoMae/welzeOuD
	 Nkh7iFPPNghpFLEYSXFTr8R0kUcafwbrZEztpA/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C286F804CC;
	Tue, 30 Jul 2019 12:55:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4C36F804CA; Tue, 30 Jul 2019 12:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bitmer.com (50-87-157-213.static.tentacle.fi [213.157.87.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5569EF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 12:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5569EF800BF
Received: from jarkko by bitmer.com with local (Exim 4.84_2)
 (envelope-from <jarkko.nikula@bitmer.com>)
 id 1hsPmy-0007As-Rj; Tue, 30 Jul 2019 13:55:28 +0300
Date: Tue, 30 Jul 2019 13:55:28 +0300
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <20190730105528.GA27548@bitmer.com>
References: <20190729221534.GA18696@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729221534.GA18696@embeddedor>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Mark expected switch
	fall-throughs
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

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDU6MTU6MzRQTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBNYXJrIHN3aXRjaCBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRv
IGZhbGwgdGhyb3VnaC4KPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2Fybmlu
ZyAoQnVpbGRpbmc6IGFybSk6Cj4gCj4gc291bmQvc29jL3RpL244MTAuYzogSW4gZnVuY3Rpb24g
4oCYbjgxMF9leHRfY29udHJvbOKAmToKPiBzb3VuZC9zb2MvdGkvbjgxMC5jOjQ4OjEwOiB3YXJu
aW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJv
dWdoPV0KPiAgICBsaW5lMWwgPSAxOwo+ICAgIH5+fn5+fn5efn4KPiBzb3VuZC9zb2MvdGkvbjgx
MC5jOjQ5OjI6IG5vdGU6IGhlcmUKPiAgIGNhc2UgTjgxMF9KQUNLX0hQOgo+ICAgXn5+fgo+IAo+
IHNvdW5kL3NvYy90aS9yeDUxLmM6IEluIGZ1bmN0aW9uIOKAmHJ4NTFfZXh0X2NvbnRyb2zigJk6
Cj4gc291bmQvc29jL3RpL3J4NTEuYzo1Nzo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkg
ZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICBocyA9IDE7Cj4gICAg
fn5+Xn5+Cj4gc291bmQvc29jL3RpL3J4NTEuYzo1ODoyOiBub3RlOiBoZXJlCj4gICBjYXNlIFJY
NTFfSkFDS19IUDoKPiAgIF5+fn4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNp
bHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2MvdGkvbjgxMC5j
IHwgMSArCj4gIHNvdW5kL3NvYy90aS9yeDUxLmMgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPiAKQWNrZWQtYnk6IEphcmtrbyBOaWt1bGEgPGphcmtrby5uaWt1bGFA
Yml0bWVyLmNvbT4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
