Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A8461E3F4
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:06:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1344847;
	Sun,  6 Nov 2022 18:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1344847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754371;
	bh=XeV12e9wpqOz2i7cJoJEkFNDL6mHHsHjaONBu5UhXbU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iljaSsrVQnFclleZ9oYw+4lCBbjQCG+TGTZWwM/URmKahaEw3sdt67P8XlUnpER5x
	 Pt8ooHC8mb3uGM+kGWdTRutQm5AjE3z/xMKm60wgwGaCchF6QgUCEXuPe+rMLZuGdP
	 NWmx5hAEgTAfq2P6BkmmhJ5oSMvNYhZYG3Ojcq7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CD1AF80564;
	Sun,  6 Nov 2022 18:04:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D289FF804BC; Sun,  6 Nov 2022 18:04:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D01F804BC
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:04:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D01F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TqEF1X1S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDEE960D14;
 Sun,  6 Nov 2022 17:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA515C433D7;
 Sun,  6 Nov 2022 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754243;
 bh=XeV12e9wpqOz2i7cJoJEkFNDL6mHHsHjaONBu5UhXbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TqEF1X1SRWM0bzvM4tfYDqC0eIA4SWRPXd3+4OBl6lABdErnnL8U7/34pWrEI70n0
 h1rQ1AriKd6zwsZyatXhxs0d7hpjmhQOgT1gqzAUseZADDQLWaUrgeVV3SjSsZ2rZE
 H2z/thAktNEpIRde+xREW7l0yjaahBZyPutGXodkebWY5GUKAz7ty/s8vUkPPJUnHo
 9S3onLOuv+ib29SCkxw+J6zwo8tdPyXl9WO8qtgnjRVIFwan9nK0Fn3NNfBwRzJFHj
 Nl83tChT9A0WBESaigH2j20Aa89umVMb9Jq6Z+eqvfG1CoJyUBExCIw4Iclwvx2jQG
 UPqKfkVrULzDw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 07/30] ASoC: rt5682s: Fix the TDM Tx settings
Date: Sun,  6 Nov 2022 12:03:19 -0500
Message-Id: <20221106170345.1579893-7-sashal@kernel.org>
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

[ Upstream commit d94bf16e920047c9b4ea2b57f7b53b4ff5039d9f ]

Complete the missing and correct the TDM Tx settings.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/20221012031320.6980-1-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682s.c | 15 +++++++++++++--
 sound/soc/codecs/rt5682s.h |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index eb47e7cd485a..95fe993d59cb 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -1932,7 +1932,7 @@ static int rt5682s_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	unsigned int cl, val = 0;
+	unsigned int cl, val = 0, tx_slotnum;
 
 	if (tx_mask || rx_mask)
 		snd_soc_component_update_bits(component,
@@ -1941,6 +1941,16 @@ static int rt5682s_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		snd_soc_component_update_bits(component,
 			RT5682S_TDM_ADDA_CTRL_2, RT5682S_TDM_EN, 0);
 
+	/* Tx slot configuration */
+	tx_slotnum = hweight_long(tx_mask);
+	if (tx_slotnum) {
+		if (tx_slotnum > slots) {
+			dev_err(component->dev, "Invalid or oversized Tx slots.\n");
+			return -EINVAL;
+		}
+		val |= (tx_slotnum - 1) << RT5682S_TDM_ADC_DL_SFT;
+	}
+
 	switch (slots) {
 	case 4:
 		val |= RT5682S_TDM_TX_CH_4;
@@ -1961,7 +1971,8 @@ static int rt5682s_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	}
 
 	snd_soc_component_update_bits(component, RT5682S_TDM_CTRL,
-		RT5682S_TDM_TX_CH_MASK | RT5682S_TDM_RX_CH_MASK, val);
+		RT5682S_TDM_TX_CH_MASK | RT5682S_TDM_RX_CH_MASK |
+		RT5682S_TDM_ADC_DL_MASK, val);
 
 	switch (slot_width) {
 	case 8:
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 7353831c73dd..b660a311b6c2 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -899,6 +899,7 @@
 #define RT5682S_TDM_RX_CH_8			(0x3 << 8)
 #define RT5682S_TDM_ADC_LCA_MASK		(0x7 << 4)
 #define RT5682S_TDM_ADC_LCA_SFT			4
+#define RT5682S_TDM_ADC_DL_MASK			(0x3 << 0)
 #define RT5682S_TDM_ADC_DL_SFT			0
 
 /* TDM control 2 (0x007a) */
-- 
2.35.1

