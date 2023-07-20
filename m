Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A61B75A913
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9162852;
	Thu, 20 Jul 2023 10:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9162852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841412;
	bh=R5A7GIEzOLM1iml8w5hoA6pJCGHoPfftFm50Y3jeIXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PKQUeKZfZs4jldTh8x4Ms1+4vTSfrFS0YR67zk8bfz0IOJ0bduUoMunIsc3IH+CeI
	 0qXQk30Ee2TFH1Cu+He7S9yynbHL0jkxWP7IGQVrZ2cKJa5JtyICioVuw7Cq4EkwgA
	 ToejVcOt6sMaQSzTlRBJpPMuDgrNbxB2m91S0OaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88CB2F805B5; Thu, 20 Jul 2023 10:21:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 086A6F805AE;
	Thu, 20 Jul 2023 10:21:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38E5AF805A9; Thu, 20 Jul 2023 10:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9722CF80564
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9722CF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KMwghCmt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PoocrDVz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2ED7122A17;
	Thu, 20 Jul 2023 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vHNyWvT387q2clwLlUp6chwdsB/tNC7DWkVIiH3ioc=;
	b=KMwghCmtpDUDx7BoTwOtFBcjDO3s0yd3NRiSESGgW7vX5GSfU09oA0aJHIXEIvQMD5fuye
	MbHPwYR1Z0aGLiG2p7xb208q3FW5Z2L9Vr/ViifzrsStiplrpsjy9zg4x5dvLHvzUsQdj4
	ZFa4hJ0qy8BiKbgVJAJJFnBqNzp1v9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vHNyWvT387q2clwLlUp6chwdsB/tNC7DWkVIiH3ioc=;
	b=PoocrDVzND7/wiYg6+RBAmbN/rZ5ScgW3cTJebSw472JjKTwu4o/o8eSQeypOZcoiOSpZM
	LyWDp5RSUc02iiCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3AAB133DD;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mFN/OnvuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 04/11] ALSA: emu10k1: Simplify with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:21:01 +0200
Message-Id: <20230720082108.31346-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VJ7SKX43RZW3TLLTRVCTSBHSH2LBDIIQ
X-Message-ID-Hash: VJ7SKX43RZW3TLLTRVCTSBHSH2LBDIIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJ7SKX43RZW3TLLTRVCTSBHSH2LBDIIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace an open code with the new snd_ctl_find_id_mixer().
There is no functional change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emumixer.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index f72a01f8f8f2..0a32ea53d8c6 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1982,18 +1982,9 @@ static int remove_ctl(struct snd_card *card, const char *name)
 	return snd_ctl_remove_id(card, &id);
 }
 
-static struct snd_kcontrol *ctl_find(struct snd_card *card, const char *name)
-{
-	struct snd_ctl_elem_id sid;
-	memset(&sid, 0, sizeof(sid));
-	strcpy(sid.name, name);
-	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	return snd_ctl_find_id(card, &sid);
-}
-
 static int rename_ctl(struct snd_card *card, const char *src, const char *dst)
 {
-	struct snd_kcontrol *kctl = ctl_find(card, src);
+	struct snd_kcontrol *kctl = snd_ctl_find_id_mixer(card, src);
 	if (kctl) {
 		snd_ctl_rename(card, kctl, dst);
 		return 0;
-- 
2.35.3

