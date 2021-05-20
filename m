Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA6838B529
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 19:27:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24331169F;
	Thu, 20 May 2021 19:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24331169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621531661;
	bh=mCn4OfnrMkn7g3uHmc7x4WQlNnkh5qdWJtp36DK09YA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkbAYHtmKvt0h27i03g5Js+8+cJxO0/cvO8U7abXFRvPlQ01rfoppXzFY383Z2t/O
	 1KkyKDUqd9lO2VReZmIAeHf/zTeMKn3KkYwiFPhi7TFgpfoUe2ly7R1ZFcdmESWv5a
	 yZl1AJid8kdybOa/MQjrdoq5bNmlW6271mJk/Kh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 622FFF80229;
	Thu, 20 May 2021 19:26:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DF9FF80217; Thu, 20 May 2021 19:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 22045F80127
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 19:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22045F80127
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1621531556101746082-webhooks-bot@alsa-project.org>
References: <1621531556101746082-webhooks-bot@alsa-project.org>
Subject: Add UCMs for Google Asus Nexus 7 and  Acer Iconial A500
Message-Id: <20210520172608.7DF9FF80217@alsa1.perex.cz>
Date: Thu, 20 May 2021 19:26:08 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #92 was opened from digetx:

@perexg As was discussed previouly at https://www.spinics.net/lists/alsa-devel/msg126382.html I'm opening PR with the UCMs for  Nexus 7 and A500. Both these devices are supported by the mainline Linux kernel. 

You're right that Tegra ASoC driver doesn't set card's name properly. In particular I found that we need to set the card's `driver_name` to `tegra`, then UCM get a proper lookup path.

I rebased UCMs on top of the recent alsa-ucm-conf master and switched Nexus 7 UCM to use generic RT5640 UCM. Everything works great once the card name of the kernel driver is corrected. I'll send the kernel patches ASAP for review.

Nexus 7 alsa-info: https://alsa-project.org/db/?f=0a29f1dab39ec5b33e01215dee42dbfd1dbbf08e
A500 alsa-info: https://alsa-project.org/db/?f=bde4f7938a39b1d26904b414969fc811e726242f

The alsa-info is taken using the updated kernel ASoC driver.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/92
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/92.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
