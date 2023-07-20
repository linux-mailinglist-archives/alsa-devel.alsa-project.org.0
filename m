Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D129C75A919
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E4684C;
	Thu, 20 Jul 2023 10:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E4684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841464;
	bh=atkd7/pGRzIXeznoy/0HwXR1yM1YaoNVEkiQZ9FChjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k/1ACguzSArbcLji0zp7TTiW3GrGj2OXf+VfuDjKtyw+RKzi6r1YVPU1uKXMwD69V
	 hmwAL+RHD0hEBTdPJsm7xoST1+qykYEyrEX4Q9foMfhb9dNJ+qqGwRvKqrJ3nCX4wv
	 d8kV7fIWr2nXkdGU4J28m0fdvFjlGgm9K8Qopy2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E772EF805E0; Thu, 20 Jul 2023 10:21:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48746F805CA;
	Thu, 20 Jul 2023 10:21:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28202F805AE; Thu, 20 Jul 2023 10:21:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EBBC1F8055C
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBBC1F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D/wWaeGQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=drBLxKZ2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D89AF22A16;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeb97bre1Cm7+FfhwHXupgjJISWLuT8+HPz/HPaEC/k=;
	b=D/wWaeGQiqM65e7iuFKJwuJLuxdgoe9PUqs27ab/bh/7AXdabNoO5GqviC3Kx9R2Xho1DG
	80sF/YO0f5oF0YheWEzQyfHtwfUmKsOaIy2KGRZZnKRu7WbLpk9J6wtiNYgBMKK0TXR+r/
	qMnZVhfcFNsiymJi/Rzy37rp9qfFZQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeb97bre1Cm7+FfhwHXupgjJISWLuT8+HPz/HPaEC/k=;
	b=drBLxKZ2fYzc5CoM5JKL3G3hy5+63GhKWJi0A8ONErYByeVZpuCWoPMJWbeRQxGxyY/LZK
	/u6cXU2ZrXJM3NCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B240C133DD;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QLViKnvuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 02/11] ALSA: ca0106: Simplify with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:20:59 +0200
Message-Id: <20230720082108.31346-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 467QE4WRR73MERFB4LQDZG2PGZWZEZVE
X-Message-ID-Hash: 467QE4WRR73MERFB4LQDZG2PGZWZEZVE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/467QE4WRR73MERFB4LQDZG2PGZWZEZVE/>
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
 sound/pci/ca0106/ca0106_mixer.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index f6381c098d4f..2f37d2c3dd38 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -706,19 +706,9 @@ static int remove_ctl(struct snd_card *card, const char *name)
 	return snd_ctl_remove_id(card, &id);
 }
 
-static struct snd_kcontrol *ctl_find(struct snd_card *card, const char *name)
-{
-	struct snd_ctl_elem_id sid;
-	memset(&sid, 0, sizeof(sid));
-	/* FIXME: strcpy is bad. */
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
@@ -765,7 +755,8 @@ static void add_followers(struct snd_card *card,
 			  struct snd_kcontrol *master, const char * const *list)
 {
 	for (; *list; list++) {
-		struct snd_kcontrol *follower = ctl_find(card, *list);
+		struct snd_kcontrol *follower =
+			snd_ctl_find_id_mixer(card, *list);
 		if (follower)
 			snd_ctl_add_follower(master, follower);
 	}
-- 
2.35.3

