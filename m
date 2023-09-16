Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A715F7A2E26
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 08:10:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA94EDED;
	Sat, 16 Sep 2023 08:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA94EDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694844658;
	bh=ijg1+e8O9xRPnJMdT6hlDkNwpHI+uPcU9Ll/Icld9eU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FLSarbNBzNXsLPFyyHX0uBtSWDgty362dYlvt8oxVxFVNXOlbLIiX4rG55NLTF5D+
	 K6Cf+KzBSNm/YXITbevgSh+IgdQ46FxcJI2nnrprzvT9dNAUD5yqx+3NXMr4oE5Cj1
	 BxLLIYi73ZBVXNNPwaKp4kBP8+BbH/dkAe8CCeT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 997FDF80552; Sat, 16 Sep 2023 08:10:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A6EF80246;
	Sat, 16 Sep 2023 08:10:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CF0EF80425; Sat, 16 Sep 2023 08:07:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A47C1F80212
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 08:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A47C1F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hAGeOd5X;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=I4v9/ad8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61E992191A;
	Sat, 16 Sep 2023 06:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694844454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SjohphOc1c+1DqaykkYCK5lWx9vO1/rkpUlNtGZVFVs=;
	b=hAGeOd5XwQziw7NEmSVEvQhQs+yvj+TLbgP1V92nwdOam17XMyxdp39H0eiy2WB5J+pU2d
	pbcPFTI9j+j969auRgHRBG7MvfgnIIXyPdVHffcP+BNHm4QtDbSrL8VGDtanIbmIloATa7
	HULFBXV5/dpkuxlW/+Bw1xMbWfjgnn4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694844454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SjohphOc1c+1DqaykkYCK5lWx9vO1/rkpUlNtGZVFVs=;
	b=I4v9/ad8BZtpcT8JRTP4DhGTFvqy615vb0A7Xuqiib0EkVBG6CP2969saHekdM0nvGnS3S
	V+lDP5ohvLvuKGAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4513113499;
	Sat, 16 Sep 2023 06:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CNUhECZGBWWLVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 16 Sep 2023 06:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Mark Hills <mark@xwax.org>
Subject: [PATCH] ALSA: rawmidi: Fix NULL dereference at proc read
Date: Sat, 16 Sep 2023 08:07:25 +0200
Message-Id: <20230916060725.11726-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O5TP53OCTLGP2WFQAGYOKCXGVLFBRCGZ
X-Message-ID-Hash: O5TP53OCTLGP2WFQAGYOKCXGVLFBRCGZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5TP53OCTLGP2WFQAGYOKCXGVLFBRCGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

At the implementation of the optional proc fs in rawmidi, I forgot
that rmidi->ops itself is optional and can be NULL.
Add the proper NULL check for avoiding the Oops.

Fixes: fa030f666d24 ("ALSA: ump: Additional proc output")
Reported-and-tested-by: Mark Hills <mark@xwax.org>
Closes: https://lore.kernel.org/r/ef9118c3-a2eb-d0ff-1efa-cc5fb6416bde@xwax.org
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index ba06484ac4aa..1431cb997808 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1770,7 +1770,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 	if (IS_ENABLED(CONFIG_SND_UMP))
 		snd_iprintf(buffer, "Type: %s\n",
 			    rawmidi_is_ump(rmidi) ? "UMP" : "Legacy");
-	if (rmidi->ops->proc_read)
+	if (rmidi->ops && rmidi->ops->proc_read)
 		rmidi->ops->proc_read(entry, buffer);
 	mutex_lock(&rmidi->open_mutex);
 	if (rmidi->info_flags & SNDRV_RAWMIDI_INFO_OUTPUT) {
-- 
2.35.3

