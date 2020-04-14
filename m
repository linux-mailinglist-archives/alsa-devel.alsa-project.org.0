Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056871A8059
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E5EC1696;
	Tue, 14 Apr 2020 16:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E5EC1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586875795;
	bh=NF+ReJtRcTYkXwWbn0gQZMoewENSGMQLJ68bqwW6Mmo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p9LgnDha+r1+iIMZH1/736rAfp67Z3znjw+2f6KQm0N8gzrnNep9OoTpgSsQKecVT
	 vBhYotdBB5XMZ8ispMUaagzTAKWfaeUAcE4244zuEdevpFBi2Ki23TPA1M5qYTddhS
	 QlNlXjbz26+v4L8eiX6JtYJeOEtnxhY94Btw6P2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 701EAF80126;
	Tue, 14 Apr 2020 16:46:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2E3AF802A2; Tue, 14 Apr 2020 16:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE0EEF802A0
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE0EEF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C/BTHfQD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E397120787;
 Tue, 14 Apr 2020 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875574;
 bh=NF+ReJtRcTYkXwWbn0gQZMoewENSGMQLJ68bqwW6Mmo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=C/BTHfQDUOzrAqshiXGCZxUd05u6HaBj3kdNTyGK93zm96V/C6YRj9GuyfLwpYHcv
 dDP9o79bwt+lLfi4bXk2Efv0bJ/OFYlMVVYA2XN5bZhQt7C0DK+iNSpnUcBnfCIxAT
 OuSaau+3AnAquDPsh12gpkVSza7hSxUQm9smVQ3Q=
Date: Tue, 14 Apr 2020 15:46:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Subject: Applied "soc/stm/stm32_sub_sai: Add missing '\n' in log messages" to
 the asoc tree
In-Reply-To: <20200413042952.7675-1-sebastian.fricke.linux@gmail.com>
Message-Id: <applied-20200413042952.7675-1-sebastian.fricke.linux@gmail.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, olivier.moysan@st.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, sebastian.fricke.linux@gmail.com,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   soc/stm/stm32_sub_sai: Add missing '\n' in log messages

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

From 9de300abb71f24b190362ff53907ab90505517bc Mon Sep 17 00:00:00 2001
From: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Date: Mon, 13 Apr 2020 06:29:52 +0200
Subject: [PATCH] soc/stm/stm32_sub_sai: Add missing '\n' in log messages

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 3e086ed("ASoC: stm32: add SAI drivers")

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Link: https://lore.kernel.org/r/20200413042952.7675-1-sebastian.fricke.linux@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 0d0c9afd8791..34a7c3d6fb91 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -837,7 +837,7 @@ static int stm32_sai_set_config(struct snd_soc_dai *cpu_dai,
 		cr1 = SAI_XCR1_DS_SET(SAI_DATASIZE_32);
 		break;
 	default:
-		dev_err(cpu_dai->dev, "Data format not supported");
+		dev_err(cpu_dai->dev, "Data format not supported\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1

