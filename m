Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462152A6D01
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 19:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1BC0851;
	Wed,  4 Nov 2020 19:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1BC0851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604515353;
	bh=Ud3KrgE4jvpNGafd8zwQNa4Tg8hVZdHYsDgHHkx0Rbw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xe7h+G9x2SA0u+aqCOGEdbZ9yQ+v+CAD0PFQgooUMpO+VuF2sfYVvvtY9iR+GWe7t
	 /2zCVR1bdc88gXOIwHUDSfUmkJSD6XsPA9vXsvCU1NJcHHVf7tspKD41PFXFCa8m2i
	 sDPT1++TkZOX2seHp2OE4R3gdAldYxaHlNtOVWZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40249F800EC;
	Wed,  4 Nov 2020 19:41:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FAA5F80234; Wed,  4 Nov 2020 19:40:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 10CE1F800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 19:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10CE1F800EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1604515251505948067-webhooks-bot@alsa-project.org>
References: <1604515251505948067-webhooks-bot@alsa-project.org>
Subject: [Feature Request] Add option to change Audio Mixer Source node (0x0c,
 0x0d, 0x0e etc)
Message-Id: <20201104184059.4FAA5F80234@alsa1.perex.cz>
Date: Wed,  4 Nov 2020 19:40:59 +0100 (CET)
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

alsa-project/alsa-tools issue #3 was opened from kevinsmia1939:

Hello,

I am looking for linux audio tool that can change Audio Mixer Source node, 0x0c to 0x0d for example.

HDA Analyzer can do this (right side in red circle of screenshot)
https://i.imgur.com/UcELkjU.png

But HDA analyzer use python 2 and some other depreciate python modules and since I reinstall my machine (openSUSE TW), I lost the old packages (install old packages manually does not work for some reason).
https://www.alsa-project.org/main/index.php/HDA_Analyzer

I tried HDAJackRetask, but could not find the option or feature to do it. 
However, HDAJackRetask is the closest thing to HDA Analyzer, so I think it would make sense to ask for this feature here.
If there are already tools that can do this (other than HDA Analyzer) please tell me.

Thank you.

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/3
Repository URL: https://github.com/alsa-project/alsa-tools
