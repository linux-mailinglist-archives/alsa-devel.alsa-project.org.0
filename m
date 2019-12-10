Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D8D118BD6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE4816D3;
	Tue, 10 Dec 2019 15:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE4816D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990009;
	bh=a4gEN/Fbkr5rzi/kku0+FfC5o1WpqHcFcYnVhUGvczk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFcUyImMyn2JUUPwWc7lfzPbkd58y1PcA3vlD6BqLLfu34zD7LPaAWvu+nqbkrzKt
	 VLMZ1F4VRVQ9MdWtkNfDzx4WX6sepOrbQnS3xRALQxoyasKMfZmpeEZjcrEudsp0bs
	 TynuH+yIWsYMoUhs7hPIICvfPg42iI1HXKdyr0WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B82BF800F3;
	Tue, 10 Dec 2019 15:54:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A5B5F8027D; Tue, 10 Dec 2019 15:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80DB1F80252
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DB1F80252
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AFBE1AE3F;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:53 +0100
Message-Id: <20191210145406.21419-11-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 alsa-devel@alsa-project.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH for-5.6 10/23] ASoC: meson: Drop superfluous
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

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/meson/axg-frddr.c | 3 ---
 sound/soc/meson/axg-toddr.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 665d75d49d7b..0a7d41257a38 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -151,7 +151,6 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(axg_frddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= axg_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -275,7 +274,6 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -345,7 +343,6 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 7fef0b961496..f6023397c8fe 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -183,7 +183,6 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= axg_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -222,7 +221,6 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
@@ -292,7 +290,6 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 	.num_dapm_routes	= ARRAY_SIZE(sm1_toddr_dapm_routes),
 	.open			= axg_fifo_pcm_open,
 	.close			= axg_fifo_pcm_close,
-	.ioctl			= snd_soc_pcm_lib_ioctl,
 	.hw_params		= g12a_fifo_pcm_hw_params,
 	.hw_free		= axg_fifo_pcm_hw_free,
 	.pointer		= axg_fifo_pcm_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
