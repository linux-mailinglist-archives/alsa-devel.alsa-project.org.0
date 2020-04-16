Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736101ABECC
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 13:09:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 232351671;
	Thu, 16 Apr 2020 13:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 232351671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587035360;
	bh=uYXPNh8guahg/utfIFRzSCabsWomD1M21FU1u1Iy7c8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/bdfYzdg0y2MSUik4dp1HpxvX0WSFfwzV1Zj4TAyUKRnKbZGWNwgGwXKihn/LvZC
	 9G20O17ZTtG7JuMvueoSQ19A9diPJFxyL1cDJxotN29mzG4n/Yd1Ql5XoRpttbHod3
	 SD6SmPohgDbtSwI33TlfBa0Em+Gbu3Z4tKDpaglc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36277F8013D;
	Thu, 16 Apr 2020 13:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8E4CF8021E; Thu, 16 Apr 2020 13:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3732BF8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 13:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3732BF8012E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587035271228260994-webhooks-bot@alsa-project.org>
References: <1587035271228260994-webhooks-bot@alsa-project.org>
Subject: Volume is not restored after boot
Message-Id: <20200416110755.B8E4CF8021E@alsa1.perex.cz>
Date: Thu, 16 Apr 2020 13:07:55 +0200 (CEST)
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

alsa-project/alsa-utils issue #39 was opened from Oscar65:

I have archlinux updated system last sunday.

```
$ uname -a
Linux mypc 5.6.3-arch1-1 #1 SMP PREEMPT Wed, 08 Apr 2020 07:47:16 +0000 x86_64 GNU/Linux
```

I checked with alsa-restore.service and alsa-state.service. None of them work as expected.

My sound card is:
```
# lshw -C sound
  *-multimedia              
       description: Audio device
       product: 82801H (ICH8 Family) HD Audio Controller
       vendor: Intel Corporation
       physical id: 1b
       bus info: pci@0000:00:1b.0
       version: 02
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress bus_master cap_list
       configuration: driver=snd_hda_intel latency=0
       resources: irq:29 memory:ffaf8000-ffafbfff
```

Every time that my system boots the volume levels are different than last time a powered off.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/39
Repository URL: https://github.com/alsa-project/alsa-utils
