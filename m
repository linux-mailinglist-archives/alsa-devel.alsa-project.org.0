Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B623723DF4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 11:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891D783A;
	Tue,  6 Jun 2023 11:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891D783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686044453;
	bh=2qBnKGneSawCxiyMdQ8FKer+JtmUQHczOvQBvQuk/GI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jqCMyY5hxWy50GmqW+QrueAFUGxgbqYnB2xDuF4JvzENiw24XizwTBhZXYPKvDDwa
	 DRk+ftQDYZWQvYV/EQ+y38Aix2Meh6dAFu0dsJ4Kkb3YXB/Cr0L08uGx9Jwi99pQQD
	 Wx+KN4wiInhIczajcKexg7XZ1tuKpnaON9KlAACk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 939DFF80567; Tue,  6 Jun 2023 11:39:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D361F80563;
	Tue,  6 Jun 2023 11:39:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44045F80290; Tue,  6 Jun 2023 11:39:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4008EF80199
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 11:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4008EF80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XaxaYDoJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MQArsOet
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9A568219A2;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686044339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOU4Ilov0EX8BQOwGsC+DLcG0wyO+iKjHepWC3M9uwM=;
	b=XaxaYDoJiQ+paUjKZaDuoWV85qWEZsP8NtJELi0bujeL2C184hEm7eC8UL83iL1XpuZX/z
	uqiFFExd3tRlrFWwnE6Q0QeA33E5zGmwnPcxehl0CbWpZ3CmWuvcK2KPhyMu+SIjUniJcN
	cTI1su1GmQxGnPGWwqzvbtF2srWn8l4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686044339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOU4Ilov0EX8BQOwGsC+DLcG0wyO+iKjHepWC3M9uwM=;
	b=MQArsOetVlB9LL+QKQX0k1RCqmHQavbttqKb5mmOyeppSpJHSF8vY88OFifV1X/b0/eoyl
	BHoSIDPxYqVE+OCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C0C613519;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eCuAHbP+fmTiVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 09:38:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/4] ALSA: cmipci: Fix kctl->id initialization
Date: Tue,  6 Jun 2023 11:38:53 +0200
Message-Id: <20230606093855.14685-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230606093855.14685-1-tiwai@suse.de>
References: <20230606093855.14685-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YR5D2LIRZBZE3WBDP2OHFINRIDREMLHV
X-Message-ID-Hash: YR5D2LIRZBZE3WBDP2OHFINRIDREMLHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YR5D2LIRZBZE3WBDP2OHFINRIDREMLHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

cmipci driver replaces the kctl->id.device after assigning the kctl
via snd_ctl_add().  This doesn't work any longer with the new Xarray
lookup change.  It has to be set before snd_ctl_add() call instead.

Fixes: c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 727db6d43391..6d25c12d9ef0 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2688,20 +2688,20 @@ static int snd_cmipci_mixer_new(struct cmipci *cm, int pcm_spdif_device)
 		}
 		if (cm->can_ac3_hw) {
 			kctl = snd_ctl_new1(&snd_cmipci_spdif_default, cm);
+			kctl->id.device = pcm_spdif_device;
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
 				return err;
-			kctl->id.device = pcm_spdif_device;
 			kctl = snd_ctl_new1(&snd_cmipci_spdif_mask, cm);
+			kctl->id.device = pcm_spdif_device;
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
 				return err;
-			kctl->id.device = pcm_spdif_device;
 			kctl = snd_ctl_new1(&snd_cmipci_spdif_stream, cm);
+			kctl->id.device = pcm_spdif_device;
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
 				return err;
-			kctl->id.device = pcm_spdif_device;
 		}
 		if (cm->chip_version <= 37) {
 			sw = snd_cmipci_old_mixer_switches;
-- 
2.35.3

