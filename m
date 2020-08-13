Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42A243D15
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 18:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32803166A;
	Thu, 13 Aug 2020 18:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32803166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597335374;
	bh=OI2w0zxGU/a5MT+qrXCuXuPIjQEDPCiyv0ctdmKpaHw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DftgZTJFqBwlBFQyRw7F8/UhirsywfA1HPQWAp8D+HWEG2FDU/Zr5/21MahOQrPSu
	 ayDTGBQSZmT0wjHf3x3vSkIuot6rKau7ED0itKQix1baEiulWp0QqCq/CmUmyOUyso
	 ES0Z2q/RSXSRNm5N3g+EeDU/U0vcr98XgAuspfSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 378EAF8014C;
	Thu, 13 Aug 2020 18:14:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF3F6F8015B; Thu, 13 Aug 2020 18:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by alsa1.perex.cz (Postfix) with ESMTP id 75028F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 18:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75028F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="kp1AtVky"
X-UUID: b0b1ed1018204c9e9818be952cc602c3-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OI2w0zxGU/a5MT+qrXCuXuPIjQEDPCiyv0ctdmKpaHw=; 
 b=kp1AtVkyCMTzGUlxGE4L9ySB9d6uSPYV+7jhuhZyHYlav46UoxZD4rY16TrodrEBIvtELm2lu6y5ODc2y/SS5fYkrk+AwfpeJTGQUjtQnJIiMDXZ2LmHWyfaRvczKUTsfJ1rvV2tCRJkcFL3VwLWgHnv1PXxJYWoarWNbr3HVq0=;
X-UUID: b0b1ed1018204c9e9818be952cc602c3-20200813
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1030081908; Thu, 13 Aug 2020 23:40:57 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 13 Aug 2020 23:40:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 23:40:56 +0800
Message-ID: <1597333200.23246.68.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Aug 2020 23:40:00 +0800
In-Reply-To: <20200812120537.GA5545@sirena.org.uk>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200810185933.GI6438@sirena.org.uk>
 <1597217353.23246.45.camel@mhfsdcap03>
 <20200812120537.GA5545@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D514158544447E00469B94A50FFBB32CA73ED07B5A7FB226AF2A86D1D56A22B42000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

T24gV2VkLCAyMDIwLTA4LTEyIGF0IDEzOjA1ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIEF1ZyAxMiwgMjAyMCBhdCAwMzoyOToxM1BNICswODAwLCBKaWF4aW4gWXUgd3JvdGU6
DQo+ID4gT24gTW9uLCAyMDIwLTA4LTEwIGF0IDE5OjU5ICswMTAwLCBNYXJrIEJyb3duIHdyb3Rl
Og0KPiA+ID4gT24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgMTE6MDU6NTNBTSArMDgwMCwgSmlheGlu
IFl1IHdyb3RlOg0KPiANCj4gPiA+ID4gK3ZvaWQgbXQ2MzU5X3NldF9wbGF5YmFja19ncGlvKHN0
cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY21wbnQpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3Ry
dWN0IG10NjM1OV9wcml2ICpwcml2ID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY21w
bnQpOw0KPiANCj4gPiA+IFdoYXQgYXJlIHRoZXNlLCBzaG91bGQgdGhleSBub3QgYmUgbWFuYWdl
ZCB0aHJvdWdoIGdwaW9saWIgYW5kL29yDQo+ID4gPiBwaW5jdHJsPw0KPiANCj4gPiBUaGVzZSBh
cmUgdGhlIGZ1bmN0aW9ucyB0aGF0IGNvbnRyb2wgdGhlIG11eCBvZiBpbnB1dCBvciBvdXRwdXQN
Cj4gPiBzaWduYWwuIEkgcmVmZXIgdG8gdGhlIG90aGVyIGNvZGVjIGRyaXZlcnMsIG1vc3Qgb2Yg
dGhlbSBhcmUgbWFuaXB1bGF0ZQ0KPiA+IHRoZSByZWdzIGluIHRoZWlyIGNvZGVjIGRyaXZlcnMg
YWxzby4gTWF5YmUgaXQncyBlYXNpZXIgdG8gY29udHJvbD8NCj4gDQo+IFRoZXNlIGZ1bmN0aW9u
cyBhcmUgZXhwb3J0ZWQgZm9yIG90aGVyIGRyaXZlcnMgdG8gdXNlIHJhdGhlciB0aGFuDQo+IHNv
bWV0aGluZyBkb25lIGludGVybmFsbHkgYnkgdGhlIGRyaXZlciAtIGlmIHRoaXMgd2VyZSBpbnRl
cm5hbCB0byB0aGUNCj4gZHJpdmVyIGl0J2Qgbm90IGJlIGEgYmlnIGRlYWwgYnV0IHdoZW4gaXQn
cyBmb3IgdXNlIGJ5IGFub3RoZXIgZHJpdmVyDQo+IGl0J2QgYmUgYmV0dGVyIHRvIGdvIHRocm91
Z2ggc3RhbmRhcmQgaW50ZXJmYWNlcy4NCj4gDQoNCkNhbiB3ZSBtb3ZlIHRoaXMgcGFydCBvZiB0
aGUgb3BlcmF0aW9uIHRvIHRoZSBjb2RlYyBkYWkgZHJpdmVyIG9wcywgc3VjaA0KYXMgLnN0YXJ0
dXAgYW5kIC5zaHV0ZG93bj8gQmVjYXVzZSBvcmlnaW5hbGx5IHRoZXNlIGZ1bmN0aW9ucyBhcmUN
CmV4cG9ydGVkIHRvIG1hY2hpbmUgZHJpdmVyJ3MgZGFpX2xpbmsgLnN0YXJ0dXAgYW5kIC5zaHV0
ZG93biBvcHMuDQoNCj4gPiA+ID4gK2ludCBtdDYzNTlfbXRrYWlmX2NhbGlicmF0aW9uX2VuYWJs
ZShzdHJ1Y3Qgc25kX3NvY19wY21fcnVudGltZSAqcnRkKQ0KPiA+ID4gPiArew0KPiANCj4gPiA+
ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG10NjM1OV9tdGthaWZfY2FsaWJyYXRpb25fZW5hYmxlKTsN
Cj4gDQo+ID4gPiBXaHkgaXMgdGhpcyBleHBvcnRlZD8NCj4gDQo+ID4gVGhpcyBmdW5jdGlvbiBp
cyBleHBvcnRlZCB0byBtYWNoaW5lIGRyaXZlciB0byBkbyBjYWxpYnJhdGlvbiB3aGVuDQo+ID4g
cmVnaXN0ZXJpbmcuIFRoZSBpbnRlcmZhY2UgYmV0d2VlbiBNVDYzNTkgYW5kIE1USyBTb0MgaXMg
YSBzcGVjaWFsDQo+ID4gaW50ZXJmYWNlIHRoYXQgbmFtZWQgTVRLQUlGLiBUaGVyZWZvcmUsIGlm
IE1UNjM1OSBpcyB0byBiZSB1c2VkDQo+ID4gbm9ybWFsbHksIGl0IG5lZWRzIHRvIHJlbHkgb24g
dGhlIHBsYXRmb3JtIGZvciBjYWxpYnJhdGlvbiB3aGVuDQo+ID4gcmVnaXN0ZXJpbmcuDQo+IA0K
PiBTbyB0aGlzIG5lZWRzIHRoZSBTb0MgdG8gZG8gc29tZXRoaW5nIGFzIHBhcnQgb2YgY2FsbGli
cmF0aW9uPw0KPiANCg0KWWVzLCB0aGUgc2lkZSBvZiBNVEtBSUYgaW4gU29DIHBhcnQgbmFtZWQg
YWRkYSwgd2UgbmVlZCBjb25maWcgaXQgYmVmb3JlDQpjYWxpYnJhdGlvbi4gV2Ugd2lsbCBhbHNv
IHVwc3RyZWFtIG1hY2hpbmUvcGxhdGZvcm0gZHJpdmVyIHRoYXQgdXNlIHRoaXMNCmNvZGVjIGRy
aXZlciBsYXRlci4NCg0KPiA+ID4gPiArCXN3aXRjaCAoZXZlbnQpIHsNCj4gPiA+ID4gKwljYXNl
IFNORF9TT0NfREFQTV9QUkVfUE1VOg0KPiA+ID4gPiArCQlwcml2LT5kZXZfY291bnRlcltkZXZp
Y2VdKys7DQo+ID4gPiA+ICsJCWlmIChwcml2LT5kZXZfY291bnRlcltkZXZpY2VdID4gMSkNCj4g
PiA+ID4gKwkJCWJyZWFrOwkvKiBhbHJlYWR5IGVuYWJsZWQsIGRvIG5vdGhpbmcgKi8NCj4gPiA+
ID4gKwkJZWxzZSBpZiAocHJpdi0+ZGV2X2NvdW50ZXJbZGV2aWNlXSA8PSAwKQ0KPiANCj4gPiA+
IFdoeSBhcmUgd2UgZG9pbmcgYWRkaXRpb25hbCByZWZjb3VudGluZyBvbiB0b3Agb2Ygd2hhdCBE
QVBNIGlzIGRvaW5nPw0KPiA+ID4gVGhpcyBzZWVtcyBsaWtlIHRoZXJlIHNob3VsZCBiZSBhdCBs
ZWFzdCBvbmUgd2lkZ2V0IHJlcHJlc2VudGluZyB0aGUNCj4gPiA+IHNoYXJlZCBiaXRzIG9mIHRo
ZSBhdWRpbyBwYXRoLg0KPiANCj4gPiBXZSBoYXZlICJIUEwgTXV4IiBhbmQgIkhQUiBNdXgiLCB0
aGVyZSB3aWxsIGJlIHR3byBwYXRocyBlbmFibGVkIHdoZW4NCj4gPiBwbGF5YmFjayB0aHJvdWgg
SFAuIEJ1dCBhY3R1YWxseSB0aGV5IHNoYXJlIHRoZSBzYW1lIGNvbnRyb2wgc2VxdWVuY2VzLg0K
PiA+IFNvIGluIG9yZGVyIHRvIHByZXZlbnQgc2V0dGluZyBpdCBvbmUgbW9yZSB0aW1lIHdlIGRv
IGFkZGl0aW9uYWwNCj4gPiByZWZjb3V0aW5nLg0KPiANCj4gVGhhdCBzb3VuZHMgbGlrZSB5b3Ug
c2hvdWxkIGp1c3QgaGF2ZSBvbmUgb3V0cHV0IHBhdGggZGVmaW5lZCBpbiBEQVBNDQo+IGFuZCBt
ZXJnZSB0aGUgbGVmdCBhbmQgcmlnaHQgc2lnbmFscyB0b2dldGhlciByYXRoZXIgdGhhbiBtYWlu
dGFpbmluZw0KPiB0aGVtIHNlcGFyYXRlbHkuDQo+IA0KDQpZZXMsIGl0J3Mgd291bGQgYmV0dGVy
IGlmIHRoZXkgYXJlIGNvbWJpbmVkIGludG8gb25lIG1peGVyIGNvbnRyb2wgdGhhdA0KbmFtZWQg
IkhQIE11eCIuDQoNCj4gPiA+ID4gKwkvKiBocCBnYWluIGN0bCBkZWZhdWx0IGNob29zZSBaQ0Qg
Ki8NCj4gPiA+ID4gKwlwcml2LT5ocF9nYWluX2N0bCA9IEhQX0dBSU5fQ1RMX1pDRDsNCj4gPiA+
ID4gKwlocF9nYWluX2N0bF9zZWxlY3QocHJpdiwgcHJpdi0+aHBfZ2Fpbl9jdGwpOw0KPiANCj4g
PiA+IFdoeSBub3QgdXNlIHRoZSBoYXJkd2FyZSBkZWZhdWx0Pw0KPiANCj4gPiBXZSBoYXZlIHR3
byB3YXlzIHRvIGNvbnRyb2wgdGhlIHZvbHVtZSwgdGhlcmUgaXMgdG8gc2VsZWN0IFpDRC4gQmVj
YXVzZQ0KPiA+IHRoZSBvdGhlciBvbmUgaXQgbm90IG9mdGVuIHVzZWQsIFpDRCBpcyB1c2VkIGJ5
IGRlZmF1bHQuIA0KPiANCj4gV2h5IG5vdCBqdXN0IGxldCB0aGUgdXNlciBwaWNrIGF0IHJ1bnRp
bWU/DQo+IA0KDQpGb3IgYW5vdGhlciBhZGp1c3RtZW50IG1ldGhvZCwgd2UgZGlkbid0IHVwc3Ry
ZWFtIGl0LCBzbyBvbmx5IFpDRA0KcmVzZXJ2ZWQuIEFuZCB0aGUgaGFyZHdhcmUgZGVmYXVsdCBz
ZXR0aW5nIGlzIFpDRCwgc28gd2UgY2FuIHJlbW92ZWQNCnRoZXNlIGxpbmVzLg0KDQo+ID4gPiA+
ICsJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShwcml2LT5hdmRkX3JlZyk7DQo+ID4gPiA+ICsJaWYg
KHJldCkgew0KPiA+ID4gPiArCQlkZXZfZXJyKHByaXYtPmRldiwgIiVzKCksIGZhaWxlZCB0byBl
bmFibGUgcmVndWxhdG9yIVxuIiwNCj4gPiA+ID4gKwkJCV9fZnVuY19fKTsNCj4gPiA+ID4gKwkJ
cmV0dXJuIHJldDsNCj4gPiA+ID4gKwl9DQo+IA0KPiA+ID4gUGVyaGFwcyBtYWtlIHRoaXMgYSBE
QVBNIHdpZGdldD8NCj4gDQo+ID4gInZhdWQxOCIgbmVlZHMgdG8gYmUgYWx3YXlzIG9uIHNvIHdl
IGVuYWJsZSBpdCB3aGVuIGNvZGVjIHByb2JlLg0KPiANCj4gSWYgaXQgaXMganVzdCBzdXBwb3Nl
ZCB0byBiZSBsZWZ0IG9uIGFsbCB0aGUgdGltZSBpdCdzIGJldHRlciB0byBkbyB0aGlzDQo+IGlu
IHRoZSBtYWluIGRldmljZSBtb2RlbCBwcm9iZSByYXRoZXIgdGhhbiB0aGUgY29tcG9uZW50IHBy
b2JlLiAgVGhlDQo+IGNvbXBvbmVudCBwcm9iZSBzaG91bGQgdXN1YWxseSBvbmx5IGJlIHVzZWQg
Zm9yIHRoaW5ncyB0aGF0IG5lZWQgdGhlDQo+IHJlc3Qgb2YgdGhlIGNhcmQgdG8gYmUgdGhlcmUu
DQoNCk9rLCBJIHdpbGwgY29ycmVjdCBpdC4NCg0K

