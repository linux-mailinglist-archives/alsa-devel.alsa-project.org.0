Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F14F9E23
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 22:27:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F631705;
	Fri,  8 Apr 2022 22:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F631705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649449639;
	bh=cgTMZNWvartmQPZnLr0XncOff9dbKYaMaSaZGsHN8Lk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LiF4TjOpDemE9kyEpjd4elgbSQ8njSvVHEJ4twXFXdASCLzzPnNwzXoIOiuOQnkzz
	 hIK1aFjDLkxHtxh51Nmp7FpKbTTq5d8jJJxWHdwF4oH3Z/5g1IJTy6WOIEbGI+sQJY
	 m3kggxlOD13R6JTme/LZgvZNxjXhB38BdcXyg1ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62068F80054;
	Fri,  8 Apr 2022 22:26:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB73CF8014E; Fri,  8 Apr 2022 22:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 94B20F80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 22:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B20F80128
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1649449570247313976-webhooks-bot@alsa-project.org>
References: <1649449570247313976-webhooks-bot@alsa-project.org>
Subject: WIP: Add Use Case for Arturia Minifuse 2
Message-Id: <20220408202617.CB73CF8014E@alsa1.perex.cz>
Date: Fri,  8 Apr 2022 22:26:17 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #145 was edited from nodens:

Arturia Minifuse 2
(https://www.arturia.com/products/audio/minifuse/minifuse2)
is an USB audio interface with 2 mono inputs and 2 channel outputs.
It uses 1 subinterface with 4 capture and 4 playback channels:
Capture channels:
- Mic/Line/Inst 1 (Mono)
- Mic/Line/Inst 2 (Mono)
- Loopback (Stereo, L+R)

Playback:
- Main (Stereo, L+R)
- Loopback (L+R)

The Loopback capture and playback are intended to ease recording sound
from the computer, e.g if you're doing a podcast and want to record
something that plays from the computer. Of course us linux user don't
need that, since we have many tools able to do that.

However, without a dedicated use case, alsa treats the channels as
surround 4.0, which make the card difficult to use.

At this stage, no controls are available.

TODO/FIXMEs:
- add a channel map override on the pcm device ?

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/145
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/145.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
