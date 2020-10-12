Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B428ADD9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 07:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C33D166B;
	Mon, 12 Oct 2020 07:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C33D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602481771;
	bh=Qh32CvLCP7TbrAU9q4uRS7WfIF5HB8P3kFRMssgVV8s=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXPHdjI9IKcxml7ifXCMa4DJTTqZPZ76BTCySu8n46Z6tnLulYTxn988mahU64VPg
	 4qvXDVT16Ssz91ggtnMcglcuMbfjJKp2Kyl8Fy9ztnhw4Ou//axMb07u6rtQ8tC1jq
	 fFXO579NR1wJAcMIsuZSnH2flAZR5OTAvAnbrzJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2319F8021D;
	Mon, 12 Oct 2020 07:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B351F80217; Mon, 12 Oct 2020 07:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 1533FF80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 07:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1533FF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="HSQ6gaQ9"
X-UUID: 50f1798ef84d47568f56d89a0de7b4a6-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qh32CvLCP7TbrAU9q4uRS7WfIF5HB8P3kFRMssgVV8s=; 
 b=HSQ6gaQ9BT/8awzojpsomr6j0MvxxgkGnmo4bMBO0/udns3AnarywMX9wZUTFmhPjwk423W2hEk1Jls9qEBq0WBjHIwhD1UXHdl/qYS/j7sc6HWD9fmo09CE97oUvdpaeKPvC7lvRnw4RBN2eg8/7u2CvsJmra6sq4or7IFFG0M=;
X-UUID: 50f1798ef84d47568f56d89a0de7b4a6-20201012
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2105306689; Mon, 12 Oct 2020 13:47:29 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Oct 2020 13:47:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 13:47:25 +0800
Message-ID: <1602481646.8921.4.camel@mhfsdcap03>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 12 Oct 2020 13:47:26 +0800
In-Reply-To: <20201005135503.GA86716@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
 <20201005135503.GA86716@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, tzungbi@google.com, broonie@kernel.org,
 maowenan@huawei.com, tiwai@suse.com, shane.chien@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCAyMDIwLTEwLTA1IGF0IDA4OjU1IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gRnJpLCAwMiBPY3QgMjAyMCAxNTozNTo0MCArMDgwMCwgSmlheGluIFl1IHdyb3RlOg0KPiA+
IFRoaXMgcGF0Y2ggYWRkcyBtdDgxOTIgYXVkaW8gYWZlIGRvY3VtZW50Lg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgLi4uL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwgICAgICAgIHwgOTgg
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwNCj4gPiANCj4gDQo+IA0KPiBNeSBib3QgZm91
bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91ciBwYXRjaDoN
Cj4gDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZl
LXBjbS5leGFtcGxlLmR0czoxOToxODogZmF0YWwgZXJyb3I6IGR0LWJpbmRpbmdzL2Nsb2NrL210
ODE5Mi1jbGsuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiAgICAxOSB8ICAgICAgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE5Mi1jbGsuaD4NCj4gICAgICAgfCAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IGNvbXBpbGF0
aW9uIHRlcm1pbmF0ZWQuDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5saWI6MzQy
OiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20u
ZXhhbXBsZS5kdC55YW1sXSBFcnJvciAxDQo+IG1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZp
bmlzaGVkIGpvYnMuLi4uDQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTM2NjogZHRfYmluZGluZ19j
aGVja10gRXJyb3IgMg0KPiANCj4gDQo+IFNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3BhdGNoLzEzNzU1ODINCj4gDQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5n
X2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3IocyksIHRoZW4gbWFrZSBz
dXJlIGR0LXNjaGVtYSBpcyB1cCB0byBkYXRlOg0KPiANCj4gcGlwMyBpbnN0YWxsIGdpdCtodHRw
czovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hLmdpdEBtYXN0ZXIgLS11cGdy
YWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC4NCj4gDQpTb3JyeSwgSSBzaG91
bGQgYWRkIGEgZGVwZW5kZW5jeSBkZXNjcmlwdGlvbi4NCiJkdC1iaW5kaW5ncy9jbG9jay9tdDgx
OTItY2xrLmgiIGlzIGluY2x1ZGVkIGluDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2Nv
dmVyLzExNzUyMjMxIHNlcmllcyBvZiBwYXRjaGVzLCBidXQgdGhleQ0KaGFzIG5vdCBiZWVuIGFj
Y2VwdGVkLg0KDQo=

