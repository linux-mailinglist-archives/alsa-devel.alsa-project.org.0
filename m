Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D82141EDC96
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 06:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3B0166C;
	Thu,  4 Jun 2020 06:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3B0166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591246434;
	bh=OuHqk0/9Td0/b5XEyOeyt4ybdKEWLmcXPtceCuH2ai0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LSQQGP8OGxS0/ZIYTLbxF3mkOwOnGjpVGz/iSRgmvahknToqgX/dYl36e8JhHZoJG
	 Dx5LacBW0I7zBshYknxYaDQEEw1r3b26s+HDlkxzg/81s4drTygiTEIJ4U5PCB/faK
	 qv4aDHoigt+TVBX+GV6YkqY8NnUkVFdZwo/MyKp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 981DAF8013C;
	Thu,  4 Jun 2020 06:52:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48836F80254; Thu,  4 Jun 2020 06:52:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 70708F8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 06:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70708F8013C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591246317915641069-webhooks-bot@alsa-project.org>
References: <1591246317915641069-webhooks-bot@alsa-project.org>
Subject: UCM file required for Multiple sound card scenario for Renoir APU
Message-Id: <20200604045209.48836F80254@alsa1.perex.cz>
Date: Thu,  4 Jun 2020 06:52:09 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #30 was opened from VijendarReddy:

We recently upstreamed PDM Driver for Renoir APU.

Renoir APU platform has Onboard DMIC + Southbridge AZ (HD Audio Endpoint) support.
When External Mic connected,  Device switching should happen from Internal DMIC to external Mic.

Need UCM file to support Multiple sound cards for Renoir APU. 

Alsa info link:  https://pastebin.ubuntu.com/p/4kprhDZYbg/

Created Ticket based on discussion on the below-mentioned thread.
https://www.alsa-project.org/pipermail/alsa-devel/2020-June/168527.html

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/30
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
