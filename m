Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B5AFA2F0
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jul 2025 06:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6569A60207;
	Sun,  6 Jul 2025 06:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6569A60207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751775544;
	bh=OQ8fKxcj4uBVogYLubMm0MuU9xK6O6QFfzaPiZzhhz8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iCZ+Xq7pwJ81M+wLjICipp4aJ17D2F9BD9XHJFMp028Sw00VBoK5KoDR6TP2Y6qhy
	 n/ufE1E9+CAIYCi6Ge6e0cM2sXHW27LwewiNxE6ifIDIFX9emj0iPaBINTNX9X6UiN
	 9irAenqTdVusty15ursfF8Hf0diSKRBK+ceBBpb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E98CF805CB; Sun,  6 Jul 2025 06:18:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0FD6F805C5;
	Sun,  6 Jul 2025 06:18:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE84F804B3; Sun,  6 Jul 2025 06:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id BD558F800B6
	for <alsa-devel@alsa-project.org>; Sun,  6 Jul 2025 06:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD558F800B6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <184f8e8a39aaff00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/463@alsa-project.org>
References: <alsa-project/alsa-lib/pr/463@alsa-project.org>
Subject: test: update midifile library to ANSI C
Date: Sun,  6 Jul 2025 06:18:26 +0200 (CEST)
Message-ID-Hash: HR7TBHKNEGPE5LYRLCWKFXUBF56YFZ3F
X-Message-ID-Hash: HR7TBHKNEGPE5LYRLCWKFXUBF56YFZ3F
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HR7TBHKNEGPE5LYRLCWKFXUBF56YFZ3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #463 was opened from atsampson:

The `midifile` library used by the `playmidi1` program dates from 1989, and used pre-ANSI function definitions and prototypes. GCC 15 now defaults to C23 where `()` means the same as `(void)` in prototypes, which causes type mismatch errors.

Update the code to use ANSI function definitions and prototypes, so it'll compile happily as anything from ANSI C to C23. This revealed that `playmidi1`'s `do_tempo` had the wrong argument type, so correct that as well.

Fixes #452.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/463
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/463.patch
Repository URL: https://github.com/alsa-project/alsa-lib
