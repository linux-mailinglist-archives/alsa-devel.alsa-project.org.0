Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779DC3F78
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D6F168D;
	Tue,  1 Oct 2019 20:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D6F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569953384;
	bh=L4Czwh1tbmG07QXA17aurR3J1p9rCHGboObIajmr5Pc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HY74ljblIop7Qle5gF1u6CjHhJXwC78r4v1vMEWo/1Zxl9dECj2RBwuAzEhYAoYO3
	 qGnPTCF3rhY2bL1bGYa/Wk1c8zsWmceQzEtaQw87Uq2n9LACrcC+YwCe/03KIVArsU
	 qjloa4GYQ/Wy8OQCOCUslhK+gfJe+YtNhazjbpuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F390F80768;
	Tue,  1 Oct 2019 19:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53E03F8067A; Tue,  1 Oct 2019 19:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4491F80659
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4491F80659
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aSRtwJJe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=i73WWIk8B01MifqSkaP+B1kg3FODZ6/7rXNN7lYIPZ8=; b=aSRtwJJef93l
 x0/9nu9rsorryiY/9cgELatUJhOfEX5EPwLodzkZo4I19jCvXxmpbSzLFdcohnJkfsS0pPPdIgynp
 o3QpgtihXNWv0e8La1HFJtLN7BRUooOK2K5UvDvq9c6Tydw/isqHidqDBOoq4aBnFFAP0VnV05Azg
 ohlxQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOI-0005tr-CZ; Tue, 01 Oct 2019 17:56:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BC7A62742A30; Tue,  1 Oct 2019 18:56:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20191001135700.31017-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175649.BC7A62742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:49 +0100 (BST)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: madera: Add support for using MCLK3" to
	the asoc tree
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

   ASoC: madera: Add support for using MCLK3

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 767b0bc590576cfda6e6bf2cd45fb8e1843b3ecb Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Tue, 1 Oct 2019 14:57:00 +0100
Subject: [PATCH] ASoC: madera: Add support for using MCLK3

Some Madera CODECs have a third MCLK pin allow this to be sourced for
the FLLs and system clocks.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20191001135700.31017-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/madera.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index 1f3e8e230cf2..6d8938a3fb64 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -27,6 +27,7 @@
 #define MADERA_FLL_SRC_NONE		-1
 #define MADERA_FLL_SRC_MCLK1		0
 #define MADERA_FLL_SRC_MCLK2		1
+#define MADERA_FLL_SRC_MCLK3		2
 #define MADERA_FLL_SRC_SLIMCLK		3
 #define MADERA_FLL_SRC_FLL1		4
 #define MADERA_FLL_SRC_FLL2		5
@@ -51,6 +52,7 @@
 
 #define MADERA_CLK_SRC_MCLK1		0x0
 #define MADERA_CLK_SRC_MCLK2		0x1
+#define MADERA_CLK_SRC_MCLK3		0x2
 #define MADERA_CLK_SRC_FLL1		0x4
 #define MADERA_CLK_SRC_FLL2		0x5
 #define MADERA_CLK_SRC_FLL3		0x6
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
