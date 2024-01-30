Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B3842628
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 14:26:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44475EAB;
	Tue, 30 Jan 2024 14:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44475EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706621170;
	bh=7+hEEAeu+sDQpu+XVIsQ2FhMgK+p9iFpBbj1sZcQCoA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XxkB5xp7QK89IvuoEbWGx4/VWl+xROp33Cnuqy1LDSA82uz3ufwvyAPI+HlxVzZ3M
	 5cKBcohG8VvRTtjYZeyb+c3BOH0ut1R7Yg9C6K6vBD3m1NtJXZosXYfqdlnVgXmPI/
	 epKQc4vchNRFN5BIkz1Q5sHhBHm/Q2fwUeh2iFLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A0BAF80548; Tue, 30 Jan 2024 14:25:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21BD4F80589;
	Tue, 30 Jan 2024 14:25:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B25CBF80568; Tue, 30 Jan 2024 14:25:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F04F80563
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 14:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10F04F80563
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706621129847458601-webhooks-bot@alsa-project.org>
References: <1706621129847458601-webhooks-bot@alsa-project.org>
Subject: topology: correct version script path
Message-Id: <20240130132532.B25CBF80568@alsa1.perex.cz>
Date: Tue, 30 Jan 2024 14:25:32 +0100 (CET)
Message-ID-Hash: KFS5M56O6HBWSTCI6KSDOGG6KRXX6NRJ
X-Message-ID-Hash: KFS5M56O6HBWSTCI6KSDOGG6KRXX6NRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFS5M56O6HBWSTCI6KSDOGG6KRXX6NRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #383 was opened from jpalus:

contrary to libasound, version script for libatopology is a regular source file. while it's often the case that $(builddir) and $(srcdir) point to the same directory, they don't always have to. therefore path needs to point explicitly to $(srcdir) for Versions script in topology

Fixes: GH-382
Fixes: dc7da761f3a2 ("topology: separate Versions linker script")

Request URL   : https://github.com/alsa-project/alsa-lib/pull/383
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/383.patch
Repository URL: https://github.com/alsa-project/alsa-lib
