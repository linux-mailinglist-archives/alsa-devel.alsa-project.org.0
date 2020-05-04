Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DDC1C37F7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 13:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CDE916F5;
	Mon,  4 May 2020 13:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CDE916F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588591345;
	bh=iBrV7IM9uEgPX2li2IhEeyu/3IMs3ecxSA4kbOKHRCY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DQVQ34njZ/7pfev2piQATe226BGA3wfpUV6N6fclgOQC9TemS93siaqsIg5bQZaPO
	 H98lFe1bERdFHxDgv4iNXsyoSTbYiMJDK6aWD2XPTt6yHjDu6NWIytbc2k0ZWtDF9Z
	 0uOR+RbdPgDZNGAIKh3SS6v8WFWOI88S1osjoxPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD099F800E5;
	Mon,  4 May 2020 13:20:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAF52F800E5; Mon,  4 May 2020 13:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DBC2F800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 13:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DBC2F800E5
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 044BKNsW4006080,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 044BKNsW4006080
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 4 May 2020 19:20:23 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 4 May 2020 19:20:23 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 4 May 2020
 19:20:23 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015: Add condition to prevent SoC providing bclk in
 ratio of 50 times of sample rate.
Date: Mon, 4 May 2020 19:20:13 +0800
Message-ID: <20200504112013.2499-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB06.realtek.com.tw (172.21.6.99) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 albertwang@realtek.com, flove@realtek.com
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

From: Jack Yu <jack.yu@realtek.com>

Add condition to prevent SoC providing bclk in ratio of 50 times of sample rate.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015.c | 27 +++++++++++++++++++++++++++
 sound/soc/codecs/rt1015.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index bb310bc7febd..5eb07a430ae3 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -780,6 +780,14 @@ static int rt1015_set_component_pll(struct snd_soc_component *component,
 		freq_out == rt1015->pll_out)
 		return 0;
 
+	if (source == RT1015_PLL_S_BCLK) {
+		if (rt1015->bclk_ratio == 0) {
+			dev_err(component->dev,
+				"Can not support bclk ratio as 0.\n");
+			return -EINVAL;
+		}
+	}
+
 	switch (source) {
 	case RT1015_PLL_S_MCLK:
 		snd_soc_component_update_bits(component, RT1015_CLK2,
@@ -819,12 +827,30 @@ static int rt1015_set_component_pll(struct snd_soc_component *component,
 	return 0;
 }
 
+static int rt1015_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	dev_dbg(component->dev, "%s ratio=%d\n", __func__, ratio);
+
+	rt1015->bclk_ratio = ratio;
+
+	if (ratio == 50) {
+		dev_dbg(component->dev, "Unsupport bclk ratio\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rt1015_probe(struct snd_soc_component *component)
 {
 	struct rt1015_priv *rt1015 =
 		snd_soc_component_get_drvdata(component);
 
 	rt1015->component = component;
+	rt1015->bclk_ratio = 0;
 	snd_soc_component_write(component, RT1015_BAT_RPO_STEP1, 0x061c);
 
 	return 0;
@@ -844,6 +870,7 @@ static void rt1015_remove(struct snd_soc_component *component)
 static struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
+	.set_bclk_ratio = rt1015_set_bclk_ratio,
 };
 
 static struct snd_soc_dai_driver rt1015_dai[] = {
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index ef3745a4faae..6fbe802082c4 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -362,6 +362,7 @@ struct rt1015_priv {
 	int sysclk_src;
 	int lrck;
 	int bclk;
+	int bclk_ratio;
 	int id;
 	int pll_src;
 	int pll_in;
-- 
2.25.1

