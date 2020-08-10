Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F941240189
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 06:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1574A1662;
	Mon, 10 Aug 2020 06:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1574A1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597034116;
	bh=G/uJoDN7ROeL9/S38HQnZd1iJzr0ahaqJWkqTFEU/BQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ch4EFCfhg6gYYCpCv44OnR0Yg4batwjpBGWhVs7+RFKep0c0VTGkRrqiH4j2Nwrz1
	 Tj6Nq549A0WT3nJAawhdiyfEldtAGWZRl0K24/BO2v2c7P6nuuDD/2ZheMgqAMzNDu
	 f/G9pYu0XVXFZ1/tpeL3xIstw8Fe88IgolinAWoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 417D1F80085;
	Mon, 10 Aug 2020 06:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ED3AF8022B; Mon, 10 Aug 2020 06:33:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8AB97F80085
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 06:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AB97F80085
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1597034008999078035-webhooks-bot@alsa-project.org>
References: <1597034008999078035-webhooks-bot@alsa-project.org>
Subject: Low volume with chtmax98090 (Toshiba Chromebook 2/Swanky)
Message-Id: <20200810043333.3ED3AF8022B@alsa1.perex.cz>
Date: Mon, 10 Aug 2020 06:33:33 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #45 was edited from reanimus:

It looks like the UCM configuration for this board is the Chromebook Asus C300 one, but the volume levels set by default are far too low. It looks like when Pulseaudio loads on my system, it follows the initialization steps and results in a really low volume, as the Speaker is set to 27/100 and one must manually set the alsamixer levels to fix it. I could have a periodic task reload the volume state, but I find it better to override the UCM configuration manually and tell my package manager to ignore changes to that file during upgrade.

FWIW, my fix is to modify ucm2/codecs/max98090/EnableSeq.conf and change
```
	cset "name='Headphone Volume' 10"
	cset "name='Speaker Volume' 10"
```
to
```
	cset "name='Headphone Volume' 80%"
	cset "name='Speaker Volume' 80%"
```

Naturally, this is a bit of a nasty solution. It'd be nice to have an upstream fix in case other stuff is changed for this.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/45
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
