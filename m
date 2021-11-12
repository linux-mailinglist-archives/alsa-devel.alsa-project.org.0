Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0C44E72F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 14:19:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289E0166A;
	Fri, 12 Nov 2021 14:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289E0166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636723165;
	bh=OzlGD+vDkBbCis992q/5fajGtF2xNHv2t4QELKjfLxE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JE43unOlE2RVu4r+vn/fXnOGZpl10QqoyRNp1gSsiRaJa9utcUVf8BIzYVItQaU/U
	 pooToGLPuvY3WQnXok5dCpjIYuy0M8tDA+ux8YASY2Sj/oXhDw9L4oom0xkgRsye87
	 iujMbq/69dtK7VELXppAvsP/VcBm55jh4KVO7nuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 966C5F8049E;
	Fri, 12 Nov 2021 14:18:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 951A1F8049E; Fri, 12 Nov 2021 14:18:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 77F49F80086
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 14:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F49F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636723079727916002-webhooks-bot@alsa-project.org>
References: <1636723079727916002-webhooks-bot@alsa-project.org>
Subject: Unable to connect KEF X300A USB speakers
Message-Id: <20211112131806.951A1F8049E@alsa1.perex.cz>
Date: Fri, 12 Nov 2021 14:18:06 +0100 (CET)
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

alsa-project/alsa-lib issue #189 was opened from simbatl:

I'm trying to USE a pair of KEF X300A speakers. They work with aplay on Ubuntu 20.04 server, but fail on Ubuntu 18.04, 20.04 and 21.10 desktop.

Here is output from pulseaudio -vvv:
[pulse.log](https://github.com/alsa-project/alsa-lib/files/7527770/pulse.log)

And here is output from alsa-info.sh:
[alsa-info.txt](https://github.com/alsa-project/alsa-lib/files/7527773/alsa-info.txt)

Anyone who know how to solve this issue? :)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/189
Repository URL: https://github.com/alsa-project/alsa-lib
