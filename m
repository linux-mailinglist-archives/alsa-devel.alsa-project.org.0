Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C0CC3684
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Dec 2025 15:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BDD760195;
	Tue, 16 Dec 2025 15:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BDD760195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765893829;
	bh=2G52ImKHF+Z/UxI7PzLgirdDjtAXIOrjx/yhDt6UhJI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pCmblXVtftPVShdi2aaRZUOhhImxoFUQQ5BQ/3FfjpeljEQk6KlRMKqpiMR1K7Rra
	 hPE2WdZNJ5QAB1vUx5B9W8jzvZhtRmionTHePxnp8un3WpnQeTisqr4raFhL5VWDwv
	 VU4j42nIRQ7MaJSRFJtWjwp74Q9Au0gU/ZBAfJ2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00029F805D7; Tue, 16 Dec 2025 15:03:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89374F805D7;
	Tue, 16 Dec 2025 15:03:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F58EF80217; Tue, 16 Dec 2025 15:02:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C7C5F800DF
	for <alsa-devel@alsa-project.org>; Tue, 16 Dec 2025 15:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C7C5F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1881b7071d4f0000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-utils/pr/315@alsa-project.org>
References: <alsa-project/alsa-utils/pr/315@alsa-project.org>
Subject: aplay: add missing break before the default case
Date: Tue, 16 Dec 2025 15:02:59 +0100 (CET)
Message-ID-Hash: I6C26INKRCLLT5YVBR4M3MOVOXTQ2X2J
X-Message-ID-Hash: I6C26INKRCLLT5YVBR4M3MOVOXTQ2X2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6C26INKRCLLT5YVBR4M3MOVOXTQ2X2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #315 was opened from bardliao:

Add the break before the default case back. Otherwise, all cases will fall into the default/error case.

Fixes: e78583ab7cde ("aplay: reorganize format handling in begin_wave()")

Request URL   : https://github.com/alsa-project/alsa-utils/pull/315
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/315.patch
Repository URL: https://github.com/alsa-project/alsa-utils
