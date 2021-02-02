Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43F30C533
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 17:17:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9641741;
	Tue,  2 Feb 2021 17:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9641741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612282623;
	bh=PG0a0V3ShAnxfzm0JAoasLpKc9Yr5B92qUOuiU6KKxE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oy6hwyGlkmJsEGlEw6x66TP1usHUD7g20P1xNGtFf2Zuvs0cI/8gJD9rbVTCG3zyn
	 5bnsDCpsB1Qf8/q35TXMPSi8744Izk923/M5xQd+Iq7UN9JHha0CLLifcEI3/8C0CL
	 cS1mw6TgVgVvKD98ahJb11ggISKcUUGmBqixZKGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2057DF801F7;
	Tue,  2 Feb 2021 17:15:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C47F80171; Tue,  2 Feb 2021 17:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C178F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 17:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C178F80109
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612282521754007101-webhooks-bot@alsa-project.org>
References: <1612282521754007101-webhooks-bot@alsa-project.org>
Subject: hdspmixer: Hardware output loopback toggle buttons
Message-Id: <20210202161529.C8C47F80171@alsa1.perex.cz>
Date: Tue,  2 Feb 2021 17:15:29 +0100 (CET)
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

alsa-project/alsa-tools pull request #4 was edited from pfandl:

Hi, as promised in the [sound/pci/rme9652 patch](https://github.com/tiwai/sound/commit/da2a040ee7cfe1dd57d5bec7906cb979c5787a86) here are the user land changes which provide the user the ability to toggle the hardware output loopback functionality per output channel. I tried to hide the buttons for devices which do not expose the snd controls yet, but due to probably unnecessary struggle i cancelled that. Please let me know though should you want them removed for not yet enabled devices.

Request URL   : https://github.com/alsa-project/alsa-tools/pull/4
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/4.patch
Repository URL: https://github.com/alsa-project/alsa-tools
