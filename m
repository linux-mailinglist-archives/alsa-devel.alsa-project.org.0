Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C15511231
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 09:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F4917C6;
	Wed, 27 Apr 2022 09:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F4917C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651043782;
	bh=SU1rseyUkAiXiZcsXZDgIkTfZeLKpuPSWKm8j6CPUVQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FOkz/ComuY4MLoXkF0EAn6DBnWXSqRZdl2t7b+Q6luDxWRmiPzU20T3abJKB9KKpW
	 gafDt0xHJVTNaW/uUWxl6/0b44eD9JEokyDgEBcgCtQN2luZmt2J3L0dysEG81X28m
	 91AZKzktLEf7xoEqazduloCtG0nKgdh7FP90Lzwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A736AF80253;
	Wed, 27 Apr 2022 09:15:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87F2EF8016E; Wed, 27 Apr 2022 09:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABD75F800AE;
 Wed, 27 Apr 2022 09:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD75F800AE
X-UUID: ee196ef9134c4ae7b0be0a341beb4f6d-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7cb683a5-a8fc-48d8-97bd-0393bb816b16, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:87a8a5c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ee196ef9134c4ae7b0be0a341beb4f6d-20220427
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1066266900; Wed, 27 Apr 2022 15:15:00 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 15:14:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 15:14:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 15:14:59 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>, "Yaochun
 Hung" <yc.hung@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH v2] ASoC: SOF: mediatek: Fix allyesconfig build error
Date: Wed, 27 Apr 2022 15:10:30 +0800
Message-ID: <20220427071030.10172-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
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

ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x18): multiple
definition of `adsp_clock_on';
sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x60): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
`.adsp_clock_on':

ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x30): multiple
definition of `adsp_clock_off';
sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x78): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
`.adsp_clock_off':

ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x0): multiple
definition of `sof_hifixdsp_boot_sequence';
sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x0): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
`.sof_hifixdsp_boot_sequence':

ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o:(.opd+0x18): multiple
definition of `sof_hifixdsp_shutdown';
 sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(.opd+0x18): first defined
here
ld: sound/soc/sof/mediatek/mt8186/mt8186-loader.o: in function
`.sof_hifixdsp_shutdown':

Fixes: 570c14dc92d5 ("ASoC: SOF: mediatek: Add mt8186 sof fw loader and
dsp ops")
Fixes: 210b3ab932f7 ("ASoC: SOF: mediatek: Add mt8186 dsp clock support")

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---

Changes since v1:
Rebase on Mark's for-next and update "Fixes" commit id

---
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c    |  4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h    |  4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c |  4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 18 +++++++++---------
 sound/soc/sof/mediatek/mt8186/mt8186.h        |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
index 5f805981b8e6..22220fd50b62 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
@@ -74,7 +74,7 @@ static void adsp_disable_all_clock(struct snd_sof_dev *sdev)
 	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
 }
 
-int adsp_clock_on(struct snd_sof_dev *sdev)
+int mt8186_adsp_clock_on(struct snd_sof_dev *sdev)
 {
 	struct device *dev = sdev->dev;
 	int ret;
@@ -92,7 +92,7 @@ int adsp_clock_on(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-void adsp_clock_off(struct snd_sof_dev *sdev)
+void mt8186_adsp_clock_off(struct snd_sof_dev *sdev)
 {
 	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_CK_EN, 0);
 	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_UART_CTRL, 0);
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
index fa174dfceff0..89c23caf0fee 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
@@ -19,6 +19,6 @@ enum adsp_clk_id {
 };
 
 int mt8186_adsp_init_clock(struct snd_sof_dev *sdev);
-int adsp_clock_on(struct snd_sof_dev *sdev);
-void adsp_clock_off(struct snd_sof_dev *sdev);
+int mt8186_adsp_clock_on(struct snd_sof_dev *sdev);
+void mt8186_adsp_clock_off(struct snd_sof_dev *sdev);
 #endif
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
index 6ab4921b1010..548b12c33d8a 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
@@ -11,7 +11,7 @@
 #include "mt8186.h"
 #include "../../ops.h"
 
-void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
+void mt8186_sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 {
 	/* set RUNSTALL to stop core */
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
@@ -39,7 +39,7 @@ void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
 				RUNSTALL, 0);
 }
 
-void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
+void mt8186_sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
 {
 	/* set RUNSTALL to stop core */
 	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c8faa63497c6..6d574fd4492e 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -211,7 +211,7 @@ static int mt8186_run(struct snd_sof_dev *sdev)
 
 	adsp_bootup_addr = SRAM_PHYS_BASE_FROM_DSP_VIEW;
 	dev_dbg(sdev->dev, "HIFIxDSP boot from base : 0x%08X\n", adsp_bootup_addr);
-	sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
+	mt8186_sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
 
 	return 0;
 }
@@ -284,9 +284,9 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	ret = adsp_clock_on(sdev);
+	ret = mt8186_adsp_clock_on(sdev);
 	if (ret) {
-		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		dev_err(sdev->dev, "mt8186_adsp_clock_on fail!\n");
 		return ret;
 	}
 
@@ -297,18 +297,18 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 
 static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
-	sof_hifixdsp_shutdown(sdev);
+	mt8186_sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
-	adsp_clock_off(sdev);
+	mt8186_adsp_clock_off(sdev);
 
 	return 0;
 }
 
 static int mt8186_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
-	sof_hifixdsp_shutdown(sdev);
+	mt8186_sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
-	adsp_clock_off(sdev);
+	mt8186_adsp_clock_off(sdev);
 
 	return 0;
 }
@@ -317,9 +317,9 @@ static int mt8186_dsp_resume(struct snd_sof_dev *sdev)
 {
 	int ret;
 
-	ret = adsp_clock_on(sdev);
+	ret = mt8186_adsp_clock_on(sdev);
 	if (ret) {
-		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		dev_err(sdev->dev, "mt8186_adsp_clock_on fail!\n");
 		return ret;
 	}
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index df52ae9659e4..98b2965e5ba6 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -75,6 +75,6 @@ struct snd_sof_dev;
 #define SIZE_SHARED_DRAM_UL			0x40000 /*Shared buffer for Uplink*/
 #define TOTAL_SIZE_SHARED_DRAM_FROM_TAIL	(SIZE_SHARED_DRAM_DL + SIZE_SHARED_DRAM_UL)
 
-void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
-void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
+void mt8186_sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
+void mt8186_sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
 #endif
-- 
2.18.0

