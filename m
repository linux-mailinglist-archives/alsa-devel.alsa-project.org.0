Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC25CEB99
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 20:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B9C84B;
	Mon,  7 Oct 2019 20:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B9C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570472164;
	bh=oBvbBPlh+9APe3fbNnmx/AO8ytN0cu0lUWS3GWwCyt4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CO2SF+jEsPvaYY51gE1PMem1eDV+62TjNm0mt7ZKs2CZjgIFYk9Bvmx+xAjCrUJSQ
	 dmcKMIf8rWjOeFxCAD2mfWe1jV0eRgPwdmV64DnNHyhRfouPmSUOjIT2DODBcPFkOR
	 jFhQziaUmkFAHPQ5cH9gl3lxGORTLEPeso2QYL64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D33A2F80534;
	Mon,  7 Oct 2019 20:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4FBFF802DF; Mon,  7 Oct 2019 20:13:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F11F802BD
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 20:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F11F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xAoCDiDe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=F/519QCZ2cPEiTPBsN/gfjftRPvGaCJLTY4nnrMZONU=; b=xAoCDiDeBOBg
 +yP/gYICl4E0AJFQbECVzr+VI3P783zvguMUugFprIVgZnMp+zQ0wgxOjCeRrJHL5xZLyFJvXmce4
 ovZUxARgZunEn1df47fHhCNwKGpozH+DyUQT69MvI7xYyg4U02b0hNHmJYgnVUNS3ygEGJwJhhOQ1
 69Lxc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHXVe-0004GF-8B; Mon, 07 Oct 2019 18:13:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B7D8E2741EF0; Mon,  7 Oct 2019 19:13:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20191007171157.17813-2-dmurphy@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20191007181325.B7D8E2741EF0@ypsilon.sirena.org.uk>
Date: Mon,  7 Oct 2019 19:13:25 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, navada@ti.com, Mark Brown <broonie@kernel.org>,
 shifu0704@thundersoft.com
Subject: [alsa-devel] Applied "ASoC: tas2770: Remove unneeded read of the
	TDM_CFG3 register" to the asoc tree
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

   ASoC: tas2770: Remove unneeded read of the TDM_CFG3 register

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

From 5911e6729e0886a3fb00b897b73892134d37158a Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Mon, 7 Oct 2019 12:11:56 -0500
Subject: [PATCH] ASoC: tas2770: Remove unneeded read of the TDM_CFG3 register

Remove the unneeded and incorrect read of the TDM_CFG3 register.
The read is done but the value is never used.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20191007171157.17813-2-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2770.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 15f6fcc6d87e..f3a665b64fd6 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -374,7 +374,6 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
 	int ret;
-	int value = 0;
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
@@ -430,8 +429,6 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret)
 		return ret;
 
-	value = snd_soc_component_read32(component, TAS2770_TDM_CFG_REG3);
-
 	tas2770->asi_format = fmt;
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
