Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A89EDDCDAC
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0E1167D;
	Fri, 18 Oct 2019 20:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0E1167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571422437;
	bh=uaeIhMHpwbn/N46wR4P4V29mbNcE26gjyhhZnzn1jkA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hSHRBk0CxNMrTz68Hr0dpLtDbCDdf/znkmfL76UQzpVe8u1ssaxG1AH3U6CkALHbJ
	 XECwanoNA8fxRIbTspndH+5eyovxQvpwFIa1ETBcHvxLxXcMTmHqa2P97A0PunvBpM
	 aF/yy8zAX5wLp9m69jLIOkUVYiBXpq0+ppfa3szc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21570F80672;
	Fri, 18 Oct 2019 20:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C79CBF80611; Fri, 18 Oct 2019 20:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFE57F805FB
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE57F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MA1YsvCV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zgj1k1MhkF4/2yUkMOt2RfyxHbkblu/gDQSDTPudqFM=; b=MA1YsvCVevf1
 y/cANjMIurKncfMJdq6PqpiDETClyN+z53ImVjSd78hrpFH/sSYgWaSkjdYoJVTOZNcwCyp+2Q+gA
 29POl6mNjveeCrhjqhagi2R8cJSIYvfkPi3sJbBdZ9q2hqAQEEmRhmCPDo2zcEPZaMTNwOLEtiAeJ
 pe6ns=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeS-0004FO-8N; Fri, 18 Oct 2019 18:07:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B5BCC2743276; Fri, 18 Oct 2019 19:06:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
In-Reply-To: <20191015200900.25798-1-rikard.falkeborn@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20191018180659.B5BCC2743276@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:06:59 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 navada@ti.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 dmurphy@ti.com
Subject: [alsa-devel] Applied "ASoC: tas2562: Fix misuse of GENMASK macro"
	to the asoc tree
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

   ASoC: tas2562: Fix misuse of GENMASK macro

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

From 0e4b8717578e05ec6aa6d51939e6dc746f3198e9 Mon Sep 17 00:00:00 2001
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Date: Tue, 15 Oct 2019 22:09:00 +0200
Subject: [PATCH] ASoC: tas2562: Fix misuse of GENMASK macro

Arguments are supposed to be ordered high then low.

Fixes: c173dba44c2d ("ASoC: tas2562: Introduce the TAS2562 amplifier")
Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Link: https://lore.kernel.org/r/20191015200900.25798-1-rikard.falkeborn@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2562.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 60f2bb1d198b..62e659ab786d 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -62,7 +62,7 @@
 
 #define TAS2562_TDM_CFG2_RIGHT_JUSTIFY	BIT(6)
 
-#define TAS2562_TDM_CFG2_RXLEN_MASK	GENMASK(0, 1)
+#define TAS2562_TDM_CFG2_RXLEN_MASK	GENMASK(1, 0)
 #define TAS2562_TDM_CFG2_RXLEN_16B	0x0
 #define TAS2562_TDM_CFG2_RXLEN_24B	BIT(0)
 #define TAS2562_TDM_CFG2_RXLEN_32B	BIT(1)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
