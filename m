Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E7A1303F5
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jan 2020 20:05:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F3F17A1;
	Sat,  4 Jan 2020 20:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F3F17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578164723;
	bh=uKRUK+c4EowscAWW4PZcpaR+uA+2JbC9KGsm1bSd7u8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSUlu/LM+zxuRSBgGGvlY9CH03+B6ZSXtoyXqdf/0rx/++/Z0xyX1HYRmtKQMyWB6
	 017kgYgRs0MBqf5r8msTzJDem/WVsm8lF1WCb102DmkGoNtGp2wppt9waW5TEXXSzo
	 hNwJwHNG1juurwkx/eri0LPVqHniPB4nRLhtbndc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31262F80269;
	Sat,  4 Jan 2020 20:03:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F18D3F80257; Sat,  4 Jan 2020 20:03:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9A10CF8020B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 20:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A10CF8020B
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1578164601400027037-webhooks-bot@alsa-project.org>
References: <1578164601400027037-webhooks-bot@alsa-project.org>
Message-Id: <20200104190323.F18D3F80257@alsa1.perex.cz>
Date: Sat,  4 Jan 2020 20:03:23 +0100 (CET)
Subject: [alsa-devel] No support for Kaby Lake DA7219 (on Chromebooks)
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

alsa-project/alsa-ucm-conf issue #11 was edited from FantasyCookie17:

I'm sorry if this is the wrong page and the bug tracking mailing list would be better, or if this is the wrong part of the ALSA project, however this seems indeed related to ALSA UCM configuration. The original issue is [here](https://github.com/GalliumOS/galliumos-distro/issues/536), however OP and developers did not seem to care or know what to do, so I wondered whether a fixed version of this could be put into the standard ALSA configuration. The support in the kernel seems to be there, at least theoretically. The firmware might be adopted into alsa-firmware, if it is actually needed.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/11
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
