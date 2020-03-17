Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6971877EC
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 03:55:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64481843;
	Tue, 17 Mar 2020 03:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64481843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584413725;
	bh=anGe/IgtnxihRsq3Kv/I33bFNq2LeMM47P8/hZeBLO8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nqqb9J4tlrAcvkJcdr0N34QrhXrANVetc6ALrcb1RFqWT7lmR7AupXrl6drb3qgKA
	 WqeRsM/qXoPetsjbxGtu25/J4iwsLKhKVvQcUov6HiKDTft6pckB1wXlBoO8zywW8y
	 dhDPOAxLMLkKeueeGhkMMVqdb4HtU1jUVN2jfTRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 568FFF80253;
	Tue, 17 Mar 2020 03:53:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71FFEF80217; Tue, 17 Mar 2020 03:52:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F30F800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 03:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F30F800CD
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 02H2qiC1017677,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 02H2qiC1017677
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 10:52:45 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 17 Mar 2020 10:52:44 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 17 Mar
 2020 10:52:44 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/3] ASoC: rt5682: Add a property for DMIC clock rate setting
Date: Tue, 17 Mar 2020 10:52:38 +0800
Message-ID: <20200317025240.10435-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB06.realtek.com.tw (172.21.6.99) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, cychiang@google.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

The patch adds a property for DMIC clock rate setting and changes the
default clock rate to the common optimize DMIC clock rate.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 include/sound/rt5682.h    | 1 +
 sound/soc/codecs/rt5682.c | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index 6bf0e3581056..96b268ac96bd 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -38,6 +38,7 @@ struct rt5682_platform_data {
 	enum rt5682_dmic1_clk_pin dmic1_clk_pin;
 	enum rt5682_jd_src jd_src;
 	unsigned int btndet_delay;
+	unsigned int dmic_clk_rate;
 
 	const char *dai_clk_names[RT5682_DAI_NUM_CLKS];
 };
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7ca02a5e52e9..809dc91a89b4 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1231,10 +1231,13 @@ static int set_dmic_clk(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	int idx = -EINVAL;
+	int idx = -EINVAL, dmic_clk_rate = 3072000;
 	static const int div[] = {2, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128};
 
-	idx = rt5682_div_sel(rt5682, 1500000, div, ARRAY_SIZE(div));
+	if (rt5682->pdata.dmic_clk_rate)
+		dmic_clk_rate = rt5682->pdata.dmic_clk_rate;
+
+	idx = rt5682_div_sel(rt5682, dmic_clk_rate, div, ARRAY_SIZE(div));
 
 	snd_soc_component_update_bits(component, RT5682_DMIC_CTRL_1,
 		RT5682_DMIC_CLK_MASK, idx << RT5682_DMIC_CLK_SFT);
@@ -3231,6 +3234,8 @@ static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 		&rt5682->pdata.jd_src);
 	device_property_read_u32(dev, "realtek,btndet-delay",
 		&rt5682->pdata.btndet_delay);
+	device_property_read_u32(dev, "realtek,dmic-clk-rate",
+		&rt5682->pdata.dmic_clk_rate);
 
 	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
 		"realtek,ldo1-en-gpios", 0);
-- 
2.25.1

