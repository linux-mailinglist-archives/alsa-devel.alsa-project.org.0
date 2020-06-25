Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2120A732
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 23:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E07BF1AAB;
	Thu, 25 Jun 2020 23:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E07BF1AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593119149;
	bh=h4vbCgQp3itjRiukNAj5oJIDo3JmVPpxWu3X9euzp5M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IkCsjiq9wmMKFr3ErVulG/ru4vBfel5RyTiD+DWeBlmW1VqtDfrrJ8Tv86BTZeTmK
	 Oy5AmsrYxHTFE+rXfNsBnNc4JKIzcDkLXAxmA/2k1r+aSxeqi8RjHgzuJayjCiAPcl
	 JQe0XaqGqXTLdLUXHNQfj6TV9aaFAto9HyiOePaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10231F80158;
	Thu, 25 Jun 2020 23:04:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7F37F80234; Thu, 25 Jun 2020 23:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 431F5F800B2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 23:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431F5F800B2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1593119038485641003-webhooks-bot@alsa-project.org>
References: <1593119038485641003-webhooks-bot@alsa-project.org>
Subject: Cannot use HyperX Cloud Flight S Microphone
Message-Id: <20200625210406.A7F37F80234@alsa1.perex.cz>
Date: Thu, 25 Jun 2020 23:04:05 +0200 (CEST)
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

alsa-project/alsa-lib issue #65 was opened from DirtyCajunRice:

I have a New USB headset that was added/fixed in kernel patch 5.7rc3 (https://lkml.org/lkml/2020/4/4/197). It now loads all the output options but no input options. Is there something i can do to force it?
also have this if it helps: http://alsa-project.org/db/?f=7cf962fe3df280a9a81f5cd1e82633d8cba7b02e

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/65
Repository URL: https://github.com/alsa-project/alsa-lib
