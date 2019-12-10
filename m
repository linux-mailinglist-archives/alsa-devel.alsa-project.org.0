Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66346118BF2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1BBD16EA;
	Tue, 10 Dec 2019 16:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1BBD16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990276;
	bh=kdK0xowsuaWyI7yyq0HqHjkaVCe/BCjR1ntCLzc1mao=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwO8ful8hWiVrZqx2WibBuJ3gMS1Y4iFG0b15hTMcAVXOtyoeUrD1v1EM7i1+HSmk
	 YELxtsvI+SJgvTXhdnegRiwE2/I3Lm+bskxMqWY/BR0AorIzCJk5iTeDvTKvOJfBqf
	 dU+43IWXg0YpV6yh23ujxXrLHxK7kD8won9+gQwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21485F802EB;
	Tue, 10 Dec 2019 15:54:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FA8AF8029B; Tue, 10 Dec 2019 15:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1919EF800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1919EF800B4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BA5A3ACC4;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:54 +0100
Message-Id: <20191210145406.21419-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH for-5.6 11/23] ASoC: pxa: Drop superfluous
	ioctl PCM ops
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

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/pxa/mmp-pcm.c     | 1 -
 sound/soc/pxa/pxa-ssp.c     | 1 -
 sound/soc/pxa/pxa2xx-ac97.c | 1 -
 sound/soc/pxa/pxa2xx-i2s.c  | 1 -
 sound/soc/pxa/pxa2xx-pcm.c  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/sound/soc/pxa/mmp-pcm.c b/sound/soc/pxa/mmp-pcm.c
index 54a4c9213e83..287b5da739e5 100644
--- a/sound/soc/pxa/mmp-pcm.c
+++ b/sound/soc/pxa/mmp-pcm.c
@@ -225,7 +225,6 @@ static const struct snd_soc_component_driver mmp_soc_component = {
 	.name		= DRV_NAME,
 	.open		= mmp_pcm_open,
 	.close		= mmp_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= mmp_pcm_hw_params,
 	.trigger	= mmp_pcm_trigger,
 	.pointer	= mmp_pcm_pointer,
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 76fdce54f007..f37ea0fb4f3f 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -873,7 +873,6 @@ static const struct snd_soc_component_driver pxa_ssp_component = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 31e81a6f616f..22fe77955c2c 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -208,7 +208,6 @@ static const struct snd_soc_component_driver pxa_ac97_component = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index e77d707efde7..d9d366a8df11 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -364,7 +364,6 @@ static const struct snd_soc_component_driver pxa_i2s_component = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index 07b3455a6f23..2b7839715dd5 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -22,7 +22,6 @@ static const struct snd_soc_component_driver pxa2xx_soc_platform = {
 	.pcm_destruct	= pxa2xx_soc_pcm_free,
 	.open		= pxa2xx_soc_pcm_open,
 	.close		= pxa2xx_soc_pcm_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= pxa2xx_soc_pcm_hw_params,
 	.hw_free	= pxa2xx_soc_pcm_hw_free,
 	.prepare	= pxa2xx_soc_pcm_prepare,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
