Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE215BC00A
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Sep 2022 23:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34771E12;
	Sun, 18 Sep 2022 23:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34771E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663536291;
	bh=sboZKMwHMLLdmuMgyBkgmY146S7JhKHMeSt8HA6VB6g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iiwpflEOeHWhRHGg+v3M+OMbptMWqw6Q9T4M/W3H7Y4un+ubaZziQHldJY9Eh4a8K
	 evyro0ybaXZx9cqcb+kjDnFNx9Q7VInHoPxv8m4mlMcC3HzpqtV/0WeRHmR76bB/WL
	 3FJiNdvZmA6Oe5AWThowKPFbBzG6QJx5aDvUi1dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 785F4F80086;
	Sun, 18 Sep 2022 23:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7266FF804B3; Sun, 18 Sep 2022 23:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D5CAF800E5
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 23:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D5CAF800E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1663536226952555895-webhooks-bot@alsa-project.org>
References: <1663536226952555895-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Motu M4: no duplex profile
Message-Id: <20220918212350.7266FF804B3@alsa1.perex.cz>
Date: Sun, 18 Sep 2022 23:23:50 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #214 was opened from pisquaredover6:

I have compiled alsa-ucm-conf v1.2.7.2 with the patches [3a6acaa5090a0c5a0d29c8a4906b6a60378774e2](https://github.com/alsa-project/alsa-ucm-conf/commit/3a6acaa5090a0c5a0d29c8a4906b6a60378774e2) and [ad1618cdd33f5c78ee1a0a9d3db362ffcb9f2596](https://github.com/alsa-project/alsa-ucm-conf/commit/ad1618cdd33f5c78ee1a0a9d3db362ffcb9f2596). With this, I have simplex audio, but no duplex profiles any more.

Is there any chance we can add a duplex profile, as it used to be the case before alsa-ucm-conf introduced the M4?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/214
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
