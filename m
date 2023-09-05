Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6979205D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 07:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196B0825;
	Tue,  5 Sep 2023 07:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196B0825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693891665;
	bh=sKTDtBzXxIoOP/AT+OVaK6YGhZhxrskgETmowzkudDM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pcd9N+yd5wRTD3gixGSuQxqrZnWQBJ9sFPQETivZJEDejDZOtKuMZxAaXi98OpLgd
	 snkp7DvcX6OwgiTj/joO65V79bP0x1p7BPN0FRLnuyjNohEfRFy1at40W+isq2eBlG
	 SNA7BE2+E1BmWqCG8fgi7O067zFxSOJiqgnPxtGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69A12F8055A; Tue,  5 Sep 2023 07:26:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 135BAF80236;
	Tue,  5 Sep 2023 07:26:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96EF1F8047D; Tue,  5 Sep 2023 07:26:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C73FF80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 07:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C73FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ll1nwdsY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ViQNVSu1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF00B21850;
	Tue,  5 Sep 2023 05:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693891598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=TrC51d+ZJBUQcFjxZwIciw4rW5ciXy4mMxn6+Usbc1I=;
	b=ll1nwdsY+q9VzZAcRnvd2PFbiE57rVIVi2rw+qFuYCJhjWgzJ/m3dHSJW43kB1wIr0G92P
	XTX1Uvz7gE6utvjW+YdmtCZFLsEJIbaP3YRrH+AKkgmrYVflVNjWexq1470T6m5UZaD5K8
	9XjA28vlG0Y4KNMQzdR6BJDsRcoS0lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693891598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=TrC51d+ZJBUQcFjxZwIciw4rW5ciXy4mMxn6+Usbc1I=;
	b=ViQNVSu1wVTx1+AOsH6eTDgYJhr1Z4JP83sSKio112zeAg2F1Tt1gT5JCnbnwhukVX0T2X
	nGg9w+L5eYYGGTBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD65A134B2;
	Tue,  5 Sep 2023 05:26:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EsRNKQ689mTYLwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 05 Sep 2023 05:26:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Ash Holland <ash@sorrel.sh>
Subject: [PATCH] ALSA: seq: Fix snd_seq_expand_var_event() call to user-space
Date: Tue,  5 Sep 2023 07:26:31 +0200
Message-Id: <20230905052631.18240-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NGLCZGZKJBYN6GAXQM6LB6VFOKNVH6DJ
X-Message-ID-Hash: NGLCZGZKJBYN6GAXQM6LB6VFOKNVH6DJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGLCZGZKJBYN6GAXQM6LB6VFOKNVH6DJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The recent fix to clear the padding bytes at
snd_seq_expand_var_event() broke the read to user-space with
in_kernel=0 parameter.  For user-space address, it has to use
clear_user() instead of memset().

Fixes: f80e6d60d677 ("ALSA: seq: Clear padded bytes at expanding events")
Reported-and-tested-by: Ash Holland <ash@sorrel.sh>
Closes: https://lore.kernel.org/r/8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_memory.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index 174585bf59d2..94db3726864b 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -187,8 +187,12 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
 	err = expand_var_event(event, 0, len, buf, in_kernel);
 	if (err < 0)
 		return err;
-	if (len != newlen)
-		memset(buf + len, 0, newlen - len);
+	if (len != newlen) {
+		if (in_kernel)
+			memset(buf + len, 0, newlen - len);
+		else
+			clear_user((__force void __user *)buf + len, newlen - len);
+	}
 	return newlen;
 }
 EXPORT_SYMBOL(snd_seq_expand_var_event);
-- 
2.35.3

