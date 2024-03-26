Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17D88D172
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 23:45:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D70E2BDB;
	Tue, 26 Mar 2024 23:45:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D70E2BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711493126;
	bh=fE8YQ0ldH4jAPvC8YbW24he4IxhcXj1g5OmwhFjAj+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u5yBUdnxR5vQZpYMSHyx3kJG9nRh58zt5QsT5n7wRfAHZQpWlkolAbs2MYa7IA6aF
	 AQgtLbLzns5DKOZxW3RsLpne39146dIJI13vMjv+L9qdYkYMHCMNQrl6Cg/Hgpep8i
	 HHvS/62/XiPcAa+tbz//u0CKe49tJCGtgPaAaoSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C96ACF805D4; Tue, 26 Mar 2024 23:44:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA9CF805AD;
	Tue, 26 Mar 2024 23:44:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BCFBF8025F; Tue, 26 Mar 2024 23:41:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 733B0F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 23:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 733B0F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ICJtMX3p
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0E84CE2471;
	Tue, 26 Mar 2024 22:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A94DC433F1;
	Tue, 26 Mar 2024 22:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711492873;
	bh=fE8YQ0ldH4jAPvC8YbW24he4IxhcXj1g5OmwhFjAj+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ICJtMX3pCuiusynEfe3bAP6Lspz0zcyuLbBOka+EOsCaOFZME4FZ4QIKrK/MZdJmq
	 Ctvnh5OIwUz+4zf2REjGVM2wdtuYwLoVkURryHKORb15fiwpv0FTQMJtESTGs4TGQ9
	 M95cMSdR9qm2j/ow8DdkaA96bSW6B+j3pXIETUi2N1JbBiGG6nS+FatuULN7WX9ApY
	 OEQW8S0LDu+tihl3F/LXp4MYlPtjNGctBOW8AUwWSRImiBVjqWYm1AiepC0fk/OF4a
	 ICeRLsN9MuXhJv/PBCigSpwkmoq065lOs3WVMt19zKcKFsi3X/clDOsIaByQv9Gr8K
	 a1f7cxjjNEj7Q==
From: Arnd Bergmann <arnd@kernel.org>
To: llvm@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dawei Li <set_pte_at@outlook.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] ALSA: aoa: avoid false-positive format truncation warning
Date: Tue, 26 Mar 2024 23:38:07 +0100
Message-Id: <20240326223825.4084412-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
References: <20240326223825.4084412-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBRVV446FY6EI5XXCHEZCMZAHD33XNTI
X-Message-ID-Hash: PBRVV446FY6EI5XXCHEZCMZAHD33XNTI
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBRVV446FY6EI5XXCHEZCMZAHD33XNTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

clang warns about what it interprets as a truncated snprintf:

sound/aoa/soundbus/i2sbus/core.c:171:6: error: 'snprintf' will always be truncated; specified size is 6, but format string expands to at least 7 [-Werror,-Wformat-truncation-non-kprintf]

The actual problem here is that it does not understand the special
%pOFn format string and assumes that it is a pointer followed by
the string "OFn", which would indeed not fit.

Slightly increasing the size of the buffer to its natural alignment
avoids the warning, as it is now long enough for the correct and
the incorrect interprations.

Fixes: b917d58dcfaa ("ALSA: aoa: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/aoa/soundbus/i2sbus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index b8ff5cccd0c8..5431d2c49421 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -158,7 +158,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 	struct device_node *child, *sound = NULL;
 	struct resource *r;
 	int i, layout = 0, rlen, ok = force;
-	char node_name[6];
+	char node_name[8];
 	static const char *rnames[] = { "i2sbus: %pOFn (control)",
 					"i2sbus: %pOFn (tx)",
 					"i2sbus: %pOFn (rx)" };
-- 
2.39.2

