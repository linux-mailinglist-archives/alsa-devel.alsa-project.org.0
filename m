Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B01E923E976
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 10:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 458FA1612;
	Fri,  7 Aug 2020 10:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 458FA1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596789967;
	bh=5jgyBqBQG9+eMDV/Y0G5FJcLzS2B+eyjchzR/sohLbM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KskUPRNobFNXreZFRZDBq/QQ9JjZbdaTAvXampuIYWEm3qNTPWjFwtvAjBKprsdDL
	 48v9rkjbR01FzsNbgFhjsG+WJdZW4L1sF2urDRIyPmuHTIGSAR9QjOJlEsq84dliKd
	 KVnx77mtElRnSiKo74SNIpq34/iuY9qZi1ef86HM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D03BF80234;
	Fri,  7 Aug 2020 10:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56C81F80218; Fri,  7 Aug 2020 10:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 84F5DF801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 10:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F5DF801F7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1596789853314728975-webhooks-bot@alsa-project.org>
References: <1596789853314728975-webhooks-bot@alsa-project.org>
Subject: aplay: change if statement to else if in xrun function
Message-Id: <20200807084424.56C81F80218@alsa1.perex.cz>
Date: Fri,  7 Aug 2020 10:44:24 +0200 (CEST)
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

alsa-project/alsa-utils pull request #50 was edited from JSFamily:

Honestly, It does not affect behavior in runtime. But I made this patch to help understanding the source code.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/50
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/50.patch
Repository URL: https://github.com/alsa-project/alsa-utils
