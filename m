Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 929764EA978
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 10:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37158181C;
	Tue, 29 Mar 2022 10:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37158181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648543316;
	bh=vmV03/iCGKesAL505+NMmnlM6PbUZBaiU6CEFfiqM+I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkqhSsleptHQ4e/Bxl9NVUkIy7lEkuDP+0WLpH92zkaNCShx9EndNr4P7R4hfDrkO
	 tqpq90M3CVuzRPSUM7V8Ws9oaUMLrAc90NvO2U5bjtE9CGHu0I8G9X1NWlEPrCUVI1
	 zIvNk6PhUQJP0WH5Eo5vGyQjELX8PZC615KH6clw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CD8F800F2;
	Tue, 29 Mar 2022 10:40:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96EE2F800F2; Tue, 29 Mar 2022 10:40:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 03948F800F2
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 10:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03948F800F2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648543245479640007-webhooks-bot@alsa-project.org>
References: <1648543245479640007-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add profile for MSI MPG X570S Carbon Max Wifi.
Message-Id: <20220329084048.96EE2F800F2@alsa1.perex.cz>
Date: Tue, 29 Mar 2022 10:40:48 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #143 was opened from lordhoto:

This patch depends on Linux 5.17.

This board features an Realtek ALC4080 chip. The various inputs and
outputs are distributed over multiple hardware devices:
* Input
 - hw:$card,0 loop back from speaker (called "Analog In")
 - hw:$card,1 line in at back panel
 - hw:$card,2 microphone from front AND back panel
* Output
 - hw:$card,0 speaker output at back panel (up to 7.1)
 - hw:$card,1 headerphone output at front panel
 - hw:$card,2 could not figure this one out
 - hw:$card,3 guessed S/PDIF output (sadly no way to test)

By default Mic and Line in are disabled. This confuses applications,
thus I made the profile enable them by default.

Without an UCM profile PulseAudio is not able to create output on
the front panel nor record any microphone input.

Signed-off-by: Johannes Schickel <lordhoto@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/143
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/143.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
