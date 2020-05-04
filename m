Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E54D91C3439
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 10:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8555816F2;
	Mon,  4 May 2020 10:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8555816F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588580353;
	bh=EyPDz3l7v/bjjeLYsc9r/pet6B7fr5gcXU7YTGa+F08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t6kPtLB/qk3vemavJXTyW7/C6lVxfkQBoS4BUBSsc814SlcpiLVIfJs/f0f/G3sSB
	 +fU8c6iHO3htrpyv/rZiEPQ+K//BCXlWpEOx6yHUXKJNb0e6enaBIoTM9lJwfE0x2B
	 EyrRe5AZhvEfUVUTAbJjVPHRrTtBEdj4y7ZQaAzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 855E9F80258;
	Mon,  4 May 2020 10:17:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FE11F8026F; Mon,  4 May 2020 10:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1ECEF800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 10:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1ECEF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="HdfD/OL3"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eafcf640000>; Mon, 04 May 2020 01:16:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 01:16:49 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 May 2020 01:16:49 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 08:16:48 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 4 May 2020 08:16:48 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eafcf6d0000>; Mon, 04 May 2020 01:16:48 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH 1/3] ALSA: hda/tegra: correct number of SDO lines for Tegra194
Date: Mon, 4 May 2020 13:46:14 +0530
Message-ID: <1588580176-2801-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
References: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588580196; bh=+t6kfCjvQiDL8r1qJvd+8QlpafsTcpsPq6mZIgSZ3b0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=HdfD/OL36bhYPiDNI63wTPpBKDNmqOQe+eT5Pjd3/NGNjEPNpjdCRA6TcO1Ncqef0
 ep4/e3E5hFrfxS3YJlnJMU0ib1NMw2khzw3IByMzYjXOSU0ikQzW4NMWE33by5OBDs
 bjRBjSJdaKgeHsscXR3BvjobO1kaGp+a04BIMgNHDYMzJ35k0PYW+5z9Kp/m5+C8sc
 UlAkP5p1aK9X1zh0TkOAUoKmMP1mXisziko4bL7dU+M2+hy4pknuDkn7lrivuTqOXu
 b+Fl7G/CKKXp4xtPC6PzT5ZofrzOo/ggiPyDp8+YbAqnXSWMTPbDMgPbC65hcnR9za
 h7ysBosqw7dhw==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

Tegra194 supports 4 SDO lines but GCAP register indicates 2 lines. Thus it
does not reflect the true capability of the HW. This patch presents a
workaround by updating NSDO value accordingly in T_AZA_DBG_CFG_2 register.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 773992a..45dc544 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -52,10 +52,21 @@
 #define HDA_IPFS_INTR_MASK        0x188
 #define HDA_IPFS_EN_INTR          (1 << 16)
 
+/* FPCI */
+#define FPCI_DBG_CFG_2		  0x10F4
+#define FPCI_GCAP_NSDO_SHIFT	  18
+#define FPCI_GCAP_NSDO_MASK	  (0x3 << FPCI_GCAP_NSDO_SHIFT)
+
 /* max number of SDs */
 #define NUM_CAPTURE_SD 1
 #define NUM_PLAYBACK_SD 1
 
+/*
+ * Tegra194 does not reflect correct number of SDO lines. Below macro
+ * is used to update the GCAP register to workaround the issue.
+ */
+#define TEGRA194_NUM_SDO_LINES	  4
+
 struct hda_tegra {
 	struct azx chip;
 	struct device *dev;
@@ -275,6 +286,7 @@ static int hda_tegra_init_clk(struct hda_tegra *hda)
 
 static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 {
+	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 	struct hdac_bus *bus = azx_bus(chip);
 	struct snd_card *card = chip->card;
 	int err;
@@ -298,6 +310,26 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	bus->irq = irq_id;
 	card->sync_irq = bus->irq;
 
+	/*
+	 * Tegra194 has 4 SDO lines and the STRIPE can be used to
+	 * indicate how many of the SDO lines the stream should be
+	 * striped. But GCAP register does not reflect the true
+	 * capability of HW. Below workaround helps to fix this.
+	 *
+	 * GCAP_NSDO is bits 19:18 in T_AZA_DBG_CFG_2,
+	 * 0 for 1 SDO, 1 for 2 SDO, 2 for 4 SDO lines.
+	 */
+	if (of_device_is_compatible(np, "nvidia,tegra194-hda")) {
+		u32 val;
+
+		dev_info(card->dev, "Override SDO lines to %u\n",
+			 TEGRA194_NUM_SDO_LINES);
+
+		val = readl(hda->regs + FPCI_DBG_CFG_2) & ~FPCI_GCAP_NSDO_MASK;
+		val |= (TEGRA194_NUM_SDO_LINES >> 1) << FPCI_GCAP_NSDO_SHIFT;
+		writel(val, hda->regs + FPCI_DBG_CFG_2);
+	}
+
 	gcap = azx_readw(chip, GCAP);
 	dev_dbg(card->dev, "chipset global capabilities = 0x%x\n", gcap);
 
@@ -408,6 +440,7 @@ static int hda_tegra_create(struct snd_card *card,
 
 static const struct of_device_id hda_tegra_match[] = {
 	{ .compatible = "nvidia,tegra30-hda" },
+	{ .compatible = "nvidia,tegra194-hda" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, hda_tegra_match);
-- 
2.7.4

