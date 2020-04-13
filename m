Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F51A666B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 14:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E0916A2;
	Mon, 13 Apr 2020 14:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E0916A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586782072;
	bh=Q88wqHNzQKBDgruvG1lMwGi4VZ6og9fmuqRNVMz7MMI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zp7OlXaAHWSaZXPMcV8SV8kS0Hri36JFWh6TR5bUY/d/UP6M19DMNwd2YN3LMdbf+
	 Qkj+6OJ7WArMu+yVV/29eU+QKf0XyZ/jkGmZkNUGnai0L1ZVOCwry8Pe1URe7u1D82
	 Z+Xdw2TsllG7+FvL3SYz/NLjKHpMkPEtKcWcxSmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D4B9F80245;
	Mon, 13 Apr 2020 14:46:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FFE5F80245; Mon, 13 Apr 2020 14:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4976F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 14:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4976F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L8aiwc3c"
Received: from localhost.localdomain (unknown [194.230.155.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BC152073E;
 Mon, 13 Apr 2020 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586781961;
 bh=Q88wqHNzQKBDgruvG1lMwGi4VZ6og9fmuqRNVMz7MMI=;
 h=From:To:Cc:Subject:Date:From;
 b=L8aiwc3cUlny6YqqbsXt3SGnVODs9mXyrLBUJ0oc1ogJGdWAmHEB0Tm3p2dkuZDwk
 4GRrDOrzhXbj+lIdGiJ1NxICPXIero4lPLUPgN+qfzS5zalsK7/vKYzvdmWSs7ntKV
 ytYhyp2xQ6Fj1d7MVfOq4UOV5WyzY5Bd+ywAGxzw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix build after removal of DAI
 suspend/resume
Date: Mon, 13 Apr 2020 14:45:48 +0200
Message-Id: <20200413124548.28197-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>
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

Commit 450312b640f9 ("ASoC: soc-core: remove DAI suspend/resume")
removed the DAI side suspend/resume hooks and switched entirely to
component suspend/resume.  However the Samsung SoC s3c-i2s-v2 driver was
not updated.

Move the suspend/resume hooks from s3c-i2s-v2.c to s3c2412-i2s.c while
changing dai to component which allows to keep the struct
snd_soc_component_driver const.

This fixes build errors:

    sound/soc/samsung/s3c-i2s-v2.c: In function ‘s3c_i2sv2_register_component’:
    sound/soc/samsung/s3c-i2s-v2.c:730:9: error: ‘struct snd_soc_dai_driver’ has no member named ‘suspend’
      dai_drv->suspend = s3c2412_i2s_suspend;

Reported-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 450312b640f9 ("ASoC: soc-core: remove DAI suspend/resume")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Only compile tested.
---
 sound/soc/samsung/s3c-i2s-v2.c  | 57 ---------------------------------
 sound/soc/samsung/s3c2412-i2s.c | 56 ++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index 358887848293..5e95c30fb2ba 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -656,60 +656,6 @@ void s3c_i2sv2_cleanup(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(s3c_i2sv2_cleanup);
 
-#ifdef CONFIG_PM
-static int s3c2412_i2s_suspend(struct snd_soc_dai *dai)
-{
-	struct s3c_i2sv2_info *i2s = to_info(dai);
-	u32 iismod;
-
-	if (dai->active) {
-		i2s->suspend_iismod = readl(i2s->regs + S3C2412_IISMOD);
-		i2s->suspend_iiscon = readl(i2s->regs + S3C2412_IISCON);
-		i2s->suspend_iispsr = readl(i2s->regs + S3C2412_IISPSR);
-
-		/* some basic suspend checks */
-
-		iismod = readl(i2s->regs + S3C2412_IISMOD);
-
-		if (iismod & S3C2412_IISCON_RXDMA_ACTIVE)
-			pr_warn("%s: RXDMA active?\n", __func__);
-
-		if (iismod & S3C2412_IISCON_TXDMA_ACTIVE)
-			pr_warn("%s: TXDMA active?\n", __func__);
-
-		if (iismod & S3C2412_IISCON_IIS_ACTIVE)
-			pr_warn("%s: IIS active\n", __func__);
-	}
-
-	return 0;
-}
-
-static int s3c2412_i2s_resume(struct snd_soc_dai *dai)
-{
-	struct s3c_i2sv2_info *i2s = to_info(dai);
-
-	pr_info("dai_active %d, IISMOD %08x, IISCON %08x\n",
-		dai->active, i2s->suspend_iismod, i2s->suspend_iiscon);
-
-	if (dai->active) {
-		writel(i2s->suspend_iiscon, i2s->regs + S3C2412_IISCON);
-		writel(i2s->suspend_iismod, i2s->regs + S3C2412_IISMOD);
-		writel(i2s->suspend_iispsr, i2s->regs + S3C2412_IISPSR);
-
-		writel(S3C2412_IISFIC_RXFLUSH | S3C2412_IISFIC_TXFLUSH,
-		       i2s->regs + S3C2412_IISFIC);
-
-		ndelay(250);
-		writel(0x0, i2s->regs + S3C2412_IISFIC);
-	}
-
-	return 0;
-}
-#else
-#define s3c2412_i2s_suspend NULL
-#define s3c2412_i2s_resume  NULL
-#endif
-
 int s3c_i2sv2_register_component(struct device *dev, int id,
 			   const struct snd_soc_component_driver *cmp_drv,
 			   struct snd_soc_dai_driver *dai_drv)
@@ -727,9 +673,6 @@ int s3c_i2sv2_register_component(struct device *dev, int id,
 	if (!ops->delay)
 		ops->delay = s3c2412_i2s_delay;
 
-	dai_drv->suspend = s3c2412_i2s_suspend;
-	dai_drv->resume = s3c2412_i2s_resume;
-
 	return devm_snd_soc_register_component(dev, cmp_drv, dai_drv, 1);
 }
 EXPORT_SYMBOL_GPL(s3c_i2sv2_register_component);
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 787a3f6e9f24..b35d828c1cfe 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -117,6 +117,60 @@ static int s3c2412_i2s_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int s3c2412_i2s_suspend(struct snd_soc_component *component)
+{
+	struct s3c_i2sv2_info *i2s = snd_soc_component_get_drvdata(component);
+	u32 iismod;
+
+	if (component->active) {
+		i2s->suspend_iismod = readl(i2s->regs + S3C2412_IISMOD);
+		i2s->suspend_iiscon = readl(i2s->regs + S3C2412_IISCON);
+		i2s->suspend_iispsr = readl(i2s->regs + S3C2412_IISPSR);
+
+		/* some basic suspend checks */
+
+		iismod = readl(i2s->regs + S3C2412_IISMOD);
+
+		if (iismod & S3C2412_IISCON_RXDMA_ACTIVE)
+			pr_warn("%s: RXDMA active?\n", __func__);
+
+		if (iismod & S3C2412_IISCON_TXDMA_ACTIVE)
+			pr_warn("%s: TXDMA active?\n", __func__);
+
+		if (iismod & S3C2412_IISCON_IIS_ACTIVE)
+			pr_warn("%s: IIS active\n", __func__);
+	}
+
+	return 0;
+}
+
+static int s3c2412_i2s_resume(struct snd_soc_component *component)
+{
+	struct s3c_i2sv2_info *i2s = snd_soc_component_get_drvdata(component);
+
+	pr_info("component_active %d, IISMOD %08x, IISCON %08x\n",
+		component->active, i2s->suspend_iismod, i2s->suspend_iiscon);
+
+	if (component->active) {
+		writel(i2s->suspend_iiscon, i2s->regs + S3C2412_IISCON);
+		writel(i2s->suspend_iismod, i2s->regs + S3C2412_IISMOD);
+		writel(i2s->suspend_iispsr, i2s->regs + S3C2412_IISPSR);
+
+		writel(S3C2412_IISFIC_RXFLUSH | S3C2412_IISFIC_TXFLUSH,
+		       i2s->regs + S3C2412_IISFIC);
+
+		ndelay(250);
+		writel(0x0, i2s->regs + S3C2412_IISFIC);
+	}
+
+	return 0;
+}
+#else
+#define s3c2412_i2s_suspend NULL
+#define s3c2412_i2s_resume  NULL
+#endif
+
 #define S3C2412_I2S_RATES \
 	(SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 | SNDRV_PCM_RATE_16000 | \
 	SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
@@ -146,6 +200,8 @@ static struct snd_soc_dai_driver s3c2412_i2s_dai = {
 
 static const struct snd_soc_component_driver s3c2412_i2s_component = {
 	.name		= "s3c2412-i2s",
+	.suspend	= s3c2412_i2s_suspend,
+	.resume		= s3c2412_i2s_resume,
 };
 
 static int s3c2412_iis_dev_probe(struct platform_device *pdev)
-- 
2.17.1

