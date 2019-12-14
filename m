Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 627CF11F357
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Dec 2019 19:01:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7F51672;
	Sat, 14 Dec 2019 19:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7F51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576346498;
	bh=1B990LLUk20DwS54IARQh4pSQ5rp+acoal8s+bdaWU8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A0ANJCQIWmsIVV4Loe9STelds9LC7+J1mnX25vA5tEHBK9ssxiZO9l4ezrNHdFBlT
	 oiPXPhjOHC508iUu6arLY4NaggtMkd6LRZ0liHUlAjK0daKjyop2RNpZfr4Wr6J2YS
	 oMzYCNX1ACVYwbQi0jV0AiMmNzDf+CZjaoP/NWxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 081ABF8022D;
	Sat, 14 Dec 2019 18:59:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0375F8020C; Sat, 14 Dec 2019 18:59:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D874FF8014F
 for <alsa-devel@alsa-project.org>; Sat, 14 Dec 2019 18:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D874FF8014F
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576346389096812010-webhooks-bot@alsa-project.org>
References: <1576346389096812010-webhooks-bot@alsa-project.org>
Message-Id: <20191214175952.A0375F8020C@alsa1.perex.cz>
Date: Sat, 14 Dec 2019 18:59:52 +0100 (CET)
Subject: [alsa-devel] Code Example for Playing Sound in the Background
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #17 was opened from leimao:

Hello,
I wrote a simple C++ player based on alsa-lib which allows me to play `wav` files. I wonder if there is any convenient way to modify my code so that I can play the the `wav` file in the background and the main program is executing something else, say, a `while` loop. I tried to use `std::thread` but I did not succeed.
Thank you very much.
Best,
Lei

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/17
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
