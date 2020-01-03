Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BF512F55B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889281708;
	Fri,  3 Jan 2020 09:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889281708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578039708;
	bh=FVpVLtbnkLJZrkCP6C80HRbVJaACob01HiOLj0615XE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vIp1jdL8+yJHzxd7KyxTIQMg1PcbWxg6+D5/Eh8Bo9SK5g3DiU8j0v/tLp7NtGtyR
	 2s2L8M6hqm6mIubP029Q6HzGk8hkzTSV72L3LyZlXMHbmdWMDr2tDAJFnqmHBiFBk3
	 63tMWUrpqL+F67UMJAFJhZgJWswcv07xo7stMGaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15443F80316;
	Fri,  3 Jan 2020 09:17:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65704F80160; Fri,  3 Jan 2020 09:17:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2F1FF800FE
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2F1FF800FE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB6F5B202
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:20 +0100
Message-Id: <20200103081714.9560-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 04/58] ALSA: core: Constify snd_device_ops
	definitions
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

Now we may declare const for snd_device_ops definitions, so let's do
it for optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 2 +-
 sound/core/control.c          | 2 +-
 sound/core/hwdep.c            | 2 +-
 sound/core/jack.c             | 2 +-
 sound/core/pcm.c              | 4 ++--
 sound/core/rawmidi.c          | 2 +-
 sound/core/seq_device.c       | 2 +-
 sound/core/timer.c            | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index f34ce564d92c..9de1c9a0173e 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1099,7 +1099,7 @@ static int snd_compress_dev_free(struct snd_device *device)
 int snd_compress_new(struct snd_card *card, int device,
 			int dirn, const char *id, struct snd_compr *compr)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_compress_dev_free,
 		.dev_register = snd_compress_dev_register,
 		.dev_disconnect = snd_compress_dev_disconnect,
diff --git a/sound/core/control.c b/sound/core/control.c
index 4728f6828890..63bb2fcf13be 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1823,7 +1823,7 @@ static int snd_ctl_dev_free(struct snd_device *device)
  */
 int snd_ctl_create(struct snd_card *card)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_ctl_dev_free,
 		.dev_register =	snd_ctl_dev_register,
 		.dev_disconnect = snd_ctl_dev_disconnect,
diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 00cb5aed10a9..b412d3b3d5ff 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -353,7 +353,7 @@ int snd_hwdep_new(struct snd_card *card, char *id, int device,
 {
 	struct snd_hwdep *hwdep;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_hwdep_dev_free,
 		.dev_register = snd_hwdep_dev_register,
 		.dev_disconnect = snd_hwdep_dev_disconnect,
diff --git a/sound/core/jack.c b/sound/core/jack.c
index fb26196571a7..6590b1b8d62a 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -201,7 +201,7 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 	struct snd_jack *jack;
 	struct snd_jack_kctl *jack_kctl = NULL;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_jack_dev_free,
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 		.dev_register = snd_jack_dev_register,
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 85db55ea49fd..a0f704b72a78 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -706,12 +706,12 @@ static int _snd_pcm_new(struct snd_card *card, const char *id, int device,
 {
 	struct snd_pcm *pcm;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_pcm_dev_free,
 		.dev_register =	snd_pcm_dev_register,
 		.dev_disconnect = snd_pcm_dev_disconnect,
 	};
-	static struct snd_device_ops internal_ops = {
+	static const struct snd_device_ops internal_ops = {
 		.dev_free = snd_pcm_dev_free,
 	};
 
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index cd9bbb546846..7bc95c24f724 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1621,7 +1621,7 @@ int snd_rawmidi_new(struct snd_card *card, char *id, int device,
 {
 	struct snd_rawmidi *rmidi;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_rawmidi_dev_free,
 		.dev_register = snd_rawmidi_dev_register,
 		.dev_disconnect = snd_rawmidi_dev_disconnect,
diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index e9dbad93f9d0..7ed13cb32ef8 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -193,7 +193,7 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 {
 	struct snd_seq_device *dev;
 	int err;
-	static struct snd_device_ops dops = {
+	static const struct snd_device_ops dops = {
 		.dev_free = snd_seq_device_dev_free,
 		.dev_register = snd_seq_device_dev_register,
 		.dev_disconnect = snd_seq_device_dev_disconnect,
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 4cfd8e691903..d53bc1f3a48a 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -936,7 +936,7 @@ int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid,
 {
 	struct snd_timer *timer;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_timer_dev_free,
 		.dev_register = snd_timer_dev_register,
 		.dev_disconnect = snd_timer_dev_disconnect,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
