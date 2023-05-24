Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE95D70EF6A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 09:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D7C11E8;
	Wed, 24 May 2023 09:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D7C11E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684913437;
	bh=EFonjWLZe4T9ALKbn/e7Pa3SoYcl5LPMz9pzDTmCeig=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HZ2q6Vm/co8GMqfXuneaifirqstvKf8p0CWUkwZ932q1I8VCQcf8t/OUZYJF+Ql3p
	 Rio1VyiQzXR1bjBRqVyN8psy7ILSK+T5dDdjdwoQcE8hQ/fUzIo2HNV6jVH/rVX9zy
	 24ILHeIU1KzqRjyvD7Gd8yYd+M/F6Cw4YGCDzShw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A83D9F80549; Wed, 24 May 2023 09:29:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B1D5F80249;
	Wed, 24 May 2023 09:29:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD2D1F8024E; Wed, 24 May 2023 09:29:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 720CAF80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 09:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720CAF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684913378855393648-webhooks-bot@alsa-project.org>
References: <1684913378855393648-webhooks-bot@alsa-project.org>
Subject: ucm2: Rockchip: Add UCM support for ES8316 on Rock 5B
Message-Id: <20230524072941.DD2D1F8024E@alsa1.perex.cz>
Date: Wed, 24 May 2023 09:29:41 +0200 (CEST)
Message-ID-Hash: 4OMW7F3YQZM3SQT4UZDASDKTSQ35DWXX
X-Message-ID-Hash: 4OMW7F3YQZM3SQT4UZDASDKTSQ35DWXX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OMW7F3YQZM3SQT4UZDASDKTSQ35DWXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #316 was opened from cristicc:

Add UCM configuration for the RK3588 SoC based Rock 5B board to enable the analog audio support provided by the Everest Semi ES8316 codec.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/316
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/316.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
