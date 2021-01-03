Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E484B2E8C5B
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jan 2021 14:55:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0A51677;
	Sun,  3 Jan 2021 14:54:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0A51677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609682100;
	bh=RfD85uyAyXiT/UWv6+Zq6MnRrDYD8p+2jEiLShXKqnw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AhpfqCcvHbxg0+Xs01Nc7wxHIWynJiwDjA0bhuCR613iTSd2RFCEgRWHe0t75lBUZ
	 8xTL1skbFHGrp7lj+l1Ti8qP7owfVNcYKDIv7i2BBVyUyeIslComOb8UuxLnmNZmbv
	 9cbYy/EX5HrwW1eh+ONsFj/eH+P0ufWcoe20zaCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F94F804B4;
	Sun,  3 Jan 2021 14:53:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65342F804B1; Sun,  3 Jan 2021 14:53:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A96EF8049C
 for <alsa-devel@alsa-project.org>; Sun,  3 Jan 2021 14:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A96EF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b5xNoNt2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C417208C7;
 Sun,  3 Jan 2021 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609682012;
 bh=RfD85uyAyXiT/UWv6+Zq6MnRrDYD8p+2jEiLShXKqnw=;
 h=From:To:Cc:Subject:Date:From;
 b=b5xNoNt2oqW1nFjz0hNJWeaDU9FkDI+xCSEveh9Ofia7TDzsKLy/X3gdXqadTSyc3
 Z/v2pTuOzJqCnR6ZMPIE6B8ua+Zyti8cg3cEsWPseKwnW/oA/vfnPRflcFgm60Xlj7
 qeCDI4W5KX1qAcUI6+JJcM6PmxRw8AHPcOhZWeNxgOl8adr0Vn6V2BR+hv3TDEK+36
 iDZpS2kzPPlS8aPjVEB+zdS/wcxKQhbbtfK7Ugn+SP5KOXgKctsCGlKldqIp9SHM9y
 EXMw2VtnmXFjG/tNDEO6NII6kUXfEI+UIfqRgaZe/wTShVOxsaBoRNM037Do4HNl2E
 +VFo/3wdW3TZA==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH] ASoC: fsl_aud2htx: select SND_SOC_IMX_PCM_DMA
Date: Sun,  3 Jan 2021 14:53:17 +0100
Message-Id: <20210103135327.3630973-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Viorel Suman <viorel.suman@nxp.com>, Fabio Estevam <festevam@gmail.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver requires DMA support and fails to build
when that is disabled:

aarch64-linux-ld: sound/soc/fsl/fsl_aud2htx.o: in function `fsl_aud2htx_probe':
fsl_aud2htx.c:(.text+0x3e0): undefined reference to `imx_pcm_dma_init'

Fixes: 8a24c834c053 ("ASoC: fsl_aud2htx: Add aud2htx module driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 84db0b7b9d59..d7f30036d434 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -108,6 +108,7 @@ config SND_SOC_FSL_XCVR
 config SND_SOC_FSL_AUD2HTX
 	tristate "AUDIO TO HDMI TX module support"
 	depends on ARCH_MXC || COMPILE_TEST
+	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	help
 	  Say Y if you want to add AUDIO TO HDMI TX support for NXP.
 
-- 
2.29.2

