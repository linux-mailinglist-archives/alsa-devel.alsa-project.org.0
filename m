Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6EF50D082
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Apr 2022 10:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37A2D16B0;
	Sun, 24 Apr 2022 10:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37A2D16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650789784;
	bh=fpoh9+TxkKDCTWl2ithVTPL8j66DXmWKaae5XALrC5I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DP1c+RRrZ99tZWuetNNXnv/RZUSJf8jF7JKU+Lv/q5UVia1zQiKpAYgQJYrB8+sWE
	 jMmy+iL1P0GuEtV5nNqoCYwNK/+UzrnbVdhAzvPaPb0B1GHh2k3mAHJg/D901DdB2m
	 9LWBIb6jJwtgAC9EH+Z4UcgpnL5JQgCSLaJnqyNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B87F80109;
	Sun, 24 Apr 2022 10:42:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C23FF80163; Sun, 24 Apr 2022 10:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com
 [59.111.176.38])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19919F80141
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 10:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19919F80141
Received: from localhost.localdomain (unknown
 [IPV6:2408:8445:6fb0:4ebc:943c:22e5:ae69:2d1d])
 by mail-m17638.qiye.163.com (Hmail) with ESMTPA id CA61D1C01B6;
 Sun, 24 Apr 2022 16:41:50 +0800 (CST)
From: Zihao Wang <wzhd@ustc.edu>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Yoga Duet 7 13ITL6 speakers
Date: Sun, 24 Apr 2022 16:41:20 +0800
Message-Id: <20220424084120.74125-1-wzhd@ustc.edu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlKHxhWTkxIQkoaQ0IeHU
 gZVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktPSElVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxw6KAw5ED08TSExShQ2C00u
 FzMaCwhVSlVKTU5LTENCTEpKSkJIVTMWGhIXVQwBEx87DggPGFUeHw5FWVdZEgtZQVlJT0tDQUNP
 T05BTR0ZS0FPHhkYQUJPSBhBSUkeTkEaHk1CQUkfSh9ZV1kIAVlBSkNOTjcG
X-HM-Tid: 0a805abbfc51d993kuwsca61d1c01b6
Cc: tiwai@suse.de, Zihao Wang <wzhd@ustc.edu>
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

Lenovo Yoga Duet 7 13ITL6 has Realtek ALC287 and built-in
speakers do not work out of the box. The fix developed for
Yoga 7i 14ITL5 also enables speaker output for this model.

Signed-off-by: Zihao Wang <wzhd@ustc.edu>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c65d3dbc6cc96..cf531c1efa132 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9247,6 +9247,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3820, "Yoga Duet 7 13ITL6", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.30.2

