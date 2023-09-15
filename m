Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50907A18D7
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C103A4D;
	Fri, 15 Sep 2023 10:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C103A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766599;
	bh=tvBLJgdrbpuPiO+3zCPhZUTutmDiVasZdMcASoxh9XQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GMKLUyIgC9I3SSoiDRMLbwWyNmJ6yxiwI6MIiRX3++yT0JBYFMnmz4/CPhsHGPPKC
	 KBLMrg5ObL60n3Vfqa9lcG9qsid4JPUKnmLowBHu95B+KZYoKwRNq4xnpk2y8RHqx6
	 bys1nvO7ZSZiYShCR0wVg/BYkoWs1G4ZpudERbuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C107EF8057B; Fri, 15 Sep 2023 10:28:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B325FF80570;
	Fri, 15 Sep 2023 10:28:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FA85F80564; Fri, 15 Sep 2023 10:28:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C92A0F80537
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C92A0F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SCwGRBDf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DmTQpkQ2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25A641F74B;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1V3PuOgf9S7h4ZdY12WzXyYfzV55vvh6Hm19hi4QBu0=;
	b=SCwGRBDf/85m0DiiCJbGNfmGqseu6Gavo2Xgqe/6ycwc+wy4/+pI8R24CnWGJeoOe5TN+8
	tdXil5UjQvPDhE5grC/fqGui3uo3Gc7aL/uOzNlFx/lQ+eLb06OfJSaVP8wUbBD3r9LDJj
	wI6i+fFcD+Q6HCVEj2bUDHjUqn4+btI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1V3PuOgf9S7h4ZdY12WzXyYfzV55vvh6Hm19hi4QBu0=;
	b=DmTQpkQ2wcWlBhWbyaP3eJgyJjLNLRn8xkRPUbMbIRh2+gmX0OwShU5Srx6IB98fkyy81v
	6Wu64ZyQA5PD6+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08F9A1358A;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KHhUAZcVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/13] ALSA: sscape: Fix -Wformat-truncation warning
Date: Fri, 15 Sep 2023 10:27:54 +0200
Message-Id: <20230915082802.28684-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ABHJAXRDNFX77KZSYTE5YETTDX2HRRDW
X-Message-ID-Hash: ABHJAXRDNFX77KZSYTE5YETTDX2HRRDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABHJAXRDNFX77KZSYTE5YETTDX2HRRDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The warning with -Wformat-truncation at sscape_upload_microcode() is
false-positive; the version number can be only a single digit, hence
fitting with the given string size.

For suppressing the warning, replace snprintf() with scnprintf().
As stated in the above, truncation doesn't matter.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sscape.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index 0bc0025f7c19..cc56fafd27b1 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -557,7 +557,7 @@ static int sscape_upload_microcode(struct snd_card *card, int version)
 	char name[14];
 	int err;
 
-	snprintf(name, sizeof(name), "sndscape.co%d", version);
+	scnprintf(name, sizeof(name), "sndscape.co%d", version);
 
 	err = request_firmware(&init_fw, name, card->dev);
 	if (err < 0) {
-- 
2.35.3

