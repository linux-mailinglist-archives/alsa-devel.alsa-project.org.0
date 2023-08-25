Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E259788375
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 11:24:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F440844;
	Fri, 25 Aug 2023 11:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F440844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692955497;
	bh=5VAHBv0TpInqS1VirXuZKTlgsORIDkVQPCiXeH5+BfM=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t2VGFYJlzaqPjt6HV9K0vZ5cGHUegPkNvR2ZXg2FErswowZSQs3GEybIXaZHRLTnH
	 qy3QQennHIwaMFgG8ggQCFNV4k08H4CwK/yoCUQBHsY6OCChbL1KWmJGeFloPQTOLZ
	 L0CnZlwTb+aQVut2ARtGjsaGx2EqLPYSZYb3lzRA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1192F8023B; Fri, 25 Aug 2023 11:24:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 370EFF800D1;
	Fri, 25 Aug 2023 11:24:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F856F800F5; Fri, 25 Aug 2023 11:24:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E152F800BF
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 11:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E152F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NncBh56C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=coK/vS0r
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C53AC224A0;
	Fri, 25 Aug 2023 09:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692955433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=oXvqqjW3+Df7PAZfhqt1PIbhTd7LP3sxOVPOE0+0jys=;
	b=NncBh56C9BCSYFwj7n2UWHhSgnJz0t1fyrft3FTYy0N0+fdeiQ9Uhe/v3hHbHbF16OkxOB
	z7Qss1mlEP+GpLV2BzDWA2i0c+p94+Dimk2O562g3ydafJWL+MK2sOo5dNlxFypgUw5NC/
	8Rbp+/75pYYK/up8OwdQ6gmM30boC3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692955433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=oXvqqjW3+Df7PAZfhqt1PIbhTd7LP3sxOVPOE0+0jys=;
	b=coK/vS0rZC1R4yg74BBDxWIfEEBYF0PULzyAfMl6dF/I9/74R59RVuK9Uxfg6fEkv/FVbL
	jokwLOmf2jKwFLBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8AE3138F9;
	Fri, 25 Aug 2023 09:23:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YF11KClz6GSRAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 09:23:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: doc: Fix missing backquote in midi-2.0.rst
Date: Fri, 25 Aug 2023 11:23:51 +0200
Message-Id: <20230825092351.11780-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LUY2RWS5X3SEK6BSQWXNVFYM54RPRAVP
X-Message-ID-Hash: LUY2RWS5X3SEK6BSQWXNVFYM54RPRAVP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUY2RWS5X3SEK6BSQWXNVFYM54RPRAVP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix the missing  missing backquote that caused a sphinx warning:
  Documentation/sound/designs/midi-2.0.rst:517: WARNING: Inline interpreted text or phrase reference start-string without end-string.

Fixes: e240cff9e6e9 ("ALSA: documentation: Add description for USB MIDI 2.0 gadget driver")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20230825152957.18c54ae2@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/designs/midi-2.0.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/midi-2.0.rst b/Documentation/sound/designs/midi-2.0.rst
index 3b08b98354f8..45987f256b97 100644
--- a/Documentation/sound/designs/midi-2.0.rst
+++ b/Documentation/sound/designs/midi-2.0.rst
@@ -515,7 +515,7 @@ connection::
   % echo 2 > functions/midi2.usb0/ep.0/block.1/is_midi1
 
 For disabling the processing of UMP Stream messages in the gadget
-driver, pass `0` to `process_ump attribute in the top-level config::
+driver, pass `0` to `process_ump` attribute in the top-level config::
 
   % echo 0 > functions/midi2.usb0/process_ump
 
-- 
2.35.3

