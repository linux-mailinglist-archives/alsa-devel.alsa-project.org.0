Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE659335C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:38:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C83B161F;
	Mon, 15 Aug 2022 18:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C83B161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660581532;
	bh=HsYt8NhTNaIpg1N16TQIdcZH2fZng5bGgC2jNIU+YqM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjlEIA2SAaogwtnft8uL9QJYtXkXH1z1ZQofmmCZgBwjSnVRDC7egnEnY+fcEEq7c
	 MrLM7YzApHMq9aq/eBEHGLjoD0X05ikzC7BUVbP+cDTbk2kzvGWgpwMk1nbDmf23JY
	 GBaq/N4AAs2/dmxNi1PzBR8IkVt9YJ61YASEIh8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94C62F80271;
	Mon, 15 Aug 2022 18:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35428F8025A; Mon, 15 Aug 2022 18:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C8BB2F80125
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8BB2F80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660581465346544981-webhooks-bot@alsa-project.org>
References: <1660581465346544981-webhooks-bot@alsa-project.org>
Subject: trying to open ucm2/conf.d/simple-card/Unknown-UnknownProduct-.conf
 for PinePhonePro
Message-Id: <20220815163752.35428F8025A@alsa1.perex.cz>
Date: Mon, 15 Aug 2022 18:37:52 +0200 (CEST)
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

alsa-project/alsa-lib issue #260 was opened from ollieparanoid:

Hi,

we are trying to narrow down why alsa-lib tries to open `/usr/share/alsa/ucm2/conf.d/simple-card/Unknown-UnknownProduct-.conf` instead of the proper path `/usr/share/alsa/ucm2/PinePhonePro/PINE64-PinePhonePro-.conf` with custom (to-be-upstreamed to alsa-ucm-conf.git) ucm configurations we are using in postmarketOS for the PinePhonePro: https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/community/device-pine64-pinephonepro/ucm

It only happens for some users, but not for everybody. I've taken a quick look at the code but didn't see right away where the wrong path is built, `git grep UnknownProduct` gives no results.

Could somebody give us a hint where to look? I don't really have a clue how this works. Thanks!

Downstream discussion: https://gitlab.com/postmarketOS/pmaports/-/merge_requests/3356

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/260
Repository URL: https://github.com/alsa-project/alsa-lib
