Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC71526E41
	for <lists+alsa-devel@lfdr.de>; Sat, 14 May 2022 06:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED8551A92;
	Sat, 14 May 2022 06:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED8551A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652503739;
	bh=1prhUuNg6atuMB/6tHISGrHK+YMipWsPubl6bQlxANk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mW+/3aZP9vSgx8brD5FvKFwRMG2Vt7GcifNFVtPuHxKQVBsCcpCbsor2Q4y7mOTWe
	 S2sZu16ZAuwJGRGzOGTDyekBbPUkq2OB510FbuYT9DhZoNT02JWAvdUnBuL+kehbjU
	 qI/QV+xQ7I1SfoyNnvfDDDmZbmep6fO8OsVaPCp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B3D4F80166;
	Sat, 14 May 2022 06:48:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B8E5F80163; Sat, 14 May 2022 06:47:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 59B61F80083
 for <alsa-devel@alsa-project.org>; Sat, 14 May 2022 06:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59B61F80083
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1652503673254090071-webhooks-bot@alsa-project.org>
References: <1652503673254090071-webhooks-bot@alsa-project.org>
Subject: Add "Pro Audio" profile for UMC204HD
Message-Id: <20220514044757.3B8E5F80163@alsa1.perex.cz>
Date: Sat, 14 May 2022 06:47:57 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #153 was opened from brndd:

Follow-up to #128 

I figured that some users might prefer to keep the channel mapping untouched from what the card defaults to when unconfigured. Providing an alternative profile like this (implementation adapted from #145) for these users seems like a good idea.

I believe PipeWire autogenerates profiles like these for unconfigured devices, so that's where the "Pro Audio" nomenclature comes from. Likely a good idea to match that since PipeWire is increasingly the default on most distributions.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/153
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/153.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
