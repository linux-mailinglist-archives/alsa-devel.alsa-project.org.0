Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE43741FF5F
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 05:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C4DA1692;
	Sun,  3 Oct 2021 05:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C4DA1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633230337;
	bh=/WRaeqQXW8Qr+OqzTHHwCPuWiB3wv8AaXMzk5fTKZHk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tOv/QKQKm1CH6o1OjzHcZAlLeK7ZFecWOMRzlHsp5/KlwVXsF9ghqbfEJoHk82AEH
	 vcysLJzrZRZ3UssKG3UVAbyVJtlsgDbNk5h3uYkfvgegB8dtHhPqvJVnhn38PbOtkR
	 c3tM/Wi6/LHIY1rxLqARnOEB+59LkYES8sHL7m2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D892BF80171;
	Sun,  3 Oct 2021 05:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AB1FF8027D; Sun,  3 Oct 2021 05:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F0C0F80259
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 05:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0C0F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="dsSyZPPI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=V2oLactPpE5eJWgOLN3Dhq4j/4VC1w7xQGXAdA2EUAA=; b=dsSyZPPISXb3VZpr7E4zsjPCYm
 Rdwbph+1+lOthfEY7StkeMW/KId/D8kKDxpXjV/ogYGSBxj2js+NEUBfsaU2HU1UUAphnlTbwNpVu
 g/SASSf37tG2LRI4uZqq1X48WVkWJZZR2dwbnnsyw7l7XojZtj7JGaEt4r2evyyw43wmi9iWSmLLj
 qYdmcR5KQq+L0PnDsUA4SMF1JdtEMGDvNbpXu1gQRRAY8R4bQkiMftDj/hhQYLvITws+08P04+0p0
 zTTZCWaw9YAWKD63qCLgipjHS2vEJiCwjWQjQpJ6KKyN8WN4d8Khd8azf7HKa6uFWEzlfO7MIBawr
 OPZhwgXw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWrnJ-0037Sc-Qe; Sun, 03 Oct 2021 03:04:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: add COMPILE_TEST for SND_SOC_FSL_ASRC
Date: Sat,  2 Oct 2021 20:04:04 -0700
Message-Id: <20211003030404.32707-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
 Fabio Estevam <festevam@gmail.com>
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

Geert pointed out that since sound/soc has the soc_dummy_driver for
NO_DMA platforms, it is possible (desirable) to have drivers that
depend on HAS_DMA to alternately depend on COMPILE_TEST.

This means that SND_ATMEL_FSL_ASRC can depend on HAS_DMA || COMPIE_TEST.

Fixes: 121a01521b1e ("ASoC: fsl: fix build failure")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211001.orig/sound/soc/fsl/Kconfig
+++ linux-next-20211001/sound/soc/fsl/Kconfig
@@ -5,7 +5,7 @@ comment "Common SoC Audio options for Fr
 
 config SND_SOC_FSL_ASRC
 	tristate "Asynchronous Sample Rate Converter (ASRC) module support"
-	depends on HAS_DMA
+	depends on HAS_DMA || COMPILE_TEST
 	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
