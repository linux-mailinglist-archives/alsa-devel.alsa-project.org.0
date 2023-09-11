Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D079A49A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 09:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 840C1820;
	Mon, 11 Sep 2023 09:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 840C1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694417646;
	bh=KLL4/zg9cHrVjqzy8obIyVqLqEaE3fRqt4rdPfa3oZo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TWIv8P/nvxukt+Zc3WoPSz3DGV73RudInLDH6bmDxXe2Kci4wKWo2d+uYHkmMtYEL
	 G4wsBZnl/un5inXZysBM10OemfRc9mpt6pKXzXwcxji5vfs5zMMKqMupDJLt3ZgO60
	 dnEJWs4v3DYK7efSsjrE5EDJXxb2dPRDBMOWq6Yk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CD6FF805AF; Mon, 11 Sep 2023 09:31:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A2B8F805AF;
	Mon, 11 Sep 2023 09:31:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC485F80425; Mon, 11 Sep 2023 04:41:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp4.hiworks.co.kr (smtp4.hiworks.co.kr [121.254.168.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11F67F801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 04:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F67F801F5
Received: (qmail 111452 invoked from network); 11 Sep 2023 11:40:46 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.38)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	11 Sep 2023 11:40:46 +0900
Received: (qmail 28400 invoked from network); 11 Sep 2023 11:40:45 +0900
Received: from unknown (HELO saram-MINIPC-PN53..)
 (mwkim@gaonchips.com@220.88.49.178)
	by 0 (qmail 1.03 + ejcp v14) with SMTP;
	11 Sep 2023 11:40:45 +0900
X-Authinfo: HIWORKS SMTP authenticated
 <mwkim@gaonchips.com|220.88.49.178|mwkim@gaonchips.com|230911114045_542828023>
X-MailFrom-INFO: Info <country_code:KR|rbl_level:0>
From: Myunguk Kim <mwkim@gaonchips.com>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Uw=20e=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Myunguk Kim <mwkim@gaonchips.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	devicetree@vger.kernel.org
Subject: [PATCH] ASoC: dwc: Add Single DMA mode support
Date: Mon, 11 Sep 2023 11:40:23 +0900
Message-Id: <20230911024023.43833-1-mwkim@gaonchips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mwkim@gaonchips.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DVSSYUV6FKGV5GYSIBEAJ7RFGONFGY52
X-Message-ID-Hash: DVSSYUV6FKGV5GYSIBEAJ7RFGONFGY52
X-Mailman-Approved-At: Mon, 11 Sep 2023 07:31:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVSSYUV6FKGV5GYSIBEAJ7RFGONFGY52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a SoC between dwc and DMA block (ie. PL330)
that does not have a burst signal and supports only single.

So write not-support-burst property on dts, it support single DMA mode.

Signed-off-by: Myunguk Kim <mwkim@gaonchips.com>
---
 .../bindings/sound/snps,designware-i2s.yaml          |  3 +++
 include/sound/designware_i2s.h                       |  1 +
 sound/soc/dwc/dwc-i2s.c                              | 12 ++++++++++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
index a48d040b0a4f..43a46ba2a70c 100644
--- a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
@@ -86,6 +86,9 @@ properties:
       The phandle to System Register Controller syscon node and the I2S-rx(ADC)
       enabled control offset and mask of SYS_SYSCONSAIF__SYSCFG register.
 
+  no-burst:
+    description: Use single transaction only between DesignWare I2S and DMA IP.
+
 allOf:
   - $ref: dai-common.yaml#
   - if:
diff --git a/include/sound/designware_i2s.h b/include/sound/designware_i2s.h
index f6803205a9fb..f0207f21f09d 100644
--- a/include/sound/designware_i2s.h
+++ b/include/sound/designware_i2s.h
@@ -36,6 +36,7 @@ struct i2s_platform_data 
{ 	#define DW_I2S_QUIRK_COMP_REG_OFFSET	(1 << 0)
 	#define DW_I2S_QUIRK_COMP_PARAM1	(1 << 1)
 	#define DW_I2S_QUIRK_16BIT_IDX_OVERRIDE (1 << 2)
+	#define DW_I2S_QUIRK_NO_BURST		(1 << 3)
 	unsigned int quirks;
 	unsigned int i2s_reg_comp1;
 	unsigned int i2s_reg_comp2;
diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 5ab1b3eb2d28..71ff894035a4 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -713,7 +713,10 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 		dev->play_dma_data.dt.fifo_size = fifo_depth *
 			(fifo_width[idx2]) >> 8;
-		dev->play_dma_data.dt.maxburst = 16;
+		if (dev->quirks & DW_I2S_QUIRK_NO_BURST)
+			dev->play_dma_data.dt.maxburst = 1;
+		else
+			dev->play_dma_data.dt.maxburst = 16;
 	}
 	if (COMP1_RX_ENABLED(comp1)) 
{ 		idx2 = COMP2_RX_WORDSIZE_0(comp2);
@@ -722,7 +725,10 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 		dev->capture_dma_data.dt.fifo_size = fifo_depth *
 			(fifo_width[idx2] >> 8);
-		dev->capture_dma_data.dt.maxburst = 16;
+		if (dev->quirks & DW_I2S_QUIRK_NO_BURST)
+			dev->capture_dma_data.dt.maxburst = 1;
+		else
+			dev->capture_dma_data.dt.maxburst = 16;
 	}
 
 	return 0;
@@ -979,6 +985,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 		ret = dw_configure_dai_by_pd(dev, dw_i2s_dai, res, pdata);
 	} else 
{ 		clk_id = "i2sclk";
+		if (of_get_property(pdev->dev.of_node, "no-burst", NULL))
+			dev->quirks |= DW_I2S_QUIRK_NO_BURST;
 		ret = dw_configure_dai_by_dt(dev, dw_i2s_dai, res);
 	}
 	if (ret < 0)
-- 
2.34.1

