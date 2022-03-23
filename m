Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C174E4BE6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 05:28:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F7F1705;
	Wed, 23 Mar 2022 05:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F7F1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648009711;
	bh=CA+xoEYurJjWXXHs2wy4/RNfgaz1326bLyIURPDSH3I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OdElpAMt+Vr8RMZPIKSFSl3PCxizsYdtnmIFOkNwRq8wPh2lurTBUf4wC0Z9hYo2N
	 /wONXGZwydyLiy7LRf5KdktlCqLFySZjMlSM6XR4Sa52gJ3ZbnCGBqjfXschXGsdoM
	 JKkhuGn8v+vqPER/4Q/jnrPLpddutzwL+g3+Irik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C14F8047C;
	Wed, 23 Mar 2022 05:27:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF28AF800AA; Wed, 23 Mar 2022 05:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 SPOOFED_FREEMAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7998AF800AA
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 05:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7998AF800AA
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-35-12049 (RichMail) with SMTP id 2f11623aa18b8b8-888e4;
 Wed, 23 Mar 2022 12:27:07 +0800 (CST)
X-RM-TRANSID: 2f11623aa18b8b8-888e4
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v4 1/3] rename tas2764 to tas27xx-Makefile and Kconfig
Date: Wed, 23 Mar 2022 12:26:42 +0800
Message-Id: <20220323042644.635-1-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com, Raphael-Xu <13691752556@139.com>
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

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 sound/soc/codecs/Kconfig  | 13 ++++++++-----
 sound/soc/codecs/Makefile |  4 ++--
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d3e5ae8310ef..95f45f3b6b17 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -212,8 +212,8 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_STI_SAS
 	imply SND_SOC_TAS2552
 	imply SND_SOC_TAS2562
-	imply SND_SOC_TAS2764
 	imply SND_SOC_TAS2770
+	imply SND_SOC_TAS27XX
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
 	imply SND_SOC_TAS5720
@@ -1459,14 +1459,17 @@ config SND_SOC_TAS2562
 	tristate "Texas Instruments TAS2562 Mono Audio amplifier"
 	depends on I2C
 
-config SND_SOC_TAS2764
-	tristate "Texas Instruments TAS2764 Mono Audio amplifier"
-	depends on I2C
-
 config SND_SOC_TAS2770
 	tristate "Texas Instruments TAS2770 speaker amplifier"
 	depends on I2C
 
+config SND_SOC_TAS27XX
+	tristate "Texas Instruments TAS27xx speaker amplifier"
+	depends on I2C
+	help
+	  Enable support for Texas Instruments TAS2764 and TAS2780
+	  power amplifiers
+
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ac7f20972470..2cd2b2352ee7 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -334,7 +334,7 @@ snd-soc-simple-amplifier-objs := simple-amplifier.o
 snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
 snd-soc-tas2562-objs := tas2562.o
-snd-soc-tas2764-objs := tas2764.o
+snd-soc-tas27xx-objs := tas27xx.o
 # Mux
 snd-soc-simple-mux-objs := simple-mux.o
 
@@ -570,7 +570,7 @@ obj-$(CONFIG_SND_SOC_STAC9766)	+= snd-soc-stac9766.o
 obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
 obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
-obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
+obj-$(CONFIG_SND_SOC_TAS27XX)	+= snd-soc-tas27xx.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
-- 
2.35.1


