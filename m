Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7D575F68
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 12:31:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D9F18D7;
	Fri, 15 Jul 2022 12:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D9F18D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657881109;
	bh=hLFkk5BxM0L4Xp982xW3TBQk+PTrRudE1Ap9VQgMTzE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qSc5Po65U9EVM/t4NvTo9Cz+hJI25kOe9kHjZqvvqr5Cvab8mv13BDYxBQ+PGf/hk
	 nnyUBRyq5VSXW3O2NFEBYA1456qzKyGOkr3BQzzho1e6roQEoqYiqMtbpahBpChvEm
	 X4/ujszqYgXpbU8u5dxYIDhrESXALLZP3mAihCGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7646F80552;
	Fri, 15 Jul 2022 12:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4556F80548; Fri, 15 Jul 2022 12:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 682B6F804B2
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 682B6F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="LeSXbx7L"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0RytEMNn"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C720634136;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657880978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dt+1QCRZ2XSmqOkJwPq4z4lw5/QFdsDsZDcIDJQkFcE=;
 b=LeSXbx7Lkl3NjZu3Qt6xY7vQTH/cohskfISDk5ZPeZMRMt3tG7IFvV5OHDiSVn1ItHZSFl
 uMJSO8sAnfGn2CWCd2Y0He+yzWQsHAEiWoNplVeLAk5qLNtiGZIjS0d/vbIHu/xGZQbtL4
 TNLyi3kgCowgyl3LMLDCrvbccauEr3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657880978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dt+1QCRZ2XSmqOkJwPq4z4lw5/QFdsDsZDcIDJQkFcE=;
 b=0RytEMNnleF0i6KuDmNRDw/jVGRlTs9NaB7y5m/Ni6bW8hx5h7ko2ecgOcSR/3Vyp5Pka+
 3U2olGTnrwyFTfAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2FE013B28;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id APoQJ5JB0WI+WwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 10:29:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ALSA: doc: Drop stale fasync entry
Date: Fri, 15 Jul 2022 12:29:35 +0200
Message-Id: <20220715102935.4695-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220715102935.4695-1-tiwai@suse.de>
References: <20220715102935.4695-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The fasync entry has been dropped recently.  Update the documentation
as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 176b73583b7a..84b4ecae1485 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1597,7 +1597,6 @@ are the contents of this file:
           spinlock_t lock;
           wait_queue_head_t sleep;
           struct timer_list tick_timer;
-          struct fasync_struct *fasync;
 
           /* -- private section -- */
           void *private_data;
-- 
2.35.3

