Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B73FC215
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 07:14:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030191738;
	Tue, 31 Aug 2021 07:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030191738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630386874;
	bh=BHcH9gQLWBTmuRmksjY4kt28rFbdf57/0Ohm+htT8Cw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a9yAMZPctvVnLPzprRj9jk+PIgYRhbfubuVtWhPTAv4t5cZ/mpVx3/8ShxDu89P98
	 hsHx7HCLnL9EgFOihDO4XmB5qLs5YO/6Wr1KoEbdUvyCXropUfAeMaq0a+hMkeGCSP
	 GeWBazRPo47KTv+H6cQOG8Q1TZSz8rPmedRRcDig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E61DF800BE;
	Tue, 31 Aug 2021 07:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC91F8025B; Tue, 31 Aug 2021 07:13:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D5E25F800BE
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 07:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E25F800BE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630386782500263929-webhooks-bot@alsa-project.org>
References: <1630386782500263929-webhooks-bot@alsa-project.org>
Subject: Typo in alsamixer(1) manpage
Message-Id: <20210831051313.CCC91F8025B@alsa1.perex.cz>
Date: Tue, 31 Aug 2021 07:13:13 +0200 (CEST)
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

alsa-project/alsa-utils issue #110 was opened from climbTheStairs:

In the second paragraph of the "MIXER VIEWS" section, it says...

> The currently selected item is drawn in red and/of emphasized.

...when it should say...

> The currently selected item is drawn in red **and/or** emphasized.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/110
Repository URL: https://github.com/alsa-project/alsa-utils
