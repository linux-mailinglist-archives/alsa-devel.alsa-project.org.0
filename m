Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D12AFF73
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 17:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA3A169C;
	Wed, 11 Sep 2019 17:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA3A169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568214140;
	bh=BTjnQLcs0/ew6GCE3s9S1KHnofGXBXVaJUAonYcQQ5c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=a1BeDDY6fY+nN9oQjkDwZHJd5T8to2lWqxcLB5NsZaB++Uq0UgHocL1sUZVEGo8pC
	 iVMRN17FcKaZ2+U85tQgZlemDoi84Q85nPQN35h4JPfYI5GuPM7K5c3Ntlnx+Qv6fO
	 CHejilVs0sBB3QlvS4RUCOJLEplK3P++Dqh9Ep48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42762F805F6;
	Wed, 11 Sep 2019 16:59:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E27F802DF; Wed, 11 Sep 2019 16:59:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2538EF802DF
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 16:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2538EF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="D2vlodHI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vbe0m2/MasBV8u9VVwbgSwYfXAa+MgiNsIDujwaSc58=; b=D2vlodHIz3VP
 RihxhA2p8zMkBlSfD+lM5akJFfRw/zsgnR+CQ+GAG8Xhy5oIdk8aDtJumc7xWMcOn8hMEcFFsw1eH
 TeLYuL3pN6SPhWryXzmGRtqG3vJg/Tti9lE7gRJdVrNeZt0iepJUs7UI8GACPw03XxNv4mL5H8Lm6
 AE8Ec=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i845u-0001iz-HZ; Wed, 11 Sep 2019 14:59:42 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id C53D5D00464; Wed, 11 Sep 2019 15:59:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190911083331.16801-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190911145941.C53D5D00464@fitzroy.sirena.org.uk>
Date: Wed, 11 Sep 2019 15:59:41 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, lgirdwood@gmail.com,
 arthur.she@linaro.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: dmaengine: Replace strncpy() with
	strscpy_pad() for pcm->name" to the asoc tree
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

   ASoC: dmaengine: Replace strncpy() with strscpy_pad() for pcm->name

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

From 48118a9323ab715358bf63f5172c5c2b8cf5f455 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 11 Sep 2019 11:33:31 +0300
Subject: [PATCH] ASoC: dmaengine: Replace strncpy() with strscpy_pad() for
 pcm->name

While it is safe to use strncpy in this case, the advice is to move to
strscpy or strscpy_pad.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190911083331.16801-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index d93db2c2b527..5552c66ca642 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -308,9 +308,9 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 			pcm->flags |= SND_DMAENGINE_PCM_FLAG_NO_RESIDUE;
 
 		if (rtd->pcm->streams[i].pcm->name[0] == '\0') {
-			strncpy(rtd->pcm->streams[i].pcm->name,
-				rtd->pcm->streams[i].pcm->id,
-				sizeof(rtd->pcm->streams[i].pcm->name));
+			strscpy_pad(rtd->pcm->streams[i].pcm->name,
+				    rtd->pcm->streams[i].pcm->id,
+				    sizeof(rtd->pcm->streams[i].pcm->name));
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
