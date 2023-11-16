Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D27EE88A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 21:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8961482A;
	Thu, 16 Nov 2023 21:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8961482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700168031;
	bh=y1pZ6V7UNxhxgrMvBL7YDlaqEEkm0HOkzYE9UDCAl8A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o5WonZa7CUoRraYBnAaq2PjFxvbbHCHXy8B5kGGyDomF0yXbH7aYqbmz3IAlFkc/L
	 G9oFvFJttYaJ46J4jUctUExvs4L1X52uhc1OsM2p5ZQvTjrsyUk8RVqJ1aBjtv+3jB
	 lT/Fb6/tjfYZMQkPwJzJRabC35PCk2Sm6DHfV328=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E171AF80249; Thu, 16 Nov 2023 21:53:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94732F8016E;
	Thu, 16 Nov 2023 21:53:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62698F801D5; Thu, 16 Nov 2023 21:52:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 346F0F80152
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 21:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346F0F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700167972428574562-webhooks-bot@alsa-project.org>
References: <1700167972428574562-webhooks-bot@alsa-project.org>
Subject: ucm: fix TOCTOU race condition
Message-Id: <20231116205256.62698F801D5@alsa1.perex.cz>
Date: Thu, 16 Nov 2023 21:52:56 +0100 (CET)
Message-ID-Hash: SBOJJOULGNCJ5QJJIRBVMGWAWUXUIA5Q
X-Message-ID-Hash: SBOJJOULGNCJ5QJJIRBVMGWAWUXUIA5Q
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBOJJOULGNCJ5QJJIRBVMGWAWUXUIA5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #367 was opened from szsam:

Separately checking the state of a file before operating on it may allow an attacker to modify the file between the two operations. Fix by calling readlink first. If that fails, then path should not be a symbolic link and we call open() followed by fstat(). open() with O_NOFOLLOW will return an error if the file is a symlink.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/367
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/367.patch
Repository URL: https://github.com/alsa-project/alsa-lib
