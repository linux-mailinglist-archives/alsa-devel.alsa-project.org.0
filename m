Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A389C8BA9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2024 14:20:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F142368;
	Thu, 14 Nov 2024 14:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F142368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731590432;
	bh=k4RpM647z2WI9CokUqPjF9GRcTyECjKLiqup4dTp6Y4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KDmCJUxRZpQpSJAlkYk5af1it36xUjO4DTNyunL+cxvEJvOwYYKpbjfvXxDikxKqL
	 DD/kYnUJ1PJar8zIZkfNP214+UCZV2tidPKPlf139UuUvwsH3jKmc6F4KZ5f9t7QsU
	 EWWK3TvBFG+pt9gEj28WLKWQ4s+7tMY6L5PCPfrw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 559FCF805BF; Thu, 14 Nov 2024 14:19:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2887EF805BB;
	Thu, 14 Nov 2024 14:19:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAE35F8058C; Thu, 14 Nov 2024 14:19:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 77153F800D2
	for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2024 14:19:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77153F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731590392927725077-webhooks-bot@alsa-project.org>
References: <1731590392927725077-webhooks-bot@alsa-project.org>
Subject: src/Versions.in.in: Update *_tempo_base name
Message-Id: <20241114131955.AAE35F8058C@alsa1.perex.cz>
Date: Thu, 14 Nov 2024 14:19:55 +0100 (CET)
Message-ID-Hash: VNYLKGY7SEAJD6ZO62X3K7S5PZ5AVDDF
X-Message-ID-Hash: VNYLKGY7SEAJD6ZO62X3K7S5PZ5AVDDF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNYLKGY7SEAJD6ZO62X3K7S5PZ5AVDDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #421 was opened from nvinson:

Change @SYMBOL_PREFIX@snd_has_tempo_base to
@SYMBOL_PREFIX@snd_has_queue_tempo_base.

Starting with version 1.2.13, alsa-lib fails to link with ld.lld-19 due to "version script assignment of 'ALSA_1.2.13' to symbol 'snd_seq_has_tempo_base' failed: symbol not defined".

Per commit 769d1db1b0a213a39c7e59c0d1d724e7f45b1ac3 the correct name for the symbol is @SYMBOL_PREFIX@snd_has_queue_tempo_base; therefore, update src/Vesions.in.in to match.

Fixes bug 420
Fixes Gentoo bug 943399 (https://bugs.gentoo.org/943399)

Request URL   : https://github.com/alsa-project/alsa-lib/pull/421
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/421.patch
Repository URL: https://github.com/alsa-project/alsa-lib
