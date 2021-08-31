Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3103FC446
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 10:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22C1173A;
	Tue, 31 Aug 2021 10:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22C1173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630399793;
	bh=sZFVav08zwMRGHECP5b0bRmeLPWcxHvBk2pMalHXz0k=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7QG5pHTJoudLt66G1A1bpde3WHYuHUOCeZV3t57hdnpXBFBfM03WLzDYG0noG6Mx
	 agkDwIVulRWhC7TTXwA1cUvXwmVxXYQBIMVYorFZ5UkOJocZ1gy6P/C0sGI5ciUr/J
	 0T0eT2Hcnga2W2dRg8YzizC2yAOi3DTHAc1Xx3Zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D998F80127;
	Tue, 31 Aug 2021 10:48:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0B18F8025B; Tue, 31 Aug 2021 10:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB41BF800BE
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 10:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB41BF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="RrNGUABs"
X-UUID: 6edc1c8317294ccb827b04c2f20e7ae5-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sZFVav08zwMRGHECP5b0bRmeLPWcxHvBk2pMalHXz0k=; 
 b=RrNGUABsTqOF6ZgnPrXLHCz6igypBPTyoCG/9aQ4khqMEc+A+t2awTUZPvESjURS1zM59KQwGjxAdKrF8Zy9+Zi/EnWXK+5UCnVAa1xE3dvUS3Ul5I18sNL2fA9p1u3c3GkWJwMdnVd8X78/dsNqCAGBp4rIxUlo/61dBAcCc3g=;
X-UUID: 6edc1c8317294ccb827b04c2f20e7ae5-20210831
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1984509139; Tue, 31 Aug 2021 16:48:12 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 16:48:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 16:48:10 +0800
Message-ID: <0d73ada63c3c2949a283ac6830ab9cc84a5e4a41.camel@mediatek.com>
Subject: Re: [PATCH v5 07/11] dt-bindings: mediatek: mt8195: add audio afe
 document
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Stephen
 Boyd <sboyd@kernel.org>
Date: Tue, 31 Aug 2021 16:48:10 +0800
In-Reply-To: <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
 <20210819084144.18483-8-trevor.wu@mediatek.com>
 <CAL_Jsq+bLVLqqVKfYuXDVYexMojMgZ5p34Pcx7_7LwU40b-2dA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>, Jimmy
 Cheng-Yi Chiang <cychiang@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 bicycle.tsai@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Li-Yu Yu <aaronyu@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

T24gTW9uLCAyMDIxLTA4LTMwIGF0IDA3OjM1IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCBBdWcgMTksIDIwMjEgYXQgMzo0MyBBTSBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRp
YXRlay5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBtdDgxOTUgYXVk
aW8gYWZlIGRvY3VtZW50Lg0KPiA+IA0KPiA+IEluIG9yZGVyIHRvIHN1cHBvcnQgZHluYW1pYyBj
bG9jayByZXBhcmVudGluZyBmb3IgQUREQSBhbmQgRVRETSwNCj4gPiBQTEwNCj4gPiBhbmQgTVVY
IGNsb2NrcyBhcmUgcmVxdWVzdGVkIGV2ZW4gdGhvdWdoIHRoZXkgYXJlIG5vdCBjb25zdW1lZCBi
eQ0KPiA+IGFmZQ0KPiA+IGRpcmVjdGx5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRyZXZv
ciBXdSA8dHJldm9yLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiBUaGlzIHBhdGNoIGRl
cGVuZHMgb24gdGhlIGZvbGxvd2luZyBzZXJpZXMgdGhhdCBoYXZlIG5vdCBiZWVuDQo+ID4gYWNj
ZXB0ZWQuDQo+ID4gDQo+ID4gWzFdIE1lZGlhdGVrIE1UODE5NSBjbG9jayBzdXBwb3J0DQo+ID4g
DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz01MDE5MjNfXzshIUNUUk5LQTl3
TWcwQVJidyF5Ym03RTgwRExMWVhzOE91ak80NlNVS1lGT1V4OGdzTFpQVEU2VkRGckdUUTByQVls
SkpIT1VLaExfWlVTSlNMa0EkDQo+ID4gIA0KPiA+IChkdC1iaW5kaW5ncy9jbG9jay9tdDgxOTUt
Y2xrLmggaXMgaW5jbHVkZWQpDQo+IA0KPiBUaGlzIGRlcGVuZGVuY3kgaXMgc3RpbGwgbm90IGFw
cGxpZWQsIHNvIHRoZSBleGFtcGxlIGZhaWxzLiBPbmUgb2YNCj4gdGhlDQo+IGZvbGxvd2luZyBu
ZWVkcyB0byBoYXBwZW46IHRoZSBkZXBlbmRlbmN5IG5lZWRzIHRvIGJlIGFwcGxpZWQsIHRoaXMN
Cj4gcGF0Y2ggcmV2ZXJ0ZWQsIG9yIGRyb3AgdGhlIHVzZSBvZiB0aGUgZGVmaW5lcyBpbiB0aGUg
ZXhhbXBsZS4NCj4gDQo+IFJvYg0KDQpIaSBSb2IsDQoNCkkgc2VuZCBhIHBhdGNoIGFuZCBkcm9w
IHRoZSB1c2Ugb2YgZGVmaW5lcy4NCg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2Fsc2EtZGV2ZWwvcGF0Y2gvMjAyMTA4MzEwODM5NTYuOTgwNC0xLXRyZXZvci53dUBtZWRp
YXRlay5jb20vDQoNClRoYW5rcywNClRyZXZvcg0KDQo=

