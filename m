Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 390355FA50
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 16:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0DB416A1;
	Thu,  4 Jul 2019 16:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0DB416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562251808;
	bh=wBlNfeUfKig9iqGyhSttNQZ5ygkcn1P0sZUGf1H9s5A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P+105JEMTg9se4vhdtrSMG1cAjwg27WeVzf2XQzslo06dSQKX74M5vO3xHf8MsLhv
	 lXr/EhFb1QBWBZWWYdHV7zHtBNWOwcTQUr9X02DzkTjJPO+vSWK1iI2E4W+d7ONAzo
	 2pK6C2o6u+2+YdT+FaAL5Rtqe1sTc6NMApkct3qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C75AFF80111;
	Thu,  4 Jul 2019 16:48:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F425F80111; Thu,  4 Jul 2019 16:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F32F800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 16:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F32F800E7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C4C9AEE1;
 Thu,  4 Jul 2019 14:48:16 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  4 Jul 2019 16:48:06 +0200
Message-Id: <20190704144806.30513-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Stefan Sauer <ensonic@hora-obscura.de>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix parse of UAC2 Extension
	Units
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

Extension Unit (XU) is used to have a compatible layout with
Processing Unit (PU) on UAC1, and the usb-audio driver code assumed it
for parsing the descriptors.  Meanwhile, on UAC2, XU became slightly
incompatible with PU; namely, XU has a one-byte bmControls bitmap
while PU has two bytes bmControls bitmap.  This incompatibility
results in the read of a wrong address for the last iExtension field,
which ended up with an incorrect string for the mixer element name, as
recently reported for Focusrite Scarlett 18i20 device.

This patch corrects the present misalignment by introducing a couple
of new macros and calling them depending on the descriptor type.

Reported-by: Stefan Sauer <ensonic@hora-obscura.de>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/linux/usb/audio.h | 37 +++++++++++++++++++++++++++++++++++++
 sound/usb/mixer.c              | 16 ++++++++++------
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/include/uapi/linux/usb/audio.h b/include/uapi/linux/usb/audio.h
index ddc5396800aa..76b7c3f6cd0d 100644
--- a/include/uapi/linux/usb/audio.h
+++ b/include/uapi/linux/usb/audio.h
@@ -450,6 +450,43 @@ static inline __u8 *uac_processing_unit_specific(struct uac_processing_unit_desc
 	}
 }
 
+/*
+ * Extension Unit (XU) has almost compatible layout with Processing Unit, but
+ * on UAC2, it has a different bmControls size (bControlSize); it's 1 byte for
+ * XU while 2 bytes for PU.  The last iExtension field is a one-byte index as
+ * well as iProcessing field of PU.
+ */
+static inline __u8 uac_extension_unit_bControlSize(struct uac_processing_unit_descriptor *desc,
+						   int protocol)
+{
+	switch (protocol) {
+	case UAC_VERSION_1:
+		return desc->baSourceID[desc->bNrInPins + 4];
+	case UAC_VERSION_2:
+		return 1; /* in UAC2, this value is constant */
+	case UAC_VERSION_3:
+		return 4; /* in UAC3, this value is constant */
+	default:
+		return 1;
+	}
+}
+
+static inline __u8 uac_extension_unit_iExtension(struct uac_processing_unit_descriptor *desc,
+						 int protocol)
+{
+	__u8 control_size = uac_extension_unit_bControlSize(desc, protocol);
+
+	switch (protocol) {
+	case UAC_VERSION_1:
+	case UAC_VERSION_2:
+	default:
+		return *(uac_processing_unit_bmControls(desc, protocol)
+			 + control_size);
+	case UAC_VERSION_3:
+		return 0; /* UAC3 does not have this field */
+	}
+}
+
 /* 4.5.2 Class-Specific AS Interface Descriptor */
 struct uac1_as_header_descriptor {
 	__u8  bLength;			/* in bytes: 7 */
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index e003b5e7b01a..ac121b10c51c 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2318,7 +2318,7 @@ static struct procunit_info extunits[] = {
  */
 static int build_audio_procunit(struct mixer_build *state, int unitid,
 				void *raw_desc, struct procunit_info *list,
-				char *name)
+				bool extension_unit)
 {
 	struct uac_processing_unit_descriptor *desc = raw_desc;
 	int num_ins;
@@ -2335,6 +2335,8 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 	static struct procunit_info default_info = {
 		0, NULL, default_value_info
 	};
+	const char *name = extension_unit ?
+		"Extension Unit" : "Processing Unit";
 
 	if (desc->bLength < 13) {
 		usb_audio_err(state->chip, "invalid %s descriptor (id %d)\n", name, unitid);
@@ -2448,7 +2450,10 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 		} else if (info->name) {
 			strlcpy(kctl->id.name, info->name, sizeof(kctl->id.name));
 		} else {
-			nameid = uac_processing_unit_iProcessing(desc, state->mixer->protocol);
+			if (extension_unit)
+				nameid = uac_extension_unit_iExtension(desc, state->mixer->protocol);
+			else
+				nameid = uac_processing_unit_iProcessing(desc, state->mixer->protocol);
 			len = 0;
 			if (nameid)
 				len = snd_usb_copy_string_desc(state->chip,
@@ -2481,10 +2486,10 @@ static int parse_audio_processing_unit(struct mixer_build *state, int unitid,
 	case UAC_VERSION_2:
 	default:
 		return build_audio_procunit(state, unitid, raw_desc,
-				procunits, "Processing Unit");
+					    procunits, false);
 	case UAC_VERSION_3:
 		return build_audio_procunit(state, unitid, raw_desc,
-				uac3_procunits, "Processing Unit");
+					    uac3_procunits, false);
 	}
 }
 
@@ -2495,8 +2500,7 @@ static int parse_audio_extension_unit(struct mixer_build *state, int unitid,
 	 * Note that we parse extension units with processing unit descriptors.
 	 * That's ok as the layout is the same.
 	 */
-	return build_audio_procunit(state, unitid, raw_desc,
-				    extunits, "Extension Unit");
+	return build_audio_procunit(state, unitid, raw_desc, extunits, true);
 }
 
 /*
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
