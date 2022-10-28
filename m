Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4B610E6F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:28:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D3123BC;
	Fri, 28 Oct 2022 12:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D3123BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666952908;
	bh=HUCHtGo5OqBeDHVIkKbMbdpxmHfV5BXqjHLAWCLswaM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SDB9ifWXoNy7T8Lyo6SrjIA/ElZ8MSkJpxetryZ0STaCUm/AINtsKqdUgBaeICQ9u
	 laMoDrmzrnaSNNLiBIciLRcYKUYc+Dt1bmvWEeMoY7OMftU5jFKUbu404XSR09nUtN
	 LzNkUldpeJ665FGxZ2C8B1485UxM2lDR2SvqeiKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4A5F80095;
	Fri, 28 Oct 2022 12:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4973F8025A; Fri, 28 Oct 2022 12:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A90ABF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90ABF80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666952847013259888-webhooks-bot@alsa-project.org>
References: <1666952847013259888-webhooks-bot@alsa-project.org>
Subject: alsamixer not readable in xterm
Message-Id: <20221028102733.B4973F8025A@alsa1.perex.cz>
Date: Fri, 28 Oct 2022 12:27:33 +0200 (CEST)
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

alsa-project/alsa-utils issue #176 was opened from Frank-Steiner:

Hi,
after upgrading from opensuse 15.3 to 15.4 we realized alsamixer is not useable in standard xterm with white background (which is our default) because the black background vanished. Found https://mailman.alsa-project.org/pipermail/alsa-devel/2021-June/185925.html which explains it. 
But that patch was a bad idea for everyone just using standard xterms and not themed ones.

Adding sth. like a "--black-background" switch could be helpful for those people not working with themed X11...
cu,
Frank

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/176
Repository URL: https://github.com/alsa-project/alsa-utils
