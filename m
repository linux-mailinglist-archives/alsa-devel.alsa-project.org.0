Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC4280E25
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 09:37:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912951EE9;
	Fri,  2 Oct 2020 09:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912951EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601624270;
	bh=nj/HQeeWysvsdflYN4/vv8Sy4EbCpZBoM/GKszwlsR8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4atYNTkh3cf4lubBoqsXg6vB6j0CDzxRpybShh0f+mtKDX1a8j/HdNG/0C0389qd
	 lg88vt63D+oqWSOLDejlKaw2kC4rWDv5gKHfN4xNyujiSx2Ue3WmCOmBEV5XLAcZvG
	 a5PUgmPcXnNtgov8fhdF+SFJzllLcjCdJOGepr68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D7DF80292;
	Fri,  2 Oct 2020 09:36:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24C09F801ED; Fri,  2 Oct 2020 09:36:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 48726F801ED
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 09:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48726F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="Q3mPNlX7"
X-UUID: 87c132f564574332a879acfb1f470b4d-20201002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nj/HQeeWysvsdflYN4/vv8Sy4EbCpZBoM/GKszwlsR8=; 
 b=Q3mPNlX7LbJzCGMMhr2kMLs+nOgcmLgDW6RoBbLw2iKT0JsnT6Rfy4yyCO2wnJQhCPDX3nOToW2A9aJdIo0IrgkkVMM5Ze9zZeGgFAKNIsz0+RUzHfE6BaZcUnkeGsHsxZV9+0C6zd/yLhPM2FdCsDa3K3H9WMtTLmpEo2/WeVw=;
X-UUID: 87c132f564574332a879acfb1f470b4d-20201002
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 827953107; Fri, 02 Oct 2020 15:35:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Oct 2020 15:35:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Oct 2020 15:35:45 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
Date: Fri, 2 Oct 2020 15:35:40 +0800
Message-ID: <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 maowenan@huawei.com, kuninori.morimoto.gx@renesas.com
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
Ynk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIC4uLi9iaW5kaW5n
cy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sICAgICAgICB8IDk4ICsrKysrKysrKysrKysrKysr
KysNCiAxIGZpbGUgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20u
eWFtbA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL210ODE5Mi1hZmUtcGNtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4
IDAwMDAwMDAwMDAwMDAuLjQzODUyMzE1ZjE4NjcNCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sDQpA
QCAtMCwwICsxLDk4IEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKyVZ
QU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQv
bXQ4MTkyLWFmZS1wY20ueWFtbCMNCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTogTWVkaWF0ZWsgQUZFIFBDTSBjb250cm9s
bGVyIGZvciBtdDgxOTINCisNCittYWludGFpbmVyczoNCisgICAtIEppYXhpbiBZdSA8amlheGlu
Lnl1QG1lZGlhdGVrLmNvbT4NCisgICAtIFNoYW5lIENoaWVuIDxzaGFuZS5jaGllbkBtZWRpYXRl
ay5jb20+DQorDQorcHJvcGVydGllczoNCisgIGNvbXBhdGlibGU6DQorICAgIGNvbnRhaW5zOg0K
KyAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTItYXVkaW8NCisNCisgIGludGVycnVwdHM6DQor
ICAgIG1heEl0ZW1zOiAxDQorICAgIGRlc2NyaXB0aW9uOiBBRkUgaW50ZXJydXB0IGxpbmUNCisN
CisgIHJlc2V0czoNCisgICAgbWF4SXRlbXM6IDENCisNCisgIHJlc2V0LW5hbWVzOg0KKyAgICBj
b25zdDogYXVkaW9zeXMNCisNCisgIGFwbWl4ZWRzeXM6DQorICAgIG1heEl0ZW1zOiAxDQorICAg
IGRlc2NyaXB0aW9uOiBUaGUgbWVkaWF0ZWsgYXBtaXhlZHN5cyBjb250cm9sbGVyDQorDQorICBp
bmZyYWNmZzoNCisgICAgbWF4SXRlbXM6IDENCisgICAgZGVzY3JpcHRpb246IFRoZSBtZWRpYXRl
ayBpbmZyYWNmZyBjb250cm9sbGVyDQorDQorICB0b3Bja2dlbjoNCisgICAgbWF4SXRlbXM6IDEN
CisgICAgZGVzY3JpcHRpb246IFRoZSBtZWRpYXRlayB0b3Bja2dlbiBjb250cm9sbGVyDQorDQor
ICBwb3dlci1kb21haW5zOg0KKyAgICBtYXhJdGVtczogMQ0KKw0KKyAgY2xvY2tzOg0KKyAgICBp
dGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBBRkUgY2xvY2sNCisgICAgICAtIGRlc2NyaXB0
aW9uOiBBRERBIERBQyBjbG9jaw0KKyAgICAgIC0gZGVzY3JpcHRpb246IEFEREEgREFDIHByZS1k
aXN0b3J0aW9uIGNsb2NrDQorICAgICAgLSBkZXNjcmlwdGlvbjogYXVkaW8gaW5mcmEgc3lzIGNs
b2NrDQorICAgICAgLSBkZXNjcmlwdGlvbjogYXVkaW8gaW5mcmEgMjZNIGNsb2NrDQorDQorICBj
bG9jay1uYW1lczoNCisgICAgaXRlbXM6DQorICAgICAgLSBjb25zdDogYXVkX2FmZV9jbGsNCisg
ICAgICAtIGNvbnN0OiBhdWRfZGFjX2Nsaw0KKyAgICAgIC0gY29uc3Q6IGF1ZF9kYWNfcHJlZGlz
X2Nsaw0KKyAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV9jbGsNCisgICAgICAtIGNvbnN0OiBhdWRf
aW5mcmFfMjZtX2Nsaw0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorICAtIGludGVy
cnVwdHMNCisgIC0gcmVzZXRzDQorICAtIHJlc2V0LW5hbWVzDQorICAtIHBvd2VyLWRvbWFpbnMN
CisgIC0gY2xvY2tzDQorICAtIGNsb2NrLW5hbWVzDQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2Nsb2NrL210ODE5Mi1jbGsuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2lycS5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIv
bXQ4MTkyLXBvd2VyLmg+DQorDQorICAgIGFmZTogbXQ4MTkyLWFmZS1wY20gew0KKyAgICAgICAg
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItYXVkaW8iOw0KKyAgICAgICAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDIwMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCisgICAgICAgIHJlc2V0cyA9
IDwmd2F0Y2hkb2cgTVQ4MTkyX1RPUFJHVV9BVURJT19TV19SU1Q+Ow0KKyAgICAgICAgcmVzZXQt
bmFtZXMgPSAiYXVkaW9zeXMiOw0KKyAgICAgICAgYXBtaXhlZHN5cyA9IDwmYXBtaXhlZHN5cz47
DQorICAgICAgICBpbmZyYWNmZyA9IDwmaW5mcmFjZmc+Ow0KKyAgICAgICAgdG9wY2tnZW4gPSA8
JnRvcGNrZ2VuPjsNCisgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxOTJfUE9X
RVJfRE9NQUlOX0FVRElPPjsNCisgICAgICAgIGNsb2NrcyA9IDwmYXVkc3lzIENMS19BVURfQUZF
PiwNCisgICAgICAgICAgICAgICAgIDwmYXVkc3lzIENMS19BVURfREFDPiwNCisgICAgICAgICAg
ICAgICAgIDwmYXVkc3lzIENMS19BVURfREFDX1BSRURJUz4sDQorICAgICAgICAgICAgICAgICA8
JmluZnJhY2ZnIENMS19JTkZSQV9BVURJTz4sDQorICAgICAgICAgICAgICAgICA8JmluZnJhY2Zn
IENMS19JTkZSQV9BVURJT18yNk1fQj47DQorICAgICAgICBjbG9jay1uYW1lcyA9ICJhdWRfYWZl
X2NsayIsDQorICAgICAgICAgICAgICAgICAgICAgICJhdWRfZGFjX2NsayIsDQorICAgICAgICAg
ICAgICAgICAgICAgICJhdWRfZGFjX3ByZWRpc19jbGsiLA0KKyAgICAgICAgICAgICAgICAgICAg
ICAiYXVkX2luZnJhX2NsayIsDQorICAgICAgICAgICAgICAgICAgICAgICJhdWRfaW5mcmFfMjZt
X2NsayI7DQorICAgIH07DQorDQorLi4uDQotLSANCjIuMTguMA0K

