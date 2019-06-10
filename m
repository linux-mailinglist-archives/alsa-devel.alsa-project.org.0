Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B27383AD6D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 05:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30997167C;
	Mon, 10 Jun 2019 05:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30997167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560136197;
	bh=L6QaQ8bCrOGiNfAZ+I4igilUAyvOHBuw6/hj99KsFJs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SDcSgK/90i/OpAoH0treHqR8VeKMkbItoWaVc35DkGFdxxkJpjb13Z4jywkB1DaCl
	 IyKsKgOHqp0FqShbmiVBf3/uqlyL8M48XlfjHld/3vHtbIo7dHcdiYJhECjvYeSIOs
	 Ld/KkbQVHs27yCtnDTeB2PsmKLnHL7KGKPCzp/yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 919B4F896EA;
	Mon, 10 Jun 2019 05:08:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17515F8970C; Mon, 10 Jun 2019 05:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 418B5F896E0
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 05:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 418B5F896E0
Received: from NTHCCAS01.nuvoton.com (nthccas01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id 4187B1C80CA1;
 Mon, 10 Jun 2019 11:05:26 +0800 (CST)
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Mon, 10 Jun 2019
 11:05:25 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Mon, 10 Jun
 2019 11:05:25 +0800
Received: from localhost.localdomain (10.4.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.0.1130.7 via Frontend
 Transport; Mon, 10 Jun 2019 11:05:25 +0800
From: John Hsu <KCHSU0@nuvoton.com>
To: <broonie@kernel.org>
Date: Mon, 10 Jun 2019 11:05:23 +0800
Message-ID: <20190610030523.12408-1-KCHSU0@nuvoton.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com,
 John Hsu <KCHSU0@nuvoton.com>, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com
Subject: [alsa-devel] [PATCH] ASoC: nau8822: support master mode
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

From: David Lin <CTLIN0@nuvoton.com>

The driver selects the proper BCLK divide through the BCLK and FS
at the hardware parameter when the I2S master mode.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
---
 sound/soc/codecs/nau8822.c | 18 ++++++++++++++++++
 sound/soc/codecs/nau8822.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index c6152a044416..78db3bd0b3bc 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -828,6 +828,24 @@ static int nau8822_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
 	int val_len = 0, val_rate = 0;
+	unsigned int ctrl_val, bclk_fs, bclk_div;
+
+	/* make BCLK and LRC divide configuration if the codec as master. */
+	snd_soc_component_read(component, NAU8822_REG_CLOCKING, &ctrl_val);
+	if (ctrl_val & NAU8822_CLK_MASTER) {
+		/* get the bclk and fs ratio */
+		bclk_fs = snd_soc_params_to_bclk(params) / params_rate(params);
+		if (bclk_fs <= 32)
+			bclk_div = NAU8822_BCLKDIV_8;
+		else if (bclk_fs <= 64)
+			bclk_div = NAU8822_BCLKDIV_4;
+		else if (bclk_fs <= 128)
+			bclk_div = NAU8822_BCLKDIV_2;
+		else
+			return -EINVAL;
+		snd_soc_component_update_bits(component, NAU8822_REG_CLOCKING,
+				NAU8822_BCLKSEL_MASK, bclk_div);
+	}
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
diff --git a/sound/soc/codecs/nau8822.h b/sound/soc/codecs/nau8822.h
index 9c552983a293..489191ff187e 100644
--- a/sound/soc/codecs/nau8822.h
+++ b/sound/soc/codecs/nau8822.h
@@ -107,10 +107,17 @@
 
 /* NAU8822_REG_CLOCKING (0x6) */
 #define NAU8822_CLKIOEN_MASK			0x1
+#define NAU8822_CLK_MASTER			0x1
+#define NAU8822_CLK_SLAVE			0x0
 #define NAU8822_MCLKSEL_SFT			5
 #define NAU8822_MCLKSEL_MASK			(0x7 << 5)
 #define NAU8822_BCLKSEL_SFT			2
 #define NAU8822_BCLKSEL_MASK			(0x7 << 2)
+#define NAU8822_BCLKDIV_1			(0x0 << 2)
+#define NAU8822_BCLKDIV_2			(0x1 << 2)
+#define NAU8822_BCLKDIV_4			(0x2 << 2)
+#define NAU8822_BCLKDIV_8			(0x3 << 2)
+#define NAU8822_BCLKDIV_16			(0x4 << 2)
 #define NAU8822_CLKM_MASK			(0x1 << 8)
 #define NAU8822_CLKM_MCLK			(0x0 << 8)
 #define NAU8822_CLKM_PLL			(0x1 << 8)
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
