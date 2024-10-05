Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D269918C9
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2024 19:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A79B6C0;
	Sat,  5 Oct 2024 19:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A79B6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728148653;
	bh=vhj9MOABsRE8ils/ayY9gzvv8zwEZBYCWRpLoBppeSE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ROZuCuSrAqM8EfweJ7xyDUPHpGq93E8W7+IQPrSIWnH0Wm0zQ/z2Nzj2anILcINek
	 2eOeQ5rsJOEbGWnfXUBXmaKjvNPIGYedGOxWPRUWcXM9fpIvqNGYqLzWJ4x1Pt+xRW
	 rPuC1v7GEXYxOz9yHt42TnQUxExQglGIM46wWu28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5D03F805D9; Sat,  5 Oct 2024 19:16:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF72DF805D2;
	Sat,  5 Oct 2024 19:16:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E64E9F80517; Sat,  5 Oct 2024 19:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB0AF80107
	for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2024 19:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB0AF80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1728148602516739845-webhooks-bot@alsa-project.org>
References: <1728148602516739845-webhooks-bot@alsa-project.org>
Subject: Ubuntu 24.04 microphone is not working  USB-Audio: ALC4080  Z-590E
Message-Id: <20241005171643.E64E9F80517@alsa1.perex.cz>
Date: Sat,  5 Oct 2024 19:16:43 +0200 (CEST)
Message-ID-Hash: QINHCOJHK3RSA26OSGKRJAU4OAJOCIPG
X-Message-ID-Hash: QINHCOJHK3RSA26OSGKRJAU4OAJOCIPG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QINHCOJHK3RSA26OSGKRJAU4OAJOCIPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #447 was edited from jiutian12:

My rear microphone is not working on Ubuntu 24.04 (nor on Ubuntu 22), but it can be used normally on Windows 10. Can hear sound
After updating the master branch, the microphone still doesn't work, but the response is the same as the sound system
Initial feedback on the issue, the following is my hardware information, I am not sure if it is complete
http://alsa-project.org/db/?f=2558f03ffd8c55e18f8208a806f3e2336d9fa49c
Kernel: k6.8.0-45-generic
USB-Audio: ALC4080 
ROG STRIX Z590-E

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/447
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
