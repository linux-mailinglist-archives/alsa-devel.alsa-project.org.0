Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D52245BBA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 06:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 439811671;
	Mon, 17 Aug 2020 06:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 439811671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597639811;
	bh=a+Onadq58tpLUYQ4SDwbbEEJgzV1Sqmv8iaciV93jAU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sQBfAufC2AORleilMs2xXgwsqP0qTcsEnSfxZcDcn5iTuGVh+ul/iGKHlBqLJsKeC
	 yxFcOK46Z2sVlICxWuVv3QTcaETX3HdqdfHfPDnEe+Jr0UsAVNrTtBEzfeXN/O7XRp
	 fHXfN8XvytFy2rEz+PriBabwtICqV9EYrN8E0Gyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CB86F800EF;
	Mon, 17 Aug 2020 06:48:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8D22F80218; Mon, 17 Aug 2020 06:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 292C3F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 06:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 292C3F800EF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1597639702371547937-webhooks-bot@alsa-project.org>
References: <1597639702371547937-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Dell-WD15-Dock: make input and output volume adjustable
Message-Id: <20200817044827.D8D22F80218@alsa1.perex.cz>
Date: Mon, 17 Aug 2020 06:48:27 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #47 was opened from jason77-wang:

Recently we found the input volume is too low for some specific
headset-mic, even we adjust the input volume to max from PA, we still
can't record the sound from that headset-mic. That is because we
change the input or output volume from PA, but the mixer's volume
is not changed, only PA's soft-volume is changed.

Checking the amixer controls for this sound card, it supports
MixerElem, Volume and Switch, So adding them in the ucm.

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/47
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/47.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
