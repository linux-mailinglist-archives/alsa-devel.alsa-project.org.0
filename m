Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE5B3284
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 01:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98262166C;
	Mon, 16 Sep 2019 01:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98262166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568588537;
	bh=utbUM5luzx0WA/YICofJ7bGIOodm51/DZMHgg05hnt8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9Np6+xIiKbc2oKWlgXe3Hv69CJHan2k+qaamtGQ+VQuuzBtU92m6tKXTG3rhk5DA
	 IlXN9qTf65LPmwqxdSUhoL+udzkr1EAaz52cMfhg3i8r7tJdFJyj4TyPbkRStcA1T3
	 S+LqUkmNJgX5RtcOUUq7RqtGaLZDS9zr6JF2Eqlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F591F80307;
	Mon, 16 Sep 2019 01:00:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CD91F80361; Mon, 16 Sep 2019 01:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C82B4F802DF
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 01:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82B4F802DF
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1568588425812326908-webhooks-bot@alsa-project.org>
References: <1568588425812326908-webhooks-bot@alsa-project.org>
Message-Id: <20190915230030.0CD91F80361@alsa1.perex.cz>
Date: Mon, 16 Sep 2019 01:00:30 +0200 (CEST)
Subject: [alsa-devel] fix memory leak in snd_pcm_set_chmap
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib pull request #11 was opened from conradjones:

memory leak in snd_pcm_set_chmap :

memory is allocated in the function pointed at by : pcm->ops->get_chmap 

called in: snd_pcm_chmap_t *snd_pcm_get_chmap(snd_pcm_t *pcm)

Request URL   : https://github.com/alsa-project/alsa-lib/pull/11
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/11.patch
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
