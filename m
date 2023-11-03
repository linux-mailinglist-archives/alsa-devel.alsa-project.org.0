Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFF7E0B56
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 23:56:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A6DDF;
	Fri,  3 Nov 2023 23:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A6DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699052198;
	bh=U9vzUcjIqm9LOGoxVE1iX7HlI6P8YBgVQOcsCK6l0RE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ouq8GDTcAssYNODmlxYKYwVLCcTRT2dZJwM2g7bECOnRlgz9mZ4k9BlU5RbsnAXrE
	 8FwpCWHfiuVnRlja3eeIlxt/Bc3BcWui+9Z0IRj9Xcz0rPrevi7deFmHLqn2fmzFXr
	 zTmSk1LVJUg3szKCwAKb+Cc88FDoKTRDSQKENDa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28789F80564; Fri,  3 Nov 2023 23:55:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2056F8020D;
	Fri,  3 Nov 2023 23:55:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C54D2F80290; Fri,  3 Nov 2023 23:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B637F8016D
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 23:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B637F8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1699052099899690866-webhooks-bot@alsa-project.org>
References: <1699052099899690866-webhooks-bot@alsa-project.org>
Subject: No sound in OS when suspending `aplay` process
Message-Id: <20231103225502.C54D2F80290@alsa1.perex.cz>
Date: Fri,  3 Nov 2023 23:55:02 +0100 (CET)
Message-ID-Hash: D44NJOWCSHATXBR25VP3TZKTJ45YAJIX
X-Message-ID-Hash: D44NJOWCSHATXBR25VP3TZKTJ45YAJIX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D44NJOWCSHATXBR25VP3TZKTJ45YAJIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #361 was opened from syduki:

I'm using the [flac tool](https://xiph.org/flac/documentation_tools_flac.html) + `aplay` combo to play my lossless audio files, something like following:

`flac -cds filename.flac | aplay`

I usually suspend this process with `ctrl+z` when I need to temporarily switch to another sound-enabled application. That worked until recently when I upgraded my OS (Ubuntu 23.10, aplay-1.2.9, was 1.2.8). Now when suspending that process there is no sound at all in any of applications nor system.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/361
Repository URL: https://github.com/alsa-project/alsa-lib
