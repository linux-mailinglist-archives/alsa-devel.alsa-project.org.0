Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2D2C88EB
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:06:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3600172A;
	Mon, 30 Nov 2020 17:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3600172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606752367;
	bh=rpAMDBkoeFo8W0cy6bid/o7y+EWjx5Ig87Rqy/uMEQU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OleBxH5jxePqxJ6cetejcQccDJnJPNOwcL1h3Dgfidw/HDA1xh20RZPBQNaB8Kz0D
	 Dd579G48Gfqbjm0/QFI4wil7mMNXtgvMMsxM2J+L6CeLSGdVstPi5q9WXp8s/W+WSj
	 1OFDC/axVH/PBEw31+KSZyTMF0kBS6AqGkGGjBAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEC84F804D8;
	Mon, 30 Nov 2020 17:03:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A40A9F8025F; Mon, 30 Nov 2020 04:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 348A5F80247
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 04:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 348A5F80247
X-UUID: 6c9316236f4c4bcbaddb16bff1161f5a-20201130
X-UUID: 6c9316236f4c4bcbaddb16bff1161f5a-20201130
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <lumi.lee@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1355198473; Mon, 30 Nov 2020 11:11:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Nov 2020 11:11:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 30 Nov 2020 11:11:30 +0800
From: Lumi Lee <Lumi.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: mediatek: btcvsd fix tx stream assign
Date: Mon, 30 Nov 2020 11:11:15 +0800
Message-ID: <1606705875-1940-1-git-send-email-Lumi.Lee@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 30 Nov 2020 17:02:42 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, Lumi Lee <lumi.lee@mediatek.com>,
 Shane.Chien@mediatek.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com
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

From: Lumi Lee <lumi.lee@mediatek.com>

Fix tx/rx stream assign in write.
Write should use tx instead of rx.

Signed-off-by: Lumi Lee <lumi.lee@mediatek.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 668fef3..a554c57 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -808,7 +808,7 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 		spin_unlock_irqrestore(&bt->tx_lock, flags);
 
 		if (!avail) {
-			int ret = wait_for_bt_irq(bt, bt->rx);
+			int ret = wait_for_bt_irq(bt, bt->tx);
 
 			if (ret)
 				return written_size;
-- 
1.7.9.5

