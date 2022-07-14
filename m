Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CCC57422A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:18:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03E08168B;
	Thu, 14 Jul 2022 06:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03E08168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772306;
	bh=BXXKivAaKhGYvOBzlGlkcyejhTwt3MgeDIfD9A/GLoU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCkdM4K1qg1bc9ToQVVQAENKvhxg5GIVW/RkVVtrmY8ertw/mLSttQW6dGBpufKlR
	 k0xnsuURcxO3r0eNs/xHsR91101k0qqy/SqDry7gTkAVj2QosYmsa1e93pAEhImzlU
	 BOJssJJ0zOwwbUuXfVilIu2i+ZlBgot4m+rYTed0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EFFF800AA;
	Thu, 14 Jul 2022 06:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18393F800AA; Thu, 14 Jul 2022 06:17:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D4968F800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4968F800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657772234434659958-webhooks-bot@alsa-project.org>
References: <1657772234434659958-webhooks-bot@alsa-project.org>
Subject: snd_hda_intel - HDMI missing channels / wrong mapped / no passthru
Message-Id: <20220714041723.18393F800AA@alsa1.perex.cz>
Date: Thu, 14 Jul 2022 06:17:23 +0200 (CEST)
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

alsa-project/alsa-lib issue #252 was opened from Nightwing0815:

Hey Guys,

I have since a few days trouble to get sound configured...more problems than on windows...
I ran the alsa-info.sh script, here's the output: [https://alsa-project.org/db/?f=a95b27a60a9e38120a1d3b121ff4a93d89b1ac09](https://alsa-project.org/db/?f=a95b27a60a9e38120a1d3b121ff4a93d89b1ac09)

I only want to configure the usuals:

- card1 is microphone / headset / stereo on laptop @ full duplex,
- card 0 should be HDMI stereo, HDMI digital passthru AC3 / DTS bitstreaming.

I hope, you can help me with my configuration, I'm confused.

Thanks in advance,

ToM

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/252
Repository URL: https://github.com/alsa-project/alsa-lib
