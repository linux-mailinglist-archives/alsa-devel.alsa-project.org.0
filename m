Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C118118059
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:23:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105C41674;
	Tue, 10 Dec 2019 07:22:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105C41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958994;
	bh=a4m4dzCOrYoszhB/JcJvo9qlDhe2JJhO9AcKh7J3gxk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYEgnPKjTBJ6prVVIKYmv3QM3hWrEWdkbL/fERlcJmbS40NkGJRGlbjp0bgAQR3JB
	 TPAE6ObGwZekBUcy2WiRKt3bnkqUJebdF40Ji3pdkSYFH997F5WLogmsiUG3XpxIhR
	 4epBAMb4PuXTlkwsi3BuCROJE/65X1clO5MQ4tqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22AB2F80304;
	Tue, 10 Dec 2019 07:13:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D8D2F802A1; Tue, 10 Dec 2019 07:12:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F22BF80255
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F22BF80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60DBBB1EF
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:41 +0100
Message-Id: <20191210061145.24641-20-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 19/23] ALSA: sparc: Drop superfluous ioctl PCM
	ops
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
 sound/sparc/amd7930.c | 2 --
 sound/sparc/cs4231.c  | 2 --
 sound/sparc/dbri.c    | 1 -
 3 files changed, 5 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index d39973605cca..df1b16c97d16 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -726,7 +726,6 @@ static int snd_amd7930_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_amd7930_playback_ops = {
 	.open		=	snd_amd7930_playback_open,
 	.close		=	snd_amd7930_playback_close,
-	.ioctl		=	snd_pcm_lib_ioctl,
 	.prepare	=	snd_amd7930_playback_prepare,
 	.trigger	=	snd_amd7930_playback_trigger,
 	.pointer	=	snd_amd7930_playback_pointer,
@@ -735,7 +734,6 @@ static const struct snd_pcm_ops snd_amd7930_playback_ops = {
 static const struct snd_pcm_ops snd_amd7930_capture_ops = {
 	.open		=	snd_amd7930_capture_open,
 	.close		=	snd_amd7930_capture_close,
-	.ioctl		=	snd_pcm_lib_ioctl,
 	.prepare	=	snd_amd7930_capture_prepare,
 	.trigger	=	snd_amd7930_capture_trigger,
 	.pointer	=	snd_amd7930_capture_pointer,
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 874da942b662..1676d44769ad 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1193,7 +1193,6 @@ static int snd_cs4231_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cs4231_playback_ops = {
 	.open		=	snd_cs4231_playback_open,
 	.close		=	snd_cs4231_playback_close,
-	.ioctl		=	snd_pcm_lib_ioctl,
 	.hw_params	=	snd_cs4231_playback_hw_params,
 	.prepare	=	snd_cs4231_playback_prepare,
 	.trigger	=	snd_cs4231_trigger,
@@ -1203,7 +1202,6 @@ static const struct snd_pcm_ops snd_cs4231_playback_ops = {
 static const struct snd_pcm_ops snd_cs4231_capture_ops = {
 	.open		=	snd_cs4231_capture_open,
 	.close		=	snd_cs4231_capture_close,
-	.ioctl		=	snd_pcm_lib_ioctl,
 	.hw_params	=	snd_cs4231_capture_hw_params,
 	.prepare	=	snd_cs4231_capture_prepare,
 	.trigger	=	snd_cs4231_trigger,
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 315d5a04a33e..1390a52d6cfd 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2215,7 +2215,6 @@ static snd_pcm_uframes_t snd_dbri_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_dbri_ops = {
 	.open = snd_dbri_open,
 	.close = snd_dbri_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_dbri_hw_params,
 	.hw_free = snd_dbri_hw_free,
 	.prepare = snd_dbri_prepare,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
