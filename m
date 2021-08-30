Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A693FAFA6
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 04:02:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 300061703;
	Mon, 30 Aug 2021 04:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 300061703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630288959;
	bh=Qyat5x/fiJC8kmOPCW3EzEYS2O3hrzOq+rV6SCzvXHk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kc0/4Wmbbh4A9Q3oHQIm6ZckFAhqPa8d4mNFnRzAEq5m6mQ4Y50YhE/kSGJeLlh5U
	 IWj5zsH5WqkUNi6/VT9Ub067WN8P3cIRaz8VAPZHvDTQxnp0HGjvlt+gwiq+sQCm9I
	 mtl6sxq+S4paBxUNFqXmXQSwJxQdMCiqRdKhAEj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F2FF80171;
	Mon, 30 Aug 2021 04:01:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21E6AF80218; Mon, 30 Aug 2021 04:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8CA2F80171
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 04:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8CA2F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="ZYnQFQD1"
X-UUID: bf59ae2cd0f3408f9c60b258a15e654b-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qyat5x/fiJC8kmOPCW3EzEYS2O3hrzOq+rV6SCzvXHk=; 
 b=ZYnQFQD1W2v+dXcpuDD/op5QT1X8z+2GzwyFFgNz2l8hUhMYcei63/D+FLkONW/yDjNFAZ7JHQkcS7vTEL96eFTQtr0FzQmXazyXWM6ZdVlS8SoPitLdwRj1gkiI6Y/1MJ+IhFFa4xWdQ4YIVxjP0hKsPlmKDSMH1605kdy4v0M=;
X-UUID: bf59ae2cd0f3408f9c60b258a15e654b-20210830
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1432520261; Mon, 30 Aug 2021 10:00:57 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 10:00:56 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 30 Aug 2021 10:00:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 10:00:55 +0800
Message-ID: <2310d7eebf0063eafa86657879238d1d07f180dd.camel@mediatek.com>
Subject: Re: linux-next: Tree for Aug 27 (sound/soc/mediatek: Kconfig)
From: Trevor Wu <trevor.wu@mediatek.com>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>
Date: Mon, 30 Aug 2021 10:00:55 +0800
In-Reply-To: <f0fcbb1e-bf15-5ad2-6ff5-55b7c2acb29c@infradead.org>
References: <20210827212415.48ac8b64@canb.auug.org.au>
 <f0fcbb1e-bf15-5ad2-6ff5-55b7c2acb29c@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

T24gRnJpLCAyMDIxLTA4LTI3IGF0IDExOjM5IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+
IE9uIDgvMjcvMjEgNDoyNCBBTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToNCj4gPiBIaSBhbGws
DQo+ID4gDQo+ID4gQ2hhbmdlcyBzaW5jZSAyMDIxMDgyNjoNCj4gPiANCj4gPiBUaGUga2J1aWxk
IHRyZWUgc3RpbGwgaGFkIGl0cyBidWlsZCBmYWlsdXJlIGZvciB3aGljaCBJIHJldmVydGVkIGEN
Cj4gPiBjb21taXQuDQo+ID4gDQo+ID4gVGhlIHVtbCB0cmVlIGdhaW5lZCBhIGNvbmZsaWN0IGFn
YWluc3QgdGhlIGFzbS1nZW5lcmljIHRyZWUuDQo+ID4gDQo+ID4gVGhlIG5ldC1uZXh0IHRyZWUg
c3RpbGwgaGFkIGl0cyBidWlsZCBmYWlsdXJlIGZvciB3aGljaCBJIGFwcGxpZWQgYQ0KPiA+IHBh
dGNoIGFuZCBpdCBhbHNvIGdhaW5lZCBhIHNlbWFudGljIGNvbmZsaWN0IGFnYWluc3QgTGludXMn
IHRyZWUuDQo+ID4gDQo+ID4gVGhlIGJwZi1uZXh0IHRyZWUgbG9zdCBpdHMgYnVpbGQgZmFpbHVy
ZS4NCj4gPiANCj4gPiBUaGUgdGlwIHRyZWUgZ2FpbmVkIGNvbmZsaWN0cyBhZ2FpbnN0IHRoZSBh
cm02NCB0cmVlLg0KPiA+IA0KPiA+IFRoZSBmdHJhY2UgdHJlZSBnYWluZWQgYSBjb25mbGljdCBh
Z2FpbnN0IHRoZSB1bWwgdHJlZS4NCj4gPiANCj4gPiBUaGUgdmZpbyB0cmVlIGdhaW5lZCBjb25m
bGljdHMgYWdhaW5zdCB0aGUgZHJtIHRyZWUuDQo+ID4gDQo+ID4gVGhlIGtzcHAgdHJlZSBzdGls
bCBoYWQgaXRzIGJ1aWxkIGZhaWx1cmUgc28gSSB1c2VkIHRoZSB2ZXJzaW9uDQo+ID4gZnJvbQ0K
PiA+IG5leHQtMjAyMTA4MjUuDQo+ID4gDQo+ID4gTm9uLW1lcmdlIGNvbW1pdHMgKHJlbGF0aXZl
IHRvIExpbnVzJyB0cmVlKTogOTg2Nw0KPiA+ICAgOTUyOCBmaWxlcyBjaGFuZ2VkLCA1NTI1MDcg
aW5zZXJ0aW9ucygrKSwgMjI3MDU0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4gLS0tLS0tLS0tLS0NCj4gPiANCj4gPiBJIGhhdmUgY3JlYXRlZCB0b2RheSdzIGxpbnV4LW5l
eHQgdHJlZSBhdA0KPiA+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0DQo+ID4gKHBhdGNoZXMgYXQgDQo+ID4gaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVs
L25leHQvX187ISFDVFJOS0E5d01nMEFSYnchMUVscmQzQzdWc00zdmVINTNjVWJRTDZhSlotd3Z4
WEZRUGZ2NDl5NGprQmFDX05Zb3o2NUZkMVhEV1VZTnVVZW1nJA0KPiA+ICAgKS4gIElmIHlvdQ0K
PiA+IGFyZSB0cmFja2luZyB0aGUgbGludXgtbmV4dCB0cmVlIHVzaW5nIGdpdCwgeW91IHNob3Vs
ZCBub3QgdXNlICJnaXQNCj4gPiBwdWxsIg0KPiA+IHRvIGRvIHNvIGFzIHRoYXQgd2lsbCB0cnkg
dG8gbWVyZ2UgdGhlIG5ldyBsaW51eC1uZXh0IHJlbGVhc2Ugd2l0aA0KPiA+IHRoZQ0KPiA+IG9s
ZCBvbmUuICBZb3Ugc2hvdWxkIHVzZSAiZ2l0IGZldGNoIiBhbmQgY2hlY2tvdXQgb3IgcmVzZXQg
dG8gdGhlDQo+ID4gbmV3DQo+ID4gbWFzdGVyLg0KPiA+IA0KPiA+IFlvdSBjYW4gc2VlIHdoaWNo
IHRyZWVzIGhhdmUgYmVlbiBpbmNsdWRlZCBieSBsb29raW5nIGluIHRoZQ0KPiA+IE5leHQvVHJl
ZXMNCj4gPiBmaWxlIGluIHRoZSBzb3VyY2UuICBUaGVyZSBhcmUgYWxzbyBxdWlsdC1pbXBvcnQu
bG9nIGFuZCBtZXJnZS5sb2cNCj4gPiBmaWxlcyBpbiB0aGUgTmV4dCBkaXJlY3RvcnkuICBCZXR3
ZWVuIGVhY2ggbWVyZ2UsIHRoZSB0cmVlIHdhcw0KPiA+IGJ1aWx0DQo+ID4gd2l0aCBhIHBwYzY0
X2RlZmNvbmZpZyBmb3IgcG93ZXJwYywgYW4gYWxsbW9kY29uZmlnIGZvciB4ODZfNjQsIGENCj4g
PiBtdWx0aV92N19kZWZjb25maWcgZm9yIGFybSBhbmQgYSBuYXRpdmUgYnVpbGQgb2YgdG9vbHMv
cGVyZi4gQWZ0ZXINCj4gPiB0aGUgZmluYWwgZml4dXBzIChpZiBhbnkpLCBJIGRvIGFuIHg4Nl82
NCBtb2R1bGVzX2luc3RhbGwgZm9sbG93ZWQNCj4gPiBieQ0KPiA+IGJ1aWxkcyBmb3IgeDg2XzY0
IGFsbG5vY29uZmlnLCBwb3dlcnBjIGFsbG5vY29uZmlnICgzMiBhbmQgNjQgYml0KSwNCj4gPiBw
cGM0NHhfZGVmY29uZmlnLCBhbGx5ZXNjb25maWcgYW5kIHBzZXJpZXNfbGVfZGVmY29uZmlnIGFu
ZCBpMzg2LA0KPiA+IHNwYXJjDQo+ID4gYW5kIHNwYXJjNjQgZGVmY29uZmlnIGFuZCBodG1sZG9j
cy4gQW5kIGZpbmFsbHksIGEgc2ltcGxlIGJvb3QgdGVzdA0KPiA+IG9mIHRoZSBwb3dlcnBjIHBz
ZXJpZXNfbGVfZGVmY29uZmlnIGtlcm5lbCBpbiBxZW11ICh3aXRoIGFuZA0KPiA+IHdpdGhvdXQN
Cj4gPiBrdm0gZW5hYmxlZCkuDQo+ID4gDQo+ID4gQmVsb3cgaXMgYSBzdW1tYXJ5IG9mIHRoZSBz
dGF0ZSBvZiB0aGUgbWVyZ2UuDQo+ID4gDQo+ID4gSSBhbSBjdXJyZW50bHkgbWVyZ2luZyAzMzQg
dHJlZXMgKGNvdW50aW5nIExpbnVzJyBhbmQgOTAgdHJlZXMgb2YNCj4gPiBidWcNCj4gPiBmaXgg
cGF0Y2hlcyBwZW5kaW5nIGZvciB0aGUgY3VycmVudCBtZXJnZSByZWxlYXNlKS4NCj4gPiANCj4g
PiBTdGF0cyBhYm91dCB0aGUgc2l6ZSBvZiB0aGUgdHJlZSBvdmVyIHRpbWUgY2FuIGJlIHNlZW4g
YXQNCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vbmV1bGluZy5vcmcv
bGludXgtbmV4dC1zaXplLmh0bWxfXzshIUNUUk5LQTl3TWcwQVJidyExRWxyZDNDN1ZzTTN2ZUg1
M2NVYlFMNmFKWi13dnhYRlFQZnY0OXk0amtCYUNfTllvejY1RmQxWERXVU1JRWszS0EkDQo+ID4g
QSQgIC4NCj4gPiANCj4gPiBTdGF0dXMgb2YgbXkgbG9jYWwgYnVpbGQgdGVzdHMgd2lsbCBiZSBh
dA0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9raXNza2IuZWxsZXJt
YW4uaWQuYXUvbGludXgtbmV4dF9fOyEhQ1RSTktBOXdNZzBBUmJ3ITFFbHJkM0M3VnNNM3ZlSDUz
Y1ViUUw2YUpaLXd2eFhGUVBmdjQ5eTRqa0JhQ19OWW96NjVGZDFYRFdXVGxNMFp6QSQNCj4gPiAg
IC4gIElmIG1haW50YWluZXJzIHdhbnQgdG8gZ2l2ZQ0KPiA+IGFkdmljZSBhYm91dCBjcm9zcyBj
b21waWxlcnMvY29uZmlncyB0aGF0IHdvcmssIHdlIGFyZSBhbHdheXMgb3Blbg0KPiA+IHRvIGFk
ZA0KPiA+IG1vcmUgYnVpbGRzLg0KPiA+IA0KPiA+IFRoYW5rcyB0byBSYW5keSBEdW5sYXAgZm9y
IGRvaW5nIG1hbnkgcmFuZGNvbmZpZyBidWlsZHMuICBBbmQgdG8NCj4gPiBQYXVsDQo+ID4gR29y
dG1ha2VyIGZvciB0cmlhZ2UgYW5kIGJ1ZyBmaXhlcy4NCj4gPiANCj4gDQo+IG9uIGkzODY6DQo+
IA0KPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBTTkRf
U09DX01UNjM1OQ0KPiAgICBEZXBlbmRzIG9uIFtuXTogU09VTkQgWz15XSAmJiAhVU1MICYmIFNO
RCBbPXldICYmIFNORF9TT0MgWz15XSAmJg0KPiBNVEtfUE1JQ19XUkFQIFs9bl0NCj4gICAgU2Vs
ZWN0ZWQgYnkgW3ldOg0KPiAgICAtIFNORF9TT0NfTVQ4MTk1X01UNjM1OV9SVDEwMTlfUlQ1Njgy
IFs9eV0gJiYgU09VTkQgWz15XSAmJiAhVU1MDQo+ICYmIFNORCBbPXldICYmIFNORF9TT0MgWz15
XSAmJiBJMkMgWz15XSAmJiBTTkRfU09DX01UODE5NSBbPXldDQo+IA0KPiANCj4gY2F1c2VkIGJ5
IDQwZDYwNWRmMGE3YjogQVNvQzogbWVkaWF0ZWs6IG10ODE5NTogYWRkIG1hY2hpbmUgZHJpdmVy
DQo+IHdpdGggbXQ2MzU5LCBydDEwMTkgYW5kIHJ0NTY4Mg0KPiANCj4gRnVsbCByYW5kY29uZmln
IGZpbGUgaXMgYXR0YWNoZWQuDQo+IA0KDQoNCkhpIFJhbmR5LA0KDQpJIHdpbGwgYWRkIGEgZGVw
ZW5kZW5jeSB0byBhdm9pZCB0aGF0Lg0KDQpUaGFua3MsDQpUcmV2b3INCg0KDQoNCg==

