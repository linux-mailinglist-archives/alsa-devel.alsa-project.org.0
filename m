Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A4807AE4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 22:57:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4606A82B;
	Wed,  6 Dec 2023 22:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4606A82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701899824;
	bh=SkQE86/J45VH9rflCwnEtDmu36xBKHzbigutaUZW8FA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U7TQTOsSJ3Z1bMtiqfPjU8T9I9HWv7wfAgeKqRgaMWq2jcqXvRiZS8xa3jkMjhghg
	 iLnZDLmdRTSMefYQOEAzjEaRVzdHUPXz9lZyaESsjJBFHvN/TIsRUw6nB16L2Ozt5W
	 HDKu0n+lhVO+7pS3k2giE+PvYC5DYfRbzS+PGXtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20CC8F80568; Wed,  6 Dec 2023 22:56:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7072F80166;
	Wed,  6 Dec 2023 22:56:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58315F8024E; Wed,  6 Dec 2023 22:56:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D82EF800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 22:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D82EF800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1701899794950514078-webhooks-bot@alsa-project.org>
References: <1701899794950514078-webhooks-bot@alsa-project.org>
Subject: alsactl: fix potential buffer overwrite
Message-Id: <20231206215637.58315F8024E@alsa1.perex.cz>
Date: Wed,  6 Dec 2023 22:56:37 +0100 (CET)
Message-ID-Hash: MZOTQW7OWDL4KKHTLYQ4GM5RYK4YVQ4R
X-Message-ID-Hash: MZOTQW7OWDL4KKHTLYQ4GM5RYK4YVQ4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZOTQW7OWDL4KKHTLYQ4GM5RYK4YVQ4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #247 was opened from szsam:

The 'call to sprintf' operation on line 413 requires 21 bytes but the destination is only 16 bytes.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/247
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/247.patch
Repository URL: https://github.com/alsa-project/alsa-utils
