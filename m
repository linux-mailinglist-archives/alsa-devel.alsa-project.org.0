Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF6A7F405
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Apr 2025 07:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1D963F33;
	Tue,  8 Apr 2025 07:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1D963F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744089177;
	bh=4KPqFNodYbs6QcWuHmWfncfcQ4C5H4WIPQ7cOhiNSh0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Xof7e4tf+XLr2LHB7jg6tYIbKCo41KjZmuLog14Zz6C3A9X3ffL2yBFdgMuH4toMs
	 YxoGzNtIM+lcC/BNcwtdhIynjAqbByJFyceyg+uqtp69qXfDNPtxwsyE9R5+XuiTOw
	 k9Kv3svKUAkETMkP1xAvbthl/IVKauR2F8zkkm6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C7B1F800E5; Tue,  8 Apr 2025 07:12:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 123DFF805B4;
	Tue,  8 Apr 2025 07:12:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F80EF8055B; Tue,  8 Apr 2025 07:12:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D56F80212
	for <alsa-devel@alsa-project.org>; Tue,  8 Apr 2025 07:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D56F80212
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18343fd3e2e52500-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/543@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/543@alsa-project.org>
Subject: ucm2: Qualcomm: add Lenovo ThinkBook 16 support
Date: Tue,  8 Apr 2025 07:12:17 +0200 (CEST)
Message-ID-Hash: T4G6ACCMKGE5B5NBIADAXJRZPQ2EFOWJ
X-Message-ID-Hash: T4G6ACCMKGE5B5NBIADAXJRZPQ2EFOWJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4G6ACCMKGE5B5NBIADAXJRZPQ2EFOWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #543 was opened from jglathe:

add a Regex string, seems compatible with Thinkpad T14s

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/543
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/543.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
