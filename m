Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C934B02AD6
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Jul 2025 14:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9349601F1;
	Sat, 12 Jul 2025 14:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9349601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752324219;
	bh=wNZq1JmJoX0eSn/mOSUTiVZEAnpMRPxzAx0fthbwatE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EuWcR9fVj1PfI6S905GFyV9PuYVL8tUGk3q9f22ZcAzhaxJs8t8JNomlktxD5J+y0
	 oY/TyC6VFF3ipeoOWf+c80X+Mp16Ob5uiwUsYj41YMqCayV1Tvg+buYJw5ejUnbP0q
	 8KL5P9t+oyBuXU9qh6xuqTisVrDg1CfVQNJ9TnIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A651DF805C7; Sat, 12 Jul 2025 14:43:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CE62F805C6;
	Sat, 12 Jul 2025 14:43:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C5DDF80510; Sat, 12 Jul 2025 14:42:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A80F3F800F3
	for <alsa-devel@alsa-project.org>; Sat, 12 Jul 2025 14:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A80F3F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1851818de0198900-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-gobject/pr/85@alsa-project.org>
References: <alsa-project/alsa-gobject/pr/85@alsa-project.org>
Subject: timer/seq: fix minor issues
Date: Sat, 12 Jul 2025 14:42:58 +0200 (CEST)
Message-ID-Hash: DUFIH7UCWLYFTRN4D3K6BWMYXL275XB5
X-Message-ID-Hash: DUFIH7UCWLYFTRN4D3K6BWMYXL275XB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUFIH7UCWLYFTRN4D3K6BWMYXL275XB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-gobject pull request #85 was opened from takaswie:

As long as building on Ubuntu 25.04, some codes takes warnings from gcc 14 and gi-docgen 2025.3-1. This patchset includes some fixes to solve the codes.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/85
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/85.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
