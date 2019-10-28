Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6610CE74B9
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:15:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F751741;
	Mon, 28 Oct 2019 16:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F751741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275749;
	bh=IK39/2sAzTwmas8FTdy7AyJaihgh2bY9IQ0oLMjzg0o=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FZvzop/VVVtRTylQyosWQ2gCm4TZiHD2KTcU6MlVEgMqqm2Fs4iJhJrPCAUU8KA/p
	 9OlJl151zuJuDsQVaQjYYF6b+NZ9RrNRsia0h6pnjXsRbLay4uWFDh45YKCFInFX/F
	 7/c5URqEYzjh1EKG/Y3PJlfPoqTI7vbA3jBQ9nzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81AF8F80BF3;
	Mon, 28 Oct 2019 15:57:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9134DF80715; Mon, 28 Oct 2019 15:57:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E514FF80361
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E514FF80361
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cK5vMjbV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=aacqV5nj/gG01sskTrzwE2VcR2Ffj1PwXKPwaCUoKC4=; b=cK5vMjbVyFJ2
 PQ0lTJrK00lRYGa9l2T71D0ELFEg367gD6DCLfhJpFoG9Nv378r2InvxQnftVxnaAEkkSJv4SICgx
 e2AbvyvQV8W1Vl6tUsJc0fev2ElW1EGmijfYpSaCQl12wjXg9FjAeps6cwf/6iim8yRcNKk6RfUJO
 erUeM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rj-0008Rl-5g; Mon, 28 Oct 2019 14:56:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BC4A127403E4; Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
In-Reply-To: <20191028095229.99438-1-cychiang@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20191028145637.BC4A127403E4@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 dianders@chromium.org, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, enric.balletbo@collabora.com,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: rockchip: rockchip_max98090: Enable
	SHDN to fix headset detection" to the asoc tree
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

   ASoC: rockchip: rockchip_max98090: Enable SHDN to fix headset detection

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 07c1b73e2a027ea9a52677beeb6a943a3e357139 Mon Sep 17 00:00:00 2001
From: Cheng-Yi Chiang <cychiang@chromium.org>
Date: Mon, 28 Oct 2019 17:52:29 +0800
Subject: [PATCH] ASoC: rockchip: rockchip_max98090: Enable SHDN to fix headset
 detection

max98090 spec states that chip needs to be in turned-on state to supply
mic bias. Enable SHDN dapm widget along with MICBIAS widget to
actually turn on mic bias for proper headset button detection.
This is similar to cht_ti_jack_event in
sound/soc/intel/boards/cht_bsw_max98090_ti.c.

Note that due to ts3a227e reports the jack event right away before the
notifier is registered, if headset is plugged on boot, headset button
will not get detected until headset is unplugged and plugged. This is
still an issue to be fixed.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
Link: https://lore.kernel.org/r/20191028095229.99438-1-cychiang@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 0097df1fae66..e80b09143b63 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -66,10 +66,13 @@ static int rk_jack_event(struct notifier_block *nb, unsigned long event,
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
 	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
 
-	if (event & SND_JACK_MICROPHONE)
+	if (event & SND_JACK_MICROPHONE) {
 		snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
-	else
+		snd_soc_dapm_force_enable_pin(dapm, "SHDN");
+	} else {
 		snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+		snd_soc_dapm_disable_pin(dapm, "SHDN");
+	}
 
 	snd_soc_dapm_sync(dapm);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
