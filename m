Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9851589CF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 06:57:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD9A31670;
	Tue, 11 Feb 2020 06:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD9A31670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581400659;
	bh=SQHiSxAYy1klSA1wy2OR2loyTmC6XOmKMUgNebIjxIA=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ik7YbjcYCZjtAV3kL+B1Q5cSGEj6ZzrXsmxLqx1xuLRooyS3vHYtq3kNKUB6AwFfO
	 qVaZpYpQv5aLL86RrlVmUWOfrvjgUw9iZLn3zlAK6/D8KUtAywvzKFKAfkiikUfUoM
	 36V+bWcXC7dmm7v2bDBwTo4eeFTqycmDLk5bUwuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E31F800E7;
	Tue, 11 Feb 2020 06:55:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA652F80145; Tue, 11 Feb 2020 06:55:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AE7A6F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 06:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE7A6F8013D
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1581400550813920975-webhooks-bot@alsa-project.org>
References: <1581400550813920975-webhooks-bot@alsa-project.org>
Message-Id: <20200211055554.EA652F80145@alsa1.perex.cz>
Date: Tue, 11 Feb 2020 06:55:54 +0100 (CET)
Subject: [alsa-devel] alsa-gobject: GSource optimization
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

alsa-project/alsa-gobject pull request #8 was opened from takaswie:

As long as using the created Gsource with GMainContext, the call of poll(2)
system call with infinite timeout surely returns when quit() method is
called for the context. All of GMainContext implements GWakeup with eventfd
and the call of quit() emits event via the file descriptor of eventfd. This
brings wakeup from blocking when poll(2) is called with inifinite timeout.

In current implementation of alsactl/alsatimer, open(2) is called with O_NONBLOCK
and GSource includes explicit timeout to avoid the infinite blocking. However,
they are not necessarily required for GMainContext.

This patchset obsoletes these points and adds options as the alternatives.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/8
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/8.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
