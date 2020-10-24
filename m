Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B5297B1B
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 08:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317831825;
	Sat, 24 Oct 2020 08:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317831825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603521809;
	bh=z8uG4a3bYliZ7FsgCx8o/eOtrJLS0cww4SngmK83wEA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/CJmDbTBx11+OgrBRAqRB+UFEfOXbB5Rkeztf38G7ALj0zlMGinFOT4iH6oo8Nwt
	 Sf1SgoG7eSPhn+XreN0pkLiFmmEa/jDMirh1tgFpZAg1Bqt0epPYFaqdPXx+CU4cXt
	 QZEsGh6m5tNY+UWxxNDSfvN56Dm3orhzG2Du7ivs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48477F804AD;
	Sat, 24 Oct 2020 08:41:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13E32F804A9; Sat, 24 Oct 2020 08:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 9DCDBF8025F
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 08:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DCDBF8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="djoDf9K8"
X-UUID: 4cbf253a646845a49be5dae87f805810-20201024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z8uG4a3bYliZ7FsgCx8o/eOtrJLS0cww4SngmK83wEA=; 
 b=djoDf9K8nRyrU9Vt5oEHrHdVZaNaEyHIqQOLdV+uXwkOVhmnqmSXE3r3MAw8RyJu2L3e6qpe/1rh0n0/QY6MRwn63hIeq643gV+gCH5u/vWL2tDHN2qgeHf9a+VfFxDCDxMq2hLjwbGPqkiYrPpxUXdNHhnj9SpEsVFKK5vF6u4=;
X-UUID: 4cbf253a646845a49be5dae87f805810-20201024
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1604815674; Sat, 24 Oct 2020 14:41:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 14:41:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 14:41:29 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <tiwai@suse.com>, <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt8192: add ul-delay-ms property
Date: Sat, 24 Oct 2020 14:41:26 +0800
Message-ID: <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>
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

V2UgY2FuIGNob29zZSB0byBkcm9wIGFueSBsZW5ndGggb2YgZGF0YSBmcm9tIHRoZSBiZWdpbm5p
bmcgYWNjb3JkaW5nDQphY2Nyb2RpbmcgJ3VsLWRlbGF5LW1zJy4NCg0KU2lnbmVkLW9mZi1ieTog
SmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210NjM1OS55YW1sIHwgNiArKysrKysNCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ2MzU5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ2MzU5LnlhbWwNCmluZGV4IGE1NGY0NjZmNzY5ZDQuLmZk
MmQwMmM5N2ZlN2MgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvbXQ2MzU5LnlhbWwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb3VuZC9tdDYzNTkueWFtbA0KQEAgLTQ5LDYgKzQ5LDExIEBAIHByb3BlcnRpZXM6DQog
ICAgIGRlc2NyaXB0aW9uOiB8DQogICAgICAgU3BlY2lmaWVzIHRoZSB0eXBlIG9mIG1pYyB0eXBl
IGNvbm5lY3RlZCB0byBhZGMyDQogDQorICBtZWRpYXRlayx1bC1kZWxheS1tczoNCisgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQorICAgIGRlc2NyaXB0
aW9uOiB8DQorICAgICAgU2tpcCBmaXJzdCB0aW1lIGRhdGEgYXQgdGhlIGJlZ2lubmluZyBvZiBE
TUlDIHJlY29yZGluZw0KKw0KIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KIA0KIGV4YW1w
bGVzOg0KQEAgLTU2LDYgKzYxLDcgQEAgZXhhbXBsZXM6DQogICAgIG10NjM1OWNvZGVjOiBtdDYz
NTljb2RlYyB7DQogICAgICAgbWVkaWF0ZWssZG1pYy1tb2RlID0gPDA+Ow0KICAgICAgIG1lZGlh
dGVrLG1pYy10eXBlLTAgPSA8Mj47DQorICAgICAgbWVkaWF0ZWssdWwtZGVsYXktbXMgPSA8NTA+
Ow0KICAgICB9Ow0KIA0KIC4uLg0KLS0gDQoyLjE4LjANCg==

