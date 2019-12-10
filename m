Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9704F118BDC
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:02:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21EDD16EB;
	Tue, 10 Dec 2019 16:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21EDD16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990120;
	bh=YIKnput95myznGuOktNvdgeiMK+ijTc8vViCcipIokM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jLYabvdCsTL3HxZb4UPhPxwXobupdFvzZDQvI9hVix71YulB+qdWIMKUmrH3JGIwx
	 /1lyR2JGK09tOKcV01Q7O4yR8/M2ftgii0ZOS/LQPQShy02e2sTZisNeTYrH47s00i
	 tMZ1pXCQZVCoaK6F6YNpH4SPGo1SqNcfnY+s/jtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E8FAF802BD;
	Tue, 10 Dec 2019 15:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E29EF80252; Tue, 10 Dec 2019 15:54:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAF42F80255
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAF42F80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB805AE50;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:57 +0100
Message-Id: <20191210145406.21419-15-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 14/23] ASoC: sh: Drop superfluous ioctl
	PCM ops
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

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sh/dma-sh7760.c | 1 -
 sound/soc/sh/fsi.c        | 1 -
 sound/soc/sh/rcar/core.c  | 1 -
 sound/soc/sh/siu_pcm.c    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 4d0f2f738ffa..eee1a1e994cb 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -307,7 +307,6 @@ static int camelot_pcm_new(struct snd_soc_component *component,
 static const struct snd_soc_component_driver sh7760_soc_component = {
 	.open		= camelot_pcm_open,
 	.close		= camelot_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= camelot_hw_params,
 	.prepare	= camelot_prepare,
 	.trigger	= camelot_trigger,
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 1cebddd76d12..89119acfa911 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1801,7 +1801,6 @@ static struct snd_soc_dai_driver fsi_soc_dai[] = {
 static const struct snd_soc_component_driver fsi_soc_component = {
 	.name		= "fsi",
 	.open		= fsi_pcm_open,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= fsi_pointer,
 	.pcm_construct	= fsi_pcm_new,
 };
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index bb840be5e591..614216d5a68b 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1657,7 +1657,6 @@ int rsnd_kctrl_new(struct rsnd_mod *mod,
  */
 static const struct snd_soc_component_driver rsnd_soc_component = {
 	.name		= "rsnd",
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= rsnd_hw_params,
 	.hw_free	= rsnd_hw_free,
 	.pointer	= rsnd_pointer,
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index 65637ad93630..6a6ffd6d3192 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -548,7 +548,6 @@ struct const snd_soc_component_driver siu_component = {
 	.name		= DRV_NAME,
 	.open		= siu_pcm_open,
 	.close		= siu_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.prepare	= siu_pcm_prepare,
 	.trigger	= siu_pcm_trigger,
 	.pointer	= siu_pcm_pointer_dma,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
