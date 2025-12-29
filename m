Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 205C6CE83AA
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Dec 2025 22:38:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E8B0601F7;
	Mon, 29 Dec 2025 22:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E8B0601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767044293;
	bh=Zq1poA4gipmK4NLDLN6jUUYuLp4RlmcQZTmvPaV4Em4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WqfMLK1+gDAW90Zg+FS2MjXUYnbYLFlL3S16sAf3zDcSz8ghENKvJyiklLcdENqgM
	 iCg8agc6QV+LPfEtUrKj/wV/hHn/+9MXrKToNKkR2EMkq4e6dvO3vBW0G6mHm8mBqU
	 4qQemF6m2RxxNpBcYJqPAxKUdNDMTbTiHHbph3TM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7E1BF805D7; Mon, 29 Dec 2025 22:37:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48785F805D8;
	Mon, 29 Dec 2025 22:37:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3369F80533; Mon, 29 Dec 2025 22:37:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B03CEF80166
	for <alsa-devel@alsa-project.org>; Mon, 29 Dec 2025 22:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B03CEF80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1885cd6223fb7400-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/668@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/668@alsa-project.org>
Subject: ucm2: Qualcomm: add Asus vivobook 16 support
Date: Mon, 29 Dec 2025 22:37:32 +0100 (CET)
Message-ID-Hash: QNJ7XIARBF3Q6LCSI7SE2VF6UQPKH7KD
X-Message-ID-Hash: QNJ7XIARBF3Q6LCSI7SE2VF6UQPKH7KD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNJ7XIARBF3Q6LCSI7SE2VF6UQPKH7KD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #668 was edited from kellermanrivero:

Add support for Asus Vivobook 16 (F1607QA) with Snapdragon X1 SoC. This device topology is nearly identical to Lenovo Thinkpad T14s or Asus Vivobook S15.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/668
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/668.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
