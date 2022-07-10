Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BB56CEE1
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Jul 2022 13:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B936A1EA;
	Sun, 10 Jul 2022 13:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B936A1EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657454090;
	bh=Pm3/p/wvvPUkho+mGDaFQwAuu7Em9DTYGytT/MCDweU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sJeCTZ6Tcq6dgWoIpo8lgshKVdRrR4JyTjtSpugg5Hp6IR6mf+Wq74PKyaNP9UYew
	 ty5/6z8VSDd+ETNreppTQY3WLFfkJficfjbExl62LQ5CB9rB1mGvKg0NJ1/fExnCVq
	 ZUs+ZiPztJoqSG9BJ3IhIaGvHmldFkY2hvGU3e18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D05AF8027D;
	Sun, 10 Jul 2022 13:53:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B47CAF80269; Sun, 10 Jul 2022 13:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D33C1F80100
 for <alsa-devel@alsa-project.org>; Sun, 10 Jul 2022 13:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D33C1F80100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657454021144638062-webhooks-bot@alsa-project.org>
References: <1657454021144638062-webhooks-bot@alsa-project.org>
Subject: MSI MAG X570S TOMAHAWK MAX WIFI - microphone + front audio panel not
 working
Message-Id: <20220710115348.B47CAF80269@alsa1.perex.cz>
Date: Sun, 10 Jul 2022 13:53:48 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #186 was opened from motomyslen:

The same issue was reported on many forums but I didn't see it reported here so I'm creating this topic for all people with this motherboard.
**Issues**
- rear mic-in/line-in not working, sound is working fine
- front panel detects devices but not sound, not mic

I tried with kernel 5.18 and pulseaudio 16.1 - nothing changed.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9078972/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/186
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
