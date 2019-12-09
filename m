Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F694116B56
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:45:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8191717;
	Mon,  9 Dec 2019 11:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8191717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888333;
	bh=IOJxjUSIvdN/Tt4IonFVyrELwALsouY06l8aY2chH80=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJeW8vKkMzyUHf38P/4Gsa5q6ftuVPW5ZESFO/eeiv/t9G2SyM205FteyBlpITHHv
	 EYlnJoTZb06cG1D0IR27CguPgSGP/mYuJ+GjyUeItpMBF1lcV+CFzL946rSR0MDDHY
	 RIS/E62FnnezssFXDh9JzoapkyHkfeAAKy7XdWPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC1BF806E5;
	Mon,  9 Dec 2019 10:52:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF4CF803BE; Mon,  9 Dec 2019 10:51:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F77DF802E0
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F77DF802E0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5AACB2E9
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:42 +0100
Message-Id: <20191209094943.14984-71-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 70/71] ALSA: usb-audio: Use managed buffer
	allocation
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
 sound/usb/pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 9c8930bb00c8..7caaa04ae546 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -785,11 +785,6 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	ret = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(hw_params));
-	if (ret < 0)
-		goto stop_pipeline;
-
 	subs->pcm_format = params_format(hw_params);
 	subs->period_bytes = params_period_bytes(hw_params);
 	subs->period_frames = params_period_size(hw_params);
@@ -853,7 +848,7 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 		snd_usb_unlock_shutdown(subs->stream->chip);
 	}
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 /*
@@ -1803,9 +1798,9 @@ void snd_usb_preallocate_buffer(struct snd_usb_substream *subs)
 	struct device *dev = subs->dev->bus->controller;
 
 	if (snd_usb_use_vmalloc)
-		snd_pcm_lib_preallocate_pages(s, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+		snd_pcm_set_managed_buffer(s, SNDRV_DMA_TYPE_VMALLOC,
+					   NULL, 0, 0);
 	else
-		snd_pcm_lib_preallocate_pages(s, SNDRV_DMA_TYPE_DEV_SG,
-					      dev, 64*1024, 512*1024);
+		snd_pcm_set_managed_buffer(s, SNDRV_DMA_TYPE_DEV_SG,
+					   dev, 64*1024, 512*1024);
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
