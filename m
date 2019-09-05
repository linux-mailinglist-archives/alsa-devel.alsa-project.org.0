Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB857AA2B3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 14:08:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7964E1688;
	Thu,  5 Sep 2019 14:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7964E1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567685281;
	bh=UOkXv6GFz0m0zwsOp8IjUNgJ7uEV43dUnZX56sl4xGM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZI5qEIA4U4aKD6J1XPFTWvLokpVcpQt3yW8T1Dutvr/jF4fJwOnY2LTQKKUZgBgjJ
	 r58TRudeNbVFe6FFRaMsvwQaJ9pv5dpg9Q4n3ycw+WekB1kYzy87Ws56QoCZMyZGgF
	 p8nqiNMj53OzGuRytzC9IaZSaJ3KIXVi+WL0li+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B421EF8065B;
	Thu,  5 Sep 2019 14:01:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B1EF805FE; Thu,  5 Sep 2019 14:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6E67F80539
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 14:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6E67F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="K1wgI+Bm"
Received: by mail-wr1-x444.google.com with SMTP id h7so1441687wrw.8
 for <alsa-devel@alsa-project.org>; Thu, 05 Sep 2019 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MS5XJHYT75fAQfNDJZYmwsq3IlOqs5XUG9bj/DNEg1Y=;
 b=K1wgI+BmLlwGuWLvWOKjgEhqHak7dEDjBF6ia+HKWkPbjOg55sHa+seoDjFEUKR32D
 EQG+xGcV5myYoBYwljoZI1XJTj2u2VTdMQHT6YaqBzo1naDi19CrI6+xwYm/8O1R1Plt
 y8xx3bew6U/zIbR1KOWbOFyNqtD7I/e6tBpq7beLfwQMnw5bS5dNE8BCl25cDh3dVh64
 X9Xmy4zUUExSFPPO/DWhtKEq5eowO6MSxJE+NZlFIgEGDk7G2zLdmVMr/+Q4yvmQaOfq
 ql4u1c4Uxts+yUfrXqB8AocXfyskaBTf7MODWsh1uCHHCxKv52CpgYcYKG9+mQQpgxDg
 6z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MS5XJHYT75fAQfNDJZYmwsq3IlOqs5XUG9bj/DNEg1Y=;
 b=UNIa+a93yHNVnV7IKmrz2sm/SuBPVJ67g6AcMZrWGW/yeECfraTOH1yqBT8prcCE+c
 wjQWjEWfi6QtlyXZiyfpmTx7dceYYCNzEjKZnAvR12tapUnYCF0t9fVMFYojVPFLBQFn
 2YAQ/Ykp+m9LKT30wMDZZAvGVz2HBbs+mBBFveC8UGGkKAdfcnCWfnYpf77CVtrzKx7N
 +eFpovd2LfChK0biyU3E3i4jpjsQmgNNtcMk8qz+CPfhW9twYRCrZuQC1qYz/ZnCmd03
 7OfV0P4FK2BwYoi0Y6ZQNaG7nyOIIY+i01N3M4J02QQ+j3iffXOLSQ8eH9glGN+pj7d1
 4I6g==
X-Gm-Message-State: APjAAAX/FE8EwlN+bQk/sulx1y2ITEpXm8cLfjhrKw7Z97WpIFVQZ5ks
 KPAfEYIcg5LP5VfbRUsJG4r+bQ==
X-Google-Smtp-Source: APXvYqz5PhdEL3jHaKHC3XzHvW9oTc+P2oasn9+crC56FOm8eG1k5Or2C2eIBzLJjHuj8/2pZCZ33A==
X-Received: by 2002:adf:e908:: with SMTP id f8mr1956221wrm.210.1567684894141; 
 Thu, 05 Sep 2019 05:01:34 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu,  5 Sep 2019 14:01:18 +0200
Message-Id: <20190905120120.31752-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 6/8] ASoC: meson: axg-frddr: add sm1 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On sm1, the output routing bits have moved to CTRL2 register

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c  |  2 +-
 sound/soc/meson/axg-fifo.h  |  1 +
 sound/soc/meson/axg-frddr.c | 73 +++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 80a3dde35b5c..5a3749938900 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -306,7 +306,7 @@ static const struct regmap_config axg_fifo_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= FIFO_INIT_ADDR,
+	.max_register	= FIFO_CTRL2,
 };
 
 int axg_fifo_probe(struct platform_device *pdev)
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index 5caf81241dfe..bb1e2ce50256 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -61,6 +61,7 @@ struct snd_soc_pcm_runtime;
 #define  STATUS1_INT_STS(x)		((x) << 0)
 #define FIFO_STATUS2			0x18
 #define FIFO_INIT_ADDR			0x24
+#define FIFO_CTRL2			0x28
 
 struct axg_fifo {
 	struct regmap *map;
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 0968e8375000..6ab111c31b28 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -23,6 +23,12 @@
 #define CTRL0_SEL3_SHIFT		8
 #define CTRL0_SEL3_EN_SHIFT		11
 #define CTRL1_FRDDR_FORCE_FINISH	BIT(12)
+#define CTRL2_SEL1_SHIFT		0
+#define CTRL2_SEL1_EN_SHIFT		4
+#define CTRL2_SEL2_SHIFT		8
+#define CTRL2_SEL2_EN_SHIFT		12
+#define CTRL2_SEL3_SHIFT		16
+#define CTRL2_SEL3_EN_SHIFT		20
 
 static int g12a_frddr_dai_prepare(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
@@ -269,6 +275,70 @@ static const struct axg_fifo_match_data g12a_frddr_match_data = {
 	.dai_drv	= &g12a_frddr_dai_drv
 };
 
+/* On SM1, the output selection in on CTRL2 */
+static const struct snd_kcontrol_new sm1_frddr_out1_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL2,
+				    CTRL2_SEL1_EN_SHIFT, 1, 0);
+static const struct snd_kcontrol_new sm1_frddr_out2_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL2,
+				    CTRL2_SEL2_EN_SHIFT, 1, 0);
+static const struct snd_kcontrol_new sm1_frddr_out3_enable =
+	SOC_DAPM_SINGLE_AUTODISABLE("Switch", FIFO_CTRL2,
+				    CTRL2_SEL3_EN_SHIFT, 1, 0);
+
+static SOC_ENUM_SINGLE_DECL(sm1_frddr_sel1_enum, FIFO_CTRL2, CTRL2_SEL1_SHIFT,
+			    axg_frddr_sel_texts);
+static SOC_ENUM_SINGLE_DECL(sm1_frddr_sel2_enum, FIFO_CTRL2, CTRL2_SEL2_SHIFT,
+			    axg_frddr_sel_texts);
+static SOC_ENUM_SINGLE_DECL(sm1_frddr_sel3_enum, FIFO_CTRL2, CTRL2_SEL3_SHIFT,
+			    axg_frddr_sel_texts);
+
+static const struct snd_kcontrol_new sm1_frddr_out1_demux =
+	SOC_DAPM_ENUM("Output Src 1", sm1_frddr_sel1_enum);
+static const struct snd_kcontrol_new sm1_frddr_out2_demux =
+	SOC_DAPM_ENUM("Output Src 2", sm1_frddr_sel2_enum);
+static const struct snd_kcontrol_new sm1_frddr_out3_demux =
+	SOC_DAPM_ENUM("Output Src 3", sm1_frddr_sel3_enum);
+
+static const struct snd_soc_dapm_widget sm1_frddr_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("SRC 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SRC 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SRC 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SWITCH("SRC 1 EN", SND_SOC_NOPM, 0, 0,
+			    &sm1_frddr_out1_enable),
+	SND_SOC_DAPM_SWITCH("SRC 2 EN", SND_SOC_NOPM, 0, 0,
+			    &sm1_frddr_out2_enable),
+	SND_SOC_DAPM_SWITCH("SRC 3 EN", SND_SOC_NOPM, 0, 0,
+			    &sm1_frddr_out3_enable),
+	SND_SOC_DAPM_DEMUX("SINK 1 SEL", SND_SOC_NOPM, 0, 0,
+			   &sm1_frddr_out1_demux),
+	SND_SOC_DAPM_DEMUX("SINK 2 SEL", SND_SOC_NOPM, 0, 0,
+			   &sm1_frddr_out2_demux),
+	SND_SOC_DAPM_DEMUX("SINK 3 SEL", SND_SOC_NOPM, 0, 0,
+			   &sm1_frddr_out3_demux),
+	SND_SOC_DAPM_AIF_OUT("OUT 0", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_component_driver sm1_frddr_component_drv = {
+	.dapm_widgets		= sm1_frddr_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sm1_frddr_dapm_widgets),
+	.dapm_routes		= g12a_frddr_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
+	.ops			= &g12a_fifo_pcm_ops
+};
+
+static const struct axg_fifo_match_data sm1_frddr_match_data = {
+	.component_drv	= &sm1_frddr_component_drv,
+	.dai_drv	= &g12a_frddr_dai_drv
+};
+
 static const struct of_device_id axg_frddr_of_match[] = {
 	{
 		.compatible = "amlogic,axg-frddr",
@@ -276,6 +346,9 @@ static const struct of_device_id axg_frddr_of_match[] = {
 	}, {
 		.compatible = "amlogic,g12a-frddr",
 		.data = &g12a_frddr_match_data,
+	}, {
+		.compatible = "amlogic,sm1-frddr",
+		.data = &sm1_frddr_match_data,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_frddr_of_match);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
