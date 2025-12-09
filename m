Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F1CB0023
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836D7601F4;
	Tue,  9 Dec 2025 14:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836D7601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765285504;
	bh=L7JCKyqrGTzOon7YBU5bRmd9WjFXPVjbw3Liv/D08j8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YXxTb+lYl2b3frSfeUNVKYROezJlIBycXgD88uTQYpVAss9bFruKafdeKDqHeC6i9
	 huCJZ2VGYhV9c+yAFfjQIKN1xwgTDGf0yzeG1J1glFnA9iawLOwTn+D6Tod2N0Xbty
	 9nmFzzz7pdPdHwX7x9NT/KeWpAwAlt34fA/lN5DQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F16DF805D2; Tue,  9 Dec 2025 14:04:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F240F80538;
	Tue,  9 Dec 2025 14:04:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED3AAF8028B; Tue,  9 Dec 2025 14:03:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4954EF80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Dec 2025 14:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4954EF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187f8dbfb5bdca00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/658@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/658@alsa-project.org>
Subject: sof-soundwire: third fix for multi-codec
Date: Tue,  9 Dec 2025 14:03:55 +0100 (CET)
Message-ID-Hash: OMJGPKIHFWVNHE3SKDUDGP4HSU4UO27A
X-Message-ID-Hash: OMJGPKIHFWVNHE3SKDUDGP4HSU4UO27A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMJGPKIHFWVNHE3SKDUDGP4HSU4UO27A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #658 was opened from mstrozek:

Ensure MultiCodec-based actions are only done when MultiCodec1 is not empty, otherwise Speaker/Mic/HeadsetCodec1 vars can be cleared without reason and prevent other devices from being recognized.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/658
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/658.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
