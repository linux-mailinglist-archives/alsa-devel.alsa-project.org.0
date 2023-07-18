Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 675B8757DA4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 15:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15F21DF;
	Tue, 18 Jul 2023 15:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15F21DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689687025;
	bh=z8ya5br1+CW5NfNyF2ATJ/rpXEOQIuxPP4f6zXr11ZE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DUHhX6YdZon30oqm9u1c27pOKnCSbaX1gEAt+BdykwZ8ZlpRWRQJpoX51hb74xYd4
	 EC9G/13OIFzpZmEmxLp3YipAYo5om6MAMFstQjY3lv8xpkRHBd8mQ1HP2yjlZPazei
	 2Tpzgq1lvuU4xyXDrEQW3U5ScaUo6RAalWtI3ruY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B5EBF80549; Tue, 18 Jul 2023 15:29:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB7F7F8027B;
	Tue, 18 Jul 2023 15:29:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CF8EF8032D; Tue, 18 Jul 2023 15:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DEDCEF80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 15:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEDCEF80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689686960191447973-webhooks-bot@alsa-project.org>
References: <1689686960191447973-webhooks-bot@alsa-project.org>
Subject: X13s volume fixes
Message-Id: <20230718132928.3CF8EF8032D@alsa1.perex.cz>
Date: Tue, 18 Jul 2023 15:29:28 +0200 (CEST)
Message-ID-Hash: YRZSYXBQOJ6MA4WAQNNJW7OJ5KAGOTF5
X-Message-ID-Hash: YRZSYXBQOJ6MA4WAQNNJW7OJ5KAGOTF5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRZSYXBQOJ6MA4WAQNNJW7OJ5KAGOTF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #335 was opened from Srinivas-Kandagatla:

This patchset fixes some of the Volume issues that are seen on X13s, most of the existing ucm was controlling Digital Gains instead of Analog Gains. With this patchset the volume on both speakers are much better and not saturated.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/335
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/335.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
