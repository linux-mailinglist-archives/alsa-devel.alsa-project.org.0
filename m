Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711175A90A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26AC37F8;
	Thu, 20 Jul 2023 10:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26AC37F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841362;
	bh=ttdmDmLJzKov7q6ZzFVoreZPmgxZSZarpVuWEDB5mys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qj4SEWM3c0iMTFwYFHpu0qv0sp07QFtL3lD43PARu0Mpz9sK5VPu5WiRNfyq6Z638
	 RSeglXcGMZkw5zxCj3kXsW/Q82ZjCgB4UBgVP7jU4jOl1p0obiW4OZmUFU0oRSIRSk
	 8UJLd25+gbnx5jX9/E6rc0B1YQqgIpo5K7+X4Jjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACDC3F8057D; Thu, 20 Jul 2023 10:21:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACE3F80563;
	Thu, 20 Jul 2023 10:21:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58298F8057C; Thu, 20 Jul 2023 10:21:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E72AF80557
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E72AF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=N4+FuRuX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sa9ibJjT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AEA2E20598;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ2jjyvedNZu7vtrtVYWzfG6FJ6u9u6YNWL9iFvKWCw=;
	b=N4+FuRuXOZ7nVVFExWaT+Fr5ZBpSqaVSBWoUoRwbgB4J/6VG0WNv3azPQwEqhCfhVm0tS+
	g2KR8pCUK/3FgQ8cmR6+ULCRgYp9Wq30JvJ6UtJ9UvqwHyTuyoUtqzujDengunezPIikS7
	JAjf4OpQnz4pqsrq5MnY//WW2rTBnPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ2jjyvedNZu7vtrtVYWzfG6FJ6u9u6YNWL9iFvKWCw=;
	b=Sa9ibJjT3LcEiUjJVrqkTdGMIjGKVET7LHgaN1NxGa+8HmfAIbJtIxyuwiTMwzq0uoifRb
	XZur16DSmptK9zAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93F9D13924;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iGAwI3vuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 01/11] ALSA: control: Introduce snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:20:58 +0200
Message-Id: <20230720082108.31346-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LDNZSXQRANCOXMCIXFNW2SSXD5DPHCNZ
X-Message-ID-Hash: LDNZSXQRANCOXMCIXFNW2SSXD5DPHCNZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDNZSXQRANCOXMCIXFNW2SSXD5DPHCNZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A commonly seen pattern is to run snd_ctl_find_id() for a mixer
control element with a given string.  Let's provide a standard helper
for achieving that for simplifying the code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/sound/control.h b/include/sound/control.h
index 42e8dbb22d8e..69d950a34ca3 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -145,6 +145,28 @@ struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card, unsigned int numi
 struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card, const struct snd_ctl_elem_id *id);
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card, const struct snd_ctl_elem_id *id);
 
+/**
+ * snd_ctl_find_id_mixer - find the control instance with the given name string
+ * @card: the card instance
+ * @name: the name string
+ *
+ * Finds the control instance with the given name and
+ * @SNDRV_CTL_ELEM_IFACE_MIXER. Other fields are set to zero.
+ *
+ * This is merely a wrapper to snd_ctl_find_id().
+ *
+ * Return: The pointer of the instance if found, or %NULL if not.
+ */
+static inline struct snd_kcontrol *
+snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
+{
+	struct snd_ctl_elem_id id = {};
+
+	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	strscpy(id.name, name, sizeof(id.name));
+	return snd_ctl_find_id(card, &id);
+}
+
 int snd_ctl_create(struct snd_card *card);
 
 int snd_ctl_register_ioctl(snd_kctl_ioctl_func_t fcn);
-- 
2.35.3

