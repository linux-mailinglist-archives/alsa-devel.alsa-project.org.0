Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F812116B5F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:48:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA231714;
	Mon,  9 Dec 2019 11:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA231714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888490;
	bh=DLCrf3jc/TqJIsrpLz447sPDJjVlwFSeVtio1EdOMcY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ew8sb5YT9pvCF5bXtECl69U66PLrGCqFXcNxMF+QSg4EkzzgWtTNSy9UkJcVKYfxI
	 VxmUmQe+bxzJg9mP0tzjUB0ytKnKjTXA8WGZnirfCTJxrOdaVRmGrP5VgxQypB+xH0
	 pH/XP13aoIog9gSca312eB+cmt/d4zh5JrTPXtTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD82F806F7;
	Mon,  9 Dec 2019 10:53:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BD4DF802EB; Mon,  9 Dec 2019 10:51:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC4BAF802EB
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC4BAF802EB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E994BB279
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:43 +0100
Message-Id: <20191209094943.14984-72-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 71/71] ALSA: hdml-lpe-audio: Use managed
	buffer allocation
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

Clean up the driver with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index cd389d21219a..a67692ca08af 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1132,16 +1132,13 @@ static int had_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_intelhad *intelhaddata;
-	int buf_size, retval;
+	int buf_size;
 
 	intelhaddata = snd_pcm_substream_chip(substream);
 	buf_size = params_buffer_bytes(hw_params);
-	retval = snd_pcm_lib_malloc_pages(substream, buf_size);
-	if (retval < 0)
-		return retval;
 	dev_dbg(intelhaddata->dev, "%s:allocated memory = %d\n",
 		__func__, buf_size);
-	return retval;
+	return 0;
 }
 
 /*
@@ -1154,7 +1151,7 @@ static int had_pcm_hw_free(struct snd_pcm_substream *substream)
 	intelhaddata = snd_pcm_substream_chip(substream);
 	had_do_reset(intelhaddata);
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 /*
@@ -1801,10 +1798,9 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 		/* allocate dma pages;
 		 * try to allocate 600k buffer as default which is large enough
 		 */
-		snd_pcm_lib_preallocate_pages_for_all(pcm,
-						      SNDRV_DMA_TYPE_DEV_UC,
-						      card->dev,
-						      HAD_DEFAULT_BUFFER, HAD_MAX_BUFFER);
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_UC,
+					       card->dev, HAD_DEFAULT_BUFFER,
+					       HAD_MAX_BUFFER);
 
 		/* create controls */
 		for (i = 0; i < ARRAY_SIZE(had_controls); i++) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
