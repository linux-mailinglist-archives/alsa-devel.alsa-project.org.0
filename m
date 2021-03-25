Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B83490ED
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:42:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C5441699;
	Thu, 25 Mar 2021 12:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C5441699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616672552;
	bh=/fvb5PpNu0FFl+gg1fJBlkfAgEp+4a5f0q8fpxJUqHU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ldo6AE+lE3G/dlMOauHATHFmVX6tK4LSA5w6x4O+8J9NqTJb12s3UTGqPNtyTCpFM
	 S5rrt6EEM3ZDhH2sB/aleUeB6jszUYxaSSVm6TCTR5cM//LXHXZbYRTLVjvM+49fHs
	 +hYgGTcyteVJVxJ/MRjKyMuPLTHxV+3r73ZPBuOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BC6F805F6;
	Thu, 25 Mar 2021 12:28:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC92F805C2; Thu, 25 Mar 2021 12:27:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1380F805C3
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:27:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1380F805C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r7YBbqF+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A05061A4A;
 Thu, 25 Mar 2021 11:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671654;
 bh=/fvb5PpNu0FFl+gg1fJBlkfAgEp+4a5f0q8fpxJUqHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r7YBbqF+EBBRX4MDavJUsofAwbue0JwXSkeowVjZQC2h6NIiKNcsftnlPOkf3RiHh
 OG0sBwYlmZPl5b6JZCbupOvIBmCi2nC4iU5qRd3jsmwd2i8XLIYPEe87LhaaE8gmfi
 f35iy549bVIoofocdrme0JlPpyJst231Bhx5rsWKIRd+j90Rn/QIDGTVigJDmBPKWs
 P6n/4X9R6PU+gOigacIaqWSz4KqOoV1wfaUJpsT/Wbgzey8dLaTnOowiMYwWnfg2p3
 KjS/92r2uuO0iXtbA4QdU4zo7/8EiPTwH1FPbwNRrvyxTVltHb04z0RrJ0ba9P5VKC
 F0fCLv7aUyufA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/20] ASoC: cs42l42: Fix Bitclock polarity
 inversion
Date: Thu, 25 Mar 2021 07:27:11 -0400
Message-Id: <20210325112724.1928174-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112724.1928174-1-sashal@kernel.org>
References: <20210325112724.1928174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

[ Upstream commit e793c965519b8b7f2fea51a48398405e2a501729 ]

The driver was setting bit clock polarity opposite to intended polarity.
Also simplify the code by grouping ADC and DAC clock configurations into
a single field.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20210305173442.195740-2-tanureal@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l42.c | 20 ++++++++------------
 sound/soc/codecs/cs42l42.h | 11 ++++++-----
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 651329bf9743..c7baa19bf317 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -801,27 +801,23 @@ static int cs42l42_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	/* Bitclock/frame inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
+		asp_cfg_val |= CS42L42_ASP_SCPOL_NOR << CS42L42_ASP_SCPOL_SHIFT;
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_LCPOL_IN_SHIFT;
+		asp_cfg_val |= CS42L42_ASP_SCPOL_NOR << CS42L42_ASP_SCPOL_SHIFT;
+		asp_cfg_val |= CS42L42_ASP_LCPOL_INV << CS42L42_ASP_LCPOL_SHIFT;
 		break;
 	case SND_SOC_DAIFMT_IB_NF:
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_SCPOL_IN_DAC_SHIFT;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_LCPOL_IN_SHIFT;
-		asp_cfg_val |= CS42L42_ASP_POL_INV <<
-				CS42L42_ASP_SCPOL_IN_DAC_SHIFT;
+		asp_cfg_val |= CS42L42_ASP_LCPOL_INV << CS42L42_ASP_LCPOL_SHIFT;
 		break;
 	}
 
-	snd_soc_component_update_bits(component, CS42L42_ASP_CLK_CFG,
-				CS42L42_ASP_MODE_MASK |
-				CS42L42_ASP_SCPOL_IN_DAC_MASK |
-				CS42L42_ASP_LCPOL_IN_MASK, asp_cfg_val);
+	snd_soc_component_update_bits(component, CS42L42_ASP_CLK_CFG, CS42L42_ASP_MODE_MASK |
+								      CS42L42_ASP_SCPOL_MASK |
+								      CS42L42_ASP_LCPOL_MASK,
+								      asp_cfg_val);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 09b0a93203ef..9d04ed75e5c8 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -262,11 +262,12 @@
 #define CS42L42_ASP_SLAVE_MODE		0x00
 #define CS42L42_ASP_MODE_SHIFT		4
 #define CS42L42_ASP_MODE_MASK		(1 << CS42L42_ASP_MODE_SHIFT)
-#define CS42L42_ASP_SCPOL_IN_DAC_SHIFT	2
-#define CS42L42_ASP_SCPOL_IN_DAC_MASK	(1 << CS42L42_ASP_SCPOL_IN_DAC_SHIFT)
-#define CS42L42_ASP_LCPOL_IN_SHIFT	0
-#define CS42L42_ASP_LCPOL_IN_MASK	(1 << CS42L42_ASP_LCPOL_IN_SHIFT)
-#define CS42L42_ASP_POL_INV		1
+#define CS42L42_ASP_SCPOL_SHIFT		2
+#define CS42L42_ASP_SCPOL_MASK		(3 << CS42L42_ASP_SCPOL_SHIFT)
+#define CS42L42_ASP_SCPOL_NOR		3
+#define CS42L42_ASP_LCPOL_SHIFT		0
+#define CS42L42_ASP_LCPOL_MASK		(3 << CS42L42_ASP_LCPOL_SHIFT)
+#define CS42L42_ASP_LCPOL_INV		3
 
 #define CS42L42_ASP_FRM_CFG		(CS42L42_PAGE_12 + 0x08)
 #define CS42L42_ASP_STP_SHIFT		4
-- 
2.30.1

