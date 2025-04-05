Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C02A7C864
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Apr 2025 10:59:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D448619D5;
	Sat,  5 Apr 2025 10:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D448619D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743843546;
	bh=nITMVw97HvYEabY4uDqbKNBA6TAIrtRmqpZiucfgigc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Gzd5FDIrChB8CKYMZu+SLTzyHwy2Il9wWDZIzOtnfgOZvolbqSmVE0AcfvUiH3DIy
	 OfFSM2siXiiFTzp0h4vq1E0msNGnc4k31BtHaiLaw5h2feMJsjc7Xn95jmvaTj7ASw
	 kze1Bh8cVXg7oS1CRSxC0kjP6i+A8EiBJXPdBHxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 975AFF805C2; Sat,  5 Apr 2025 10:58:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79DDFF805BB;
	Sat,  5 Apr 2025 10:58:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72836F80171; Sat,  5 Apr 2025 10:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D43AF800B6
	for <alsa-devel@alsa-project.org>; Sat,  5 Apr 2025 10:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D43AF800B6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18336062c9cc6200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/35@alsa-project.org>
References: <alsa-project/alsa-tools/pr/35@alsa-project.org>
Subject: envy24control: port to GTK 3
Date: Sat,  5 Apr 2025 10:57:43 +0200 (CEST)
Message-ID-Hash: OV55JANTYRKUNWUTU7TPUROGDLV6IYCG
X-Message-ID-Hash: OV55JANTYRKUNWUTU7TPUROGDLV6IYCG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OV55JANTYRKUNWUTU7TPUROGDLV6IYCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #35 was opened from andreas56:

This is a port envy24control from GTK 2 to GTK 3.

Note: There is another very similar port in #27, but that one isn't quite finished. I did my port before noticing that there already was one, but I have compared them now to check that I didn't miss anything. My version has more changes, as I wanted to avoid using deprecated GTK functions. It also fixes the rendering of the level meters and optimizes it a bit so the CPU load isn't much higher than it was in GTK 2.

Note 2: the fix from #31 is included in this pull request, as it is necessary for the spin buttons to work in GTK 3.

Note 3: my other envy24control pull requests are not included here, as they are not related to GTK 3. #29 will probably cause merge conflicts with this one, but I will fix them if you decide to merge any of the pull requests.

Request URL   : https://github.com/alsa-project/alsa-tools/pull/35
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/35.patch
Repository URL: https://github.com/alsa-project/alsa-tools
