Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1064EF232
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 17:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB03A1AE1;
	Fri,  1 Apr 2022 17:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB03A1AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648825491;
	bh=wVyq9J1SSbisUk8t9r2GT4LhTm0byo/d3aeBXkM2RMo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gxI8+vtlMIPPq+sbrtHW8C/y+JfQ3rzGyeU40uRqN5WDntMwrruyg2hqYi0iB04kU
	 kDPJK0jXPTpvnDR2By2Mif95+7hAVPWoJ/3X52Eqvk+mLr2nchRmOqTafreTEgL/rd
	 6aaLpr5mCtKdbVx8jRkzlj/6ABfm8zxGUM6K6jGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B21F80519;
	Fri,  1 Apr 2022 17:03:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA0DF80520; Fri,  1 Apr 2022 17:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 SPOOFED_FREEMAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 226CAF8020D
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 17:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226CAF8020D
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[120.231.214.8])
 by rmsmtp-lg-appmail-27-12032 (RichMail) with SMTP id 2f0062471426e32-0cadd;
 Fri, 01 Apr 2022 23:03:14 +0800 (CST)
X-RM-TRANSID: 2f0062471426e32-0cadd
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v6 1/3] rename tas2764 to tas27xx
Date: Fri,  1 Apr 2022 23:02:59 +0800
Message-Id: <20220401150301.1011-1-13691752556@139.com>
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

rename tas2764.c and tas2764.h to tas27xx.c and tas27xx.h

rename tas2764 to tas27xx in Kconfig and Makefile

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 sound/soc/codecs/Kconfig                  | 6 +++---
 sound/soc/codecs/Makefile                 | 4 ++--
 sound/soc/codecs/{tas2764.c => tas27xx.c} | 0
 sound/soc/codecs/{tas2764.h => tas27xx.h} | 0
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename sound/soc/codecs/{tas2764.c => tas27xx.c} (100%)
 rename sound/soc/codecs/{tas2764.h => tas27xx.h} (100%)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f46a22660103..3aa5f35c1d7c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -213,7 +213,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_STI_SAS
 	imply SND_SOC_TAS2552
 	imply SND_SOC_TAS2562
-	imply SND_SOC_TAS2764
+	imply SND_SOC_TAS27XX
 	imply SND_SOC_TAS2770
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
@@ -1472,8 +1472,8 @@ config SND_SOC_TAS2562
 	tristate "Texas Instruments TAS2562 Mono Audio amplifier"
 	depends on I2C
 
-config SND_SOC_TAS2764
-	tristate "Texas Instruments TAS2764 Mono Audio amplifier"
+config SND_SOC_TAS27XX
+	tristate "Texas Instruments TAS27xx Mono Audio amplifier"
 	depends on I2C
 
 config SND_SOC_TAS2770
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 8637e9e869e3..15ceb95d42f5 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -337,7 +337,7 @@ snd-soc-simple-amplifier-objs := simple-amplifier.o
 snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
 snd-soc-tas2562-objs := tas2562.o
-snd-soc-tas2764-objs := tas2764.o
+snd-soc-tas27xx-objs := tas27xx.o
 # Mux
 snd-soc-simple-mux-objs := simple-mux.o
 
@@ -574,7 +574,7 @@ obj-$(CONFIG_SND_SOC_STAC9766)	+= snd-soc-stac9766.o
 obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
 obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
-obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
+obj-$(CONFIG_SND_SOC_TAS27XX)	+= snd-soc-tas27xx.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas27xx.c
similarity index 100%
rename from sound/soc/codecs/tas2764.c
rename to sound/soc/codecs/tas27xx.c
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas27xx.h
similarity index 100%
rename from sound/soc/codecs/tas2764.h
rename to sound/soc/codecs/tas27xx.h
-- 
2.35.1


