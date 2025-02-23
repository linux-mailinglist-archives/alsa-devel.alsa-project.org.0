Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F421A4123D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2025 00:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39FD16025C;
	Mon, 24 Feb 2025 00:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39FD16025C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740352859;
	bh=Et0Q5tOeOA1OlrF9rbblSXzDzYuJY2dmdoIPQc124bY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Koamn8mhbr2Q6hcAUiWxLoCC6PAk3T+CaqYEy6g+ufMTMG+whUJXSiHCT+u+4CR6a
	 7TeltnQ7qUgTm5Dtf18D6u1OPqs88zkx91Ka8xjpo6/0mczt1uVElMF4DGTwIsQPg5
	 bKMEXGrlicNuwmKJTU6IJFb3oTWPi36DdR1tFUt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA9C4F805B4; Mon, 24 Feb 2025 00:20:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D261FF805B3;
	Mon, 24 Feb 2025 00:20:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1334BF8016E; Mon, 24 Feb 2025 00:20:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 592D4F800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2025 00:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 592D4F800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740352817830776215-webhooks-bot@alsa-project.org>
References: <1740352817830776215-webhooks-bot@alsa-project.org>
Subject: Request for Build Instructions for macOS and Ubuntu
Message-Id: <20250223232020.1334BF8016E@alsa1.perex.cz>
Date: Mon, 24 Feb 2025 00:20:20 +0100 (CET)
Message-ID-Hash: QQEVNMDB4DEWZKHMKQL5XHJYRKEZ4I2S
X-Message-ID-Hash: QQEVNMDB4DEWZKHMKQL5XHJYRKEZ4I2S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQEVNMDB4DEWZKHMKQL5XHJYRKEZ4I2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #292 was opened from sallavatsal:

Hello,

I'm having difficulty building alsa-lib on both macOS and Ubuntu. Specifically:

macOS: After running autoreconf, I get warnings and issues generating the configure script.
Ubuntu: The available libasound2-dev version seems to be older than 1.2.5, causing configuration errors.
Could you please provide official build instructions or guidance for these platforms? Also, I want to become a member of mailing list if there's any.

Thank you!

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/292
Repository URL: https://github.com/alsa-project/alsa-utils
