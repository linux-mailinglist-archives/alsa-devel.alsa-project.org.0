Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5570DC8C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:26:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE97D204;
	Tue, 23 May 2023 14:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE97D204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844760;
	bh=uIRF7YUMcqAUv9gr4mBtNuIQ9LUbXgLFMm1+YfPeWG0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ag2Imh4aw0mZ1aLg6NF0WD6gfSk1o4zJOpUbExz7wFNTkldtsVLM2KzXt8z6xGLOk
	 3cmLcOxNds0RoUBTHUrPttmTENWO+V54M7MgwFKn/sqoWaiO+XTbDX6M/dy9k6oXYk
	 9vWy8Fyxt5TUXxNcv3v1HPFL/4ZGKuoosIZf3WYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4113F805C6; Tue, 23 May 2023 14:23:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B73AF805C4;
	Tue, 23 May 2023 14:23:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2EC1F805BB; Tue, 23 May 2023 14:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B909F8026A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B909F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G5/vUFAO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OxfHcbUa
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 916E122A36;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMgAk9rt80QYNVvFx6zLOlDT3gjpSGtg9Th+NNk5PPc=;
	b=G5/vUFAOjihSsLb3V++lrWFUqVk0gumFOzEiNwIvNQc/jD61csikGhrrBmCRcqn9W+LRhU
	sQvbyPhd9pNBu3wqUtogabeEGF+LStHO5N34eSSO2Ax0r9a5yhiLM42WsBkGerbJt2JQh0
	QtTSO3QObUtA0THRePZeRkNakuyi68k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMgAk9rt80QYNVvFx6zLOlDT3gjpSGtg9Th+NNk5PPc=;
	b=OxfHcbUaYPyqJe/OOn7/2vV68vQvtPnSOivGhL7VZHjQayMKSRbSEwJSxvc6JsK5priQZu
	p2t3icNCR2YXoWDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77FB713A1A;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8OrRGx6wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 05/10] control: Add UMP device query support
Date: Tue, 23 May 2023 14:22:42 +0200
Message-Id: <20230523122247.11744-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523122247.11744-1-tiwai@suse.de>
References: <20230523122247.11744-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ACS6MDDMMUFIHMJMP5TZS4WMDB32GCOT
X-Message-ID-Hash: ACS6MDDMMUFIHMJMP5TZS4WMDB32GCOT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACS6MDDMMUFIHMJMP5TZS4WMDB32GCOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a function to query the next available UMP device via control
interface, just like the existing one for rawmidi.  As the UMP rawmidi
is compatible with the standard rawmidi, no extra helper for the
rawmidi_info is present.  Ditto for the preferred subdevice, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/control.h           |  1 +
 src/Versions.in             |  1 +
 src/control/control.c       | 14 ++++++++++++++
 src/control/control_hw.c    |  9 +++++++++
 src/control/control_local.h |  1 +
 5 files changed, 26 insertions(+)

diff --git a/include/control.h b/include/control.h
index d0c40d2fa32b..a2439d78057a 100644
--- a/include/control.h
+++ b/include/control.h
@@ -417,6 +417,7 @@ int snd_ctl_pcm_prefer_subdevice(snd_ctl_t *ctl, int subdev);
 int snd_ctl_rawmidi_next_device(snd_ctl_t *ctl, int * device);
 int snd_ctl_rawmidi_info(snd_ctl_t *ctl, snd_rawmidi_info_t * info);
 int snd_ctl_rawmidi_prefer_subdevice(snd_ctl_t *ctl, int subdev);
+int snd_ctl_ump_next_device(snd_ctl_t *ctl, int *device);
 #endif
 int snd_ctl_set_power_state(snd_ctl_t *ctl, unsigned int state);
 int snd_ctl_get_power_state(snd_ctl_t *ctl, unsigned int *state);
diff --git a/src/Versions.in b/src/Versions.in
index 3315fa2840e0..ee17cf289c0e 100644
--- a/src/Versions.in
+++ b/src/Versions.in
@@ -153,4 +153,5 @@ ALSA_1.2.10 {
   global:
 
     @SYMBOL_PREFIX@snd_ump_*;
+    @SYMBOL_PREFIX@snd_ctl_ump_next_device;
 } ALSA_1.2.9;
diff --git a/src/control/control.c b/src/control/control.c
index c4ca74ec5497..615a66906414 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -1267,6 +1267,20 @@ int snd_ctl_rawmidi_prefer_subdevice(snd_ctl_t *ctl, int subdev)
 	return ctl->ops->rawmidi_prefer_subdevice(ctl, subdev);
 }
 
+/**
+ * \brief Get next UMP device number
+ * \param ctl CTL handle
+ * \param device current device on entry and next device on return
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ctl_ump_next_device(snd_ctl_t *ctl, int *device)
+{
+	assert(ctl && device);
+	if (ctl->ops->ump_next_device)
+		return ctl->ops->ump_next_device(ctl, device);
+	return -ENXIO;
+}
+
 /**
  * \brief Set Power State to given SND_CTL_POWER_* value and do the power management
  * \param ctl CTL handle
diff --git a/src/control/control_hw.c b/src/control/control_hw.c
index 02636910c809..ffb6f17325a7 100644
--- a/src/control/control_hw.c
+++ b/src/control/control_hw.c
@@ -325,6 +325,14 @@ static int snd_ctl_hw_rawmidi_prefer_subdevice(snd_ctl_t *handle, int subdev)
 	return 0;
 }
 
+static int snd_ctl_hw_ump_next_device(snd_ctl_t *handle, int *device)
+{
+	snd_ctl_hw_t *hw = handle->private_data;
+	if (ioctl(hw->fd, SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE, device) < 0)
+		return -errno;
+	return 0;
+}
+
 static int snd_ctl_hw_set_power_state(snd_ctl_t *handle, unsigned int state)
 {
 	snd_ctl_hw_t *hw = handle->private_data;
@@ -379,6 +387,7 @@ static const snd_ctl_ops_t snd_ctl_hw_ops = {
 	.rawmidi_next_device = snd_ctl_hw_rawmidi_next_device,
 	.rawmidi_info = snd_ctl_hw_rawmidi_info,
 	.rawmidi_prefer_subdevice = snd_ctl_hw_rawmidi_prefer_subdevice,
+	.ump_next_device = snd_ctl_hw_ump_next_device,
 	.set_power_state = snd_ctl_hw_set_power_state,
 	.get_power_state = snd_ctl_hw_get_power_state,
 	.read = snd_ctl_hw_read,
diff --git a/src/control/control_local.h b/src/control/control_local.h
index b84dc4291c29..aa05bac84913 100644
--- a/src/control/control_local.h
+++ b/src/control/control_local.h
@@ -47,6 +47,7 @@ typedef struct _snd_ctl_ops {
 	int (*rawmidi_next_device)(snd_ctl_t *handle, int *device);
 	int (*rawmidi_info)(snd_ctl_t *handle, snd_rawmidi_info_t * info);
 	int (*rawmidi_prefer_subdevice)(snd_ctl_t *handle, int subdev);
+	int (*ump_next_device)(snd_ctl_t *handle, int *device);
 	int (*set_power_state)(snd_ctl_t *handle, unsigned int state);
 	int (*get_power_state)(snd_ctl_t *handle, unsigned int *state);
 	int (*read)(snd_ctl_t *handle, snd_ctl_event_t *event);
-- 
2.35.3

