Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651CB8ED2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 13:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3D76167A;
	Fri, 20 Sep 2019 13:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3D76167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568977848;
	bh=9Huyv6HyPPjyF+ZKWeetcG/NKdKMBKn4oji3z8vpg5A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fFlUnjwaLG4HlpVfO7GOIZLKt27+h9kTwEwCbtLXYfwdZw00B16hkVGD9kR5sWAi1
	 27z48sbNgsADld4gJjTcvXjHxNbYvRFBnbkynY+7chJF7bRlCoSOOLdfIXY7VOw5bj
	 AYbohd1+MbZbORk0Fzc38wzgJwa1vgluA8dvhJHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25353F80527;
	Fri, 20 Sep 2019 13:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9016F80527; Fri, 20 Sep 2019 13:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F485F80096
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F485F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NRQdQV8K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/wasFkQhGM/5qfIjqIkLIZnc2ArhWM1CxqjWI5fc8zw=; b=NRQdQV8KNB96
 phZt9KbUrGZpfYxe+i9FdqZFMxPmGky8J4P8sC+nyDbogGcLO0cHceTbbAhxQUuFpLGmKEzBCTaBu
 Z2KTck4S74R4O9FyAVhfuZ7yvwFFcIkDOFXJvTzmNUtcu3wn2QoUXyTrkfkvX3wwqU63n2JMr0u8G
 SCR68=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iBGn7-0001cM-Ol; Fri, 20 Sep 2019 11:09:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 42C85274293F; Fri, 20 Sep 2019 12:09:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190919071652.31724-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190920110933.42C85274293F@ypsilon.sirena.org.uk>
Date: Fri, 20 Sep 2019 12:09:33 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: pcm3168a: The codec does not support
	S32_LE" to the asoc tree
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

   ASoC: pcm3168a: The codec does not support S32_LE

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 7b2db65b59c30d58c129d3c8b2101feca686155a Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 19 Sep 2019 10:16:52 +0300
Subject: [PATCH] ASoC: pcm3168a: The codec does not support S32_LE

24 bits is supported in all modes and 16 bit only when the codec is slave
and the DAI is set to RIGHT_J.

Remove the unsupported sample format.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190919071652.31724-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 50ed86d45c26..88b75695fbf7 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -21,8 +21,7 @@
 
 #define PCM3168A_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			 SNDRV_PCM_FMTBIT_S24_3LE | \
-			 SNDRV_PCM_FMTBIT_S24_LE | \
-			 SNDRV_PCM_FMTBIT_S32_LE)
+			 SNDRV_PCM_FMTBIT_S24_LE)
 
 #define PCM3168A_FMT_I2S		0x0
 #define PCM3168A_FMT_LEFT_J		0x1
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
