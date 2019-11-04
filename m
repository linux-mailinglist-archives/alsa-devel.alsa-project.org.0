Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A43FCEE167
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:38:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 386711758;
	Mon,  4 Nov 2019 14:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 386711758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874681;
	bh=Xemdjq3vOmjG8vxtg1C/thGYUxuVwgAPP5nDy+ZdvEk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mT0GpPl00yrsQ6eYZuBry/sFznY+4MSg6rfZa16wWWHy6rnOIaQVlQHJ8mvXzDsIK
	 B+laukjgKUj8Y4eUkoeNfwWfV7JGqar6aWd1Pdtd5YL54bvPeyDSIbISdhuxXcW2MG
	 LLLvAjK02u/KDsILsp8ny/RG56BNh1R3B1KmDQCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C026F80737;
	Mon,  4 Nov 2019 14:27:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0B30F80671; Mon,  4 Nov 2019 14:27:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9029DF80633
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9029DF80633
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QPIbZUhy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KjOFqC3LpLokCguUrWPascEa+8RC7whRG2pGwXHTHq8=; b=QPIbZUhyhI8A
 hrhMyqH9Y8uKjJ/GSa9AjVML7+vOEkULPQx7aokJ7+nONV3KEgTvrqgm0Dw3Yp/Q3aGZ74oBcHZzJ
 Y74BuMWwYT6zDR8a/HcI8vRV4Tb9pSWPgP7woVOkON65WkPn554k0tbYVltxUtr7OQBptg4KZdVE8
 +P1i8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO2-0002f4-Vb; Mon, 04 Nov 2019 13:27:15 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 64AE3274301E; Mon,  4 Nov 2019 13:27:14 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: zhong jiang <zhongjiang@huawei.com>
In-Reply-To: <1572528855-25990-1-git-send-email-zhongjiang@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132714.64AE3274301E@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:14 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 zhongjiang@huawei.com
Subject: [alsa-devel] Applied "ASoC: ux500: Remove redundant variable
	"status"" to the asoc tree
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

   ASoC: ux500: Remove redundant variable "status"

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

From e0859710516c98b189879966b48ea1c77e0cd979 Mon Sep 17 00:00:00 2001
From: zhong jiang <zhongjiang@huawei.com>
Date: Thu, 31 Oct 2019 21:34:15 +0800
Subject: [PATCH] ASoC: ux500: Remove redundant variable "status"

local variable "status" is not used. hence it is safe to remove and
just return 0.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
Link: https://lore.kernel.org/r/1572528855-25990-1-git-send-email-zhongjiang@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ux500/ux500_msp_i2s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index a90e0d7f0b73..394d8b2a4a16 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -533,7 +533,6 @@ static void disable_msp_tx(struct ux500_msp *msp)
 static int disable_msp(struct ux500_msp *msp, unsigned int dir)
 {
 	u32 reg_val_GCR;
-	int status = 0;
 	unsigned int disable_tx, disable_rx;
 
 	reg_val_GCR = readl(msp->registers + MSP_GCR);
@@ -566,7 +565,7 @@ static int disable_msp(struct ux500_msp *msp, unsigned int dir)
 	else if (disable_rx)
 		disable_msp_rx(msp);
 
-	return status;
+	return 0;
 }
 
 int ux500_msp_i2s_trigger(struct ux500_msp *msp, int cmd, int direction)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
