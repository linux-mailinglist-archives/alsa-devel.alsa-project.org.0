Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9AB1AA34
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 22:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03E560274;
	Mon,  4 Aug 2025 22:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03E560274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754340186;
	bh=EyWLHpc0gEM6x9QnMChX731Xco0qt4R8bZflWEooJg8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BgufigRh3nzenum0MAxwwphXJ10rF+3X3yzxhsQY1WRWK3x+6x0+7yK1ogcpLUvww
	 /35Pt+CsEV7MEYxE2DjiavRX0lZsy4Tid1umXyepxfK5H1jhJLgGpepzqSvfYRwmHV
	 iZ/OFtnpCGeLPO7mMlkHQyaQ8QoEzTwQfWuo9YWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF3EEF805C9; Mon,  4 Aug 2025 22:42:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98656F805BF;
	Mon,  4 Aug 2025 22:42:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 236CEF804CF; Mon,  4 Aug 2025 22:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B6C06F800DF
	for <alsa-devel@alsa-project.org>; Mon,  4 Aug 2025 22:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C06F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1858ab0b5a590300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/599@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/599@alsa-project.org>
Subject: ucm2: Qualcomm: add Lenovo Ideapad 5 (Slim 5x / 2in1) support
Date: Mon,  4 Aug 2025 22:42:04 +0200 (CEST)
Message-ID-Hash: WZBPP5BVNHWRPOSDFBN6CNXNABDCPSJB
X-Message-ID-Hash: WZBPP5BVNHWRPOSDFBN6CNXNABDCPSJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZBPP5BVNHWRPOSDFBN6CNXNABDCPSJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #599 was opened from jglathe:

Same layout as T14s, 2 speakers, headphone jack, DMIC

Tested on Ideapad 5 2in1 14Q8X9.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/599
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/599.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
