Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A372118039
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:14:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099B61670;
	Tue, 10 Dec 2019 07:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099B61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958474;
	bh=hA4WdJGwRPExDmHOrNlEL8ODQxIXp9bVi8/KBjdFDuY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlnT3gHI+dIgs+FRk9T8UpvABStVg08ywi2h2b3EQqByxe8Fq7D7B2RIm4N40Knq0
	 rBZYVo0bYA2i20bJJuEXW5sVSJ7ho14R2UtxoJjmZOWWtRKjNsCQ2e7Wvlqesxjawu
	 JMQ25RNhZlBFwewUA/D3vIajoDaKVTnUlbVP4GKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABF4EF8011E;
	Tue, 10 Dec 2019 07:12:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2A76F80271; Tue, 10 Dec 2019 07:12:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92FE2F801D8
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92FE2F801D8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9AE58B1D0
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:26 +0100
Message-Id: <20191210061145.24641-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 04/23] ALSA: drivers: Drop superfluous ioctl
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
 sound/drivers/aloop.c         | 1 -
 sound/drivers/dummy.c         | 2 --
 sound/drivers/ml403-ac97cr.c  | 2 --
 sound/drivers/pcsp/pcsp_lib.c | 1 -
 sound/drivers/vx/vx_pcm.c     | 2 --
 5 files changed, 8 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 104fb738cf48..8090812dcecb 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1299,7 +1299,6 @@ static int loopback_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops loopback_pcm_ops = {
 	.open =		loopback_open,
 	.close =	loopback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_free =	loopback_hw_free,
 	.prepare =	loopback_prepare,
 	.trigger =	loopback_trigger,
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index ab6062dcd1b3..cef5b391cc44 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -647,7 +647,6 @@ static struct page *dummy_pcm_page(struct snd_pcm_substream *substream,
 static struct snd_pcm_ops dummy_pcm_ops = {
 	.open =		dummy_pcm_open,
 	.close =	dummy_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	dummy_pcm_hw_params,
 	.prepare =	dummy_pcm_prepare,
 	.trigger =	dummy_pcm_trigger,
@@ -657,7 +656,6 @@ static struct snd_pcm_ops dummy_pcm_ops = {
 static struct snd_pcm_ops dummy_pcm_ops_no_buf = {
 	.open =		dummy_pcm_open,
 	.close =	dummy_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	dummy_pcm_hw_params,
 	.prepare =	dummy_pcm_prepare,
 	.trigger =	dummy_pcm_trigger,
diff --git a/sound/drivers/ml403-ac97cr.c b/sound/drivers/ml403-ac97cr.c
index fad63783b4ae..d1e01d89c722 100644
--- a/sound/drivers/ml403-ac97cr.c
+++ b/sound/drivers/ml403-ac97cr.c
@@ -731,7 +731,6 @@ static int snd_ml403_ac97cr_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ml403_ac97cr_playback_ops = {
 	.open = snd_ml403_ac97cr_playback_open,
 	.close = snd_ml403_ac97cr_playback_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_ml403_ac97cr_pcm_playback_prepare,
 	.trigger = snd_ml403_ac97cr_pcm_playback_trigger,
 	.pointer = snd_ml403_ac97cr_pcm_pointer,
@@ -740,7 +739,6 @@ static const struct snd_pcm_ops snd_ml403_ac97cr_playback_ops = {
 static const struct snd_pcm_ops snd_ml403_ac97cr_capture_ops = {
 	.open = snd_ml403_ac97cr_capture_open,
 	.close = snd_ml403_ac97cr_capture_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_ml403_ac97cr_pcm_capture_prepare,
 	.trigger = snd_ml403_ac97cr_pcm_capture_trigger,
 	.pointer = snd_ml403_ac97cr_pcm_pointer,
diff --git a/sound/drivers/pcsp/pcsp_lib.c b/sound/drivers/pcsp/pcsp_lib.c
index 4fdc4dbdae57..05244b11ed5e 100644
--- a/sound/drivers/pcsp/pcsp_lib.c
+++ b/sound/drivers/pcsp/pcsp_lib.c
@@ -322,7 +322,6 @@ static int snd_pcsp_playback_open(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_pcsp_playback_ops = {
 	.open = snd_pcsp_playback_open,
 	.close = snd_pcsp_playback_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_pcsp_playback_hw_params,
 	.hw_free = snd_pcsp_playback_hw_free,
 	.prepare = snd_pcsp_playback_prepare,
diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index 615e8b2b85f6..664b9efa9a50 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -843,7 +843,6 @@ static int vx_pcm_prepare(struct snd_pcm_substream *subs)
 static const struct snd_pcm_ops vx_pcm_playback_ops = {
 	.open =		vx_pcm_playback_open,
 	.close =	vx_pcm_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	vx_pcm_prepare,
 	.trigger =	vx_pcm_trigger,
 	.pointer =	vx_pcm_playback_pointer,
@@ -1061,7 +1060,6 @@ static snd_pcm_uframes_t vx_pcm_capture_pointer(struct snd_pcm_substream *subs)
 static const struct snd_pcm_ops vx_pcm_capture_ops = {
 	.open =		vx_pcm_capture_open,
 	.close =	vx_pcm_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	vx_pcm_prepare,
 	.trigger =	vx_pcm_trigger,
 	.pointer =	vx_pcm_capture_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
