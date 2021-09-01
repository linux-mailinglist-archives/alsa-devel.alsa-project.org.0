Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BE3FD1F7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 05:50:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0882F1769;
	Wed,  1 Sep 2021 05:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0882F1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630468227;
	bh=hGt1wc4kq8kljXgVH5HFAtVh2cBIgecvwIJfVOk/B78=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5/bZWyDZSNqnfRFT8GgU7F6gRtvx/lBhIqeSPYj7by3AN8KyrH7mSQOvhVde6w3c
	 nOJqZmnv9HSFjdIjMNI8g2vQ/wYHMRPVb5mSBzNgTusMChp2QujQAT5de4gvQgXbS2
	 HLFoNgQuCAsF8RSqZqAlQl90XCWX/lydM7+MDUF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2170F804E7;
	Wed,  1 Sep 2021 05:48:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C89DF804E5; Wed,  1 Sep 2021 05:48:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C203DF80227
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 05:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C203DF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="XGSc1ODA"
X-UUID: d800d3cac50c4706b9b06b80dc798561-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hGt1wc4kq8kljXgVH5HFAtVh2cBIgecvwIJfVOk/B78=; 
 b=XGSc1ODAjT0mV2s0iM2ZCN5ZLLFj97vqirnpITeZ4O7adYUA9512FZ4vcLrrq/5iuNcvvFZuG4v6OzeCUYPyZ/MbWvq0HK1YjUsUM32iw7cNLz2SZbKUDenOdIhQ4mLCVRgQLNcvmqgfpXdalXKXNIN/CP/0waxuPj+Z6x1gpj4=;
X-UUID: d800d3cac50c4706b9b06b80dc798561-20210901
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1611709793; Wed, 01 Sep 2021 11:48:28 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 11:48:27 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 11:48:27 +0800
Message-ID: <535478691c3a9ed31b508f59dc897be57c4213c0.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: SND_SOC_MT8195 should depend on
 ARCH_MEDIATEK
From: Trevor Wu <trevor.wu@mediatek.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 1 Sep 2021 11:48:27 +0800
In-Reply-To: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
References: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

T24gVHVlLCAyMDIxLTA4LTMxIGF0IDE1OjE4ICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IFRoZSBNZWRpYXRlayBNVDgxOTUgc291bmQgaGFyZHdhcmUgaXMgb25seSBwcmVzZW50
IG9uIE1lZGlhdGVrIE1UODE5NQ0KPiBTb0NzLiAgSGVuY2UgYWRkIGEgZGVwZW5kZW5jeSBvbiBB
UkNIX01FRElBVEVLLCB0byBwcmV2ZW50IGFza2luZyB0aGUNCj4gdXNlciBhYm91dCB0aGlzIGRy
aXZlciB3aGVuIGNvbmZpZ3VyaW5nIGEga2VybmVsIHdpdGhvdXQgTWVkaWF0ZWsgU29DDQo+IHN1
cHBvcnQuDQo+IA0KPiBGaXhlczogNjc0NmNjODU4MjU5OTg1YSAoIkFTb0M6IG1lZGlhdGVrOiBt
dDgxOTU6IGFkZCBwbGF0Zm9ybQ0KPiBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiAtLS0NCj4gIHNvdW5kL3Nv
Yy9tZWRpYXRlay9LY29uZmlnIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVkaWF0ZWsvS2NvbmZpZyBiL3NvdW5k
L3NvYy9tZWRpYXRlay9LY29uZmlnDQo+IGluZGV4IGNmNTY3YTg5ZjQyMWI0YzAuLmM4YzgxNWY1
OTlkYTkwYmYgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9tZWRpYXRlay9LY29uZmlnDQo+ICsr
KyBiL3NvdW5kL3NvYy9tZWRpYXRlay9LY29uZmlnDQo+IEBAIC0xODcsNiArMTg3LDcgQEAgY29u
ZmlnIFNORF9TT0NfTVQ4MTkyX01UNjM1OV9SVDEwMTVfUlQ1NjgyDQo+ICANCj4gIGNvbmZpZyBT
TkRfU09DX01UODE5NQ0KPiAgCXRyaXN0YXRlICJBU29DIHN1cHBvcnQgZm9yIE1lZGlhdGVrIE1U
ODE5NSBjaGlwIg0KPiArCWRlcGVuZHMgb24gQVJDSF9NRURJQVRFSyB8fCBDT01QSUxFX1RFU1QN
Cj4gIAlzZWxlY3QgU05EX1NPQ19NRURJQVRFSw0KPiAgCWhlbHANCj4gIAkgIFRoaXMgYWRkcyBB
U29DIHBsYXRmb3JtIGRyaXZlciBzdXBwb3J0IGZvciBNZWRpYXRlayBNVDgxOTUNCj4gY2hpcA0K
DQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoIGZpcnN0Lg0KSSByZWFsbHkgbWlz
c2VkIHRoZSBkZXBlbmRlbmN5IGRlY2xhcmF0aW9uLg0KQnV0IHdlIG9ubHkgdGVzdCAiZGVwZW5k
cyBvbiBBUkNIX01FRElBVEVLIiBpbnRlcm5hbGx5LCBtYXliZSByZW1vdmluZw0KIkNPTVBJTEVf
VEVTVCIgbGlrZSBvdGhlciBNVEsgc2VyaWVzIGlzIGJldHRlciBmb3IgdGhlIG1haW50ZW5hbmNl
IGluDQp0aGUgZnV0dXJlLg0KDQpUaGFua3MsDQpUcmV2b3INCg==

