Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E507A1A1C
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18DA384B;
	Fri, 15 Sep 2023 11:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18DA384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694769256;
	bh=qzqZMSrlm8MofmMbgfIS1NfrvrvfbnjrGbA44oN3XSU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sANBP2BdytXy0kKAG69TFv6j5K4gWF/2Pw6H9ZQIObJ+Cfw2rvBz3ddqn5EktVsD3
	 ixUgQtDIpLCnk4554IZsoS5Mv4q4ezV3yDPZJgSpY87QjY+rXcd2O9Sh43+QUpOTGD
	 QqIIz3skv9xYgDVDce8C1HIyBxjq4h7xVuRXM55Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 054DAF80549; Fri, 15 Sep 2023 11:13:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 762F5F80425;
	Fri, 15 Sep 2023 11:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 237C9F80537; Fri, 15 Sep 2023 11:13:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 60792F80246
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60792F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=H7JSq7M4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+59tMBi1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B7A11F8AB;
	Fri, 15 Sep 2023 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694769196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FU5N5ZUFYLEztewH7EzVmK64E92xSnsafUMID+RqehM=;
	b=H7JSq7M406uQW6rl6dRIpnTsSelSeW7FhZUi1ncJ7ITVnl2c6a+LG2WWTG2MITuqaJWoGp
	/ePzFHm1s8nTHWm/JCExmsBgIor3aQE6yQX9uQ9nw2Gu8HGH0+wwDi/sFaInyeycvuXe+9
	n5WJzv/RMkuTlAPOoQj1oQxdR8M4uxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694769196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FU5N5ZUFYLEztewH7EzVmK64E92xSnsafUMID+RqehM=;
	b=+59tMBi1fRyFCpYIDu5fLvl6wFAuv/1DYssZ9Fi7RUdjx2Ob/n+QamESsMUKGXc+mib3iZ
	SYtvHBv1BDniOjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3B4113A34;
	Fri, 15 Sep 2023 09:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EHWjNisgBGWcWQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 09:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: riptide: Fix -Wformat-truncation warning for
 longname string
Date: Fri, 15 Sep 2023 11:13:13 +0200
Message-Id: <20230915091313.5988-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915091313.5988-1-tiwai@suse.de>
References: <20230915091313.5988-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QOA4B6264PFDP63Y437IVDNWQHXWF6SI
X-Message-ID-Hash: QOA4B6264PFDP63Y437IVDNWQHXWF6SI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOA4B6264PFDP63Y437IVDNWQHXWF6SI/>
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
 sound/pci/riptide/riptide.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index b37c877c2c16..9dee0345f22c 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -2105,15 +2105,15 @@ __snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	strcpy(card->driver, "RIPTIDE");
 	strcpy(card->shortname, "Riptide");
 #ifdef SUPPORT_JOYSTICK
-	snprintf(card->longname, sizeof(card->longname),
-		 "%s at 0x%lx, irq %i mpu 0x%x opl3 0x%x gameport 0x%x",
-		 card->shortname, chip->port, chip->irq, chip->mpuaddr,
-		 chip->opladdr, chip->gameaddr);
+	scnprintf(card->longname, sizeof(card->longname),
+		  "%s at 0x%lx, irq %i mpu 0x%x opl3 0x%x gameport 0x%x",
+		  card->shortname, chip->port, chip->irq, chip->mpuaddr,
+		  chip->opladdr, chip->gameaddr);
 #else
-	snprintf(card->longname, sizeof(card->longname),
-		 "%s at 0x%lx, irq %i mpu 0x%x opl3 0x%x",
-		 card->shortname, chip->port, chip->irq, chip->mpuaddr,
-		 chip->opladdr);
+	scnprintf(card->longname, sizeof(card->longname),
+		  "%s at 0x%lx, irq %i mpu 0x%x opl3 0x%x",
+		  card->shortname, chip->port, chip->irq, chip->mpuaddr,
+		  chip->opladdr);
 #endif
 	snd_riptide_proc_init(chip);
 	err = snd_card_register(card);
-- 
2.35.3

