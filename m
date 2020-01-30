Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D314DB42
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 14:07:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 138AD1678;
	Thu, 30 Jan 2020 14:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 138AD1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580389663;
	bh=DMFuWJLt4cVw+kLBW1kg/lxsmZMEcFsm0LdbCTShtmM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j7BrsVRaCqF9UEpzoiHWrW1flsu5GAexWqk29C1slRatjnlFEvjTZdAQ44qki3Cyw
	 4ECQ9RGym4Yzo91nii9qPHlmXOTP7/vAm5Dyxxx4h2Ms0s5Ord0UUHiCsCjPaHVnbh
	 Vb94p4Xbf2Oi32WlGJyi/XpspFG2uGKiUpsLZPrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC2AF800F1;
	Thu, 30 Jan 2020 14:06:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63189F8014B; Thu, 30 Jan 2020 14:05:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 123F1F800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 14:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 123F1F800F1
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: BkINU+vNvBMEuPmGTZME0oxSyx9tcuNT89zZky2VclTmF1rdGfxPq2NaOpAHELikB8EOoOdifG
 qnY131M4ZO+7LrKRQnIk4FKyhGaIwArXLQn3eIwXpumbl6SnhYyW89nJ1EGbAq34wLkBK6Xfo/
 DQ4STD4aiq28SH5HtNUaIhbCKFnoWkhQxwqjrc1OO/n9hWXxOvbVya5vpT/RrwPfqihXPi2hm/
 +1h6n9FDFt8jmyoB9w1DNu3GR+02Nfg8WvU0Vlllk36lnzbeLv2aQo4iE4VMdxSAbLQr4hIR1m
 0hg=
X-IronPort-AV: E=Sophos;i="5.70,382,1574146800"; d="scan'208";a="64232611"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jan 2020 06:05:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jan 2020 06:05:52 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 30 Jan 2020 06:05:49 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Thu, 30 Jan 2020 15:05:45 +0200
Message-ID: <20200130130545.31148-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, Arnd Bergmann <arnd@arndb.de>,
 nicolas.ferre@microchip.com, mirq-linux@rere.qmqm.pl,
 ludovic.desroches@microchip.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [alsa-devel] [RESEND PATCH] ASoC: atmel: fix atmel_ssc_set_audio
	link failure
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

From: Arnd Bergmann <arnd@arndb.de>

The ssc audio driver can call into both pdc and dma backends.  With the
latest rework, the logic to do this in a safe way avoiding link errors
was removed, bringing back link errors that were fixed long ago in commit
061981ff8cc8 ("ASoC: atmel: properly select dma driver state") such as

sound/soc/atmel/atmel_ssc_dai.o: In function `atmel_ssc_set_audio':
atmel_ssc_dai.c:(.text+0xac): undefined reference to `atmel_pcm_pdc_platform_register'

Fix it this time using Makefile hacks and a comment to prevent this
from accidentally getting removed again rather than Kconfig hacks.

Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Added my signed-off because I sent the patch, no other changes.

 sound/soc/atmel/Kconfig  |  4 ++--
 sound/soc/atmel/Makefile | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index d1dc8e6366dc..71f2d42188c4 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -10,11 +10,11 @@ config SND_ATMEL_SOC
 if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
-	tristate
+	bool
 	depends on HAS_DMA
 
 config SND_ATMEL_SOC_DMA
-	tristate
+	bool
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 
 config SND_ATMEL_SOC_SSC
diff --git a/sound/soc/atmel/Makefile b/sound/soc/atmel/Makefile
index 1f6890ed3738..c7d2989791be 100644
--- a/sound/soc/atmel/Makefile
+++ b/sound/soc/atmel/Makefile
@@ -6,8 +6,14 @@ snd-soc-atmel_ssc_dai-objs := atmel_ssc_dai.o
 snd-soc-atmel-i2s-objs := atmel-i2s.o
 snd-soc-mchp-i2s-mcc-objs := mchp-i2s-mcc.o
 
-obj-$(CONFIG_SND_ATMEL_SOC_PDC) += snd-soc-atmel-pcm-pdc.o
-obj-$(CONFIG_SND_ATMEL_SOC_DMA) += snd-soc-atmel-pcm-dma.o
+# pdc and dma need to both be built-in if any user of
+# ssc is built-in.
+ifdef CONFIG_SND_ATMEL_SOC_PDC
+obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-pdc.o
+endif
+ifdef CONFIG_SND_ATMEL_SOC_DMA
+obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-dma.o
+endif
 obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel_ssc_dai.o
 obj-$(CONFIG_SND_ATMEL_SOC_I2S) += snd-soc-atmel-i2s.o
 obj-$(CONFIG_SND_MCHP_SOC_I2S_MCC) += snd-soc-mchp-i2s-mcc.o
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
