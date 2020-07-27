Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840822E576
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 07:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A181699;
	Mon, 27 Jul 2020 07:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A181699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595828316;
	bh=MLNbo+jd3sfgC6TZZV9Lr2HAblnczGxtFPXBw442k5Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+FLaPldapnwOW0midBOjzjobgFFgr2F5Blrg8oUspvpuyqIeXubFMCce3ONX1vJQ
	 skB8GOzWQIzBKjy/b2cidXI9lX0uLv/p9gGoBblc6+mn9WcICq3h21B9At1ZtYH05i
	 wmSc0OFHnOJJWKFQZP/Sz3CKw8sfUa0tTDksXfP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE9BF80158;
	Mon, 27 Jul 2020 07:36:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BE31F80171; Mon, 27 Jul 2020 07:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 08E92F800AD
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 07:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E92F800AD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595828201982930899-webhooks-bot@alsa-project.org>
References: <1595828201982930899-webhooks-bot@alsa-project.org>
Subject: No sound with Realtek ALC287
Message-Id: <20200727053653.9BE31F80171@alsa1.perex.cz>
Date: Mon, 27 Jul 2020 07:36:53 +0200 (CEST)
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

alsa-project/alsa-lib issue #76 was opened from BLuFeNiX:

I get no sound via the speakers of my Lenovo Legion 7i laptop, which alsamixer tells me is using a Realtek ALC287.

Here is my alsa-info.sh output: http://alsa-project.org/db/?f=4272343a3590cc08f192f98113dedfc0418afe52

I made sure to disable Auto-Mute in alsamixer, and turn all volume levels to maximum. In all cases, I get no sounds from the speakers (running speaker-test, playing music, etc.). I *am* able to get sound via headphones and HDMI (though I believe HDMI is via a different sound card).

I previously reported this here: https://bugzilla.kernel.org/show_bug.cgi?id=208555
but I received no response in almost 3 weeks, so I think maybe I have reported it to the wrong place.

Please let me know if I can provide any assistance or additional information.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/76
Repository URL: https://github.com/alsa-project/alsa-lib
