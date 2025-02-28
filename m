Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F52A4A285
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2025 20:15:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 885A3602F1;
	Fri, 28 Feb 2025 20:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 885A3602F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740770130;
	bh=YWrSdCLRsl+C+NaWcYb1y5ztsd+gqLp42yMWAadRV3g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uzmHth+BTaxPvN45/4pCs11SIoeABHLcsCa5FEu+tnnc5MKvkUFszdupt2smRH+MQ
	 OozEaVTdu/94v9XjD6/Kez3MHAMf5fgtyl3qbOjYK/fHQSPBDb9iLFtJAu7r3gllfo
	 tYnpblAqCBC0yOxSVUmYoMS29sSLnLyGe4ZWvpBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6654EF805BE; Fri, 28 Feb 2025 20:14:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5E2F805BB;
	Fri, 28 Feb 2025 20:14:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9826FF8025A; Fri, 28 Feb 2025 20:14:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC2DF800C1
	for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2025 20:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC2DF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740770075591862679-webhooks-bot@alsa-project.org>
References: <1740770075591862679-webhooks-bot@alsa-project.org>
Subject: How to clone from https://git.alsa-project.org/?
Message-Id: <20250228191444.9826FF8025A@alsa1.perex.cz>
Date: Fri, 28 Feb 2025 20:14:44 +0100 (CET)
Message-ID-Hash: 6S7VUTM35D4ABRI6C4R44XLNAEVSDT5C
X-Message-ID-Hash: 6S7VUTM35D4ABRI6C4R44XLNAEVSDT5C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6S7VUTM35D4ABRI6C4R44XLNAEVSDT5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #293 was opened from K0-RR:

`git clone https://git.alsa-project.org/?p=alsa.git` gives me fatal: repository 'https://git.alsa-project.org/?p=alsa.git/' not found

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/293
Repository URL: https://github.com/alsa-project/alsa-utils
