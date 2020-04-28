Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA0F1BBFA7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 15:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BB31690;
	Tue, 28 Apr 2020 15:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BB31690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588080931;
	bh=GskfDYLo5v4/vUgj6W6OhzMEr+WnSc+Jj9KdJMUePtQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbGmDnr4aoX24qZ9FzvI3apuzyBn1of2EDzlOJfFqhX6guqHNiC2KZiyLHUtIfrxh
	 Jz+87/DCpj4yTEZpdLCtBdWJpM0Qfg6vODTiA4pRKJfHwoUyLbO2Rnz37MFPuaVpJ6
	 0Hs/plliVQTk7VvoFs24o8Usud9MuO8+EsIneKyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EC7CF8021C;
	Tue, 28 Apr 2020 15:34:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F14F801F7; Tue, 28 Apr 2020 15:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D4C03F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 15:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C03F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1588080838689686060-webhooks-bot@alsa-project.org>
References: <1588080838689686060-webhooks-bot@alsa-project.org>
Subject: documentation incomplete for *avail_min, *avail_max
Message-Id: <20200428133401.B1F14F801F7@alsa1.perex.cz>
Date: Tue, 28 Apr 2020 15:34:01 +0200 (CEST)
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

alsa-project/alsa-lib issue #44 was opened from archenemies:

The following documentation is incomplete. It doesn't explain what "avail min" or "avail max" means. It's like asking someone you just met "what is your maximum age?". We need more context for the phrase "maximum number of frames available" to be meaningful. Is it maximum allowed before frames start getting dropped? Is it the maximum that we've seen over the course of operating the device?

https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m___s_w___params.html

    snd_pcm_sw_params_get_avail_min()

        Get avail min from a software configuration container.

https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m___status.html#gac58d13e4d03c9420c57428ddffd94964

    snd_pcm_status_get_avail_max()

        Get maximum number of frames available from a PCM status container after last
        snd_pcm_status call.

        Returns
            Maximum number of frames ready to be read/written

The following is less important, but it still should be fixed. We need to explain what a "software configuration container" is. The phrase is used all over the place; it only needs to be defined once:

https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.html#ga7e082d9ea701709270b0674a0be23b09

    snd_pcm_sw_params_t

    typedef struct _snd_pcm_sw_params snd_pcm_sw_params_t

    PCM software configuration container

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/44
Repository URL: https://github.com/alsa-project/alsa-lib
