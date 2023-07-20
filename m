Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B775A936
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB4D0207;
	Thu, 20 Jul 2023 10:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB4D0207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841620;
	bh=eSxyNQlwPH5Ah3pHvoGcrece7bbQj5T7pB4o36yayMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d/I33myL9s7MpjRbQZkgrGP2jErh/6GwlFpdXJfyh6kW8W9c+6O0qRLC/u/l7dq3n
	 h8AQfYT4DejKbmXLNbHycEo7uXsoGr3PKyKtHA4tn++5K89A0CEzWyb+8id9mFTsUc
	 do89s1GZH+uuR+owjSE16pK9H+9IbrXO5wyZPnS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90BE8F8053B; Thu, 20 Jul 2023 10:26:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C47F80494;
	Thu, 20 Jul 2023 10:26:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23733F80527; Thu, 20 Jul 2023 10:25:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BF63F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF63F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BDSrhP8K;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2kqiqduC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB26D22A22;
	Thu, 20 Jul 2023 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1221LFRzytcOaaZ8FHQFdi9P+ER19ZB+csi8UzXFv5U=;
	b=BDSrhP8KgvAxqHoig/7kOP03bCWuPkIqLAy0/YLuMOmANxea4LgEfFbX6NfnQYV4Q8N0x/
	2stf+oufxpVlTzZQs4pJh33O9SQ5s/I3OAmXvitfj3hNcxctJTFjVz0vrfjONfI/Po6U99
	Qx7IiQjPz6hpRy5KmQglgUplKLDbLiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1221LFRzytcOaaZ8FHQFdi9P+ER19ZB+csi8UzXFv5U=;
	b=2kqiqduCPu1usxYLp3v6KOPl0jCt1cAa82lIJ3/gicHvxoTTosKBHtUp0fIl4zoe2/uCIj
	iqIuI23iCjCNcUCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CEF08133DD;
	Thu, 20 Jul 2023 08:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +BSoMZTvuGRrJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/4] ALSA: ac97: Use the standard snd_ctl_add_followers()
 helper
Date: Thu, 20 Jul 2023 10:25:52 +0200
Message-Id: <20230720082554.31891-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082554.31891-1-tiwai@suse.de>
References: <20230720082554.31891-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PWO7X4OG2J3XJUQF6KYKSL5247JT6TUO
X-Message-ID-Hash: PWO7X4OG2J3XJUQF6KYKSL5247JT6TUO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWO7X4OG2J3XJUQF6KYKSL5247JT6TUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of open-code, use the new standard helper to manage vmaster
stuff for code simplification.

Except for a debug print, there should be no functional change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_patch.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index ccfd9c7bf900..09626aed967d 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -3440,7 +3440,6 @@ static int snd_ac97_add_vmaster(struct snd_ac97 *ac97, char *name,
 				const char * const *followers)
 {
 	struct snd_kcontrol *kctl;
-	const char * const *s;
 	int err;
 
 	kctl = snd_ctl_make_virtual_master(name, tlv);
@@ -3450,19 +3449,10 @@ static int snd_ac97_add_vmaster(struct snd_ac97 *ac97, char *name,
 	if (err < 0)
 		return err;
 
-	for (s = followers; *s; s++) {
-		struct snd_kcontrol *sctl;
+	err = snd_ctl_add_followers(ac97->bus->card, kctl, followers);
+	if (err < 0)
+		return err;
 
-		sctl = snd_ac97_find_mixer_ctl(ac97, *s);
-		if (!sctl) {
-			dev_dbg(ac97->bus->card->dev,
-				"Cannot find follower %s, skipped\n", *s);
-			continue;
-		}
-		err = snd_ctl_add_follower(kctl, sctl);
-		if (err < 0)
-			return err;
-	}
 	return 0;
 }
 
-- 
2.35.3

