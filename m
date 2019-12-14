Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651811F37F
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Dec 2019 19:21:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22EA6167A;
	Sat, 14 Dec 2019 19:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22EA6167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576347701;
	bh=YB3JWitVgx/g8oTZmnBrncJlXI8Gze5CtiAfJQV+ZZg=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERZkR95hfg7LJkZYJ+kO69Dy0Ij1ViHgkj1+3nVZA5+XwsGN5inw46T4F69AJl2jO
	 0j8PEm7al8liOvjkXTn0akRlnX2h6d9GeFPOXRkbWPPMh91IfET8pAlgXp27oEBNjv
	 JNIYQaT6TsHQUH7+gkUDjuaLiHoWmOI+WFXHINq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DA8F8022D;
	Sat, 14 Dec 2019 19:19:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0456F80248; Sat, 14 Dec 2019 19:19:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 27DB4F8022D
 for <alsa-devel@alsa-project.org>; Sat, 14 Dec 2019 19:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27DB4F8022D
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1576347554941273928-webhooks-bot@alsa-project.org>
References: <1576347554941273928-webhooks-bot@alsa-project.org>
Message-Id: <20191214181917.A0456F80248@alsa1.perex.cz>
Date: Sat, 14 Dec 2019 19:19:17 +0100 (CET)
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
_Edited and Updated:_
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
