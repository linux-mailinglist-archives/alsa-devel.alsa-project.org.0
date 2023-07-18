Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB48757F3A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9C9E1F6;
	Tue, 18 Jul 2023 16:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9C9E1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689824;
	bh=ujTvsoix7a+61iyd1/WRXFH3nwu/v1kWVxSaRd/90Gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kHxq2oOc0SRAdeYfqx4+OvhwwrNTtTLSURB8KB3itfeHG4uwgk/JLMLnzVrFwJV2F
	 ywDI24H/zRj27bjerw/zXeDgbE6KqY0jyRLNQ1tGbp+0HDWRbC0HNIJLoRyrdrMOyc
	 6bimIk1vfnokB18S8jsQ6bH4Ri8DikKMugKn9EAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4449FF805F3; Tue, 18 Jul 2023 16:14:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD9EF805ED;
	Tue, 18 Jul 2023 16:14:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B27CF805D6; Tue, 18 Jul 2023 16:13:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DE4BF80551
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE4BF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xjR0dDhB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IyASm/na
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E26B1FDC5;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbMrl3GuYS85GYIMhdn8D/fx4sfwnB1DSofv/91xi1M=;
	b=xjR0dDhBWiRp7iX1U0ofarQK2rwzO/CNs5O4CYmFXEWuywneZBygMzgZ3YxFF3uEV0i1Y/
	P2cGjayLRX/bEASNCOz6Jwhb+JLXvn17cexXaPBD8hB3BTtuMCZMZewadyxVJR+SiGxF2c
	x0iuGhgAekLsLwKrLeMgIvdR7LulMK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbMrl3GuYS85GYIMhdn8D/fx4sfwnB1DSofv/91xi1M=;
	b=IyASm/nasRLjVcrk5T2TAium5pQm2Zd/3aDfihFNy7xKdF+TpWa3COrgLaol9GwuiN3iM4
	aNia2WCWGFbRnuCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 820E1138EC;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yHnMHvudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 05/11] ALSA: control: Add lockdep warning to internal
 functions
Date: Tue, 18 Jul 2023 16:12:58 +0200
Message-Id: <20230718141304.1032-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CSXJOWC542XCPEONOMERLVLUYKC6UPWQ
X-Message-ID-Hash: CSXJOWC542XCPEONOMERLVLUYKC6UPWQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSXJOWC542XCPEONOMERLVLUYKC6UPWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To assure the proper locking, add the lockdep check to
__snd_ctl_remove(), __snd_ctl_add_replace() and other internal
functions to handle user controls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/core/control.c b/sound/core/control.c
index 9c933350ec6b..8aaa2a84a670 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -469,6 +469,8 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	struct snd_kcontrol *old;
 	int err;
 
+	lockdep_assert_held_write(&card->controls_rwsem);
+
 	id = kcontrol->id;
 	if (id.index > UINT_MAX - kcontrol->count)
 		return -EINVAL;
@@ -578,6 +580,8 @@ static int __snd_ctl_remove(struct snd_card *card,
 {
 	unsigned int idx;
 
+	lockdep_assert_held_write(&card->controls_rwsem);
+
 	if (snd_BUG_ON(!card || !kcontrol))
 		return -EINVAL;
 	list_del(&kcontrol->list);
@@ -1524,6 +1528,8 @@ static int replace_user_tlv(struct snd_kcontrol *kctl, unsigned int __user *buf,
 	int i;
 	int change;
 
+	lockdep_assert_held_write(&ue->card->controls_rwsem);
+
 	if (size > 1024 * 128)	/* sane value */
 		return -EINVAL;
 
@@ -1600,6 +1606,8 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 	unsigned int i;
 	const uintptr_t user_ptrval = ue->info.value.enumerated.names_ptr;
 
+	lockdep_assert_held_write(&ue->card->controls_rwsem);
+
 	buf_len = ue->info.value.enumerated.names_length;
 	if (buf_len > 64 * 1024)
 		return -EINVAL;
@@ -1904,6 +1912,8 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
 	struct snd_ctl_elem_id id;
 	struct snd_kcontrol_volatile *vd;
 
+	lockdep_assert_held(&file->card->controls_rwsem);
+
 	if (copy_from_user(&header, buf, sizeof(header)))
 		return -EFAULT;
 
-- 
2.35.3

