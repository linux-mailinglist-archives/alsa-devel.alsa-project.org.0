Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E76C6008
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 07:54:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4B1ECC;
	Thu, 23 Mar 2023 07:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4B1ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679554470;
	bh=3GWwdnYNEedQDKvDEsKzSqwrQEOuXEfl++HAhaJK7k8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jIEfieTfFB/ktIzrxt+NPkcMQ6PD3FXgdmGvODnHHRTbLfxeSRyJ5Q/P+cBUCJgrp
	 Av2/U0BKpbklELAA2U8IJXOR6oA6M4/cGduj1wsZyiY1YHFTi7OhWSLaloueJE5dQJ
	 Jy+bOnQjmDEIBFyylfwM+1n6DZtYVoIqn7Vpc270=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4651F8051B;
	Thu, 23 Mar 2023 07:52:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC8A7F80482; Thu, 23 Mar 2023 07:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13F35F802E8
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 07:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13F35F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QuEhXtUZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jvYOfSt7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9A4A5C442;
	Thu, 23 Mar 2023 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1679554361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZ/mBUVfSSsQVWWIBI5QYGo4/NOsaWQonA6DVbNhKks=;
	b=QuEhXtUZr8+Z0a5A7er+Z87uooMuowxbKErt4t7/Jo44haHOCS771lXHjDMJ0cckAHTnTG
	5oeGpZ6uj1PoMPfJTbOGtl8tH0QmwYHprztfWrZKYOgeBAyZCblJFNM+H+B5I4+Hfoquh2
	xPTzmFZZfskPjzujbW8PCx/Pkq82VM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679554361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZ/mBUVfSSsQVWWIBI5QYGo4/NOsaWQonA6DVbNhKks=;
	b=jvYOfSt7VfP9gZ0D82PnsFE8SY0/GUAZnKhAO1/WQe1GpHv2z26c20y/2khjHfXLtS58dp
	ep04skgxkcWz7GDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D25313596;
	Thu, 23 Mar 2023 06:52:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UOiWITn3G2QJcQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 23 Mar 2023 06:52:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: docs: Add description about ack callback -EPIPE
 error handling
Date: Thu, 23 Mar 2023 07:52:36 +0100
Message-Id: <20230323065237.5062-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230323065237.5062-1-tiwai@suse.de>
References: <20230323065237.5062-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TJBAJXXEKUC7JX4B6U4HKMZBDEN6F5IX
X-Message-ID-Hash: TJBAJXXEKUC7JX4B6U4HKMZBDEN6F5IX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJBAJXXEKUC7JX4B6U4HKMZBDEN6F5IX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a brief description about the newly added behavior of the PCM ack
callback with -EPIPE error.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 5c9523b7d55c..6b8f3495407f 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -2137,6 +2137,10 @@ This callback is also not mandatory. This callback is called when the
 emu10k1-fx and cs46xx need to track the current ``appl_ptr`` for the
 internal buffer, and this callback is useful only for such a purpose.
 
+The callback function may return 0 or a negative error. When the
+return value is ``-EPIPE``, PCM core treats as a buffer XRUN happens,
+and changes the state to ``SNDRV_PCM_STATE_XRUN`` automatically.
+
 This callback is atomic as default.
 
 page callback
-- 
2.35.3

