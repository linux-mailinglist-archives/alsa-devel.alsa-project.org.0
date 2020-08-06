Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7582C23DA2D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 14:00:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED277165E;
	Thu,  6 Aug 2020 13:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED277165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596715202;
	bh=R7ejjtrGpaxqH1wG26aLEOpUT5ij2WdJzbdvUc846NM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WE/ks2p7+TYFzZ0w1qdb/oGK8K+jlBarEF/CTmo1kVJA3A4xiyzm8jik13sTxTnDx
	 OuwKzqgz+GBa6V/dKUcq8qpX41fbA0EJCWlZ2X/a0fFagKCubF2RwapPm0RqSQtSvK
	 Ho5tsZ91mrsgwbxEQ+f0GOP5LBpXJn97sVlx+iSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0450F80086;
	Thu,  6 Aug 2020 13:57:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2078DF8015D; Thu,  6 Aug 2020 13:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A1CA2F80086
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 13:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1CA2F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1596715058462852001-webhooks-bot@alsa-project.org>
References: <1596715058462852001-webhooks-bot@alsa-project.org>
Subject: Microphone selection logic not working for max98090
Message-Id: <20200806115741.2078DF8015D@alsa1.perex.cz>
Date: Thu,  6 Aug 2020 13:57:41 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #44 was edited from jacobopantoja:

An incorrect conflicting device is set for internal mic. See PR #43 and commit 73fac5b1 for proposed solution.

Adding this issue for traceability purposes

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/44
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
