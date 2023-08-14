Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8277B81F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84B9583A;
	Mon, 14 Aug 2023 14:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84B9583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014527;
	bh=5gusnJdt+VToMiQqDcsIXE72Q9H1q+xa8tv5PQ+u8S0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kR00NVim+Ynk7Uii4iwJWl2K4foO1FUxszZH55Jd7nPQ2S6uBujQKWPVqW9b5+GKP
	 7sAwc0s5dmJlOo7K2f4lLijdZbVz1nXaCbuQlT4Oxy3GOUQiAoCI9OWde8Mr9VCa3R
	 J4mXaTDBOXWLOHdA2oK3pcMW5Z+fa7EGB2PHaUGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E270F8061E; Mon, 14 Aug 2023 13:57:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 355BCF80614;
	Mon, 14 Aug 2023 13:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E161EF80272; Mon, 14 Aug 2023 13:56:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 81C4DF8055C
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C4DF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ehIXL7SS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EfIJ/1Gm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5BAD61FD67;
	Mon, 14 Aug 2023 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014152;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NulgZ+I3Oy7nzxJJ1bqwE8Bv2yKQrwT2tCgp2KXuefI=;
	b=ehIXL7SSEAudNuUZbYEYATRZt/Zn0E8WMcMS+DHnx8RymOXQplkIwYyXd7G67/iTbZ4KcC
	GPZtgRD4gl71hWQvPIA8I3qPiJPw80LLKyDQbsBMD92ArsEyXKatAQUpiKzmQc+F1MeItO
	EJH1BDAMcpNJoU/ecTbIZHtfiqR7IVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014152;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NulgZ+I3Oy7nzxJJ1bqwE8Bv2yKQrwT2tCgp2KXuefI=;
	b=EfIJ/1GmzqGJ1kl5lSgpJOG6OBljWLkPsKKd1pFBlMzSeJo3qtWbUM0tzkJ1POEcw3KNtL
	EPyiUzz9w1caKWAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A029138EE;
	Mon, 14 Aug 2023 11:55:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mI25DEgW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 16/25] ALSA: pcmtest: Update comment about PCM copy ops
Date: Mon, 14 Aug 2023 13:55:14 +0200
Message-Id: <20230814115523.15279-17-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7WCSBWY7QQQMXD7O2H5MLQWPBTUU52WQ
X-Message-ID-Hash: 7WCSBWY7QQQMXD7O2H5MLQWPBTUU52WQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WCSBWY7QQQMXD7O2H5MLQWPBTUU52WQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Just an update of a comment mentioning the old PCM callbacks to
correct to the new PCM copy ops.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcmtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 291e7fe47893..d205e10a0605 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -225,7 +225,7 @@ static void check_buf_block(struct pcmtst_buf_iter *v_iter, struct snd_pcm_runti
 
 /*
  * Fill buffer in the non-interleaved mode. The order of samples is C0, ..., C0, C1, ..., C1, C2...
- * The channel buffers lay in the DMA buffer continuously (see default copy_user and copy_kernel
+ * The channel buffers lay in the DMA buffer continuously (see default copy
  * handlers in the pcm_lib.c file).
  *
  * Here we increment the DMA buffer position every time we write a byte to any channel 'buffer'.
-- 
2.35.3

