Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E19826D24
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 12:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12AF2207;
	Mon,  8 Jan 2024 12:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12AF2207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704714509;
	bh=ue3KemxopgbpK0UrnO1p7dHwtDCXGJ2Cj4brYtlgNtw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sTLuli+qWkA0xGCYrBigIGktX99U+Ts0jUBTbmyWdDdUK253h3xqIwcj8d4RKoBnB
	 No5UfQbTGeLM3lYYz+0CCPy7Evrkkz0P4Gk4+5ulbzFL3eQclQ6LINNZkOzQhzicyF
	 sKV8/lp5RTDO1+DLXzo+7QiHJmVRcAcTyApd74yE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 976E9F80587; Mon,  8 Jan 2024 12:47:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DEE2F80579;
	Mon,  8 Jan 2024 12:47:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D70F80254; Mon,  8 Jan 2024 12:47:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id F0533F80086
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 12:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0533F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704714465273882389-webhooks-bot@alsa-project.org>
References: <1704714465273882389-webhooks-bot@alsa-project.org>
Subject: Update USB-Audio.conf
Message-Id: <20240108114752.25D70F80254@alsa1.perex.cz>
Date: Mon,  8 Jan 2024 12:47:52 +0100 (CET)
Message-ID-Hash: P6K7SRWKLCSBMMHNMEZPZK7FFH2KOND4
X-Message-ID-Hash: P6K7SRWKLCSBMMHNMEZPZK7FFH2KOND4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6K7SRWKLCSBMMHNMEZPZK7FFH2KOND4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #376 was opened from MiroslavGubenko:

add MPG Z590M GAMING EDGE WIFI

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/376
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/376.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
