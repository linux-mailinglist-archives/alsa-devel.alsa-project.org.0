Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4A13AF36
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:23:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53EDC183A;
	Tue, 14 Jan 2020 17:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53EDC183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579019035;
	bh=P9ENK/SYKu4qSbp19cL2jIn9TzzWk7VSPGfyYZpe8VY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dFVuKxe626M0zlhtgAK0vUMCNeDEX+Lpp0V9SHz3XByHMNAt/Io7PttycQ6Bls9lr
	 /7rXVE6uAo9s24T4U/8DbHce68nGwfPyum5CMUUJLK4GXIJ1HxOcFl7+acvMz2fygO
	 qvbGBjGPQ3DUSmHrXKV3xIlBy5xJiJeV4hjfmRZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE5AF80369;
	Tue, 14 Jan 2020 17:10:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5F2F80341; Tue, 14 Jan 2020 17:10:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E04CF8027D
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E04CF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="i8SVQyNx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=WQYsExMbpG32ORqYx47B+dRaiKxRry0ge8ElOreGcKw=; b=i8SVQyNxeDmT
 A5tbLBPJ5X0OhaZDPPHAkPDFFF7KL4HedyI9E+JP84VGRDX8bnbsXW+qEK4XMDH9NRquHOwX/SjMY
 d0O3KrVXLMcLMAjN45M8LKhTfp1nSEh67QELztxYjeuNatRoLc4VWHr0I5ZcJCkcHkMyIDR2deH0K
 mzyVA=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkf-0001WM-VE; Tue, 14 Jan 2020 16:09:09 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A249BD02C7B; Tue, 14 Jan 2020 16:09:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200113210428.27457-7-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200113210428.27457-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:09 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: kbl_da7219_max98927: test return
	value on route add" to the asoc tree
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

   ASoC: Intel: kbl_da7219_max98927: test return value on route add

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

From 2b66c70fbe64c8fd47abd62e601f2405c7810f04 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 13 Jan 2020 15:04:16 -0600
Subject: [PATCH] ASoC: Intel: kbl_da7219_max98927: test return value on route
 add

Fix cppcheck warning:

[sound/soc/intel/boards/kbl_da7219_max98927.c:340] ->
[sound/soc/intel/boards/kbl_da7219_max98927.c:348]: (style) Variable
'ret' is reassigned a value before the old one has been used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200113210428.27457-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/kbl_da7219_max98927.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 34e734adac19..e8b2ec60fb03 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -341,6 +341,9 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 			kabylake_ssp1_map,
 			ARRAY_SIZE(kabylake_ssp1_map));
 
+	if (ret)
+		return ret;
+
 	/*
 	 * Headset buttons map to the google Reference headset.
 	 * These can be configured by userspace.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
