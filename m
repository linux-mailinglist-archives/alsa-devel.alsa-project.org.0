Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A22949B2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87409173A;
	Wed, 21 Oct 2020 10:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87409173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603270655;
	bh=2eA5mKkZSX/w+1QgOhh4/7GoKxQze5d+ZVQZMBmbcxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2hv9n/TkewVRjk+tBttLmoPUE1BQ0y77W2seXYNOVy2UcnMQjiw3Z8wtO/HO4D3w
	 JjEDAeLHZRJp0FlxxXyYeBvqJeqsIbKIAi2o729zndRuC5jFQdvN4sGiV04Fjty4yd
	 16H1gAmUI3R06ftllktPXJb2aTgi4ISOLq44fBD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D75D0F804DF;
	Wed, 21 Oct 2020 10:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3987EF804B2; Wed, 21 Oct 2020 10:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 8F7B5F80272
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 10:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F7B5F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="quSHh30X"
X-UUID: c96df0d139f843daa4f1b0bd657be934-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2eA5mKkZSX/w+1QgOhh4/7GoKxQze5d+ZVQZMBmbcxQ=; 
 b=quSHh30Xph9924O/gI9tAL0JKzJ+Ve+wVavHYPhoo1TRcXecFe1jENpBK0hNFR/Nrmpcju4B3y5/6Q7KivT43Kq2KoEA929mQgWayZ3wSC9Ebm60ypL2VW+xN3hqh52PzpzeaHzRsonkCntHkgsHlYRzYTFWcqJzED5HbONy49g=;
X-UUID: c96df0d139f843daa4f1b0bd657be934-20201021
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1872985398; Wed, 21 Oct 2020 16:54:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 16:54:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Oct 2020 16:54:00 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 3/5] dt-bindings: mediatek: mt8192: add audio afe document
Date: Wed, 21 Oct 2020 16:53:53 +0800
Message-ID: <1603270435-3548-4-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
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

VGhpcyBwYXRjaCBhZGRzIG10ODE5MiBhdWRpbyBhZmUgZG9jdW1lbnQuDQoNClRoaXMgcGF0Y2gg
ZGVwZW5kcyBvbiBmb2xsb3dpbmcgc2VyaWVzIHRoYXQgaGFzIG5vdCBiZWVuIGFjY2VwdGVkOg0K
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTc1MjIzMQ0KKGR0LWJpbmRpbmdz
L2Nsb2NrL210ODE5Mi1jbGsuaCBpcyBpbmNsdWRlZCBpbiBpdC4pDQpodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzExNzU1ODk1DQooZHQtYmluZGluZ3MvcG93ZXIvbXQ4MTkyLXBv
d2VyLmggaXMgaW5jbHVkZWQgaW4gaXQuKQ0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3
b3JrL3BhdGNoLzEzMjExMTgNCihkdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1y
ZXNldHMuaCBpcyBpbmNsdWRlZCBpbiBpdC4pDQoNClNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8
amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIC4uLi9iaW5kaW5ncy9zb3VuZC9tdDgxOTIt
YWZlLXBjbS55YW1sICAgICAgICB8IDEwMyArKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hh
bmdlZCwgMTAzIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwNCg0KZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZl
LXBjbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5
Mi1hZmUtcGNtLnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAw
Li43YzJmMDdiOGI2NmRkDQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbA0KQEAgLTAsMCArMSwxMDMg
QEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgQlNELTItQ2xhdXNl
KQ0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
c291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbCMNCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTogTWVkaWF0ZWsgQUZFIFBDTSBj
b250cm9sbGVyIGZvciBtdDgxOTINCisNCittYWludGFpbmVyczoNCisgICAtIEppYXhpbiBZdSA8
amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCisgICAtIFNoYW5lIENoaWVuIDxzaGFuZS5jaGllbkBt
ZWRpYXRlay5jb20+DQorDQorcHJvcGVydGllczoNCisgIGNvbXBhdGlibGU6DQorICAgICAgY29u
c3Q6IG1lZGlhdGVrLG10ODE5Mi1hdWRpbw0KKw0KKyAgaW50ZXJydXB0czoNCisgICAgbWF4SXRl
bXM6IDENCisNCisgIHJlc2V0czoNCisgICAgbWF4SXRlbXM6IDENCisNCisgIHJlc2V0LW5hbWVz
Og0KKyAgICBjb25zdDogYXVkaW9zeXMNCisNCisgIG1lZGlhdGVrLGFwbWl4ZWRzeXM6DQorICAg
ICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlIg0KKyAgICBt
YXhJdGVtczogMQ0KKyAgICBkZXNjcmlwdGlvbjogVGhlIHBoYW5kbGUgb2YgdGhlIG1lZGlhdGVr
IGFwbWl4ZWRzeXMgY29udHJvbGxlcg0KKw0KKyAgbWVkaWF0ZWssaW5mcmFjZmc6DQorICAgICRy
ZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlIg0KKyAgICBtYXhJ
dGVtczogMQ0KKyAgICBkZXNjcmlwdGlvbjogVGhlIHBoYW5kbGUgb2YgdGhlIG1lZGlhdGVrIGlu
ZnJhY2ZnIGNvbnRyb2xsZXINCisNCisgIG1lZGlhdGVrLHRvcGNrZ2VuOg0KKyAgICAkcmVmOiAi
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSINCisgICAgbWF4SXRlbXM6
IDENCisgICAgZGVzY3JpcHRpb246IFRoZSBwaGFuZGxlIG9mIHRoZSBtZWRpYXRlayB0b3Bja2dl
biBjb250cm9sbGVyDQorDQorICBwb3dlci1kb21haW5zOg0KKyAgICBtYXhJdGVtczogMQ0KKw0K
KyAgY2xvY2tzOg0KKyAgICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBBRkUgY2xvY2sN
CisgICAgICAtIGRlc2NyaXB0aW9uOiBBRERBIERBQyBjbG9jaw0KKyAgICAgIC0gZGVzY3JpcHRp
b246IEFEREEgREFDIHByZS1kaXN0b3J0aW9uIGNsb2NrDQorICAgICAgLSBkZXNjcmlwdGlvbjog
YXVkaW8gaW5mcmEgc3lzIGNsb2NrDQorICAgICAgLSBkZXNjcmlwdGlvbjogYXVkaW8gaW5mcmEg
MjZNIGNsb2NrDQorDQorICBjbG9jay1uYW1lczoNCisgICAgaXRlbXM6DQorICAgICAgLSBjb25z
dDogYXVkX2FmZV9jbGsNCisgICAgICAtIGNvbnN0OiBhdWRfZGFjX2Nsaw0KKyAgICAgIC0gY29u
c3Q6IGF1ZF9kYWNfcHJlZGlzX2Nsaw0KKyAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV9jbGsNCisg
ICAgICAtIGNvbnN0OiBhdWRfaW5mcmFfMjZtX2Nsaw0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21w
YXRpYmxlDQorICAtIGludGVycnVwdHMNCisgIC0gcmVzZXRzDQorICAtIHJlc2V0LW5hbWVzDQor
ICAtIG1lZGlhdGVrLGFwbWl4ZWRzeXMNCisgIC0gbWVkaWF0ZWssaW5mcmFjZmcNCisgIC0gbWVk
aWF0ZWssdG9wY2tnZW4NCisgIC0gcG93ZXItZG9tYWlucw0KKyAgLSBjbG9ja3MNCisgIC0gY2xv
Y2stbmFtZXMNCisNCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCisNCitleGFtcGxlczoN
CisgIC0gfA0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oPg0K
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5o
Pg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+
DQorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxOTItcG93ZXIuaD4NCisgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oPg0K
Kw0KKyAgICBhZmU6IG10ODE5Mi1hZmUtcGNtIHsNCisgICAgICAgIGNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTkyLWF1ZGlvIjsNCisgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAyMDIg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQorICAgICAgICByZXNldHMgPSA8JndhdGNoZG9nIE1UODE5
Ml9UT1BSR1VfQVVESU9fU1dfUlNUPjsNCisgICAgICAgIHJlc2V0LW5hbWVzID0gImF1ZGlvc3lz
IjsNCisgICAgICAgIG1lZGlhdGVrLGFwbWl4ZWRzeXMgPSA8JmFwbWl4ZWRzeXM+Ow0KKyAgICAg
ICAgbWVkaWF0ZWssaW5mcmFjZmcgPSA8JmluZnJhY2ZnPjsNCisgICAgICAgIG1lZGlhdGVrLHRv
cGNrZ2VuID0gPCZ0b3Bja2dlbj47DQorICAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMg
TVQ4MTkyX1BPV0VSX0RPTUFJTl9BVURJTz47DQorICAgICAgICBjbG9ja3MgPSA8JmF1ZHN5cyBD
TEtfQVVEX0FGRT4sDQorICAgICAgICAgICAgICAgICA8JmF1ZHN5cyBDTEtfQVVEX0RBQz4sDQor
ICAgICAgICAgICAgICAgICA8JmF1ZHN5cyBDTEtfQVVEX0RBQ19QUkVESVM+LA0KKyAgICAgICAg
ICAgICAgICAgPCZpbmZyYWNmZyBDTEtfSU5GUkFfQVVESU8+LA0KKyAgICAgICAgICAgICAgICAg
PCZpbmZyYWNmZyBDTEtfSU5GUkFfQVVESU9fMjZNX0I+Ow0KKyAgICAgICAgY2xvY2stbmFtZXMg
PSAiYXVkX2FmZV9jbGsiLA0KKyAgICAgICAgICAgICAgICAgICAgICAiYXVkX2RhY19jbGsiLA0K
KyAgICAgICAgICAgICAgICAgICAgICAiYXVkX2RhY19wcmVkaXNfY2xrIiwNCisgICAgICAgICAg
ICAgICAgICAgICAgImF1ZF9pbmZyYV9jbGsiLA0KKyAgICAgICAgICAgICAgICAgICAgICAiYXVk
X2luZnJhXzI2bV9jbGsiOw0KKyAgICB9Ow0KKw0KKy4uLg0KLS0gDQoyLjE4LjANCg==

