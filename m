Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6CA3FEAD7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 10:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0451417A2;
	Thu,  2 Sep 2021 10:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0451417A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630572757;
	bh=VcHem3PlhQ3Tc6PDE0J4s73cFxeHqcwfm2J9cr3QOVY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9iwnVrSWV77s1WluS83sUaChHsZFaExeRXphnHRLg2dCoUpkXNMzp0GGOhxfS3Pf
	 9wvSXaistBegZdZlZel4Nm0fzfbYSSIPPMyvR+DF2cxXmaQo1i0HnEfN/3u/decG0g
	 UzCb04E3uf7HyW1R9zRKeZpt8abTUCSBj7ssFM4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61333F8028D;
	Thu,  2 Sep 2021 10:51:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3EE8F80269; Thu,  2 Sep 2021 10:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EAA7F80125
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 10:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EAA7F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="Sa1mtb7/"
X-UUID: b07593f9166e4d58894110fbe3380758-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VcHem3PlhQ3Tc6PDE0J4s73cFxeHqcwfm2J9cr3QOVY=; 
 b=Sa1mtb7/GfavGJ2As6yYjjms9Zo6tXOi64+CcKuGYCtx6CrA2pm005xVFRBo65jfHn8KJAnHgCc5MSs4G+8OzpmGlXE0p6ARzpsdfzrSSBCkWO0K/jL7h/nbnT1gtQqrQ1EHjBdzB7sS1pnjZNbrHhboUSaxnI0wq/fktYlWvZE=;
X-UUID: b07593f9166e4d58894110fbe3380758-20210902
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1319195617; Thu, 02 Sep 2021 16:50:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Sep 2021 16:50:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 16:50:57 +0800
Message-ID: <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
Subject: Re: linux-next: Tree for Sep 1
 [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko]
From: Trevor Wu <trevor.wu@mediatek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Sep 2021 16:50:57 +0800
In-Reply-To: <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
References: <20210901181740.3a0a69f2@canb.auug.org.au>
 <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
 <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
 <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bicycle Tsai <bicycle.tsai@mediatek.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

T24gVGh1LCAyMDIxLTA5LTAyIGF0IDEwOjIyICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEhpIFRyZXZvciwNCj4gDQo+IE9uIFRodSwgU2VwIDIsIDIwMjEgYXQgNDozNyBBTSBU
cmV2b3IgV3UgPHRyZXZvci53dUBtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+IE9uIFdlZCwg
MjAyMS0wOS0wMSBhdCAxMzo1NSAtMDcwMCwgUmFuZHkgRHVubGFwIHdyb3RlOg0KPiA+ID4gT24g
OS8xLzIxIDE6MTcgQU0sIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+ID4gPiA+IFBsZWFzZSBk
byBub3QgYWRkIGFueSB2NS4xNiByZWxhdGVkIGNvZGUgdG8geW91ciBsaW51eC1uZXh0DQo+ID4g
PiA+IGluY2x1ZGVkDQo+ID4gPiA+IGJyYW5jaGVzIHVudGlsIGFmdGVyIHY1LjE1LXJjMSBoYXMg
YmVlbiByZWxlYXNlZC4NCj4gPiA+ID4gDQo+ID4gPiA+IENoYW5nZXMgc2luY2UgMjAyMTA4MzE6
DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IG9uIHg4Nl82NDoNCj4gPiA+IA0KPiA+
ID4gRVJST1I6IG1vZHBvc3Q6ICJjbGtkZXZfYWRkIiBbc291bmQvc29jL21lZGlhdGVrL210ODE5
NS9zbmQtc29jLQ0KPiA+ID4gbXQ4MTk1LWFmZS5rb10gdW5kZWZpbmVkIQ0KPiA+ID4gRVJST1I6
IG1vZHBvc3Q6ICJjbGtkZXZfZHJvcCIgW3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvc25kLXNv
Yy0NCj4gPiA+IG10ODE5NS1hZmUua29dIHVuZGVmaW5lZCENCj4gPiA+IEVSUk9SOiBtb2Rwb3N0
OiAiY2xrX3VucmVnaXN0ZXJfZ2F0ZSINCj4gPiA+IFtzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk1
L3NuZC0NCj4gPiA+IHNvYy1tdDgxOTUtYWZlLmtvXSB1bmRlZmluZWQhDQo+ID4gPiBFUlJPUjog
bW9kcG9zdDogImNsa19yZWdpc3Rlcl9nYXRlIg0KPiA+ID4gW3NvdW5kL3NvYy9tZWRpYXRlay9t
dDgxOTUvc25kLQ0KPiA+ID4gc29jLW10ODE5NS1hZmUua29dIHVuZGVmaW5lZCENCj4gPiA+IA0K
PiA+ID4gRnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuDQo+ID4gPiANCj4gPiANCj4g
PiBIaSBSYW5keSwNCj4gPiANCj4gPiBUaGUgcHJvYmxlbSBpcyBjYXVzZWQgYnkgdGhlIGRlcGVu
ZGVuY3kgZGVjbGFyYXRpb24sIGJlY2F1c2UgaXQncw0KPiA+IG5vdCBhDQo+ID4gZHJpdmVyIGZv
ciB4ODZfNjQuDQo+ID4gVGhlIGRlcGVuZGVuY3kgZGVjbGFyYXRpb24gaGFzIGJlZW4gYWRkZWQg
aW4gdGhlIGZvbGxvd2luZyBwYXRjaC4NCj4gPiANCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvYWxzYS1kZXZlbC9w
YXRjaC83ZTYyOGUzNTliZGUwNGNlYjlkZGQ3NGE0NTkzMTA1OWI0YTQ2MjNjLjE2MzA0MTU4NjAu
Z2l0LmdlZXJ0KnJlbmVzYXNAZ2xpZGVyLmJlL19fO0t3ISFDVFJOS0E5d01nMEFSYnchd01xMTMw
bUFvLXM0NXBQNlNoUTFTOFVJUnVKTGh3T25DYlFOQVFISUUyenZOaGpBZDY3aDFybHFrSUR4SnZD
NV9nJA0KPiA+ICANCj4gDQo+IFRoYXQgaXMgbm90IHN1ZmZpY2llbnQsIGlmIENPTVBJTEVfVEVT
VCBpcyBlbmFibGVkLg0KPiANCj4gTG9va3MgbGlrZSBpdCBuZWVkcyBhIGRlcGVuZGVuY3kgb24g
Q09NTU9OX0NMSywgdG9vLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCg0KSGkgR2VlcnQsDQoNCkJlY2F1c2UgaXQncyBh
IEFSTTY0IGRyaXZlciwgQVJNNjQgd2lsbCBzZWxlY3QgQ09NTU9OX0NMSy4NCkl0IHNlZW1zIHRo
YXQgc29tZSBkZXBlbmRlbmN5IHNob3VsZCBiZSBjaGVja2VkIGlmIENPTVBJTEVfVEVTVCBpcw0K
ZW5hYmxlZCBhbmQgdGhlIGRyaXZlciBpcyBjb21waWxlZCBvbiBub24tQVJNNjQgZW52aXJvbm1l
bnQuDQpXZSBkb24ndCBleHBlY3QgdGhlIGRyaXZlciBjYW4gYmUgdXNlZCBvbiBub24tQVJNNjQg
ZW52aXJvbm1lbnQsbWF5IEkNCnJlbW92ZSBDT01QSUxFX1RFU1QgdG8gc29sdmUgdGhlIHByb2Js
ZW0/DQpJZiB0aGUgZHJpdmVyIG9ubHkgZGVwZW5kcyBvbiBBUkNIX01FRElBVEVLLCBpdCBtdXN0
IGJlIGNvbXBpbGVkIG9uDQpBUk02NC4NCg0KVGhhbmtzLA0KVHJldm9yDQo=

