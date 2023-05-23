Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8D70DC80
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 495C274C;
	Tue, 23 May 2023 14:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 495C274C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844682;
	bh=7g5lgg8K6ULr4rCfFJMUM9g1W70gZv1L9Jtq0z+f3xA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ATQ+sTWV31na62sSGpuy7muF8TDh6rfN26nK2pE//j+Nd+NPxyY1G/v9/HUd+jcSv
	 5zD2fmfihijrfHe1pBb9+hu7Upvmho/0l4UeX0Kx81NDIuNch4Q5KSBWutm4lP/H1Q
	 xMJxzN4KtxgLwXon3LM7Z3N6gCRhtu1G0699MFQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A5AF80567; Tue, 23 May 2023 14:23:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3934FF8055C;
	Tue, 23 May 2023 14:23:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98CF3F80552; Tue, 23 May 2023 14:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB3B7F80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3B7F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sLng8hpL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tjf3kukG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A70222A34;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GqwfBOie39jVzprd95QeelYmlNjzR/oK6v665L/0rc=;
	b=sLng8hpLOTaHmI2gUnABnmk0BkUDSqxUTkVGxObrr2XknLLtrGmgj8+mXxzh+aXLJcVOvQ
	3WDIAOBFoJYam5kU0esq4tpmifSLO/cYnyRulGQVX4xam7AuHZ0iDpVTaugRc7+1246shV
	UO//h/aAUC6fdzwRDN/0H87ylwIBEEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GqwfBOie39jVzprd95QeelYmlNjzR/oK6v665L/0rc=;
	b=tjf3kukG2jj3HLbgMXSGNRUVEzGgnnAfcdZKEu6++ibH5fQeEGZptsPcgNi2KdgQHzuwhY
	VYBW+IZr7Po8p3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E72813588;
	Tue, 23 May 2023 12:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KNiLCh6wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 03/10] rawmidi: Add UMP ioctl support
Date: Tue, 23 May 2023 14:22:40 +0200
Message-Id: <20230523122247.11744-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523122247.11744-1-tiwai@suse.de>
References: <20230523122247.11744-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HICO7ILHUPHGR7DCLF4K42ADPSRJ3S67
X-Message-ID-Hash: HICO7ILHUPHGR7DCLF4K42ADPSRJ3S67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HICO7ILHUPHGR7DCLF4K42ADPSRJ3S67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Just implement internal callbacks for two new ioctls for UMP
(ump_endpoint_info and ump_block_info).  No public API functions are
added yet here.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/rawmidi/rawmidi.c       | 19 +++++++++++++++++++
 src/rawmidi/rawmidi_hw.c    | 26 +++++++++++++++++++++++++-
 src/rawmidi/rawmidi_local.h |  5 +++++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/src/rawmidi/rawmidi.c b/src/rawmidi/rawmidi.c
index 570e06755456..8dca9312c6d9 100644
--- a/src/rawmidi/rawmidi.c
+++ b/src/rawmidi/rawmidi.c
@@ -1120,3 +1120,22 @@ ssize_t snd_rawmidi_tread(snd_rawmidi_t *rawmidi, struct timespec *tstamp, void
 		return -ENOTSUP;
 	return (rawmidi->ops->tread)(rawmidi, tstamp, buffer, size);
 }
+
+#ifndef DOXYGEN
+/*
+ * internal API functions for obtaining UMP info from rawmidi instance
+ */
+int _snd_rawmidi_ump_endpoint_info(snd_rawmidi_t *rmidi, void *info)
+{
+	if (!rmidi->ops->ump_endpoint_info)
+		return -ENXIO;
+	return rmidi->ops->ump_endpoint_info(rmidi, info);
+}
+
+int _snd_rawmidi_ump_block_info(snd_rawmidi_t *rmidi, void *info)
+{
+	if (!rmidi->ops->ump_block_info)
+		return -ENXIO;
+	return rmidi->ops->ump_block_info(rmidi, info);
+}
+#endif /* DOXYGEN */
diff --git a/src/rawmidi/rawmidi_hw.c b/src/rawmidi/rawmidi_hw.c
index e5bb3ee3b31c..69e5e02f1d6a 100644
--- a/src/rawmidi/rawmidi_hw.c
+++ b/src/rawmidi/rawmidi_hw.c
@@ -272,6 +272,28 @@ static ssize_t snd_rawmidi_hw_tread(snd_rawmidi_t *rmidi, struct timespec *tstam
 	return ret + result;
 }
 
+static int snd_rawmidi_hw_ump_endpoint_info(snd_rawmidi_t *rmidi, void *buf)
+{
+	snd_rawmidi_hw_t *hw = rmidi->private_data;
+
+	if (rmidi->version < SNDRV_PROTOCOL_VERSION(2, 0, 3))
+		return -ENXIO;
+	if (ioctl(hw->fd, SNDRV_UMP_IOCTL_ENDPOINT_INFO, buf) < 0)
+		return -errno;
+	return 0;
+}
+
+static int snd_rawmidi_hw_ump_block_info(snd_rawmidi_t *rmidi, void *buf)
+{
+	snd_rawmidi_hw_t *hw = rmidi->private_data;
+
+	if (rmidi->version < SNDRV_PROTOCOL_VERSION(2, 0, 3))
+		return -ENXIO;
+	if (ioctl(hw->fd, SNDRV_UMP_IOCTL_BLOCK_INFO, buf) < 0)
+		return -errno;
+	return 0;
+}
+
 static const snd_rawmidi_ops_t snd_rawmidi_hw_ops = {
 	.close = snd_rawmidi_hw_close,
 	.nonblock = snd_rawmidi_hw_nonblock,
@@ -282,7 +304,9 @@ static const snd_rawmidi_ops_t snd_rawmidi_hw_ops = {
 	.drain = snd_rawmidi_hw_drain,
 	.write = snd_rawmidi_hw_write,
 	.read = snd_rawmidi_hw_read,
-	.tread = snd_rawmidi_hw_tread
+	.tread = snd_rawmidi_hw_tread,
+	.ump_endpoint_info = snd_rawmidi_hw_ump_endpoint_info,
+	.ump_block_info = snd_rawmidi_hw_ump_block_info,
 };
 
 
diff --git a/src/rawmidi/rawmidi_local.h b/src/rawmidi/rawmidi_local.h
index 4a88e7e4a5ba..7025542f6774 100644
--- a/src/rawmidi/rawmidi_local.h
+++ b/src/rawmidi/rawmidi_local.h
@@ -35,6 +35,8 @@ typedef struct {
 	ssize_t (*write)(snd_rawmidi_t *rawmidi, const void *buffer, size_t size);
 	ssize_t (*read)(snd_rawmidi_t *rawmidi, void *buffer, size_t size);
 	ssize_t (*tread)(snd_rawmidi_t *rawmidi, struct timespec *tstamp, void *buffer, size_t size);
+	int (*ump_endpoint_info)(snd_rawmidi_t *rmidi, void *buf);
+	int (*ump_block_info)(snd_rawmidi_t *rmidi, void *buf);
 } snd_rawmidi_ops_t;
 
 struct _snd_rawmidi {
@@ -62,3 +64,6 @@ int snd_rawmidi_virtual_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 			     int merge, int mode);
 
 #define snd_rawmidi_conf_generic_id(id)	_snd_conf_generic_id(id)
+
+int _snd_rawmidi_ump_endpoint_info(snd_rawmidi_t *rmidi, void *info);
+int _snd_rawmidi_ump_block_info(snd_rawmidi_t *rmidi, void *info);
-- 
2.35.3

