Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA522194D65
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 00:39:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AFD1689;
	Fri, 27 Mar 2020 00:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AFD1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585265947;
	bh=lpNqm452oqAi5WRMWniI0SZB4T0JT5RAeVKJvkcfn3Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c1X/Axhlkmvzsw3czkgHcDbBsRuKxqft426hWQaPSGCk3aJgP9ijknAhI8MHpT9dw
	 BzVKMQj+SeEGBkiV3VPCxa+hXlpAW2DRxZ10BWDZnryrjJJp2+tBlTJx7bkPA3/OSI
	 FMi4gCM9BbVGtA/Go4vUOWU02iaYVtxZ9RrmjEMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 345ABF8028C;
	Fri, 27 Mar 2020 00:30:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 194CCF80273; Fri, 27 Mar 2020 00:30:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 971BCF8011E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 00:30:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 971BCF8011E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1585265447914134026-webhooks-bot@alsa-project.org>
References: <1585265447914134026-webhooks-bot@alsa-project.org>
Subject: [hints] arecord -L show entries which are not capture pcms
Message-Id: <20200326233052.194CCF80273@alsa1.perex.cz>
Date: Fri, 27 Mar 2020 00:30:52 +0100 (CET)
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

alsa-project/alsa-lib issue #39 was edited from sylware:

arecord -L will show pcms which are not capture pcms (for instance front speakers, surroundX).

Don't know if it is fix-able. Wait for topology/ucm port of classic drivers?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/39
Repository URL: https://github.com/alsa-project/alsa-lib
