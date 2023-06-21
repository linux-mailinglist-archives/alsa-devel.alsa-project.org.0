Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA45737FC1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E32820;
	Wed, 21 Jun 2023 13:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E32820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687345421;
	bh=j3ypb7FoZ+Hj3q0HXMuEFm0gbOUhPy66C7XhrUcvb+s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KEymteZcL9EacBNbP4sCFsrnO2pk2yBgFjcTFD0EODnAZXXAWckN08qnAE2scCVhy
	 i7T0VN2l/f04p9y2OxZ6r8LanJevYbv3T+e8c812DKlUoO0Z43lmLRiZAagyPG1t1y
	 fMjM+quwnm1nufDXbGqAdzs3O5HBKRKjB/GeC0SQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C422CF80132; Wed, 21 Jun 2023 13:02:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2375FF80163;
	Wed, 21 Jun 2023 13:02:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8E81F801D5; Wed, 21 Jun 2023 13:02:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EC087F80132
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 13:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC087F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nN8BIVkl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rIMcWGFI
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E07A1FDBC;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687345363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTK+LG8EY7gjDGXzlfTmo8KKpl89b9MC0vtmWoX81VE=;
	b=nN8BIVklLO6dE3FVzIR6pi1EAabdz9Pd+2uZfK55n+uihaiIMSk8wlAaZkSrFOYBFpct5o
	GBVEKu18tW3DuNFNHV0oNx61r6oakXQhzPZ9ynm7ribH3blhCVUcd6kw76/ETWngMBg7zH
	GuC4hiRfj7YJfugVfWWUZ55MfF8K/mY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687345363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTK+LG8EY7gjDGXzlfTmo8KKpl89b9MC0vtmWoX81VE=;
	b=rIMcWGFI7NvxwHVAscbFkTKFa0Z28wn4Bm3piy/oxx3eo7TmNf5heVlfnb+HPy38dHWFm0
	DfFncHKP51zoD3Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 739BE13A66;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +IrFG9PYkmTdHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 11:02:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: ump: Add helper to change MIDI protocol
Date: Wed, 21 Jun 2023 13:02:39 +0200
Message-Id: <20230621110241.4751-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230621110241.4751-1-tiwai@suse.de>
References: <20230621110241.4751-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P73DTII23USBBXK7BQCRUPXBYKIAG62Q
X-Message-ID-Hash: P73DTII23USBBXK7BQCRUPXBYKIAG62Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P73DTII23USBBXK7BQCRUPXBYKIAG62Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a preliminary patch for MIDI 2.0 USB gadget driver.
Export a new helper to allow changing the current MIDI protocol from
the outside.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h |  2 ++
 sound/core/ump.c    | 31 ++++++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 68478e7be3b4..3c7e67475676 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -108,6 +108,8 @@ static inline int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 }
 #endif
 
+int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol);
+
 /*
  * Some definitions for UMP
  */
diff --git a/sound/core/ump.c b/sound/core/ump.c
index a64dc2d8a129..4150b9c0b35b 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -671,18 +671,35 @@ static void seq_notify_protocol(struct snd_ump_endpoint *ump)
 #endif /* CONFIG_SND_SEQUENCER */
 }
 
+/**
+ * snd_ump_switch_protocol - switch MIDI protocol
+ * @ump: UMP endpoint
+ * @protocol: protocol to switch to
+ *
+ * Returns 1 if the protocol is actually switched, 0 if unchanged
+ */
+int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol)
+{
+	protocol &= ump->info.protocol_caps;
+	if (protocol == ump->info.protocol)
+		return 0;
+
+	ump->info.protocol = protocol;
+	ump_dbg(ump, "New protocol = %x (caps = %x)\n",
+		protocol, ump->info.protocol_caps);
+	seq_notify_protocol(ump);
+	return 1;
+}
+EXPORT_SYMBOL_GPL(snd_ump_switch_protocol);
+
 /* handle EP stream config message; update the UMP protocol */
 static int ump_handle_stream_cfg_msg(struct snd_ump_endpoint *ump,
 				     const union snd_ump_stream_msg *buf)
 {
-	unsigned int old_protocol = ump->info.protocol;
-
-	ump->info.protocol =
+	unsigned int protocol =
 		(buf->stream_cfg.protocol << 8) | buf->stream_cfg.jrts;
-	ump_dbg(ump, "Current protocol = %x (caps = %x)\n",
-		ump->info.protocol, ump->info.protocol_caps);
-	if (ump->parsed && ump->info.protocol != old_protocol)
-		seq_notify_protocol(ump);
+
+	snd_ump_switch_protocol(ump, protocol);
 	return 1; /* finished */
 }
 
-- 
2.35.3

