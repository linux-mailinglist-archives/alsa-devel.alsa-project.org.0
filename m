Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155DA1C9B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6D511694;
	Thu, 29 Aug 2019 16:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6D511694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088624;
	bh=fQrxYhyRfaVtEwEURW+F/NqQIdVj/AKfDz6m0TMtr78=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qxHh02akRWDyPhnZaHyAmxXsMtyV20tcczZmMQurBTfEyd2DhMiDLUg3HFAosJ2ue
	 688quAbvQQYAypEDVzkS1JvwM4v6yESHyNe1Atd8CAkc256doYy01LD1vfJXl40O9f
	 TB9W0Wn7Ul+yoKB3undXOYJ+sVqndd5LkaqDQA8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F3ACF8065A;
	Tue, 27 Aug 2019 21:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 183F3F80659; Tue, 27 Aug 2019 21:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AE65F80639
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE65F80639
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pQe7vBvn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hiTM/h3UDo2RxTy+m7KYf5j/nlyv0htQ/21oZRo3Z9I=; b=pQe7vBvnHfpn
 AwQb6D5jZz9k4kbqYNKyadWJX8t6qmS3RSGXNo39M8X6jn4JezeuAVFtLrfR5YfClD0F4aOnzB6On
 lODnhyGv7RdQ/T/57AGHI9o8O9ytHL5TWhd2SCtCapI5NG8zhf+AvHlQ4vX/cw3oRwasmEGPT1F5k
 Uv2j8=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hb9-0001BV-86; Tue, 27 Aug 2019 19:57:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8D301D02CEC; Tue, 27 Aug 2019 20:57:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
In-Reply-To: <20190826153900.25969-2-katsuhiro@katsuster.net>
X-Patchwork-Hint: ignore
Message-Id: <20190827195744.8D301D02CEC@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:57:44 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>
Subject: [alsa-devel] Applied "ASoC: es8316: fix inverted L/R of headphone
	mixer volume" to the asoc tree
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

   ASoC: es8316: fix inverted L/R of headphone mixer volume

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

From f6e77921969003eaf5dbae9c0b5feeb20c6caf50 Mon Sep 17 00:00:00 2001
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Date: Tue, 27 Aug 2019 00:39:00 +0900
Subject: [PATCH] ASoC: es8316: fix inverted L/R of headphone mixer volume

This patch fixes inverted Left-Right channel of headphone mixer
volume by wrong shift_left, shift_right values.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Reviewed-by: Daniel Drake <drake@endlessm.com>
Link: https://lore.kernel.org/r/20190826153900.25969-2-katsuhiro@katsuster.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 96d04896193f..ed2959dbe1fb 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -92,7 +92,7 @@ static const struct snd_kcontrol_new es8316_snd_controls[] = {
 	SOC_DOUBLE_TLV("Headphone Playback Volume", ES8316_CPHP_ICAL_VOL,
 		       4, 0, 3, 1, hpout_vol_tlv),
 	SOC_DOUBLE_TLV("Headphone Mixer Volume", ES8316_HPMIX_VOL,
-		       0, 4, 11, 0, hpmixer_gain_tlv),
+		       4, 0, 11, 0, hpmixer_gain_tlv),
 
 	SOC_ENUM("Playback Polarity", dacpol),
 	SOC_DOUBLE_R_TLV("DAC Playback Volume", ES8316_DAC_VOLL,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
