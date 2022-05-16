Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A859527F46
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03A6716D4;
	Mon, 16 May 2022 10:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03A6716D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688562;
	bh=xnl4dqWKkRo9ZxzIepzHgdS2mF3E2MAsraScl1Hf7Nw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g6kRBmZD4xJThV1dfxr6JYerr9qq3Vbqa+vjAFMu3u33tYRqkcngeyhOWGultNEiL
	 5LdK0bVs7y402RCr5htvyGSo6rcIkJQz29n8znl+tVinUYiX1T0Ln4U7Ku4jDlBsTE
	 nBajXwTecSGtpbEnUxo15yr8d+m9Qxtzopc7gbHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1901DF8057C;
	Mon, 16 May 2022 10:04:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6141CF8012F; Mon, 16 May 2022 08:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 729E4F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 08:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 729E4F800F8
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L1q362pTCzhZGv;
 Mon, 16 May 2022 14:24:18 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 14:25:04 +0800
From: Lu Wei <luwei32@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next] ALSA: ice1724: return void from
 snd_vt1724_chip_init()
Date: Mon, 16 May 2022 14:25:46 +0800
Message-ID: <20220516062546.253656-1-luwei32@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:52 +0200
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

Return int in snd_vt1724_chip_init() is useless since it always
returns 0.

Signed-off-by: Lu Wei <luwei32@huawei.com>
---
 sound/pci/ice1712/ice1724.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 6fab2ad85bbe..dfef468ad6dc 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2347,7 +2347,7 @@ static void snd_vt1724_chip_reset(struct snd_ice1712 *ice)
 	msleep(10);
 }
 
-static int snd_vt1724_chip_init(struct snd_ice1712 *ice)
+static void snd_vt1724_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ice->eeprom.data[ICE_EEP2_SYSCONF], ICEREG1724(ice, SYS_CFG));
 	outb(ice->eeprom.data[ICE_EEP2_ACLINK], ICEREG1724(ice, AC97_CFG));
@@ -2369,8 +2369,6 @@ static int snd_vt1724_chip_init(struct snd_ice1712 *ice)
 	 * since they cause machine lockups
 	 */
 	outb(VT1724_MULTI_FIFO_ERR, ICEMT1724(ice, DMA_INT_MASK));
-
-	return 0;
 }
 
 static int snd_vt1724_spdif_build_controls(struct snd_ice1712 *ice)
@@ -2506,8 +2504,8 @@ static int snd_vt1724_create(struct snd_card *card,
 	snd_vt1724_chip_reset(ice);
 	if (snd_vt1724_read_eeprom(ice, modelname) < 0)
 		return -EIO;
-	if (snd_vt1724_chip_init(ice) < 0)
-		return -EIO;
+
+	snd_vt1724_chip_init(ice);
 
 	return 0;
 }
@@ -2702,11 +2700,7 @@ static int snd_vt1724_resume(struct device *dev)
 		return 0;
 
 	snd_vt1724_chip_reset(ice);
-
-	if (snd_vt1724_chip_init(ice) < 0) {
-		snd_card_disconnect(card);
-		return -EIO;
-	}
+	snd_vt1724_chip_init(ice);
 
 	if (ice->pm_resume)
 		ice->pm_resume(ice);
-- 
2.17.1

