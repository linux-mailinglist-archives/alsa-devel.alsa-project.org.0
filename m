Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A555E7A18DC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0045FDF6;
	Fri, 15 Sep 2023 10:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0045FDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766638;
	bh=z3R4zQinbjVrk5qaT2iIywnUnes5zi2p/YKXK6bFlVc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cFqpjU81jp/LVRgoTu36ADXCYR2KSfFDaiaBK6cUiAShkzqQHYdRV3yjvCIITquKL
	 vUR1PcJIJ9cpyssOm0D+8ppi236krIhowYfdJ6e+y4YEBBrLpGEWQ528d7IHsS8GVB
	 8VEfuMcdKG3S+33QgSoNrvtMeUBsVzbcegBDvga0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B94F805B1; Fri, 15 Sep 2023 10:28:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF7FF80246;
	Fri, 15 Sep 2023 10:28:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CA5F80551; Fri, 15 Sep 2023 10:28:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CDFAF8055C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CDFAF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vvN09nZp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qupKUwuL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 894421F899;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gB9QfQ6zd2n6+Fc5mhLpxUY2ajstUcINy+xokskGCrs=;
	b=vvN09nZpxvzmI3f5pJVY910140f64d+lcIVPPg7rP6yhkcmyat81wJtLHGJoe/76VTYEuJ
	zwi1hPtS7/9GWY7XvJBKRG3qV5M5lfsQW52oyytWxGjPUkJkrM7nMua5f0ZfwWTNJrSOh7
	o9xicJMum7xqx0/vkZ/zxMBc9alRGDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gB9QfQ6zd2n6+Fc5mhLpxUY2ajstUcINy+xokskGCrs=;
	b=qupKUwuLbhoSA05gEy/0KCbzbA+rqU2n1DQpbYwEoOMhZMLoTlrk14WLY0kaEJtuXyCGek
	OHPbbEhTqV/QteBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EFA11358A;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kEFqGZcVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/13] ALSA: opti9x: Fix -Wformat-truncation warning
Date: Fri, 15 Sep 2023 10:27:57 +0200
Message-Id: <20230915082802.28684-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LNRL43Z73PNAWKFNGLRXYPGWD64RTO64
X-Message-ID-Hash: LNRL43Z73PNAWKFNGLRXYPGWD64RTO64
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNRL43Z73PNAWKFNGLRXYPGWD64RTO64/>
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
 sound/isa/opti9xx/miro.c           |  8 ++++----
 sound/isa/opti9xx/opti92x-ad1848.c | 16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index 59242baed576..59792f2fada1 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -1344,10 +1344,10 @@ static int snd_miro_probe(struct snd_card *card)
 	}
 
 	strcpy(card->driver, "miro");
-	snprintf(card->longname, sizeof(card->longname),
-		 "%s: OPTi%s, %s at 0x%lx, irq %d, dma %d&%d",
-		 card->shortname, miro->name, codec->pcm->name,
-		 miro->wss_base + 4, miro->irq, miro->dma1, miro->dma2);
+	scnprintf(card->longname, sizeof(card->longname),
+		  "%s: OPTi%s, %s at 0x%lx, irq %d, dma %d&%d",
+		  card->shortname, miro->name, codec->pcm->name,
+		  miro->wss_base + 4, miro->irq, miro->dma1, miro->dma2);
 
 	if (mpu_port <= 0 || mpu_port == SNDRV_AUTO_PORT)
 		rmidi = NULL;
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index 4beeb32fe2a7..c33f67dd5133 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -859,15 +859,15 @@ static int snd_opti9xx_probe(struct snd_card *card)
 	strcpy(card->driver, chip->name);
 	sprintf(card->shortname, "OPTi %s", card->driver);
 #if defined(CS4231) || defined(OPTi93X)
-	snprintf(card->longname, sizeof(card->longname),
-		 "%s, %s at 0x%lx, irq %d, dma %d&%d",
-		 card->shortname, codec->pcm->name,
-		 chip->wss_base + 4, irq, dma1, xdma2);
+	scnprintf(card->longname, sizeof(card->longname),
+		  "%s, %s at 0x%lx, irq %d, dma %d&%d",
+		  card->shortname, codec->pcm->name,
+		  chip->wss_base + 4, irq, dma1, xdma2);
 #else
-	snprintf(card->longname, sizeof(card->longname),
-		 "%s, %s at 0x%lx, irq %d, dma %d",
-		 card->shortname, codec->pcm->name, chip->wss_base + 4, irq,
-		 dma1);
+	scnprintf(card->longname, sizeof(card->longname),
+		  "%s, %s at 0x%lx, irq %d, dma %d",
+		  card->shortname, codec->pcm->name, chip->wss_base + 4, irq,
+		  dma1);
 #endif	/* CS4231 || OPTi93X */
 
 	if (mpu_port <= 0 || mpu_port == SNDRV_AUTO_PORT)
-- 
2.35.3

