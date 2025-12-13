Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A33CBB071
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Dec 2025 15:23:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC2B60229;
	Sat, 13 Dec 2025 15:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC2B60229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765635819;
	bh=ra7rodvNamkq9AQdxL54AnKHEDBow26Ck9+ebI36YlQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mmymKrqHqfyWOa4Rv/xZgpUC2PaLqI/h+kj/cXCe8aHZrEr/oJtKBdPy+Vh8PToQE
	 XBL6a68qGsNeCCGYzYV4ofK5s6Z1caQjZr/I7ogUms1pak4yNabjrLwROsRzIDkbwf
	 Ogk2zF5yWx+6VzpNBwKSTBBoGOrc4ZvyB9w8Xppw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 611EFF805C9; Sat, 13 Dec 2025 15:23:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6137F805D8;
	Sat, 13 Dec 2025 15:23:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07001F80518; Sat, 13 Dec 2025 15:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 826AAF800E4
	for <alsa-devel@alsa-project.org>; Sat, 13 Dec 2025 15:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 826AAF800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1880cc6149512600-webhooks-bot@alsa-project.org>
In-Reply-To: <1880cc61487e2f00-webhooks-bot@alsa-project.org>
References: <1880cc61487e2f00-webhooks-bot@alsa-project.org>
Subject: tascam us 322 / 366
Date: Sat, 13 Dec 2025 15:22:54 +0100 (CET)
Message-ID-Hash: 32E2IEWBWVVHW4WLBEFVDSOX6PSECDQH
X-Message-ID-Hash: 32E2IEWBWVVHW4WLBEFVDSOX6PSECDQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32E2IEWBWVVHW4WLBEFVDSOX6PSECDQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #489 was opened from riramau:

Is it possible to add support for tascam 322 / 366 ?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/489
Repository URL: https://github.com/alsa-project/alsa-lib
