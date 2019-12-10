Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16726118054
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:22:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB6E1667;
	Tue, 10 Dec 2019 07:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB6E1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958950;
	bh=914XflFVAI4ke2g7QD7Dfzp3yj9hguM3fADq75+1qaE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWOmSfcwHDsdspijY7EisHRUTObPcIO5D/sBGmI/+FOG4+BPjrq4NLWGLp+01SFCJ
	 XuodXt3IqPQgocyF1HmpzBZTOttsi0+wPApOxJfkh0EAA5/EJr8GY7Q/CMu1SscmV8
	 uLB/OZg0cgqz9qbSk4JyvDx4UrNy9dsYv1pfEyI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6CF9F802F7;
	Tue, 10 Dec 2019 07:13:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B94DF802A1; Tue, 10 Dec 2019 07:12:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B74EBF80259
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B74EBF80259
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF94FB1DE
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:33 +0100
Message-Id: <20191210061145.24641-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 11/23] ALSA: via82xx: Drop superfluous ioctl
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

PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 5 -----
 sound/pci/via82xx_modem.c | 2 --
 2 files changed, 7 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index d116f32096c1..3009c26ea8b9 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -1348,7 +1348,6 @@ static int snd_via8233_playback_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_via686_playback_ops = {
 	.open =		snd_via686_playback_open,
 	.close =	snd_via82xx_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_via82xx_hw_params,
 	.hw_free =	snd_via82xx_hw_free,
 	.prepare =	snd_via686_playback_prepare,
@@ -1360,7 +1359,6 @@ static const struct snd_pcm_ops snd_via686_playback_ops = {
 static const struct snd_pcm_ops snd_via686_capture_ops = {
 	.open =		snd_via82xx_capture_open,
 	.close =	snd_via82xx_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_via82xx_hw_params,
 	.hw_free =	snd_via82xx_hw_free,
 	.prepare =	snd_via686_capture_prepare,
@@ -1372,7 +1370,6 @@ static const struct snd_pcm_ops snd_via686_capture_ops = {
 static const struct snd_pcm_ops snd_via8233_playback_ops = {
 	.open =		snd_via8233_playback_open,
 	.close =	snd_via8233_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_via82xx_hw_params,
 	.hw_free =	snd_via82xx_hw_free,
 	.prepare =	snd_via8233_playback_prepare,
@@ -1384,7 +1381,6 @@ static const struct snd_pcm_ops snd_via8233_playback_ops = {
 static const struct snd_pcm_ops snd_via8233_multi_ops = {
 	.open =		snd_via8233_multi_open,
 	.close =	snd_via82xx_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_via82xx_hw_params,
 	.hw_free =	snd_via82xx_hw_free,
 	.prepare =	snd_via8233_multi_prepare,
@@ -1396,7 +1392,6 @@ static const struct snd_pcm_ops snd_via8233_multi_ops = {
 static const struct snd_pcm_ops snd_via8233_capture_ops = {
 	.open =		snd_via82xx_capture_open,
 	.close =	snd_via82xx_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_via82xx_hw_params,
 	.hw_free =	snd_via82xx_hw_free,
 	.prepare =	snd_via8233_capture_prepare,
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 22eaa9216598..67614a8311e0 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -791,7 +791,6 @@ static int snd_via82xx_pcm_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_via686_playback_ops = {
 	.open =		snd_via82xx_playback_open,
 	.close =	snd_via82xx_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_via82xx_hw_params,
 	.hw_free =	snd_via82xx_hw_free,
 	.prepare =	snd_via82xx_pcm_prepare,
@@ -803,7 +802,6 @@ static const struct snd_pcm_ops snd_via686_playback_ops = {
 static const struct snd_pcm_ops snd_via686_capture_ops = {
 	.open =		snd_via82xx_capture_open,
 	.close =	snd_via82xx_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_via82xx_hw_params,
 	.hw_free =	snd_via82xx_hw_free,
 	.prepare =	snd_via82xx_pcm_prepare,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
