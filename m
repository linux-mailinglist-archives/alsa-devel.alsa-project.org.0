Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60525835B85
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 08:21:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9393E8;
	Mon, 22 Jan 2024 08:21:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9393E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705908074;
	bh=+aTPiIvQQDtq9KvpEittRuRj0O5UhG+Fi5GDJlMK06c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MyMdp1Pr3lSTej8wMN6Mv3NkwKJ2ouuRHu/+egrd/CN047Ho8JDX2yAAx1Yt7zqr1
	 mbcM+dXnt96ID6wMyPD9H6xMdbRjb2vSikyn3/eQhIO4wAd5XI9rkauWfW5/VPnu6Y
	 OVbI9PoC0WoJFpjNbkAKJk6ZeIpmm8zwfxLmmu7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95C82F80587; Mon, 22 Jan 2024 08:20:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F69F8057D;
	Mon, 22 Jan 2024 08:20:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E1E4F8025F; Mon, 22 Jan 2024 08:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F229F80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 08:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F229F80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705908004400538921-webhooks-bot@alsa-project.org>
References: <1705908004400538921-webhooks-bot@alsa-project.org>
Subject: ucm2: conf.d: mt8370-evk: Fix the type of mt8370-evk.conf
Message-Id: <20240122072013.8E1E4F8025F@alsa1.perex.cz>
Date: Mon, 22 Jan 2024 08:20:13 +0100 (CET)
Message-ID-Hash: O744LZTWE23FLRCJILNNLSLAFRJ5CZYE
X-Message-ID-Hash: O744LZTWE23FLRCJILNNLSLAFRJ5CZYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O744LZTWE23FLRCJILNNLSLAFRJ5CZYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #386 was opened from zoran055:

Fix the type of mt8370-evk.conf at /ucm2/conf.d, to let the symbolic link can correctly point to the conf.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/386
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/386.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
