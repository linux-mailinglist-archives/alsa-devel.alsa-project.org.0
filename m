Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E5F3D9045
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 16:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A611FED;
	Wed, 28 Jul 2021 16:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A611FED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627482024;
	bh=Ac0y7TqGczYEMUNPx4SDDMzXbnUAHedlQOWLTt3XzD4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e1zqb2FyYWz0597DV5MvLFhox10DzxrFeZ6U3GYJiKy2P6H4yJkTt5ZAz4Y0ZIipf
	 0Khqq1eCtyj9R2glTZyVIzk6/+ub0AnZyyKiZkkvKjWc6VMh4fVUNNIDdJjmgGex09
	 oqvBkIoskLrEqKI9rc83ORtKo9EfAZnB9pA4ewSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3AF7F8025E;
	Wed, 28 Jul 2021 16:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00AC9F8025A; Wed, 28 Jul 2021 16:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15102F80127
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 16:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15102F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="YtE9fb8M"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="EAey1sxt"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3AA341FFB4;
 Wed, 28 Jul 2021 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627481925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qFLos43cMtQvRbNGoiPnjcjjo20/t8JVg8vNWWMmafU=;
 b=YtE9fb8M15K0O/28CFgyrXR8emZZrHwcvkd2VUsS3qMzQb2SQHnPJPs/L1ZtW6DXFEgeut
 pTy1S7vCnS+jEZtCUOz6j3qGMXgp8DB9zvyUn2ZiVXG7Ek58w44Z8k7thhaDs1Hr4fE6Wf
 dnwm7FfQjQTBkj6wAGPQpzwvlVUNbF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627481925;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qFLos43cMtQvRbNGoiPnjcjjo20/t8JVg8vNWWMmafU=;
 b=EAey1sxtWxKddSOb3eBcc5XtqsT0sF4M6Ojr8NXdOXWV1j6u73/juf2xk/dD1yT1uH+hXy
 snTEHmMSyK8dwCDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 288CCA3B81;
 Wed, 28 Jul 2021 14:18:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: Drop superfluous mmap callbacks
Date: Wed, 28 Jul 2021 16:18:43 +0200
Message-Id: <20210728141843.17685-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

All ASoC AMD drivers just call the standard mmap handler, hence those
are superfluous.  Let's drop them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/amd/acp-pcm-dma.c          | 8 --------
 sound/soc/amd/raven/acp3x-pcm-dma.c  | 8 --------
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 8 --------
 3 files changed, 24 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 143155a840ac..8f202423e6ce 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1035,13 +1035,6 @@ static snd_pcm_uframes_t acp_dma_pointer(struct snd_soc_component *component,
 	return bytes_to_frames(runtime, pos);
 }
 
-static int acp_dma_mmap(struct snd_soc_component *component,
-			struct snd_pcm_substream *substream,
-			struct vm_area_struct *vma)
-{
-	return snd_pcm_lib_default_mmap(substream, vma);
-}
-
 static int acp_dma_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
@@ -1205,7 +1198,6 @@ static const struct snd_soc_component_driver acp_asoc_platform = {
 	.hw_params	= acp_dma_hw_params,
 	.trigger	= acp_dma_trigger,
 	.pointer	= acp_dma_pointer,
-	.mmap		= acp_dma_mmap,
 	.prepare	= acp_dma_prepare,
 	.pcm_construct	= acp_dma_new,
 };
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 8148b0d22e88..5f24546eeed0 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -320,13 +320,6 @@ static int acp3x_dma_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static int acp3x_dma_mmap(struct snd_soc_component *component,
-			  struct snd_pcm_substream *substream,
-			  struct vm_area_struct *vma)
-{
-	return snd_pcm_lib_default_mmap(substream, vma);
-}
-
 static int acp3x_dma_close(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
@@ -370,7 +363,6 @@ static const struct snd_soc_component_driver acp3x_i2s_component = {
 	.close		= acp3x_dma_close,
 	.hw_params	= acp3x_dma_hw_params,
 	.pointer	= acp3x_dma_pointer,
-	.mmap		= acp3x_dma_mmap,
 	.pcm_construct	= acp3x_dma_new,
 };
 
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index bd20622b0933..9988a50a81b0 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -291,13 +291,6 @@ static int acp_pdm_dma_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static int acp_pdm_dma_mmap(struct snd_soc_component *component,
-			    struct snd_pcm_substream *substream,
-			    struct vm_area_struct *vma)
-{
-	return snd_pcm_lib_default_mmap(substream, vma);
-}
-
 static int acp_pdm_dma_close(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
@@ -375,7 +368,6 @@ static const struct snd_soc_component_driver acp_pdm_component = {
 	.close		= acp_pdm_dma_close,
 	.hw_params	= acp_pdm_dma_hw_params,
 	.pointer	= acp_pdm_dma_pointer,
-	.mmap		= acp_pdm_dma_mmap,
 	.pcm_construct	= acp_pdm_dma_new,
 };
 
-- 
2.26.2

