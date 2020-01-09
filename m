Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF89136198
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 21:12:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C4C1779;
	Thu,  9 Jan 2020 21:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C4C1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578600767;
	bh=CsmY/vataxJK2iwyLcb4xhLNfLkcvUam11ccmYTewwc=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnmaJIjHuu2cC4RF74rnDoRP2WmWDPTVrnSdsS6YHuh3ONa9rO9+uH249L+unS5zI
	 D4Ije1KEAUPZsi3YbMRUn5txeBSUCxiksUyx0OMlfOWaZK7lWjcR3n545GHPj2zwxV
	 7yl6q9T9LM0v3q4eNoWQ1isNp3AWOk0ZdzyLYUDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49317F8014E;
	Thu,  9 Jan 2020 21:11:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE5A8F8015B; Thu,  9 Jan 2020 21:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3CA51F80101
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 21:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA51F80101
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1578600656513902903-webhooks-bot@alsa-project.org>
References: <1578600656513902903-webhooks-bot@alsa-project.org>
Message-Id: <20200109201059.CE5A8F8015B@alsa1.perex.cz>
Date: Thu,  9 Jan 2020 21:10:59 +0100 (CET)
Subject: [alsa-devel] CRAS UCMs V2
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

alsa-project/alsa-lib pull request #21 was opened from cujomalainey:

v2 changes
Dropped Jack* as it looks like we may need to do some renaming internally.
Dropped Gain controls as we are adjusting our definitions.
Dropped disable software volume per comments and will look at removing internally

Notes:
Per request regarding CaptureChannelMap, is it work changing the format if the current format transfers directly to alsa plugin inputs?

Apologies for the multi month delay between versions

Request URL   : https://github.com/alsa-project/alsa-lib/pull/21
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/21.patch
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
