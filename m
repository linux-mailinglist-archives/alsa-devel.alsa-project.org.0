Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF241118046
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:19:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 531A51660;
	Tue, 10 Dec 2019 07:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 531A51660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958746;
	bh=RVr8TLzFAK3y0nRYjf5Dv3hOnmTms7+uhs3KXgZvjeA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQ2l4TaRaIyZt7FV3uENzhVRE+TIh5nmXD9tMfSfEME/AKBq1Ab7axvGPey/alTfV
	 c56NQmon6tdYTZtZrUniwW+VSu1WDW65JtC0vyFLPzEjdoGtaWZ3gJovFPtpIVIGiN
	 CifUbz/ikuX8WxlHj3UM01T2MinEl1sFyqLuRhHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD253F8026F;
	Tue, 10 Dec 2019 07:12:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5335F8027D; Tue, 10 Dec 2019 07:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED5C0F8024A
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED5C0F8024A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A83A7B1D4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:27 +0100
Message-Id: <20191210061145.24641-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 05/23] ALSA: firewire: Drop superfluous ioctl
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/bebob/bebob_pcm.c         | 2 --
 sound/firewire/dice/dice-pcm.c           | 2 --
 sound/firewire/digi00x/digi00x-pcm.c     | 2 --
 sound/firewire/fireface/ff-pcm.c         | 2 --
 sound/firewire/fireworks/fireworks_pcm.c | 2 --
 sound/firewire/isight.c                  | 1 -
 sound/firewire/motu/motu-pcm.c           | 2 --
 sound/firewire/oxfw/oxfw-pcm.c           | 2 --
 sound/firewire/tascam/tascam-pcm.c       | 2 --
 9 files changed, 17 deletions(-)

diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 5fbf1d74c544..f8d9a2041264 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -342,7 +342,6 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 	static const struct snd_pcm_ops capture_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_capture_prepare,
@@ -353,7 +352,6 @@ int snd_bebob_create_pcm_devices(struct snd_bebob *bebob)
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_playback_prepare,
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 2700f7f6f754..af8a90ee40f3 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -405,7 +405,6 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 	static const struct snd_pcm_ops capture_ops = {
 		.open      = pcm_open,
 		.close     = pcm_close,
-		.ioctl     = snd_pcm_lib_ioctl,
 		.hw_params = pcm_hw_params,
 		.hw_free   = pcm_hw_free,
 		.prepare   = capture_prepare,
@@ -416,7 +415,6 @@ int snd_dice_create_pcm(struct snd_dice *dice)
 	static const struct snd_pcm_ops playback_ops = {
 		.open      = pcm_open,
 		.close     = pcm_close,
-		.ioctl     = snd_pcm_lib_ioctl,
 		.hw_params = pcm_hw_params,
 		.hw_free   = pcm_hw_free,
 		.prepare   = playback_prepare,
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index bacf9b860f3f..b7f6eda09f9f 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -325,7 +325,6 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
 	static const struct snd_pcm_ops capture_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_capture_prepare,
@@ -336,7 +335,6 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_playback_prepare,
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index a52a4344ec6f..f978cc2fed7d 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -365,7 +365,6 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
 	static const struct snd_pcm_ops pcm_capture_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_capture_prepare,
@@ -376,7 +375,6 @@ int snd_ff_create_pcm_devices(struct snd_ff *ff)
 	static const struct snd_pcm_ops pcm_playback_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_playback_prepare,
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 8e60d22acbcc..980580dfbb39 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -372,7 +372,6 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
 	static const struct snd_pcm_ops capture_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_capture_prepare,
@@ -383,7 +382,6 @@ int snd_efw_create_pcm_devices(struct snd_efw *efw)
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_playback_prepare,
diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index 214f77b0e8b7..6655af53b367 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -441,7 +441,6 @@ static int isight_create_pcm(struct isight *isight)
 	static const struct snd_pcm_ops ops = {
 		.open      = isight_open,
 		.close     = isight_close,
-		.ioctl     = snd_pcm_lib_ioctl,
 		.hw_params = isight_hw_params,
 		.hw_free   = isight_hw_free,
 		.prepare   = isight_prepare,
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 931978eb30c9..2d41a1a4052c 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -340,7 +340,6 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 	static const struct snd_pcm_ops capture_ops = {
 		.open      = pcm_open,
 		.close     = pcm_close,
-		.ioctl     = snd_pcm_lib_ioctl,
 		.hw_params = pcm_hw_params,
 		.hw_free   = pcm_hw_free,
 		.prepare   = capture_prepare,
@@ -351,7 +350,6 @@ int snd_motu_create_pcm_devices(struct snd_motu *motu)
 	static const struct snd_pcm_ops playback_ops = {
 		.open      = pcm_open,
 		.close     = pcm_close,
-		.ioctl     = snd_pcm_lib_ioctl,
 		.hw_params = pcm_hw_params,
 		.hw_free   = pcm_hw_free,
 		.prepare   = playback_prepare,
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 974e53bbae10..2dfa7e179cb6 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -411,7 +411,6 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 	static const struct snd_pcm_ops capture_ops = {
 		.open      = pcm_open,
 		.close     = pcm_close,
-		.ioctl     = snd_pcm_lib_ioctl,
 		.hw_params = pcm_capture_hw_params,
 		.hw_free   = pcm_capture_hw_free,
 		.prepare   = pcm_capture_prepare,
@@ -422,7 +421,6 @@ int snd_oxfw_create_pcm(struct snd_oxfw *oxfw)
 	static const struct snd_pcm_ops playback_ops = {
 		.open      = pcm_open,
 		.close     = pcm_close,
-		.ioctl     = snd_pcm_lib_ioctl,
 		.hw_params = pcm_playback_hw_params,
 		.hw_free   = pcm_playback_hw_free,
 		.prepare   = pcm_playback_prepare,
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 92551ca3460c..36c1353f2494 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -254,7 +254,6 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 	static const struct snd_pcm_ops capture_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_capture_prepare,
@@ -265,7 +264,6 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 	static const struct snd_pcm_ops playback_ops = {
 		.open		= pcm_open,
 		.close		= pcm_close,
-		.ioctl		= snd_pcm_lib_ioctl,
 		.hw_params	= pcm_hw_params,
 		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_playback_prepare,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
