Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D97057E0BE3
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Nov 2023 00:08:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCCC825;
	Sat,  4 Nov 2023 00:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCCC825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699052913;
	bh=2EwYv4tkMbwkO7NgqybtC3PiCsUBewVgN7F8QnxDsMY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=G/VllMS/n+BA5mpG6kB5fQFLo4QqTWfjgJs+Zw2Yvf1OqWrjJKqsI3rwRYfvmAP4P
	 O9oWknIrhZ7A494aQkwWo5hihT+xdoenfRSa/oLEknVlsfpmHKb1AC2kUuoa6Zolyb
	 HvGaSNLVbTXajT+XPOq9JzlANqwKMsvDBkMHYRM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41DB7F80558; Sat,  4 Nov 2023 00:07:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAEE8F8020D;
	Sat,  4 Nov 2023 00:07:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3AB0F80290; Sat,  4 Nov 2023 00:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D118F8014B
	for <alsa-devel@alsa-project.org>; Sat,  4 Nov 2023 00:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D118F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1699052855629006624-webhooks-bot@alsa-project.org>
References: <1699052855629006624-webhooks-bot@alsa-project.org>
Subject: No sound in OS when suspending `aplay` process
Message-Id: <20231103230739.D3AB0F80290@alsa1.perex.cz>
Date: Sat,  4 Nov 2023 00:07:39 +0100 (CET)
Message-ID-Hash: TDQJOGJJTPLKOUOJNY6SJSOA2P7VMIW2
X-Message-ID-Hash: TDQJOGJJTPLKOUOJNY6SJSOA2P7VMIW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDQJOGJJTPLKOUOJNY6SJSOA2P7VMIW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #243 was opened from syduki:

I'm using the [flac tool](https://xiph.org/flac/documentation_tools_flac.html) + `aplay` combo to play my lossless audio files, something like following:

`flac -cds filename.flac | aplay`

I usually suspend this process with `ctrl+z` when I need to temporarily switch to another sound-enabled application. That worked until recently when I upgraded my OS (Ubuntu 23.10, aplay-1.2.9, was 1.2.8). Now when suspending that process there is no sound at all in any of applications nor system.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/243
Repository URL: https://github.com/alsa-project/alsa-utils
