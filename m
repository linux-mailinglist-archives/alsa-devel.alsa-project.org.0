Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE6757F34
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1A9843;
	Tue, 18 Jul 2023 16:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1A9843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689792;
	bh=suGC+6O7AgKTVT5lmq2HFhS76+Cl7FPXoM5ryMkM7lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dg8fQNQl4I6uVeZ+v0LRLigN7bJszAvpNHpDfQvqbtOtunpFu/z+08RWqvKQBfmVI
	 u8MA8puOW5j5VOV/1fbuwi+PAaAjav1/x958vKkdfbegutl0G01lclHAXJGmMn06YA
	 CQ6AtLRDl09W++e2u4sj7Mk7dbVnOCkmPk32zqso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2A8AF805D8; Tue, 18 Jul 2023 16:13:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05888F80579;
	Tue, 18 Jul 2023 16:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08DDDF805BB; Tue, 18 Jul 2023 16:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABD2FF8055B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD2FF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EsNP75bv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tAUnYsiF
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2BC701FDC7;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlT2QoI9JR4A5g5znaKqOFk+eGfB+vsK/7AliGTu7tg=;
	b=EsNP75bv0OzDb6nQybwTdNnPcDRDN9T6dbLNCrIfVR6byHuvAfQfebzH7yKTlW37h78+iZ
	HqPy+0BroFNJPD54OBmPkAfTnUCQtHHPTToE+Rp6nN2fZb76+8qx0qRb47J3CLJ/r+G/jT
	6441IwSGGkEbESXA7CTzr9gx7aJr8Bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlT2QoI9JR4A5g5znaKqOFk+eGfB+vsK/7AliGTu7tg=;
	b=tAUnYsiF+LPEFp8bEqBr0N7plQ9oHxbiKAPfmzuli/twoqQSmCacxx4RSzELWKGmlNIWFH
	inIH99pX3dmkslAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 10A70134B0;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IHYRA/ydtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 08/11] ALSA: control: Make snd_ctl_find_id() argument const
Date: Tue, 18 Jul 2023 16:13:01 +0200
Message-Id: <20230718141304.1032-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DF2LEE24VCIGVRPG4ZZW22JATCHI55U3
X-Message-ID-Hash: DF2LEE24VCIGVRPG4ZZW22JATCHI55U3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DF2LEE24VCIGVRPG4ZZW22JATCHI55U3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The id object passed to snd_ctl_find_id() is only read, and we can
mark it with const gracefully.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h | 2 +-
 sound/core/control.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index cc3dcc6cfb0f..e61b749bf204 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -141,7 +141,7 @@ int snd_ctl_rename_id(struct snd_card * card, struct snd_ctl_elem_id *src_id, st
 void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl, const char *name);
 int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id, int active);
 struct snd_kcontrol *snd_ctl_find_numid(struct snd_card * card, unsigned int numid);
-struct snd_kcontrol *snd_ctl_find_id(struct snd_card * card, struct snd_ctl_elem_id *id);
+struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card, const struct snd_ctl_elem_id *id);
 
 int snd_ctl_create(struct snd_card *card);
 
diff --git a/sound/core/control.c b/sound/core/control.c
index 8aaa2a84a670..180e5768a10f 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -858,7 +858,7 @@ EXPORT_SYMBOL(snd_ctl_find_numid);
  *
  */
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
-				     struct snd_ctl_elem_id *id)
+				     const struct snd_ctl_elem_id *id)
 {
 	struct snd_kcontrol *kctl;
 
-- 
2.35.3

