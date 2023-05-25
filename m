Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D767710778
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 10:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8473208;
	Thu, 25 May 2023 10:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8473208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685003556;
	bh=dQyTiDmLPKQ7vE8kQ7+rUL1E+RkgY/M6fZ74/9vXoms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mfwpg1SUgRk0C+WHbaYgh3Ijw8KY19DpiEd6xVQeP3XGLSm6YTLI9nmOxyDFdq/lP
	 PhKIcYErZAAnbSTv/WrqfQIBNcQzmsVLZGM8cjGPAXUu4LT9QA61aFE66UHrXRAt5g
	 Xnmw6qJ323MoUvyKt04uLpUgJpKF4LY2ISxOQRKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86159F8055A; Thu, 25 May 2023 10:31:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE1F5F8055A;
	Thu, 25 May 2023 10:31:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A715EF80249; Thu, 25 May 2023 10:31:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C5CAF800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 10:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5CAF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=E7ClCj8Y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=npi77G6B
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9920821D22;
	Thu, 25 May 2023 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685003488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fYnx6lVpoaihh5ZwZObd16wZDSmGU5kcbqQVO+9MiU=;
	b=E7ClCj8Y8oQpBQpnlSrS7H/hHYaK+ZOBn6pLu39gTxjvTsUFfoB4BK3nuRvbomgEPhWG8m
	mkE+CCSlquzn5/J59M4VMVNbgbA1gls/9DBr3+ATJdsOjonxRKJMS6LvZYFvMkFRkRX14M
	U8423Ufa24kQEQpxkVzDOUp61PTeyIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685003488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fYnx6lVpoaihh5ZwZObd16wZDSmGU5kcbqQVO+9MiU=;
	b=npi77G6BXnAVCj/bxsz2iM0jQloaMXtQ40r/1Sp0x0Mv+CQraTkfWwnWz5ARGcPTGiyuzU
	iJiq9wym2PhhkMBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7CCBE13A2C;
	Thu, 25 May 2023 08:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KNerHeAcb2S8OwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 25 May 2023 08:31:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 2/2] ALSA: ump: Fix parsing of 0xFx command
Date: Thu, 25 May 2023 10:31:24 +0200
Message-Id: <20230525083124.15277-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230525083124.15277-1-tiwai@suse.de>
References: <20230525083124.15277-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T5NGU6LPKYECVOSGEJZ23LZ5GX3VEBUN
X-Message-ID-Hash: T5NGU6LPKYECVOSGEJZ23LZ5GX3VEBUN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5NGU6LPKYECVOSGEJZ23LZ5GX3VEBUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The MIDI 1.0 parser retrieved the 0xFx command with a wrong bit shift,
resulting in the bogus type.  Fix the bit shift size.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/0fbc0b27-54b8-4cda-800e-37e7a03fed39@kili.mountain
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index 164829d3e305..48ab3e1bd62e 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -454,7 +454,7 @@ static int do_convert_to_ump(struct snd_ump_endpoint *ump,
 	}
 
 	if (c & 0x80) {
-		bytes = cmd_bytes[(c >> 8) & 7];
+		bytes = cmd_bytes[(c >> 4) & 7];
 		cvt->buf[0] = c;
 		cvt->len = 1;
 		cvt->cmd_bytes = bytes;
-- 
2.35.3

