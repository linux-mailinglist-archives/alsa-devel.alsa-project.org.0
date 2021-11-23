Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D645A03D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 11:31:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D19167B;
	Tue, 23 Nov 2021 11:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D19167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637663518;
	bh=GXDTUFTTFHaD3vPYcwv5FAdMlvWKE3D+Aj3NdfhVDJs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qWhBqEJvjuzfZuhUCMB3rezhCpF0gsKDFr3EIrGt4aUwO5YhhK/z/lgYLsZ+FqK4A
	 8V00Z0sUwJ9+/Bmki/bhlES7/SA88lvr/SynMIp49JWOSMa7opPgSysjkgqShw/3wb
	 WFm06bUzQi0BYAnSOAnqfVmvPmtQcTM2L4RYNqBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10395F804AB;
	Tue, 23 Nov 2021 11:30:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04CCF804AB; Tue, 23 Nov 2021 11:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C16DAF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 11:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C16DAF80154
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
 by albert.telenet-ops.be with bizsmtp
 id MmWE260014yPVd606mWEn0; Tue, 23 Nov 2021 11:30:21 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpT41-00EUu8-OA; Tue, 23 Nov 2021 11:30:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpT41-000JAa-B5; Tue, 23 Nov 2021 11:30:13 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: YC Hung <yc.hung@mediatek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: SOF: mediatek: Use %pR/%pa to print resources/physical
 addresses
Date: Tue, 23 Nov 2021 11:30:13 +0100
Message-Id: <20211123103013.73645-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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

On 32-bit with CONFIG_ARCH_DMA_ADDR_T_64BIT=n:

    sound/soc/sof/mediatek/mt8195/mt8195.c: In function ‘platform_parse_resource’:
    sound/soc/sof/mediatek/mt8195/mt8195.c:51:15: error: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘unsigned int’ [-Werror=format=]
       51 |  dev_dbg(dev, "DMA pbase=0x%llx, size=0x%llx\n",
	  |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    sound/soc/sof/mediatek/mt8195/mt8195.c: In function ‘adsp_memory_remap_init’:
    sound/soc/sof/mediatek/mt8195/mt8195.c:167:15: error: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘phys_addr_t’ {aka ‘unsigned int’} [-Werror=format=]
      167 |  dev_dbg(dev, "adsp->pa_dram %llx, offset %#x\n", adsp->pa_dram, offset);
	  |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    sound/soc/sof/mediatek/mt8195/mt8195.c: In function ‘adsp_shared_base_ioremap’:
    sound/soc/sof/mediatek/mt8195/mt8195.c:196:15: error: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘phys_addr_t’ {aka ‘unsigned int’} [-Werror=format=]
      196 |  dev_dbg(dev, "shared-dram vbase=%p, phy addr :%llx,  size=%#x\n",
	  |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix the first cases by printing the full resource using %pR.
Fix the other cases by printing the physical addresses using %pa.

Reported-by: noreply@ellerman.id.au
Fixes: 32d7e03d26fd9318 ("ASoC: SOF: mediatek: Add mt8195 hardware support")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 40e5a25875a6a93c..b1580b6ac8e19e61 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -48,8 +48,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 		return ret;
 	}
 
-	dev_dbg(dev, "DMA pbase=0x%llx, size=0x%llx\n",
-		(phys_addr_t)res.start, resource_size(&res));
+	dev_dbg(dev, "DMA %pR\n", &res);
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
@@ -164,7 +163,7 @@ static int adsp_memory_remap_init(struct device *dev, struct mtk_adsp_chip_info
 	offset = adsp->pa_dram - DRAM_PHYS_BASE_FROM_DSP_VIEW;
 	adsp->dram_offset = offset;
 	offset >>= DRAM_REMAP_SHIFT;
-	dev_dbg(dev, "adsp->pa_dram %llx, offset %#x\n", adsp->pa_dram, offset);
+	dev_dbg(dev, "adsp->pa_dram %pa, offset %#x\n", &adsp->pa_dram, offset);
 	writel(offset, vaddr_emi_map);
 	if (offset != readl(vaddr_emi_map)) {
 		dev_err(dev, "write emi map fail : %#x\n", readl(vaddr_emi_map));
@@ -193,8 +192,8 @@ static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
 			return -ENOMEM;
 		}
 	}
-	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%llx,  size=%#x\n",
-		adsp->shared_dram, adsp->pa_shared_dram, shared_size);
+	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa,  size=%#x\n",
+		adsp->shared_dram, &adsp->pa_shared_dram, shared_size);
 
 	return 0;
 }
-- 
2.25.1

