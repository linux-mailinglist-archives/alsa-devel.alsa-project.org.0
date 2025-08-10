Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA8B1FA1F
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Aug 2025 15:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11CDB601D0;
	Sun, 10 Aug 2025 15:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11CDB601D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754832429;
	bh=dpzA38ObbJaPjmxJi5T6AdAXxzPC3nYR5HYQpToJCuo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NGbibqn1v33EQ2VY0PsPYI1FgVkWquEHbrQ7ZR98jYnDiAgRNeWTQE9fyrnfTArZ7
	 6f+HVr+EhEQHhNSIAspinTp3o7yd2tHdUGK12GqXTr0rIkP+F5tXl0GcJDO8D4DFgl
	 wUhbsvNFKUoV3oj/lUhDPHNySGAx1HonFrI9xivE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBA32F805D4; Sun, 10 Aug 2025 15:26:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63776F805CA;
	Sun, 10 Aug 2025 15:26:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91167F80272; Sun, 10 Aug 2025 15:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 38399F8010B
	for <alsa-devel@alsa-project.org>; Sun, 10 Aug 2025 15:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38399F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185a6abede399400-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/601@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/601@alsa-project.org>
Subject: ucm2: Qualcomm: add Radxa Dragon Q6A
Date: Sun, 10 Aug 2025 15:26:16 +0200 (CEST)
Message-ID-Hash: YKABHRT3W5QWJNET2YSLHXNT4DVA3IUF
X-Message-ID-Hash: YKABHRT3W5QWJNET2YSLHXNT4DVA3IUF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKABHRT3W5QWJNET2YSLHXNT4DVA3IUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #601 was opened from strongtz:

This is an upcoming SBC (single board computer) based on QCS6490. Full specs:

- Headphone jack using WCD9380 codec
- Onboard DisplayPort to HDMI bridge using Radxa RA620
- MI2S0 available via the 40-Pin GPIO header (unused by default)
- AMICs using WCD9380 codec via a dedicated MIC header (unused by default)

The kernel device tree part is not yet but going to be upstreamed soon.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/601
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/601.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
