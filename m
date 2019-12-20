Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01A127F6D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:36:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D9E9950;
	Fri, 20 Dec 2019 16:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D9E9950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576856211;
	bh=eJsFvfhM3XOWq3pmUQjM2wSP6msJPxg8nN69oEdnQCs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d10d60lYlwAN6BJeNRkFcCYvissxO6UaNWU93ZjJpTJLfOFJAFCDldGLtSMZCFjek
	 UBYVf4QVB7qeKZ2a5CNbG9E/D8+T2MwvfxScISjthqgAyblHDRTHBqFygKtlObHilq
	 Xy50qWmH9lCTK75ylgPYO7Juu8euOBN1/eCCm6BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17CCF80257;
	Fri, 20 Dec 2019 16:34:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8722CF80269; Fri, 20 Dec 2019 16:34:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16D57F8015A
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D57F8015A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A626FAE37
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 15:34:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Dec 2019 16:34:11 +0100
Message-Id: <20191220153415.2740-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191220153415.2740-1-tiwai@suse.de>
References: <20191220153415.2740-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/5] ALSA: emu10k1: Make uapi/emu10k1.h
	compilable again
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

Recently we updated the content in alsa-lib uapi header files by just
copying from the latest Linus kernel uapi/*.h, and noticed that it
broke the build of some alsa-tools programs.  The reason is that we
used to have a modified version in the past, so that the program can
be built without referring to the unexported stuff like
snd_ctl_elem_id or __user prefix.

This patch attempts to restore that, i.e. dropping the stuff that
can't be referred in the user-space.  For adapting the changes in
uapi/emu10k1.h, the emu10k1 driver code is also slightly modified.
Most of changes are pointer cast.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/emu10k1.h | 38 ++++++++++++++++++++++++++------------
 sound/pci/emu10k1/emufx.c    | 26 ++++++++++++++------------
 2 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/include/uapi/sound/emu10k1.h b/include/uapi/sound/emu10k1.h
index 042c5a6f16ee..c1150e4d0231 100644
--- a/include/uapi/sound/emu10k1.h
+++ b/include/uapi/sound/emu10k1.h
@@ -23,9 +23,6 @@
 #ifndef _UAPI__SOUND_EMU10K1_H
 #define _UAPI__SOUND_EMU10K1_H
 
-#include <linux/types.h>
-#include <sound/asound.h>
-
 /*
  * ---- FX8010 ----
  */
@@ -282,8 +279,22 @@ struct snd_emu10k1_fx8010_info {
 #define EMU10K1_GPR_TRANSLATION_TREBLE		3
 #define EMU10K1_GPR_TRANSLATION_ONOFF		4
 
+enum emu10k1_ctl_elem_iface {
+	EMU10K1_CTL_ELEM_IFACE_MIXER = 2,	/* virtual mixer device */
+	EMU10K1_CTL_ELEM_IFACE_PCM = 3,		/* PCM device */
+};
+
+struct emu10k1_ctl_elem_id {
+	unsigned int pad;		/* don't use */
+	int iface;			/* interface identifier */
+	unsigned int device;		/* device/client number */
+	unsigned int subdevice;		/* subdevice (substream) number */
+	unsigned char name[44];		/* ASCII name of item */
+	unsigned int index;		/* index of item */
+};
+
 struct snd_emu10k1_fx8010_control_gpr {
-	struct snd_ctl_elem_id id;		/* full control ID definition */
+	struct emu10k1_ctl_elem_id id;	/* full control ID definition */
 	unsigned int vcount;		/* visible count */
 	unsigned int count;		/* count of GPR (1..16) */
 	unsigned short gpr[32];		/* GPR number(s) */
@@ -296,7 +307,7 @@ struct snd_emu10k1_fx8010_control_gpr {
 
 /* old ABI without TLV support */
 struct snd_emu10k1_fx8010_control_old_gpr {
-	struct snd_ctl_elem_id id;
+	struct emu10k1_ctl_elem_id id;
 	unsigned int vcount;
 	unsigned int count;
 	unsigned short gpr[32];
@@ -310,24 +321,24 @@ struct snd_emu10k1_fx8010_code {
 	char name[128];
 
 	__EMU10K1_DECLARE_BITMAP(gpr_valid, 0x200); /* bitmask of valid initializers */
-	__u32 __user *gpr_map;		/* initializers */
+	__u32 *gpr_map;			/* initializers */
 
 	unsigned int gpr_add_control_count; /* count of GPR controls to add/replace */
-	struct snd_emu10k1_fx8010_control_gpr __user *gpr_add_controls; /* GPR controls to add/replace */
+	struct snd_emu10k1_fx8010_control_gpr *gpr_add_controls; /* GPR controls to add/replace */
 
 	unsigned int gpr_del_control_count; /* count of GPR controls to remove */
-	struct snd_ctl_elem_id __user *gpr_del_controls; /* IDs of GPR controls to remove */
+	struct emu10k1_ctl_elem_id *gpr_del_controls; /* IDs of GPR controls to remove */
 
 	unsigned int gpr_list_control_count; /* count of GPR controls to list */
 	unsigned int gpr_list_control_total; /* total count of GPR controls */
-	struct snd_emu10k1_fx8010_control_gpr __user *gpr_list_controls; /* listed GPR controls */
+	struct snd_emu10k1_fx8010_control_gpr *gpr_list_controls; /* listed GPR controls */
 
 	__EMU10K1_DECLARE_BITMAP(tram_valid, 0x100); /* bitmask of valid initializers */
-	__u32 __user *tram_data_map;	  /* data initializers */
-	__u32 __user *tram_addr_map;	  /* map initializers */
+	__u32 *tram_data_map;		  /* data initializers */
+	__u32 *tram_addr_map;		  /* map initializers */
 
 	__EMU10K1_DECLARE_BITMAP(code_valid, 1024); /* bitmask of valid instructions */
-	__u32 __user *code;		  /* one instruction - 64 bits */
+	__u32 *code;			  /* one instruction - 64 bits */
 };
 
 struct snd_emu10k1_fx8010_tram {
@@ -371,11 +382,14 @@ struct snd_emu10k1_fx8010_pcm_rec {
 #define SNDRV_EMU10K1_IOCTL_SINGLE_STEP	_IOW ('H', 0x83, int)
 #define SNDRV_EMU10K1_IOCTL_DBG_READ	_IOR ('H', 0x84, int)
 
+#ifndef __KERNEL__
 /* typedefs for compatibility to user-space */
 typedef struct snd_emu10k1_fx8010_info emu10k1_fx8010_info_t;
 typedef struct snd_emu10k1_fx8010_control_gpr emu10k1_fx8010_control_gpr_t;
 typedef struct snd_emu10k1_fx8010_code emu10k1_fx8010_code_t;
 typedef struct snd_emu10k1_fx8010_tram emu10k1_fx8010_tram_t;
 typedef struct snd_emu10k1_fx8010_pcm_rec emu10k1_fx8010_pcm_t;
+typedef struct emu10k1_ctl_elem_id emu10k1_ctl_elem_id_t;
+#endif
 
 #endif /* _UAPI__SOUND_EMU10K1_H */
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index a31adecfe608..e0e076a9c321 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -628,7 +628,7 @@ static int snd_emu10k1_code_peek(struct snd_emu10k1 *emu,
 }
 
 static struct snd_emu10k1_fx8010_ctl *
-snd_emu10k1_look_for_ctl(struct snd_emu10k1 *emu, struct snd_ctl_elem_id *id)
+snd_emu10k1_look_for_ctl(struct snd_emu10k1 *emu, struct emu10k1_ctl_elem_id *id)
 {
 	struct snd_emu10k1_fx8010_ctl *ctl;
 	struct snd_kcontrol *kcontrol;
@@ -714,15 +714,15 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 				       bool in_kernel)
 {
 	unsigned int i;
-	struct snd_ctl_elem_id __user *_id;
-	struct snd_ctl_elem_id id;
+	struct emu10k1_ctl_elem_id __user *_id;
+	struct emu10k1_ctl_elem_id id;
 	struct snd_emu10k1_fx8010_control_gpr *gctl;
 	int err;
 	
-	for (i = 0, _id = icode->gpr_del_controls;
-	     i < icode->gpr_del_control_count; i++, _id++) {
+	_id = (__force struct emu10k1_ctl_elem_id __user *)icode->gpr_del_controls;
+	for (i = 0; i < icode->gpr_del_control_count; i++, _id++) {
 		if (in_kernel)
-			id = *(__force struct snd_ctl_elem_id *)_id;
+			id = *(__force struct emu10k1_ctl_elem_id *)_id;
 		else if (copy_from_user(&id, _id, sizeof(id)))
 	     		return -EFAULT;
 		if (snd_emu10k1_look_for_ctl(emu, &id) == NULL)
@@ -741,7 +741,8 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 		if (snd_emu10k1_look_for_ctl(emu, &gctl->id))
 			continue;
 		down_read(&emu->card->controls_rwsem);
-		if (snd_ctl_find_id(emu->card, &gctl->id) != NULL) {
+		if (snd_ctl_find_id(emu->card,
+				    (struct snd_ctl_elem_id *)&gctl->id)) {
 			up_read(&emu->card->controls_rwsem);
 			err = -EEXIST;
 			goto __error;
@@ -876,15 +877,16 @@ static int snd_emu10k1_del_controls(struct snd_emu10k1 *emu,
 				    bool in_kernel)
 {
 	unsigned int i;
-	struct snd_ctl_elem_id id;
-	struct snd_ctl_elem_id __user *_id;
+	struct emu10k1_ctl_elem_id id;
+	struct emu10k1_ctl_elem_id __user *_id;
 	struct snd_emu10k1_fx8010_ctl *ctl;
 	struct snd_card *card = emu->card;
 	
-	for (i = 0, _id = icode->gpr_del_controls;
-	     i < icode->gpr_del_control_count; i++, _id++) {
+	_id = (__force struct emu10k1_ctl_elem_id __user *)icode->gpr_del_controls;
+
+	for (i = 0; i < icode->gpr_del_control_count; i++, _id++) {
 		if (in_kernel)
-			id = *(__force struct snd_ctl_elem_id *)_id;
+			id = *(__force struct emu10k1_ctl_elem_id *)_id;
 		else if (copy_from_user(&id, _id, sizeof(id)))
 			return -EFAULT;
 		down_write(&card->controls_rwsem);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
