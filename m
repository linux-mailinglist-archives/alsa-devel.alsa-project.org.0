Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37678CBC8F8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Dec 2025 06:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B7260224;
	Mon, 15 Dec 2025 06:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B7260224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765776428;
	bh=Mxy9zzDVss9RFm4KFhUaHvZm7V0RlOF+BJtBmTfXC4w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XaHnxJ4fE/CHCFETj59HfjJGcmbSnKuO0W7gyEU95aKbQpmi0c0f+6YG8PvdpeEX7
	 Ti5c05TRL4FY5tsDKbHqATiegURBGeDQyGS1cY6NXErU1KQ3OQBhe4RfGC6KNWTWcP
	 r4nujd0+z3Bky7t36eRe6j6AfwrZnnao9J2StQ9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE5B3F805D5; Mon, 15 Dec 2025 06:26:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57BEDF805D7;
	Mon, 15 Dec 2025 06:26:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00019F80169; Mon, 15 Dec 2025 06:26:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A84EF800BA
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 06:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A84EF800BA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18814c4308119100-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/660@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/660@alsa-project.org>
Subject: Add conditional channel count on Scarlett 18i20 version
Date: Mon, 15 Dec 2025 06:26:23 +0100 (CET)
Message-ID-Hash: IKD34QXMBWSMPE6U6LZC5V2EI3BGMQ3P
X-Message-ID-Hash: IKD34QXMBWSMPE6U6LZC5V2EI3BGMQ3P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKD34QXMBWSMPE6U6LZC5V2EI3BGMQ3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #660 was opened from dathegreat:

Resolves #559

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/660
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/660.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
