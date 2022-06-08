Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BFE54296C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 10:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0DE117B7;
	Wed,  8 Jun 2022 10:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0DE117B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654676683;
	bh=01W0PLvIdZYT9S9quj5HZG0Lw8c7nO38/8WOsTTz2/k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tZIKJ9gVNMWVuFnbEXtlNbjRuw26PPVhqk6ZYeUHUMR7KD5Pspuw+37Jnl1YEwPeo
	 +lS6MX1Tnmm5eR6QaT/Ntpll4lkbq+YJRbCxH+ly/wJM+gqSf1JQp4vBgLJ56MBWAQ
	 1m6BhQ2WtmuAnoYXOCidn4vrByBlKMPzmT1sBkNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14926F8026A;
	Wed,  8 Jun 2022 10:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34AE6F8024C; Wed,  8 Jun 2022 10:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AAB8F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 10:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAB8F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OJ/tH0kl"
Received: by mail-ed1-x52e.google.com with SMTP id z7so26010990edm.13
 for <alsa-devel@alsa-project.org>; Wed, 08 Jun 2022 01:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gfVSp3scFj4P4guPC4wruDfDMf9c2cvAElZfIMx3LEY=;
 b=OJ/tH0klk5aBgBXi38k8hIN16orCQvOAI0upfkhUCVxdcz26LvKxPv3BvzUAKAf2oX
 2LL+TozngPMHrT0yJt7T6njY2izvfu6/wjXSnPiagbggsgq6MQyDlr6xYS+HrkXybkZr
 CH8zUUg4VSKdy1rWsZgCFIMxtFqpH6cFJnR17zLdgT1EYI0Ybg9qtyBG8qFWhqEixAhb
 RxhrsH5V26q+WxfV+z8ido1iu9i/dwnB6T/0oYU635S5uLIr4jbqmicDGG2Tscrq4Fzh
 VpjrJM5ugTBF092XAD/UX+J7X3pvzlmSLaapqMrliD7sIYyO7accRXtbR+3VO1ouLPxz
 N8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gfVSp3scFj4P4guPC4wruDfDMf9c2cvAElZfIMx3LEY=;
 b=3MxYZYPjvC597t9H1SpS1TrkEOUCsiXJGIqjw3aa4CemwrwWXDeKfqtH6dXoOdfM1j
 xLoKpcsOGG3gIHdudWQpSRLYpvVqhnyW1ZNtok0BosxO+iB4OJZPTfouAvgM2se8Qw/O
 T9hffAaod6NhG6pOkAHaq9WcPOeF2FyWhxPU7oAdNdriPp15iZDSi8FWIwWjtWcpbfTG
 RCxHyCcUbA08OKVabh+rF4oduGVmKSLcCESbAxar7RDleaSzyZRHIctEuac733hixhV+
 GCbsYU7TnRBsrfq0qc3x9RVgVWsF4RUt4whIFR5mtVQwg9rdZ6+JNyVneItbE9e45rXD
 u/Rg==
X-Gm-Message-State: AOAM530VMigXfosnlCY4u6DL0Cb/S5omXOBIuHqu/iWYzWyqeUJQ652e
 n/8RLP2CCcz47na1T3PXZfk=
X-Google-Smtp-Source: ABdhPJxjJ1Ux3SAC4HGYqyivoD6H+CP/FNb5tKHoOonTD8XxJzdvFsTeNrf7nmvzlFISsKOZAnSCUg==
X-Received: by 2002:a05:6402:3899:b0:42d:d79e:acef with SMTP id
 fd25-20020a056402389900b0042dd79eacefmr37664268edb.12.1654676619754; 
 Wed, 08 Jun 2022 01:23:39 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 o5-20020aa7c7c5000000b0042ad421574esm11965179eds.33.2022.06.08.01.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 01:23:39 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH][next] ASoC: mediatek: mt8186: Fix a handful of spelling
 mistakes
Date: Wed,  8 Jun 2022 09:23:38 +0100
Message-Id: <20220608082338.2083456-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There are several spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 8 ++++----
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 5ba28095b7da..255ffba637d3 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -137,25 +137,25 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 	if (enable) {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI CLK ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI DAT ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
 			return ret;
 		}
 	} else {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI DAT OFF slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI DAT OFF select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MOSI CLK ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
 			return ret;
 		}
 	}
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index c66861fd197d..db71b032770d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -341,7 +341,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 				if (afe_priv->mtkaif_chosen_phase[0] < 0 ||
 				    afe_priv->mtkaif_chosen_phase[1] < 0) {
 					dev_err(afe->dev,
-						"%s(), skip dealy setting mtkaif_chosen_phase[0/1]:%d/%d\n",
+						"%s(), skip delay setting mtkaif_chosen_phase[0/1]:%d/%d\n",
 						__func__,
 						afe_priv->mtkaif_chosen_phase[0],
 						afe_priv->mtkaif_chosen_phase[1]);
-- 
2.35.3

