Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C007C12A53E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 01:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4767816D8;
	Wed, 25 Dec 2019 01:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4767816D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577233132;
	bh=KfaGFNkgHsewvE/OHArSqcAPSyWXeT+VmZbS+DAb0o0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Y1oTjaVCglfypzhHiy4IVyD382P2QeVduWrsxWmcS5GmX5MdiIla5mF90FKVMKKia
	 USwZBr/2rCWBWKqLq5Te9q1+KCtdNUh8362s6bX9kmVX1c0sysKBz1+Ssm+6ucA3Kk
	 f6R7kTqLkByMmH8+1XbjHWcB5v7QIhHf00bkfGhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73F1EF80307;
	Wed, 25 Dec 2019 01:09:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 904CFF8028D; Wed, 25 Dec 2019 01:09:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3A8F80271
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 01:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3A8F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="abMiMZye"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eAfqy3PDIk+Y7z80iXzd+LpbybnMbajFGSwywhRYyCg=; b=abMiMZyeKxLJ
 bEkcOzrS+xxYik5c+2zinXEZhjMDM2/LZVSiT506D2p2jxavyVxc/44gcl7wTrylAB2bzsgIGkp1T
 QXFKm0uY+Nmrzehe+j5KF6K265jm3v1lLGyBjd7Vs3KOTsmcO1m8JfoYDhJSJnRroJBDXH0H74sRU
 XwJXg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ijuEh-0007MQ-SV; Wed, 25 Dec 2019 00:09:11 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6416FD01957; Wed, 25 Dec 2019 00:09:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191204151333.26625-1-daniel.baluta@nxp.com>
Message-Id: <applied-20191204151333.26625-1-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 00:09:11 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: soc-core: Set dpcm_playback /
	dpcm_capture" to the asoc tree
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

   ASoC: soc-core: Set dpcm_playback / dpcm_capture

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

From 218fe9b7ec7f32c10a07539365488d80af7b0084 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 4 Dec 2019 17:13:33 +0200
Subject: [PATCH] ASoC: soc-core: Set dpcm_playback / dpcm_capture

When converting a normal link to a DPCM link we need
to set dpcm_playback / dpcm_capture otherwise playback/capture
streams will not be created resulting in errors like this:

[   36.039111]  sai1-wm8960-hifi: ASoC: no backend playback stream

Fixes: a655de808cbde ("ASoC: core: Allow topology to override machine driver FE DAI link config")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20191204151333.26625-1-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1c84ff1a5bf9..6050c4c62fe8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1871,6 +1871,8 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 
 			/* convert non BE into BE */
 			dai_link->no_pcm = 1;
+			dai_link->dpcm_playback = 1;
+			dai_link->dpcm_capture = 1;
 
 			/* override any BE fixups */
 			dai_link->be_hw_params_fixup =
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
