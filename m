Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767E70D687
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A70FA4B;
	Tue, 23 May 2023 10:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A70FA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828931;
	bh=XUpYdy0hHn+ixKI+HpJ9fsG0NqStjpcCrjZtW/jRZNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QYy0MQQAUjpiJfoVTE/G5ysV8VEqXjUD6vO2AkD9baE6HmxhDlS+aCuDRgRnHMrqi
	 nK747lKx1eBHSCK4MU6dnT3m7BYpewdHLIIwt20KBAzqvFbsvojFbsLqMKzp2Py5E8
	 k2X67GU/dyv1Xx5f6a3xHjU9W8VHL/V3sSNcHPNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2D27F805CB; Tue, 23 May 2023 09:55:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C85F1F8057C;
	Tue, 23 May 2023 09:55:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17D08F80674; Tue, 23 May 2023 09:55:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 884B6F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 884B6F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RUCnozLD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=w9Z3PBz7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6540420415;
	Tue, 23 May 2023 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Za1t99tL4S6YC12LH4d/NDSvAlOTykT+bpOd7rGANIA=;
	b=RUCnozLDzs9aFM3/ILWQ7oQaWVqs1TqOT/UoX3KpreEBQOFIrcs0mc7KZ6sUK+X7VmxWtb
	222G3lMexXz5nfoqBBRFCdjbNwOGhP948JleujhTJhFOwj1sl5SNk0cTq2JPZCXJXh52Pu
	VVjWHiMrt+zGY8lZ6RUHqRhI4BFijlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Za1t99tL4S6YC12LH4d/NDSvAlOTykT+bpOd7rGANIA=;
	b=w9Z3PBz7pSilQub8pqx8tNLeeuXVwQSJ/igFapMSt70tz3VsFw5y8AHJ39E4S09mB1uKAI
	moY/G2RJT7U80YAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0812513A1A;
	Tue, 23 May 2023 07:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4DMUACJxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/37] ALSA: seq: Add port inactive flag
Date: Tue, 23 May 2023 09:53:47 +0200
Message-Id: <20230523075358.9672-27-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7LPG3XA2U22R3LWNZPKVCBFT5ZGQBCDD
X-Message-ID-Hash: 7LPG3XA2U22R3LWNZPKVCBFT5ZGQBCDD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LPG3XA2U22R3LWNZPKVCBFT5ZGQBCDD/>
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

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
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
index 500b1a5a9679..42f4172d4766 100644
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

