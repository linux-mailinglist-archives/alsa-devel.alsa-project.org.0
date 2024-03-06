Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE887362D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 13:21:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD8E85D;
	Wed,  6 Mar 2024 13:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD8E85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709727687;
	bh=JyhrbKGvqz0gzD1O25O/33y30pLkAjt8Fq36bVuJjN8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vPKI/Ecmdi+BZFuLoi9FPrRCUqdfLn4WmIbjUbetBmyFzUrtcyqJpbxkLlwmdtIBc
	 gRh2GilaBOLxY9nSpSOdvr0L/vEYpE2HXsivYQjQWG8zteMbCo++AERxiICQ5/Ihu3
	 9jClwtes6TfDZFJRDXNTi1hbhIqy5CqI5eFIB3tQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D00D4F8057E; Wed,  6 Mar 2024 13:20:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B68F80570;
	Wed,  6 Mar 2024 13:20:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79462F8024E; Wed,  6 Mar 2024 13:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A64E2F8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 13:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A64E2F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1709727646404477835-webhooks-bot@alsa-project.org>
References: <1709727646404477835-webhooks-bot@alsa-project.org>
Subject: Alsamixer is exiting upon receiving some keys,
 such as volume control ones
Message-Id: <20240306122050.79462F8024E@alsa1.perex.cz>
Date: Wed,  6 Mar 2024 13:20:50 +0100 (CET)
Message-ID-Hash: OC5BIUAV75UYGH6CT6QEMSYIEZ2F7HSO
X-Message-ID-Hash: OC5BIUAV75UYGH6CT6QEMSYIEZ2F7HSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OC5BIUAV75UYGH6CT6QEMSYIEZ2F7HSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #255 was opened from Porkepix:

When in an environment not intercepting those keys (usually managed by your compositor/window manager), upon receiving some keycodes such as volume up or down, alsamixer is exiting and writing the UTF-8 keycode inside the terminal while it shouldn't.

Examples:
Mute key > 440u
Volume down key > 438u
Volume up key > 439u

Curiously enough, the microphone mute one doesn't do anything.

These should at the very least not exit alsamixer. A bonus would be, when they're not intercepted, to actually use them to apply mutes and volumes up/down.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/255
Repository URL: https://github.com/alsa-project/alsa-utils
