Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538511805D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:23:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0C01682;
	Tue, 10 Dec 2019 07:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0C01682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959030;
	bh=sTx7k3wkTBNnZQitTb9XbEXrXkNgoBOL8kGbWecjKm0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3LBca7mcqy8SauchZxo828XuzMezYp/TmhEE6OZPJ1bE2Qcqw5kmrymAmlm2CpLJ
	 NIbyhr0uhDRP3JHypUvWB1jfF7hIDkYxjcwYrzh/IHXXiCujV/o47yLqp37RSxAkSG
	 4bF6vSAV/yj++1sCDavRcS+W1NUZWMlKoKHc4iQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42E9CF80315;
	Tue, 10 Dec 2019 07:13:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EEA5F802BC; Tue, 10 Dec 2019 07:12:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECA87F8025A
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA87F8025A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22023B1E4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:36 +0100
Message-Id: <20191210061145.24641-15-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 14/23] ALSA: trident: Drop superfluous ioctl
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

snd_trident_ioctl() does nothing but calling the default handler.
Now PCM core accepts NULL as the default ioctl ops, so let's drop
altogether.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident_main.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 93789069e78f..0e02578c2b3d 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -767,29 +767,6 @@ static unsigned int snd_trident_control_mode(struct snd_pcm_substream *substream
  *  PCM part
  */
 
-/*---------------------------------------------------------------------------
-   snd_trident_ioctl
-  
-   Description: Device I/O control handler for playback/capture parameters.
-  
-   Parameters:   substream  - PCM substream class
-                cmd     - what ioctl message to process
-                arg     - additional message infoarg     
-  
-   Returns:     Error status
-  
-  ---------------------------------------------------------------------------*/
-
-static int snd_trident_ioctl(struct snd_pcm_substream *substream,
-			     unsigned int cmd,
-			     void *arg)
-{
-	/* FIXME: it seems that with small periods the behaviour of
-	          trident hardware is unpredictable and interrupt generator
-	          is broken */
-	return snd_pcm_lib_ioctl(substream, cmd, arg);
-}
-
 /*---------------------------------------------------------------------------
    snd_trident_allocate_pcm_mem
   
@@ -2049,7 +2026,6 @@ static int snd_trident_foldback_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_trident_playback_ops = {
 	.open =		snd_trident_playback_open,
 	.close =	snd_trident_playback_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_hw_params,
 	.hw_free =	snd_trident_hw_free,
 	.prepare =	snd_trident_playback_prepare,
@@ -2060,7 +2036,6 @@ static const struct snd_pcm_ops snd_trident_playback_ops = {
 static const struct snd_pcm_ops snd_trident_nx_playback_ops = {
 	.open =		snd_trident_playback_open,
 	.close =	snd_trident_playback_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_hw_params,
 	.hw_free =	snd_trident_hw_free,
 	.prepare =	snd_trident_playback_prepare,
@@ -2071,7 +2046,6 @@ static const struct snd_pcm_ops snd_trident_nx_playback_ops = {
 static const struct snd_pcm_ops snd_trident_capture_ops = {
 	.open =		snd_trident_capture_open,
 	.close =	snd_trident_capture_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_capture_hw_params,
 	.hw_free =	snd_trident_hw_free,
 	.prepare =	snd_trident_capture_prepare,
@@ -2082,7 +2056,6 @@ static const struct snd_pcm_ops snd_trident_capture_ops = {
 static const struct snd_pcm_ops snd_trident_si7018_capture_ops = {
 	.open =		snd_trident_capture_open,
 	.close =	snd_trident_capture_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_si7018_capture_hw_params,
 	.hw_free =	snd_trident_si7018_capture_hw_free,
 	.prepare =	snd_trident_si7018_capture_prepare,
@@ -2093,7 +2066,6 @@ static const struct snd_pcm_ops snd_trident_si7018_capture_ops = {
 static const struct snd_pcm_ops snd_trident_foldback_ops = {
 	.open =		snd_trident_foldback_open,
 	.close =	snd_trident_foldback_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_hw_params,
 	.hw_free =	snd_trident_hw_free,
 	.prepare =	snd_trident_foldback_prepare,
@@ -2104,7 +2076,6 @@ static const struct snd_pcm_ops snd_trident_foldback_ops = {
 static const struct snd_pcm_ops snd_trident_nx_foldback_ops = {
 	.open =		snd_trident_foldback_open,
 	.close =	snd_trident_foldback_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_hw_params,
 	.hw_free =	snd_trident_hw_free,
 	.prepare =	snd_trident_foldback_prepare,
@@ -2115,7 +2086,6 @@ static const struct snd_pcm_ops snd_trident_nx_foldback_ops = {
 static const struct snd_pcm_ops snd_trident_spdif_ops = {
 	.open =		snd_trident_spdif_open,
 	.close =	snd_trident_spdif_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_spdif_hw_params,
 	.hw_free =	snd_trident_hw_free,
 	.prepare =	snd_trident_spdif_prepare,
@@ -2126,7 +2096,6 @@ static const struct snd_pcm_ops snd_trident_spdif_ops = {
 static const struct snd_pcm_ops snd_trident_spdif_7018_ops = {
 	.open =		snd_trident_spdif_open,
 	.close =	snd_trident_spdif_close,
-	.ioctl =	snd_trident_ioctl,
 	.hw_params =	snd_trident_spdif_hw_params,
 	.hw_free =	snd_trident_hw_free,
 	.prepare =	snd_trident_spdif_prepare,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
