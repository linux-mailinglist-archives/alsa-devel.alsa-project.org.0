Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7993A18B2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 17:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3C516C1;
	Wed,  9 Jun 2021 16:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3C516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623250679;
	bh=AR8JCYRKxqvB4Yk63TC2zCfQkQt+9bz4S8krBOSLPXw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8UfaGlgo2ifwJYrhUr2pBvvwdIi57mqf+/Ymy0I9ZPb1qiMgV2/lxdk+SRyOGKcW
	 W7KlDuRhIyTmN/X2my3McGy4JtraqywGkNg2RA3M5gII2eDsH4g0ut9lyZPpuBHEHS
	 Pv9J1c8gb9r3GkUa+XXHrOCI4Y/Fvm0VYRonj/1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 845CCF80276;
	Wed,  9 Jun 2021 16:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B933F8026C; Wed,  9 Jun 2021 16:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3A4A6F800F4
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A4A6F800F4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623250575712619066-webhooks-bot@alsa-project.org>
References: <1623250575712619066-webhooks-bot@alsa-project.org>
Subject: Current version not working with Focusrite Scarlett 18i20
Message-Id: <20210609145629.4B933F8026C@alsa1.perex.cz>
Date: Wed,  9 Jun 2021 16:56:29 +0200 (CEST)
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

alsa-project/alsa-lib issue #150 was opened from TheBitFighter:

Hello, I hope I am in the right repository for this. 

My arch system updated alsa-card-profiles and alsa-utils today which caused my interface, a Focusrite Scarlett 18i20 1st gen to stop working. The card was still showing up in pulse and showed output, however no sound was actually played. Input was still working fine. It sounded like the output stage of the interface had been disabled, and the problem could only be fixed by booting Windows and setting new routing settings in Scarlett MixControl. The interface had exhibited some resetting and popping behavior for a few versions now (when stopping playback, changing application and playing something else there), but continued to work (given a few instances where sample rate played mismatched sample rate sent which caused weird audio slowdowns). It only stopped working today.

What I did initially was reinstall the older versions of these two packages, which did not fix the problem. I now downgraded alsa-libs (1.2.5-2 -> 1.2.4-2), alsa-card-profiles (1:0.3.29-2 -> 1:0.3.28-1), lib32-alsa-lib (1.2.5-2 -> 1.2.4-1), alsa-topology-conf (1.2.5-1 -> 1.2.4-1), and alsa-ucm-conf (1.2.5-1 -> 1.2.4-1) which fixed the problem. (alsa-utils is at 1.2.5-2)
`cat /etc/asound/version` now reports `Advanced Linux Sound Architecture Driver Version k5.12.9-arch1-1.`
This also fixed the popping/resetting issues I had before.

 Thanks for the help! If you need any further information I am happy to help.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/150
Repository URL: https://github.com/alsa-project/alsa-lib
