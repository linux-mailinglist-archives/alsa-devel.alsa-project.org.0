Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB338146
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E02D1736;
	Fri,  7 Jun 2019 00:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E02D1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559861522;
	bh=rJsfip41dOmtsJvVt7pm/eXdJf/JWWbfHG4xrSiqM1c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h8ON69lNDiTlSBUG4zrBQLeew0tgeOmi6USvRSWjGKffxbONHzNSVHXqWMXVMDgo8
	 N3gGdOVNO4GT8wMch9IrZP7H6/AzQnTKD+FRF7E2935fetSBg7lyHR9bKzbBNACJ0X
	 gRu9lRFyZ7FKXaCYDLoZAJ+Xc0TsSAkWweXEFZgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93CEEF89A05;
	Thu,  6 Jun 2019 23:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 871F2F897F7; Thu,  6 Jun 2019 23:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9443F897F9
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9443F897F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dK8VVWup"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=l4+G4D2D8ugWcBkfkFGLSwNCx8wkdSyfVomne89cOB4=; b=dK8VVWupKWVd
 PJt0WiGPd6UTRhxAMB9bCK8u0W0w6jgWS1wCN/ifZvVpCaSx2hTBf7QkjX+shk5Agi1ynPg1436Ph
 qqyN3OnkEQZgqgpca5NIEEBKdBF/kDXVDDK4UpgQ4dbESKXLqifh1v0Z4yCJoYVOm4R289mU2Nk7W
 j3tFI=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuf-0007Ta-Nw; Thu, 06 Jun 2019 21:27:09 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 34F25440049; Thu,  6 Jun 2019 22:27:09 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgsnl66z.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212709.34F25440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:09 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: smdk_spdif: use modern
	dai_link style" to the asoc tree
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

   ASoC: samsung: smdk_spdif: use modern dai_link style

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

From e076cc1d9b0567962d48f67fcf5431237ce0ba10 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:09:19 +0900
Subject: [PATCH] ASoC: samsung: smdk_spdif: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/smdk_spdif.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 87a70d872c00..4baef84d29ee 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -142,14 +142,16 @@ static const struct snd_soc_ops smdk_spdif_ops = {
 	.hw_params = smdk_hw_params,
 };
 
+SND_SOC_DAILINK_DEFS(spdif,
+	DAILINK_COMP_ARRAY(COMP_CPU("samsung-spdif")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("spdif-dit", "dit-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-spdif")));
+
 static struct snd_soc_dai_link smdk_dai = {
 	.name = "S/PDIF",
 	.stream_name = "S/PDIF PCM Playback",
-	.platform_name = "samsung-spdif",
-	.cpu_dai_name = "samsung-spdif",
-	.codec_dai_name = "dit-hifi",
-	.codec_name = "spdif-dit",
 	.ops = &smdk_spdif_ops,
+	SND_SOC_DAILINK_REG(spdif),
 };
 
 static struct snd_soc_card smdk = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
