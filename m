Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67284B18566
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 18:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7B160266;
	Fri,  1 Aug 2025 18:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7B160266
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754064405;
	bh=VMjUAVkdYgn0m8wVfRGJfBVsiKUfZ1IdohuADgPyIKI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hE+pqGnKRgMLVKx4+55xrdohOWLmrChnssQGrJR0LatNtvrdqhFVaqGGyZh6jWUKR
	 TsomOcPHv3cRbMw8LPW6bK0yowB3osu/WRWi6+gL/NeZfPpXDVofu1fjZ96QqIi4Ly
	 OeM209mGR3xO8SN8oNE48jpOZhCFrNLJIOArqkGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F2C2F80533; Fri,  1 Aug 2025 18:06:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA9F2F805C5;
	Fri,  1 Aug 2025 18:06:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AAACF8052D; Fri,  1 Aug 2025 18:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F63F8012A
	for <alsa-devel@alsa-project.org>; Fri,  1 Aug 2025 18:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F63F8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1857b032986cc500-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/470@alsa-project.org>
References: <alsa-project/alsa-lib/pr/470@alsa-project.org>
Subject: conf/pistachio: fix syntax
Date: Fri,  1 Aug 2025 18:05:18 +0200 (CEST)
Message-ID-Hash: EWRQT4VJTB3BODBWQKJTFRV6EKSWJ5YS
X-Message-ID-Hash: EWRQT4VJTB3BODBWQKJTFRV6EKSWJ5YS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWRQT4VJTB3BODBWQKJTFRV6EKSWJ5YS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #470 was opened from blino:

It was missing closing brackets since its introduction.

Fixes: 4dfa8f08fb83 ("conf/cards: add support for pistachio-card.")

Request URL   : https://github.com/alsa-project/alsa-lib/pull/470
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/470.patch
Repository URL: https://github.com/alsa-project/alsa-lib
