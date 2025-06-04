Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B59EACE6A7
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 00:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD2FC601F5;
	Thu,  5 Jun 2025 00:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD2FC601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749076294;
	bh=MuIyiUuk+2J1vkpT/kVAbrMMsXb8Uhnqlq84xoiBUow=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MwDO7J1r2O2KpNmmcaxfhQjYBjQkLqxjiQSzS8dQ/hVfkIsgUN2AY78yHlftrXGgj
	 938tGlog//wGFDUMJGu9BYPkUlkgOe08XGdH1/qN7gUa/kJYFCZ53OyO+s7+TT6sux
	 MoN8IuUqx5HSr6KkEhM9Y9kVCJNB0u92gcLzFOLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCF0F805C5; Thu,  5 Jun 2025 00:31:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE0CF805B3;
	Thu,  5 Jun 2025 00:31:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E0A2F80154; Thu,  5 Jun 2025 00:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B6150F800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Jun 2025 00:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6150F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1845f79638e0b600-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/572@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/572@alsa-project.org>
Subject: USB-Audio: Changed GoXLR 'Stream Mix' channel names to match the
 latest Windows release
Date: Thu,  5 Jun 2025 00:30:57 +0200 (CEST)
Message-ID-Hash: FAUNK3UP6EUP3ZSIUUX7NMS6WDUO5IKW
X-Message-ID-Hash: FAUNK3UP6EUP3ZSIUUX7NMS6WDUO5IKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAUNK3UP6EUP3ZSIUUX7NMS6WDUO5IKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #572 was edited from FrostyCoolSlug:

This change is to match the Broadcast Mix channel names to the latest release of the GoXLR App on Windows.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/572
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/572.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
