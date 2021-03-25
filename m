Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E66A348FA6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:29:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF85A1693;
	Thu, 25 Mar 2021 12:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF85A1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616671768;
	bh=Ta9/dulXJhPlZ6QYG6Wv2Z+vAWq7VYe95iYaANvGlLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ClegsoSmYJlpMpmAhJcb4o8mHaxPU67ZSXoONx+LA9M8/Ap4XgBfCN06xwUACLpzm
	 /GUkQKHRkhfWoTiTIUDqCeKY5fBdPC/ojPZSDQeGaC6GPZwS5SEdSBCY2GlYvgp1Cp
	 psMoPBU07hCxUvhanSKzQRMFbZxZe8Q+tVlP9akA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAAFBF804DA;
	Thu, 25 Mar 2021 12:25:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C705CF804C1; Thu, 25 Mar 2021 12:25:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C616FF8042F
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C616FF8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eC3LOw7f"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3425561A2C;
 Thu, 25 Mar 2021 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671526;
 bh=Ta9/dulXJhPlZ6QYG6Wv2Z+vAWq7VYe95iYaANvGlLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eC3LOw7fhDGY38wsvaJjgeT9+nWjXWMpC8S1lz1uRZ1NyflOIpjszYl4ydGCHgQCA
 unu6K0xNMzBDe5y6FGnlWRkREfEYdEj7F23Ou6tiGxYzDU0zy+dNsWj34Q96mkjhdT
 QmRV/n8SHZeo0fpMGyhkBPut3qParA73IuTGnBbBxp1JBIakBJdFoDax8aBCcJvb14
 WjU3fgHQSKDZca0yBDvAdPKbu57Q6KQmS1JaPndA1zjP9sZTSnj2Y8BXa3zy45Shx8
 2opQy7WsU9w2SWaBZQbSMMD0FNC2agyFlSWWJ9pcniuiPD1XfIXD/Jtzh+W4h/RyGq
 IPPSI8M7vT7qA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 20/44] ASoC: mediatek: mt8192: fix tdm out data
 is valid on rising edge
Date: Thu, 25 Mar 2021 07:24:35 -0400
Message-Id: <20210325112459.1926846-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112459.1926846-1-sashal@kernel.org>
References: <20210325112459.1926846-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

From: Jiaxin Yu <jiaxin.yu@mediatek.com>

[ Upstream commit 8d06b9633a66f41fed520f6eebd163189518ba79 ]

This patch correct tdm out bck inverse register to AUDIO_TOP_CON3[3].

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Link: https://lore.kernel.org/r/1615516005-781-1-git-send-email-jiaxin.yu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 4 +++-
 sound/soc/mediatek/mt8192/mt8192-reg.h     | 8 +++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 8383536b7ae0..504293de2c0d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -555,7 +555,9 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 
 	/* set tdm */
 	if (tdm_priv->bck_invert)
-		tdm_con |= 1 << BCK_INVERSE_SFT;
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON3,
+				   BCK_INVERSE_MASK_SFT,
+				   0x1 << BCK_INVERSE_SFT);
 
 	if (tdm_priv->lck_invert)
 		tdm_con |= 1 << LRCK_INVERSE_SFT;
diff --git a/sound/soc/mediatek/mt8192/mt8192-reg.h b/sound/soc/mediatek/mt8192/mt8192-reg.h
index 562f25c79c34..b9fb80d4afec 100644
--- a/sound/soc/mediatek/mt8192/mt8192-reg.h
+++ b/sound/soc/mediatek/mt8192/mt8192-reg.h
@@ -21,6 +21,11 @@ enum {
 /*****************************************************************************
  *                  R E G I S T E R       D E F I N I T I O N
  *****************************************************************************/
+/* AUDIO_TOP_CON3 */
+#define BCK_INVERSE_SFT                              3
+#define BCK_INVERSE_MASK                             0x1
+#define BCK_INVERSE_MASK_SFT                         (0x1 << 3)
+
 /* AFE_DAC_CON0 */
 #define VUL12_ON_SFT                                   31
 #define VUL12_ON_MASK                                  0x1
@@ -2079,9 +2084,6 @@ enum {
 #define TDM_EN_SFT                                     0
 #define TDM_EN_MASK                                    0x1
 #define TDM_EN_MASK_SFT                                (0x1 << 0)
-#define BCK_INVERSE_SFT                                1
-#define BCK_INVERSE_MASK                               0x1
-#define BCK_INVERSE_MASK_SFT                           (0x1 << 1)
 #define LRCK_INVERSE_SFT                               2
 #define LRCK_INVERSE_MASK                              0x1
 #define LRCK_INVERSE_MASK_SFT                          (0x1 << 2)
-- 
2.30.1

