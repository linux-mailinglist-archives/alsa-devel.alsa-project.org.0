Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E5472FE7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 15:59:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A98517D7;
	Mon, 13 Dec 2021 15:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A98517D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639407575;
	bh=R6tYf6sMkDQqUcVxwxmU/CQHKkEHpsJ3NGTh1w/Z60o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jCQpIKS+Hvb7tAxExW3NED7iX5qm1vZKaNOhtH32f/KVT0A6r52oWJT9ZlyTvRHhB
	 4zT2PyUk7/KwoTzTcE+Om/sgU6Q52hxq843tbbdECkeQwdNy9vvwoAY/tWxAK1uLBf
	 b0FuMsKKhCQDw2AGDRG5Mc5pvClcJjttK4c3DZLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D62E9F8025F;
	Mon, 13 Dec 2021 15:58:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A88EF8025D; Mon, 13 Dec 2021 15:58:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8ECB9F80161
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 15:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ECB9F80161
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639407499717098951-webhooks-bot@alsa-project.org>
References: <1639407499717098951-webhooks-bot@alsa-project.org>
Subject: alsa crashing each time my screen gets locked
Message-Id: <20211213145826.3A88EF8025D@alsa1.perex.cz>
Date: Mon, 13 Dec 2021 15:58:26 +0100 (CET)
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

alsa-project/alsa-lib issue #203 was opened from Fallast:

each time i get my screen lock after being inactive for 5 minutes i log back in and alsa stops working and my volume icon disappears
i have to run volumeicon to get it working back again
i'm on mx linux, based on debian bullseye

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/203
Repository URL: https://github.com/alsa-project/alsa-lib
