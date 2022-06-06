Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383E53E58E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 17:47:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8319192E;
	Mon,  6 Jun 2022 17:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8319192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654530456;
	bh=Bd1gbsv70AgKXVvj6DQ5l1DoecZz7Wv0Z16aTIhYC3Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0tWoT90LtDuWwY3ZE5syemQdAfcBbqK9V0I2cM10iNMM0284908OqPd8/dTUuGuo
	 Pd6cbDDloRH4T+cQ2bfXpcpBk4uMYmHWroDdQJoej8lk5WxeWnhTeCECPWQkw9Tyzy
	 9jW+vEi7zffZzgUQ2AGMnYMXniRPKg2fPIcIVY9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF09F8047C;
	Mon,  6 Jun 2022 17:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2F19F80310; Mon,  6 Jun 2022 17:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7A170F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 17:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A170F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654530399209357977-webhooks-bot@alsa-project.org>
References: <1654530399209357977-webhooks-bot@alsa-project.org>
Subject: Add basic support for ALC4082 on ASUS ROG Maximus Z690 Hero
Message-Id: <20220606154641.D2F19F80310@alsa1.perex.cz>
Date: Mon,  6 Jun 2022 17:46:41 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #166 was edited from Lastique:

This enables Microphone In in the rear jack and Headphones Out in the front panel jack on ASUS ROG Maximus Z690 Hero with Realtek ALC4082.

Things that still don't work:

- Microphone In on the front panel
- Side channel output on the Line In jack in 7.1 mode
- Rear channels and Center/Sub are swapped

Line In on the rear panel detects microphone plugged in. Actual input not tested (no line out device available; no input from microphone). S/PDIF not tested.

Related to https://github.com/alsa-project/alsa-ucm-conf/issues/165.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/166
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/166.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
