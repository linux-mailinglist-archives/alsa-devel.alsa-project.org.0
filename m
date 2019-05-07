Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226F157C5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 04:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B20621937;
	Tue,  7 May 2019 04:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B20621937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557196896;
	bh=ASVspFzTBO+WG68xQKy8bz79VjF8OoJjkH62hqpZwf8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mqatU6GrOF8EqoK9cN1tvPN+69H2YAxkWavL9pt3LaywevEI0cnFWuuV1S5PIWgZQ
	 M6HsiSjDNKB0S4DOcovBEfRIjDp4DSJ3GjDJoIqJC1iASxivjigcfvyX03BztwJ/tc
	 PNkxhUpKfqMQEF/0fg/xYH/ujb8CSjPKrF+m+is0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB6CF8976F;
	Tue,  7 May 2019 04:30:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02361F89763; Tue,  7 May 2019 04:30:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F10DF89760
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 04:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F10DF89760
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nFqe/sxl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=N/eXMLTVfkLVsDEzKWn1gZcKuzRcNBEC/eZA1T2nGEM=; b=nFqe/sxl9d4c
 rml38BNiiwttCVw5aYnML0XUOtp7Zd6srvVWxrs4FiYsB3fZLMcsgP+dGXsIEUJl6evBi+ySEfzq/
 vHUupVC7dqhLqQbqV/a6veYiFu8QZohR/LnWTzrPGcCwIAIvrxLH4tlvSZ8VGkEMTKbZ5/W5ya7Zl
 NCI5Q=;
Received: from kd111239185057.au-net.ne.jp ([111.239.185.57]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNpsN-0003Sw-6j; Tue, 07 May 2019 02:30:39 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 4CC2644000C; Tue,  7 May 2019 03:30:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Dylan Reid <dgreid@chromium.org>
In-Reply-To: <20190506203006.161158-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190507023030.4CC2644000C@finisterre.sirena.org.uk>
Date: Tue,  7 May 2019 03:30:30 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Ross Zwisler <zwisler@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Hsinyu Chao <hychao@chromium.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] Applied "ASoC: rt5677: use more of the volume range
	from DACs" to the asoc tree
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

   ASoC: rt5677: use more of the volume range from DACs

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

From 753c36a4d8a85beeb97640d1f91f2ead6aaee85e Mon Sep 17 00:00:00 2001
From: Dylan Reid <dgreid@chromium.org>
Date: Mon, 6 May 2019 13:30:06 -0700
Subject: [PATCH] ASoC: rt5677: use more of the volume range from DACs

The DACs volume can go over 0, both according to the data sheet and
real world testing.  The control can go up to +30dB.

This was tested by playing audio at full volume on a samus chromebook.

Signed-off-by: Dylan Reid <dgreid@chromium.org>
Reviewed-by: Hsinyu Chao <hychao@chromium.org>
Signed-off-by: Ross Zwisler <zwisler@google.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 6fc70e441458..907c957b614d 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -832,13 +832,13 @@ static const struct snd_kcontrol_new rt5677_snd_controls[] = {
 
 	/* DAC Digital Volume */
 	SOC_DOUBLE_TLV("DAC1 Playback Volume", RT5677_DAC1_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 	SOC_DOUBLE_TLV("DAC2 Playback Volume", RT5677_DAC2_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 	SOC_DOUBLE_TLV("DAC3 Playback Volume", RT5677_DAC3_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 	SOC_DOUBLE_TLV("DAC4 Playback Volume", RT5677_DAC4_DIG_VOL,
-		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 87, 0, dac_vol_tlv),
+		RT5677_L_VOL_SFT, RT5677_R_VOL_SFT, 127, 0, dac_vol_tlv),
 
 	/* IN1/IN2 Control */
 	SOC_SINGLE_TLV("IN1 Boost", RT5677_IN1, RT5677_BST_SFT1, 8, 0, bst_tlv),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
