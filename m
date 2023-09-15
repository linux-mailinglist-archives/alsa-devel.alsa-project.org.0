Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E47A18E1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFF6DEB;
	Fri, 15 Sep 2023 10:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFF6DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766708;
	bh=NJ69ELB4sWlv2Yrl1z8jRrgMY31eFcjO1vhgxUGGypA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FG8brYd8gzjlrugKhKT0ShBokuaHR7HoOfxXNEpSad4u2OjB8Y2jyZgJ0h9bU9sYI
	 cSmHEMT8qrTVBYKxZnZEbnoaCKdp/hK91V8BXvRK8O15JvJ6cQTM+cciBcH9chwh/G
	 ISNfHcgpFnwziiUij3XOPZEDKsrHycTwn07SmiGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F8E5F805D3; Fri, 15 Sep 2023 10:28:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B2E0F805D7;
	Fri, 15 Sep 2023 10:28:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35B90F805AB; Fri, 15 Sep 2023 10:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75E81F80431
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E81F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OK4CY15F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=S+F0V/lD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 430D31F88F;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zaqNM8fx/1HE7/Rdqx1YEKHWcry69IJVL31tnQlgaw8=;
	b=OK4CY15Ftd3SprywF/apIRsZertpHCorxnCQvVCYbgduGMqsZebYfXMUx9BPUppe9qQCOC
	i7VIaKswjNxzPlr++nJPqaGSNwmLqUFLEIRgCjk+oPuA+bJWoOrjpI3vkLneok/gSLlGOd
	F9zMs7Ik+Q4ZBOM/6rLNPCcgYAO/taI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zaqNM8fx/1HE7/Rdqx1YEKHWcry69IJVL31tnQlgaw8=;
	b=S+F0V/lD9LMdSTsLB2lntJULQyrHu58u4K3epXhoVmkemDhUULJPWJ2BgG7X9jYKK2wqES
	mk3dHZC+2C9W4JBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2834B13A34;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OIP/CJcVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/13] ALSA: cs4236: Fix -Wformat-truncation warning
Date: Fri, 15 Sep 2023 10:27:55 +0200
Message-Id: <20230915082802.28684-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TSBUJH6PIRHMVVGFK3STHKWR3HOMCDGB
X-Message-ID-Hash: TSBUJH6PIRHMVVGFK3STHKWR3HOMCDGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSBUJH6PIRHMVVGFK3STHKWR3HOMCDGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The filling of card->longname can be gracefully truncated, as it's
only informative.  Use scnprintf() and suppress the superfluous
compile warning with -Wformat-truncation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cs423x/cs4236.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index 10112e1bb25d..7226cbf2d7de 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -367,14 +367,14 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 	strscpy(card->driver, chip->pcm->name, sizeof(card->driver));
 	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
 	if (dma2[dev] < 0)
-		snprintf(card->longname, sizeof(card->longname),
-			 "%s at 0x%lx, irq %i, dma %i",
-			 chip->pcm->name, chip->port, irq[dev], dma1[dev]);
+		scnprintf(card->longname, sizeof(card->longname),
+			  "%s at 0x%lx, irq %i, dma %i",
+			  chip->pcm->name, chip->port, irq[dev], dma1[dev]);
 	else
-		snprintf(card->longname, sizeof(card->longname),
-			 "%s at 0x%lx, irq %i, dma %i&%d",
-			 chip->pcm->name, chip->port, irq[dev], dma1[dev],
-			 dma2[dev]);
+		scnprintf(card->longname, sizeof(card->longname),
+			  "%s at 0x%lx, irq %i, dma %i&%d",
+			  chip->pcm->name, chip->port, irq[dev], dma1[dev],
+			  dma2[dev]);
 
 	err = snd_wss_timer(chip, 0);
 	if (err < 0)
-- 
2.35.3

