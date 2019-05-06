Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827614F20
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:08:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FFF18F9;
	Mon,  6 May 2019 17:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FFF18F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557155322;
	bh=9fnI+YQWwsCKKPIHmpnObghAvivQ167JSH+MpCndj+8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=epWKTHctH2VuDoCfie5f7P5po4FxVjcRj+9i6UkmbB/YgmzJXHnuK3jqyXN5uIGBt
	 7VScYIYLqtPxzQk5vglMwpovBYQEHDOLmo0Gysh90GbnDgNhsc0IXcH1jZfg3pHm9y
	 qb5eWRhC+7eP/2kik4//J9xCI+0wJRFjn4ZkJ1x8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DC7AF89740;
	Mon,  6 May 2019 17:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29504F89733; Mon,  6 May 2019 17:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B0CFF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B0CFF80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NoYAzT45"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eQqQpulK7oQXoujzji5SLgl6P22pxVQXz4sPEzVqvSw=; b=NoYAzT453inX
 7iDiCGQOfIC5yI/lfeRPv/ZtcVczJkdnth7CVCzomqXyqT+IGaeieIqlocdZQZ8evKAXI/u8jvr2o
 PSgFl+jEkLbq72adnoYQV21VDTE4dy1sqxBiLhNSGH/FxPwHgFhgS3qGmqQJSpahIzRJuOH55aymN
 x5ouY=;
Received: from kd111239184067.au-net.ne.jp ([111.239.184.67]
 helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNf9i-0001ua-B7; Mon, 06 May 2019 15:03:50 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 663AD440036; Mon,  6 May 2019 16:03:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <1556720978-13233-1-git-send-email-jonathanh@nvidia.com>
X-Patchwork-Hint: ignore
Message-Id: <20190506150345.663AD440036@finisterre.ee.mobilebroadband>
Date: Mon,  6 May 2019 16:03:45 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: max98090: Fix restore of DAPM Muxes" to
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

   ASoC: max98090: Fix restore of DAPM Muxes

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

From ecb2795c08bc825ebd604997e5be440b060c5b18 Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Wed, 1 May 2019 15:29:38 +0100
Subject: [PATCH] ASoC: max98090: Fix restore of DAPM Muxes

The max98090 driver defines 3 DAPM muxes; one for the right line output
(LINMOD Mux), one for the left headphone mixer source (MIXHPLSEL Mux)
and one for the right headphone mixer source (MIXHPRSEL Mux). The same
bit is used for the mux as well as the DAPM enable, and although the mux
can be correctly configured, after playback has completed, the mux will
be reset during the disable phase. This is preventing the state of these
muxes from being saved and restored correctly on system reboot. Fix this
by marking these muxes as SND_SOC_NOPM.

Note this has been verified this on the Tegra124 Nyan Big which features
the MAX98090 codec.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/codecs/max98090.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 30c242c38d99..7619ea31ab50 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1194,14 +1194,14 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 		&max98090_right_rcv_mixer_controls[0],
 		ARRAY_SIZE(max98090_right_rcv_mixer_controls)),
 
-	SND_SOC_DAPM_MUX("LINMOD Mux", M98090_REG_LOUTR_MIXER,
-		M98090_LINMOD_SHIFT, 0, &max98090_linmod_mux),
+	SND_SOC_DAPM_MUX("LINMOD Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_linmod_mux),
 
-	SND_SOC_DAPM_MUX("MIXHPLSEL Mux", M98090_REG_HP_CONTROL,
-		M98090_MIXHPLSEL_SHIFT, 0, &max98090_mixhplsel_mux),
+	SND_SOC_DAPM_MUX("MIXHPLSEL Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_mixhplsel_mux),
 
-	SND_SOC_DAPM_MUX("MIXHPRSEL Mux", M98090_REG_HP_CONTROL,
-		M98090_MIXHPRSEL_SHIFT, 0, &max98090_mixhprsel_mux),
+	SND_SOC_DAPM_MUX("MIXHPRSEL Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_mixhprsel_mux),
 
 	SND_SOC_DAPM_PGA("HP Left Out", M98090_REG_OUTPUT_ENABLE,
 		M98090_HPLEN_SHIFT, 0, NULL, 0),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
