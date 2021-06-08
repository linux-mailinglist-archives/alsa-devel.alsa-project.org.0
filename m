Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11939F8ED
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098F116F2;
	Tue,  8 Jun 2021 16:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098F116F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162181;
	bh=plPW61EX4WQErZ4Uezc9zWjeTYN/ZPcJegeQ6nW4FlM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lokh4QoZCoLYNk7eY7qbwWJ/aMMvmcSI1JNriRS1EIWTtcVb96V26EOe9n7VDz86Y
	 WWIKydGEOSGlRls6atLHn18xyeQl4srKRIiLGl2HiSPFBd977Qfck63KiOk3bRAyUB
	 R1b54IEicX5Ez/39WdAnRj7oOyWv4XyMRae9MLG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37B69F8063B;
	Tue,  8 Jun 2021 16:07:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F40F8060B; Tue,  8 Jun 2021 16:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3BB5F804FB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3BB5F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QJZy0vSB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="cRSfzGBt"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DA2721FDF7
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dV/5w4qelBBq9aFMldVVeaXHoSh4XlIMLv02AS+0+cg=;
 b=QJZy0vSBCVIAltAn8oK35f2hDhVS45Rbca+TZ3cGwJRn0Lnfij2NcNcMUla3mT5TkhC9mH
 5tdikpj75SPcFp6q6YL6WMXXc29LZGSSJI/ZdNwQyK1IOm9iopAG/rVv91xzRWaOVF8/R2
 5yfLqqD/kmWsHszBqqhXwaOtZIcpgug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dV/5w4qelBBq9aFMldVVeaXHoSh4XlIMLv02AS+0+cg=;
 b=cRSfzGBt9lAxTCQUD/LPs86Or/PMnuf/uMoWEqJFr0UO3d0fP4JITULCQOtpLlyOtcnVlT
 rXZ/dZ5oCi4JTgDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D4F33A3B84;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 63/66] ALSA: synth: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:37 +0200
Message-Id: <20210608140540.17885-64-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

EMUx synth driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/synth/emux/emux.c        |  3 ++-
 sound/synth/emux/emux_effect.c | 13 ++++++++---
 sound/synth/emux/emux_hwdep.c  |  6 +++--
 sound/synth/emux/soundfont.c   | 40 ++++++++++++++++++++++------------
 4 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
index f65e6c7b139f..49d1976a132c 100644
--- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -104,7 +104,8 @@ int snd_emux_register(struct snd_emux *emu, struct snd_card *card, int index, ch
 	if (emu->sflist == NULL)
 		return -ENOMEM;
 
-	if ((err = snd_emux_init_hwdep(emu)) < 0)
+	err = snd_emux_init_hwdep(emu);
+	if (err < 0)
 		return err;
 
 	snd_emux_init_voices(emu);
diff --git a/sound/synth/emux/emux_effect.c b/sound/synth/emux/emux_effect.c
index afd119b11f39..3c7314f5fb19 100644
--- a/sound/synth/emux/emux_effect.c
+++ b/sound/synth/emux/emux_effect.c
@@ -181,7 +181,10 @@ snd_emux_send_effect(struct snd_emux_port *port, struct snd_midi_channel *chan,
 	fx->flag[type] = mode;
 
 	/* do we need to modify the register in realtime ? */
-	if (! parm_defs[type].update || (offset = parm_defs[type].offset) < 0)
+	if (!parm_defs[type].update)
+		return;
+	offset = parm_defs[type].offset;
+	if (offset < 0)
 		return;
 
 #ifdef SNDRV_LITTLE_ENDIAN
@@ -223,13 +226,17 @@ snd_emux_setup_effect(struct snd_emux_voice *vp)
 	unsigned char *srcp;
 	int i;
 
-	if (! (fx = chan->private))
+	fx = chan->private;
+	if (!fx)
 		return;
 
 	/* modify the register values via effect table */
 	for (i = 0; i < EMUX_FX_END; i++) {
 		int offset;
-		if (! fx->flag[i] || (offset = parm_defs[i].offset) < 0)
+		if (!fx->flag[i])
+			continue;
+		offset = parm_defs[i].offset;
+		if (offset < 0)
 			continue;
 #ifdef SNDRV_LITTLE_ENDIAN
 		if (parm_defs[i].type & PARM_IS_ALIGN_HI)
diff --git a/sound/synth/emux/emux_hwdep.c b/sound/synth/emux/emux_hwdep.c
index 8a965e2f160a..81719bfb8ed7 100644
--- a/sound/synth/emux/emux_hwdep.c
+++ b/sound/synth/emux/emux_hwdep.c
@@ -116,7 +116,8 @@ snd_emux_init_hwdep(struct snd_emux *emu)
 	struct snd_hwdep *hw;
 	int err;
 
-	if ((err = snd_hwdep_new(emu->card, SNDRV_EMUX_HWDEP_NAME, emu->hwdep_idx, &hw)) < 0)
+	err = snd_hwdep_new(emu->card, SNDRV_EMUX_HWDEP_NAME, emu->hwdep_idx, &hw);
+	if (err < 0)
 		return err;
 	emu->hwdep = hw;
 	strcpy(hw->name, SNDRV_EMUX_HWDEP_NAME);
@@ -127,7 +128,8 @@ snd_emux_init_hwdep(struct snd_emux *emu)
 	hw->ops.ioctl_compat = snd_emux_hwdep_ioctl;
 	hw->exclusive = 1;
 	hw->private_data = emu;
-	if ((err = snd_card_register(emu->card)) < 0)
+	err = snd_card_register(emu->card);
+	if (err < 0)
 		return err;
 
 	return 0;
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 9ebc711afa6b..da3cf8912463 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -349,7 +349,8 @@ sf_zone_new(struct snd_sf_list *sflist, struct snd_soundfont *sf)
 {
 	struct snd_sf_zone *zp;
 
-	if ((zp = kzalloc(sizeof(*zp), GFP_KERNEL)) == NULL)
+	zp = kzalloc(sizeof(*zp), GFP_KERNEL);
+	if (!zp)
 		return NULL;
 	zp->next = sf->zones;
 	sf->zones = zp;
@@ -381,7 +382,8 @@ sf_sample_new(struct snd_sf_list *sflist, struct snd_soundfont *sf)
 {
 	struct snd_sf_sample *sp;
 
-	if ((sp = kzalloc(sizeof(*sp), GFP_KERNEL)) == NULL)
+	sp = kzalloc(sizeof(*sp), GFP_KERNEL);
+	if (!sp)
 		return NULL;
 
 	sp->next = sf->samples;
@@ -451,7 +453,8 @@ load_map(struct snd_sf_list *sflist, const void __user *data, int count)
 	}
 
 	/* create a new zone */
-	if ((zp = sf_zone_new(sflist, sf)) == NULL)
+	zp = sf_zone_new(sflist, sf);
+	if (!zp)
 		return -ENOMEM;
 
 	zp->bank = map.map_bank;
@@ -514,7 +517,8 @@ load_info(struct snd_sf_list *sflist, const void __user *data, long count)
 	int i;
 
 	/* patch must be opened */
-	if ((sf = sflist->currsf) == NULL)
+	sf = sflist->currsf;
+	if (!sf)
 		return -EINVAL;
 
 	if (is_special_type(sf->type))
@@ -579,9 +583,9 @@ load_info(struct snd_sf_list *sflist, const void __user *data, long count)
 			init_voice_parm(&tmpzone.v.parm);
 
 		/* create a new zone */
-		if ((zone = sf_zone_new(sflist, sf)) == NULL) {
+		zone = sf_zone_new(sflist, sf);
+		if (!zone)
 			return -ENOMEM;
-		}
 
 		/* copy the temporary data */
 		zone->bank = tmpzone.bank;
@@ -700,7 +704,8 @@ load_data(struct snd_sf_list *sflist, const void __user *data, long count)
 	long off;
 
 	/* patch must be opened */
-	if ((sf = sflist->currsf) == NULL)
+	sf = sflist->currsf;
+	if (!sf)
 		return -EINVAL;
 
 	if (is_special_type(sf->type))
@@ -723,7 +728,8 @@ load_data(struct snd_sf_list *sflist, const void __user *data, long count)
 	}
 
 	/* Allocate a new sample structure */
-	if ((sp = sf_sample_new(sflist, sf)) == NULL)
+	sp = sf_sample_new(sflist, sf);
+	if (!sp)
 		return -ENOMEM;
 
 	sp->v = sample_info;
@@ -958,7 +964,8 @@ load_guspatch(struct snd_sf_list *sflist, const char __user *data,
 	sf = newsf(sflist, SNDRV_SFNT_PAT_TYPE_GUS|SNDRV_SFNT_PAT_SHARED, NULL);
 	if (sf == NULL)
 		return -ENOMEM;
-	if ((smp = sf_sample_new(sflist, sf)) == NULL)
+	smp = sf_sample_new(sflist, sf);
+	if (!smp)
 		return -ENOMEM;
 	sample_id = sflist->sample_counter;
 	smp->v.sample = sample_id;
@@ -996,7 +1003,8 @@ load_guspatch(struct snd_sf_list *sflist, const char __user *data,
 	smp->v.sf_id = sf->id;
 
 	/* set up voice info */
-	if ((zone = sf_zone_new(sflist, sf)) == NULL) {
+	zone = sf_zone_new(sflist, sf);
+	if (!zone) {
 		sf_sample_delete(sflist, sf, smp);
 		return -ENOMEM;
 	}
@@ -1181,7 +1189,8 @@ add_preset(struct snd_sf_list *sflist, struct snd_sf_zone *cur)
 	}
 
 	/* prepend this zone */
-	if ((index = get_index(cur->bank, cur->instr, cur->v.low)) < 0)
+	index = get_index(cur->bank, cur->instr, cur->v.low);
+	if (index < 0)
 		return;
 	cur->next_zone = zone; /* zone link */
 	cur->next_instr = sflist->presets[index]; /* preset table link */
@@ -1197,7 +1206,8 @@ delete_preset(struct snd_sf_list *sflist, struct snd_sf_zone *zp)
 	int index;
 	struct snd_sf_zone *p;
 
-	if ((index = get_index(zp->bank, zp->instr, zp->v.low)) < 0)
+	index = get_index(zp->bank, zp->instr, zp->v.low);
+	if (index < 0)
 		return;
 	for (p = sflist->presets[index]; p; p = p->next_instr) {
 		while (p->next_instr == zp) {
@@ -1257,7 +1267,8 @@ search_first_zone(struct snd_sf_list *sflist, int bank, int preset, int key)
 	int index;
 	struct snd_sf_zone *zp;
 
-	if ((index = get_index(bank, preset, key)) < 0)
+	index = get_index(bank, preset, key);
+	if (index < 0)
 		return NULL;
 	for (zp = sflist->presets[index]; zp; zp = zp->next_instr) {
 		if (zp->instr == preset && zp->bank == bank)
@@ -1386,7 +1397,8 @@ snd_sf_new(struct snd_sf_callback *callback, struct snd_util_memhdr *hdr)
 {
 	struct snd_sf_list *sflist;
 
-	if ((sflist = kzalloc(sizeof(*sflist), GFP_KERNEL)) == NULL)
+	sflist = kzalloc(sizeof(*sflist), GFP_KERNEL);
+	if (!sflist)
 		return NULL;
 
 	mutex_init(&sflist->presets_mutex);
-- 
2.26.2

