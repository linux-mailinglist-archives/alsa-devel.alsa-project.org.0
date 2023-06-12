Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00F72CF2B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C68484C;
	Mon, 12 Jun 2023 21:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C68484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597374;
	bh=T6rn34wPZw/nPOUFODBIqBY18Wkvj5U9nDxaVAXi9Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YPfWBtaCYTg7iXQRdQnlwLeO+KNM9cWF6DHS9OPvOzeNfacUxMNfafpiZgL1SYyxh
	 zXutO6ENeAF/k3J9xjZXdEu3SSX+kFZ1+e4AcM8lkHgBu3QsbOYa07FSWI8ea4r7P8
	 d9sbQwOqGBhZYJgisjjnOWjVSBRCkaJ5y7UESYxo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EF5DF805AB; Mon, 12 Jun 2023 21:13:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86483F805AB;
	Mon, 12 Jun 2023 21:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB46F8055C; Mon, 12 Jun 2023 21:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40966F8025E
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40966F8025E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E130124235;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WKF-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 5/9] ALSA: emu10k1: fix synthesizer pitch for E-MU cards at
 44.1 kHz
Date: Mon, 12 Jun 2023 21:13:21 +0200
Message-Id: <20230612191325.1315854-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K52INXBMZY4HHYJOC37NSUY4TJ5ZISRT
X-Message-ID-Hash: K52INXBMZY4HHYJOC37NSUY4TJ5ZISRT
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K52INXBMZY4HHYJOC37NSUY4TJ5ZISRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is only a very partial fix - the frequency-dependent envelope & LFO
register values aren't adjusted.

But I'm not sure they were even correct at 48 kHz to start with, as most
of them are precalculated by common code which assumes an EMU8K-specific
44.1 kHz word clock, and it seems somewhat unlikely that the hardware's
register interpretation was adjusted to compensate for the different
word clock.

In any case I'm not going to spend time on fixing that, as this code is
unlikely to be actually used by anyone today.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emux_synth.h           |  2 +-
 sound/pci/emu10k1/emu10k1_callback.c | 10 ++++++++++
 sound/pci/emu10k1/emu10k1_synth.c    |  1 -
 sound/synth/emux/emux_synth.c        |  3 ++-
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/sound/emux_synth.h b/include/sound/emux_synth.h
index d499b68122a3..1cc530434b97 100644
--- a/include/sound/emux_synth.h
+++ b/include/sound/emux_synth.h
@@ -54,6 +54,7 @@ struct snd_emux_operators {
 #if IS_ENABLED(CONFIG_SND_SEQUENCER_OSS)
 	int (*oss_ioctl)(struct snd_emux *emu, int cmd, int p1, int p2);
 #endif
+	int (*get_pitch_shift)(struct snd_emux *emu);
 };
 
 
@@ -82,7 +83,6 @@ struct snd_emux {
 	int max_voices;		/* Number of voices */
 	int mem_size;		/* memory size (in byte) */
 	int num_ports;		/* number of ports to be created */
-	int pitch_shift;	/* pitch shift value (for Emu10k1) */
 	struct snd_emux_operators ops;	/* operators */
 	void *hw;		/* hardware */
 	unsigned long flags;	/* other conditions */
diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index ad0dea0c2be9..d36234b88fb4 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -35,6 +35,7 @@ static void terminate_voice(struct snd_emux_voice *vp);
 static void free_voice(struct snd_emux_voice *vp);
 static u32 make_fmmod(struct snd_emux_voice *vp);
 static u32 make_fm2frq2(struct snd_emux_voice *vp);
+static int get_pitch_shift(struct snd_emux *emu);
 
 /*
  * Ensure a value is between two points
@@ -58,6 +59,7 @@ static const struct snd_emux_operators emu10k1_ops = {
 	.free_voice =	free_voice,
 	.sample_new =	snd_emu10k1_sample_new,
 	.sample_free =	snd_emu10k1_sample_free,
+	.get_pitch_shift = get_pitch_shift,
 };
 
 void
@@ -508,3 +510,11 @@ make_fm2frq2(struct snd_emux_voice *vp)
 	LIMITVALUE(pitch, -128, 127);
 	return ((unsigned char)pitch << 8) | freq;
 }
+
+static int get_pitch_shift(struct snd_emux *emu)
+{
+	struct snd_emu10k1 *hw = emu->hw;
+
+	return (hw->card_capabilities->emu_model &&
+			hw->emu1010.word_clock == 44100) ? 0 : -501;
+}
diff --git a/sound/pci/emu10k1/emu10k1_synth.c b/sound/pci/emu10k1/emu10k1_synth.c
index 549013a4a80b..759e66e1105a 100644
--- a/sound/pci/emu10k1/emu10k1_synth.c
+++ b/sound/pci/emu10k1/emu10k1_synth.c
@@ -43,7 +43,6 @@ static int snd_emu10k1_synth_probe(struct device *_dev)
 	emux->hw = hw;
 	emux->max_voices = arg->max_voices;
 	emux->num_ports = arg->seq_ports;
-	emux->pitch_shift = -501;
 	emux->memhdr = hw->memhdr;
 	/* maximum two ports */
 	emux->midi_ports = arg->seq_ports < 2 ? arg->seq_ports : 2;
diff --git a/sound/synth/emux/emux_synth.c b/sound/synth/emux/emux_synth.c
index a5385efcedb6..075358a533a0 100644
--- a/sound/synth/emux/emux_synth.c
+++ b/sound/synth/emux/emux_synth.c
@@ -845,7 +845,8 @@ calc_pitch(struct snd_emux_voice *vp)
 
 	/* 0xe000: root pitch */
 	offset += 0xe000 + vp->reg.rate_offset;
-	offset += vp->emu->pitch_shift;
+	if (vp->emu->ops.get_pitch_shift)
+		offset += vp->emu->ops.get_pitch_shift(vp->emu);
 	LIMITVALUE(offset, 0, 0xffff);
 	if (offset == vp->apitch)
 		return 0; /* unchanged */
-- 
2.40.0.152.g15d061e6df

