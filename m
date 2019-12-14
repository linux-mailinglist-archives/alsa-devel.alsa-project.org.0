Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0E11F37E
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Dec 2019 19:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ACFA1671;
	Sat, 14 Dec 2019 19:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ACFA1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576347656;
	bh=rMGmXERq9rtE4d+veytBMho1AsUWbQkwmTKvm7i1hF0=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BW5+wq5tNSiDJjkAvoPP2eJMkWb1qdRpNQp1fVLgB4XicuK/03PGfXwpShGhFxPVn
	 u2YGi+lCwtevbprmo3/3InbD7TnWM4182Ws2rWT4mtoT8FCbIr3fISpJqJl/l8/+kZ
	 VZYZ5BHGpFN4aJkoAi6yvsVVAEyPTXMWFgulWLhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC1DBF8020C;
	Sat, 14 Dec 2019 19:19:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F308F8020C; Sat, 14 Dec 2019 19:19:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9E976F80139
 for <alsa-devel@alsa-project.org>; Sat, 14 Dec 2019 19:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E976F80139
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576347545656913996-webhooks-bot@alsa-project.org>
References: <1576347545656913996-webhooks-bot@alsa-project.org>
Message-Id: <20191214181911.4F308F8020C@alsa1.perex.cz>
Date: Sat, 14 Dec 2019 19:19:11 +0100 (CET)
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

alsa-project/alsa-lib issue #17 was edited from leimao:

Hello,
I wrote a simple C++ player based on alsa-lib which allows me to play `wav` files. I wonder if there is any convenient way to modify my code so that I can play the the `wav` file in the background and the main program is executing something else, say, a `while` loop. 
Edited and Updated:
I tried to use `std::thread` and `std::async`, I was able to play the sound in the background. I looked at the header file of alsa-lib, it seems that alsa-lib natively supports playing sound asynchronously. I wonder how I could do it easily.
Thank you very much.
Best,
Lei

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/17
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
