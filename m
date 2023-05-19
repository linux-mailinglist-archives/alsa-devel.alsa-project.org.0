Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1588F7093C6
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6330E836;
	Fri, 19 May 2023 11:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6330E836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489142;
	bh=w18sbtJIkHXjCL1PTOBz/9PGh/ThhdG1HlXbcrwEmUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLfAStIExyPuMXSFHLcUq9hDI9dDFJyGgocS+WkpX+c5SD0ZzPDdbnR4zNzEklz1n
	 fkS6hI7naySz18uFUqRJuyjemM+SFCc+v1WHHkePXNpJFMDqiDCs73Of1z1yJXGnha
	 UpasLAnCLo+gf+8MNS4L03YVsN65LOHWzVtQdUe8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D7AAF80694; Fri, 19 May 2023 11:33:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 243E3F8068A;
	Fri, 19 May 2023 11:33:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24723F80614; Fri, 19 May 2023 11:32:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E8A2EF8057C
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A2EF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=puVqaIdp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IAp+Cs3h
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDD7E222AD;
	Fri, 19 May 2023 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9zSH66PKLZSek1+f7HTHKq9RrcGGPrH4bCfODwVZUA=;
	b=puVqaIdpkndJ4oA4wXhPx+DOkqA8RV+EXSSWdoay/mdCcqlJeEuRKSNA1caza+fTvRgCRB
	vH4iXTYSYSQruGVuMLKvjxUYgcZLaFYP3UdrNI9KklvbYSBf52OfHSPi11AaERrweKTRDe
	C+Ef1vh8yFVDUNyz+/gp61uuyuth5Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9zSH66PKLZSek1+f7HTHKq9RrcGGPrH4bCfODwVZUA=;
	b=IAp+Cs3hGxBko9eYTQtT+Szcb6c5FYciTjzlMnvMueuHu9yNp1VLNrwZ1mpNsfWIU51s+r
	sRDCu9l0QZNF2ADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9928A13A12;
	Fri, 19 May 2023 09:31:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KGCAJP9BZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 23/36] ALSA: seq: Introduce SNDRV_SEQ_IOCTL_USER_PVERSION
 ioctl
Date: Fri, 19 May 2023 11:31:01 +0200
Message-Id: <20230519093114.28813-24-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2WQFALCNNVTRSNK4FA4WXQF2EN2VXNQI
X-Message-ID-Hash: 2WQFALCNNVTRSNK4FA4WXQF2EN2VXNQI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WQFALCNNVTRSNK4FA4WXQF2EN2VXNQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For the future extension of ALSA sequencer ABI, introduce a new ioctl
SNDRV_SEQ_IOCTL_USER_PVERSION.  This is similar like the ioctls used
in PCM and other interfaces, for an application to specify its
supporting ABI version.

The use of this ioctl will be mandatory for the upcoming UMP support.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h | 1 +
 sound/core/seq/seq_clientmgr.c  | 8 ++++++++
 sound/core/seq/seq_clientmgr.h  | 1 +
 sound/core/seq/seq_compat.c     | 1 +
 4 files changed, 11 insertions(+)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index 00d2703e8fca..4a3c5a718bae 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -561,6 +561,7 @@ struct snd_seq_query_subs {
 #define SNDRV_SEQ_IOCTL_CLIENT_ID	_IOR ('S', 0x01, int)
 #define SNDRV_SEQ_IOCTL_SYSTEM_INFO	_IOWR('S', 0x02, struct snd_seq_system_info)
 #define SNDRV_SEQ_IOCTL_RUNNING_MODE	_IOWR('S', 0x03, struct snd_seq_running_info)
+#define SNDRV_SEQ_IOCTL_USER_PVERSION	_IOW('S', 0x04, int)
 
 #define SNDRV_SEQ_IOCTL_GET_CLIENT_INFO	_IOWR('S', 0x10, struct snd_seq_client_info)
 #define SNDRV_SEQ_IOCTL_SET_CLIENT_INFO	_IOW ('S', 0x11, struct snd_seq_client_info)
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 0f26f20596d7..89a8d14df83b 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1056,6 +1056,12 @@ static int snd_seq_ioctl_pversion(struct snd_seq_client *client, void *arg)
 	return 0;
 }
 
+static int snd_seq_ioctl_user_pversion(struct snd_seq_client *client, void *arg)
+{
+	client->user_pversion = *(unsigned int *)arg;
+	return 0;
+}
+
 static int snd_seq_ioctl_client_id(struct snd_seq_client *client, void *arg)
 {
 	int *client_id = arg;
@@ -1985,6 +1991,7 @@ static const struct ioctl_handler {
 	int (*func)(struct snd_seq_client *client, void *arg);
 } ioctl_handlers[] = {
 	{ SNDRV_SEQ_IOCTL_PVERSION, snd_seq_ioctl_pversion },
+	{ SNDRV_SEQ_IOCTL_USER_PVERSION, snd_seq_ioctl_user_pversion },
 	{ SNDRV_SEQ_IOCTL_CLIENT_ID, snd_seq_ioctl_client_id },
 	{ SNDRV_SEQ_IOCTL_SYSTEM_INFO, snd_seq_ioctl_system_info },
 	{ SNDRV_SEQ_IOCTL_RUNNING_MODE, snd_seq_ioctl_running_mode },
@@ -2125,6 +2132,7 @@ int snd_seq_create_kernel_client(struct snd_card *card, int client_index,
 	client->accept_input = 1;
 	client->accept_output = 1;
 	client->data.kernel.card = card;
+	client->user_pversion = SNDRV_SEQ_VERSION;
 		
 	va_start(args, name_fmt);
 	vsnprintf(client->name, sizeof(client->name), name_fmt, args);
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index f05704e45ab4..abe0ceadf3da 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -35,6 +35,7 @@ struct snd_seq_client {
 	snd_seq_client_type_t type;
 	unsigned int accept_input: 1,
 		accept_output: 1;
+	unsigned int user_pversion;
 	char name[64];		/* client name */
 	int number;		/* client number */
 	unsigned int filter;	/* filter flags */
diff --git a/sound/core/seq/seq_compat.c b/sound/core/seq/seq_compat.c
index 54723566ce24..c0ce6236dc7f 100644
--- a/sound/core/seq/seq_compat.c
+++ b/sound/core/seq/seq_compat.c
@@ -81,6 +81,7 @@ static long snd_seq_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 
 	switch (cmd) {
 	case SNDRV_SEQ_IOCTL_PVERSION:
+	case SNDRV_SEQ_IOCTL_USER_PVERSION:
 	case SNDRV_SEQ_IOCTL_CLIENT_ID:
 	case SNDRV_SEQ_IOCTL_SYSTEM_INFO:
 	case SNDRV_SEQ_IOCTL_GET_CLIENT_INFO:
-- 
2.35.3

