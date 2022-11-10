Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5A623D24
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 09:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC9C1638;
	Thu, 10 Nov 2022 09:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC9C1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668067874;
	bh=LCsiGa94sCuJsWop+Finl46pkjJ9AXmddEO4BUSjsSM=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LjzCDE4AYR8+Zp2bHkIUrZ5UZumcif8z+z5+PeBgD3Am7FRlumnqYGJUs0+1ke19k
	 TD/s/0F5MLbSyOExjNM3g9jbsYdueiyQm39QotlUWfufx06TekX832VZlygBKlz7Gc
	 aRnx3Yv66zXfOik1UaCC3cFrTj7Jg1XJhZ59JTVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DEE5F80104;
	Thu, 10 Nov 2022 09:10:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4191F8021D; Thu, 10 Nov 2022 09:10:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A42D1F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 09:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A42D1F80162
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1ot2dV-0006Ey-RP; Thu, 10 Nov 2022 09:10:09 +0100
Message-ID: <7d19ba1f-f78b-a629-c1cc-e5b3f84a94df@leemhuis.info>
Date: Thu, 10 Nov 2022 09:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: [Regression] Bug 216675 Since 6.0.3 Roland STUDIO-CAPTURE no longer
 registers
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1668067811;
 4a7ff8fd; 
X-HE-SMSGID: 1ot2dV-0006Ey-RP
Cc: alsa-devel@alsa-project.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Casey Tucker <dctucker@hotmail.com>
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

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216675 :

>  Casey Tucker 2022-11-09 20:09:22 UTC
> 
> After updating kernel to latest, my Roland audio device no longer shows up in aplay -l or cat /proc/asound/cards.
> 
> I'm running Arch Linux. The last known good kernel was 6.0.2-arch1, and I was able to determine by booting a couple of virtual machines in qemu that an upstream patch shipped in 6.0.3-arch3 refactors card registration, and effectively breaks initialization of this device.
> 
> Patch: https://lore.kernel.org/all/20220904161247.16461-1-tiwai@suse.de/

@Casey, btw and just to be sure you are aware of it, there was a fix-up
patch ("ALSA: usb-audio: Fix last interface check for registration") for
that commit in 6.0.3, too:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.0.y&id=52076a41c128146c9df4a157e972cb17019313b1

> I will be looking at this later this evening attempting to implement a fix that doesn't depend on reverting this patch, and may update this bug report with more details.

See the ticket for more details.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 30d629795e2
https://bugzilla.kernel.org/show_bug.cgi?id=216675
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
