Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019411194
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F071756;
	Thu,  2 May 2019 04:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F071756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764686;
	bh=PZFH151NO5HwtQZr70Wxp+OD9XGFK48kRSDNdvdMZUk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=J8jYAeZ5gBa5sp6G84KimZEeJqIrSJtlfL+yGhC3TdLQPONiWnH0Oji9X+CR2PnOX
	 jUbDYLZu0A/ICEn1ylFNYHd7ykhCQ2bPAYlx5LJ8xIWatdRJmSUZg+DxpFu6up3JTT
	 m+CnRXUzClIMX3Xc1LMbsCKsBy6/91yw49KwxiQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42675F896E3;
	Thu,  2 May 2019 04:19:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F179DF89761; Thu,  2 May 2019 04:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 853F0F89727
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 853F0F89727
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wzpP8lwG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=A/66kRQc3q5wn42sm0oWbgVdM3908r6Wc5+tQsSwk04=; b=wzpP8lwG07E8
 oRG4coHg7JvWMB+Le8NmNZA3H5Qbnncvd4Fw2mTL/wpYX2MaBN0uwHhehuf6Ql3SNqS2cKdWIQTxv
 44WNqLvG1+7SO/0XamXw7x24vUCuKwSV+/1O1XP678p0c3Xsb74t44/z3rz+VkRiZLolZALp3WkXq
 /UUqw=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1J9-0005tY-Ta; Thu, 02 May 2019 02:18:48 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 06AC6441D3C; Thu,  2 May 2019 03:18:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190417113140.15572-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021845.06AC6441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:44 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Enable TDM support for
	DSP_A/B modes" to the asoc tree
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

   ASoC: pcm3168a: Enable TDM support for DSP_A/B modes

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

From 5011454ee34a84700e9a8c7eb1138efceea9d662 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 17 Apr 2019 14:31:40 +0300
Subject: [PATCH] ASoC: pcm3168a: Enable TDM support for DSP_A/B modes

The 24-bit TDM mode also applies to DSP_A and DSP_B modes.
Most dais on the SoC side can not interpret I2S/Left_j with other than 2
channels of audio.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 08d3fe192e65..e0d5839fe1a7 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -457,13 +457,16 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	if (chan > 2) {
 		switch (fmt) {
 		case PCM3168A_FMT_I2S:
+		case PCM3168A_FMT_DSP_A:
 			fmt = PCM3168A_FMT_I2S_TDM;
 			break;
 		case PCM3168A_FMT_LEFT_J:
+		case PCM3168A_FMT_DSP_B:
 			fmt = PCM3168A_FMT_LEFT_J_TDM;
 			break;
 		default:
-			dev_err(component->dev, "TDM is supported under I2S/Left_J only\n");
+			dev_err(component->dev,
+				"TDM is supported under DSP/I2S/Left_J only\n");
 			return -EINVAL;
 		}
 	}
@@ -526,6 +529,8 @@ static int pcm3168a_startup(struct snd_pcm_substream *substream,
 		break;
 	case PCM3168A_FMT_LEFT_J:
 	case PCM3168A_FMT_I2S:
+	case PCM3168A_FMT_DSP_A:
+	case PCM3168A_FMT_DSP_B:
 		sample_min  = 24;
 		channel_max = channel_maxs[tx];
 		break;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
