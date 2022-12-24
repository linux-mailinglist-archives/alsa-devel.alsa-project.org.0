Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC06559CF
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 11:32:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC4CAD69;
	Sat, 24 Dec 2022 11:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC4CAD69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671877930;
	bh=XZi46/kY5JnAG62i3oPNbXYT0hv0xPaTi9kqsSqWKBA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2o5rN4Qzo8gSVmToBRRufrIXSQ0Ctti7VZP4dNH40av5W32n1ZGzArXPbwBps4/2
	 qMnjY0+I/eMvH4zk0iGfJGyJFB5XxGFumvkQLsMfxwhj0X8cjLIL9v9IzwZfINaI1W
	 DebNqXf9HwGl5Eqy7q24a440zCVU5BzlW2YrhFA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0470F80423;
	Sat, 24 Dec 2022 11:31:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A6F3F8032B; Sat, 24 Dec 2022 11:31:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7F559F802E0
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 11:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F559F802E0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671877861936239958-webhooks-bot@alsa-project.org>
References: <1671877861936239958-webhooks-bot@alsa-project.org>
Subject: ucm2: sof-essx8336: don't use disdevall for this device
Message-Id: <20221224103106.1A6F3F8032B@alsa1.perex.cz>
Date: Sat, 24 Dec 2022 11:31:06 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-ucm-conf pull request #258 was opened from mchehab:

disdevall causes undesired side effects on this device, as it breaks main microphone's detection, and makes hdmi outputs invisible at pavucontrol (tested with pipewire-pulse).

So, rely on cset to disable what's not needed at the enable sequence.

Fixes: 15a12508003c ("ucm2: put disdevall to HDA/Soundwire configs")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/258
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/258.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
