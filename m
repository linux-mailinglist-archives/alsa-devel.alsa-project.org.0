Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3F297B1C
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 08:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0F617EF;
	Sat, 24 Oct 2020 08:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0F617EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603521848;
	bh=DQPo+D8DmTE+gRly/pqrKB2WAr0Beeu56QSN7DCokCo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NtlSG2AF2PJbVPtU9/sIqtYf7poEZ+1JzOVPNq52FgRBlYqqurbXthoZ//YExh4gv
	 uFBbhxNNHG/M+YAZkJJXsSQnOySZiO3n8T+9XIIiZ6hbdqlPv7kYpWrglwHvw3pIxs
	 xvQUBNJrzqWddfKimpNCnWAXtmsEhWkqgBOYdz3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B440BF804BD;
	Sat, 24 Oct 2020 08:42:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82377F8049C; Sat, 24 Oct 2020 08:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 7F0E5F800BD
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 08:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F0E5F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="seYv3Pxw"
X-UUID: 67378a30485c40cb9ebd0e4d6b5fba0a-20201024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DQPo+D8DmTE+gRly/pqrKB2WAr0Beeu56QSN7DCokCo=; 
 b=seYv3PxweKiMNUN0HMsZZe0vCOsUJ8mRhEcQ1bVUzgGpmPkJE6vUd9QGA8vjcimWqngDZqxdiIS2wwLt4DPa3WvYTAqhGBu5Mc+RnIFzmRWAb6U8ZrfmxJuNWIYUWegfroz/26adyVbqTDyZd83OAZY4LOGJalH+JYs1WcFl9AE=;
X-UUID: 67378a30485c40cb9ebd0e4d6b5fba0a-20201024
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1467262418; Sat, 24 Oct 2020 14:41:31 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 14:41:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 14:41:28 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <tiwai@suse.com>, <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: mt6359: skip first time data at the beginning of
 DMIC recording
Date: Sat, 24 Oct 2020 14:41:24 +0800
Message-ID: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
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

VGhpcyBwYXRjaCBmaXhlZCB0aGUgcG9wIG5vaXNlIGF0IHRoZSBiZWdpbm5pbmcgb2YgRE1JQyBy
ZWNvcmRpbmcuDQoNCkppYXhpbiBZdSAoMik6DQogIEFTb0M6IG10NjM1OTogc2tpcCBmaXJzdCB0
aW1lIGRhdGEgYXQgdGhlIGJlZ2lubmluZyBvZiBETUlDIHJlY29yZGluZw0KICBkdC1iaW5kaW5n
czogbWVkaWF0ZWs6IG10ODE5MjogYWRkIHVsLWRlbGF5LW1zIHByb3BlcnR5DQoNCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDYzNTkueWFtbCAgICAgfCAgNiArKysNCiBzb3VuZC9z
b2MvY29kZWNzL210NjM1OS5jICAgICAgICAgICAgICAgICAgICAgfCAzOCArKysrKysrKysrKysr
KysrKy0tDQogc291bmQvc29jL2NvZGVjcy9tdDYzNTkuaCAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKw0KIDMgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkN
Cg0KLS0gDQoyLjE4LjANCg==

