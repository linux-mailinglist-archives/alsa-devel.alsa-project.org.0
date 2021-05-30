Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF3D3952DE
	for <lists+alsa-devel@lfdr.de>; Sun, 30 May 2021 22:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13231826;
	Sun, 30 May 2021 22:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13231826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622407003;
	bh=SgJJ+lOG4ryBeSujeUFDNg/V0cop9NoG/qr5CK7kHVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pyd4UV+Nkk5zYUBhhFvXUtwKLe/B3paa/necsIuscDax9Sd/UGRBoqt0/ioRGEaNx
	 rr2zPvNaG0hrXnfndJx9drNy/eaqCHwRnKwvEoLEmeoSoFP+7YVV3k5V+tcW4TPZi9
	 vTcLE0XiEhMrr2da2mD1+C8yXB94xyxfit48Hz94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BB7BF8025B;
	Sun, 30 May 2021 22:35:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 814AFF80254; Sun, 30 May 2021 22:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 323B0F80161
 for <alsa-devel@alsa-project.org>; Sun, 30 May 2021 22:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 323B0F80161
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id B3CFA1817A0CB;
 Sun, 30 May 2021 22:35:01 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 55jQULQnARog; Sun, 30 May 2021 22:35:01 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lB1rIV5dxa9A; Sun, 30 May 2021 22:35:01 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tas2562: Fix TDM_CFG0_SAMPRATE values
Date: Sun, 30 May 2021 22:34:46 +0200
Message-Id: <20210530203446.19022-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: robh@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org, dmurphy@ti.com, grandmaster@al2klimov.de,
 Richard Weinberger <richard@nod.at>
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

TAS2562_TDM_CFG0_SAMPRATE_MASK starts at bit 1, not 0.
So all values need to be left shifted by 1.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 sound/soc/codecs/tas2562.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 81866aeb3fbf..55b2a1f52ca3 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -57,13 +57,13 @@
 #define TAS2562_TDM_CFG0_RAMPRATE_MASK		BIT(5)
 #define TAS2562_TDM_CFG0_RAMPRATE_44_1		BIT(5)
 #define TAS2562_TDM_CFG0_SAMPRATE_MASK		GENMASK(3, 1)
-#define TAS2562_TDM_CFG0_SAMPRATE_7305_8KHZ	0x0
-#define TAS2562_TDM_CFG0_SAMPRATE_14_7_16KHZ	0x1
-#define TAS2562_TDM_CFG0_SAMPRATE_22_05_24KHZ	0x2
-#define TAS2562_TDM_CFG0_SAMPRATE_29_4_32KHZ	0x3
-#define TAS2562_TDM_CFG0_SAMPRATE_44_1_48KHZ	0x4
-#define TAS2562_TDM_CFG0_SAMPRATE_88_2_96KHZ	0x5
-#define TAS2562_TDM_CFG0_SAMPRATE_176_4_192KHZ	0x6
+#define TAS2562_TDM_CFG0_SAMPRATE_7305_8KHZ	(0x0 << 1)
+#define TAS2562_TDM_CFG0_SAMPRATE_14_7_16KHZ	(0x1 << 1)
+#define TAS2562_TDM_CFG0_SAMPRATE_22_05_24KHZ	(0x2 << 1)
+#define TAS2562_TDM_CFG0_SAMPRATE_29_4_32KHZ	(0x3 << 1)
+#define TAS2562_TDM_CFG0_SAMPRATE_44_1_48KHZ	(0x4 << 1)
+#define TAS2562_TDM_CFG0_SAMPRATE_88_2_96KHZ	(0x5 << 1)
+#define TAS2562_TDM_CFG0_SAMPRATE_176_4_192KHZ	(0x6 << 1)
=20
 #define TAS2562_TDM_CFG2_RIGHT_JUSTIFY	BIT(6)
=20
--=20
2.26.2

