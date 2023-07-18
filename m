Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CCD757F40
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C0A1844;
	Tue, 18 Jul 2023 16:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C0A1844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689853;
	bh=/RYem5osk1pDzsFMybyAoaMDjOifu4EQChTMNj1Khzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YVCSoCKph7BFPYrCPYl/vlLZHmU1ksPHAxso9SVTspmkL9DX5s2ZAMooxr+jEAmVv
	 j+zjgUs7MTDiXuwkruzJ9yhgEtVfkYsSguCshtrwVr4mJmVOVD7SRkwLiGLP7+fzNp
	 5o70M6rpqFu4xGHasdy1EnColzUvymjkdzw0y0HA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5C61F805F7; Tue, 18 Jul 2023 16:14:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFDCBF8057C;
	Tue, 18 Jul 2023 16:14:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 930EDF805F2; Tue, 18 Jul 2023 16:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A303F80548
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A303F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=psV9aatt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N5umPApD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7DD221FDC4;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EfVvkg6s7Ds0jKU7/Y8DqiRY5bktyU3vkVxnz+94Sk=;
	b=psV9aatt9oF6+WehRvylR32GI1mbbdKVPopJK0xGQ4jlWlj3+QRzN8mLhTWCg7bZ4/NlcU
	sFDv3hsDvVO1YkTrgSQdibVFCvuu7rg9s1QxxczTqAQmZyMJSl+enkA6rnO9w/LovBFdg8
	1Wam9NsrQQJ7/fQoDehBF4KczuaE5Z0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EfVvkg6s7Ds0jKU7/Y8DqiRY5bktyU3vkVxnz+94Sk=;
	b=N5umPApDPz9sVs+kdz/dhq6ao5FXy6gcp2Pb83UZNR0IgkgYew/fhLy+gBKGZS9ikZ2fmq
	UfVhtIgKZ1g68qAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60D29134B0;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uG25FvudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 04/11] ALSA: control: Take controls_rwsem lock in
 snd_ctl_remove()
Date: Tue, 18 Jul 2023 16:12:57 +0200
Message-Id: <20230718141304.1032-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AXFIO6DVF53XHATS3ZG654OX5G74DV5I
X-Message-ID-Hash: AXFIO6DVF53XHATS3ZG654OX5G74DV5I
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXFIO6DVF53XHATS3ZG654OX5G74DV5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

So far, snd_ctl_remove() requires its caller to take
card->controls_rwsem manually before the call for avoiding possible
races.  However, many callers don't care and miss the locking.

Basically it's cumbersome and error-prone to enforce it to each
caller.  Moreover, card->controls_rwsem is a field that should be used
only by internal or proper helpers, and it's not to be touched at
random external places.

This patch is an attempt to make those calls more consistent: now
snd_ctl_remove() takes the card->controls_rwsem internally, just like
other API functions for kctls.  Since a few callers already take the
controls_rwsem locks, the patch removes those locks at the same time,
too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c      | 27 +++++++++++++++++++++------
 sound/core/jack.c         |  2 --
 sound/core/pcm.c          |  2 --
 sound/isa/sb/emu8000.c    |  2 --
 sound/isa/sb/sb16_csp.c   |  2 --
 sound/pci/emu10k1/emufx.c |  2 --
 sound/pci/hda/hda_codec.c |  2 --
 sound/soc/soc-topology.c  |  3 ---
 8 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index a41d19c46df2..9c933350ec6b 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -39,6 +39,9 @@ static LIST_HEAD(snd_control_compat_ioctls);
 #endif
 static struct snd_ctl_layer_ops *snd_ctl_layer;
 
+static int snd_ctl_remove_locked(struct snd_card *card,
+				 struct snd_kcontrol *kcontrol);
+
 static int snd_ctl_open(struct inode *inode, struct file *file)
 {
 	unsigned long flags;
@@ -483,7 +486,7 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 			return -EBUSY;
 		}
 
-		err = snd_ctl_remove(card, old);
+		err = snd_ctl_remove_locked(card, old);
 		if (err < 0)
 			return err;
 	}
@@ -589,20 +592,32 @@ static int __snd_ctl_remove(struct snd_card *card,
 	return 0;
 }
 
+static inline int snd_ctl_remove_locked(struct snd_card *card,
+					struct snd_kcontrol *kcontrol)
+{
+	return __snd_ctl_remove(card, kcontrol, true);
+}
+
 /**
  * snd_ctl_remove - remove the control from the card and release it
  * @card: the card instance
  * @kcontrol: the control instance to remove
  *
  * Removes the control from the card and then releases the instance.
- * You don't need to call snd_ctl_free_one(). You must be in
- * the write lock - down_write(&card->controls_rwsem).
+ * You don't need to call snd_ctl_free_one().
  *
  * Return: 0 if successful, or a negative error code on failure.
+ *
+ * Note that this function takes card->controls_rwsem lock internally.
  */
 int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
 {
-	return __snd_ctl_remove(card, kcontrol, true);
+	int ret;
+
+	down_write(&card->controls_rwsem);
+	ret = snd_ctl_remove_locked(card, kcontrol);
+	up_write(&card->controls_rwsem);
+	return ret;
 }
 EXPORT_SYMBOL(snd_ctl_remove);
 
@@ -627,7 +642,7 @@ int snd_ctl_remove_id(struct snd_card *card, struct snd_ctl_elem_id *id)
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
 	}
-	ret = snd_ctl_remove(card, kctl);
+	ret = snd_ctl_remove_locked(card, kctl);
 	up_write(&card->controls_rwsem);
 	return ret;
 }
@@ -665,7 +680,7 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
 			ret = -EBUSY;
 			goto error;
 		}
-	ret = snd_ctl_remove(card, kctl);
+	ret = snd_ctl_remove_locked(card, kctl);
 error:
 	up_write(&card->controls_rwsem);
 	return ret;
diff --git a/sound/core/jack.c b/sound/core/jack.c
index 03d155ed362b..e0f034e7275c 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -66,12 +66,10 @@ static int snd_jack_dev_free(struct snd_device *device)
 	struct snd_card *card = device->card;
 	struct snd_jack_kctl *jack_kctl, *tmp_jack_kctl;
 
-	down_write(&card->controls_rwsem);
 	list_for_each_entry_safe(jack_kctl, tmp_jack_kctl, &jack->kctl_list, list) {
 		list_del_init(&jack_kctl->list);
 		snd_ctl_remove(card, jack_kctl->kctl);
 	}
-	up_write(&card->controls_rwsem);
 
 	if (jack->private_free)
 		jack->private_free(jack);
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9d95e3731123..1c0bb3a07bff 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -814,9 +814,7 @@ static void free_chmap(struct snd_pcm_str *pstr)
 	if (pstr->chmap_kctl) {
 		struct snd_card *card = pstr->pcm->card;
 
-		down_write(&card->controls_rwsem);
 		snd_ctl_remove(card, pstr->chmap_kctl);
-		up_write(&card->controls_rwsem);
 		pstr->chmap_kctl = NULL;
 	}
 }
diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index e02029677743..a6405772d537 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -1040,10 +1040,8 @@ snd_emu8000_create_mixer(struct snd_card *card, struct snd_emu8000 *emu)
 
 __error:
 	for (i = 0; i < EMU8000_NUM_CONTROLS; i++) {
-		down_write(&card->controls_rwsem);
 		if (emu->controls[i])
 			snd_ctl_remove(card, emu->controls[i]);
-		up_write(&card->controls_rwsem);
 	}
 	return err;
 }
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 7ad8c5f7b664..8d8357019719 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -1080,7 +1080,6 @@ static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
 
 	card = p->chip->card;	
 	
-	down_write(&card->controls_rwsem);
 	if (p->qsound_switch) {
 		snd_ctl_remove(card, p->qsound_switch);
 		p->qsound_switch = NULL;
@@ -1089,7 +1088,6 @@ static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
 		snd_ctl_remove(card, p->qsound_space);
 		p->qsound_space = NULL;
 	}
-	up_write(&card->controls_rwsem);
 
 	/* cancel pending transfer of QSound parameters */
 	spin_lock_irqsave (&p->q_lock, flags);
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 9904bcfee106..70c8252a92d9 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -977,11 +977,9 @@ static int snd_emu10k1_del_controls(struct snd_emu10k1 *emu,
 				       in_kernel);
 		if (err < 0)
 			return err;
-		down_write(&card->controls_rwsem);
 		ctl = snd_emu10k1_look_for_ctl(emu, &id);
 		if (ctl)
 			snd_ctl_remove(card, ctl->kcontrol);
-		up_write(&card->controls_rwsem);
 	}
 	return 0;
 }
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index bd19f92aeeec..33af707a65ab 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1769,10 +1769,8 @@ void snd_hda_ctls_clear(struct hda_codec *codec)
 	int i;
 	struct hda_nid_item *items = codec->mixers.list;
 
-	down_write(&codec->card->controls_rwsem);
 	for (i = 0; i < codec->mixers.used; i++)
 		snd_ctl_remove(codec->card, items[i].kctl);
-	up_write(&codec->card->controls_rwsem);
 	snd_array_free(&codec->mixers);
 	snd_array_free(&codec->nids);
 }
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 8add361e87c6..03ec3c5adc3a 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2564,7 +2564,6 @@ EXPORT_SYMBOL_GPL(snd_soc_tplg_component_load);
 /* remove dynamic controls from the component driver */
 int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 {
-	struct snd_card *card = comp->card->snd_card;
 	struct snd_soc_dobj *dobj, *next_dobj;
 	int pass;
 
@@ -2572,7 +2571,6 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 	for (pass = SOC_TPLG_PASS_END; pass >= SOC_TPLG_PASS_START; pass--) {
 
 		/* remove mixer controls */
-		down_write(&card->controls_rwsem);
 		list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
 			list) {
 
@@ -2607,7 +2605,6 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 				break;
 			}
 		}
-		up_write(&card->controls_rwsem);
 	}
 
 	/* let caller know if FW can be freed when no objects are left */
-- 
2.35.3

