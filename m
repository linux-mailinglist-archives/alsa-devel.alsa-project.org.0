Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A69C918310B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:16:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5680216F3;
	Thu, 12 Mar 2020 14:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5680216F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584018982;
	bh=6s9tod2h119YPGEpjHcz7ScCBIkJbplsfOE4O1AY30U=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lgeGPYzAay6KZRLlj1UOQadJDU+TvrWWn+tAAZGrsRniGIsY9V2ZvhnFDL7SoVrqa
	 9IsZG3qqwWvn1nT9nLqYcD/Csmd5uU4iCPhtotdOscxWXFuUV5aY9AkmafyER7ptIr
	 R4ObUBtHOJUt5gLCS7Rpeor2ToTz4VNwlR3ZW+Ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B27F802A0;
	Thu, 12 Mar 2020 14:13:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C19D2F80290; Thu, 12 Mar 2020 14:13:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D058F8028E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 14:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D058F8028E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DE83FEC;
 Thu, 12 Mar 2020 06:13:03 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D79EE3F534;
 Thu, 12 Mar 2020 06:13:02 -0700 (PDT)
Date: Thu, 12 Mar 2020 13:13:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: qdsp6: q6routing: remove default routing" to the asoc
 tree
In-Reply-To: <20200311180422.28363-3-srinivas.kandagatla@linaro.org>
Message-Id: <applied-20200311180422.28363-3-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Cc: Vinod Koul <vinod.koul@linaro.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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

The patch

   ASoC: qdsp6: q6routing: remove default routing

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From f864edff110d3e6f8995636a9a604f6b98eaa308 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 11 Mar 2020 18:04:22 +0000
Subject: [PATCH] ASoC: qdsp6: q6routing: remove default routing

Frontend dais can be configured to rx or tx or both, however having default
routes without considering this configuration can lead to failures during
card probe as below for compress rx only case. These routing have to come
from sound card routing table in device tree.

"routing: ASoC: Failed to add route MM_UL1 -> direct -> MultiMedia1 Capture
msm-snd-sdm845 sound: ASoC: failed to instantiate card -19
"

Reported-by: Vinod Koul <vinod.koul@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200311180422.28363-3-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 20724102e85a..4d5915b9a06d 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -918,25 +918,6 @@ static const struct snd_soc_dapm_route intercon[] = {
 	{"MM_UL6", NULL, "MultiMedia6 Mixer"},
 	{"MM_UL7", NULL, "MultiMedia7 Mixer"},
 	{"MM_UL8", NULL, "MultiMedia8 Mixer"},
-
-	{"MM_DL1",  NULL, "MultiMedia1 Playback" },
-	{"MM_DL2",  NULL, "MultiMedia2 Playback" },
-	{"MM_DL3",  NULL, "MultiMedia3 Playback" },
-	{"MM_DL4",  NULL, "MultiMedia4 Playback" },
-	{"MM_DL5",  NULL, "MultiMedia5 Playback" },
-	{"MM_DL6",  NULL, "MultiMedia6 Playback" },
-	{"MM_DL7",  NULL, "MultiMedia7 Playback" },
-	{"MM_DL8",  NULL, "MultiMedia8 Playback" },
-
-	{"MultiMedia1 Capture", NULL, "MM_UL1"},
-	{"MultiMedia2 Capture", NULL, "MM_UL2"},
-	{"MultiMedia3 Capture", NULL, "MM_UL3"},
-	{"MultiMedia4 Capture", NULL, "MM_UL4"},
-	{"MultiMedia5 Capture", NULL, "MM_UL5"},
-	{"MultiMedia6 Capture", NULL, "MM_UL6"},
-	{"MultiMedia7 Capture", NULL, "MM_UL7"},
-	{"MultiMedia8 Capture", NULL, "MM_UL8"},
-
 };
 
 static int routing_hw_params(struct snd_soc_component *component,
-- 
2.20.1

