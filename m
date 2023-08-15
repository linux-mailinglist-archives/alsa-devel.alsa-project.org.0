Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B293A77D2E6
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AEDB84D;
	Tue, 15 Aug 2023 21:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AEDB84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692126255;
	bh=ZM+6rIJBSc6fBCpR1Y+kEQE0W/kWXzBfmrQ5FRxanjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B8gIxQJqGZ2IgjvtGcME1WEwWvA3BnZhod9m7u4wbmfuv3qnoSKlT7Oun7ItoqPGd
	 hfQ6thxGff2O5llVLlRm5AwBFzLlKwubOV8LzlXbRXnCbFULJZPiw1k8l9ZHvRKRWf
	 a+3H0+OKZ2oMGRreI08mwzi8tnw0Zw3hMOmR7e3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B034F805B2; Tue, 15 Aug 2023 21:02:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFD29F805A1;
	Tue, 15 Aug 2023 21:02:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111A4F805A1; Tue, 15 Aug 2023 21:02:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ECF9F80272
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ECF9F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mm09zqvI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sgp0i9A+
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C2B741F8C3;
	Tue, 15 Aug 2023 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692126107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3VMFP/ThTKsmB7svo+Y2YbkVeoI7hlTMO+M5msj2cY=;
	b=mm09zqvI44MC0922Q7QnkyYJvxBZYPcsk3RCwu6F07NcF5wi97H0zbEDkJT0cWMa6+PtXR
	b8mV93NLPGNqrE8XEGWR7fXMmlBJ6DO9rz4drcQuvhd9g9EWdzlWYXs0GF8mYCkZeKq0cZ
	8YTTgyEVMis/jT31jpEFAU0QKnh8rTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126107;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3VMFP/ThTKsmB7svo+Y2YbkVeoI7hlTMO+M5msj2cY=;
	b=Sgp0i9A+cNlhxo1Y+AdjM8Mf1wTrvb5b3JtTK83KCaJ3d/BkRsIq3o5OdWkzdVUyS6J4Q0
	RXCFae0By7k2XGBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D8171353E;
	Tue, 15 Aug 2023 19:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wEucJZvL22QTVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 04/25] ALSA: dummy: Convert to generic PCM copy ops
Date: Tue, 15 Aug 2023 21:01:15 +0200
Message-Id: <20230815190136.8987-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UY6AD3JSYHMWQ3TF2X7SOODS3XZJXY3Y
X-Message-ID-Hash: UY6AD3JSYHMWQ3TF2X7SOODS3XZJXY3Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UY6AD3JSYHMWQ3TF2X7SOODS3XZJXY3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the dummy driver code to use the new unified PCM
copy callback.  As dummy driver doesn't do anything in the callback,
it's just a simple replacement.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 9c17b49a2ae1..4317677ba24a 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -626,14 +626,7 @@ static int alloc_fake_buffer(void)
 
 static int dummy_pcm_copy(struct snd_pcm_substream *substream,
 			  int channel, unsigned long pos,
-			  void __user *dst, unsigned long bytes)
-{
-	return 0; /* do nothing */
-}
-
-static int dummy_pcm_copy_kernel(struct snd_pcm_substream *substream,
-				 int channel, unsigned long pos,
-				 void *dst, unsigned long bytes)
+			  struct iov_iter *iter, unsigned long bytes)
 {
 	return 0; /* do nothing */
 }
@@ -667,8 +660,7 @@ static const struct snd_pcm_ops dummy_pcm_ops_no_buf = {
 	.prepare =	dummy_pcm_prepare,
 	.trigger =	dummy_pcm_trigger,
 	.pointer =	dummy_pcm_pointer,
-	.copy_user =	dummy_pcm_copy,
-	.copy_kernel =	dummy_pcm_copy_kernel,
+	.copy =		dummy_pcm_copy,
 	.fill_silence =	dummy_pcm_silence,
 	.page =		dummy_pcm_page,
 };
-- 
2.35.3

