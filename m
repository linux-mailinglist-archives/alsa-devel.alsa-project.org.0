Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3AEFEE2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 14:43:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFCC1616;
	Tue,  5 Nov 2019 14:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFCC1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572961403;
	bh=4tEvCAJH4UWYsXN1f9p7daciBmUMccRnI7K0lAHS55E=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxA+iF4DoYXXLMJuZnddGgqGrp0ErCAyl4pVfa8d8zX0f8nkeQD0AC2LCXOqTTpvt
	 YCPka7wwptCJnyS8zHx+c+yF/FBbzIm46d739Utz+zo2uujC7IRoGDiXgl1RGCsLoC
	 mHFDL3fqSF7gZI5pBfmyKKhWaQoEoz6l9F+eo79Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 606B4F8064C;
	Tue,  5 Nov 2019 14:38:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0168F8049B; Tue,  5 Nov 2019 14:30:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_28,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by alsa1.perex.cz (Postfix) with ESMTP id A3BE6F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 14:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3BE6F800F3
X-AuditID: c0a8fbf4-199ff70000001fa6-89-5dc1797381a6
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 4F.56.08102.37971CD5; Tue,  5 Nov 2019 14:30:27 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 14:30:21 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8bpwAgAAJlQCAAAReAIAABYEA
Date: Tue, 5 Nov 2019 13:30:20 +0000
Message-ID: <938a5ec7b41ae9ce7b0de83764d6b774cfdaa781.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
In-Reply-To: <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <0E04C63BA3FE0D4784860575696D5A4B@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0xbZRjHfc+tB9aas8LsO5wfaJYYb5sYM58Pw8zE6dlinAuaTBNkZ3Kk
 RGjxtExQI7cR0pJGyDDrOmCMgFIQlXZmW4EBtW6MDQG5iY6xAhsD5ZayOMZlnkPd4Ms5//f5
 P7/n/57kOSypLWOj2GSjRZSMQoqeCadaa5YaXjBntsW/OBGIhobxqwj6enwEeHtZsOeeIKBw
 7gQJ9fZfKVgo66CgL9+NoMX+Cwn3Z/wqCPQfAFcJBUM5jQQsda2QcMxZSUHtNxcouOUZI6Bk
 +TsC3GMDNOTV/UaC5/QyAtt9Fwm93lIGTlV9TcHwcC2CnydnCLANjNNgXXAycKd+kIb2qrsI
 Aq5SCkqr2ykoX6mnYWbyEFz0XCMgONtCQ9vENAU9ji4Sbp30MLByzk1BgatPbqsbR9C9OETA
 nbM6uO7x0OD4vhHBorecgr+KjyOwz1Yz0HwjiPa8xPcXeFX8T8Fchp/9I1/FO0c6Gd6xVEnx
 3tYovjDoI/kLzmEV3zN/ieTdtVaGvz7QxPDlVw7ynqosvstxBvFFc9Ny+V41emfbB5t2HxEs
 R+OSk4w7Xz28yVBhDTBpteoMR/AulY2y1TYUxmLuZZx7xkrYUDir5foRXu7NoUOHywhfsroZ
 G2JZhtuNbUMqRUZye/Gx+V1KC8mVs9g/MEcrgx7jOjU4tzFL0RFy+9W8GqToSC4W1414mJB+
 A4+sVq9pituOe8/mr/VouLex/fgMFcqdRngpz71mhMnwROMPhKIR9xS2Zs+saZLTYfftf+nQ
 F3C4qqmLDOkteHJs9f+6HjcvBijl0iT3DP7RuzOE7sH+4BwV0tG4pDCgCt1hM75ycpwqQjrn
 hgTnOu3cQDs30M4NdAWiaxFOFZJTkgSLGLNDEtN3SCZDqvz6yJTqRqFFXziPHvj2+RDBIh/a
 yhL6LZr9yW3x2sePmBIzDYLZkCClp4hmH8IsqY/U9Dia47WaRCHzc1EyPbSeZCm9TvN0oDhe
 yylZn4himig9dLexrB5rfv9MHrpZEpPEjI+TUyzrNsGGKcPDoyLNojFRlIR0iyFB2ZUEs7ws
 iqWWc0czZFxjThNS5WoI7UAxbNFkWSXJ9g6Wy09/WXUlqaWMJqMYpdN8qACcAhjSjY/ippCO
 RfoIzT7FVcv//KNpU3IQIQe9NXZRCbII61ZUNmqRDjnb95+yqkef81d1ewriI85VfHEvVmd4
 3YUEWFb7Y/88anqtpTTsxvNxn+bBe51NB3Je8QzSyyXdb44GTk9JaXmXv9Tu6n9gDxbHRnfc
 3JvT8L6PL0pniieartX9o5W+3dpqmZ8TDifRWQd6DgaC+Y64r1w3/0554vy7ntWa23rKbBBi
 niUls/AfOlQk57AEAAA=
X-Mailman-Approved-At: Tue, 05 Nov 2019 14:38:15 +0100
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [alsa-devel] [PATCH 00/62] Add definition for GPIO direction
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

T24gVHVlLCAyMDE5LTExLTA1IGF0IDE0OjEwICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gSGVsbG8sDQo+IA0KPiBPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAxMjo1NDo1NVBNICsw
MDAwLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAxOS0xMS0wNSBhdCAx
NDoyMCArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gSSB3b3VsZCBhbHNvIGxp
a2UgdG8gc2VlIGJsb2F0LW8tbWV0ZXIgc3RhdGlzdGljcyBiZWZvcmUgYW5kDQo+ID4gPiBhZnRl
cg0KPiA+ID4geW91ciBwYXRjaC4NCj4gPiA+IE15IGd1dHMgdGVsbCBtZSB0aGF0IHRoZSByZXN1
bHQgd2lsbCBiZSBub3QgaW4gdGhlIGZhdm91ciBvZg0KPiA+ID4geW91cnMNCj4gPiA+IHNvbHV0
aW9uLg0KPiA+IA0KPiA+IENhbiB5b3UgcGxlYXNlIHRlbGwgbWUgd2hhdCB0eXBlIG9mIHN0YXRz
IHlvdSBob3BlIHRvIHNlZT8gSSBjYW4NCj4gPiB0cnkNCj4gPiBnZW5lcmF0aW5nIHdoYXQgeW91
IGFyZSBhZnRlci4gVGhlIGNvdmVyIGxldHRlciBjb250YWluZWQgdHlwaWNhbA0KPiA+ICsvLQ0K
PiA+IGNoYW5nZSBzdGF0cyBmcm9tIGdpdCBhbmQgc3VtbWFyeToNCj4gPiANCj4gPiA2MiBmaWxl
cyBjaGFuZ2VkLCAyMjggaW5zZXJ0aW9ucygrKSwgMTA0IGRlbGV0aW9ucygtKQ0KPiANCj4gSSBn
dWVzcyBoZSB3YW50cyB0byBzZWUNCj4gDQo+IAlzY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgdm1saW51
ei5vbGQgdm1saW51eg0KPiANCj4gLiBJIHdvdWxkIGV4cGVjdCBhIDAgdGhlcmUuIEkgZGlkbid0
IGxvb2sgaW4gZGV0YWlsLCBidXQgaW4gZ2VuZXJhbCBJDQo+IGxpa2UgdGhlIGlkZWEgdG8gZ2l2
ZSAwIGFuZCAxIGEgc3ltYm9saWMgbmFtZS4NCg0KVGhhbmtzIFV3ZS4gVGhpcyBmYXIgSSBoYXZl
IG9ubHkgY3Jvc3MtY29tcGlsZWQgdGhlIHNlcmllcyBmb3IgYXJtDQp3aGljaCBJIHVzZSBmb3Ig
ZGV2ZWxvcGluZyB0aGUgUk9ITSBQTUlDcy4gc2NyaXB0cy9ibG9hdC1vLW1ldGVyIC8NCnRvb2xz
IGl0IHVzZXMgZG9lcyBub3Qgc2VlbSB0byByZWNvZ25pemUgdGhlIGltYWdlIGZvcm1hdCAobm90
IGEgYmlnDQpzdXJwcml6ZSBhcyBteSBob3N0IGlzIHg4Nl82NCkuDQoNCkJyLA0KCU1hdHRpIFZh
aXR0aW5lbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
