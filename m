Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2D3C987F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 07:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B0CD168B;
	Thu, 15 Jul 2021 07:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B0CD168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626327338;
	bh=anggAd6nROv+xxCDR3DZ4oxGYu+5MiOImAeEb9kRMx8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H0K1a9cW1kWU1vprmeR4O5SLtoQ/J+3LGGVaTOwbybhK0WgNGq+HOb/siBB4+ygnA
	 2tn17xpDY3RT+T4r9oMMAQ7nugTMaoPigxDTvqwSC+jZddQ/XqXLHeWFHqV7tG/AWM
	 qBDHNfnw4z8CNif5Tk7ozoWbFOBKKkA6hqunRE7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19BE4F80229;
	Thu, 15 Jul 2021 07:34:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A5ECF80430; Thu, 15 Jul 2021 07:34:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C1A40F80229
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A40F80229
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1626327254536343098-webhooks-bot@alsa-project.org>
References: <1626327254536343098-webhooks-bot@alsa-project.org>
Subject: How can turn on auto-mute mode in alsa ?
Message-Id: <20210715053421.0A5ECF80430@alsa1.perex.cz>
Date: Thu, 15 Jul 2021 07:34:21 +0200 (CEST)
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

alsa-project/alsa-lib issue #164 was edited from yufeiluo:

My alsa-utils version:


    aplay --version
    aplay: version 1.1.8 by Jaroslav Kysela <perex@perex.cz>



No auto-mute option in alsamixer gui menu.
[https://www.dropbox.com/s/ie6meqto1t1rv9g/alsamixer.png?dl=0](url)


    debian@debian:~$ amixer -c 0 sset 'Auto-Mute Mode' Enabled
    amixer: Unable to find simple control 'Auto-Mute Mode',0

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/164
Repository URL: https://github.com/alsa-project/alsa-lib
