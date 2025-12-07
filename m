Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4BECAB338
	for <lists+alsa-devel@lfdr.de>; Sun, 07 Dec 2025 10:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7877960218;
	Sun,  7 Dec 2025 10:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7877960218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765100226;
	bh=ZoJcqCDd1DLyp8Veu7+tK+NXwK68fpkjRT+3yKSv540=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=AhIFRE/jlzGiYkJViWK+aC0MMznyurBGrYhpaQTNfTOCBuPmgEyTTyvzYJUj1Et5q
	 ekJEThbd6XMHvWJkZRxgo5wnL/RP1g2UUzyJU9x91YrW8Vw1EhyZitzwaW55zP26iG
	 UyOrDy7bMzqRzacGFEyc1WFH7k92+OK3mBg7Da5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 453B9F805D4; Sun,  7 Dec 2025 10:36:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01043F805E4;
	Sun,  7 Dec 2025 10:36:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBE5BF80494; Sun,  7 Dec 2025 10:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B488F8003C
	for <alsa-devel@alsa-project.org>; Sun,  7 Dec 2025 10:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B488F8003C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187ee54243045b00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/554@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/554@alsa-project.org>
Subject: [for alsa-lib 1.2.15] USB-Audio: Steinberg UR22C - fix capture
 channels for older firmware
Date: Sun,  7 Dec 2025 10:36:18 +0100 (CET)
Message-ID-Hash: J3DOFPR6ECRC7RY4VKRWSLNYFT6ZM3VZ
X-Message-ID-Hash: J3DOFPR6ECRC7RY4VKRWSLNYFT6ZM3VZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3DOFPR6ECRC7RY4VKRWSLNYFT6ZM3VZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #554 was edited from perexg:

It seems that firmware version 3.20 added 4 capture channels while previous firmware has only 2 capture channels.

Fixes: https://github.com/alsa-project/alsa-ucm-conf/issues/547

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/554
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/554.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
