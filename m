Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EED8B43945E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D14916D1;
	Mon, 25 Oct 2021 12:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D14916D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159528;
	bh=WUhgkLeYJxCMgVKFV56J/TSCoTVrKnDBWgz8GQ7MB8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEMI322q9qOVC6L6+S0YQ4y27SWETYodmb0WVQ9n2bLV1I3UOCyOxvdyGLraL7M5m
	 OcNRgAaKXUSOBzuO4AVQv1wBa3DAUn2pJ9+V3BGw1WRr/UP66Gas2dMcRCCEdqGL0m
	 JfR8EaFy/X6A1Tpao2zdManW+RlNQMr0qGsQWEFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9311F804F3;
	Mon, 25 Oct 2021 12:57:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05338F804E5; Mon, 25 Oct 2021 12:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by alsa1.perex.cz (Postfix) with ESMTP id B88AFF80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B88AFF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="lBwEAfxs"
X-UUID: f91e7be25dcf4db2b20f8862623b47eb-20211025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WUhgkLeYJxCMgVKFV56J/TSCoTVrKnDBWgz8GQ7MB8Q=; 
 b=lBwEAfxshRAZjsCELOZa/D/Uz8JbhGckQ4FasVTYsPeX9oHJEojz09fF7BMyLKPtt3ZaownqTcZpNjt7+6bvLumFLvNnAtrIDLoRQHw4JmDFv1jhSXWRho/6rFQiRY2seu4rKeIxR4POo+jHn9IORhKT3Y0zojWuicAxLOMaTjs=;
X-UUID: f91e7be25dcf4db2b20f8862623b47eb-20211025
Received: from mtkmbs10n1.mediatek.inc [(172.27.5.253)] by
 mailgw02.mediatek.com (envelope-from <yc.hung@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1409730941; Mon, 25 Oct 2021 18:56:49 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Oct 2021 18:56:51 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Oct 2021 18:56:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Oct 2021 18:56:51 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Date: Mon, 25 Oct 2021 18:56:35 +0800
Message-ID: <20211025105635.30625-3-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211025105635.30625-1-yc.hung@mediatek.com>
References: <20211025105635.30625-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

VGhpcyBkZXNjcmliZXMgdGhlIG10ODE5NSBEU1AgZGV2aWNlIHRyZWUgbm9kZS4NCg0KU2lnbmVk
LW9mZi1ieTogWUMgSHVuZyA8eWMuaHVuZ0BtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vYmluZGlu
Z3MvZHNwL210ayxtdDgxOTUtZHNwLnlhbWwgICAgICAgICAgfCAxMzkgKysrKysrKysrKysrKysr
KysrDQogMSBmaWxlIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kc3AvbXRrLG10ODE5NS1kc3Au
eWFtbA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rz
cC9tdGssbXQ4MTk1LWRzcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RzcC9tdGssbXQ4MTk1LWRzcC55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMDAwMDAwLi5mMTEzZjcxY2EwOTQNCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kc3AvbXRrLG10ODE5NS1kc3AueWFtbA0KQEAgLTAsMCAr
MSwxMzkgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1D
bGF1c2UpDQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9kc3AvbXRrLG10ODE5NS1kc3AueWFtbCMNCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTogTWVkaWF0ZWsgbXQ4MTk1
IERTUCBjb3JlDQorDQorbWFpbnRhaW5lcnM6DQorICAtIFlDIEh1bmcgPHljLmh1bmdAbWVkaWF0
ZWsuY29tPg0KKw0KK2Rlc2NyaXB0aW9uOiB8DQorICBTb21lIGJvYXJkcyBmcm9tIG10ODE5NSBj
b250YWluIGEgRFNQIGNvcmUgdXNlZCBmb3INCisgIGFkdmFuY2VkIHByZS0gYW5kIHBvc3QtIGF1
ZGlvIHByb2Nlc3NpbmcuDQorcHJvcGVydGllczoNCisgIGNvbXBhdGlibGU6DQorICAgIGNvbnN0
OiBtZWRpYXRlayxtdDgxOTUtZHNwDQorDQorICByZWc6DQorICAgIG1heEl0ZW1zOiAyDQorDQor
ICByZWctbmFtZXM6DQorICAgIG1heEl0ZW1zOiAyDQorDQorICBpbnRlcnJ1cHRzOg0KKyAgICBt
YXhJdGVtczogMQ0KKw0KKyAgaW50ZXJydXB0LW5hbWVzOg0KKyAgICBtYXhJdGVtczogMQ0KKw0K
KyAgY2xvY2tzOg0KKyAgICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBtdXggZm9yIGF1
ZGlvIGRzcCBjbG9jaw0KKyAgICAgIC0gZGVzY3JpcHRpb246IDI2TSBjbG9jaw0KKyAgICAgIC0g
ZGVzY3JpcHRpb246IG11eCBmb3IgYXVkaW8gZHNwIGxvY2FsIGJ1cw0KKyAgICAgIC0gZGVzY3Jp
cHRpb246IGRlZmF1bHQgYXVkaW8gZHNwIGxvY2FsIGJ1cyBjbG9jayBzb3VyY2UNCisgICAgICAt
IGRlc2NyaXB0aW9uOiBjbG9jayBnYXRlIGZvciBhdWRpbyBkc3AgY2xvY2sNCisgICAgICAtIGRl
c2NyaXB0aW9uOiBtdXggZm9yIGF1ZGlvIGRzcCBhY2Nlc3MgZXh0ZXJuYWwgYnVzDQorDQorICBj
bG9jay1uYW1lczoNCisgICAgaXRlbXM6DQorICAgICAgLSBjb25zdDogYWRzcF9zZWwNCisgICAg
ICAtIGNvbnN0OiBjbGsyNm1fY2sNCisgICAgICAtIGNvbnN0OiBhdWRpb19sb2NhbF9idXMNCisg
ICAgICAtIGNvbnN0OiBtYWlucGxsX2Q3X2QyDQorICAgICAgLSBjb25zdDogc2NwX2Fkc3BfYXVk
aW9kc3ANCisgICAgICAtIGNvbnN0OiBhdWRpb19oDQorDQorICBwb3dlci1kb21haW5zOg0KKyAg
ICBtYXhJdGVtczogMQ0KKw0KKyAgbWJveGVzOg0KKyAgICBtYXhJdGVtczogMg0KKw0KKyAgbWJv
eC1uYW1lczoNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgU3BlY2lmaWVzIHRoZSBtYWlsYm94
ZXMgdXNlZCB0byBjb21tdW5pY2F0ZSB3aXRoIGF1ZGlvIERTUA0KKyAgICBpdGVtczoNCisgICAg
ICAtIGNvbnN0OiBtYm94MA0KKyAgICAgIC0gY29uc3Q6IG1ib3gxDQorDQorICBtZW1vcnktcmVn
aW9uOg0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBwaGFuZGxlIHRvIGEgbm9kZSBkZXNjcmli
aW5nIHJlc2VydmVkIG1lbW9yeSAoU3lzdGVtIFJBTSBtZW1vcnkpDQorICAgICAgdXNlZCBieSBE
U1AgKHNlZSBiaW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkvcmVzZXJ2ZWQtbWVtb3J5LnR4dCkNCisg
ICAgbWF4SXRlbXM6IDINCisNCisgIHNvdW5kOg0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBT
b3VuZCBzdWJub2RlIGluY2x1ZGVzIEFTb0MgcGxhdGZvcm0sIERQVHggY29kZWMgbm9kZSwgYW5k
DQorICAgICAgSERNSSBjb2RlYyBub2RlLg0KKw0KKyAgICB0eXBlOiBvYmplY3QNCisNCisgICAg
cHJvcGVydGllczoNCisgICAgICBtZWRpYXRlayxwbGF0Zm9ybToNCisgICAgICAgICRyZWY6ICIv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlIg0KKyAgICAgICAgZGVzY3Jp
cHRpb246IFRoZSBwaGFuZGxlIG9mIE1UODE5NSBBU29DIHBsYXRmb3JtLg0KKw0KKyAgICAgIG1l
ZGlhdGVrLGRwdHgtY29kZWM6DQorICAgICAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvcGhhbmRsZSINCisgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgcGhhbmRsZSBv
ZiBNVDgxOTUgRGlzcGxheSBQb3J0IFR4IGNvZGVjIG5vZGUuDQorDQorICAgICAgbWVkaWF0ZWss
aGRtaS1jb2RlYzoNCisgICAgICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy9waGFuZGxlIg0KKyAgICAgICAgZGVzY3JpcHRpb246IFRoZSBwaGFuZGxlIG9mIE1UODE5
NSBIRE1JIGNvZGVjIG5vZGUuDQorDQorcmVxdWlyZWQ6DQorICAtIGNvbXBhdGlibGUNCisgIC0g
cmVnDQorICAtIHJlZy1uYW1lcw0KKyAgLSBpbnRlcnJ1cHRzDQorICAtIGludGVycnVwdC1uYW1l
cw0KKyAgLSBjbG9ja3MNCisgIC0gY2xvY2stbmFtZXMNCisgIC0gbWVtb3J5LXJlZ2lvbg0KKyAg
LSBwb3dlci1kb21haW5zDQorICAtIG1ib3gtbmFtZXMNCisgIC0gbWJveGVzDQorICAtIHNvdW5k
DQorDQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAt
IHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1n
aWMuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2ly
cS5oPg0KKyAgICBhZHNwOiBhZHNwQDEwODAzMDAwIHsNCisgICAgICAgY29tcGF0aWJsZSA9ICAi
bWVkaWF0ZWssbXQ4MTk1LWRzcCI7DQorICAgICAgIHJlZyA9IDwweDEwODAzMDAwICAweDEwMDA+
LA0KKyAgICAgICAgICAgICA8MHgxMDg0MDAwMCAgMHg0MDAwMD47DQorICAgICAgIHJlZy1uYW1l
cyA9ICJjZmciLCAic3JhbSI7DQorICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA2OTQgSVJR
X1RZUEVfTEVWRUxfSElHSCAwPjsNCisgICAgICAgaW50ZXJydXB0LW5hbWVzID0gIndkdCI7DQor
ICAgICAgIGNsb2NrcyA9IDwmdG9wY2tnZW4gMTA+LCAvL0NMS19UT1BfQURTUA0KKyAgICAgICAg
ICAgICAgICA8JmNsazI2bT4sDQorICAgICAgICAgICAgICAgIDwmdG9wY2tnZW4gMTA3PiwgLy9D
TEtfVE9QX0FVRElPX0xPQ0FMX0JVUw0KKyAgICAgICAgICAgICAgICA8JnRvcGNrZ2VuIDEzNj4s
IC8vQ0xLX1RPUF9NQUlOUExMX0Q3X0QyDQorICAgICAgICAgICAgICAgIDwmc2NwX2Fkc3AgMD4s
IC8vQ0xLX1NDUF9BRFNQX0FVRElPRFNQDQorICAgICAgICAgICAgICAgIDwmdG9wY2tnZW4gMzQ+
OyAvL0NMS19UT1BfQVVESU9fSA0KKyAgICAgICBjbG9jay1uYW1lcyA9ICJhZHNwX3NlbCIsDQor
ICAgICAgICAgICAgICAgICAgICAgImNsazI2bV9jayIsDQorICAgICAgICAgICAgICAgICAgICAg
ImF1ZGlvX2xvY2FsX2J1cyIsDQorICAgICAgICAgICAgICAgICAgICAgIm1haW5wbGxfZDdfZDIi
LA0KKyAgICAgICAgICAgICAgICAgICAgICJzY3BfYWRzcF9hdWRpb2RzcCIsDQorICAgICAgICAg
ICAgICAgICAgICAgImF1ZGlvX2giOw0KKyAgICAgICBtZW1vcnktcmVnaW9uID0gPCZhZHNwX2Rt
YV9tZW1fcmVzZXJ2ZWQ+LA0KKyAgICAgICAgICAgICAgICAgICAgICAgPCZhZHNwX21lbV9yZXNl
cnZlZD47DQorICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSA2PjsgLy9NVDgxOTVfUE9XRVJf
RE9NQUlOX0FEU1ANCisgICAgICAgbWJveC1uYW1lcyA9ICJtYm94MCIsICJtYm94MSI7DQorICAg
ICAgIG1ib3hlcyA9IDwmYWRzcF9tYWlsYm94IDA+LCA8JmFkc3BfbWFpbGJveCAxPjsNCisgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsNCisgICAgICAgc291bmQgew0KKyAgICAgICAgICAgICAg
bWVkaWF0ZWssZHB0eC1jb2RlYyA9IDwmZHBfdHg+Ow0KKyAgICAgICAgICAgICAgbWVkaWF0ZWss
aGRtaS1jb2RlYyA9IDwmaGRtaTA+Ow0KKyAgICAgICAgICAgICAgbWVkaWF0ZWsscGxhdGZvcm0g
PSA8JmFmZT47DQorICAgICAgICAgICAgIH07DQorICAgICAgIH07DQotLSANCjIuMTguMA0K

