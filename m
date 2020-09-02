Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2BC25AFF7
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 17:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23FA180A;
	Wed,  2 Sep 2020 17:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23FA180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599061677;
	bh=dqFQxWQZ9K+Wa2IkFKbgOPS7hxgJ+4cxO6ncz6iQllA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ptymmxogo8OsuqFdO8Dl2VMB1QwUwLHkTRvLrqxmA7vVPrJP7vptqR+TMRsziqq3Q
	 wYGogXcqeBrg+um0+q0wlwkQCTkc432pTI53JKTx9IjoNZMTKM20p+1Mu4XJV1Eggb
	 np9f8523wnIWZWJRt1SakAMNTJCAG53BW1RM6F4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDBC5F800F3;
	Wed,  2 Sep 2020 17:46:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEDB4F800BA; Wed,  2 Sep 2020 17:46:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1CA62F800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 17:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA62F800BA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1599061587493776083-webhooks-bot@alsa-project.org>
References: <1599061587493776083-webhooks-bot@alsa-project.org>
Subject: Miss mapping to unmute the middle speakers for Creative X-Fi with 20K1
 chipset cards in analog-output.conf
Message-Id: <20200902154631.AEDB4F800BA@alsa1.perex.cz>
Date: Wed,  2 Sep 2020 17:46:31 +0200 (CEST)
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

alsa-project/alsa-utils issue #54 was opened from deathxxx123:

Hi there. I want to report some bug, that is present from long time and i think that can be fixed now.
With any configuration that uses center/subwoofer, that center gets muted by default with Creative X-Fi with 20K1 cards, but if you have other card, that will not happen, because of missing mapping in `analog-output.conf`.
The missing thing in `analog-output.conf` is:
```
[Element Center/LFE]
switch = mute
volume = merge
override-map.1 = center,lfe
```
You can see my issue and fix there:
https://github.com/gamer-os/gamer-os/issues/131

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/54
Repository URL: https://github.com/alsa-project/alsa-utils
