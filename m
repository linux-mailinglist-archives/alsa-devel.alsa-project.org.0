Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B553C61E3FC
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A7B20B;
	Sun,  6 Nov 2022 18:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A7B20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754393;
	bh=hHn3uj9udXEW2PsBihWFWubMIXeVhEdzeMEIGSruT8k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HKJGTwwkPc9EvPvA2LAe+ruutk7/O0Vmebc2a0vsfjGDt7aj65lV7dXpulPcIcQLg
	 54mtd/nIp7xyuWrLphxjoR4tbObY2w/o+bj4WOBh5wFBgNNPgaBOs/aSwH2mBQhVEz
	 9RGM0PJbqZzXcrOE5/8JQwBCiJ6oYAiui/3bjSaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C01F80567;
	Sun,  6 Nov 2022 18:04:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C063BF80567; Sun,  6 Nov 2022 18:04:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2564EF800BB
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2564EF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bPFnwJzA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACFABB80C63;
 Sun,  6 Nov 2022 17:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE77C433D6;
 Sun,  6 Nov 2022 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754245;
 bh=hHn3uj9udXEW2PsBihWFWubMIXeVhEdzeMEIGSruT8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bPFnwJzA/d5lgGybGf67DIJfuPlj/BRteKV0LYFyaix2j3VZuEuHjwz1DABftBzjh
 WH+UFitPNMmlSmyTGNBd6rnCvXmVmVpyaRAMAcSInVs9411MNVWpSm8pRN87LK+McS
 eH86hUiB4U1RF/X6JgQ+jBAanaOk1hPdKo5W/fyeuYqOUjAqZkjM7LshygKSHqY5Kh
 zI1+sTwdCPZXs/JpfvXomk34lI8e8PaHXNU4RSl451vblSIv4QOvqLMe8eQxnGu1Cy
 mS6l7A4gZifAETv0jcdIUyfjYmYMT46QpwaaovtrdVm/8Lxvmn0V/xUuVbzFeMgNH9
 dXPvUVznbYVlQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 08/30] ASoC: rt1019: Fix the TDM settings
Date: Sun,  6 Nov 2022 12:03:20 -0500
Message-Id: <20221106170345.1579893-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Derek Fang <derek.fang@realtek.com>
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

From: Derek Fang <derek.fang@realtek.com>

[ Upstream commit f2635d45a750182c6d5de15e2d6b059e0c302d7e ]

Complete the missing and correct the TDM settings.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/20221012030102.4042-1-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt1019.c | 20 +++++++++++---------
 sound/soc/codecs/rt1019.h |  6 ++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index b66bfecbb879..49f527c61a7a 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -391,18 +391,18 @@ static int rt1019_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 			unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	unsigned int val = 0, rx_slotnum;
+	unsigned int cn = 0, cl = 0, rx_slotnum;
 	int ret = 0, first_bit;
 
 	switch (slots) {
 	case 4:
-		val |= RT1019_I2S_TX_4CH;
+		cn = RT1019_I2S_TX_4CH;
 		break;
 	case 6:
-		val |= RT1019_I2S_TX_6CH;
+		cn = RT1019_I2S_TX_6CH;
 		break;
 	case 8:
-		val |= RT1019_I2S_TX_8CH;
+		cn = RT1019_I2S_TX_8CH;
 		break;
 	case 2:
 		break;
@@ -412,16 +412,16 @@ static int rt1019_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 
 	switch (slot_width) {
 	case 20:
-		val |= RT1019_I2S_DL_20;
+		cl = RT1019_TDM_CL_20;
 		break;
 	case 24:
-		val |= RT1019_I2S_DL_24;
+		cl = RT1019_TDM_CL_24;
 		break;
 	case 32:
-		val |= RT1019_I2S_DL_32;
+		cl = RT1019_TDM_CL_32;
 		break;
 	case 8:
-		val |= RT1019_I2S_DL_8;
+		cl = RT1019_TDM_CL_8;
 		break;
 	case 16:
 		break;
@@ -470,8 +470,10 @@ static int rt1019_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		goto _set_tdm_err_;
 	}
 
+	snd_soc_component_update_bits(component, RT1019_TDM_1,
+		RT1019_TDM_CL_MASK, cl);
 	snd_soc_component_update_bits(component, RT1019_TDM_2,
-		RT1019_I2S_CH_TX_MASK | RT1019_I2S_DF_MASK, val);
+		RT1019_I2S_CH_TX_MASK, cn);
 
 _set_tdm_err_:
 	return ret;
diff --git a/sound/soc/codecs/rt1019.h b/sound/soc/codecs/rt1019.h
index 64df831eeb72..48ba15efb48d 100644
--- a/sound/soc/codecs/rt1019.h
+++ b/sound/soc/codecs/rt1019.h
@@ -95,6 +95,12 @@
 #define RT1019_TDM_BCLK_MASK		(0x1 << 6)
 #define RT1019_TDM_BCLK_NORM		(0x0 << 6)
 #define RT1019_TDM_BCLK_INV			(0x1 << 6)
+#define RT1019_TDM_CL_MASK			(0x7)
+#define RT1019_TDM_CL_8				(0x4)
+#define RT1019_TDM_CL_32			(0x3)
+#define RT1019_TDM_CL_24			(0x2)
+#define RT1019_TDM_CL_20			(0x1)
+#define RT1019_TDM_CL_16			(0x0)
 
 /* 0x0401 TDM Control-2 */
 #define RT1019_I2S_CH_TX_MASK		(0x3 << 6)
-- 
2.35.1

