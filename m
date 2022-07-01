Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A814456397C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 21:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DC5D16BF;
	Fri,  1 Jul 2022 21:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DC5D16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656702254;
	bh=gw6rAINkls/mSPU/lWNbwJ4xsYvSt55iSfSyPsuhM0s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bc2xHgR/kLsJZSSLumCluejp1oV8VOVAZLf+g/mBHiV+IEaQekyNeQ5zEm+0shRmA
	 6baR0ZQ9dBGv5iH8s/5x3ZaKjUiZszJ2yKoe4WFr2Wc6ehCjjyIpOLG1+cIqheFdLZ
	 7wo/utt4BwPOMSF2hdOA6cyexeyD24WgpdvZB3bM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F367F80107;
	Fri,  1 Jul 2022 21:03:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A285F80155; Fri,  1 Jul 2022 21:03:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CD1F4F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD1F4F800E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656702188734353065-webhooks-bot@alsa-project.org>
References: <1656702188734353065-webhooks-bot@alsa-project.org>
Subject: python3: src/hostapi/alsa/pa_linux_alsa.c:3641:
 PaAlsaStreamComponent_BeginPolling: Assertion `ret == self->nfds' failed
Message-Id: <20220701190312.6A285F80155@alsa1.perex.cz>
Date: Fri,  1 Jul 2022 21:03:12 +0200 (CEST)
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

alsa-project/alsa-lib issue #246 was opened from stdcout42:

Getting `python3: src/hostapi/alsa/pa_linux_alsa.c:3641: PaAlsaStreamComponent_BeginPolling: Assertion `ret == self->nfds' failed` on Ubuntu 20.04 5.13.0-52-generic when trying to run in combination with pyaudio.

Interestingly enough I'm running this just fine on another Ubuntu 20.04... I've looked up this error and it seems to have been fixed some months to years ago but I don't understand why I'm getting this error on a fresh install ubuntu 20.04... Thanks in advance for any inputs...

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/246
Repository URL: https://github.com/alsa-project/alsa-lib
