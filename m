Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2407767D1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 21:02:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B8A3828;
	Wed,  9 Aug 2023 21:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B8A3828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691607752;
	bh=W2X6/PIdOv+0vJJmS+kXVlE/f02MwPuRQK2SPN7rxrU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=owR0qhK3H2LdtnFpRnDUYnLwXvZw1EFKuDHhHifv9Jmbh0vlIL3bP+IcMLMkDwkir
	 qv5Z53/4Zi85NRwUQzdtfPFiCZJWdTuKnt4eLf7+NqDRapOul1mnXcBLW0URdE5s49
	 ZOZV6tG7braJo7rLndB/5CS0OKnIw24Fgwn+H5iM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D8D0F800F4; Wed,  9 Aug 2023 21:01:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 756D7F80116;
	Wed,  9 Aug 2023 21:01:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74C4AF80134; Wed,  9 Aug 2023 21:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E7983F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 21:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7983F800FB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1691607665123911142-webhooks-bot@alsa-project.org>
References: <1691607665123911142-webhooks-bot@alsa-project.org>
Subject: Question: license compliance for libatopology 2.0.0
Message-Id: <20230809190115.74C4AF80134@alsa1.perex.cz>
Date: Wed,  9 Aug 2023 21:01:15 +0200 (CEST)
Message-ID-Hash: BF5JUBVFQPP4GVSCEG4U7AKZHM2VF37D
X-Message-ID-Hash: BF5JUBVFQPP4GVSCEG4U7AKZHM2VF37D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BF5JUBVFQPP4GVSCEG4U7AKZHM2VF37D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #343 was opened from lucasgonze:

Given a binary linked with libatopology 2.0.0, and given that the LGPL requires source code to be bundled, it is unclear how to find the corresponding repo and tag (or release).

Thanks in advance for tips.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/343
Repository URL: https://github.com/alsa-project/alsa-lib
