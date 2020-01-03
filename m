Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A817212F58E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E001748;
	Fri,  3 Jan 2020 09:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E001748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040622;
	bh=+4hXUvbf4KwAsvRAV3+IVkHtB7VsNBAyv/k/UoXp3vk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzA14NykJMnNgqw3mNaT6VOZ9v3PzJvdake5xVvyI/jzg0DSXLXL0qmtOLKdkLmWI
	 iaKcWiJVQwZ3/GnSqvhUdNxifXYX2mKYgbYmRqb/5hf8hzw3wckIQeC7hRT62A0L4s
	 NjREmk4x5/nJ9Tw+uX5pl6DMwE08UQ3hfFWeL3Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4905EF803D6;
	Fri,  3 Jan 2020 09:18:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7E70F8035E; Fri,  3 Jan 2020 09:18:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99EE8F8029A
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99EE8F8029A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3939BB275
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:49 +0100
Message-Id: <20200103081714.9560-34-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 33/58] ALSA: drivers: Constify snd_kcontrol_new
	items
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

Most of snd_kcontrol_new definitions are read-only and passed as-is.
Let's declare them as const for further optimization.
Constify snd_kcontrol_new items

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c           |  2 +-
 sound/drivers/dummy.c           |  2 +-
 sound/drivers/mts64.c           | 14 +++++++-------
 sound/drivers/opl4/opl4_mixer.c |  2 +-
 sound/drivers/pcsp/pcsp_mixer.c |  6 +++---
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 13abb3d0893f..d78a27271d6d 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1496,7 +1496,7 @@ static int loopback_channels_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new loopback_controls[]  = {
+static const struct snd_kcontrol_new loopback_controls[]  = {
 {
 	.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
 	.name =         "PCM Rate Shift 100000",
diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index cef5b391cc44..cec682a7b88d 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -849,7 +849,7 @@ static int snd_dummy_iobox_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
-static struct snd_kcontrol_new snd_dummy_controls[] = {
+static const struct snd_kcontrol_new snd_dummy_controls[] = {
 DUMMY_VOLUME("Master Volume", 0, MIXER_ADDR_MASTER),
 DUMMY_CAPSRC("Master Capture Switch", 0, MIXER_ADDR_MASTER),
 DUMMY_VOLUME("Synth Volume", 0, MIXER_ADDR_SYNTH),
diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index 44776e1463cb..eeef3c0215e4 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -467,7 +467,7 @@ static int snd_mts64_ctl_smpte_switch_put(struct snd_kcontrol* kctl,
 	return changed;
 }
 
-static struct snd_kcontrol_new mts64_ctl_smpte_switch = {
+static const struct snd_kcontrol_new mts64_ctl_smpte_switch = {
 	.iface = SNDRV_CTL_ELEM_IFACE_RAWMIDI,
 	.name  = "SMPTE Playback Switch",
 	.index = 0,
@@ -540,7 +540,7 @@ static int snd_mts64_ctl_smpte_time_put(struct snd_kcontrol *kctl,
 	return changed;
 }
 
-static struct snd_kcontrol_new mts64_ctl_smpte_time_hours = {
+static const struct snd_kcontrol_new mts64_ctl_smpte_time_hours = {
 	.iface = SNDRV_CTL_ELEM_IFACE_RAWMIDI,
 	.name  = "SMPTE Time Hours",
 	.index = 0,
@@ -551,7 +551,7 @@ static struct snd_kcontrol_new mts64_ctl_smpte_time_hours = {
 	.put  = snd_mts64_ctl_smpte_time_put
 };
 
-static struct snd_kcontrol_new mts64_ctl_smpte_time_minutes = {
+static const struct snd_kcontrol_new mts64_ctl_smpte_time_minutes = {
 	.iface = SNDRV_CTL_ELEM_IFACE_RAWMIDI,
 	.name  = "SMPTE Time Minutes",
 	.index = 0,
@@ -562,7 +562,7 @@ static struct snd_kcontrol_new mts64_ctl_smpte_time_minutes = {
 	.put  = snd_mts64_ctl_smpte_time_put
 };
 
-static struct snd_kcontrol_new mts64_ctl_smpte_time_seconds = {
+static const struct snd_kcontrol_new mts64_ctl_smpte_time_seconds = {
 	.iface = SNDRV_CTL_ELEM_IFACE_RAWMIDI,
 	.name  = "SMPTE Time Seconds",
 	.index = 0,
@@ -573,7 +573,7 @@ static struct snd_kcontrol_new mts64_ctl_smpte_time_seconds = {
 	.put  = snd_mts64_ctl_smpte_time_put
 };
 
-static struct snd_kcontrol_new mts64_ctl_smpte_time_frames = {
+static const struct snd_kcontrol_new mts64_ctl_smpte_time_frames = {
 	.iface = SNDRV_CTL_ELEM_IFACE_RAWMIDI,
 	.name  = "SMPTE Time Frames",
 	.index = 0,
@@ -625,7 +625,7 @@ static int snd_mts64_ctl_smpte_fps_put(struct snd_kcontrol *kctl,
 	return changed;
 }
 
-static struct snd_kcontrol_new mts64_ctl_smpte_fps = {
+static const struct snd_kcontrol_new mts64_ctl_smpte_fps = {
 	.iface = SNDRV_CTL_ELEM_IFACE_RAWMIDI,
 	.name  = "SMPTE Fps",
 	.index = 0,
@@ -641,7 +641,7 @@ static int snd_mts64_ctl_create(struct snd_card *card,
 				struct mts64 *mts)
 {
 	int err, i;
-	static struct snd_kcontrol_new *control[] = {
+	static const struct snd_kcontrol_new *control[] = {
 		&mts64_ctl_smpte_switch,
 		&mts64_ctl_smpte_time_hours,
 		&mts64_ctl_smpte_time_minutes,
diff --git a/sound/drivers/opl4/opl4_mixer.c b/sound/drivers/opl4/opl4_mixer.c
index 7d4b3cc0fb6c..fa1e6eff43ab 100644
--- a/sound/drivers/opl4/opl4_mixer.c
+++ b/sound/drivers/opl4/opl4_mixer.c
@@ -47,7 +47,7 @@ static int snd_opl4_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	return value != old_value;
 }
 
-static struct snd_kcontrol_new snd_opl4_controls[] = {
+static const struct snd_kcontrol_new snd_opl4_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "FM Playback Volume",
diff --git a/sound/drivers/pcsp/pcsp_mixer.c b/sound/drivers/pcsp/pcsp_mixer.c
index be2990451bcd..da33e5b620a7 100644
--- a/sound/drivers/pcsp/pcsp_mixer.c
+++ b/sound/drivers/pcsp/pcsp_mixer.c
@@ -120,17 +120,17 @@ static int pcsp_pcspkr_put(struct snd_kcontrol *kcontrol,
 	.put =		pcsp_##ctl_type##_put, \
 }
 
-static struct snd_kcontrol_new snd_pcsp_controls_pcm[] = {
+static const struct snd_kcontrol_new snd_pcsp_controls_pcm[] = {
 	PCSP_MIXER_CONTROL(enable, "Master Playback Switch"),
 	PCSP_MIXER_CONTROL(treble, "BaseFRQ Playback Volume"),
 };
 
-static struct snd_kcontrol_new snd_pcsp_controls_spkr[] = {
+static const struct snd_kcontrol_new snd_pcsp_controls_spkr[] = {
 	PCSP_MIXER_CONTROL(pcspkr, "Beep Playback Switch"),
 };
 
 static int snd_pcsp_ctls_add(struct snd_pcsp *chip,
-			     struct snd_kcontrol_new *ctls, int num)
+			     const struct snd_kcontrol_new *ctls, int num)
 {
 	int i, err;
 	struct snd_card *card = chip->card;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
