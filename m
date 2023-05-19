Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB27F7093D3
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:40:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 453939F6;
	Fri, 19 May 2023 11:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 453939F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489225;
	bh=qXkeXoazixd/QX48vQSMzY2HULagmIKJqnOPlV7NfLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XZxhdHlPFN8EgL1SU1SscuQUEra/3lx8tjbAZxAaPIAveOKqSpPJYsg5rfTwuPVEZ
	 B7x/JVott+0ta9kfv5kTdw7XztuWNd0AOXhSPGqXAKKrODrS1nOOSqEEmFH+7bJnIj
	 jmLo9qIimb7IiUJLY8iiSkkBOh9kumu/NzhbJazs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74D98F806C7; Fri, 19 May 2023 11:33:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1456F806C3;
	Fri, 19 May 2023 11:33:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C31AF80634; Fri, 19 May 2023 11:32:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E37A1F805AD
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E37A1F805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=t7lu+feE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SiGNHPyo
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A0F6E1FE4B;
	Fri, 19 May 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1TEiSv0o3bNfukbYFt8AXhybPoVqwjpcYPyqBGQTlU=;
	b=t7lu+feEt5qu08v1HxYzhYtAgR26S8XfPKpBY9i2AbGehY1sFLM7RRq20VG586tX+M7K6U
	0dw6GDIbF3s1QmD1tt8+3FsAB4BVK8ykc9ETxp99WiA2/7qXhxZxXm9/oSydnzibrd+ria
	3nC8iJwCLZm+CwXBzK6KEaJZDlxo15Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1TEiSv0o3bNfukbYFt8AXhybPoVqwjpcYPyqBGQTlU=;
	b=SiGNHPyoOJ4hegNpZQlBYziB2Db4EVTTfePySayMLHwHBrrnYtWgot+/fUzKsQ/R6Np+Jg
	UweSkC+GMZiO1ZAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FC6E13A12;
	Fri, 19 May 2023 09:31:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6CDZHQJCZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 28/36] ALSA: seq: Add UMP group number to snd_seq_port_info
Date: Fri, 19 May 2023 11:31:06 +0200
Message-Id: <20230519093114.28813-29-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2UELYGEM7ATFBABXSQPBMCO6UFVUC3Q7
X-Message-ID-Hash: 2UELYGEM7ATFBABXSQPBMCO6UFVUC3Q7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UELYGEM7ATFBABXSQPBMCO6UFVUC3Q7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add yet more new filed "ump_group" to snd_seq_port_info for specifying
the associated UMP Group number for each sequencer port.  This will be
referred in the upcoming automatic UMP conversion in sequencer core.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h | 3 ++-
 sound/core/seq/seq_ports.c      | 9 +++++++--
 sound/core/seq/seq_ports.h      | 3 ++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index eae1e0b0bf37..2470eaa5edc5 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -478,7 +478,8 @@ struct snd_seq_port_info {
 	unsigned int flags;		/* misc. conditioning */
 	unsigned char time_queue;	/* queue # for timestamping */
 	unsigned char direction;	/* port usage direction (r/w/bidir) */
-	char reserved[58];		/* for future use */
+	unsigned char ump_group;	/* 0 = UMP EP (no conversion), 1-16 = UMP group number */
+	char reserved[57];		/* for future use */
 };
 
 
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 3734e6352f5e..6926e14055f3 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -357,8 +357,12 @@ int snd_seq_set_port_info(struct snd_seq_client_port * port,
 	port->time_real = (info->flags & SNDRV_SEQ_PORT_FLG_TIME_REAL) ? 1 : 0;
 	port->time_queue = info->time_queue;
 
-	/* direction */
+	/* UMP direction and group */
 	port->direction = info->direction;
+	port->ump_group = info->ump_group;
+	if (port->ump_group > SNDRV_UMP_MAX_GROUPS)
+		port->ump_group = 0;
+
 	/* fill default port direction */
 	if (!port->direction) {
 		if (info->capability & SNDRV_SEQ_PORT_CAP_READ)
@@ -404,8 +408,9 @@ int snd_seq_get_port_info(struct snd_seq_client_port * port,
 		info->time_queue = port->time_queue;
 	}
 
-	/* direction */
+	/* UMP direction and group */
 	info->direction = port->direction;
+	info->ump_group = port->ump_group;
 
 	return 0;
 }
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index dce733ab2398..c6c138edceab 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -72,8 +72,9 @@ struct snd_seq_client_port {
 	int midi_voices;
 	int synth_voices;
 		
-	/* direction */
+	/* UMP direction and group */
 	unsigned char direction;
+	unsigned char ump_group;
 };
 
 struct snd_seq_client;
-- 
2.35.3

