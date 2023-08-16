Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315577E5FB
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:05:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E4B4836;
	Wed, 16 Aug 2023 18:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E4B4836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201941;
	bh=2FdK+5Wi5hG1tKxx/r6nUBGzHtE1ge8gP1TH9v/Pb3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xjl7Hs8a+kG30IZ6hbMiYYvAch0zd7gEMC+bax2Go14Lu78jyQgHLbryOxuOtesji
	 n2oLzfrluJud9xn7TbhCn5xcaJMQTY3uDEccoD+2aB2RjGX/kihtQK01g6KY4l+aEc
	 x03riwlPBNX4b0qvLVdOa3osa6/h6GBb3h1hKucA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42FCDF805A9; Wed, 16 Aug 2023 18:03:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92EA8F805A9;
	Wed, 16 Aug 2023 18:03:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94BFFF8025F; Wed, 16 Aug 2023 18:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 427FBF8025F
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 427FBF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WqErkCVo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LZWGyGsD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B4BA218F2;
	Wed, 16 Aug 2023 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=698G18KDW4ZFQ9Xff688MQngnxCshT9y93JoXN5/sUE=;
	b=WqErkCVowOCX8ym5Y+6NmjOgl8XF09sdMUH+PWDyh74FR2KdO6doZ4JWqkwy02A91uLqCB
	B8rwVWdrulwOYrz+3oTwHw0K8VscplXQVNmjfN0GwxgBjJvQPff8+FYYU9dFsvLL9Iekwj
	O10F6mBQyrKR0SJs88qHA5dU8iVlhtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=698G18KDW4ZFQ9Xff688MQngnxCshT9y93JoXN5/sUE=;
	b=LZWGyGsDL18idvQ97NZbt3Y/auVDwtC4MkC14zrl0QBhzFSLGr2SAI+Uhf0JH07ZEg13MF
	aX3hSm9Jg6ObxpCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EAB9133F2;
	Wed, 16 Aug 2023 16:02:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AMw3BjDz3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 8/9] ALSA: seq: Create device with snd_device_alloc()
Date: Wed, 16 Aug 2023 18:02:51 +0200
Message-Id: <20230816160252.23396-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POOOWI4SVBD32FCT2MDBRXGXBFPWLMZU
X-Message-ID-Hash: POOOWI4SVBD32FCT2MDBRXGXBFPWLMZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POOOWI4SVBD32FCT2MDBRXGXBFPWLMZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Align with the other components, and use snd_device_alloc() for the
new sound device for sequencer, too.  No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index e3f9ea67d019..42a705141050 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2721,7 +2721,7 @@ static const struct file_operations snd_seq_f_ops =
 	.compat_ioctl =	snd_seq_ioctl_compat,
 };
 
-static struct device seq_dev;
+static struct device *seq_dev;
 
 /* 
  * register sequencer device 
@@ -2730,15 +2730,17 @@ int __init snd_sequencer_device_init(void)
 {
 	int err;
 
-	snd_device_initialize(&seq_dev, NULL);
-	dev_set_name(&seq_dev, "seq");
+	err = snd_device_alloc(&seq_dev, NULL);
+	if (err < 0)
+		return err;
+	dev_set_name(seq_dev, "seq");
 
 	mutex_lock(&register_mutex);
 	err = snd_register_device(SNDRV_DEVICE_TYPE_SEQUENCER, NULL, 0,
-				  &snd_seq_f_ops, NULL, &seq_dev);
+				  &snd_seq_f_ops, NULL, seq_dev);
 	mutex_unlock(&register_mutex);
 	if (err < 0) {
-		put_device(&seq_dev);
+		put_device(seq_dev);
 		return err;
 	}
 	
@@ -2752,6 +2754,6 @@ int __init snd_sequencer_device_init(void)
  */
 void snd_sequencer_device_done(void)
 {
-	snd_unregister_device(&seq_dev);
-	put_device(&seq_dev);
+	snd_unregister_device(seq_dev);
+	put_device(seq_dev);
 }
-- 
2.35.3

