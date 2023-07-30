Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B476854E
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 14:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A61017F8;
	Sun, 30 Jul 2023 14:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A61017F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690721047;
	bh=kEsbsBR438oqf/SazjePCxTh8UPj3aOwMP8rYPZZIM4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ShW5PFyQllmbwT5YV3nKug5GZs0ozycuIr5V05I4YvfZbB/fkwAySCNRz6P3fU33i
	 v7GOAyUOR+YjcdlxNfZCe72Sr9Je5XzMTLWhOYHf0th3qZvLLm3V5kjbKwRTeFwvpv
	 EgHmRWKunB77mmxnAzyVWj8CakiIh65njs739w/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C1EF8025A; Sun, 30 Jul 2023 14:43:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1AB5F80163;
	Sun, 30 Jul 2023 14:43:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAFEFF8016D; Sun, 30 Jul 2023 14:43:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E50C7F80153
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 14:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E50C7F80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1690720986457345486-webhooks-bot@alsa-project.org>
References: <1690720986457345486-webhooks-bot@alsa-project.org>
Subject: Documentation cleanup
Message-Id: <20230730124310.EAFEFF8016D@alsa1.perex.cz>
Date: Sun, 30 Jul 2023 14:43:10 +0200 (CEST)
Message-ID-Hash: CQURXHTLZ462JRALU7JTAKE7E424SCVF
X-Message-ID-Hash: CQURXHTLZ462JRALU7JTAKE7E424SCVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQURXHTLZ462JRALU7JTAKE7E424SCVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #340 was opened from borine:

Fixes missing doxygen tags and macros so that now doxygen picks up all of the documentation comments and completes cleanly without any errors or warnings.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/340
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/340.patch
Repository URL: https://github.com/alsa-project/alsa-lib
