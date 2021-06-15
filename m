Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268AB3A8573
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:53:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD0016C0;
	Tue, 15 Jun 2021 17:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD0016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772436;
	bh=9Rc61qOEX4dCvbIso4TMKwr7VWeVpYgY8rXvC9B+Xtc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4XoVOkQsgKcittiBL1o0UH30CK3H8EnSnySFxsz+XiKRCJHx6OVFAXoG529bg/5W
	 xxqz32zGcb21v34nq5MCGFXAck91iEmXqsMSSyFqgvC0gUEg10raqeiGKOpvcr/kbV
	 rHVzL76fJIenzhI8o11TeoaAFPOfdKQf26h22H0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E29ADF80525;
	Tue, 15 Jun 2021 17:49:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F83F80518; Tue, 15 Jun 2021 17:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BE84F80515
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE84F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="skUxbzMs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BF736162F;
 Tue, 15 Jun 2021 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772166;
 bh=9Rc61qOEX4dCvbIso4TMKwr7VWeVpYgY8rXvC9B+Xtc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=skUxbzMshsIKGUgJFbQOGsIeh78vB8f+roVelbiCm/PkMHMDp0zm7W/QDwqHW7f25
 DyO0RPaSrH4+nHQ3wKqgDlE/Q2dRaW+z/sxxUnsmhk2lRPbU0G54TMdxR4Mbt7DF1c
 t9Xb2Yownez4AYKx8YgkYDySntV29/eyunDEiA4B8qSN05qwRJkGACs84s95uhOu20
 93VhIzhCQdyNJn7y54N8V5L9tValEkz2DEZqMLRejQrmN/ukYJQEDR7Euv3LK9Cdeo
 eXH9MTYQvtvoXo1RBzq1UUnpLBPfrcTWqPkc1AHgnebP7ATVn9kkPcV42R2Acr94aM
 u1nnOpUzZzHYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 14/30] ASoC: tas2562: Fix TDM_CFG0_SAMPRATE values
Date: Tue, 15 Jun 2021 11:48:51 -0400
Message-Id: <20210615154908.62388-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154908.62388-1-sashal@kernel.org>
References: <20210615154908.62388-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

From: Richard Weinberger <richard@nod.at>

[ Upstream commit 8bef925e37bdc9b6554b85eda16ced9a8e3c135f ]

TAS2562_TDM_CFG0_SAMPRATE_MASK starts at bit 1, not 0.
So all values need to be left shifted by 1.

Signed-off-by: Richard Weinberger <richard@nod.at>
Link: https://lore.kernel.org/r/20210530203446.19022-1-richard@nod.at
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
 
 #define TAS2562_TDM_CFG2_RIGHT_JUSTIFY	BIT(6)
 
-- 
2.30.2

