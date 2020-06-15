Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8C1F8D70
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 07:59:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6402166E;
	Mon, 15 Jun 2020 07:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6402166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592200760;
	bh=ggezopmOSctdZQ9XozfPWDHvV/0KsWYDQ9Wot00KZvU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LK6V25bRCFCXGFpUe7AcWmKXRndJ8VoK6yS5VQvYcq2fFicJnFVpxgLhaZ8Vlg2+M
	 K1OmsMjSSrvQcTMQNG04hFFcMlhS7S6p5qm8hNksQRRGyNoFNMzXq4NYbf3YHMD+uc
	 +M+QxV9b1vyQ+LsJ+ZthFE4bcHP+DK7v7RI2dDT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F48F800EF;
	Mon, 15 Jun 2020 07:57:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CB2EF80171; Mon, 15 Jun 2020 07:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 10261F800CD
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 07:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10261F800CD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592200651655518055-webhooks-bot@alsa-project.org>
References: <1592200651655518055-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq/timer: use (inout) annotation for API to retrieve
 status
Message-Id: <20200615055737.0CB2EF80171@alsa1.perex.cz>
Date: Mon, 15 Jun 2020 07:57:37 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #38 was opened from takaswie:

It's probable to retrieve status for something several times in runtime, and it's convenient for the runtime to use pre-allocated instance for the status.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/38
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/38.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
