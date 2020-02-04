Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3B1519D1
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 12:25:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D1E51698;
	Tue,  4 Feb 2020 12:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D1E51698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580815523;
	bh=xpCofeRbAJxr+svXTdA6QJCAQKJ2QRM0Uk620XNN56o=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kZz50cljsC1ruli/FCcCnkIpdhS/SmPCG74BRt2VatikdIy15llKPCf7SAQEmB4tf
	 p6/JQe5eJLvX9H0KOpi68rQnmDcCHFEwomHHK5oHWYittp+3nxK5Ym4hlME3mv8Rkd
	 FrkzrkLU0NQrBFiAjdsOmCKIrvev4asSnHJo/ze0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13ACFF8015B;
	Tue,  4 Feb 2020 12:23:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00833F80162; Tue,  4 Feb 2020 12:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25485F800AB
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 12:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25485F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rkMTOmyx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=p3ecvIGvTCPUYxkPwEIi3DyBl4sbJaimA2IDcfZHVA0=; b=rkMTOmyxLH9K
 T3arp4n3AjZwzYNX5SW0yWsqPHOzCgChYCtf4oAMvbKCrETXdcL7lh0qsQLf/JgBotdvuYDIep8rx
 4UYmWjWwic0BXMsX2YVCBMh9TZzZdF4FlsPtG5Ye6YSOpLst3rO70vQvK8PJlEIwdiqDx3+lkARrM
 2QPfY=;
Received: from fw-tnat-cam2.arm.com ([217.140.106.50]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iywIo-0007QR-GZ; Tue, 04 Feb 2020 11:23:34 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 271E2D01A54; Tue,  4 Feb 2020 11:23:34 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200204111241.6927-1-srinivas.kandagatla@linaro.org>
Message-Id: <applied-20200204111241.6927-1-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Date: Tue,  4 Feb 2020 11:23:34 +0000 (GMT)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: wcd934x: Add missing COMMON_CLK
	dependency" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: wcd934x: Add missing COMMON_CLK dependency

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 42b716359beca10684195fd6e93a74ecd8ca8003 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 4 Feb 2020 11:12:41 +0000
Subject: [PATCH] ASoC: wcd934x: Add missing COMMON_CLK dependency

Looks like some platforms are not yet using COMMON CLK.

PowerPC allyesconfig failed with below error in next

ld: sound/soc/codecs/wcd934x.o:(.toc+0x0):
	 undefined reference to `of_clk_src_simple_get'
ld: sound/soc/codecs/wcd934x.o: in function `.wcd934x_codec_probe':
wcd934x.c:(.text.wcd934x_codec_probe+0x3d4):
	 undefined reference to `.__clk_get_name'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x438):
	 undefined reference to `.clk_hw_register'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x474):
	 undefined reference to `.of_clk_add_provider'

Add the missing COMMON_CLK dependency to fix this errors.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200204111241.6927-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c9eb683bd1b0..286514865960 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1334,6 +1334,7 @@ config SND_SOC_WCD9335
 
 config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
+	depends on COMMON_CLK
 	depends on MFD_WCD934X
 	help
 	  The WCD9340/9341 is a audio codec IC Integrated in
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
