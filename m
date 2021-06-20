Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0083AE0FF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 00:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F126716C0;
	Mon, 21 Jun 2021 00:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F126716C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624229129;
	bh=xLW+pbgbKuAw70xRNn0Ea2kfIPRioBCNJ9sVpxhhhkU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWQ7l7n+eqT0sRqAeBhR69P/s0+4sVl+zkq2K59LHj9JdlYTvc+MEJd9rLUqK5V7v
	 h8+zC/TeSiPrnY1uOQLS3I37aI5v2T9vZS4LT3mg2xX4BDNEo0gmn0U2nn1jXhhvwn
	 5DGCZUOfnPqXekKEZK+YtmnMzyN23qRQOMadFEIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6936DF8026A;
	Mon, 21 Jun 2021 00:44:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F630F80268; Mon, 21 Jun 2021 00:43:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 08B6BF80166
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 00:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08B6BF80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624229033089593887-webhooks-bot@alsa-project.org>
References: <1624229033089593887-webhooks-bot@alsa-project.org>
Subject: Lenovo Legion ALC287/ALC3306 issue
Message-Id: <20210620224357.5F630F80268@alsa1.perex.cz>
Date: Mon, 21 Jun 2021 00:43:57 +0200 (CEST)
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

alsa-project/alsa-lib issue #160 was opened from camberkenpas:

Hello,

I was able to do a little digging into this issue by running a Windows 10 virtual machine and passing the sound card device to the virtual machine I was able to get audio to play through the laptop's virtual machine using the virtual machine. More importantly, I was able to capture traces that might help us determine what this sound card needs.

I've attached traces at the ticket for this bug:
https://bugzilla.kernel.org/show_bug.cgi?id=208555

Perhaps this is enough to deduce at least some of what verbs the codec wants in order to work.

Is this the right place to share this? Or is the kernel bug tracker the only appropriate place for this?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/160
Repository URL: https://github.com/alsa-project/alsa-lib
