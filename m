Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC049E481
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 15:20:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D5A18E9;
	Thu, 27 Jan 2022 15:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D5A18E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643293236;
	bh=seU76zqPbbwUt4gO8D6l1M+Pj+2pENmNavWKWpV5zAs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiBhQo9V4IA7Oh7gG8Qv2vDk9rC9ajHTYfuuvruk7cbv6CWbjdS2fF3kPvOaPhxr1
	 VgJN7to/RPkn0n8t1Ot793+FGPdUyHfqml1ScUSSg9poe2i+ErR7b5Rg5J6dhlsl3m
	 tHCGTFAlIk/4KE+7p28X0MAE+JVCg4MxuWI52lv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DCBEF8025A;
	Thu, 27 Jan 2022 15:19:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C00AF80254; Thu, 27 Jan 2022 15:19:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4288DF800C8
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 15:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4288DF800C8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1643293168578735113-webhooks-bot@alsa-project.org>
References: <1643293168578735113-webhooks-bot@alsa-project.org>
Subject: Mouse stopped working in xterm and rxvt-unicode
Message-Id: <20220127141931.9C00AF80254@alsa1.perex.cz>
Date: Thu, 27 Jan 2022 15:19:31 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils issue #139 was opened from m-ou-se:

Since 1.2.6, I can't control alsamixer with my mouse's scroll wheel anymore in xterm and rxvt-unicode. I'm assuming it's related to this commit: https://github.com/alsa-project/alsa-utils/commit/31820c5f239fca2de12c8d1a7327ccf995188f33

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/139
Repository URL: https://github.com/alsa-project/alsa-utils
