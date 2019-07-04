Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E65F814
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 14:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F85C16B2;
	Thu,  4 Jul 2019 14:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F85C16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562243246;
	bh=jDZvxQIvNhomZ+3Zx5KC76h+RS3UcjY2F5PTMGq7I9o=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Av2RL52Yln+7ZPhyB20LRvZ4/n62SeAi6lUW6728ph4TD4/11e/yxhovneU0urLRd
	 PKDd4O0OzCwp7P2BTF06Ohlpz6egwmDGTstQbLYXCzFyRLjn+v6bwLqavRtcZ0OPNO
	 av+7fhuclJAhhYgKTuIwBn/L1zwTds7WsXchLsXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6554F8011C;
	Thu,  4 Jul 2019 14:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A021DF80112; Thu,  4 Jul 2019 14:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E52BEF800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 14:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52BEF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BJYMA/v/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KMfeFIhLKxaKbo1xV3oxqmPF50iPn64mDJzRgTApaFI=; b=BJYMA/v/dAmM
 CIc/W4MDAktUpsXHf1rONzEFLlfBJeOk51osZKt7YpBHQgi8I4ZL9sqG4MWarWslUDhlY5k1HRCoh
 LSntn7p3BdeZj1U5fjMrykSfm2WGKmHC3tHSw5ZFULVUAx9wzph+2YKLiV7tXpSZgpOQuqBQ9/h15
 bZKtI=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hj0nG-0000ia-L4; Thu, 04 Jul 2019 12:24:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E9C8B2743897; Thu,  4 Jul 2019 13:24:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20190703123102.12626-1-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20190704122453.E9C8B2743897@ypsilon.sirena.org.uk>
Date: Thu,  4 Jul 2019 13:24:53 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: qdsp6: q6afe-dai: Add missing Slimbus0
	audio route" to the asoc tree
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

   ASoC: qdsp6: q6afe-dai: Add missing Slimbus0 audio route

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

From 9aa0cf79568e7078c32710034b0df8946db6cdad Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 3 Jul 2019 13:31:02 +0100
Subject: [PATCH] ASoC: qdsp6: q6afe-dai: Add missing Slimbus0 audio route

For some reason SLIMBus RX0 playback is not added to audio routes.
This patch adds the missing route.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20190703123102.12626-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index dc645ba4d8d0..c1a7624eaf17 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -447,6 +447,7 @@ static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
 static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"HDMI Playback", NULL, "HDMI_RX"},
 	{"Display Port Playback", NULL, "DISPLAY_PORT_RX"},
+	{"Slimbus Playback", NULL, "SLIMBUS_0_RX"},
 	{"Slimbus1 Playback", NULL, "SLIMBUS_1_RX"},
 	{"Slimbus2 Playback", NULL, "SLIMBUS_2_RX"},
 	{"Slimbus3 Playback", NULL, "SLIMBUS_3_RX"},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
