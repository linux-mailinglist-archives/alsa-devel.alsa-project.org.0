Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574511806E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE321674;
	Tue, 10 Dec 2019 07:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE321674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959349;
	bh=7Pa0UZhcnZcQ97BFY//jtfYRdbsA+k07yK9Xa/XmPsk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vBQmJFKUmiwftGvkfZNAcHDAKdFd9dpRa2GFbUQf08MhJ7Kb0D1alLJGqumToMGGL
	 63XeqYJaIVJ+fKPbevDGUYa/6AoKxAM/BQ+8IGC761+2VH/WJYuUMnlYHEfHJAhSMn
	 wDAD/7CQSE1Y5raBh1kNvL8UUJsLtyckPli6gpfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9353F80368;
	Tue, 10 Dec 2019 07:13:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 497C0F802E8; Tue, 10 Dec 2019 07:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61944F8025F
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61944F8025F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37340B1E5
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:37 +0100
Message-Id: <20191210061145.24641-16-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 15/23] ALSA: pci: Drop superfluous ioctl PCM ops
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
 sound/pci/ad1889.c                      |  2 --
 sound/pci/ali5451/ali5451.c             |  4 ----
 sound/pci/als300.c                      |  2 --
 sound/pci/als4000.c                     |  2 --
 sound/pci/au88x0/au88x0_pcm.c           |  1 -
 sound/pci/aw2/aw2-alsa.c                |  2 --
 sound/pci/azt3328.c                     |  3 ---
 sound/pci/bt87x.c                       |  1 -
 sound/pci/ca0106/ca0106_main.c          |  8 --------
 sound/pci/cmipci.c                      |  5 -----
 sound/pci/cs4281.c                      |  2 --
 sound/pci/cs46xx/cs46xx_lib.c           | 10 ----------
 sound/pci/cs5535audio/cs5535audio_pcm.c |  2 --
 sound/pci/ctxfi/ctpcm.c                 |  2 --
 sound/pci/echoaudio/echoaudio.c         |  4 ----
 sound/pci/emu10k1/emu10k1x.c            |  2 --
 sound/pci/emu10k1/emupcm.c              |  6 ------
 sound/pci/emu10k1/p16v.c                |  2 --
 sound/pci/ens1370.c                     |  3 ---
 sound/pci/es1938.c                      |  2 --
 sound/pci/es1968.c                      |  2 --
 sound/pci/fm801.c                       |  2 --
 sound/pci/hda/hda_controller.c          |  1 -
 sound/pci/ice1712/ice1712.c             |  5 -----
 sound/pci/ice1712/ice1724.c             |  5 -----
 sound/pci/lola/lola_pcm.c               |  1 -
 sound/pci/lx6464es/lx6464es.c           |  2 --
 sound/pci/maestro3.c                    |  2 --
 sound/pci/mixart/mixart.c               |  2 --
 sound/pci/nm256/nm256.c                 |  2 --
 sound/pci/oxygen/oxygen_pcm.c           |  6 ------
 sound/pci/pcxhr/pcxhr.c                 |  1 -
 sound/pci/riptide/riptide.c             |  2 --
 sound/pci/rme32.c                       |  8 --------
 sound/pci/rme96.c                       |  4 ----
 sound/pci/sis7019.c                     |  2 --
 sound/pci/sonicvibes.c                  |  2 --
 sound/pci/ymfpci/ymfpci_main.c          |  5 -----
 38 files changed, 119 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 12c6a7975100..4b902c163fd3 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -548,7 +548,6 @@ snd_ad1889_capture_pointer(struct snd_pcm_substream *ss)
 static const struct snd_pcm_ops snd_ad1889_playback_ops = {
 	.open = snd_ad1889_playback_open,
 	.close = snd_ad1889_playback_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_ad1889_playback_prepare,
 	.trigger = snd_ad1889_playback_trigger,
 	.pointer = snd_ad1889_playback_pointer, 
@@ -557,7 +556,6 @@ static const struct snd_pcm_ops snd_ad1889_playback_ops = {
 static const struct snd_pcm_ops snd_ad1889_capture_ops = {
 	.open = snd_ad1889_capture_open,
 	.close = snd_ad1889_capture_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_ad1889_capture_prepare,
 	.trigger = snd_ad1889_capture_trigger,
 	.pointer = snd_ad1889_capture_pointer, 
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 8d8d54be331b..2cf37670e9a9 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1507,7 +1507,6 @@ static int snd_ali_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ali_playback_ops = {
 	.open =		snd_ali_playback_open,
 	.close =	snd_ali_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ali_playback_hw_params,
 	.hw_free =	snd_ali_playback_hw_free,
 	.prepare =	snd_ali_playback_prepare,
@@ -1518,7 +1517,6 @@ static const struct snd_pcm_ops snd_ali_playback_ops = {
 static const struct snd_pcm_ops snd_ali_capture_ops = {
 	.open =		snd_ali_capture_open,
 	.close =	snd_ali_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_ali_prepare,
 	.trigger =	snd_ali_trigger,
 	.pointer =	snd_ali_pointer,
@@ -1591,7 +1589,6 @@ static int snd_ali_modem_capture_open(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ali_modem_playback_ops = {
 	.open =		snd_ali_modem_playback_open,
 	.close =	snd_ali_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ali_modem_hw_params,
 	.prepare =	snd_ali_prepare,
 	.trigger =	snd_ali_trigger,
@@ -1601,7 +1598,6 @@ static const struct snd_pcm_ops snd_ali_modem_playback_ops = {
 static const struct snd_pcm_ops snd_ali_modem_capture_ops = {
 	.open =		snd_ali_modem_capture_open,
 	.close =	snd_ali_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ali_modem_hw_params,
 	.prepare =	snd_ali_prepare,
 	.trigger =	snd_ali_trigger,
diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index 0bb5a0fea23a..0fb84d1d1dbe 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -539,7 +539,6 @@ static snd_pcm_uframes_t snd_als300_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_als300_playback_ops = {
 	.open =		snd_als300_playback_open,
 	.close =	snd_als300_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_als300_playback_prepare,
 	.trigger =	snd_als300_trigger,
 	.pointer =	snd_als300_pointer,
@@ -548,7 +547,6 @@ static const struct snd_pcm_ops snd_als300_playback_ops = {
 static const struct snd_pcm_ops snd_als300_capture_ops = {
 	.open =		snd_als300_capture_open,
 	.close =	snd_als300_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_als300_capture_prepare,
 	.trigger =	snd_als300_trigger,
 	.pointer =	snd_als300_pointer,
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index ea51913ea134..ba6390e9a694 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -647,7 +647,6 @@ static int snd_als4000_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_als4000_playback_ops = {
 	.open =		snd_als4000_playback_open,
 	.close =	snd_als4000_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_als4000_playback_prepare,
 	.trigger =	snd_als4000_playback_trigger,
 	.pointer =	snd_als4000_playback_pointer
@@ -656,7 +655,6 @@ static const struct snd_pcm_ops snd_als4000_playback_ops = {
 static const struct snd_pcm_ops snd_als4000_capture_ops = {
 	.open =		snd_als4000_capture_open,
 	.close =	snd_als4000_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_als4000_capture_prepare,
 	.trigger =	snd_als4000_capture_trigger,
 	.pointer =	snd_als4000_capture_pointer
diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index 9d7436cd7b0f..787c79aba441 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -422,7 +422,6 @@ static snd_pcm_uframes_t snd_vortex_pcm_pointer(struct snd_pcm_substream *substr
 static const struct snd_pcm_ops snd_vortex_playback_ops = {
 	.open = snd_vortex_pcm_open,
 	.close = snd_vortex_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_vortex_pcm_hw_params,
 	.hw_free = snd_vortex_pcm_hw_free,
 	.prepare = snd_vortex_pcm_prepare,
diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index d68ae91650a7..7df55797c2f6 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -166,7 +166,6 @@ module_pci_driver(aw2_driver);
 static const struct snd_pcm_ops snd_aw2_playback_ops = {
 	.open = snd_aw2_pcm_playback_open,
 	.close = snd_aw2_pcm_playback_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_aw2_pcm_prepare_playback,
 	.trigger = snd_aw2_pcm_trigger_playback,
 	.pointer = snd_aw2_pcm_pointer_playback,
@@ -176,7 +175,6 @@ static const struct snd_pcm_ops snd_aw2_playback_ops = {
 static const struct snd_pcm_ops snd_aw2_capture_ops = {
 	.open = snd_aw2_pcm_capture_open,
 	.close = snd_aw2_pcm_capture_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_aw2_pcm_prepare_capture,
 	.trigger = snd_aw2_pcm_trigger_capture,
 	.pointer = snd_aw2_pcm_pointer_capture,
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 5fac2d60ba2d..1a852d893e98 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2065,7 +2065,6 @@ snd_azf3328_pcm_close(struct snd_pcm_substream *substream
 static const struct snd_pcm_ops snd_azf3328_playback_ops = {
 	.open =		snd_azf3328_pcm_playback_open,
 	.close =	snd_azf3328_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_azf3328_pcm_prepare,
 	.trigger =	snd_azf3328_pcm_trigger,
 	.pointer =	snd_azf3328_pcm_pointer
@@ -2074,7 +2073,6 @@ static const struct snd_pcm_ops snd_azf3328_playback_ops = {
 static const struct snd_pcm_ops snd_azf3328_capture_ops = {
 	.open =		snd_azf3328_pcm_capture_open,
 	.close =	snd_azf3328_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_azf3328_pcm_prepare,
 	.trigger =	snd_azf3328_pcm_trigger,
 	.pointer =	snd_azf3328_pcm_pointer
@@ -2083,7 +2081,6 @@ static const struct snd_pcm_ops snd_azf3328_capture_ops = {
 static const struct snd_pcm_ops snd_azf3328_i2s_out_ops = {
 	.open =		snd_azf3328_pcm_i2s_out_open,
 	.close =	snd_azf3328_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_azf3328_pcm_prepare,
 	.trigger =	snd_azf3328_pcm_trigger,
 	.pointer =	snd_azf3328_pcm_pointer
diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 3fe522b32426..de4af1ab87c6 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -533,7 +533,6 @@ static snd_pcm_uframes_t snd_bt87x_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_bt87x_pcm_ops = {
 	.open = snd_bt87x_pcm_open,
 	.close = snd_bt87x_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_bt87x_hw_params,
 	.hw_free = snd_bt87x_hw_free,
 	.prepare = snd_bt87x_prepare,
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index 758cb4dd4b00..9466ee9d2f42 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1068,7 +1068,6 @@ snd_ca0106_pcm_pointer_capture(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ca0106_playback_front_ops = {
 	.open =        snd_ca0106_pcm_open_playback_front,
 	.close =       snd_ca0106_pcm_close_playback,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.prepare =     snd_ca0106_pcm_prepare_playback,
 	.trigger =     snd_ca0106_pcm_trigger_playback,
 	.pointer =     snd_ca0106_pcm_pointer_playback,
@@ -1077,7 +1076,6 @@ static const struct snd_pcm_ops snd_ca0106_playback_front_ops = {
 static const struct snd_pcm_ops snd_ca0106_capture_0_ops = {
 	.open =        snd_ca0106_pcm_open_0_capture,
 	.close =       snd_ca0106_pcm_close_capture,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1086,7 +1084,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_0_ops = {
 static const struct snd_pcm_ops snd_ca0106_capture_1_ops = {
 	.open =        snd_ca0106_pcm_open_1_capture,
 	.close =       snd_ca0106_pcm_close_capture,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1095,7 +1092,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_1_ops = {
 static const struct snd_pcm_ops snd_ca0106_capture_2_ops = {
 	.open =        snd_ca0106_pcm_open_2_capture,
 	.close =       snd_ca0106_pcm_close_capture,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1104,7 +1100,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_2_ops = {
 static const struct snd_pcm_ops snd_ca0106_capture_3_ops = {
 	.open =        snd_ca0106_pcm_open_3_capture,
 	.close =       snd_ca0106_pcm_close_capture,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1113,7 +1108,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_3_ops = {
 static const struct snd_pcm_ops snd_ca0106_playback_center_lfe_ops = {
         .open =         snd_ca0106_pcm_open_playback_center_lfe,
         .close =        snd_ca0106_pcm_close_playback,
-        .ioctl =        snd_pcm_lib_ioctl,
         .prepare =      snd_ca0106_pcm_prepare_playback,     
         .trigger =      snd_ca0106_pcm_trigger_playback,  
         .pointer =      snd_ca0106_pcm_pointer_playback, 
@@ -1122,7 +1116,6 @@ static const struct snd_pcm_ops snd_ca0106_playback_center_lfe_ops = {
 static const struct snd_pcm_ops snd_ca0106_playback_unknown_ops = {
         .open =         snd_ca0106_pcm_open_playback_unknown,
         .close =        snd_ca0106_pcm_close_playback,
-        .ioctl =        snd_pcm_lib_ioctl,
         .prepare =      snd_ca0106_pcm_prepare_playback,     
         .trigger =      snd_ca0106_pcm_trigger_playback,  
         .pointer =      snd_ca0106_pcm_pointer_playback, 
@@ -1131,7 +1124,6 @@ static const struct snd_pcm_ops snd_ca0106_playback_unknown_ops = {
 static const struct snd_pcm_ops snd_ca0106_playback_rear_ops = {
         .open =         snd_ca0106_pcm_open_playback_rear,
         .close =        snd_ca0106_pcm_close_playback,
-        .ioctl =        snd_pcm_lib_ioctl,
         .prepare =      snd_ca0106_pcm_prepare_playback,     
         .trigger =      snd_ca0106_pcm_trigger_playback,  
         .pointer =      snd_ca0106_pcm_pointer_playback, 
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 1eac076f4692..0e0f528805bf 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1817,7 +1817,6 @@ static int snd_cmipci_capture_spdif_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cmipci_playback_ops = {
 	.open =		snd_cmipci_playback_open,
 	.close =	snd_cmipci_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_free =	snd_cmipci_playback_hw_free,
 	.prepare =	snd_cmipci_playback_prepare,
 	.trigger =	snd_cmipci_playback_trigger,
@@ -1827,7 +1826,6 @@ static const struct snd_pcm_ops snd_cmipci_playback_ops = {
 static const struct snd_pcm_ops snd_cmipci_capture_ops = {
 	.open =		snd_cmipci_capture_open,
 	.close =	snd_cmipci_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_cmipci_capture_prepare,
 	.trigger =	snd_cmipci_capture_trigger,
 	.pointer =	snd_cmipci_capture_pointer,
@@ -1836,7 +1834,6 @@ static const struct snd_pcm_ops snd_cmipci_capture_ops = {
 static const struct snd_pcm_ops snd_cmipci_playback2_ops = {
 	.open =		snd_cmipci_playback2_open,
 	.close =	snd_cmipci_playback2_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_cmipci_playback2_hw_params,
 	.hw_free =	snd_cmipci_playback2_hw_free,
 	.prepare =	snd_cmipci_capture_prepare,	/* channel B */
@@ -1847,7 +1844,6 @@ static const struct snd_pcm_ops snd_cmipci_playback2_ops = {
 static const struct snd_pcm_ops snd_cmipci_playback_spdif_ops = {
 	.open =		snd_cmipci_playback_spdif_open,
 	.close =	snd_cmipci_playback_spdif_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_free =	snd_cmipci_playback_hw_free,
 	.prepare =	snd_cmipci_playback_spdif_prepare,	/* set up rate */
 	.trigger =	snd_cmipci_playback_trigger,
@@ -1857,7 +1853,6 @@ static const struct snd_pcm_ops snd_cmipci_playback_spdif_ops = {
 static const struct snd_pcm_ops snd_cmipci_capture_spdif_ops = {
 	.open =		snd_cmipci_capture_spdif_open,
 	.close =	snd_cmipci_capture_spdif_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_free =	snd_cmipci_capture_spdif_hw_free,
 	.prepare =	snd_cmipci_capture_spdif_prepare,
 	.trigger =	snd_cmipci_capture_trigger,
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index ea665d42107e..0dcb2d15b560 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -927,7 +927,6 @@ static int snd_cs4281_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cs4281_playback_ops = {
 	.open =		snd_cs4281_playback_open,
 	.close =	snd_cs4281_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_cs4281_playback_prepare,
 	.trigger =	snd_cs4281_trigger,
 	.pointer =	snd_cs4281_pointer,
@@ -936,7 +935,6 @@ static const struct snd_pcm_ops snd_cs4281_playback_ops = {
 static const struct snd_pcm_ops snd_cs4281_capture_ops = {
 	.open =		snd_cs4281_capture_open,
 	.close =	snd_cs4281_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_cs4281_capture_prepare,
 	.trigger =	snd_cs4281_trigger,
 	.pointer =	snd_cs4281_pointer,
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 102a62965ac1..1192115b71ef 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1645,7 +1645,6 @@ static int snd_cs46xx_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cs46xx_playback_rear_ops = {
 	.open =			snd_cs46xx_playback_open_rear,
 	.close =		snd_cs46xx_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1656,7 +1655,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_rear_ops = {
 static const struct snd_pcm_ops snd_cs46xx_playback_indirect_rear_ops = {
 	.open =			snd_cs46xx_playback_open_rear,
 	.close =		snd_cs46xx_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1668,7 +1666,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_indirect_rear_ops = {
 static const struct snd_pcm_ops snd_cs46xx_playback_clfe_ops = {
 	.open =			snd_cs46xx_playback_open_clfe,
 	.close =		snd_cs46xx_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1679,7 +1676,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_clfe_ops = {
 static const struct snd_pcm_ops snd_cs46xx_playback_indirect_clfe_ops = {
 	.open =			snd_cs46xx_playback_open_clfe,
 	.close =		snd_cs46xx_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1691,7 +1687,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_indirect_clfe_ops = {
 static const struct snd_pcm_ops snd_cs46xx_playback_iec958_ops = {
 	.open =			snd_cs46xx_playback_open_iec958,
 	.close =		snd_cs46xx_playback_close_iec958,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1702,7 +1697,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_iec958_ops = {
 static const struct snd_pcm_ops snd_cs46xx_playback_indirect_iec958_ops = {
 	.open =			snd_cs46xx_playback_open_iec958,
 	.close =		snd_cs46xx_playback_close_iec958,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1716,7 +1710,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_indirect_iec958_ops = {
 static const struct snd_pcm_ops snd_cs46xx_playback_ops = {
 	.open =			snd_cs46xx_playback_open,
 	.close =		snd_cs46xx_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1727,7 +1720,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_ops = {
 static const struct snd_pcm_ops snd_cs46xx_playback_indirect_ops = {
 	.open =			snd_cs46xx_playback_open,
 	.close =		snd_cs46xx_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_playback_hw_params,
 	.hw_free =		snd_cs46xx_playback_hw_free,
 	.prepare =		snd_cs46xx_playback_prepare,
@@ -1739,7 +1731,6 @@ static const struct snd_pcm_ops snd_cs46xx_playback_indirect_ops = {
 static const struct snd_pcm_ops snd_cs46xx_capture_ops = {
 	.open =			snd_cs46xx_capture_open,
 	.close =		snd_cs46xx_capture_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_capture_hw_params,
 	.hw_free =		snd_cs46xx_capture_hw_free,
 	.prepare =		snd_cs46xx_capture_prepare,
@@ -1750,7 +1741,6 @@ static const struct snd_pcm_ops snd_cs46xx_capture_ops = {
 static const struct snd_pcm_ops snd_cs46xx_capture_indirect_ops = {
 	.open =			snd_cs46xx_capture_open,
 	.close =		snd_cs46xx_capture_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_cs46xx_capture_hw_params,
 	.hw_free =		snd_cs46xx_capture_hw_free,
 	.prepare =		snd_cs46xx_capture_prepare,
diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 0b2a23c6d277..4032b89b1fc1 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -366,7 +366,6 @@ static int snd_cs5535audio_capture_prepare(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_cs5535audio_playback_ops = {
 	.open =		snd_cs5535audio_playback_open,
 	.close =	snd_cs5535audio_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_cs5535audio_hw_params,
 	.hw_free =	snd_cs5535audio_hw_free,
 	.prepare =	snd_cs5535audio_playback_prepare,
@@ -377,7 +376,6 @@ static const struct snd_pcm_ops snd_cs5535audio_playback_ops = {
 static const struct snd_pcm_ops snd_cs5535audio_capture_ops = {
 	.open =		snd_cs5535audio_capture_open,
 	.close =	snd_cs5535audio_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_cs5535audio_hw_params,
 	.hw_free =	snd_cs5535audio_hw_free,
 	.prepare =	snd_cs5535audio_capture_prepare,
diff --git a/sound/pci/ctxfi/ctpcm.c b/sound/pci/ctxfi/ctpcm.c
index 5ee2316827d8..6ee6a9675ca5 100644
--- a/sound/pci/ctxfi/ctpcm.c
+++ b/sound/pci/ctxfi/ctpcm.c
@@ -367,7 +367,6 @@ ct_pcm_capture_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops ct_pcm_playback_ops = {
 	.open	 	= ct_pcm_playback_open,
 	.close		= ct_pcm_playback_close,
-	.ioctl		= snd_pcm_lib_ioctl,
 	.hw_params	= ct_pcm_hw_params,
 	.hw_free	= ct_pcm_hw_free,
 	.prepare	= ct_pcm_playback_prepare,
@@ -379,7 +378,6 @@ static const struct snd_pcm_ops ct_pcm_playback_ops = {
 static const struct snd_pcm_ops ct_pcm_capture_ops = {
 	.open	 	= ct_pcm_capture_open,
 	.close		= ct_pcm_capture_close,
-	.ioctl		= snd_pcm_lib_ioctl,
 	.hw_params	= ct_pcm_hw_params,
 	.hw_free	= ct_pcm_hw_free,
 	.prepare	= ct_pcm_capture_prepare,
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index f8a4a8f6982e..bfc3ffffb917 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -807,7 +807,6 @@ static snd_pcm_uframes_t pcm_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops analog_playback_ops = {
 	.open = pcm_analog_out_open,
 	.close = pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = pcm_analog_out_hw_params,
 	.hw_free = pcm_hw_free,
 	.prepare = pcm_prepare,
@@ -817,7 +816,6 @@ static const struct snd_pcm_ops analog_playback_ops = {
 static const struct snd_pcm_ops analog_capture_ops = {
 	.open = pcm_analog_in_open,
 	.close = pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = pcm_analog_in_hw_params,
 	.hw_free = pcm_hw_free,
 	.prepare = pcm_prepare,
@@ -829,7 +827,6 @@ static const struct snd_pcm_ops analog_capture_ops = {
 static const struct snd_pcm_ops digital_playback_ops = {
 	.open = pcm_digital_out_open,
 	.close = pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = pcm_digital_out_hw_params,
 	.hw_free = pcm_hw_free,
 	.prepare = pcm_prepare,
@@ -840,7 +837,6 @@ static const struct snd_pcm_ops digital_playback_ops = {
 static const struct snd_pcm_ops digital_capture_ops = {
 	.open = pcm_digital_in_open,
 	.close = pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = pcm_digital_in_hw_params,
 	.hw_free = pcm_hw_free,
 	.prepare = pcm_prepare,
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index ef34fe711813..19fc74e94727 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -536,7 +536,6 @@ snd_emu10k1x_pcm_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_emu10k1x_playback_ops = {
 	.open =        snd_emu10k1x_playback_open,
 	.close =       snd_emu10k1x_playback_close,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.hw_params =   snd_emu10k1x_pcm_hw_params,
 	.hw_free =     snd_emu10k1x_pcm_hw_free,
 	.prepare =     snd_emu10k1x_pcm_prepare,
@@ -681,7 +680,6 @@ snd_emu10k1x_pcm_pointer_capture(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_emu10k1x_capture_ops = {
 	.open =        snd_emu10k1x_pcm_open_capture,
 	.close =       snd_emu10k1x_pcm_close_capture,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.hw_params =   snd_emu10k1x_pcm_hw_params_capture,
 	.hw_free =     snd_emu10k1x_pcm_hw_free_capture,
 	.prepare =     snd_emu10k1x_pcm_prepare_capture,
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 3a68148f6ecf..b934c6ac52dd 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1349,7 +1349,6 @@ static int snd_emu10k1_capture_efx_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_emu10k1_playback_ops = {
 	.open =			snd_emu10k1_playback_open,
 	.close =		snd_emu10k1_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_emu10k1_playback_hw_params,
 	.hw_free =		snd_emu10k1_playback_hw_free,
 	.prepare =		snd_emu10k1_playback_prepare,
@@ -1360,7 +1359,6 @@ static const struct snd_pcm_ops snd_emu10k1_playback_ops = {
 static const struct snd_pcm_ops snd_emu10k1_capture_ops = {
 	.open =			snd_emu10k1_capture_open,
 	.close =		snd_emu10k1_capture_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.prepare =		snd_emu10k1_capture_prepare,
 	.trigger =		snd_emu10k1_capture_trigger,
 	.pointer =		snd_emu10k1_capture_pointer,
@@ -1370,7 +1368,6 @@ static const struct snd_pcm_ops snd_emu10k1_capture_ops = {
 static const struct snd_pcm_ops snd_emu10k1_efx_playback_ops = {
 	.open =			snd_emu10k1_efx_playback_open,
 	.close =		snd_emu10k1_efx_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_emu10k1_playback_hw_params,
 	.hw_free =		snd_emu10k1_efx_playback_hw_free,
 	.prepare =		snd_emu10k1_efx_playback_prepare,
@@ -1440,7 +1437,6 @@ int snd_emu10k1_pcm_multi(struct snd_emu10k1 *emu, int device)
 static const struct snd_pcm_ops snd_emu10k1_capture_mic_ops = {
 	.open =			snd_emu10k1_capture_mic_open,
 	.close =		snd_emu10k1_capture_mic_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.prepare =		snd_emu10k1_capture_prepare,
 	.trigger =		snd_emu10k1_capture_trigger,
 	.pointer =		snd_emu10k1_capture_pointer,
@@ -1534,7 +1530,6 @@ static const struct snd_kcontrol_new snd_emu10k1_pcm_efx_voices_mask = {
 static const struct snd_pcm_ops snd_emu10k1_capture_efx_ops = {
 	.open =			snd_emu10k1_capture_efx_open,
 	.close =		snd_emu10k1_capture_efx_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.prepare =		snd_emu10k1_capture_prepare,
 	.trigger =		snd_emu10k1_capture_trigger,
 	.pointer =		snd_emu10k1_capture_pointer,
@@ -1767,7 +1762,6 @@ static int snd_emu10k1_fx8010_playback_close(struct snd_pcm_substream *substream
 static const struct snd_pcm_ops snd_emu10k1_fx8010_playback_ops = {
 	.open =			snd_emu10k1_fx8010_playback_open,
 	.close =		snd_emu10k1_fx8010_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_free =		snd_emu10k1_fx8010_playback_hw_free,
 	.prepare =		snd_emu10k1_fx8010_playback_prepare,
 	.trigger =		snd_emu10k1_fx8010_playback_trigger,
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index 2263db4c954b..1cdbad494e13 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -552,7 +552,6 @@ snd_p16v_pcm_pointer_capture(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_p16v_playback_front_ops = {
 	.open =        snd_p16v_pcm_open_playback_front,
 	.close =       snd_p16v_pcm_close_playback,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.prepare =     snd_p16v_pcm_prepare_playback,
 	.trigger =     snd_p16v_pcm_trigger_playback,
 	.pointer =     snd_p16v_pcm_pointer_playback,
@@ -561,7 +560,6 @@ static const struct snd_pcm_ops snd_p16v_playback_front_ops = {
 static const struct snd_pcm_ops snd_p16v_capture_ops = {
 	.open =        snd_p16v_pcm_open_capture,
 	.close =       snd_p16v_pcm_close_capture,
-	.ioctl =       snd_pcm_lib_ioctl,
 	.prepare =     snd_p16v_pcm_prepare_capture,
 	.trigger =     snd_p16v_pcm_trigger_capture,
 	.pointer =     snd_p16v_pcm_pointer_capture,
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 19d8238e130c..f69555c95263 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1204,7 +1204,6 @@ static int snd_ensoniq_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ensoniq_playback1_ops = {
 	.open =		snd_ensoniq_playback1_open,
 	.close =	snd_ensoniq_playback1_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_ensoniq_playback1_prepare,
 	.trigger =	snd_ensoniq_trigger,
 	.pointer =	snd_ensoniq_playback1_pointer,
@@ -1213,7 +1212,6 @@ static const struct snd_pcm_ops snd_ensoniq_playback1_ops = {
 static const struct snd_pcm_ops snd_ensoniq_playback2_ops = {
 	.open =		snd_ensoniq_playback2_open,
 	.close =	snd_ensoniq_playback2_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_ensoniq_playback2_prepare,
 	.trigger =	snd_ensoniq_trigger,
 	.pointer =	snd_ensoniq_playback2_pointer,
@@ -1222,7 +1220,6 @@ static const struct snd_pcm_ops snd_ensoniq_playback2_ops = {
 static const struct snd_pcm_ops snd_ensoniq_capture_ops = {
 	.open =		snd_ensoniq_capture_open,
 	.close =	snd_ensoniq_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_ensoniq_capture_prepare,
 	.trigger =	snd_ensoniq_trigger,
 	.pointer =	snd_ensoniq_capture_pointer,
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 95d562fff06c..ae405bc38c65 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -977,7 +977,6 @@ static int snd_es1938_playback_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_es1938_playback_ops = {
 	.open =		snd_es1938_playback_open,
 	.close =	snd_es1938_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_es1938_playback_prepare,
 	.trigger =	snd_es1938_playback_trigger,
 	.pointer =	snd_es1938_playback_pointer,
@@ -986,7 +985,6 @@ static const struct snd_pcm_ops snd_es1938_playback_ops = {
 static const struct snd_pcm_ops snd_es1938_capture_ops = {
 	.open =		snd_es1938_capture_open,
 	.close =	snd_es1938_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_es1938_capture_prepare,
 	.trigger =	snd_es1938_capture_trigger,
 	.pointer =	snd_es1938_capture_pointer,
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 7017ca9dea4a..4f5063ebce89 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -1664,7 +1664,6 @@ static int snd_es1968_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_es1968_playback_ops = {
 	.open =		snd_es1968_playback_open,
 	.close =	snd_es1968_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_es1968_hw_params,
 	.hw_free =	snd_es1968_hw_free,
 	.prepare =	snd_es1968_pcm_prepare,
@@ -1675,7 +1674,6 @@ static const struct snd_pcm_ops snd_es1968_playback_ops = {
 static const struct snd_pcm_ops snd_es1968_capture_ops = {
 	.open =		snd_es1968_capture_open,
 	.close =	snd_es1968_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_es1968_hw_params,
 	.hw_free =	snd_es1968_hw_free,
 	.prepare =	snd_es1968_pcm_prepare,
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 707173254c55..3ea10c972682 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -673,7 +673,6 @@ static int snd_fm801_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_fm801_playback_ops = {
 	.open =		snd_fm801_playback_open,
 	.close =	snd_fm801_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_fm801_playback_prepare,
 	.trigger =	snd_fm801_playback_trigger,
 	.pointer =	snd_fm801_playback_pointer,
@@ -682,7 +681,6 @@ static const struct snd_pcm_ops snd_fm801_playback_ops = {
 static const struct snd_pcm_ops snd_fm801_capture_ops = {
 	.open =		snd_fm801_capture_open,
 	.close =	snd_fm801_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_fm801_capture_prepare,
 	.trigger =	snd_fm801_capture_trigger,
 	.pointer =	snd_fm801_capture_pointer,
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index eb0bb2265685..10cd3b9b3d0a 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -689,7 +689,6 @@ static int azx_pcm_mmap(struct snd_pcm_substream *substream,
 static const struct snd_pcm_ops azx_pcm_ops = {
 	.open = azx_pcm_open,
 	.close = azx_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = azx_pcm_hw_params,
 	.hw_free = azx_pcm_hw_free,
 	.prepare = azx_pcm_prepare,
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 1783584e90c5..d6e55bf0df16 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -821,7 +821,6 @@ static int snd_ice1712_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ice1712_playback_ops = {
 	.open =		snd_ice1712_playback_open,
 	.close =	snd_ice1712_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_ice1712_playback_prepare,
 	.trigger =	snd_ice1712_playback_trigger,
 	.pointer =	snd_ice1712_playback_pointer,
@@ -830,7 +829,6 @@ static const struct snd_pcm_ops snd_ice1712_playback_ops = {
 static const struct snd_pcm_ops snd_ice1712_playback_ds_ops = {
 	.open =		snd_ice1712_playback_ds_open,
 	.close =	snd_ice1712_playback_ds_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_ice1712_playback_ds_prepare,
 	.trigger =	snd_ice1712_playback_ds_trigger,
 	.pointer =	snd_ice1712_playback_ds_pointer,
@@ -839,7 +837,6 @@ static const struct snd_pcm_ops snd_ice1712_playback_ds_ops = {
 static const struct snd_pcm_ops snd_ice1712_capture_ops = {
 	.open =		snd_ice1712_capture_open,
 	.close =	snd_ice1712_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_ice1712_capture_prepare,
 	.trigger =	snd_ice1712_capture_trigger,
 	.pointer =	snd_ice1712_capture_pointer,
@@ -1196,7 +1193,6 @@ static int snd_ice1712_capture_pro_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ice1712_playback_pro_ops = {
 	.open =		snd_ice1712_playback_pro_open,
 	.close =	snd_ice1712_playback_pro_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ice1712_playback_pro_hw_params,
 	.prepare =	snd_ice1712_playback_pro_prepare,
 	.trigger =	snd_ice1712_pro_trigger,
@@ -1206,7 +1202,6 @@ static const struct snd_pcm_ops snd_ice1712_playback_pro_ops = {
 static const struct snd_pcm_ops snd_ice1712_capture_pro_ops = {
 	.open =		snd_ice1712_capture_pro_open,
 	.close =	snd_ice1712_capture_pro_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ice1712_capture_pro_hw_params,
 	.prepare =	snd_ice1712_capture_pro_prepare,
 	.trigger =	snd_ice1712_pro_trigger,
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index ba992ce47282..d5590a82e7fd 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -1096,7 +1096,6 @@ static int snd_vt1724_capture_pro_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_vt1724_playback_pro_ops = {
 	.open =		snd_vt1724_playback_pro_open,
 	.close =	snd_vt1724_playback_pro_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_vt1724_pcm_hw_params,
 	.hw_free =	snd_vt1724_pcm_hw_free,
 	.prepare =	snd_vt1724_playback_pro_prepare,
@@ -1107,7 +1106,6 @@ static const struct snd_pcm_ops snd_vt1724_playback_pro_ops = {
 static const struct snd_pcm_ops snd_vt1724_capture_pro_ops = {
 	.open =		snd_vt1724_capture_pro_open,
 	.close =	snd_vt1724_capture_pro_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_vt1724_pcm_hw_params,
 	.hw_free =	snd_vt1724_pcm_hw_free,
 	.prepare =	snd_vt1724_pcm_prepare,
@@ -1274,7 +1272,6 @@ static int snd_vt1724_capture_spdif_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_vt1724_playback_spdif_ops = {
 	.open =		snd_vt1724_playback_spdif_open,
 	.close =	snd_vt1724_playback_spdif_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_vt1724_pcm_hw_params,
 	.hw_free =	snd_vt1724_pcm_hw_free,
 	.prepare =	snd_vt1724_playback_spdif_prepare,
@@ -1285,7 +1282,6 @@ static const struct snd_pcm_ops snd_vt1724_playback_spdif_ops = {
 static const struct snd_pcm_ops snd_vt1724_capture_spdif_ops = {
 	.open =		snd_vt1724_capture_spdif_open,
 	.close =	snd_vt1724_capture_spdif_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_vt1724_pcm_hw_params,
 	.hw_free =	snd_vt1724_pcm_hw_free,
 	.prepare =	snd_vt1724_pcm_prepare,
@@ -1418,7 +1414,6 @@ static int snd_vt1724_playback_indep_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_vt1724_playback_indep_ops = {
 	.open =		snd_vt1724_playback_indep_open,
 	.close =	snd_vt1724_playback_indep_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_vt1724_pcm_hw_params,
 	.hw_free =	snd_vt1724_pcm_hw_free,
 	.prepare =	snd_vt1724_playback_indep_prepare,
diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index a01a06896084..f647c7ed00c4 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -575,7 +575,6 @@ void lola_pcm_update(struct lola *chip, struct lola_pcm *pcm, unsigned int bits)
 static const struct snd_pcm_ops lola_pcm_ops = {
 	.open = lola_pcm_open,
 	.close = lola_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = lola_pcm_hw_params,
 	.hw_free = lola_pcm_hw_free,
 	.prepare = lola_pcm_prepare,
diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index a74d8eade3e2..0ac078d1b27a 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -791,7 +791,6 @@ static int lx_init_dsp(struct lx6464es *chip)
 static const struct snd_pcm_ops lx_ops_playback = {
 	.open      = lx_pcm_open,
 	.close     = lx_pcm_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.prepare   = lx_pcm_prepare,
 	.hw_params = lx_pcm_hw_params_playback,
 	.hw_free   = lx_pcm_hw_free,
@@ -802,7 +801,6 @@ static const struct snd_pcm_ops lx_ops_playback = {
 static const struct snd_pcm_ops lx_ops_capture = {
 	.open      = lx_pcm_open,
 	.close     = lx_pcm_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.prepare   = lx_pcm_prepare,
 	.hw_params = lx_pcm_hw_params_capture,
 	.hw_free   = lx_pcm_hw_free,
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index f4076e2a6400..501f1871f776 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1818,7 +1818,6 @@ snd_m3_capture_close(struct snd_pcm_substream *subs)
 static const struct snd_pcm_ops snd_m3_playback_ops = {
 	.open =		snd_m3_playback_open,
 	.close =	snd_m3_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_m3_pcm_hw_params,
 	.hw_free =	snd_m3_pcm_hw_free,
 	.prepare =	snd_m3_pcm_prepare,
@@ -1829,7 +1828,6 @@ static const struct snd_pcm_ops snd_m3_playback_ops = {
 static const struct snd_pcm_ops snd_m3_capture_ops = {
 	.open =		snd_m3_capture_open,
 	.close =	snd_m3_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_m3_pcm_hw_params,
 	.hw_free =	snd_m3_pcm_hw_free,
 	.prepare =	snd_m3_pcm_prepare,
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index 79a57f3761c5..05e2c8ea8480 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -909,7 +909,6 @@ static snd_pcm_uframes_t snd_mixart_stream_pointer(struct snd_pcm_substream *sub
 static const struct snd_pcm_ops snd_mixart_playback_ops = {
 	.open      = snd_mixart_playback_open,
 	.close     = snd_mixart_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.prepare   = snd_mixart_prepare,
 	.hw_params = snd_mixart_hw_params,
 	.hw_free   = snd_mixart_hw_free,
@@ -920,7 +919,6 @@ static const struct snd_pcm_ops snd_mixart_playback_ops = {
 static const struct snd_pcm_ops snd_mixart_capture_ops = {
 	.open      = snd_mixart_capture_open,
 	.close     = snd_mixart_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.prepare   = snd_mixart_prepare,
 	.hw_params = snd_mixart_hw_params,
 	.hw_free   = snd_mixart_hw_free,
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 1201c9c95660..02767f33deb7 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -906,7 +906,6 @@ snd_nm256_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_nm256_playback_ops = {
 	.open =		snd_nm256_playback_open,
 	.close =	snd_nm256_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_nm256_pcm_hw_params,
 	.prepare =	snd_nm256_pcm_prepare,
 	.trigger =	snd_nm256_playback_trigger,
@@ -922,7 +921,6 @@ static const struct snd_pcm_ops snd_nm256_playback_ops = {
 static const struct snd_pcm_ops snd_nm256_capture_ops = {
 	.open =		snd_nm256_capture_open,
 	.close =	snd_nm256_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_nm256_pcm_hw_params,
 	.prepare =	snd_nm256_pcm_prepare,
 	.trigger =	snd_nm256_capture_trigger,
diff --git a/sound/pci/oxygen/oxygen_pcm.c b/sound/pci/oxygen/oxygen_pcm.c
index 4c2bf6952e21..75b25ecf83a9 100644
--- a/sound/pci/oxygen/oxygen_pcm.c
+++ b/sound/pci/oxygen/oxygen_pcm.c
@@ -616,7 +616,6 @@ static snd_pcm_uframes_t oxygen_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops oxygen_rec_a_ops = {
 	.open      = oxygen_rec_a_open,
 	.close     = oxygen_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.hw_params = oxygen_rec_a_hw_params,
 	.hw_free   = oxygen_hw_free,
 	.prepare   = oxygen_prepare,
@@ -627,7 +626,6 @@ static const struct snd_pcm_ops oxygen_rec_a_ops = {
 static const struct snd_pcm_ops oxygen_rec_b_ops = {
 	.open      = oxygen_rec_b_open,
 	.close     = oxygen_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.hw_params = oxygen_rec_b_hw_params,
 	.hw_free   = oxygen_hw_free,
 	.prepare   = oxygen_prepare,
@@ -638,7 +636,6 @@ static const struct snd_pcm_ops oxygen_rec_b_ops = {
 static const struct snd_pcm_ops oxygen_rec_c_ops = {
 	.open      = oxygen_rec_c_open,
 	.close     = oxygen_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.hw_params = oxygen_rec_c_hw_params,
 	.hw_free   = oxygen_hw_free,
 	.prepare   = oxygen_prepare,
@@ -649,7 +646,6 @@ static const struct snd_pcm_ops oxygen_rec_c_ops = {
 static const struct snd_pcm_ops oxygen_spdif_ops = {
 	.open      = oxygen_spdif_open,
 	.close     = oxygen_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.hw_params = oxygen_spdif_hw_params,
 	.hw_free   = oxygen_spdif_hw_free,
 	.prepare   = oxygen_prepare,
@@ -660,7 +656,6 @@ static const struct snd_pcm_ops oxygen_spdif_ops = {
 static const struct snd_pcm_ops oxygen_multich_ops = {
 	.open      = oxygen_multich_open,
 	.close     = oxygen_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.hw_params = oxygen_multich_hw_params,
 	.hw_free   = oxygen_hw_free,
 	.prepare   = oxygen_prepare,
@@ -671,7 +666,6 @@ static const struct snd_pcm_ops oxygen_multich_ops = {
 static const struct snd_pcm_ops oxygen_ac97_ops = {
 	.open      = oxygen_ac97_open,
 	.close     = oxygen_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.hw_params = oxygen_hw_params,
 	.hw_free   = oxygen_hw_free,
 	.prepare   = oxygen_prepare,
diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index 72c0d1552f30..e691c372b960 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1120,7 +1120,6 @@ static snd_pcm_uframes_t pcxhr_stream_pointer(struct snd_pcm_substream *subs)
 static const struct snd_pcm_ops pcxhr_ops = {
 	.open      = pcxhr_open,
 	.close     = pcxhr_close,
-	.ioctl     = snd_pcm_lib_ioctl,
 	.prepare   = pcxhr_prepare,
 	.hw_params = pcxhr_hw_params,
 	.trigger   = pcxhr_trigger,
diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index b855de52e198..be0283f8bda0 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1656,7 +1656,6 @@ static int snd_riptide_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_riptide_playback_ops = {
 	.open = snd_riptide_playback_open,
 	.close = snd_riptide_playback_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_riptide_hw_params,
 	.hw_free = snd_riptide_hw_free,
 	.prepare = snd_riptide_prepare,
@@ -1666,7 +1665,6 @@ static const struct snd_pcm_ops snd_riptide_playback_ops = {
 static const struct snd_pcm_ops snd_riptide_capture_ops = {
 	.open = snd_riptide_capture_open,
 	.close = snd_riptide_capture_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = snd_riptide_hw_params,
 	.hw_free = snd_riptide_hw_free,
 	.prepare = snd_riptide_prepare,
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index aab47e5d96dc..849eede15f8e 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1177,7 +1177,6 @@ snd_rme32_capture_fd_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_rme32_playback_spdif_ops = {
 	.open =		snd_rme32_playback_spdif_open,
 	.close =	snd_rme32_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_playback_hw_params,
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
@@ -1191,7 +1190,6 @@ static const struct snd_pcm_ops snd_rme32_playback_spdif_ops = {
 static const struct snd_pcm_ops snd_rme32_capture_spdif_ops = {
 	.open =		snd_rme32_capture_spdif_open,
 	.close =	snd_rme32_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_capture_hw_params,
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
@@ -1204,7 +1202,6 @@ static const struct snd_pcm_ops snd_rme32_capture_spdif_ops = {
 static const struct snd_pcm_ops snd_rme32_playback_adat_ops = {
 	.open =		snd_rme32_playback_adat_open,
 	.close =	snd_rme32_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_playback_hw_params,
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
@@ -1218,7 +1215,6 @@ static const struct snd_pcm_ops snd_rme32_playback_adat_ops = {
 static const struct snd_pcm_ops snd_rme32_capture_adat_ops = {
 	.open =		snd_rme32_capture_adat_open,
 	.close =	snd_rme32_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_capture_hw_params,
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
@@ -1232,7 +1228,6 @@ static const struct snd_pcm_ops snd_rme32_capture_adat_ops = {
 static const struct snd_pcm_ops snd_rme32_playback_spdif_fd_ops = {
 	.open =		snd_rme32_playback_spdif_open,
 	.close =	snd_rme32_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_playback_hw_params,
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
@@ -1243,7 +1238,6 @@ static const struct snd_pcm_ops snd_rme32_playback_spdif_fd_ops = {
 static const struct snd_pcm_ops snd_rme32_capture_spdif_fd_ops = {
 	.open =		snd_rme32_capture_spdif_open,
 	.close =	snd_rme32_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_capture_hw_params,
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
@@ -1254,7 +1248,6 @@ static const struct snd_pcm_ops snd_rme32_capture_spdif_fd_ops = {
 static const struct snd_pcm_ops snd_rme32_playback_adat_fd_ops = {
 	.open =		snd_rme32_playback_adat_open,
 	.close =	snd_rme32_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_playback_hw_params,
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
@@ -1265,7 +1258,6 @@ static const struct snd_pcm_ops snd_rme32_playback_adat_fd_ops = {
 static const struct snd_pcm_ops snd_rme32_capture_adat_fd_ops = {
 	.open =		snd_rme32_capture_adat_open,
 	.close =	snd_rme32_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_capture_hw_params,
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 64ab55772eae..f52195791a8b 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1508,7 +1508,6 @@ snd_rme96_capture_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_rme96_playback_spdif_ops = {
 	.open =		snd_rme96_playback_spdif_open,
 	.close =	snd_rme96_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme96_playback_hw_params,
 	.prepare =	snd_rme96_playback_prepare,
 	.trigger =	snd_rme96_playback_trigger,
@@ -1522,7 +1521,6 @@ static const struct snd_pcm_ops snd_rme96_playback_spdif_ops = {
 static const struct snd_pcm_ops snd_rme96_capture_spdif_ops = {
 	.open =		snd_rme96_capture_spdif_open,
 	.close =	snd_rme96_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme96_capture_hw_params,
 	.prepare =	snd_rme96_capture_prepare,
 	.trigger =	snd_rme96_capture_trigger,
@@ -1535,7 +1533,6 @@ static const struct snd_pcm_ops snd_rme96_capture_spdif_ops = {
 static const struct snd_pcm_ops snd_rme96_playback_adat_ops = {
 	.open =		snd_rme96_playback_adat_open,
 	.close =	snd_rme96_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme96_playback_hw_params,
 	.prepare =	snd_rme96_playback_prepare,
 	.trigger =	snd_rme96_playback_trigger,
@@ -1549,7 +1546,6 @@ static const struct snd_pcm_ops snd_rme96_playback_adat_ops = {
 static const struct snd_pcm_ops snd_rme96_capture_adat_ops = {
 	.open =		snd_rme96_capture_adat_open,
 	.close =	snd_rme96_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme96_capture_hw_params,
 	.prepare =	snd_rme96_capture_prepare,
 	.trigger =	snd_rme96_capture_trigger,
diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 4639bc21b42d..06dccf080bcc 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -846,7 +846,6 @@ static int sis_pcm_capture_prepare(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops sis_playback_ops = {
 	.open = sis_playback_open,
 	.close = sis_substream_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = sis_pcm_playback_prepare,
 	.trigger = sis_pcm_trigger,
 	.pointer = sis_pcm_pointer,
@@ -855,7 +854,6 @@ static const struct snd_pcm_ops sis_playback_ops = {
 static const struct snd_pcm_ops sis_capture_ops = {
 	.open = sis_capture_open,
 	.close = sis_substream_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.hw_params = sis_capture_hw_params,
 	.prepare = sis_pcm_capture_prepare,
 	.trigger = sis_pcm_trigger,
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index e117d8450b2d..bc650c8e85b0 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -835,7 +835,6 @@ static int snd_sonicvibes_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_sonicvibes_playback_ops = {
 	.open =		snd_sonicvibes_playback_open,
 	.close =	snd_sonicvibes_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_sonicvibes_playback_prepare,
 	.trigger =	snd_sonicvibes_playback_trigger,
 	.pointer =	snd_sonicvibes_playback_pointer,
@@ -844,7 +843,6 @@ static const struct snd_pcm_ops snd_sonicvibes_playback_ops = {
 static const struct snd_pcm_ops snd_sonicvibes_capture_ops = {
 	.open =		snd_sonicvibes_capture_open,
 	.close =	snd_sonicvibes_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_sonicvibes_capture_prepare,
 	.trigger =	snd_sonicvibes_capture_trigger,
 	.pointer =	snd_sonicvibes_capture_pointer,
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 748bbdcb2c52..61604277ae35 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -1103,7 +1103,6 @@ static int snd_ymfpci_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ymfpci_playback_ops = {
 	.open =			snd_ymfpci_playback_open,
 	.close =		snd_ymfpci_playback_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_ymfpci_playback_hw_params,
 	.hw_free =		snd_ymfpci_playback_hw_free,
 	.prepare =		snd_ymfpci_playback_prepare,
@@ -1114,7 +1113,6 @@ static const struct snd_pcm_ops snd_ymfpci_playback_ops = {
 static const struct snd_pcm_ops snd_ymfpci_capture_rec_ops = {
 	.open =			snd_ymfpci_capture_rec_open,
 	.close =		snd_ymfpci_capture_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_free =		snd_ymfpci_capture_hw_free,
 	.prepare =		snd_ymfpci_capture_prepare,
 	.trigger =		snd_ymfpci_capture_trigger,
@@ -1148,7 +1146,6 @@ int snd_ymfpci_pcm(struct snd_ymfpci *chip, int device)
 static const struct snd_pcm_ops snd_ymfpci_capture_ac97_ops = {
 	.open =			snd_ymfpci_capture_ac97_open,
 	.close =		snd_ymfpci_capture_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_free =		snd_ymfpci_capture_hw_free,
 	.prepare =		snd_ymfpci_capture_prepare,
 	.trigger =		snd_ymfpci_capture_trigger,
@@ -1181,7 +1178,6 @@ int snd_ymfpci_pcm2(struct snd_ymfpci *chip, int device)
 static const struct snd_pcm_ops snd_ymfpci_playback_spdif_ops = {
 	.open =			snd_ymfpci_playback_spdif_open,
 	.close =		snd_ymfpci_playback_spdif_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_ymfpci_playback_hw_params,
 	.hw_free =		snd_ymfpci_playback_hw_free,
 	.prepare =		snd_ymfpci_playback_prepare,
@@ -1214,7 +1210,6 @@ int snd_ymfpci_pcm_spdif(struct snd_ymfpci *chip, int device)
 static const struct snd_pcm_ops snd_ymfpci_playback_4ch_ops = {
 	.open =			snd_ymfpci_playback_4ch_open,
 	.close =		snd_ymfpci_playback_4ch_close,
-	.ioctl =		snd_pcm_lib_ioctl,
 	.hw_params =		snd_ymfpci_playback_hw_params,
 	.hw_free =		snd_ymfpci_playback_hw_free,
 	.prepare =		snd_ymfpci_playback_prepare,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
