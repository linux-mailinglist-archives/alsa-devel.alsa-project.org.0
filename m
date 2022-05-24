Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1A5329A8
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 13:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0E3B173D;
	Tue, 24 May 2022 13:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0E3B173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653392928;
	bh=PkfOcXRA+tLM3eYM29GdcchAeuFqaIF/shnseoNDkKY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QDlJWhW6BAwRM5aZ6ZnOaDq7sww2QAT1Uh8WzF32AT6n7L4LQ0qOkhz89OdagvZa1
	 mL8RPo2b6WrcvqtSYP+MIJ5QpGDgN2LhUHhY+o6CbHtevq2HY/yGDkL6XIJOQVojiP
	 RjNKOOmlaAmmzcciI9V5QgJBJ0iIg/xYe2iTGSE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 306D1F804D6;
	Tue, 24 May 2022 13:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031F3F804D1; Tue, 24 May 2022 13:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 63E50F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 13:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E50F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653392864710031986-webhooks-bot@alsa-project.org>
References: <1653392864710031986-webhooks-bot@alsa-project.org>
Subject: Fix for arecord recording ghost data
Message-Id: <20220524114748.031F3F804D1@alsa1.perex.cz>
Date: Tue, 24 May 2022 13:47:47 +0200 (CEST)
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

alsa-project/alsa-utils pull request #150 was opened from amadeuszslawinski-intel:

We noticed the issue in our tests, when using arecord would produce files with glitches at recording end.

Apparently it was caused by writing full buffer to output file instead of the data read, when stopping recording.
Following commit adjust the code to only write the amount of data that was read and making sure that file size matches internal format data.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/150
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/150.patch
Repository URL: https://github.com/alsa-project/alsa-utils
