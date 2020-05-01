Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E361C1E1F
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 21:57:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEDE816BA;
	Fri,  1 May 2020 21:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEDE816BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588363071;
	bh=tb3xOQ/77D7NWGWnyC0x/aUAxNDKZQH57Afo3T+uVAs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzQ04QfhMyCFHkJgxYiygbYZOif7S1pM44ggcGhK9APnvipussqU2f7aE/wj5iIsq
	 w7IMJ0sWqmjFXVfk0ogsk79yHy9/tlEpSnxsKkrBNXa+lLylgO5su+ZBYZBM3lpZq0
	 vOlcfUsuyg41/ri1gWd+/yBth15ltI23suDSTRP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B451EF800B6;
	Fri,  1 May 2020 21:56:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFF4EF8022B; Fri,  1 May 2020 21:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AEBCBF800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 21:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEBCBF800B6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1588362960282701969-webhooks-bot@alsa-project.org>
References: <1588362960282701969-webhooks-bot@alsa-project.org>
Subject: Audios '.wav' simultaneos
Message-Id: <20200501195607.CFF4EF8022B@alsa1.perex.cz>
Date: Fri,  1 May 2020 21:56:07 +0200 (CEST)
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

alsa-project/alsa-lib issue #45 was opened from CabralPro:

I would like to know how to play simultaneous audios because I am creating a piano with '.wav' files, and I cannot emit sounds simultaneously. I have this project ready in java, but I wanted to rewrite it in C ++ with alsa-lib. Thank you!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/45
Repository URL: https://github.com/alsa-project/alsa-lib
