Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD832E184
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 17:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D851607;
	Wed, 29 May 2019 17:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D851607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559144928;
	bh=DqvfaHkScdIQsVAfok3FlCZ4idIKRSAesvVL3gqhHKk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P1d+lrJ5QZy+dy+zoWtajB1tonCl3VmPyHAp1sBBN4oN7PWu4uMC+V0DYY9owITTN
	 rdlfiwAY/ynWCOWZ9S/JwpVWWkD0I3c2YF212cmUSivgRvmkX1nhidKyMOfoBfFxRa
	 E3C37HSroryL1yZkIr+CvhE7dzs8yEgzSLHvvy8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A43F8972F;
	Wed, 29 May 2019 17:45:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C80F89725; Wed, 29 May 2019 17:45:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 345A1F896E4
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 17:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 345A1F896E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Qg0MbLUM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=AGzOto7qa/uRKqkLQ40iD6LHzhbRPnB+Ym6gwGx0xHU=; b=Qg0MbLUMOHLp
 wBdRzs7eszD66gPlCdHVCq7LgxQcfisF+SpHyCxmy3osZO3L/vACk+h26FHCqIMynZ99qS9bbpUxH
 1dRO8t23yZz0kREcbxPI92e+oD++ZfujONLwxCHnZvi3lQCbAC/Xk2d48WGKxeaLTV41olNCC7TOY
 JoZ9c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hW0le-00051q-J3; Wed, 29 May 2019 15:45:30 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id F1F06440046; Wed, 29 May 2019 16:45:29 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Georgii Staroselskii <georgii.staroselskii@emlid.com>
In-Reply-To: <1559040459-16488-1-git-send-email-georgii.staroselskii@emlid.com>
X-Patchwork-Hint: ignore
Message-Id: <20190529154529.F1F06440046@finisterre.sirena.org.uk>
Date: Wed, 29 May 2019 16:45:29 +0100 (BST)
Cc: alsa-devel@alsa-project.org, maxime.ripard@bootlin.com,
 dannym@scratchpost.org, tiwai@suse.com, lgirdwood@gmail.com,
 georgii.staroselskii@emlid.com, wens@csie.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-codec: fix first delay on
	Speaker" to the asoc tree
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

   ASoC: sun4i-codec: fix first delay on Speaker

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 1f2675f6655838aaf910f911fd0abc821e3ff3df Mon Sep 17 00:00:00 2001
From: Georgii Staroselskii <georgii.staroselskii@emlid.com>
Date: Tue, 28 May 2019 13:47:39 +0300
Subject: [PATCH] ASoC: sun4i-codec: fix first delay on Speaker

Allwinner DAC seems to have a delay in the Speaker audio routing. When
playing a sound for the first time, the sound gets chopped. On a second
play the sound is played correctly. After some time (~5s) the issue gets
back.

This commit seems to be fixing the same issue as bf14da7 but
for another codepath.

This is the DTS that was used to debug the problem.

&codec {
        allwinner,pa-gpios = <&r_pio 0 11 GPIO_ACTIVE_HIGH>; /* PL11 */
        allwinner,audio-routing =
                "Speaker", "LINEOUT";

        status = "okay";
}

Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 15d08e343b47..28d2f7713f8d 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1329,6 +1329,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
 	gpiod_set_value_cansleep(scodec->gpio_pa,
 				 !!SND_SOC_DAPM_EVENT_ON(event));
 
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/*
+		 * Need a delay to wait for DAC to push the data. 700ms seems
+		 * to be the best compromise not to feel this delay while
+		 * playing a sound.
+		 */
+		msleep(700);
+	}
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
