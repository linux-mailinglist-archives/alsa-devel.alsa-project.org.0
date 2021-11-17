Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D76B4542D2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 09:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D8971865;
	Wed, 17 Nov 2021 09:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D8971865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637138471;
	bh=aJJ7YOvJL2qOF1/l7IER9EwujId4JWVBiEv1r4/swZk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuMeZb+WvrGyHJMvXXRC2s1ySBXFifdAQJRENelB+RIYPLtdSR5TLshmnk9Yl5MRb
	 rFHuv7i29/nkP3Ts4Pt/PMfHeMAT+LjARcSmYYkncRvFFBxKIIoO9KDN7xlbR0LaDZ
	 aYo+edSwKBZf4ItBcViv8hXArICtolDnCGtcO3n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C941F800FA;
	Wed, 17 Nov 2021 09:40:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 665F6F8028B; Wed, 17 Nov 2021 09:40:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 10A91F800FA
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 09:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10A91F800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1637138410372616053-webhooks-bot@alsa-project.org>
References: <1637138410372616053-webhooks-bot@alsa-project.org>
Subject: how to get the log file of aplay
Message-Id: <20211117084018.665F6F8028B@alsa1.perex.cz>
Date: Wed, 17 Nov 2021 09:40:18 +0100 (CET)
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

alsa-project/alsa-utils issue #119 was opened from MT-LeiZhao:

Hi guys, I'm a new guy for audio driver. I have added logs in my ko which have the pcm function. I can see the normal call stack log using pulseaudio. But I can't see any log about my driver through aplay. I guess there was something wrong in aplay. Can anyone tell me how to get the detail log for aplay? Thank you very much~~~

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/119
Repository URL: https://github.com/alsa-project/alsa-utils
