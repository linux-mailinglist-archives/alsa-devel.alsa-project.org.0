Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C986F14DF
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989CB12A7;
	Fri, 28 Apr 2023 12:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989CB12A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676096;
	bh=qXb0lc0mas44NNcYNxV4yhTxrRDpdDphvEKVxOQkVDA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RJ5iMSRWBBWeL7uI/zDQ80JZMs1jHpLI/CWrZCOrPFUKBKknv7vGkzg5rd6QD+1EN
	 grGVtWiZkSQRUi9Ou3slbzkWj43RhV3dzqOH1/Qv3SXWVV4v0JS99Hmuf2xsYxVuJ1
	 MxUjflEPdyeFMzaTji3vq6xBBUz23xrVFTeGBkCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CEC6F8053B;
	Fri, 28 Apr 2023 12:00:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7996F8053D; Fri, 28 Apr 2023 12:00:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FCEFF80236
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCEFF80236
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id DF5DD2426A;
	Fri, 28 Apr 2023 05:59:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9tR-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ALSA: emu10k1: remove now superfluous mixer locking
Date: Fri, 28 Apr 2023 11:59:41 +0200
Message-Id: <20230428095941.1706278-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
References: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MBVPOE6CJFISAC5NTRGFJWRLVQSXPQ6A
X-Message-ID-Hash: MBVPOE6CJFISAC5NTRGFJWRLVQSXPQ6A
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBVPOE6CJFISAC5NTRGFJWRLVQSXPQ6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit 5bbb1ab5bd ("control: use counting semaphore as write lock
for ELEM_WRITE operation"), mixer values have been fully read-write
locked. This means that it is now unnecessary to apply any additional
locks to values that are accessed solely by mixer callbacks. Values that
are read outside mixer callbacks still need write locking. There are no
cases of mixer values being written outside mixer callbacks, so no read
locks remain in mixer callbacks.

Note that the removed locks refer only to the emu data structure, not
the card's registers as the lock's name suggests.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c    |  7 -------
 sound/pci/emu10k1/emumixer.c | 28 ----------------------------
 sound/pci/emu10k1/emupcm.c   |  2 --
 3 files changed, 37 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 3f64ccab0e63..98785110ef63 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -318,30 +318,24 @@ static int snd_emu10k1_gpr_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ct
 
 static int snd_emu10k1_gpr_ctl_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_fx8010_ctl *ctl =
 		(struct snd_emu10k1_fx8010_ctl *) kcontrol->private_value;
-	unsigned long flags;
 	unsigned int i;
 	
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (i = 0; i < ctl->vcount; i++)
 		ucontrol->value.integer.value[i] = ctl->value[i];
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
 static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_fx8010_ctl *ctl =
 		(struct snd_emu10k1_fx8010_ctl *) kcontrol->private_value;
-	unsigned long flags;
 	unsigned int nval, val;
 	unsigned int i, j;
 	int change = 0;
 	
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (i = 0; i < ctl->vcount; i++) {
 		nval = ucontrol->value.integer.value[i];
 		if (nval < ctl->min)
@@ -380,7 +374,6 @@ static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 		}
 	}
       __error:
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return change;
 }
 
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 24052f17d81c..ab04f8be25bd 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -41,17 +41,14 @@ static int snd_emu10k1_spdif_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int idx = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
-	unsigned long flags;
 
 	/* Limit: emu->spdif_bits */
 	if (idx >= 3)
 		return -EINVAL;
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	ucontrol->value.iec958.status[0] = (emu->spdif_bits[idx] >> 0) & 0xff;
 	ucontrol->value.iec958.status[1] = (emu->spdif_bits[idx] >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] = (emu->spdif_bits[idx] >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] = (emu->spdif_bits[idx] >> 24) & 0xff;
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
@@ -1070,10 +1067,7 @@ static int snd_audigy_spdif_output_rate_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int tmp;
-	unsigned long flags;
-	
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	tmp = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, 0);
 	switch (tmp & A_SPDIF_RATE_MASK) {
 	case A_SPDIF_44100:
@@ -1088,7 +1082,6 @@ static int snd_audigy_spdif_output_rate_get(struct snd_kcontrol *kcontrol,
 	default:
 		ucontrol->value.enumerated.item[0] = 1;
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
@@ -1146,22 +1139,19 @@ static int snd_emu10k1_spdif_put(struct snd_kcontrol *kcontrol,
 	unsigned int idx = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
 	int change;
 	unsigned int val;
-	unsigned long flags;
 
 	/* Limit: emu->spdif_bits */
 	if (idx >= 3)
 		return -EINVAL;
 	val = (ucontrol->value.iec958.status[0] << 0) |
 	      (ucontrol->value.iec958.status[1] << 8) |
 	      (ucontrol->value.iec958.status[2] << 16) |
 	      (ucontrol->value.iec958.status[3] << 24);
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	change = val != emu->spdif_bits[idx];
 	if (change) {
 		snd_emu10k1_ptr_write(emu, SPCS0 + idx, 0, val);
 		emu->spdif_bits[idx] = val;
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return change;
 }
 
@@ -1229,20 +1219,17 @@ static int snd_emu10k1_send_routing_info(struct snd_kcontrol *kcontrol, struct s
 static int snd_emu10k1_send_routing_get(struct snd_kcontrol *kcontrol,
                                         struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int voice, idx;
 	int num_efx = emu->audigy ? 8 : 4;
 	int mask = emu->audigy ? 0x3f : 0x0f;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (voice = 0; voice < 3; voice++)
 		for (idx = 0; idx < num_efx; idx++)
 			ucontrol->value.integer.value[(voice * num_efx) + idx] = 
 				mix->send_routing[voice][idx] & mask;
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
@@ -1305,17 +1292,14 @@ static int snd_emu10k1_send_volume_info(struct snd_kcontrol *kcontrol, struct sn
 static int snd_emu10k1_send_volume_get(struct snd_kcontrol *kcontrol,
                                        struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int idx;
 	int num_efx = emu->audigy ? 8 : 4;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (idx = 0; idx < 3*num_efx; idx++)
 		ucontrol->value.integer.value[idx] = mix->send_volume[idx/num_efx][idx%num_efx];
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
@@ -1378,13 +1362,10 @@ static int snd_emu10k1_attn_get(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
-	unsigned long flags;
 	int idx;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (idx = 0; idx < 3; idx++)
 		ucontrol->value.integer.value[idx] = mix->attn[idx];
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
@@ -1443,19 +1424,16 @@ static int snd_emu10k1_efx_send_routing_info(struct snd_kcontrol *kcontrol, stru
 static int snd_emu10k1_efx_send_routing_get(struct snd_kcontrol *kcontrol,
                                         struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->efx_pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int idx;
 	int num_efx = emu->audigy ? 8 : 4;
 	int mask = emu->audigy ? 0x3f : 0x0f;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (idx = 0; idx < num_efx; idx++)
 		ucontrol->value.integer.value[idx] = 
 			mix->send_routing[0][idx] & mask;
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
@@ -1513,17 +1491,14 @@ static int snd_emu10k1_efx_send_volume_info(struct snd_kcontrol *kcontrol, struc
 static int snd_emu10k1_efx_send_volume_get(struct snd_kcontrol *kcontrol,
                                        struct snd_ctl_elem_value *ucontrol)
 {
-	unsigned long flags;
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->efx_pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
 	int idx;
 	int num_efx = emu->audigy ? 8 : 4;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	for (idx = 0; idx < num_efx; idx++)
 		ucontrol->value.integer.value[idx] = mix->send_volume[0][idx];
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
@@ -1582,11 +1557,8 @@ static int snd_emu10k1_efx_attn_get(struct snd_kcontrol *kcontrol,
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	struct snd_emu10k1_pcm_mixer *mix =
 		&emu->efx_pcm_mixer[snd_ctl_get_ioffidx(kcontrol, &ucontrol->id)];
-	unsigned long flags;
 
-	spin_lock_irqsave(&emu->reg_lock, flags);
 	ucontrol->value.integer.value[0] = mix->attn[0];
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index e8d2f0f6fbb3..5ed404e8ed39 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1433,10 +1433,8 @@ static int snd_emu10k1_pcm_efx_voices_mask_get(struct snd_kcontrol *kcontrol, st
 	int nefx = emu->audigy ? 64 : 32;
 	int idx;
 	
-	spin_lock_irq(&emu->reg_lock);
 	for (idx = 0; idx < nefx; idx++)
 		ucontrol->value.integer.value[idx] = (emu->efx_voices_mask[idx / 32] & (1 << (idx % 32))) ? 1 : 0;
-	spin_unlock_irq(&emu->reg_lock);
 	return 0;
 }
 
-- 
2.40.0.152.g15d061e6df

