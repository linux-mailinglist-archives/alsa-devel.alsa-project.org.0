Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2104425104
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 12:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 049351661;
	Thu,  7 Oct 2021 12:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 049351661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633602358;
	bh=xMZHQ+++NXlNmoABgcCr8htsbOvBj5cLXwDdKUSXr3g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvAgtynOLXylgBq+6o09FYeULocTxydbwnGJ6x+ptDSgg/7b+By0D39ETOkDNYHyR
	 5/Dkl3ynz7Ixrx78xW7duDX6Vhih5LBzzHhbo5PdkNxIRUSZRlXtkyvO5bm2nI5zQo
	 9Vs+DcUvplgebGGRSOrr6PZpOrD2P1THNlMFyMog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED29F8028B;
	Thu,  7 Oct 2021 12:24:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A6BCF8027D; Thu,  7 Oct 2021 12:24:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7DBB2F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 12:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DBB2F800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633602274573642969-webhooks-bot@alsa-project.org>
References: <1633602274573642969-webhooks-bot@alsa-project.org>
Subject: dlmisc.c: Avoid double unlock in snd_dlobj_cache_get0()
Message-Id: <20211007102439.9A6BCF8027D@alsa1.perex.cz>
Date: Thu,  7 Oct 2021 12:24:39 +0200 (CEST)
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

alsa-project/alsa-lib pull request #182 was opened from johado:

Remove call to snd_dlobj_unlock() in snd_dlobj_cache_get0()
All lock/unlock is done by callers of the function.

Fixes: https://github.com/alsa-project/alsa-lib/issues/181

Request URL   : https://github.com/alsa-project/alsa-lib/pull/182
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/182.patch
Repository URL: https://github.com/alsa-project/alsa-lib
