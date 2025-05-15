Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51070AB888B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 15:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39516018B;
	Thu, 15 May 2025 15:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39516018B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747317224;
	bh=jpMSxCYkoMrSchWi8/YqHEM5k44Nanf35DSrJGgBoGg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QceePbLubW0cs1gzmda8cCnXcikR7qArXZWryClRjtK2DlIukgdteN2XqWK5StNtf
	 2jNHglo3dznHZtLT6CE3dt0imTCBKiuHF5KfIe6ylaeCRM+L1Dxm3G2LDjyeMmF5sH
	 /AOfCI09RB92z2kMEQZyeqsnV3Q8fHcoPQDtt07U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5BAFF800E2; Thu, 15 May 2025 15:53:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95AB2F80171;
	Thu, 15 May 2025 15:53:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2832F80075; Thu, 15 May 2025 15:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB75F8003C
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 15:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB75F8003C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183fb7bbfd841300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/563@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/563@alsa-project.org>
Subject: Device rename regression fixes
Date: Thu, 15 May 2025 15:53:20 +0200 (CEST)
Message-ID-Hash: PWASEK7V45XAVX4OOSXM64S2VEFNL7QA
X-Message-ID-Hash: PWASEK7V45XAVX4OOSXM64S2VEFNL7QA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWASEK7V45XAVX4OOSXM64S2VEFNL7QA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #563 was opened from jhovold:

A recent change renaming device sections introduced a name collision which broke the internal microphones on the Lenovo ThinkPad X13s. A number of jack hw mute and conflicting devices properties are now also referring to non-existing devices.

Please consider doing a bug fix release as soon as possible to address the X13s regression in v1.2.14.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/563
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/563.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
