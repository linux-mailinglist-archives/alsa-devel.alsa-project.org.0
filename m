Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86F98C7B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 09:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97516165F;
	Thu, 22 Aug 2019 09:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97516165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566459367;
	bh=LnBu8qBwcZwyNH1SfGgjB+JcfzHPZtr2ENp1yniAZsQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X675s1JkAY/9uUG/1Bsqk24VrEfsG7EtXv91YThlrO4xjFQg2fq6dGLH5BKceReD+
	 9jsuATDZYb6sdQeaPgJIyhpfEV9PMNXtK9A4LBg+8g5eSvZe/+VyEuNnf8PY0/yTgI
	 1Z9K7ITGvwCiH+OOLi/CdXI+cKEmPzWjxcrLG0+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1052F805FB;
	Thu, 22 Aug 2019 09:32:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F323FF80391; Thu, 22 Aug 2019 09:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B57CF8036D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 09:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B57CF8036D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2B218AFFE
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 07:32:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 09:32:06 +0200
Message-Id: <20190822073207.8696-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190822073207.8696-1-tiwai@suse.de>
References: <20190822073207.8696-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/4] ALSA: usb-audio: Unify the release of
	usb_mixer_elem_info objects
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

Instead of the direct kfree() calls, introduce a new local helper to
release the usb_mixer_elem_info object.  This will be extended to do
more than a single kfree() in the later patches.

Also, use the standard goto instead of multiple calls in
parse_audio_selector_unit() error paths.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 2628697353bb..7f498528be48 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1026,10 +1026,15 @@ static struct usb_feature_control_info audio_feature_info[] = {
 	{ UAC2_FU_PHASE_INVERTER,	 "Phase Inverter Control", USB_MIXER_BOOLEAN, -1 },
 };
 
+static void usb_mixer_elem_info_free(struct usb_mixer_elem_info *cval)
+{
+	kfree(cval);
+}
+
 /* private_free callback */
 void snd_usb_mixer_elem_free(struct snd_kcontrol *kctl)
 {
-	kfree(kctl->private_data);
+	usb_mixer_elem_info_free(kctl->private_data);
 	kctl->private_data = NULL;
 }
 
@@ -1552,7 +1557,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 
 	ctl_info = get_feature_control_info(control);
 	if (!ctl_info) {
-		kfree(cval);
+		usb_mixer_elem_info_free(cval);
 		return;
 	}
 	if (mixer->protocol == UAC_VERSION_1)
@@ -1585,7 +1590,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 
 	if (!kctl) {
 		usb_audio_err(mixer->chip, "cannot malloc kcontrol\n");
-		kfree(cval);
+		usb_mixer_elem_info_free(cval);
 		return;
 	}
 	kctl->private_free = snd_usb_mixer_elem_free;
@@ -1755,7 +1760,7 @@ static void build_connector_control(struct usb_mixer_interface *mixer,
 	kctl = snd_ctl_new1(&usb_connector_ctl_ro, cval);
 	if (!kctl) {
 		usb_audio_err(mixer->chip, "cannot malloc kcontrol\n");
-		kfree(cval);
+		usb_mixer_elem_info_free(cval);
 		return;
 	}
 	get_connector_control_name(mixer, term, is_input, kctl->id.name,
@@ -1808,7 +1813,7 @@ static int parse_clock_source_unit(struct mixer_build *state, int unitid,
 	kctl = snd_ctl_new1(&usb_bool_master_control_ctl_ro, cval);
 
 	if (!kctl) {
-		kfree(cval);
+		usb_mixer_elem_info_free(cval);
 		return -ENOMEM;
 	}
 
@@ -2068,7 +2073,7 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 	kctl = snd_ctl_new1(&usb_feature_unit_ctl, cval);
 	if (!kctl) {
 		usb_audio_err(state->chip, "cannot malloc kcontrol\n");
-		kfree(cval);
+		usb_mixer_elem_info_free(cval);
 		return;
 	}
 	kctl->private_free = snd_usb_mixer_elem_free;
@@ -2466,7 +2471,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 
 		kctl = snd_ctl_new1(&mixer_procunit_ctl, cval);
 		if (!kctl) {
-			kfree(cval);
+			usb_mixer_elem_info_free(cval);
 			return -ENOMEM;
 		}
 		kctl->private_free = snd_usb_mixer_elem_free;
@@ -2604,7 +2609,7 @@ static void usb_mixer_selector_elem_free(struct snd_kcontrol *kctl)
 	if (kctl->private_data) {
 		struct usb_mixer_elem_info *cval = kctl->private_data;
 		num_ins = cval->max;
-		kfree(cval);
+		usb_mixer_elem_info_free(cval);
 		kctl->private_data = NULL;
 	}
 	if (kctl->private_value) {
@@ -2676,10 +2681,10 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 		break;
 	}
 
-	namelist = kmalloc_array(desc->bNrInPins, sizeof(char *), GFP_KERNEL);
+	namelist = kcalloc(desc->bNrInPins, sizeof(char *), GFP_KERNEL);
 	if (!namelist) {
-		kfree(cval);
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto error_cval;
 	}
 #define MAX_ITEM_NAME_LEN	64
 	for (i = 0; i < desc->bNrInPins; i++) {
@@ -2687,11 +2692,8 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 		len = 0;
 		namelist[i] = kmalloc(MAX_ITEM_NAME_LEN, GFP_KERNEL);
 		if (!namelist[i]) {
-			while (i--)
-				kfree(namelist[i]);
-			kfree(namelist);
-			kfree(cval);
-			return -ENOMEM;
+			err = -ENOMEM;
+			goto error_name;
 		}
 		len = check_mapped_selector_name(state, unitid, i, namelist[i],
 						 MAX_ITEM_NAME_LEN);
@@ -2705,10 +2707,8 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 	kctl = snd_ctl_new1(&mixer_selectunit_ctl, cval);
 	if (! kctl) {
 		usb_audio_err(state->chip, "cannot malloc kcontrol\n");
-		for (i = 0; i < desc->bNrInPins; i++)
-			kfree(namelist[i]);
-		kfree(namelist);
-		kfree(cval);
+		err = -ENOMEM;
+		goto error_name;
 		return -ENOMEM;
 	}
 	kctl->private_value = (unsigned long)namelist;
@@ -2755,6 +2755,14 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 	usb_audio_dbg(state->chip, "[%d] SU [%s] items = %d\n",
 		    cval->head.id, kctl->id.name, desc->bNrInPins);
 	return snd_usb_mixer_add_control(&cval->head, kctl);
+
+ error_name:
+	for (i = 0; i < desc->bNrInPins; i++)
+		kfree(namelist[i]);
+	kfree(namelist);
+ error_cval:
+	usb_mixer_elem_info_free(cval);
+	return err;
 }
 
 /*
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
