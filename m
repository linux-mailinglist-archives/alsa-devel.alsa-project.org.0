Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8F21A5D70
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 10:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1BFB16C9;
	Sun, 12 Apr 2020 10:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1BFB16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586679373;
	bh=5S8uxD9r+wlkF2v/k6tQ1jjbhG3dpGLL8wet4N+KeR8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRKVBPpepHljSbFdBCjKQwRCE8HvAG3NQU/u6T/5MCNf2kDTM5SQg8lrR2vnUz1mh
	 7sHh6V1aRI01T5/MQiVr45SGHb3eoDLhuIdaEj5owkcxJzfN7WsktSJhZw3ugWaC2w
	 RCFVyOF3NKEUOAyDeuHCblH6fcjUDCIg+Kebh6uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C84F8027C;
	Sun, 12 Apr 2020 10:13:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A280F80229; Sun, 12 Apr 2020 10:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F08D9F8016F
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 10:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F08D9F8016F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4603EAE47
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 08:13:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: usb-audio: Check mapping at creating connector
 controls, too
Date: Sun, 12 Apr 2020 10:13:31 +0200
Message-Id: <20200412081331.4742-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200412081331.4742-1-tiwai@suse.de>
References: <20200412081331.4742-1-tiwai@suse.de>
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

Add the mapping check to build_connector_control() so that the device
specific quirk can provide the node to skip for the badly behaving
connector controls.  As an example, ALC1220-VB-based codec implements
the skip entry for the broken SPDIF connector detection.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206873
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c      | 18 +++++++++++-------
 sound/usb/mixer_maps.c |  4 +++-
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ab9c908a8771..e7b9040a54e6 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1771,11 +1771,15 @@ static void get_connector_control_name(struct usb_mixer_interface *mixer,
 
 /* Build a mixer control for a UAC connector control (jack-detect) */
 static void build_connector_control(struct usb_mixer_interface *mixer,
+				    const struct usbmix_name_map *imap,
 				    struct usb_audio_term *term, bool is_input)
 {
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *cval;
 
+	if (check_ignored_ctl(find_map(imap, term->id, 0)))
+		return;
+
 	cval = kzalloc(sizeof(*cval), GFP_KERNEL);
 	if (!cval)
 		return;
@@ -2111,7 +2115,7 @@ static int parse_audio_input_terminal(struct mixer_build *state, int unitid,
 	/* Check for jack detection. */
 	if ((iterm.type & 0xff00) != 0x0100 &&
 	    uac_v2v3_control_is_readable(bmctls, control))
-		build_connector_control(state->mixer, &iterm, true);
+		build_connector_control(state->mixer, state->map, &iterm, true);
 
 	return 0;
 }
@@ -3072,13 +3076,13 @@ static int snd_usb_mixer_controls_badd(struct usb_mixer_interface *mixer,
 		memset(&iterm, 0, sizeof(iterm));
 		iterm.id = UAC3_BADD_IT_ID4;
 		iterm.type = UAC_BIDIR_TERMINAL_HEADSET;
-		build_connector_control(mixer, &iterm, true);
+		build_connector_control(mixer, map->map, &iterm, true);
 
 		/* Output Term - Insertion control */
 		memset(&oterm, 0, sizeof(oterm));
 		oterm.id = UAC3_BADD_OT_ID3;
 		oterm.type = UAC_BIDIR_TERMINAL_HEADSET;
-		build_connector_control(mixer, &oterm, false);
+		build_connector_control(mixer, map->map, &oterm, false);
 	}
 
 	return 0;
@@ -3153,8 +3157,8 @@ static int snd_usb_mixer_controls(struct usb_mixer_interface *mixer)
 			if ((state.oterm.type & 0xff00) != 0x0100 &&
 			    uac_v2v3_control_is_readable(le16_to_cpu(desc->bmControls),
 							 UAC2_TE_CONNECTOR)) {
-				build_connector_control(state.mixer, &state.oterm,
-							false);
+				build_connector_control(state.mixer, state.map,
+							&state.oterm, false);
 			}
 		} else {  /* UAC_VERSION_3 */
 			struct uac3_output_terminal_descriptor *desc = p;
@@ -3179,8 +3183,8 @@ static int snd_usb_mixer_controls(struct usb_mixer_interface *mixer)
 			if ((state.oterm.type & 0xff00) != 0x0100 &&
 			    uac_v2v3_control_is_readable(le32_to_cpu(desc->bmControls),
 							 UAC3_TE_INSERTION)) {
-				build_connector_control(state.mixer, &state.oterm,
-							false);
+				build_connector_control(state.mixer, state.map,
+							&state.oterm, false);
 			}
 		}
 	}
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 72b575c34860..b4e77000f441 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -360,9 +360,11 @@ static const struct usbmix_name_map corsair_virtuoso_map[] = {
 };
 
 /* Some mobos shipped with a dummy HD-audio show the invalid GET_MIN/GET_MAX
- * response for Input Gain Pad (id=19, control=12).  Skip it.
+ * response for Input Gain Pad (id=19, control=12) and the connector status
+ * for SPDIF terminal (id=18).  Skip them.
  */
 static const struct usbmix_name_map asus_rog_map[] = {
+	{ 18, NULL }, /* OT, connector control */
 	{ 19, NULL, 12 }, /* FU, Input Gain Pad */
 	{}
 };
-- 
2.16.4

