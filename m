Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39D6FA154
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:45:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CFD12BC;
	Mon,  8 May 2023 09:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CFD12BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683531940;
	bh=b40Kk6ygL/6dN8P/x+3akpBi4xadkxrZDsPy/MKnihk=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=W+Dx4mjKX/UtdewG6dNtj/LaN0c2yWleRYQRfQRJFD9SRDsikAl5PKo3xjTetHDda
	 Acyl3xdGZ2vTycAHtx8zFAyprCkiHtdmXSSd2nrDwOAv40013adWzboLd7Y58uvW4b
	 OPd77RmCvqUM0SMcmAjU1Drv0gwpSZZvgpbI9yMY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0B63F80548;
	Mon,  8 May 2023 09:44:33 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: dwc: add optional reset support
Date: Thu,  4 May 2023 10:16:17 +0300
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 08 May 2023 07:44:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WBHYGGE6FWYKFSHT4IZBGXN56OTH7MB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <168353187320.26.35269573829590476@mailman-core.alsa-project.org>
From: Maxim Kochetkov via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A94AF804B1; Thu,  4 May 2023 09:16:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F7E6F800EC
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 09:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F7E6F800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=IeT+9ypG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=hKo0Mv5u8yOZd6F3jwlctKzLF0X+Iv4/yaslyz4Ip2M=;
	t=1683184598;x=1683274598;
	b=IeT+9ypG4BzqYdoWYlBDVXgwgUO83+80+0E7YztAyCacYz0UiJHxSbisNMtf/qr45Q7300k5taswrdRr6LbEjq/KY9bszIDeTvtFRTsL4Tmg2caJ0lLYOyHKo8QIA2Kjbm7JF/WMnvDlXYypceDmVcKkKO2I072d7elFLcMIde5fzRn0yW298z8mUtDmCyZ5uieEPg167plGMAhh+pCdb3wlMAURZNKPcIRD15ZE9BadrIsQruyZYSOy5WA1iOK7mrqADp3ta0gy+SETSkYrgKwDNWPzI7XLAB05LbqUP3yXtHJSa/xIDiiHG/rFmT1t6TtBFSL0QTDzuZggG9wewA==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1puTCY-0007k3-0L; Thu, 04 May 2023 10:16:30 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: dwc: add optional reset support
Date: Thu,  4 May 2023 10:16:17 +0300
Message-Id: <20230504071618.52012-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 
 4F1203BC0FB41BD9EB47717F7D295292E0516141E5D86376F2DFE8ECF2FCA72A182A05F53808504034A9434BA99DB5352780EB93A9FD84D94814A8A05414E6CC0D364D197ADC1A70
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE789066434B85BF7C7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376AEB812070489DF38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D849ACEA835D8E2583257C32809AED315D6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE709B92020B71E24959FA2833FD35BB23D9E625A9149C048EE85C08DA1A1AB276ACB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAC2A732D1458794B389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC8C7ADC89C2F0B2A5E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDAE3FA6833AEA0C275ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 
 0D63561A33F958A503439DE132D5218B2658D2C8601A3F543E15D5C58A09B520F87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA5889C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF07B5384B90BFA1E895DC25B431169CF5437927BBE18CB5AC602C074FBC6CF64449C71475D3C8093114EE98CD8E9D35FC436DDACEF6D4C3FDB5CF41F06F5DEB836E346BF9FA413E5543082AE146A756F3
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojtUGOBMG7VVMIApYSxRkWyw==
X-Mailru-Sender: 
 689FA8AB762F73933AF1F914F131DBF5234E1EED9E5D9F257AEAE2297C377E2D98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6WBHYGGE6FWYKFSHT4IZBGXN56OTH7MB
X-Message-ID-Hash: 6WBHYGGE6FWYKFSHT4IZBGXN56OTH7MB
X-Mailman-Approved-At: Mon, 08 May 2023 07:44:30 +0000
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 p.zabel@pengutronix.de, ckeepax@opensource.cirrus.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WBHYGGE6FWYKFSHT4IZBGXN56OTH7MB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some SoC may have resets for I2S subsystem. So add optional reset support.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 27 +++++++++++++++++++++------
 sound/soc/dwc/local.h   |  1 +
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index acdf98b2ee9c..e2b2ba014a2e 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
 #include <sound/designware_i2s.h>
@@ -648,6 +649,14 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->i2s_base))
 		return PTR_ERR(dev->i2s_base);
 
+	dev->reset = devm_reset_control_array_get_optional_shared(&pdev->dev);
+	if (IS_ERR(dev->reset))
+		return PTR_ERR(dev->reset);
+
+	ret = reset_control_deassert(dev->reset);
+	if (ret)
+		return ret;
+
 	dev->dev = &pdev->dev;
 
 	irq = platform_get_irq_optional(pdev, 0);
@@ -656,7 +665,7 @@ static int dw_i2s_probe(struct platform_device *pdev)
 				pdev->name, dev);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "failed to request irq\n");
-			return ret;
+			goto err_assert_reset;
 		}
 	}
 
@@ -676,24 +685,27 @@ static int dw_i2s_probe(struct platform_device *pdev)
 		ret = dw_configure_dai_by_dt(dev, dw_i2s_dai, res);
 	}
 	if (ret < 0)
-		return ret;
+		goto err_assert_reset;
 
 	if (dev->capability & DW_I2S_MASTER) {
 		if (pdata) {
 			dev->i2s_clk_cfg = pdata->i2s_clk_cfg;
 			if (!dev->i2s_clk_cfg) {
 				dev_err(&pdev->dev, "no clock configure method\n");
-				return -ENODEV;
+				ret = -ENODEV;
+				goto err_assert_reset;
 			}
 		}
 		dev->clk = devm_clk_get(&pdev->dev, clk_id);
 
-		if (IS_ERR(dev->clk))
-			return PTR_ERR(dev->clk);
+		if (IS_ERR(dev->clk)) {
+			ret = PTR_ERR(dev->clk);
+			goto err_assert_reset;
+		}
 
 		ret = clk_prepare_enable(dev->clk);
 		if (ret < 0)
-			return ret;
+			goto err_assert_reset;
 	}
 
 	dev_set_drvdata(&pdev->dev, dev);
@@ -727,6 +739,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 err_clk_disable:
 	if (dev->capability & DW_I2S_MASTER)
 		clk_disable_unprepare(dev->clk);
+err_assert_reset:
+	reset_control_assert(dev->reset);
 	return ret;
 }
 
@@ -737,6 +751,7 @@ static void dw_i2s_remove(struct platform_device *pdev)
 	if (dev->capability & DW_I2S_MASTER)
 		clk_disable_unprepare(dev->clk);
 
+	reset_control_assert(dev->reset);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/sound/soc/dwc/local.h b/sound/soc/dwc/local.h
index 1c361eb6127e..d64bd4f8fd34 100644
--- a/sound/soc/dwc/local.h
+++ b/sound/soc/dwc/local.h
@@ -89,6 +89,7 @@ union dw_i2s_snd_dma_data {
 struct dw_i2s_dev {
 	void __iomem *i2s_base;
 	struct clk *clk;
+	struct reset_control *reset;
 	int active;
 	unsigned int capability;
 	unsigned int quirks;
-- 
2.39.2

