Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08B723DFD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 11:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A081829;
	Tue,  6 Jun 2023 11:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A081829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686044504;
	bh=uuZZI0pG1mTR7xg5E3i68/KvoRA8LHroiLU0UFe6FFE=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E3NaHrgXC5Gtfy95Vw0fo09QykDfKwQTFjAZ4tSRXVHHiMgUlrKMgY/jYRbMaEFma
	 Chgx4XuxKzc5odAGmTXDd31e6924vQ2p3H/QQzKllbGorHHbNrM4MVkWB0LnJII3C3
	 ouWJaqQja8TKZEubV4OyxIDHCw1uo8kIf377PcoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 303C1F800C8; Tue,  6 Jun 2023 11:40:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E05DBF804DA;
	Tue,  6 Jun 2023 11:40:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C29BF80520; Tue,  6 Jun 2023 11:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDDD5F800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 11:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDD5F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sD8Z1VMh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YsJkuyEW
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9BD0A219A2;
	Tue,  6 Jun 2023 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686044437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=NkzEZlN89Dfma2O7X8RLWuiD9NNBWfEAZi+10DTV+mQ=;
	b=sD8Z1VMhire/SjzWzuq6hOXsa1962QL8wsgnB5wduZcopFsavfBzqy2+tF4bGWXc4P098z
	3sWAQlBYCwpuybRLnGzC52qMBsCsZJ2j8sAvdJI9hxlwJhlfLIbs2/qjG6CsI7TJ6rhNvp
	8b2heCYP9DVC+nB7hroDtE7vJmM5riw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686044437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=NkzEZlN89Dfma2O7X8RLWuiD9NNBWfEAZi+10DTV+mQ=;
	b=YsJkuyEWIHkdRXISdnPnxlP62GWz4KTnekpPI4Z3PcanVm665dvUw9ZVAMHddTg8EHHdgm
	i+3p8TzgXKwmSICQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8083413519;
	Tue,  6 Jun 2023 09:40:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HxOFHhX/fmQrWQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 09:40:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: control: Keep the previous numid at snd_ctl_rename_id()
Date: Tue,  6 Jun 2023 11:40:35 +0200
Message-Id: <20230606094035.14808-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OQPS3IAKG53YPSAUH2SNGRGPJEL2W27Z
X-Message-ID-Hash: OQPS3IAKG53YPSAUH2SNGRGPJEL2W27Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQPS3IAKG53YPSAUH2SNGRGPJEL2W27Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We don't need to change the numid at each time snd_ctl_rename_id() is
called, as the control element size itself doesn't change.  Let's keep
the previous numid value.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 82aa1af1d1d8..f4a90a687ae5 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -730,12 +730,16 @@ EXPORT_SYMBOL_GPL(snd_ctl_activate_id);
  * Finds the control with the old id from the card, and replaces the
  * id with the new one.
  *
+ * The function tries to keep the already assigned numid while replacing
+ * the rest.
+ *
  * Return: Zero if successful, or a negative error code on failure.
  */
 int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 		      struct snd_ctl_elem_id *dst_id)
 {
 	struct snd_kcontrol *kctl;
+	int saved_numid;
 
 	down_write(&card->controls_rwsem);
 	kctl = snd_ctl_find_id(card, src_id);
@@ -743,10 +747,10 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
 	}
+	saved_numid = kctl->id.numid;
 	remove_hash_entries(card, kctl);
 	kctl->id = *dst_id;
-	kctl->id.numid = card->last_numid + 1;
-	card->last_numid += kctl->count;
+	kctl->id.numid = saved_numid;
 	add_hash_entries(card, kctl);
 	up_write(&card->controls_rwsem);
 	return 0;
-- 
2.35.3

