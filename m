Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B013AF5D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:29:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541F7181F;
	Tue, 14 Jan 2020 17:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541F7181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579019399;
	bh=ubtFLXS3rebKm8IiFRV5jVVlrag3NnlOF60FmTwm/ek=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FUgmG9yP+YYr+ACs27QYQCAqyhqfjccMdCSCfOiWBquIX3Aik4xrGn5dJurrrAzyH
	 GDtO5TFTZWjpvZfQ/nfsLyoesCoZUuWjPLmgSusxhxbIO89axvq9EYLIe9ElNdme/k
	 9wR9+/Na6NcHsiYo3kzrRTZczzfXPJ+RJ+o3ivFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A77F8029A;
	Tue, 14 Jan 2020 17:10:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86937F8035E; Tue, 14 Jan 2020 17:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B413F8028E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B413F8028E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QD7qtdq0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5gVGuMNMcEAQXGHHkly9WTjxDNYkcV113uzeDZ2hJ6o=; b=QD7qtdq0R3tv
 KULMEpMEUfOFPYtHfLcO9nyXooNL3oaP2JUMsFniMOZ76RAw4U6RRqFvnBBr2dGbi2s6HKclC5d3O
 n6i7Ogx9Gp8GjBJ5EjtzFGf54U9sBxeA1Dkge4XtvqD46giYhjnewKRGxU1mlnXyN5SRRork640Wv
 OULu8=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkh-0001Wv-DB; Tue, 14 Jan 2020 16:09:11 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id B0296D02C7E; Tue, 14 Jan 2020 16:09:10 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200113223625.15995-1-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200113223625.15995-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:10 +0000 (GMT)
Cc: tiwai@suse.de, Jack Yu <jack.yu@realtek.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rt715: remove warnings" to the asoc tree
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

   ASoC: rt715: remove warnings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From fed4383c4586a895dc8cd62e3a71814f16ba0e2d Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 13 Jan 2020 16:36:25 -0600
Subject: [PATCH] ASoC: rt715: remove warnings

make W=1 reports defined-but-not-used and kernel-doc formatting issues.

No functionality change.

Fixes: d1ede0641b05e4 ("ASoC: rt715: add RT715 codec driver")
Cc: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200113223625.15995-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt715.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 5c6f05b8d8ab..4c746938a062 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -203,7 +203,6 @@ static int rt715_set_amp_gain_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
 
@@ -366,7 +365,7 @@ static const char * const adc_22_23_mux_text[] = {
 	"DMIC4",
 };
 
-/**
+/*
  * Due to mux design for nid 24 (MUX_IN3)/25 (MUX_IN4), connection index 0 and
  * 1 will be connected to the same dmic source, therefore we skip index 1 to
  * avoid misunderstanding on usage of dapm routing.
@@ -404,6 +403,7 @@ static SOC_ENUM_SINGLE_DECL(
 static SOC_VALUE_ENUM_SINGLE_DECL(rt715_adc24_enum,
 	RT715_MUX_IN3, 0, 0xf,
 	adc_24_mux_text, rt715_adc_24_25_values);
+
 static SOC_VALUE_ENUM_SINGLE_DECL(rt715_adc25_enum,
 	RT715_MUX_IN4, 0, 0xf,
 	adc_25_mux_text, rt715_adc_24_25_values);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
