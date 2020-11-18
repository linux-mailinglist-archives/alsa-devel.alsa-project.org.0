Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6782B75DC
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 06:28:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CBDE1655;
	Wed, 18 Nov 2020 06:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CBDE1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605677283;
	bh=feaWGkTA0pDN4xL1xb59wAcryyZv9HU/J1oPsDG2QIk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hRejyNTGOmLs2TZoPM0YdpXasz9yJTXGgAvLwo61RvLG9LIQ926CysovZ84g+7CYv
	 iZt7Cs6XPah5kPkrB5/5Itnvtp6uxl0fviGXGOd+reIws4MLDDzPTQAtSRznFGmZ5b
	 QGu9xsCHn49HkAgUQrzUbty7Bnq5TuJbK+0q4P78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45223F8016D;
	Wed, 18 Nov 2020 06:26:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E8BF8016C; Wed, 18 Nov 2020 06:26:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 7F554F800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 06:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F554F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="Wz8NRaFh"
X-UUID: dff173429cf944bf885c6e4eb8117996-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=feaWGkTA0pDN4xL1xb59wAcryyZv9HU/J1oPsDG2QIk=; 
 b=Wz8NRaFhXXrYtiAhdjwOe8ysvLqJwGDbbo7+uUyk23LOv22VH9Y0qWseR1WOmF1tghWMAScC0eFlYuJhY+jwZLXWM8NVQ7g26jzl/VKZCy4qiIdZRa0ZP4ihsAfiH6buMj6OJXwxtJ8EunYd65MTu3DGs83Us3XQ7RwXJqs06FY=;
X-UUID: dff173429cf944bf885c6e4eb8117996-20201118
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1957854605; Wed, 18 Nov 2020 13:26:08 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 13:26:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 13:26:07 +0800
Message-ID: <1605677166.23663.4.camel@mtkswgap22>
Subject: Re: [PATCH v3] ALSA: usb-audio: disable 96khz support for HUAWEI
 USB-C HEADSET
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.com>
Date: Wed, 18 Nov 2020 13:26:06 +0800
In-Reply-To: <1604999048-20294-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604996266.2817.1.camel@mtkswgap22>
 <1604999048-20294-1-git-send-email-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Christopher Swenson <swenson@swenson.io>, Macpaul Lin <macpaul@gmail.com>,
 Eddie Hung =?UTF-8?Q?=28=E6=B4=AA=E6=AD=A3=E9=91=AB=29?=
 <Eddie.Hung@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Chunfeng Yun =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?=
 <Chunfeng.Yun@mediatek.com>, Alexander Tsoy <alexander@tsoy.me>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nicola Lunghi <nick83ola@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ainge Hsu =?UTF-8?Q?=28=E5=BE=90=E5=B7=A7=E5=AE=9C=29?=
 <ainge.hsu@mediatek.com>
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

T24gVHVlLCAyMDIwLTExLTEwIGF0IDE3OjA0ICswODAwLCBNYWNwYXVsIExpbiB3cm90ZToNCj4g
VGhlIEhVQVdFSSBVU0ItQyBoZWFkc2V0IChWSUQ6MHgxMmQxLCBQSUQ6MHgzYTA3KSByZXBvcnRl
ZCBpdCBzdXBwb3J0cw0KPiA5Nmtoei4gSG93ZXZlciB0aGVyZSB3aWxsIGJlIHNvbWUgcmFuZG9t
IGlzc3VlIHVuZGVyIDk2a2h6Lg0KPiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhbnkgYWx0ZXJuYXRl
IHNldHRpbmcgY291bGQgYmUgYXBwbGllZC4NCj4gSGVuY2UgNDhraHogaXMgc3VnZ2VzdGVkIHRv
IGJlIGFwcGxpZWQgYXQgdGhpcyBtb21lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYWNwYXVs
IExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBFZGRpZSBI
dW5nIDxlZGRpZS5odW5nQG1lZGlhdGVrLmNvbT4NCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gLS0tDQo+IENoYW5nZXMgZm9yIHYyOg0KPiAgIC0gRml4IGJ1aWxkIGVycm9yLg0KPiAg
IC0gQWRkIENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IENoYW5nZXMgZm9yIHYzOg0KPiAg
IC0gUmVwbGFjZSAidWRldiIgd2l0aCAiY2hpcC0+ZGV2IiBhY2NvcmRpbmcgdG8gVGFrYXNoaSdz
IHN1Z2dlc3Rpb24uIFRoYW5rcy4NCj4gDQo+ICBzb3VuZC91c2IvZm9ybWF0LmMgfCAgICA1ICsr
KysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvc291bmQvdXNiL2Zvcm1hdC5jIGIvc291bmQvdXNiL2Zvcm1hdC5jDQo+IGluZGV4IDFiMjhk
MDEuLjBhZmY3NzQgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3VzYi9mb3JtYXQuYw0KPiArKysgYi9z
b3VuZC91c2IvZm9ybWF0LmMNCj4gQEAgLTIxNyw2ICsyMTcsMTEgQEAgc3RhdGljIGludCBwYXJz
ZV9hdWRpb19mb3JtYXRfcmF0ZXNfdjEoc3RydWN0IHNuZF91c2JfYXVkaW8gKmNoaXAsIHN0cnVj
dCBhdWRpb2YNCj4gIAkJCSAgICAoY2hpcC0+dXNiX2lkID09IFVTQl9JRCgweDA0MWUsIDB4NDA2
NCkgfHwNCj4gIAkJCSAgICAgY2hpcC0+dXNiX2lkID09IFVTQl9JRCgweDA0MWUsIDB4NDA2OCkp
KQ0KPiAgCQkJCXJhdGUgPSA4MDAwOw0KPiArCQkJLyogSHVhd2VpIGhlYWRzZXQgY2FuJ3Qgc3Vw
cG9ydCA5NmtIeiBmdWxseSAqLw0KPiArCQkJaWYgKHJhdGUgPT0gOTYwMDAgJiYNCj4gKwkJCSAg
ICBjaGlwLT51c2JfaWQgPT0gVVNCX0lEKDB4MTJkMSwgMHgzYTA3KSAmJg0KPiArCQkJICAgIGxl
MTZfdG9fY3B1KGNoaXAtPmRldi0+ZGVzY3JpcHRvci5iY2REZXZpY2UpID09IDB4NDkpDQo+ICsJ
CQkJY29udGludWU7DQo+ICANCj4gIAkJCWZwLT5yYXRlX3RhYmxlW2ZwLT5ucl9yYXRlc10gPSBy
YXRlOw0KPiAgCQkJaWYgKCFmcC0+cmF0ZV9taW4gfHwgcmF0ZSA8IGZwLT5yYXRlX21pbikNCg0K
U29ycnkgZm9yIGJvdGhlcmluZyBhZ2FpbiwgcGxlYXNlIGhvbGQtb24gdGhpcyBwYXRjaC4NCkkn
bSBzdGlsbCB0cnlpbmcgdG8gY2xhcmlmeSBpZiB0aGVyZSBpcyBhbm90aGVyIGFwcHJvYWNoIGZv
ciB0aGlzDQppbnRlcm9wZXJhYmlsaXR5IGlzc3VlLg0KSSdsbCB1cGRhdGUgdGhpcyB0aHJlYWQg
b25jZSB0aGUgcmVzdWx0IGhhcyBjYW1lIG91dC4NCg0KVGhhbmtzDQpNYWNwYXVsIExpbg0K

