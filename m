Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78B57ED707
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 23:07:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D882B84B;
	Wed, 15 Nov 2023 23:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D882B84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700086027;
	bh=59ih2D186WE9EmyIxAXGS8CN2MnpC1hf/e/e+6LYlfs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VqotKsFvkSTffkEivWSV5HrRFGmx1CbYJce/4BxRl4B6OGAofRYHndYtshAAgsq0z
	 Zs8162yczrY2Gd9nkhLjcUEr9c8b/Umyo8nbC28dC3MtyDBI/ihvEItV8qfjeBf9QX
	 w/rSY6nWM47urYDGT9R/J5scRQexeTwadjcUNp+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53988F80549; Wed, 15 Nov 2023 23:06:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB73F8016E;
	Wed, 15 Nov 2023 23:06:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5788EF801D5; Wed, 15 Nov 2023 23:06:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D7339F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 23:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7339F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700085971594475985-webhooks-bot@alsa-project.org>
References: <1700085971594475985-webhooks-bot@alsa-project.org>
Subject: aserver: fix buffer overwriting
Message-Id: <20231115220613.5788EF801D5@alsa1.perex.cz>
Date: Wed, 15 Nov 2023 23:06:13 +0100 (CET)
Message-ID-Hash: 2H6MMWOOCPAOEWWYFYN2SOCZL4GZWUC5
X-Message-ID-Hash: 2H6MMWOOCPAOEWWYFYN2SOCZL4GZWUC5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2H6MMWOOCPAOEWWYFYN2SOCZL4GZWUC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #364 was opened from szsam:

name array should allocate space for the null terminator. Also, need to check if client->name has enough space for strcpy.

I suggest assigning a CVE for this buffer overflow vulnerability.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/364
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/364.patch
Repository URL: https://github.com/alsa-project/alsa-lib
