Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539B413CA3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:39:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C34166F;
	Tue, 21 Sep 2021 23:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C34166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260354;
	bh=uMj9Yoh6CUT/R5lukGLiO6qATz85EOJ3O0N05idRBV8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwJJiA4fh3kitUbgnwA/myi6xO42eNACEi4iMGwvzcTl9wspb8OI9NtMkizCzoKwp
	 p6C1TN8TTyRIf3D9CQEk7b25CqQxmXFeUBasYsNa9LFRSS1LsauX5Ve5imrCvwt41C
	 YZMmTtu5s/Zlitlv7dNr3uikRKaTeAIDr/ktIvc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D854AF804E7;
	Tue, 21 Sep 2021 23:37:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7082F80124; Tue, 21 Sep 2021 23:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01A3CF80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A3CF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tqjvZBuD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA1E161165;
 Tue, 21 Sep 2021 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260213;
 bh=uMj9Yoh6CUT/R5lukGLiO6qATz85EOJ3O0N05idRBV8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tqjvZBuDNE3AQUqLGvlxRWjUbryGsc68CTuppAikNFp0+iY5CWEKcYfo10PHQch8y
 zF7bEYnN9Ku7gH2P5+m1WMzCxAY0tah8ARn03fK3/7zwdv7hZUIRAGvd56KGDwX+1A
 FLhYouUVIpGN0NLIjhy0ldFdW5qYJADTkrIPJQADiOuVKzKo6FvoMPSfsXJ6HYYQCa
 UU10lGMMsEV/bH/dsNHG8i/liZZCq5kodkHCeeqdqUCXPhEEKILsQ87mky5VNJjzDY
 JD1TRcHE/MNI9QxuYDQQUCpQBv6QnU62ZFql689YBZqL/w3cTYjM6Ze8u41uYmhBa7
 DjyXKCw2De8cQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 04/16] ASoC: fsl-esai: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:30 +0100
Message-Id: <20210921213542.31688-4-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2755; h=from:subject;
 bh=uMj9Yoh6CUT/R5lukGLiO6qATz85EOJ3O0N05idRBV8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8V5GCkDdvG7GRD8CbzywYtb1V7yAJYV3zbSkaL
 E0KV0yeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPFQAKCRAk1otyXVSH0D5CB/
 469q8NpbuqDI/s0fQ8LN6BINyy699D7QaYxRYmegp3vWOr0XSonhQm3/EJ17cUaQzVqbzwXiXw+scc
 wA2DZ1zk+UxBkHXtLWBvTDa8VCAyhdxBmKB8ST/wWPa+P4tOdaRBgdAKWLR/TykYl460CiEj5fhkRc
 PnqZOYP5JWknor3PYKwwt3DieS3Kn1Xuf7ryqXhw2jVEd3whnEs0qgE17k1LXBWY3MLo07L934zY90
 B7e4UBwkD/aPz19j9K2wsRnJmNguCaor7YQT+pORJBLc1A6jpBkPg3c0uPewWsv/5TIU/2phnaLEFe
 0vfX34hvVTLmL+IWVbhpi2QEguB29N
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
the fsl-esai driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bda66b30e063..3a9e2df4e16f 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -52,7 +52,7 @@ struct fsl_esai_soc_data {
  * @sck_rate: clock rate of desired SCKx clock
  * @hck_dir: the direction of HCKx pads
  * @sck_div: if using PSR/PM dividers for SCKx clock
- * @slave_mode: if fully using DAI slave mode
+ * @consumer_mode: if fully using DAI clock consumer mode
  * @synchronous: if using tx/rx synchronous mode
  * @name: driver name
  */
@@ -78,7 +78,7 @@ struct fsl_esai {
 	u32 sck_rate[2];
 	bool hck_dir[2];
 	bool sck_div[2];
-	bool slave_mode;
+	bool consumer_mode;
 	bool synchronous;
 	char name[32];
 };
@@ -366,8 +366,8 @@ static int fsl_esai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	u32 sub, ratio = hck_rate / freq;
 	int ret;
 
-	/* Don't apply for fully slave mode or unchanged bclk */
-	if (esai_priv->slave_mode || esai_priv->sck_rate[tx] == freq)
+	/* Don't apply for fully consumer mode or unchanged bclk */
+	if (esai_priv->consumer_mode || esai_priv->sck_rate[tx] == freq)
 		return 0;
 
 	if (ratio * freq > hck_rate)
@@ -476,20 +476,20 @@ static int fsl_esai_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	esai_priv->slave_mode = false;
+	esai_priv->consumer_mode = false;
 
-	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		esai_priv->slave_mode = true;
+	/* DAI clock provider masks */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		esai_priv->consumer_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		xccr |= ESAI_xCCR_xCKD;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		xccr |= ESAI_xCCR_xFSD;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		xccr |= ESAI_xCCR_xFSD | ESAI_xCCR_xCKD;
 		break;
 	default:
@@ -1016,8 +1016,8 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	/* Set a default slot number */
 	esai_priv->slots = 2;
 
-	/* Set a default master/slave state */
-	esai_priv->slave_mode = true;
+	/* Set a default clock provider state */
+	esai_priv->consumer_mode = true;
 
 	/* Determine the FIFO depth */
 	iprop = of_get_property(np, "fsl,fifo-depth", NULL);
-- 
2.20.1

