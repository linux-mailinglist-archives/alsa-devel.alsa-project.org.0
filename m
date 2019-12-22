Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C478128D26
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Dec 2019 08:36:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50091666;
	Sun, 22 Dec 2019 08:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50091666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577000172;
	bh=yrKY41VGAEtzj4RJ360tE5Pw2SMEaej9qQi0eRGrp0I=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dDA09cvIihg/qNcJErBroJLfDqobPnOuSkdNZyWy/Ed9SZk2Pi2fJEIi3wCYsj50j
	 GpHjc/UzpOqtwzzBPXr1qmhx9PvUjSt6Dq1IwauSiGPTu6sUid/5/o++GSV5aXmD7i
	 fd0crRqr2Sm7BskUrWr5uRTb0okrvojLx6VAPm2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63CE0F8014C;
	Sun, 22 Dec 2019 08:34:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE253F80136; Sun, 22 Dec 2019 08:34:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0F31EF800BC
 for <alsa-devel@alsa-project.org>; Sun, 22 Dec 2019 08:34:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F31EF800BC
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1577000063145612001-webhooks-bot@alsa-project.org>
References: <1577000063145612001-webhooks-bot@alsa-project.org>
Message-Id: <20191222073426.EE253F80136@alsa1.perex.cz>
Date: Sun, 22 Dec 2019 08:34:26 +0100 (CET)
Subject: [alsa-devel] ctl: elem_id/elem_value: add APIs to check whether two
 instances have the same meaning
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

alsa-project/alsa-gobject pull request #2 was opened from takaswie:

For some cases, it's convenient for users to check whether two instances of elem_id/elem_value have the same meaning. In glib, APIs for comparison of content of objects are named as equal. This commit adds equal APIs for this purpose.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/2
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/2.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
