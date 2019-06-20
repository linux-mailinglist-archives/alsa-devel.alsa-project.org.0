Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A44CEC9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 15:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27976166F;
	Thu, 20 Jun 2019 15:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27976166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561037657;
	bh=N/SgakzRMib+ZD/D3WRMMfWH3t2QXR+MKZeS3zUxvdc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FaIvZxYo3sbqVWCcJ4yuz4xOPfXCvIsFzsbYhYwxTLEq7RNSXEZC8bTU0Pze2JK4b
	 tOfapwlJX9dv3N2HHWyY/ah1y9dhKHdwSsrlMebs9+KCxAFl+pJkEz/Nft0r9G1EX/
	 8xG1UYf1/SNSSkXKSRAt0ECU7wWg+Sm7kj8qXCKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CDF6F8971B;
	Thu, 20 Jun 2019 15:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8971BF8070D; Thu, 20 Jun 2019 15:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9200CF896F4
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 15:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9200CF896F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="T3FFHeLs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2WS5ihdR5tqErcWY2jqafs+zVEF2YGNkJtPvY5wjnyA=; b=T3FFHeLszK5Z
 n2HwLsW7vy4HAeLyySz9OI87Rv65ZuTYszTPp4669ajfHkpYmOgWJHwxuHj+1rBx69xsA4CzkT9QH
 TaSZHrWkS/Jb4y1E+u8Ncp3oCxyc+h+ktlYOImDUZshR8RQRiun1bfsGBs4ApVqpKFYxUoD/UUnG7
 qYtds=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdxAv-0000ib-9p; Thu, 20 Jun 2019 13:32:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id AB9CF44004C; Thu, 20 Jun 2019 14:32:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190620092002.13766-2-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190620133224.AB9CF44004C@finisterre.sirena.org.uk>
Date: Thu, 20 Jun 2019 14:32:24 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, jsarha@ti.com, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Set unused
	serializers as INACTIVE" to the asoc tree
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

   ASoC: ti: davinci-mcasp: Set unused serializers as INACTIVE

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 5dd17a3c3ed545f73b8bf7754efd5f6125bf7531 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 20 Jun 2019 12:20:01 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Set unused serializers as INACTIVE

Unused serializers needs to be configured as INACTIVE, otherwise they will
underflow/overflow when multiple serializers are connected, but some are
not needed for the given stream.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index a8378d223a9e..8bec0dc4f754 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -848,14 +848,15 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 					rx_ser < max_active_serializers) {
 			clear_bit(PIN_BIT_AXR(i), &mcasp->pdir);
 			rx_ser++;
-		} else if (mcasp->serial_dir[i] == INACTIVE_MODE) {
+		} else {
+			/* Inactive or unused pin, set it to inactive */
 			mcasp_mod_bits(mcasp, DAVINCI_MCASP_XRSRCTL_REG(i),
 				       SRMOD_INACTIVE, SRMOD_MASK);
-			clear_bit(PIN_BIT_AXR(i), &mcasp->pdir);
-		} else if (mcasp->serial_dir[i] == TX_MODE) {
-			/* Unused TX pins, clear PDIR  */
-			mcasp_mod_bits(mcasp, DAVINCI_MCASP_XRSRCTL_REG(i),
-				       mcasp->dismod, DISMOD_MASK);
+			/* If unused, set DISMOD for the pin */
+			if (mcasp->serial_dir[i] != INACTIVE_MODE)
+				mcasp_mod_bits(mcasp,
+					       DAVINCI_MCASP_XRSRCTL_REG(i),
+					       mcasp->dismod, DISMOD_MASK);
 			clear_bit(PIN_BIT_AXR(i), &mcasp->pdir);
 		}
 	}
@@ -965,6 +966,7 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 		for (i = 0; i < active_slots; i++)
 			mask |= (1 << i);
 	}
+
 	mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, TX_ASYNC);
 
 	if (!mcasp->dat_port)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
