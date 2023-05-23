Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73970DC83
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B51A82C;
	Tue, 23 May 2023 14:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B51A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844712;
	bh=nONOXSbFMiwElQJipkdF24VFZRg60YNtTgwHyUBSzxg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=m4PpqtryO9IHzghJ0fnUDdSO5md3eHIQn3HBsUOWfJkzU0pVtHQI4NYFCXmUXMjYM
	 dngUbB/VXr1WzZ7ij2wB14uQua+Qqzr+R+Z3bxBOaLpVDylUUOFlHtMECuPB7kqgOS
	 RXZCI/s8z3BlFq9nFoJdLnQQS7NOqMbK2UG41ntg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C32FF805AC; Tue, 23 May 2023 14:23:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 243CCF8059F;
	Tue, 23 May 2023 14:23:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97617F8057A; Tue, 23 May 2023 14:23:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC601F80548
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC601F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Mv4JkHu2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8Lsi1Pwi
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ADE1F22A37;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cWWz/aLfQeZl8Vs1rQItBp3JG8lIh3S8QX4KKp33Zc=;
	b=Mv4JkHu2D7uM2XMRgbb3+Y5VR5Q6GtukVFJ4CEVAySmuGPZN8xGUUGdZmXe4Td3RuE5fTj
	kvXzYxNaYPXNTyEzwncolZVL8JtmlKJ9Lqs7+rNnF56cGleAEIbC3jhZL2KF21ugzJWa0J
	a5IMiOeO70OaW3zjLHypEDlEl5wOmNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cWWz/aLfQeZl8Vs1rQItBp3JG8lIh3S8QX4KKp33Zc=;
	b=8Lsi1PwijaIcA8+yk7YBqE2llJBYrrt+UBg45/0Al4u2ctgFocN6psVZWgwGvsPM0s0/91
	pfWdnoXN8LQ51gCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94D4913588;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gKmoIx6wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 06/10] control: Add UMP Endpoint and Block info
 query support
Date: Tue, 23 May 2023 14:22:43 +0200
Message-Id: <20230523122247.11744-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523122247.11744-1-tiwai@suse.de>
References: <20230523122247.11744-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WPFSMHGJIKROCSFBYCO7KI7OEB3DOTEF
X-Message-ID-Hash: WPFSMHGJIKROCSFBYCO7KI7OEB3DOTEF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WPFSMHGJIKROCSFBYCO7KI7OEB3DOTEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add functions to query the UMP Endpoint and Block info via control
interface.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/control.h           |  2 ++
 include/local.h             |  1 +
 src/Versions.in             |  2 ++
 src/control/control.c       | 24 ++++++++++++++++++++++++
 src/control/control_hw.c    | 20 ++++++++++++++++++++
 src/control/control_local.h |  2 ++
 6 files changed, 51 insertions(+)

diff --git a/include/control.h b/include/control.h
index a2439d78057a..41892de20fd3 100644
--- a/include/control.h
+++ b/include/control.h
@@ -418,6 +418,8 @@ int snd_ctl_rawmidi_next_device(snd_ctl_t *ctl, int * device);
 int snd_ctl_rawmidi_info(snd_ctl_t *ctl, snd_rawmidi_info_t * info);
 int snd_ctl_rawmidi_prefer_subdevice(snd_ctl_t *ctl, int subdev);
 int snd_ctl_ump_next_device(snd_ctl_t *ctl, int *device);
+int snd_ctl_ump_endpoint_info(snd_ctl_t *ctl, snd_ump_endpoint_info_t *info);
+int snd_ctl_ump_block_info(snd_ctl_t *ctl, snd_ump_block_info_t *info);
 #endif
 int snd_ctl_set_power_state(snd_ctl_t *ctl, unsigned int state);
 int snd_ctl_get_power_state(snd_ctl_t *ctl, unsigned int *state);
diff --git a/include/local.h b/include/local.h
index 151e3fd4d39b..4206d68137d9 100644
--- a/include/local.h
+++ b/include/local.h
@@ -180,6 +180,7 @@
 #include "pcm.h"
 #include "pcm_plugin.h"
 #include "rawmidi.h"
+#include "ump.h"
 #include "timer.h"
 #include "hwdep.h"
 #include "control.h"
diff --git a/src/Versions.in b/src/Versions.in
index ee17cf289c0e..2acf3d1889df 100644
--- a/src/Versions.in
+++ b/src/Versions.in
@@ -154,4 +154,6 @@ ALSA_1.2.10 {
 
     @SYMBOL_PREFIX@snd_ump_*;
     @SYMBOL_PREFIX@snd_ctl_ump_next_device;
+    @SYMBOL_PREFIX@snd_ctl_ump_endpoint_info;
+    @SYMBOL_PREFIX@snd_ctl_ump_block_info;
 } ALSA_1.2.9;
diff --git a/src/control/control.c b/src/control/control.c
index 615a66906414..9b6bf893581b 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -1281,6 +1281,30 @@ int snd_ctl_ump_next_device(snd_ctl_t *ctl, int *device)
 	return -ENXIO;
 }
 
+/**
+ * \brief Get UMP Endpoint info about a UMP RawMidi device
+ * \param ctl CTL handle
+ * \param info UMP Endpoint info pointer
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ctl_ump_endpoint_info(snd_ctl_t *ctl, snd_ump_endpoint_info_t *info)
+{
+	assert(ctl && info);
+	return ctl->ops->ump_endpoint_info(ctl, info);
+}
+
+/**
+ * \brief Get UMP Block info about a UMP RawMidi device
+ * \param ctl CTL handle
+ * \param info UMP Block info pointer
+ * \return 0 on success otherwise a negative error code
+ */
+int snd_ctl_ump_block_info(snd_ctl_t *ctl, snd_ump_block_info_t *info)
+{
+	assert(ctl && info);
+	return ctl->ops->ump_block_info(ctl, info);
+}
+
 /**
  * \brief Set Power State to given SND_CTL_POWER_* value and do the power management
  * \param ctl CTL handle
diff --git a/src/control/control_hw.c b/src/control/control_hw.c
index ffb6f17325a7..a2f1bdc50cea 100644
--- a/src/control/control_hw.c
+++ b/src/control/control_hw.c
@@ -333,6 +333,24 @@ static int snd_ctl_hw_ump_next_device(snd_ctl_t *handle, int *device)
 	return 0;
 }
 
+static int snd_ctl_hw_ump_endpoint_info(snd_ctl_t *handle,
+					snd_ump_endpoint_info_t *info)
+{
+	snd_ctl_hw_t *hw = handle->private_data;
+	if (ioctl(hw->fd, SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO, info) < 0)
+		return -errno;
+	return 0;
+}
+
+static int snd_ctl_hw_ump_block_info(snd_ctl_t *handle,
+				     snd_ump_block_info_t *info)
+{
+	snd_ctl_hw_t *hw = handle->private_data;
+	if (ioctl(hw->fd, SNDRV_CTL_IOCTL_UMP_BLOCK_INFO, info) < 0)
+		return -errno;
+	return 0;
+}
+
 static int snd_ctl_hw_set_power_state(snd_ctl_t *handle, unsigned int state)
 {
 	snd_ctl_hw_t *hw = handle->private_data;
@@ -388,6 +406,8 @@ static const snd_ctl_ops_t snd_ctl_hw_ops = {
 	.rawmidi_info = snd_ctl_hw_rawmidi_info,
 	.rawmidi_prefer_subdevice = snd_ctl_hw_rawmidi_prefer_subdevice,
 	.ump_next_device = snd_ctl_hw_ump_next_device,
+	.ump_endpoint_info = snd_ctl_hw_ump_endpoint_info,
+	.ump_block_info = snd_ctl_hw_ump_block_info,
 	.set_power_state = snd_ctl_hw_set_power_state,
 	.get_power_state = snd_ctl_hw_get_power_state,
 	.read = snd_ctl_hw_read,
diff --git a/src/control/control_local.h b/src/control/control_local.h
index aa05bac84913..2afa62cceee3 100644
--- a/src/control/control_local.h
+++ b/src/control/control_local.h
@@ -48,6 +48,8 @@ typedef struct _snd_ctl_ops {
 	int (*rawmidi_info)(snd_ctl_t *handle, snd_rawmidi_info_t * info);
 	int (*rawmidi_prefer_subdevice)(snd_ctl_t *handle, int subdev);
 	int (*ump_next_device)(snd_ctl_t *handle, int *device);
+	int (*ump_endpoint_info)(snd_ctl_t *handle, snd_ump_endpoint_info_t *info);
+	int (*ump_block_info)(snd_ctl_t *handle, snd_ump_block_info_t *info);
 	int (*set_power_state)(snd_ctl_t *handle, unsigned int state);
 	int (*get_power_state)(snd_ctl_t *handle, unsigned int *state);
 	int (*read)(snd_ctl_t *handle, snd_ctl_event_t *event);
-- 
2.35.3

