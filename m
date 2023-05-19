Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326707093CE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84198AEA;
	Fri, 19 May 2023 11:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84198AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489176;
	bh=qhDh6vveq9c2NORGgcBprPI7LvgZUd/WEMtL9l+s4X0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k13YZoiAYdU2S+tAGgNJbn5zluE0qRwCSwAO9Cwx92NjL9jDbxXLn32P+gRN41Hzk
	 ZdSGUe7bd9+0XNtWj4oduKIA1VQs6FR8nT4UA0DmZHiygZ0GUdjBbNZ0KASBi8S0BB
	 fKEp1agpTCKNYOeYrcIRXqkqjQaQ/p0LId1r6KiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20EACF8069D; Fri, 19 May 2023 11:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 693D7F806AC;
	Fri, 19 May 2023 11:33:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75A5CF80618; Fri, 19 May 2023 11:32:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 45070F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45070F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=T2VSxCbo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vCTVRHEH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E20DD2223A;
	Fri, 19 May 2023 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3ak395N/SRLOhFT0C22KXLk1FA6ueXIUq+htVssWMU=;
	b=T2VSxCbojTNSYhQjMxHEcqSNKvz2ewEH9BfHGZblaEi6wXScREZZklWmLaDHvfplU/AfhQ
	ZcBazuC5HOV2aAUbof+lb54+AcOnxObUuTa5bowQVgtO5sNO7LU5JIQ/HUWlbCyALO6mdl
	P9YgcckpcWHig8yrP7//cIKqDjPd638=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3ak395N/SRLOhFT0C22KXLk1FA6ueXIUq+htVssWMU=;
	b=vCTVRHEH6U+WiXo8W9MaEdb8VwrPfoeG1N+lx/tieqXfUZrPsjhsKlYYC4kP+t35CMFmZ/
	oSGTKz8UjwUpB2CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2FF913A12;
	Fri, 19 May 2023 09:31:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GNCrKgBCZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 25/36] ALSA: seq: Add port inactive flag
Date: Fri, 19 May 2023 11:31:03 +0200
Message-Id: <20230519093114.28813-26-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ONCH3OB5YLX75EJR7OMGRSLUVCMFL5B6
X-Message-ID-Hash: ONCH3OB5YLX75EJR7OMGRSLUVCMFL5B6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONCH3OB5YLX75EJR7OMGRSLUVCMFL5B6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This extends the ALSA sequencer port capability bit to indicate the
"inactive" flag.  When this flag is set, the port is essentially
invisible, and doesn't appear in the port query ioctls, while the
direct access and the connection to this port are still allowed.  The
active/inactive state can be flipped dynamically, so that it can be
visible at any time later.

This feature is introduced basically for UMP; some UMP Groups in a UMP
Block may be unassigned, hence those are practically invisible.  On
ALSA sequencer, the corresponding sequencer ports will get this new
"inactive" flag to indicate the invisible state.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h | 1 +
 sound/core/seq/seq_clientmgr.c  | 2 ++
 sound/core/seq/seq_ports.c      | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index b87950cbfb79..c6ca6609790b 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -427,6 +427,7 @@ struct snd_seq_remove_events {
 #define SNDRV_SEQ_PORT_CAP_SUBS_READ	(1<<5)	/* allow read subscription */
 #define SNDRV_SEQ_PORT_CAP_SUBS_WRITE	(1<<6)	/* allow write subscription */
 #define SNDRV_SEQ_PORT_CAP_NO_EXPORT	(1<<7)	/* routing not allowed */
+#define SNDRV_SEQ_PORT_CAP_INACTIVE	(1<<8)	/* inactive port */
 
 	/* port type */
 #define SNDRV_SEQ_PORT_TYPE_SPECIFIC	(1<<0)	/* hardware specific */
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 801d5eee21eb..6508ce63f761 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2416,6 +2416,8 @@ static void snd_seq_info_dump_ports(struct snd_info_buffer *buffer,
 
 	mutex_lock(&client->ports_mutex);
 	list_for_each_entry(p, &client->ports_list_head, list) {
+		if (p->capability & SNDRV_SEQ_PORT_CAP_INACTIVE)
+			continue;
 		snd_iprintf(buffer, "  Port %3d : \"%s\" (%c%c%c%c)\n",
 			    p->addr.port, p->name,
 			    FLAG_PERM_RD(p->capability),
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 188262b04b72..842ea3fb2800 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -69,11 +69,15 @@ struct snd_seq_client_port *snd_seq_port_query_nearest(struct snd_seq_client *cl
 {
 	int num;
 	struct snd_seq_client_port *port, *found;
+	bool check_inactive = (pinfo->capability & SNDRV_SEQ_PORT_CAP_INACTIVE);
 
 	num = pinfo->addr.port;
 	found = NULL;
 	read_lock(&client->ports_lock);
 	list_for_each_entry(port, &client->ports_list_head, list) {
+		if ((port->capability & SNDRV_SEQ_PORT_CAP_INACTIVE) &&
+		    !check_inactive)
+			continue; /* skip inactive ports */
 		if (port->addr.port < num)
 			continue;
 		if (port->addr.port == num) {
-- 
2.35.3

