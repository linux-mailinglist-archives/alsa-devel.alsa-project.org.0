Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810787D4A3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 20:51:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA0CA2366;
	Fri, 15 Mar 2024 20:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA0CA2366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710532275;
	bh=aiO0+uqqcjotn4sQxZ+UDUlGo+/92zkiZaKsRij/EiI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sB/PirjMwwLnmku4LR4fxVCwxkrRhdrlPq/0dPZhtPMck0CR7BGByurOeYuBW6Fpl
	 FYS1TSw4LkVGEENChWsBy3Eiw9msva/0FhY8vm1viNlI6GwGDvfJn8VdWv54RgFt7N
	 En/2rHdUQ1Jz7bBR/EsIJCbfpNiIyNqZv7FSi690=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C38BAF8059F; Fri, 15 Mar 2024 20:50:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 567E6F8058C;
	Fri, 15 Mar 2024 20:50:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7385BF8028D; Fri, 15 Mar 2024 20:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B0B9F8014B
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 20:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0B9F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710532237300453424-webhooks-bot@alsa-project.org>
References: <1710532237300453424-webhooks-bot@alsa-project.org>
Subject: Linux 6.9 pre-rc1 might have broken UCM matching for USB devices
Message-Id: <20240315195039.7385BF8028D@alsa1.perex.cz>
Date: Fri, 15 Mar 2024 20:50:39 +0100 (CET)
Message-ID-Hash: KDPMY24TVG4BLZ53ZFVNKV7ZEHPWUA7Z
X-Message-ID-Hash: KDPMY24TVG4BLZ53ZFVNKV7ZEHPWUA7Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDPMY24TVG4BLZ53ZFVNKV7ZEHPWUA7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #404 was edited from pinkflames:

While testing Torvalds' master branch of Linux which will become 6.9-rc1 eventually, I have stumbled upon PipeWire/WirePlumber apparently no longer applying the UCM profile for my USB connected on-board audio controller. Git bisection leads to the following commit: torvalds/linux@1601cd53c7e3197181277326dbfc131d20a74e46 . It's possible that I'm wrong in concluding that the issue is UCM no longer applying/matching but that's my best guess looking at seemingly ACP named devices and the lack of any `ucm` strings in the output of pw-dump, when the regression is present.

Since this is likely a kernel regression, I'll be reporting that to the [kernel bugzilla](https://bugzilla.kernel.org/show_bug.cgi?id=218605), too, but I thought alsa-ucm-conf might be interested in this change as well.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/404
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
