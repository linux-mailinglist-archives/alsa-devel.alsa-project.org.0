Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB68A754CE
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Mar 2025 08:40:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71CE4601BE;
	Sat, 29 Mar 2025 08:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71CE4601BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743234032;
	bh=XU9djj2CzTvhf4Yzf0u+fst2rECpOxvmS/qsviUBexw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZUs9EAT1/kj7y7T8nF4XDG6jIBh1vBQbfX9g1M2EW/iNJv6QZlp/PyoO7tvRYB4rK
	 4OaIERoZVwBWdU5xM3AgBJFcJA3pLGeUAPRs0zOEayhQ31FtwfpF+3YijvuRz2uiyR
	 UNkwU4GBPfcaYr0QP0UhRIzCnnERykwKHQx+wnM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03F8BF805BA; Sat, 29 Mar 2025 08:39:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1872F805B5;
	Sat, 29 Mar 2025 08:39:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B167DF8055B; Sat, 29 Mar 2025 08:39:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 412A3F80093
	for <alsa-devel@alsa-project.org>; Sat, 29 Mar 2025 08:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 412A3F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1831361479ea5000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/33@alsa-project.org>
References: <alsa-project/alsa-tools/pr/33@alsa-project.org>
Subject: envy24control: fix file descriptor leaks in profiles
Date: Sat, 29 Mar 2025 08:39:54 +0100 (CET)
Message-ID-Hash: 2Y3YFF4EENM3ZWGRYI6EUDLEHWGAAJZW
X-Message-ID-Hash: 2Y3YFF4EENM3ZWGRYI6EUDLEHWGAAJZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Y3YFF4EENM3ZWGRYI6EUDLEHWGAAJZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #33 was opened from andreas56:

File descriptors were leaked when "Save active profile" was pressed. Add the missing calls to close.

Request URL   : https://github.com/alsa-project/alsa-tools/pull/33
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/33.patch
Repository URL: https://github.com/alsa-project/alsa-tools
