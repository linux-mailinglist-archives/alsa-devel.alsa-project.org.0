Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AABE05C5
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 16:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7B56166E;
	Tue, 22 Oct 2019 16:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7B56166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571753000;
	bh=gq3E2Fukby9mER33nU9dAz3x17Jppk2840Itgtf5W3s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDzPihPJR3PwVrfCYZbbl/JtLuX7uEp0Tm7Zhmif3WEkvTzVPZFLifElpsPyTRxj4
	 +qLLhv7vz+7w4MnhQhM52HEiiEhXm8fJvyuYg7XUfDub4yHanQ9mPQRagtKFADCpBY
	 F7l+xQfHSBcFBDAdflThzdN32Pv4DqeGrXi16zLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A40CF80322;
	Tue, 22 Oct 2019 16:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B73FF8031A; Tue, 22 Oct 2019 16:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92CEBF80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 16:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92CEBF80112
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MgNpJ-1ho8bG3LMF-00huHk for <alsa-devel@alsa-project.org>; Tue, 22 Oct
 2019 16:01:29 +0200
Received: by mail-qk1-f173.google.com with SMTP id u22so16287435qkk.11
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 07:01:29 -0700 (PDT)
X-Gm-Message-State: APjAAAXl1+tWEK+HPdakRYQ86jR++vNdmpoTIUTgCKh30B2hhftN0aNt
 cfzEcYER6O+8K0D0a8afT6Y7aA3DScrO7RrO1yg=
X-Google-Smtp-Source: APXvYqzNJSBsmzArUiJoxHmomaDqQtkgb7eiZl33ieH3Pnwwm1/FZ2lXqT+Z19UoP0NfH21IBu5WdckCCzmNgI5QFYQ=
X-Received: by 2002:a37:a50f:: with SMTP id o15mr1985123qke.3.1571752888552;
 Tue, 22 Oct 2019 07:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-11-arnd@arndb.de>
 <20191011055149.4dudr4tk2znpt65u@pengutronix.de>
In-Reply-To: <20191011055149.4dudr4tk2znpt65u@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 22 Oct 2019 16:01:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1st8gR7u+8-oyP6HrzZdmrzhq7PRonYuz0a5O8rfKaSA@mail.gmail.com>
Message-ID: <CAK8P3a1st8gR7u+8-oyP6HrzZdmrzhq7PRonYuz0a5O8rfKaSA@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Provags-ID: V03:K1:moo5tP6TcQrfSQ8DR9JcpVJRu0+Qm5gdJXjXNbKEiP89vIcM/gI
 AjFQmd+GHo6TX6OVeSlZPJeOX9/gT3MgOcQYXcfBXopESeDp5WA1pacbKIKYkKZN+qz5Axl
 VMLCIb905sktwgH72I9qvH/beI6Ja9s4cOd+JRJESUA59ofV62jrDcqDS7P4bJCoBjm3I+X
 HGuKdo3cuX4nCn71karSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8ALXOrhz5jg=:RpMOI2ZKMFklILrNQyWxD6
 NcItQlZsjy3dAvOnv5jAeiwNOrr9GShhYvsM/gGw0vZDRV7b7Y9JVlKbebqoBfH5loJJvx/7K
 dKkz7HgZXlLrhoXjaPLGhKZ+QYMT3aoAaRhd4PRlVCQ7y92W/kHSmcw46eX0u8QC2OpH2UrYb
 QhNIkFnEv3/jxqphnwYCqyG0jfdllK9rqVjJeS5475agB3ORhlJI6vBtSBy/QjB6xgdtMsFIs
 EZNSPGzY6B2qIwPRyyvIEyNBFq2X+Zj5WGEl++n6R6gr6kwxU9VVMWe1aOROazu0nftQ81X/k
 9sJ/jrGB7M5jP00U64KkuUIMujLVX1TrikIql1oCOWt/KmW1Al9gwDvhXhZ4B8FmyBf+yakg5
 iGgN3i801wqHO8T4I8ryOfy0lNQ/bhO8Ezr86/MjCNqZWi4UpEApNOxreWVW60hd9cP11YmmQ
 gLUgysYk4cMGP7iaMDrK3PNo0Ow1Rv7ljAcHukPJ40RO9ecjvuqnpVMERQbytQxGONZq5N5ou
 L/cLcqZQejS0HcO5W6Bb2nR/pvxdiTDIJElqBltef3bPoUI1A0dWemJKgJsyOYU5vNwmReDKs
 UhWrrJibwAj+D00+5pskpq+YYOb5V8+4/5CfPdoDjKpGloKxDhjlJS5jHN0tfjzra98ruzSMa
 wmXDuR9JACTQpybbE9+A9dRQvpqz4lJ6NHR/MTOfIY/4QLoi0Re1CXA3+bB178LnUYwAnN67t
 gw6meMwvO4FeSaRU4mx5G59WOagCk9omYzBzAmGB0HTZcNNzqqQE4P66PeaqvAJaH+CCb78kN
 B+mq9UMKax/dm3E6A1EANYNqDepj3TmQs7uOZVCAnrsph00I4VCFN9pCHkn3wuUdpPUW9WytO
 2egGHseRRNhRsnFXo1og==
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-spi <linux-spi@vger.kernel.org>, Faiz Abbas <faiz_abbas@ti.com>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH 11/36] ARM: s5pv210: split from plat-samsung
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNzo1MSBBTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5
IGF0IDEwOjI5OjU1UE0gKzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBUaGVzZSBjYW4g
YmUgYnVpbGQgY29tcGxldGVseSBpbmRlcGVuZGVudGx5LCBzbyBzcGxpdAo+ID4gdGhlIHR3byBL
Y29uZmlnIHN5bWJvbHMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KPgo+IEknZCBtZW50aW9uIHRoZSB0d28gc3ltYm9scycgbmFtZXMgeW91J3Jl
IHdvcmtpbmcgb24gaW4gdGhlIGNvbW1pdCBsb2cuCj4gSSBndWVzcyBpdCdzIGFib3V0IFBMQVRf
U0FNU1VORyBhbmQgQVJDSF9TNVBWMjEwLiBBbmQgSSB3b3VsZG4ndCBjYWxsIGl0Cj4gInNwbGl0
IiB3aGljaCBJTUhPIHN1Z2dlc3RzIHRoZXJlIHdhcyBvbmx5IG9uZSBzeW1ib2wgYmVmb3JlLgo+
Cj4gTWF5YmU6Cj4KPiAgICAgICAgIERvbid0IGltcGx5IFBMQVRfU0FNU1VORyBpZiBBUkNIX1M1
UFYyMTAgaXMgZW5hYmxlZAo+Cj4gd291bGQgYmUgYSBiZXR0ZXIgc3ViamVjdCBsaW5lPwoKT2ss
IGNoYW5nZWQgdG8KCkFSTTogczVwdjIxMDogZG9uJ3QgaW1wbHkgQ09ORklHX1BMQVRfU0FNU1VO
RwoKPiA+IEBAIC0yMzUsNyArMjM1LDYgQEAgbWFjaGluZS0kKENPTkZJR19QTEFUX1NQRUFSKSAg
ICAgICAgICAgICAgKz0gc3BlYXIKPiA+ICAjIGJ5IENPTkZJR18qIG1hY3JvIG5hbWUuCj4gPiAg
cGxhdC0kKENPTkZJR19BUkNIX09NQVApICAgICArPSBvbWFwCj4gPiAgcGxhdC0kKENPTkZJR19B
UkNIX1MzQzY0WFgpICArPSBzYW1zdW5nCj4gPiAtcGxhdC0kKENPTkZJR19BUkNIX1M1UFYyMTAp
ICArPSBzYW1zdW5nCj4KPiBXb3VsZCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gbWFrZSB0aGlzCj4K
PiAgICAgICAgIHBsYXQtJChQTEFUX1NBTVNVTkcpICs9IHNhbXN1bmcKPgo+IChpbiBhIHNlcGFy
YXRlIHBhdGNoKT8gSG1tLCBpdCBzZWVtcyB0aGVyZSBpcyBubyBwbGF0LXkgZm9yCj4gUExBVF9T
M0MyNFhYPXkgYnVpbGRzLiBJcyB0aGlzIGludGVuZGVkPyBJZiB5ZXMsIHRoZSBkaXJlY3Rvcnkg
bmFtZQo+IGNvbnRhaW5pbmcgInNhbXN1bmciIHN1Z2dlc3RzIHNvbWV0aGluZyB0aGF0IHNlZW1z
IHVudHJ1ZS4KCkJ5IHRoZSBlbmQgb2YgdGhlIHNlcmllcywgdGhlIHBsYXQtc2Ftc3VuZyBkaXJl
Y3RvcnkgaXMgY29tcGxldGVseQpyZW1vdmVkIChmb2xkZWQgaW50byBtYWNoLXMzYyksIHNvIHRo
YXQgd291bGQgb25seSBhZGQgbW9yZQpjaHVybiBmb3IgdGhlIHNhbWUgcmVzdWx0IEkgdGhpbmsu
CgogICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
