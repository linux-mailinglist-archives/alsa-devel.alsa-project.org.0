Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D416F00DC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:12:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A28E16E4;
	Tue,  5 Nov 2019 16:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A28E16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572966735;
	bh=NFDdXbTsiVfxa4GWkxchIcw1VtNLe+7nHmlqQucaKOo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXrQoyaRmu641tCWyXHUyH+VoP5Lui78WxihhBVNrbwJ4e3kSsFO942zxGQ9qxGnP
	 8lxMzeJ930m/jEZgnU9h6Ux/4Ri2XAxqoMDjSOkhPv9Hmn20VwV7Uqygk4qJnzHR33
	 VsRCKHFSIa5cjJTLIICtg3EBlZ3JzonO6gvUk2rA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48443F80271;
	Tue,  5 Nov 2019 16:09:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0278AF8049B; Tue,  5 Nov 2019 15:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_28,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by alsa1.perex.cz (Postfix) with ESMTP id 79245F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79245F800F3
X-AuditID: c0a8fbf4-199ff70000001fa6-f6-5dc18068d8e7
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 CB.96.08102.86081CD5; Tue,  5 Nov 2019 15:00:08 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 15:00:02 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8bpwAgAAJlQCAAAReAIAABYEAgAABmgCAAAa5gA==
Date: Tue, 5 Nov 2019 14:00:02 +0000
Message-ID: <a967c764d135ab0f96f6b1df62ac91426c935b44.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
 <938a5ec7b41ae9ce7b0de83764d6b774cfdaa781.camel@fi.rohmeurope.com>
 <20191105133604.d2xcasxw7pwzwvh7@pengutronix.de>
In-Reply-To: <20191105133604.d2xcasxw7pwzwvh7@pengutronix.de>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <6A3BE4366B287B4BADDE281B8B369397@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf1AUZRjHfXff21uQ1fUAeSWbyRtnGplJo3HoqaGGpmlamaZsbBprYmiJ
 jWOCO7g7GKHBUGSUu1A0yvOEEwiKA5nkLqc8QOVCUfwBxK+IH0agAo2ggikg2i6Xwj/7fuf5
 Pp/n+/zxLEtr9rOhbKLeLBn1YpKW8cdnK+dcL+iyG2Ne7Ly8BmpHLiHobPdS4OlgIX/3YQqs
 tw/TUJN/DsN0cQuGzlwXgjP5v9EwO9GkhqGu98BZiKF3Vx0Fc63zNOyxl2Go+vYUhuvuYQoK
 H/5IgWu4WwU51VdpcB97iMAy66Shw1PEwNHyAxgGBqoQnByboMDSPaKCvGk7A6M1PSq4UH4P
 wZCzCENRxQUMjvkaFUyMbYfT7ssUTE2eUUHjzVsY2m2tNFw/4mZg/hcXhr3OTrmtegRB20wv
 BaM/h0C/260C2/E6BDMeB4a+g98gyJ+sYKBhcApFvSR07fWohRNTuxlh8o9ctWC/doURbHNl
 WPCcDRWsU15aOGUfUAvtd87TgqsqjxH6u+sZwXHxfcFd/pXQaitFQsHtW3L5QQXauvbj5ZFx
 ojl9W2KCftPrny7XzTviUhzaHWPWR1Q2Or7OgvxYwm8m+/pHsAX5sxq+C5HpygNYMTR8MyKF
 uRoLYlmGjySWXrUig/i3yJ47EUoHzf8TTH4YiFV0oNxxKacSKTqIf41UX3MzPv0h6bbfW9CY
 X09cubULPRz/Lqme7aN9sTcp8nvXPlox/GS45VzhwgqIf5bkZU9QvrAQ4rpxX+XbmSfl9a20
 TweTseFH/9e1pGFmCCt70vwG8pNnkw+NIoe+s2GfXkcKrUNq3w6ryMUjI7gArbYvSbAv0vYl
 tH0JbV9ClyBVFSLJYmJSgmiWwjcapbSNRoMuWX4+MyS7kO+yp39Fj71bvIhikRetYSltMBed
 2BijWRFniM/QiSZdrDEtSTJ5EWFpbRDXbmuI0XDxYkamZDQ8sZ5hsTaEe37oYIyGV7K+kKQU
 yfjEXcuyWsKlZ8pDVxmlBGnH54lJ5kWbYv2U4f6hQSZJHy8ZxTSzLlY5jliTfB2KFSDnwk4Z
 50wpYrJc9aEtKJwtGCsuo9mOHof8bSquKKM1WG/QS6EhXKQC8AqgS9M/jRtHISzSBnLdihsg
 /+RPp43LQZQc9M7waSXILC5aodmITSUf5KweHuzfJqwMLPn3r4hoW+TXSQEfpWYN2oLaVKNh
 pQ+yjnHNumzV1bvOyNm3N7/xiivs+7LzqT0VK0te/bt0GfrS8OZd7VRf+pUqKni/+9AnO63J
 NzZwpgZ1xorp5+IyT1jrI8azok/WSVsea5qP1vXc/9O/qbbI8/KuNvOyxigtNunE8DDaaBL/
 A4udmjChBAAA
X-Mailman-Approved-At: Tue, 05 Nov 2019 16:08:56 +0100
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
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

DQpPbiBUdWUsIDIwMTktMTEtMDUgYXQgMTQ6MzYgKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOg0KPiBPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAwMTozMDoyMFBNICswMDAwLCBWYWl0dGlu
ZW4sIE1hdHRpIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAxOS0xMS0wNSBhdCAxNDoxMCArMDEwMCwg
VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+ID4gPiBIZWxsbywNCj4gPiA+IA0KPiA+ID4gT24g
VHVlLCBOb3YgMDUsIDIwMTkgYXQgMTI6NTQ6NTVQTSArMDAwMCwgVmFpdHRpbmVuLCBNYXR0aSB3
cm90ZToNCj4gPiA+ID4gT24gVHVlLCAyMDE5LTExLTA1IGF0IDE0OjIwICswMjAwLCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6DQo+ID4gPiA+ID4gSSB3b3VsZCBhbHNvIGxpa2UgdG8gc2VlIGJsb2F0
LW8tbWV0ZXIgc3RhdGlzdGljcyBiZWZvcmUgYW5kDQo+ID4gPiA+ID4gYWZ0ZXINCj4gPiA+ID4g
PiB5b3VyIHBhdGNoLg0KPiA+ID4gPiA+IE15IGd1dHMgdGVsbCBtZSB0aGF0IHRoZSByZXN1bHQg
d2lsbCBiZSBub3QgaW4gdGhlIGZhdm91ciBvZg0KPiA+ID4gPiA+IHlvdXJzDQo+ID4gPiA+ID4g
c29sdXRpb24uDQo+ID4gPiA+IA0KPiA+ID4gPiBDYW4geW91IHBsZWFzZSB0ZWxsIG1lIHdoYXQg
dHlwZSBvZiBzdGF0cyB5b3UgaG9wZSB0byBzZWU/IEkNCj4gPiA+ID4gY2FuDQo+ID4gPiA+IHRy
eQ0KPiA+ID4gPiBnZW5lcmF0aW5nIHdoYXQgeW91IGFyZSBhZnRlci4gVGhlIGNvdmVyIGxldHRl
ciBjb250YWluZWQNCj4gPiA+ID4gdHlwaWNhbA0KPiA+ID4gPiArLy0NCj4gPiA+ID4gY2hhbmdl
IHN0YXRzIGZyb20gZ2l0IGFuZCBzdW1tYXJ5Og0KPiA+ID4gPiANCj4gPiA+ID4gNjIgZmlsZXMg
Y2hhbmdlZCwgMjI4IGluc2VydGlvbnMoKyksIDEwNCBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+
ID4gSSBndWVzcyBoZSB3YW50cyB0byBzZWUNCj4gPiA+IA0KPiA+ID4gCXNjcmlwdHMvYmxvYXQt
by1tZXRlciB2bWxpbnV6Lm9sZCB2bWxpbnV6DQo+ID4gPiANCj4gPiA+IC4gSSB3b3VsZCBleHBl
Y3QgYSAwIHRoZXJlLiBJIGRpZG4ndCBsb29rIGluIGRldGFpbCwgYnV0IGluDQo+ID4gPiBnZW5l
cmFsIEkNCj4gPiA+IGxpa2UgdGhlIGlkZWEgdG8gZ2l2ZSAwIGFuZCAxIGEgc3ltYm9saWMgbmFt
ZS4NCj4gPiANCj4gPiBUaGFua3MgVXdlLiBUaGlzIGZhciBJIGhhdmUgb25seSBjcm9zcy1jb21w
aWxlZCB0aGUgc2VyaWVzIGZvciBhcm0NCj4gPiB3aGljaCBJIHVzZSBmb3IgZGV2ZWxvcGluZyB0
aGUgUk9ITSBQTUlDcy4gc2NyaXB0cy9ibG9hdC1vLW1ldGVyIC8NCj4gPiB0b29scyBpdCB1c2Vz
IGRvZXMgbm90IHNlZW0gdG8gcmVjb2duaXplIHRoZSBpbWFnZSBmb3JtYXQgKG5vdCBhDQo+ID4g
YmlnDQo+ID4gc3VycHJpemUgYXMgbXkgaG9zdCBpcyB4ODZfNjQpLg0KPiANCj4gSXQgd29ya3Mg
Zm9yIG1lLCBJIGd1ZXNzIHRoYXQncyBiZWNhdXNlIG15IGJpbnV0aWxzIHN1cHBvcnQgc2V2ZXJh
bA0KPiBhcmNoaXRlY3R1cmVzOg0KPiANCj4gCSQgbm0gLS1oZWxwDQo+IAkuLi4NCj4gCW5tOiBz
dXBwb3J0ZWQgdGFyZ2V0czogZWxmNjQteDg2LTY0IGVsZjMyLWkzODYgZWxmMzItaWFtY3UNCj4g
ZWxmMzIteDg2LTY0DQo+IAlwZWktaTM4NiBwZWkteDg2LTY0IGVsZjY0LWwxb20gZWxmNjQtazFv
bSBlbGY2NC1saXR0bGUgZWxmNjQtDQo+IGJpZw0KPiAJZWxmMzItbGl0dGxlIGVsZjMyLWJpZyBl
bGY2NC1saXR0bGVhYXJjaDY0IGVsZjY0LWJpZ2FhcmNoNjQNCj4gCWVsZjMyLWxpdHRsZWFhcmNo
NjQgZWxmMzItYmlnYWFyY2g2NCBlbGYzMi1saXR0bGVhcm0gZWxmMzItDQo+IGJpZ2FybQ0KPiAJ
ZWxmNjQtYWxwaGEgZWNvZmYtbGl0dGxlYWxwaGEgZWxmMzItbGl0dGxlYXJtLWZkcGljIGVsZjMy
LQ0KPiBiaWdhcm0tZmRwaWMNCj4gCWVsZjMyLWhwcGEtbGludXggZWxmMzItaHBwYSBlbGY2NC1p
YTY0LWxpdHRsZSBlbGY2NC1pYTY0LWJpZw0KPiBwZWktaWE2NA0KPiAJZWxmMzItbTMyci1saW51
eCBlbGYzMi1tMzJybGUtbGludXggZWxmMzItbTY4ayBlbGYzMi0NCj4gdHJhZGJpZ21pcHMNCj4g
CWVsZjMyLXRyYWRsaXR0bGVtaXBzIGVjb2ZmLWJpZ21pcHMgZWNvZmYtbGl0dGxlbWlwcyBlbGYz
Mi0NCj4gbnRyYWRiaWdtaXBzDQo+IAllbGY2NC10cmFkYmlnbWlwcyBlbGYzMi1udHJhZGxpdHRs
ZW1pcHMgZWxmNjQtdHJhZGxpdHRsZW1pcHMNCj4gCWVsZjMyLXBvd2VycGMgYWl4Y29mZi1yczYw
MDAgZWxmMzItcG93ZXJwY2xlIHBwY2Jvb3QgZWxmNjQtDQo+IHBvd2VycGMNCj4gCWVsZjY0LXBv
d2VycGNsZSBhaXhjb2ZmNjQtcnM2MDAwIGFpeDVjb2ZmNjQtcnM2MDAwIGVsZjY0LQ0KPiBsaXR0
bGVyaXNjdg0KPiAJZWxmMzItbGl0dGxlcmlzY3YgZWxmMzItczM5MCBlbGY2NC1zMzkwIGVsZjMy
LXNoLWxpbnV4IGVsZjMyLQ0KPiBzaGJpZy1saW51eA0KPiAJZWxmMzItc2gtZmRwaWMgZWxmMzIt
c2hiaWctZmRwaWMgZWxmMzItc3BhcmMgZWxmNjQtc3BhcmMgcGUtDQo+IHg4Ni02NA0KPiAJcGUt
Ymlnb2JqLXg4Ni02NCBwZS1pMzg2IHBsdWdpbiBzcmVjIHN5bWJvbHNyZWMgdmVyaWxvZyB0ZWto
ZXgNCj4gYmluYXJ5DQo+IAlpaGV4DQo+IA0KPiAoYWRkZWQgbGluZSBicmVha3MgZm9yIGVhc2ll
ciByZWFkaW5nKS4gSSBnb3QgdGhpcyBieSBpbnN0YWxsaW5nDQo+IGJpbnV0aWxzLW11bHRpYXJj
aCAob24gRGViaWFuKS4NCg0KVGhhbmtzIFV3ZSEgVGhhdCB3YXMga2luZCEgSSdtIG9uIEZlZG9y
YSBidXQgSSBndWVzcyBJIGNhbiBmaW5kIHRoZQ0KbXVsdGlhcmNoIGJpbnV0aWxzIDopIEknbGwg
dHJ5IHRoYXQgdG9tb3Jyb3cgd2hlbiBJJ20gYmFjayBhdCB0aGUNCm9mZmljZS4gTGV0J3Mgc2Vl
IHdoYXQga2luZCBvZiByZXN1bHRzIEkgY2FuIGdldCBmcm9tIGl0Lg0KDQpVbmZvcnR1bmF0ZWx5
IGJ1bmNoIG9mIHRoZSBHUElPcyBkZXBlbmQgb24geDg2IC0gc28gSSBuZWVkIHRvIHNlZSB3aGF0
DQpJIGNhbiBjb21waWxlIGluIHdpdGggZGVjZW50IGVmZm9ydC4gRm9yIG15IGNvbXBpbGUgdGVz
dCBJIGp1c3QgaGFja2VkDQp0aGUgTWFrZWZpbGUgdG8gZm9yY2UgYWxsIGluIGFuZCBhZGRlZCBz
b21lIGR1bW15IG1hY3JvcyB0byBmaXggZmV3DQptaXNzaW5nIGZ1bmN0aW9ucyA6fCBCdXQgSSBn
dWVzcyBJIGNhbiBnZXQgc29tZSByZXN1bHRzLg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVXdl
DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
