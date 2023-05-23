Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8070D67B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8E974C;
	Tue, 23 May 2023 10:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8E974C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828861;
	bh=VutwHKkNUcgBrityYjS/Ev1MG5G+jCAv00K9rVoaHH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ubEEdOBoJuOuHlzyan0iJElBZHG+PJ5+qr3OUNgdaSl9fUP2Zkr/XW00TQZJTDt+I
	 T72OQZattIvhNJ8xhHs1wqI7+FYmwtSSfKB9xJ5Z3fvyiQ1ZaAsYGwmD22Snc3Wnpt
	 /JdB4gukBzFxGKV2t4PdOgwBnA32q2h3o+18WGBM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53F58F80674; Tue, 23 May 2023 09:55:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F97AF805AF;
	Tue, 23 May 2023 09:55:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F55BF80654; Tue, 23 May 2023 09:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9273F80571
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9273F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sGnXeIWD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4Ut8mft+
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1B3D20413;
	Tue, 23 May 2023 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OK0/8+s6e4TrHDufqC0z71Ik1XqkA7S/T2+8+IjWHaE=;
	b=sGnXeIWDoZR2Ox+RlzsYXib3Mi6YnhEf+BsZExQqtiT9CQIGLmD6ynu+yfqyUumKdg7x/8
	ltuxZv2tilYwSJDDgk3ckfs0LDVNahpahSNc1mmZNFU7ZZ1LvRzq8XFFRDTMAK232NlzwZ
	sbBtNxBUGNynY+TGo29p7LZhyS40yKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OK0/8+s6e4TrHDufqC0z71Ik1XqkA7S/T2+8+IjWHaE=;
	b=4Ut8mft+HnygagJk3mCWYaUb0Zq5Eoz8w1S0Vs5IxXEvA2FjQvf0oR3tAYkdxDPdnVfUFo
	EjEsgge7LCb8t0BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FB7213588;
	Tue, 23 May 2023 07:54:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qOY5GSFxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/37] ALSA: seq: Introduce SNDRV_SEQ_IOCTL_USER_PVERSION
 ioctl
Date: Tue, 23 May 2023 09:53:45 +0200
Message-Id: <20230523075358.9672-25-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I7ZPM3WHIFOZELYIDJFSV6XY2DTVQH2H
X-Message-ID-Hash: I7ZPM3WHIFOZELYIDJFSV6XY2DTVQH2H
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
Archived-At: <>
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

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
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

