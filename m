Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E352F4A83
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 13:09:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 127501677;
	Fri,  8 Nov 2019 13:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 127501677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573214987;
	bh=QD8UUKjZRuGLC1atiW1BlFi7VwogzIJOyqwDbdQg1ZQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hYxSWXq6FzcHnhMaaRnw85clLlzcm3l8Dp3uWl0eLdKR5eKseBHkQxSxlmLyprDVq
	 JZ/IruKJ7Q/NXv1q2fH5lZqNitsWdLg19sElzbuF1GFpO1WPK3IRHZVu+dUH4JElGD
	 mkzu+s/WnzZv26XlOQY+3DprjupFD1zxCjEPqxWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6911AF8045F;
	Fri,  8 Nov 2019 13:08:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09918F803D0; Fri,  8 Nov 2019 13:08:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827EEF80111
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 13:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827EEF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FH3Cczza"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=fGrbvvV39ibxa3jmK9NOHnc2dKnH3m2isspiA81e3kc=; b=FH3CczzaUUqc
 nHr5+xJTCtLh2j5XCIdjgjyTMKjbWa9MSp+wpP0e4g3YnykqpbtPCFbjQR74yyH8PYhEoCueq3B3O
 mB7+Dm1P3WMWk+C2klTqYGJcMqUDmA9emyrSHxixSx8KPDD7N3RiGVJB0FAzsdh7gVJqH+iZeWe7O
 ynAKw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iT33T-0007DK-Ti; Fri, 08 Nov 2019 12:07:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5B3712740C6C; Fri,  8 Nov 2019 12:07:55 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191107134833.1502-1-tiwai@suse.de>
X-Patchwork-Hint: ignore
Message-Id: <20191108120755.5B3712740C6C@ypsilon.sirena.org.uk>
Date: Fri,  8 Nov 2019 12:07:55 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: core: Fix compile warning with
	CONFIG_DEBUG_FS=n" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============1583677950495635520=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============1583677950495635520==
Content-Type: text/plain

The patch

   ASoC: core: Fix compile warning with CONFIG_DEBUG_FS=n

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

From bd0b609e0c3362cb167c51d4bd4330d79fc00987 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 7 Nov 2019 14:48:33 +0100
Subject: [PATCH] ASoC: core: Fix compile warning with CONFIG_DEBUG_FS=n
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Paper over a compile warning:
  sound/soc/soc-pcm.c:1185:8: warning: unused variable ‘name’

Fixes: 0632fa042541 ("ASoC: core: Fix pcm code debugfs error")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191107134833.1502-1-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 493a2e80e893..4bf71e3211d8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1182,7 +1182,9 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 {
 	struct snd_soc_dpcm *dpcm;
 	unsigned long flags;
+#ifdef CONFIG_DEBUG_FS
 	char *name;
+#endif
 
 	/* only add new dpcms */
 	for_each_dpcm_be(fe, stream, dpcm) {
-- 
2.20.1


--===============1583677950495635520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1583677950495635520==--
