Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E979B30E
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 17:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860071687;
	Fri, 23 Aug 2019 17:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860071687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566573073;
	bh=X/BlF0sJonB0rqWKczI5r1SaYHkTG4ffpdzBTAzWixI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l10rJCHAV0ftLf4qjkZKfVTMODdDmBgnMbum2eavcZoOyzfWjn0fdTbjMYl10PuM3
	 QRiJO/f1anTjCCY798NnZEVeei6u1cEXjhtk2QQqblXsazJkJrGU8lVTzsI0zjumwX
	 g8pb+hhP82VQE0PQEvtYuCnhDErXbTZm4ZOdpsT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40853F802FB;
	Fri, 23 Aug 2019 17:09:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0353FF80306; Fri, 23 Aug 2019 17:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87B85F8014A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B85F8014A
X-Originating-IP: 86.207.98.53
Received: from localhost
 (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7DD32240007;
 Fri, 23 Aug 2019 15:09:21 +0000 (UTC)
Date: Fri, 23 Aug 2019 17:09:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: mirq-linux@rere.qmqm.pl
Message-ID: <20190823150921.GC30479@piout.net>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
 <1f3a4256-58de-27a4-8095-54fc6baa6d89@microchip.com>
 <20190723164312.GA4772@qmqm.qmqm.pl>
 <20190723183915.GJ24911@piout.net>
 <20190723232505.GA21811@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723232505.GA21811@qmqm.qmqm.pl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Nicolas.Ferre@microchip.com, tiwai@suse.com, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, Codrin.Ciubotariu@microchip.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in
	Kconfig
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

T24gMjQvMDcvMjAxOSAwMToyNTowNSswMjAwLCBtaXJxLWxpbnV4QHJlcmUucW1xbS5wbCB3cm90
ZToKPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCAwODozOToxNVBNICswMjAwLCBBbGV4YW5kcmUg
QmVsbG9uaSB3cm90ZToKPiA+IE9uIDIzLzA3LzIwMTkgMTg6NDM6MTIrMDIwMCwgbWlycS1saW51
eEByZXJlLnFtcW0ucGwgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDAxOjM2
OjM3UE0gKzAwMDAsIENvZHJpbi5DaXVib3Rhcml1QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPiA+
ID4gT24gMjIuMDcuMjAxOSAyMToyNywgTWljaGHFgiBNaXJvc8WCYXcgd3JvdGU6Cj4gPiA+ID4g
PiBBbGxvdyBTU0MgdG8gYmUgdXNlZCBvbiBwbGF0Zm9ybXMgZGVzY3JpYmVkIHVzaW5nIGF1ZGlv
LWdyYXBoLWNhcmQKPiA+ID4gPiA+IGluIERldmljZSBUcmVlLgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0u
cGw+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAgc291bmQvc29jL2F0bWVsL0tjb25maWcgfCAy
ICstCj4gPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL0tj
b25maWcgYi9zb3VuZC9zb2MvYXRtZWwvS2NvbmZpZwo+ID4gPiA+ID4gaW5kZXggMDZjMWQ1Y2U2
NDJjLi45ZWY5ZDI1YmI1MTcgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwv
S2NvbmZpZwo+ID4gPiA+ID4gKysrIGIvc291bmQvc29jL2F0bWVsL0tjb25maWcKPiA+ID4gPiA+
IEBAIC0yNSw3ICsyNSw3IEBAIGNvbmZpZyBTTkRfQVRNRUxfU09DX0RNQQo+ID4gPiA+ID4gICAJ
ZGVmYXVsdCB5IGlmIFNORF9BVE1FTF9TT0NfU1NDX0RNQT15IHx8IChTTkRfQVRNRUxfU09DX1NT
Q19ETUE9bSAmJiBTTkRfQVRNRUxfU09DX1NTQz15KQo+ID4gPiA+ID4gICAKPiA+ID4gPiA+ICAg
Y29uZmlnIFNORF9BVE1FTF9TT0NfU1NDX0RNQQo+ID4gPiA+ID4gLQl0cmlzdGF0ZQo+ID4gPiA+
ID4gKwl0cmlzdGF0ZSAiU29DIFBDTSBEQUkgc3VwcG9ydCBmb3IgQVQ5MSBTU0MgY29udHJvbGxl
ciB1c2luZyBETUEiCj4gPiA+ID4gCj4gPiA+ID4gQ291bGQgeW91IHBsZWFzZSBtYWtlIHNvbWV0
aGluZyBzaW1pbGFyIGZvciBTTkRfQVRNRUxfU09DX1NTQ19QREM/IEFsc28sIAo+ID4gPiA+IEkg
dGhpbmsgdGhhdCBpdCBzaG91bGQgc2VsZWN0IEFUTUVMX1NTQywgdG8gYmUgYWJsZSB0byB1c2Ug
Cj4gPiA+ID4gc2ltcGxlL2dyYXBoLWNhcmQgd2l0aCBTU0MuCj4gPiA+IAo+ID4gPiBIbW0uIFRo
ZSBLY29uZmlnIGRlcGVuZGVuY2llcyBzZWVtcyBvdmVybHkgY29tcGxpY2F0ZWQsIGRvIHlvdSBt
aW5kIGlmIEkKPiA+ID4gZ2V0IHJpZCBvZiBtb3N0IG9mIHRoZSBlbnRyaWVzIGluIHRoZSBwcm9j
ZXNzPwo+ID4gPiAKPiA+IAo+ID4gVW5mb3J0dW5hdGVseSwgaXQgaXMganVzdCBjb21wbGljYXRl
ZCBlbm91Z2guIFRoaXMgaXMgZG9uZSB0byBzdXBwb3J0Cj4gPiBhbGwgdGhlIHBvc3NpYmxlIGNv
bmZpZ3VyYXRpb25zLiBSZW1vdmluZyB0aGVtIHdpbGwgbGVhZCB0byBsaW5raW5nCj4gPiBlcnJv
cnMuCj4gPiAKPiA+IEFmdGVyIGhhdmluZyB0aGF0IGRpc2N1c3Npb24gYmFjayBpbiBNYXJjaCwg
SSBoYWQgYSB2ZXJ5IHF1aWNrIGxvb2sgYW5kCj4gPiBkaWRuJ3Qgc2VuZCBhIHBhdGNoIGJlY2F1
c2UgSSBzdGlsbCBoYWQgbGlua2luZyBpc3N1ZXMuIEl0IGlzIG5vdAo+ID4gaW1wb3NzaWJsZSBi
dXQgaXQgcmVxdWlyZWQgbW9yZSB0aW1lIHRoYW4gSSBoYWQuCj4gCj4gQ2FuIHlvdSB0cnkgcGF0
Y2ggYmVsb3cgaWYgaXQgY292ZXJzIHRoZSBjb25maWd1cmF0aW9ucyB5b3UgbWVudGlvbj8KPiBU
aGlzIHVzZXMgS2NvbmZpZydzIG0veSByZXNvbHV0aW9uIGluc3RlYWQgb2Ygb3Blbi1jb2RlZCBk
ZWZhdWx0cy4KPiAKClNlZW1zIGdvb2QgdG8gbWUsIHRoYW5rcy4KCgotLSAKQWxleGFuZHJlIEJl
bGxvbmksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
