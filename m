Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D561448B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 07:13:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03A8516A2;
	Tue,  1 Nov 2022 07:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03A8516A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667283205;
	bh=VhyHNczJRxuYZAiNWFi0j9k65Fe/qurGzW72ifGijFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=svKyE0qye4vme9hSzLwmfBB88A2E1YQDBUGNru49VbHbMqH9t3erIEHtIk/qkkGb8
	 8WR9xz0TS4LlvEQiirj7o2EFPZykX/hxnYcQ1PHjcn9QZ+yHdjNDvIKLIsFBMTMgVa
	 /+roHmb7Gh1Dr3vy+h9cj6a70UvoHecyRgaaT95M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E5AAF80553;
	Tue,  1 Nov 2022 07:12:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BAC5F80553; Tue,  1 Nov 2022 07:11:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEB49F80155;
 Tue,  1 Nov 2022 07:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB49F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="GuUVMsDw"
X-UUID: 845b764c036743428ea1af133456fa44-20221101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qKVQ5xUvwJLnVjPZU5c5Gw7oruotfGjxaq+qal/96R4=; 
 b=GuUVMsDwkmDD7i5cWGFB/69htQfxwCVbR0tMncQU5xKaAHKhq6yFOuc7pscmKfUXtFN5G2HBslg3Cv/T8sS5Krjj1ZCyWPuyKXid8lWw7xrsZImXvY059WXCroPJEKpYYCk0Eo82McZrAq1WHYyDu0C3ejglmq7rv3eEPvNsTSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:8e59e156-0255-4f9c-a468-7c19a5da7fe8, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:70
X-CID-INFO: VERSION:1.1.12, REQID:8e59e156-0255-4f9c-a468-7c19a5da7fe8, IP:0,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:70
X-CID-META: VersionHash:62cd327, CLOUDID:8a6f3e81-3116-4fbc-b86b-83475c3df513,
 B
 ulkID:221101141141HA5AA7M9,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 845b764c036743428ea1af133456fa44-20221101
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 272453379; Tue, 01 Nov 2022 14:11:40 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 14:11:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 14:11:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Yaochun Hung
 <yc.hung@mediatek.com>
Subject: [PATCH v1 2/2] ASoC: SOF: mediatek: Revise mt8186 ADSP clock driver
Date: Tue, 1 Nov 2022 14:11:37 +0800
Message-ID: <20221101061137.25731-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221101061137.25731-1-tinghan.shen@mediatek.com>
References: <20221101061137.25731-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Initialize the required clocks for mt8186 ADSP. The ADSP core is
expected booting with 26M clock, and using the mainpll_d2_d2 clock
for ADSP bus.

The enable/disable order of clocks is also revised. The clock should
be enabled as mainpll_d2_d2 -> adsp bus -> adsp, and disabled in the
reversed order.

Fixes: 210b3ab932f7 ("ASoC: SOF: mediatek: Add mt8186 dsp clock support")
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c | 35 +++++++++++++++++-----
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h |  2 ++
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
index 2df3b7ae1c6f..c86391aa7948 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
@@ -20,6 +20,8 @@
 static const char *adsp_clks[ADSP_CLK_MAX] = {
 	[CLK_TOP_AUDIODSP] = "audiodsp",
 	[CLK_TOP_ADSP_BUS] = "adsp_bus",
+	[CLK_TOP_MAINPLL_D2_D2] = "mainpll_d2_d2",
+	[CLK_TOP_CLK26M] = "clk26m",
 };
 
 int mt8186_adsp_init_clock(struct snd_sof_dev *sdev)
@@ -48,18 +50,36 @@ static int adsp_enable_all_clock(struct snd_sof_dev *sdev)
 	struct device *dev = sdev->dev;
 	int ret;
 
-	ret = clk_prepare_enable(priv->clk[CLK_TOP_AUDIODSP]);
+	ret = clk_set_parent(priv->clk[CLK_TOP_AUDIODSP], priv->clk[CLK_TOP_CLK26M]);
+	if (ret) {
+		dev_err(dev, "set audiodsp clock fail %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_set_parent(priv->clk[CLK_TOP_ADSP_BUS], priv->clk[CLK_TOP_MAINPLL_D2_D2]);
+	if (ret) {
+		dev_err(dev, "set adsp bus clock fail %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
 	if (ret) {
-		dev_err(dev, "%s clk_prepare_enable(audiodsp) fail %d\n",
-			__func__, ret);
+		dev_err(dev, "clk_prepare_enable(mainpll_d2_d2) fail %d\n", ret);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(priv->clk[CLK_TOP_ADSP_BUS]);
 	if (ret) {
-		dev_err(dev, "%s clk_prepare_enable(adsp_bus) fail %d\n",
-			__func__, ret);
-		clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
+		dev_err(dev, "clk_prepare_enable(adsp_bus) fail %d\n", ret);
+		clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_AUDIODSP]);
+	if (ret) {
+		dev_err(dev, "clk_prepare_enable(audiodsp) fail %d\n", ret);
+		clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
+		clk_disable_unprepare(priv->clk[CLK_TOP_ADSP_BUS]);
 		return ret;
 	}
 
@@ -70,8 +90,9 @@ static void adsp_disable_all_clock(struct snd_sof_dev *sdev)
 {
 	struct adsp_priv *priv = sdev->pdata->hw_pdata;
 
-	clk_disable_unprepare(priv->clk[CLK_TOP_ADSP_BUS]);
 	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_ADSP_BUS]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D2_D2]);
 }
 
 int mt8186_adsp_clock_on(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
index 89c23caf0fee..37f5cfa2b230 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
@@ -15,6 +15,8 @@ struct snd_sof_dev;
 enum adsp_clk_id {
 	CLK_TOP_AUDIODSP,
 	CLK_TOP_ADSP_BUS,
+	CLK_TOP_MAINPLL_D2_D2,
+	CLK_TOP_CLK26M,
 	ADSP_CLK_MAX
 };
 
-- 
2.18.0

