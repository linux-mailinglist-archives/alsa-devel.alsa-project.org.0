Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625224F0BB2
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 20:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F301725;
	Sun,  3 Apr 2022 20:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F301725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649009392;
	bh=73GpMVfMtcOmuj5EPvKeXGaLdzBcSWiO/apff1Z89Jg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvGpBvL2pm1ECDL9TMGvWC+AE9aj1AGH5Rhm+dMZERm6Kz7Go5QR0XrvAP0ZXY0v8
	 yyRnx7Qs18SU7OHtAZxAMRNgWId0K7CjubXekJuISHpkF3kCOxCu2XQk5MqaY7O48M
	 wu2i2l83RafUjuqjp2H9PiUO1cFAQe0Pbvchziis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D32FEF8028B;
	Sun,  3 Apr 2022 20:08:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87C3BF80248; Sun,  3 Apr 2022 20:08:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 409CAF8012A
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 20:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409CAF8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1649009314323633909-webhooks-bot@alsa-project.org>
References: <1649009314323633909-webhooks-bot@alsa-project.org>
Subject: Add Use Case for Arturia Minifuse 2
Message-Id: <20220403180841.87C3BF80248@alsa1.perex.cz>
Date: Sun,  3 Apr 2022 20:08:41 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #145 was opened from nodens:

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
