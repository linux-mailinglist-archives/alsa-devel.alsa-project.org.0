Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8C7093E1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F151850;
	Fri, 19 May 2023 11:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F151850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489323;
	bh=LLHBgG8FmNJV84qE3cts3bZbA7HGjO5MZ6yfD5c2xEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qs92bweDmJZbxo3Iy3fMt+YzZ6bo2BEPjN2kuevO2dGW5F9ZHuzOnj0GP7RSgfEZJ
	 EKqVrdP9UiuRcqiE20H7I22DithWnGcipT73ovhT3OkDEX6Ksp+f3QMkAfpOofh4/K
	 29KFQnYIM+78iz4CHZgsOdNR0XTwoFVREnfPFBQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 477CAF805B4; Fri, 19 May 2023 11:33:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB54F805BB;
	Fri, 19 May 2023 11:33:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B4C1F80638; Fri, 19 May 2023 11:32:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CFB3AF805C1
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB3AF805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RJw3i3ng;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=htgSCeil
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C53022245;
	Fri, 19 May 2023 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pka+FAS5v3W+sCEaoavXmDKAfyes9oP7et2fJmTgVyc=;
	b=RJw3i3nguYq2ZWpS1a5C1XLsaXuWtqdYpWc9U4G2H/6TxhBoSRADqejNRNEEULbDJ0Mhq4
	vX7TFX5PkyOmKQpcdcDn9+kbLmw3xjptVGUj2NKf4jk7tlpb4QWJdUjt33BLfV2yxp2Lwe
	sKDlE/V1ZXBhRUbizM1gnjJKszbh8KU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488710;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pka+FAS5v3W+sCEaoavXmDKAfyes9oP7et2fJmTgVyc=;
	b=htgSCeil8q+1iKaIdmhTa1K3nSNajUXJt+t9dGcAO8NyU7Ri5S7sz17YqY8FebLJn5J3gV
	oTJzsRZcfXqTlOCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71CCD13A12;
	Fri, 19 May 2023 09:31:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +E3wGQZCZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 34/36] ALSA: seq: Print UMP Endpoint and Block information in
 proc outputs
Date: Fri, 19 May 2023 11:31:12 +0200
Message-Id: <20230519093114.28813-35-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QJ64OXV6VCKGK2HDN2A3YV4ICEXBQ5MC
X-Message-ID-Hash: QJ64OXV6VCKGK2HDN2A3YV4ICEXBQ5MC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJ64OXV6VCKGK2HDN2A3YV4ICEXBQ5MC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch enhances the /proc/asound/seq/clients output to show a few
more information about the assigned UMP Endpoint and Blocks.

The "Groups" are shown in 1-based group number to align with the
sequencer client name and port number.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 03ca78ea2cce..8f416f5d0b4d 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2120,6 +2120,33 @@ static void terminate_ump_info_strings(void *p, int type)
 	}
 }
 
+#ifdef CONFIG_SND_PROC_FS
+static void dump_ump_info(struct snd_info_buffer *buffer,
+			  struct snd_seq_client *client)
+{
+	struct snd_ump_endpoint_info *ep;
+	struct snd_ump_block_info *bp;
+	int i;
+
+	if (!client->ump_info)
+		return;
+	ep = client->ump_info[SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT];
+	if (ep && ep->name)
+		snd_iprintf(buffer, "  UMP Endpoint: \"%s\"\n", ep->name);
+	for (i = 0; i < SNDRV_UMP_MAX_BLOCKS; i++) {
+		bp = client->ump_info[i + 1];
+		if (bp && bp->name) {
+			snd_iprintf(buffer, "  UMP Block %d: \"%s\" [%s]\n",
+				    i, bp->name,
+				    bp->active ? "Active" : "Inactive");
+			snd_iprintf(buffer, "    Groups: %d-%d\n",
+				    bp->first_group + 1,
+				    bp->first_group + bp->num_groups);
+		}
+	}
+}
+#endif
+
 /* UMP-specific ioctls -- called directly without data copy */
 static int snd_seq_ioctl_client_ump_info(struct snd_seq_client *caller,
 					 unsigned int cmd,
@@ -2654,6 +2681,9 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
 			    c, client->name,
 			    client->type == USER_CLIENT ? "User" : "Kernel",
 			    midi_version_string(client->midi_version));
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP)
+		dump_ump_info(buffer, client);
+#endif
 		snd_seq_info_dump_ports(buffer, client);
 		if (snd_seq_write_pool_allocated(client)) {
 			snd_iprintf(buffer, "  Output pool :\n");
-- 
2.35.3

