Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0F723DE8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 11:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5711C827;
	Tue,  6 Jun 2023 11:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5711C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686044430;
	bh=pxG1OyaTICfwIcf8V26O6szdcxGZ5YNGuMNOwPrdpzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aGpTJzO6sNr/I7eDtpzsVPQczsTvmfdf3o0HhT0weUhjLy3TPAFajMb+FzFMUBSKG
	 C8MDlbgwGzT3zk6YDZ/AmqwB7DrK0bqHf8viCsJtJQAsz/ZqMzhUUp8GFbDP2n6F7b
	 Rlp2cfIIIIXc6nDnW1WMjsaaLTSs9hplDrztUHlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C004BF8055B; Tue,  6 Jun 2023 11:39:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4FD0F80549;
	Tue,  6 Jun 2023 11:39:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D29A3F80494; Tue,  6 Jun 2023 11:39:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FB70F800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 11:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FB70F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DI9Z8ReM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3xa+rmXB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDBFE1FD69;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686044339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ3rE/t/oIr1Fex5iwckxZz45THSEO7XJxkZERCSF2U=;
	b=DI9Z8ReMUJim9/8OvAKipsJiBUWUgsDdWtStgALRjyacG+dy1sHP3MpYcFNVUeCuYqIscq
	FBfdGUTR4e5OHldtne6yh+Aw09J6dpx/94AFvz+gUlAKmGtMsmt3CfTRqtR4yKriShxkJK
	edpZbL7H2Ap7GBWwZB5E54901s8wwD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686044339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ3rE/t/oIr1Fex5iwckxZz45THSEO7XJxkZERCSF2U=;
	b=3xa+rmXBs5l6pYoMeckCMaxy8xnRaxVdEj+NPVa7djFaiZCOPH2pJ2+bn/bHaFPnbJJ/lx
	Z1exfRbEURQoT2BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FB3D13519;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IFSYJbP+fmTiVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 09:38:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/4] ALSA: gus: Fix kctl->id initialization
Date: Tue,  6 Jun 2023 11:38:54 +0200
Message-Id: <20230606093855.14685-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230606093855.14685-1-tiwai@suse.de>
References: <20230606093855.14685-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LJ7MZGYR36K6VBAPGWHDXBA5MH6FENVS
X-Message-ID-Hash: LJ7MZGYR36K6VBAPGWHDXBA5MH6FENVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJ7MZGYR36K6VBAPGWHDXBA5MH6FENVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

GUS driver replaces the kctl->id.index after assigning the kctl via
snd_ctl_add().  This doesn't work any longer with the new Xarray
lookup change.  It has to be set before snd_ctl_add() call instead.

Fixes: c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index 230f65a0e4b0..388db5fb65bd 100644
--- a/sound/isa/gus/gus_pcm.c
+++ b/sound/isa/gus/gus_pcm.c
@@ -892,10 +892,10 @@ int snd_gf1_pcm_new(struct snd_gus_card *gus, int pcm_dev, int control_index)
 		kctl = snd_ctl_new1(&snd_gf1_pcm_volume_control1, gus);
 	else
 		kctl = snd_ctl_new1(&snd_gf1_pcm_volume_control, gus);
+	kctl->id.index = control_index;
 	err = snd_ctl_add(card, kctl);
 	if (err < 0)
 		return err;
-	kctl->id.index = control_index;
 
 	return 0;
 }
-- 
2.35.3

