Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF12FF696
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 21:58:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 950AE1934;
	Thu, 21 Jan 2021 21:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 950AE1934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611262704;
	bh=q5PfhF5TBvuXkuTtDOs+d50GpbELkxkDVj2Jqdz4ISg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTCArP+VszQE8PVK9MhyHjV0q4RK6UOdCcUREY4DG9L2CJeLKaHs8+UtFrPFQX47g
	 cFH/6DiK0gIKh6s84OVCEm9bBrEwhGHi/5MxXNMZ4/xFjz/nROAfkvwERqctLzZYHh
	 t1+Ibb63nthI6tWbHf4dedkyE6HSl6g1X389crzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DEBFF804B2;
	Thu, 21 Jan 2021 21:57:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 748D3F8027D; Thu, 21 Jan 2021 21:57:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 288C0F80255
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 21:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288C0F80255
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611262644635801077-webhooks-bot@alsa-project.org>
References: <1611262644635801077-webhooks-bot@alsa-project.org>
Subject: SOF: Improve dmic support
Message-Id: <20210121205727.748D3F8027D@alsa1.perex.cz>
Date: Thu, 21 Jan 2021 21:57:27 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #75 was edited from plbossart:

DMIC support seems incomplete for HDaudio (not handling all possibilities for cfg-dmics) and missing completely for SoundWire.

This is an untested draft just to get UCM3 feedback from @perexg and tests from @aigilea on an HP Spectre x360 device.

Edit: adding @kv2019i @RanderWang @bardliao and @libinyang for reviews.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/75
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/75.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
