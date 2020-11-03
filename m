Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F6E2A3E42
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 09:02:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C001607;
	Tue,  3 Nov 2020 09:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C001607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390528;
	bh=3AjCwyELXJsAF7KDdOI9+UHESz6oEunbkSh/sKmq2DQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ustsYf/2CEs4/gDOeibB5tFvXOL6THvFhV6AGKduAiCdkjiJxnc37JPN635jMjOzl
	 vdjESOIlpQXMgDq8rqur2nGd7SHzc7oH75ltiJJos6B06nR+hYkjugm3Ag2BXm6OL0
	 DSNxRWuz/9Xn/4u+gXk8iWKhGg/jEu+MuWFj3jyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1785F8057B;
	Tue,  3 Nov 2020 09:00:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1DEEF804E4; Tue,  3 Nov 2020 09:00:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id DFE63F80279
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 08:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE63F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="XHjZTwak"
X-UUID: b49463b3748547fb9ab577f9d8370c87-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3AjCwyELXJsAF7KDdOI9+UHESz6oEunbkSh/sKmq2DQ=; 
 b=XHjZTwakj15FEalg7d7rD3uLi0JUIxFv/WdWqmjKj1Ef4mxFoJJrrt0Axuq2OvQtf/AVeglMFAbCd2dcXKPbSxAGw3CKgwKVccrGh8i9PmV3gIr/ltKDCr2bjdkyAGl+7/SKeAgNKwuV9UBj3gSHs4+YEtkSs4lgkuB+QyGMPgo=;
X-UUID: b49463b3748547fb9ab577f9d8370c87-20201103
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1619352867; Tue, 03 Nov 2020 15:59:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:59:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 15:59:48 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 7/9] dt-bindings: mediatek: mt8192: add audio afe document
Date: Tue, 3 Nov 2020 15:59:36 +0800
Message-ID: <1604390378-23993-8-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
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

VGhpcyBwYXRjaCBhZGRzIG10ODE5MiBhdWRpbyBhZmUgZG9jdW1lbnQuDQoNClNpZ25lZC1vZmYt
Ynk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KVGhpcyBwYXRjaCBk
ZXBlbmRzIG9uIGZvbGxvd2luZyBzZXJpZXMgdGhhdCBoYXMgbm90IGJlZW4gYWNjZXB0ZWQ6DQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExNzUyMjMxDQooZHQtYmluZGluZ3Mv
Y2xvY2svbXQ4MTkyLWNsay5oIGlzIGluY2x1ZGVkIGluIGl0LikNCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTE3NTU4OTUNCihkdC1iaW5kaW5ncy9wb3dlci9tdDgxOTItcG93
ZXIuaCBpcyBpbmNsdWRlZCBpbiBpdC4pDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdv
cmsvcGF0Y2gvMTMyMTExOA0KKGR0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJl
c2V0cy5oIGlzIGluY2x1ZGVkIGluIGl0LikNCg0KIC4uLi9iaW5kaW5ncy9zb3VuZC9tdDgxOTIt
YWZlLXBjbS55YW1sICAgICAgICB8IDEwMCArKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hh
bmdlZCwgMTAwIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwNCg0KZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZl
LXBjbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5
Mi1hZmUtcGNtLnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAw
Li4wMTcwYzkzODAyZDI5DQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbA0KQEAgLTAsMCArMSwxMDAg
QEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkNCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwjDQorJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQorDQordGl0bGU6IE1lZGlhdGVrIEFGRSBQ
Q00gY29udHJvbGxlciBmb3IgbXQ4MTkyDQorDQorbWFpbnRhaW5lcnM6DQorICAgLSBKaWF4aW4g
WXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQorICAgLSBTaGFuZSBDaGllbiA8c2hhbmUuY2hp
ZW5AbWVkaWF0ZWsuY29tPg0KKw0KK3Byb3BlcnRpZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICAg
IGNvbnN0OiBtZWRpYXRlayxtdDgxOTItYXVkaW8NCisNCisgIGludGVycnVwdHM6DQorICAgIG1h
eEl0ZW1zOiAxDQorDQorICByZXNldHM6DQorICAgIG1heEl0ZW1zOiAxDQorDQorICByZXNldC1u
YW1lczoNCisgICAgY29uc3Q6IGF1ZGlvc3lzDQorDQorICBtZWRpYXRlayxhcG1peGVkc3lzOg0K
KyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSINCisg
ICAgZGVzY3JpcHRpb246IFRoZSBwaGFuZGxlIG9mIHRoZSBtZWRpYXRlayBhcG1peGVkc3lzIGNv
bnRyb2xsZXINCisNCisgIG1lZGlhdGVrLGluZnJhY2ZnOg0KKyAgICAkcmVmOiAiL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSINCisgICAgZGVzY3JpcHRpb246IFRoZSBw
aGFuZGxlIG9mIHRoZSBtZWRpYXRlayBpbmZyYWNmZyBjb250cm9sbGVyDQorDQorICBtZWRpYXRl
ayx0b3Bja2dlbjoNCisgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3BoYW5kbGUiDQorICAgIGRlc2NyaXB0aW9uOiBUaGUgcGhhbmRsZSBvZiB0aGUgbWVkaWF0ZWsg
dG9wY2tnZW4gY29udHJvbGxlcg0KKw0KKyAgcG93ZXItZG9tYWluczoNCisgICAgbWF4SXRlbXM6
IDENCisNCisgIGNsb2NrczoNCisgICAgaXRlbXM6DQorICAgICAgLSBkZXNjcmlwdGlvbjogQUZF
IGNsb2NrDQorICAgICAgLSBkZXNjcmlwdGlvbjogQUREQSBEQUMgY2xvY2sNCisgICAgICAtIGRl
c2NyaXB0aW9uOiBBRERBIERBQyBwcmUtZGlzdG9ydGlvbiBjbG9jaw0KKyAgICAgIC0gZGVzY3Jp
cHRpb246IGF1ZGlvIGluZnJhIHN5cyBjbG9jaw0KKyAgICAgIC0gZGVzY3JpcHRpb246IGF1ZGlv
IGluZnJhIDI2TSBjbG9jaw0KKw0KKyAgY2xvY2stbmFtZXM6DQorICAgIGl0ZW1zOg0KKyAgICAg
IC0gY29uc3Q6IGF1ZF9hZmVfY2xrDQorICAgICAgLSBjb25zdDogYXVkX2RhY19jbGsNCisgICAg
ICAtIGNvbnN0OiBhdWRfZGFjX3ByZWRpc19jbGsNCisgICAgICAtIGNvbnN0OiBhdWRfaW5mcmFf
Y2xrDQorICAgICAgLSBjb25zdDogYXVkX2luZnJhXzI2bV9jbGsNCisNCityZXF1aXJlZDoNCisg
IC0gY29tcGF0aWJsZQ0KKyAgLSBpbnRlcnJ1cHRzDQorICAtIHJlc2V0cw0KKyAgLSByZXNldC1u
YW1lcw0KKyAgLSBtZWRpYXRlayxhcG1peGVkc3lzDQorICAtIG1lZGlhdGVrLGluZnJhY2ZnDQor
ICAtIG1lZGlhdGVrLHRvcGNrZ2VuDQorICAtIHBvd2VyLWRvbWFpbnMNCisgIC0gY2xvY2tzDQor
ICAtIGNsb2NrLW5hbWVzDQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhh
bXBsZXM6DQorICAtIHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE5Mi1j
bGsuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2Fy
bS1naWMuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVy
L2lycS5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvbXQ4MTkyLXBvd2VyLmg+
DQorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNl
dHMuaD4NCisNCisgICAgYWZlOiBtdDgxOTItYWZlLXBjbSB7DQorICAgICAgICBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE5Mi1hdWRpbyI7DQorICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMjAyIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KKyAgICAgICAgcmVzZXRzID0gPCZ3YXRjaGRv
ZyBNVDgxOTJfVE9QUkdVX0FVRElPX1NXX1JTVD47DQorICAgICAgICByZXNldC1uYW1lcyA9ICJh
dWRpb3N5cyI7DQorICAgICAgICBtZWRpYXRlayxhcG1peGVkc3lzID0gPCZhcG1peGVkc3lzPjsN
CisgICAgICAgIG1lZGlhdGVrLGluZnJhY2ZnID0gPCZpbmZyYWNmZz47DQorICAgICAgICBtZWRp
YXRlayx0b3Bja2dlbiA9IDwmdG9wY2tnZW4+Ow0KKyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwm
c2Nwc3lzIE1UODE5Ml9QT1dFUl9ET01BSU5fQVVESU8+Ow0KKyAgICAgICAgY2xvY2tzID0gPCZh
dWRzeXMgQ0xLX0FVRF9BRkU+LA0KKyAgICAgICAgICAgICAgICAgPCZhdWRzeXMgQ0xLX0FVRF9E
QUM+LA0KKyAgICAgICAgICAgICAgICAgPCZhdWRzeXMgQ0xLX0FVRF9EQUNfUFJFRElTPiwNCisg
ICAgICAgICAgICAgICAgIDwmaW5mcmFjZmcgQ0xLX0lORlJBX0FVRElPPiwNCisgICAgICAgICAg
ICAgICAgIDwmaW5mcmFjZmcgQ0xLX0lORlJBX0FVRElPXzI2TV9CPjsNCisgICAgICAgIGNsb2Nr
LW5hbWVzID0gImF1ZF9hZmVfY2xrIiwNCisgICAgICAgICAgICAgICAgICAgICAgImF1ZF9kYWNf
Y2xrIiwNCisgICAgICAgICAgICAgICAgICAgICAgImF1ZF9kYWNfcHJlZGlzX2NsayIsDQorICAg
ICAgICAgICAgICAgICAgICAgICJhdWRfaW5mcmFfY2xrIiwNCisgICAgICAgICAgICAgICAgICAg
ICAgImF1ZF9pbmZyYV8yNm1fY2xrIjsNCisgICAgfTsNCisNCisuLi4NCi0tIA0KMi4xOC4wDQo=

