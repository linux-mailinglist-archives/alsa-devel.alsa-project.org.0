Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 627994C04AA
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:34:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 036091840;
	Tue, 22 Feb 2022 23:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 036091840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645569259;
	bh=6dwgiKXB+iSXUSzXkpgggUggg29DIR8weZiAKkShFbc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qYrwztpEYRHXnkvNYiB/2wupXaVoDUQ07JsAngUMeA28pbe8nx6kvniO8woDGaKP3
	 Iny9dqU0RDQytEb8msB4j0/FVWXs9kMRaQjwB7oqIbkz45Pg5U08Cx2004fbem6a5W
	 pYxwpU1WYhQp3q+Re079pt5pXSA7DblFoFY2MPNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E649F800D1;
	Tue, 22 Feb 2022 23:33:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC2EFF801EC; Tue, 22 Feb 2022 23:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7212AF800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7212AF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VFTWSi6v"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4D02B81CD2;
 Tue, 22 Feb 2022 22:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E2DC340E8;
 Tue, 22 Feb 2022 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645569185;
 bh=6dwgiKXB+iSXUSzXkpgggUggg29DIR8weZiAKkShFbc=;
 h=From:To:Cc:Subject:Date:From;
 b=VFTWSi6vingTcaaE0DYDWovrl54QrV3schQSRXDCmvnycdUPIxGB9EVzA2EelrFg9
 SPnzfvcImxz2JeOrbM26H8B1G7Dsff/lCS3VHuF/TVULX4CyJmHAtYdD9oyuaTUqYZ
 tAE609HWW6+v56Ynp+z9H6o6GqNscovvToSrLqFFrViXWLcuGTQzGX64x6aeVNYz8d
 hXiu0PKEKA7g4LwevDnOrhe9BaIQNXNJtyhj+IgAlbMf9Wp8nKyZRrXRBLMmehinAK
 EIWVLZoNuWD7elsgOFNLO0ltJQdlqOM3pk8bXqPTK78WKd1MomAv2QCN4ysOHmlb+H
 NgAixCm1MYUtw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: es7241: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 22:33:00 +0000
Message-Id: <20220222223300.3120298-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548; h=from:subject;
 bh=6dwgiKXB+iSXUSzXkpgggUggg29DIR8weZiAKkShFbc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFWSKXgTd9cbGK32HxZqeUsK2GbMwyyMQ7v0u6mym
 oQrr4IqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhVkigAKCRAk1otyXVSH0EtHB/
 0YpPJbfQXxAeSije2PXQLDkTBHLsx+1kmWHSmjSaKb2F0bBUg/3K6bUQRm1uKAA+9nCB4mwZpTTXpq
 6TLOTI2mMRWJtQYyUU3eJ3YzURtGrN29Hd96mx7SBiwjoXSpWSkxJFXi8TtJAyXKBbLYmXCIKtSAcA
 ICqpwn8om1jS/PmdeQdmPIWdnGC1obLeFjY/uJfmQ1MNxbw671l7HHAaZkv4ZkOd1dgI4UzRXrnPx7
 OH+nVGUvQ/31MG2mj5r5DK2chUDWXdF+RojM/VgIm21UmMy1pVPEEHcqBKbFOX1YrlVUVdEJ0jrAoq
 TeEBJjMC9FM97c11S7IhkmOTs1vm+t
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the es7241 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es7241.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 9f20bfb855b3..0baa86241cf9 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -29,7 +29,7 @@ struct es7241_data {
 	struct gpio_desc *m1;
 	unsigned int fmt;
 	unsigned int mclk;
-	bool is_slave;
+	bool is_consumer;
 	const struct es7241_chip *chip;
 };
 
@@ -46,9 +46,9 @@ static void es7241_set_mode(struct es7241_data *priv,  int m0, int m1)
 	gpiod_set_value_cansleep(priv->reset, 1);
 }
 
-static int es7241_set_slave_mode(struct es7241_data *priv,
-				 const struct es7241_clock_mode *mode,
-				 unsigned int mfs)
+static int es7241_set_consumer_mode(struct es7241_data *priv,
+				    const struct es7241_clock_mode *mode,
+				    unsigned int mfs)
 {
 	int j;
 
@@ -67,9 +67,9 @@ static int es7241_set_slave_mode(struct es7241_data *priv,
 	return 0;
 }
 
-static int es7241_set_master_mode(struct es7241_data *priv,
-				  const struct es7241_clock_mode *mode,
-				  unsigned int mfs)
+static int es7241_set_provider_mode(struct es7241_data *priv,
+				    const struct es7241_clock_mode *mode,
+				    unsigned int mfs)
 {
 	/*
 	 * We can't really set clock ratio, if the mclk/lrclk is different
@@ -98,10 +98,10 @@ static int es7241_hw_params(struct snd_pcm_substream *substream,
 		if (rate < mode->rate_min || rate >= mode->rate_max)
 			continue;
 
-		if (priv->is_slave)
-			return es7241_set_slave_mode(priv, mode, mfs);
+		if (priv->is_consumer)
+			return es7241_set_consumer_mode(priv, mode, mfs);
 		else
-			return es7241_set_master_mode(priv, mode, mfs);
+			return es7241_set_provider_mode(priv, mode, mfs);
 	}
 
 	/* should not happen */
@@ -136,12 +136,12 @@ static int es7241_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		priv->is_slave = true;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		priv->is_consumer = true;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
-		priv->is_slave = false;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		priv->is_consumer = false;
 		break;
 
 	default:
-- 
2.30.2

