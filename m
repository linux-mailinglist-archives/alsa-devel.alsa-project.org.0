Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B51A5B9A
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 01:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F24D16BD;
	Sun, 12 Apr 2020 01:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F24D16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586649407;
	bh=1n+ItEYqtgO06mlhNpUSk/fglDuXpggIxONUDzNsigc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZK31wSj2A4VILKWLqo9kDOXB/F1+8pnNu9NKMjkhe5FjuOUPKz+T8ZlMRN/ulMqjz
	 6dMarTVjnsChfDsWVuHp2SD7L074lUOwnUx7YOdEDpJJBfPbIZJOWKWGKXerx7gPFq
	 +IgmMyG4TPriygkH3FXuYLuuhCkwSjGEB51tRKLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77204F800B9;
	Sun, 12 Apr 2020 01:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCB28F801DA; Sun, 12 Apr 2020 01:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BBE84F8007E
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 01:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE84F8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1586649300028500080-webhooks-bot@alsa-project.org>
References: <1586649300028500080-webhooks-bot@alsa-project.org>
Subject: snd_pcm_drain() infinite loop
Message-Id: <20200411235503.CCB28F801DA@alsa1.perex.cz>
Date: Sun, 12 Apr 2020 01:55:03 +0200 (CEST)
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

alsa-project/alsa-lib issue #41 was edited from sylware:

In a non-blocking dmix-ed plugin pipeline (see below), playing audio from a 44100Hz source to a running 48000Hz hardware pcm, will go into an -EAGAIN infinite loop in snd_pcm_drain().
I did a bit of tracing and it seems snd_pcm_drain() will always return -EAGAIN because in pcm_dmix.c:snd_pcm_dmix_sync_ptr0, avail  is never >= pcm->stop_threshold

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/41
Repository URL: https://github.com/alsa-project/alsa-lib
