Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4F14FC5D
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Feb 2020 10:09:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD66C1699;
	Sun,  2 Feb 2020 10:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD66C1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580634596;
	bh=c10AHRglblbfOkc7GVSSsiDkJGY9HZWbpwJGceXXtCw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=edb2VMCS1kgTTk39bMuEU5uHbvC50ft9qXpXopeAQtqVtW9smrzftX/8PGhtvjcB8
	 4VcpGCkWKQwJl/F5ytxC89BuXoqICW1HAK+TkF9H17iVZm1g1jHUeaEDBZinVyl0dm
	 pd6kVxsDYtHr7CjCBnhoYcCKZ8eblmuL+RjU2t3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E788BF800B8;
	Sun,  2 Feb 2020 10:07:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBB5BF80260; Sun,  2 Feb 2020 10:07:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57FD7F800B8
 for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2020 10:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57FD7F800B8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6314AEFF
 for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2020 09:07:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  2 Feb 2020 10:07:23 +0100
Message-Id: <20200202090724.18232-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 1/2] ALSA: emu10k1: Fix annotation and cast for
	the recent uapi header change
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

The recent sound/emu10k1.h uapi header change by the commit
2e4688676392 ("ALSA: emu10k1: Make uapi/emu10k1.h compilable again")
made sparse angry because of the inconsistency of __user annotation
and the own ctl id struct that were changed in uapi header.

This patch addresses those by adjusting the cast and annotations
properly again.

Fixes: 2e4688676392 ("ALSA: emu10k1: Make uapi/emu10k1.h compilable again")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emufx.c | 180 ++++++++++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 79 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 6b7ff4a94800..4e76ed0e91d5 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -463,7 +463,7 @@ static void snd_emu10k1_write_op(struct snd_emu10k1_fx8010_code *icode,
 	u_int32_t *code;
 	if (snd_BUG_ON(*ptr >= 512))
 		return;
-	code = (u_int32_t __force *)icode->code + (*ptr) * 2;
+	code = icode->code + (*ptr) * 2;
 	set_bit(*ptr, icode->code_valid);
 	code[0] = ((x & 0x3ff) << 10) | (y & 0x3ff);
 	code[1] = ((op & 0x0f) << 20) | ((r & 0x3ff) << 10) | (a & 0x3ff);
@@ -480,7 +480,7 @@ static void snd_emu10k1_audigy_write_op(struct snd_emu10k1_fx8010_code *icode,
 	u_int32_t *code;
 	if (snd_BUG_ON(*ptr >= 1024))
 		return;
-	code = (u_int32_t __force *)icode->code + (*ptr) * 2;
+	code = icode->code + (*ptr) * 2;
 	set_bit(*ptr, icode->code_valid);
 	code[0] = ((x & 0x7ff) << 12) | (y & 0x7ff);
 	code[1] = ((op & 0x0f) << 24) | ((r & 0x7ff) << 12) | (a & 0x7ff);
@@ -513,8 +513,8 @@ static int snd_emu10k1_gpr_poke(struct snd_emu10k1 *emu,
 		if (!test_bit(gpr, icode->gpr_valid))
 			continue;
 		if (in_kernel)
-			val = *(__force u32 *)&icode->gpr_map[gpr];
-		else if (get_user(val, &icode->gpr_map[gpr]))
+			val = icode->gpr_map[gpr];
+		else if (get_user(val, (__user u32 *)&icode->gpr_map[gpr]))
 			return -EFAULT;
 		snd_emu10k1_ptr_write(emu, emu->gpr_base + gpr, 0, val);
 	}
@@ -530,7 +530,7 @@ static int snd_emu10k1_gpr_peek(struct snd_emu10k1 *emu,
 	for (gpr = 0; gpr < (emu->audigy ? 0x200 : 0x100); gpr++) {
 		set_bit(gpr, icode->gpr_valid);
 		val = snd_emu10k1_ptr_read(emu, emu->gpr_base + gpr, 0);
-		if (put_user(val, &icode->gpr_map[gpr]))
+		if (put_user(val, (__user u32 *)&icode->gpr_map[gpr]))
 			return -EFAULT;
 	}
 	return 0;
@@ -547,11 +547,11 @@ static int snd_emu10k1_tram_poke(struct snd_emu10k1 *emu,
 		if (!test_bit(tram, icode->tram_valid))
 			continue;
 		if (in_kernel) {
-			val = *(__force u32 *)&icode->tram_data_map[tram];
-			addr = *(__force u32 *)&icode->tram_addr_map[tram];
+			val = icode->tram_data_map[tram];
+			addr = icode->tram_addr_map[tram];
 		} else {
-			if (get_user(val, &icode->tram_data_map[tram]) ||
-			    get_user(addr, &icode->tram_addr_map[tram]))
+			if (get_user(val, (__user __u32 *)&icode->tram_data_map[tram]) ||
+			    get_user(addr, (__user __u32 *)&icode->tram_addr_map[tram]))
 				return -EFAULT;
 		}
 		snd_emu10k1_ptr_write(emu, TANKMEMDATAREGBASE + tram, 0, val);
@@ -581,8 +581,8 @@ static int snd_emu10k1_tram_peek(struct snd_emu10k1 *emu,
 			addr = snd_emu10k1_ptr_read(emu, TANKMEMADDRREGBASE + tram, 0) >> 12;
 			addr |= snd_emu10k1_ptr_read(emu, A_TANKMEMCTLREGBASE + tram, 0) << 20;
 		}
-		if (put_user(val, &icode->tram_data_map[tram]) ||
-		    put_user(addr, &icode->tram_addr_map[tram]))
+		if (put_user(val, (__user u32 *)&icode->tram_data_map[tram]) ||
+		    put_user(addr, (__user u32 *)&icode->tram_addr_map[tram]))
 			return -EFAULT;
 	}
 	return 0;
@@ -598,11 +598,11 @@ static int snd_emu10k1_code_poke(struct snd_emu10k1 *emu,
 		if (!test_bit(pc / 2, icode->code_valid))
 			continue;
 		if (in_kernel) {
-			lo = *(__force u32 *)&icode->code[pc + 0];
-			hi = *(__force u32 *)&icode->code[pc + 1];
+			lo = icode->code[pc + 0];
+			hi = icode->code[pc + 1];
 		} else {
-			if (get_user(lo, &icode->code[pc + 0]) ||
-			    get_user(hi, &icode->code[pc + 1]))
+			if (get_user(lo, (__user u32 *)&icode->code[pc + 0]) ||
+			    get_user(hi, (__user u32 *)&icode->code[pc + 1]))
 				return -EFAULT;
 		}
 		snd_emu10k1_efx_write(emu, pc + 0, lo);
@@ -619,17 +619,21 @@ static int snd_emu10k1_code_peek(struct snd_emu10k1 *emu,
 	memset(icode->code_valid, 0, sizeof(icode->code_valid));
 	for (pc = 0; pc < (emu->audigy ? 2*1024 : 2*512); pc += 2) {
 		set_bit(pc / 2, icode->code_valid);
-		if (put_user(snd_emu10k1_efx_read(emu, pc + 0), &icode->code[pc + 0]))
+		if (put_user(snd_emu10k1_efx_read(emu, pc + 0),
+			     (__user u32 *)&icode->code[pc + 0]))
 			return -EFAULT;
-		if (put_user(snd_emu10k1_efx_read(emu, pc + 1), &icode->code[pc + 1]))
+		if (put_user(snd_emu10k1_efx_read(emu, pc + 1),
+			     (__user u32 *)&icode->code[pc + 1]))
 			return -EFAULT;
 	}
 	return 0;
 }
 
 static struct snd_emu10k1_fx8010_ctl *
-snd_emu10k1_look_for_ctl(struct snd_emu10k1 *emu, struct emu10k1_ctl_elem_id *id)
+snd_emu10k1_look_for_ctl(struct snd_emu10k1 *emu,
+			 struct emu10k1_ctl_elem_id *_id)
 {
+	struct snd_ctl_elem_id *id = (struct snd_ctl_elem_id *)_id;
 	struct snd_emu10k1_fx8010_ctl *ctl;
 	struct snd_kcontrol *kcontrol;
 
@@ -672,41 +676,60 @@ static unsigned int *copy_tlv(const unsigned int __user *_tlv, bool in_kernel)
 }
 
 static int copy_gctl(struct snd_emu10k1 *emu,
-		     struct snd_emu10k1_fx8010_control_gpr *gctl,
-		     struct snd_emu10k1_fx8010_control_gpr __user *_gctl,
+		     struct snd_emu10k1_fx8010_control_gpr *dst,
+		     struct snd_emu10k1_fx8010_control_gpr *src,
 		     int idx, bool in_kernel)
 {
-	struct snd_emu10k1_fx8010_control_old_gpr __user *octl;
+	struct snd_emu10k1_fx8010_control_gpr __user *_src;
+	struct snd_emu10k1_fx8010_control_old_gpr *octl;
+	struct snd_emu10k1_fx8010_control_old_gpr __user *_octl;
 
+	_src = (struct snd_emu10k1_fx8010_control_gpr __user *)src;
 	if (emu->support_tlv) {
 		if (in_kernel)
-			memcpy(gctl, (__force void *)&_gctl[idx], sizeof(*gctl));
-		else if (copy_from_user(gctl, &_gctl[idx], sizeof(*gctl)))
+			*dst = src[idx];
+		else if (copy_from_user(dst, &_src[idx], sizeof(*src)))
 			return -EFAULT;
 		return 0;
 	}
 
-	octl = (struct snd_emu10k1_fx8010_control_old_gpr __user *)_gctl;
+	octl = (struct snd_emu10k1_fx8010_control_old_gpr *)src;
+	_octl = (struct snd_emu10k1_fx8010_control_old_gpr __user *)octl;
 	if (in_kernel)
-		memcpy(gctl, (__force void *)&octl[idx], sizeof(*octl));
-	else if (copy_from_user(gctl, &octl[idx], sizeof(*octl)))
+		memcpy(dst, &octl[idx], sizeof(*octl));
+	else if (copy_from_user(dst, &_octl[idx], sizeof(*octl)))
 		return -EFAULT;
-	gctl->tlv = NULL;
+	dst->tlv = NULL;
 	return 0;
 }
 
 static int copy_gctl_to_user(struct snd_emu10k1 *emu,
-		     struct snd_emu10k1_fx8010_control_gpr __user *_gctl,
-		     struct snd_emu10k1_fx8010_control_gpr *gctl,
+		     struct snd_emu10k1_fx8010_control_gpr *dst,
+		     struct snd_emu10k1_fx8010_control_gpr *src,
 		     int idx)
 {
+	struct snd_emu10k1_fx8010_control_gpr __user *_dst;
 	struct snd_emu10k1_fx8010_control_old_gpr __user *octl;
 
+	_dst = (struct snd_emu10k1_fx8010_control_gpr __user *)dst;
 	if (emu->support_tlv)
-		return copy_to_user(&_gctl[idx], gctl, sizeof(*gctl));
+		return copy_to_user(&_dst[idx], src, sizeof(*src));
 	
-	octl = (struct snd_emu10k1_fx8010_control_old_gpr __user *)_gctl;
-	return copy_to_user(&octl[idx], gctl, sizeof(*octl));
+	octl = (struct snd_emu10k1_fx8010_control_old_gpr __user *)dst;
+	return copy_to_user(&octl[idx], src, sizeof(*octl));
+}
+
+static int copy_ctl_elem_id(const struct emu10k1_ctl_elem_id *list, int i,
+			    struct emu10k1_ctl_elem_id *ret, bool in_kernel)
+{
+	struct emu10k1_ctl_elem_id __user *_id =
+		(struct emu10k1_ctl_elem_id __user *)&list[i];
+
+	if (in_kernel)
+		*ret = list[i];
+	else if (copy_from_user(ret, _id, sizeof(*ret)))
+		return -EFAULT;
+	return 0;
 }
 
 static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
@@ -714,17 +737,16 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 				       bool in_kernel)
 {
 	unsigned int i;
-	struct emu10k1_ctl_elem_id __user *_id;
 	struct emu10k1_ctl_elem_id id;
 	struct snd_emu10k1_fx8010_control_gpr *gctl;
+	struct snd_ctl_elem_id *gctl_id;
 	int err;
 	
-	_id = (__force struct emu10k1_ctl_elem_id __user *)icode->gpr_del_controls;
-	for (i = 0; i < icode->gpr_del_control_count; i++, _id++) {
-		if (in_kernel)
-			id = *(__force struct emu10k1_ctl_elem_id *)_id;
-		else if (copy_from_user(&id, _id, sizeof(id)))
-	     		return -EFAULT;
+	for (i = 0; i < icode->gpr_del_control_count; i++) {
+		err = copy_ctl_elem_id(icode->gpr_del_controls, i, &id,
+				       in_kernel);
+		if (err < 0)
+			return err;
 		if (snd_emu10k1_look_for_ctl(emu, &id) == NULL)
 			return -ENOENT;
 	}
@@ -740,16 +762,16 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 		}
 		if (snd_emu10k1_look_for_ctl(emu, &gctl->id))
 			continue;
+		gctl_id = (struct snd_ctl_elem_id *)&gctl->id;
 		down_read(&emu->card->controls_rwsem);
-		if (snd_ctl_find_id(emu->card,
-				    (struct snd_ctl_elem_id *)&gctl->id)) {
+		if (snd_ctl_find_id(emu->card, gctl_id)) {
 			up_read(&emu->card->controls_rwsem);
 			err = -EEXIST;
 			goto __error;
 		}
 		up_read(&emu->card->controls_rwsem);
-		if (gctl->id.iface != SNDRV_CTL_ELEM_IFACE_MIXER &&
-		    gctl->id.iface != SNDRV_CTL_ELEM_IFACE_PCM) {
+		if (gctl_id->iface != SNDRV_CTL_ELEM_IFACE_MIXER &&
+		    gctl_id->iface != SNDRV_CTL_ELEM_IFACE_PCM) {
 			err = -EINVAL;
 			goto __error;
 		}
@@ -784,6 +806,7 @@ static int snd_emu10k1_add_controls(struct snd_emu10k1 *emu,
 {
 	unsigned int i, j;
 	struct snd_emu10k1_fx8010_control_gpr *gctl;
+	struct snd_ctl_elem_id *gctl_id;
 	struct snd_emu10k1_fx8010_ctl *ctl, *nctl;
 	struct snd_kcontrol_new knew;
 	struct snd_kcontrol *kctl;
@@ -804,24 +827,25 @@ static int snd_emu10k1_add_controls(struct snd_emu10k1 *emu,
 			err = -EFAULT;
 			goto __error;
 		}
-		if (gctl->id.iface != SNDRV_CTL_ELEM_IFACE_MIXER &&
-		    gctl->id.iface != SNDRV_CTL_ELEM_IFACE_PCM) {
+		gctl_id = (struct snd_ctl_elem_id *)&gctl->id;
+		if (gctl_id->iface != SNDRV_CTL_ELEM_IFACE_MIXER &&
+		    gctl_id->iface != SNDRV_CTL_ELEM_IFACE_PCM) {
 			err = -EINVAL;
 			goto __error;
 		}
-		if (! gctl->id.name[0]) {
+		if (!*gctl_id->name) {
 			err = -EINVAL;
 			goto __error;
 		}
 		ctl = snd_emu10k1_look_for_ctl(emu, &gctl->id);
 		memset(&knew, 0, sizeof(knew));
-		knew.iface = gctl->id.iface;
-		knew.name = gctl->id.name;
-		knew.index = gctl->id.index;
-		knew.device = gctl->id.device;
-		knew.subdevice = gctl->id.subdevice;
+		knew.iface = gctl_id->iface;
+		knew.name = gctl_id->name;
+		knew.index = gctl_id->index;
+		knew.device = gctl_id->device;
+		knew.subdevice = gctl_id->subdevice;
 		knew.info = snd_emu10k1_gpr_ctl_info;
-		knew.tlv.p = copy_tlv((__force const unsigned int __user *)gctl->tlv, in_kernel);
+		knew.tlv.p = copy_tlv((const unsigned int __user *)gctl->tlv, in_kernel);
 		if (knew.tlv.p)
 			knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
 				SNDRV_CTL_ELEM_ACCESS_TLV_READ;
@@ -878,17 +902,15 @@ static int snd_emu10k1_del_controls(struct snd_emu10k1 *emu,
 {
 	unsigned int i;
 	struct emu10k1_ctl_elem_id id;
-	struct emu10k1_ctl_elem_id __user *_id;
 	struct snd_emu10k1_fx8010_ctl *ctl;
 	struct snd_card *card = emu->card;
+	int err;
 	
-	_id = (__force struct emu10k1_ctl_elem_id __user *)icode->gpr_del_controls;
-
-	for (i = 0; i < icode->gpr_del_control_count; i++, _id++) {
-		if (in_kernel)
-			id = *(__force struct emu10k1_ctl_elem_id *)_id;
-		else if (copy_from_user(&id, _id, sizeof(id)))
-			return -EFAULT;
+	for (i = 0; i < icode->gpr_del_control_count; i++) {
+		err = copy_ctl_elem_id(icode->gpr_del_controls, i, &id,
+				       in_kernel);
+		if (err < 0)
+			return err;
 		down_write(&card->controls_rwsem);
 		ctl = snd_emu10k1_look_for_ctl(emu, &id);
 		if (ctl)
@@ -917,7 +939,7 @@ static int snd_emu10k1_list_controls(struct snd_emu10k1 *emu,
 		    i < icode->gpr_list_control_count) {
 			memset(gctl, 0, sizeof(*gctl));
 			id = &ctl->kcontrol->id;
-			gctl->id.iface = id->iface;
+			gctl->id.iface = (__force int)id->iface;
 			strlcpy(gctl->id.name, id->name, sizeof(gctl->id.name));
 			gctl->id.index = id->index;
 			gctl->id.device = id->device;
@@ -1095,7 +1117,7 @@ static void
 snd_emu10k1_init_mono_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 			      const char *name, int gpr, int defval)
 {
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
@@ -1116,7 +1138,7 @@ static void
 snd_emu10k1_init_stereo_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				const char *name, int gpr, int defval)
 {
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
@@ -1138,7 +1160,7 @@ static void
 snd_emu10k1_init_mono_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				    const char *name, int gpr, int defval)
 {
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
@@ -1151,7 +1173,7 @@ static void
 snd_emu10k1_init_stereo_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				      const char *name, int gpr, int defval)
 {
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
@@ -1204,8 +1226,8 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	if (!icode)
 		return err;
 
-	icode->gpr_map = (u_int32_t __user *) kcalloc(512 + 256 + 256 + 2 * 1024,
-						      sizeof(u_int32_t), GFP_KERNEL);
+	icode->gpr_map = kcalloc(512 + 256 + 256 + 2 * 1024,
+				 sizeof(u_int32_t), GFP_KERNEL);
 	if (!icode->gpr_map)
 		goto __err_gpr;
 	controls = kcalloc(SND_EMU10K1_GPR_CONTROLS,
@@ -1213,7 +1235,7 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	if (!controls)
 		goto __err_ctrls;
 
-	gpr_map = (u32 __force *)icode->gpr_map;
+	gpr_map = icode->gpr_map;
 
 	icode->tram_data_map = icode->gpr_map + 512;
 	icode->tram_addr_map = icode->tram_data_map + 256;
@@ -1468,7 +1490,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	
 
 	ctl = &controls[nctl + 0];
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, "Tone Control - Bass");
 	ctl->vcount = 2;
 	ctl->count = 10;
@@ -1477,7 +1499,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	ctl->value[0] = ctl->value[1] = 20;
 	ctl->translation = EMU10K1_GPR_TRANSLATION_BASS;
 	ctl = &controls[nctl + 1];
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, "Tone Control - Treble");
 	ctl->vcount = 2;
 	ctl->count = 10;
@@ -1758,7 +1780,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 		A_OP(icode, &ptr, 0x0f, 0xc0, 0xc0, 0xcf, 0xc0);
 
 	icode->gpr_add_control_count = nctl;
-	icode->gpr_add_controls = (struct snd_emu10k1_fx8010_control_gpr __user *)controls;
+	icode->gpr_add_controls = controls;
 	emu->support_tlv = 1; /* support TLV */
 	err = snd_emu10k1_icode_poke(emu, icode, true);
 	emu->support_tlv = 0; /* clear again */
@@ -1766,7 +1788,7 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 __err:
 	kfree(controls);
 __err_ctrls:
-	kfree((void __force *)icode->gpr_map);
+	kfree(icode->gpr_map);
 __err_gpr:
 	kfree(icode);
 	return err;
@@ -1839,8 +1861,8 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	if (!icode)
 		return err;
 
-	icode->gpr_map = (u_int32_t __user *) kcalloc(256 + 160 + 160 + 2 * 512,
-						      sizeof(u_int32_t), GFP_KERNEL);
+	icode->gpr_map = kcalloc(256 + 160 + 160 + 2 * 512,
+				 sizeof(u_int32_t), GFP_KERNEL);
 	if (!icode->gpr_map)
 		goto __err_gpr;
 
@@ -1854,7 +1876,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	if (!ipcm)
 		goto __err_ipcm;
 
-	gpr_map = (u32 __force *)icode->gpr_map;
+	gpr_map = icode->gpr_map;
 
 	icode->tram_data_map = icode->gpr_map + 256;
 	icode->tram_addr_map = icode->tram_data_map + 160;
@@ -2188,7 +2210,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	OP(icode, &ptr, iACC3, GPR(playback + SND_EMU10K1_PLAYBACK_CHANNELS + 5), GPR(playback + 5), C_00000000, C_00000000); /* LFE */
 
 	ctl = &controls[i + 0];
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, "Tone Control - Bass");
 	ctl->vcount = 2;
 	ctl->count = 10;
@@ -2198,7 +2220,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	ctl->tlv = snd_emu10k1_bass_treble_db_scale;
 	ctl->translation = EMU10K1_GPR_TRANSLATION_BASS;
 	ctl = &controls[i + 1];
-	ctl->id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, "Tone Control - Treble");
 	ctl->vcount = 2;
 	ctl->count = 10;
@@ -2384,7 +2406,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	if ((err = snd_emu10k1_fx8010_tram_setup(emu, ipcm->buffer_size)) < 0)
 		goto __err;
 	icode->gpr_add_control_count = i;
-	icode->gpr_add_controls = (struct snd_emu10k1_fx8010_control_gpr __user *)controls;
+	icode->gpr_add_controls = controls;
 	emu->support_tlv = 1; /* support TLV */
 	err = snd_emu10k1_icode_poke(emu, icode, true);
 	emu->support_tlv = 0; /* clear again */
@@ -2395,7 +2417,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 __err_ipcm:
 	kfree(controls);
 __err_ctrls:
-	kfree((void __force *)icode->gpr_map);
+	kfree(icode->gpr_map);
 __err_gpr:
 	kfree(icode);
 	return err;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
