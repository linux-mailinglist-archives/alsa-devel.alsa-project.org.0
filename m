Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB21D1308A1
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:17:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDD217CF;
	Sun,  5 Jan 2020 16:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDD217CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237426;
	bh=423jmyiXMSRe083oZ/w51lB6C1EmvoLcXnMh/RbNfJk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYD7iamAzugyPo/Zqe/EG/gsBtTf5USkr/8MaxlOl1um5rUuhVZCyXklAh1HLGMi8
	 TrYKSTWY6PHh7rVOU1tma5F40hFX9yDF5RuoYMeYD6vC8mO36ci/7eAotMhD/2SklI
	 aF/98h/YM2QwMPvPmdtE9EMJmqfIgd8ABeVGyNog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B2CF8049B;
	Sun,  5 Jan 2020 15:50:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4241AF8038D; Sun,  5 Jan 2020 15:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC1CFF802A9
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC1CFF802A9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB7F0AC3C
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:48:01 +0100
Message-Id: <20200105144823.29547-47-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 46/68] ALSA: cmi8330: More constifications
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

Apply const prefix to the static tables for the register, controls and
callbacks.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8330.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index 61d6944a69c7..4669eb0cc8ce 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -120,7 +120,7 @@ static int pnp_registered;
 #define CMI8330_LINGAIN   25
 #define CMI8330_CDINGAIN  26
 
-static unsigned char snd_cmi8330_image[((CMI8330_CDINGAIN)-16) + 1] =
+static const unsigned char snd_cmi8330_image[((CMI8330_CDINGAIN)-16) + 1] =
 {
 	0x40,			/* 16 - recording mux (SB-mixer-enabled) */
 #ifdef ENABLE_SB_MIXER
@@ -235,7 +235,7 @@ WSS_SINGLE(SNDRV_CTL_NAME_IEC958("Input ", PLAYBACK, SWITCH), 0,
 };
 
 #ifdef ENABLE_SB_MIXER
-static struct sbmix_elem cmi8330_sb_mixers[] = {
+static const struct sbmix_elem cmi8330_sb_mixers[] = {
 SB_DOUBLE("SB Master Playback Volume", SB_DSP4_MASTER_DEV, (SB_DSP4_MASTER_DEV + 1), 3, 3, 31),
 SB_DOUBLE("Tone Control - Bass", SB_DSP4_BASS_DEV, (SB_DSP4_BASS_DEV + 1), 4, 4, 15),
 SB_DOUBLE("Tone Control - Treble", SB_DSP4_TREBLE_DEV, (SB_DSP4_TREBLE_DEV + 1), 4, 4, 15),
@@ -253,7 +253,7 @@ SB_DOUBLE("SB Playback Volume", SB_DSP4_OGAIN_DEV, (SB_DSP4_OGAIN_DEV + 1), 6, 6
 SB_SINGLE("SB Mic Auto Gain", SB_DSP4_MIC_AGC, 0, 1),
 };
 
-static unsigned char cmi8330_sb_init_values[][2] = {
+static const unsigned char cmi8330_sb_init_values[][2] = {
 	{ SB_DSP4_MASTER_DEV + 0, 0 },
 	{ SB_DSP4_MASTER_DEV + 1, 0 },
 	{ SB_DSP4_PCM_DEV + 0, 0 },
@@ -428,7 +428,7 @@ static int snd_cmi8330_pcm(struct snd_card *card, struct snd_cmi8330 *chip)
 	struct snd_pcm *pcm;
 	const struct snd_pcm_ops *ops;
 	int err;
-	static snd_pcm_open_callback_t cmi_open_callbacks[2] = {
+	static const snd_pcm_open_callback_t cmi_open_callbacks[2] = {
 		snd_cmi8330_playback_open,
 		snd_cmi8330_capture_open
 	};
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
