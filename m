Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16198628FE3
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 03:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB497166F;
	Tue, 15 Nov 2022 03:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB497166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668479203;
	bh=cTk9TfyqhNKT2Z8ZxSkFnUV4w4kBV+5CV9HP7c+wjlw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bQfvD4sUDoRoY4ieKWhipu//tD6dtO+sFzRVJe52RLNpYDoAGISvnZ+T1rgnDpfPD
	 kINmlf2ydyyrLIkffV1ZEi5WrmSKPujrwHBJrpY7RGIzpNMjEM7ueGXutgbMsJ8vy3
	 0LnVq7cGLjWSOghgJZlwP3cR3Y0o/P/Gk8lyF3CU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E96EAF8057A;
	Tue, 15 Nov 2022 03:25:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0692F8056F; Tue, 15 Nov 2022 03:25:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE, UNPARSEABLE_RELAY,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from out29-219.mail.aliyun.com (out29-219.mail.aliyun.com
 [115.124.29.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A869F8016D
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 03:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A869F8016D
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2609913|-1;
 BR=01201311R141S60rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00722545-0.000141331-0.992633;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q7RJh33_1668479084; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q7RJh33_1668479084) by smtp.aliyun-inc.com;
 Tue, 15 Nov 2022 10:24:45 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V4 6/6] ASoC:codecs:aw883xx corresponds to the modified
 Makefile and Kconfig
Date: Tue, 15 Nov 2022 10:24:23 +0800
Message-Id: <20221115022423.6437-7-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115022423.6437-1-wangweidong.a@awinic.com>
References: <1668165992-6493-2-git-send-email-wangweidong.a@awinic.com>
 <20221115022423.6437-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: duanyibo@awinic.com, Weidong Wang <wangweidong.a@awinic.com>,
 zhaolei@awinic.com, liweilei@awinic.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
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

From: Weidong Wang <wangweidong.a@awinic.com>

Modified the Makefile and Kconfig to compile aw883xx

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/Kconfig  | 10 ++++++++++
 sound/soc/codecs/Makefile |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7022e6286e6c..f14e0a78acd4 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -54,6 +54,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ALC5623
 	imply SND_SOC_ALC5632
 	imply SND_SOC_AW8738
+	imply SND_SOC_AW883XX
 	imply SND_SOC_BT_SCO
 	imply SND_SOC_BD28623
 	imply SND_SOC_CQ0093VC
@@ -2161,4 +2162,13 @@ config SND_SOC_LPASS_TX_MACRO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
 
+config SND_SOC_AW883XX
+	tristate "Soc Audio for awinic aw883xx series"
+	depends on I2C
+	help
+	  this option enables support for aw883xx series Smart PA.
+	  The Awinic AW883XX is an I2S/TDM input, high efficiency
+	  digital Smart K audio amplifier with an integrated 10V
+	  smart boost convert.
+
 endmenu
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 9170ee1447dd..858ca24ad398 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -357,6 +357,11 @@ snd-soc-tas2780-objs := tas2780.o
 # Mux
 snd-soc-simple-mux-objs := simple-mux.o
 
+snd_soc_aw883xx-objs := aw883xx/aw883xx.o \
+						aw883xx/aw883xx_init.o \
+						aw883xx/aw883xx_device.o \
+						aw883xx/aw883xx_bin_parse.o \
+
 obj-$(CONFIG_SND_SOC_88PM860X)	+= snd-soc-88pm860x.o
 obj-$(CONFIG_SND_SOC_AB8500_CODEC)	+= snd-soc-ab8500-codec.o
 obj-$(CONFIG_SND_SOC_AC97_CODEC)	+= snd-soc-ac97.o
@@ -719,3 +724,5 @@ obj-$(CONFIG_SND_SOC_LPASS_TX_MACRO)	+= snd-soc-lpass-tx-macro.o
 
 # Mux
 obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+= snd-soc-simple-mux.o
+
+obj-$(CONFIG_SND_SOC_AW883XX) +=snd_soc_aw883xx.o
-- 
2.38.1

