Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A6A5138AD
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 17:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7349B1620;
	Thu, 28 Apr 2022 17:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7349B1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651160456;
	bh=5wq4YWbFKGndVvwMl//xoPzqgo0CVZjVC0kEqoMUDIE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n32o4IaenrsuPNCI1IVXecg545oehx9lJs2j2uSW8J4Ic1RAhd3dl2bR3/cDLl4mf
	 iXFQbqePNgUiBqh0IDqsxHxApLuh1UDAAMEapZqlZ0zBrMt7rSF16JtfNi9HXazu0Q
	 RiaMKcgwIn5lHkDBC18UOCAVqb5v+HVNWNliRnCE=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D982FF8020D;
	Thu, 28 Apr 2022 17:39:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0698CF8016E; Thu, 28 Apr 2022 17:39:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 074A4F800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 17:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 074A4F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651160384067101955-webhooks-bot@alsa-project.org>
References: <1651160384067101955-webhooks-bot@alsa-project.org>
Subject: Play jitter coming from dshare
Message-Id: <20220428153951.0698CF8016E@alsa1.perex.cz>
Date: Thu, 28 Apr 2022 17:39:51 +0200 (CEST)
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

alsa-project/alsa-lib issue #221 was edited from davidboulangerlatour:

I have an application which plays a wav file (using dshare) at with a specific period (ie. every 720ms). This always worked well up to recently after upgrading alsa-lib from 1.1.7 to 1.2.4. With 1.2.4, the cycles look like this [750ms, 750ms, 750ms, 625ms], normally it would be [720ms, 720ms, ...].

When doing a bisect to find the issue, I found this commit to be the cause:
```
7265e603bf880a9ec2cd01c3cf2afbd7709e5af4 is the first bad commit
commit 7265e603bf880a9ec2cd01c3cf2afbd7709e5af4
Author: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Date:   Wed May 15 11:56:33 2019 +0530

    pcm: dshare: Added "hw_ptr_alignment" option in configuration for alignment of slave pointers
    
    This change adapt the fix commit 6b058fda9dce
    ("pcm: dmix: Add option to allow alignment of slave pointers")
    for dshare plugin
    
    Issue is that snd_pcm_wait() goes back to waiting because the hw_ptr
    is not period aligned. Therefore snd_pcm_wait() will block for a longer
    time as required.
    
    With these rcar driver changes the exact position of the dma is returned.
    During snd_pcm_start they read hw_ptr as reference, and this hw_ptr
    is now not period aligned, and is a little ahead over the period while it
    is read. Therefore when the avail is calculated during snd_pcm_wait(),
    it is missing the avail_min by a few frames.
    
    An additional option hw_ptr_alignment is provided to dshare configuration,
    to allow the user to configure the slave application and hw pointer
    alignment at startup
    
    Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

 src/pcm/pcm_dshare.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)
```

I tried the more recent 1.2.6 with the same issue. I also tried all the "hw_ptr_alignment" options with no success.

cc @VanithaChannaiah @tiwai

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/221
Repository URL: https://github.com/alsa-project/alsa-lib
