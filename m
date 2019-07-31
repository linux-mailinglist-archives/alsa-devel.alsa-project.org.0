Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7D7CAE3
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 19:50:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709AE16AD;
	Wed, 31 Jul 2019 19:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709AE16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564595413;
	bh=aurnypVGSYIzXxb1hKCv+8132BRsA0EBSWv7CEjeuHM=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iRDai1RlpmjX/EFMGW1u8iJkLFim9y08LIzQu445GXWp00eu0eJ1aKJee/BhXXgfQ
	 3XUhVIT32dJYZPLQBbBiSJkpbuyXDwsUEjPS/AssJGF0y5DZiswMGRPZeoYnDIIF/5
	 wIYBbemUS9rOPPRaw+UULDMKTtIBvoaKpgFJk2II=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C11F8048E;
	Wed, 31 Jul 2019 19:48:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0342F80483; Wed, 31 Jul 2019 19:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5FADF80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 19:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FADF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dIrM0pPm"
Received: by mail-ed1-x533.google.com with SMTP id k8so66454935edr.11
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=u0kZsJvD4Z16iUP2ecxNA83w7FN2y+89xVQshiIJyFA=;
 b=dIrM0pPmWKipM1ldjFfX+1b7HAHui3b+XLZwHt2QHDizb1/NZC3JDAb8ycI3OC0n9Q
 uR4gtbjwQ7/4U3fkdrmu2Hd0pSmmKrdxQl/CDwsRYl+iklyeracTXgyenodhD5m2n+6z
 uwJO+Wnw/g0ukZeqz3zYtbO4CXeQBmThSJQ7Hbciexj9QoR5pmnWSI8xPu2a30fNsKWr
 wDtzY4MA3JQyousrNG1FZu31bdUH/hKjasGhN5DH315nziXaQX9U4GDs+VKm+P3CjN/G
 dEj0pCmdGdj+Y7s20YRfC7Xlq+Qfm3zXNwKBxtYIoOrVyF+MexTUjZ1bDJJEto9keMtm
 HlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u0kZsJvD4Z16iUP2ecxNA83w7FN2y+89xVQshiIJyFA=;
 b=MgD5BwFdo6YlaExuQ3cETSDrpR6FNib6gQnL0vuKSjBzvbNmFkNlOltX0vQevPlBNi
 vgyVDDEV1cW6SDn3g1x2MmtIk28re6KmCIQivU90O019FJp+lsMcUhPHv5o6WZUIy86L
 lDfOnIKoVA+fpSyP04hDTi4BZWxl978V4VrFiRcTy4xgYZmT9S8G3F3ka+DmLI9NxWQd
 A3FWE0lPAff9HZpFYlzaTNwNJTxsUNt0TW/65Bopfpv4BXDqe6z5iK3/cdunahvOwut8
 9Bzpu6BfqTtPxCmSlMZD8SIu2Y7FLofFLeQuFdFVeBGN4KuSA8RkSn4OhWseJi90kLdU
 x71Q==
X-Gm-Message-State: APjAAAXXo0Cz4bjsyB60YG2ofSh89COA1kZk0Xjnt2kKborZ0qdZHOdB
 BKZvzIrnU5G6fnWfZCpTWJP6wrovM0CrzW2WapM1T/WI
X-Google-Smtp-Source: APXvYqydphBuWhk2jmXxXnX53fwXBeKWkHimEHmdmaCN0VTpC/2FrPGNVwWMu+hE9uNM0no1LGF4Qnp/yPJxEdOlAl8=
X-Received: by 2002:a17:906:4354:: with SMTP id
 z20mr54671636ejm.163.1564595304482; 
 Wed, 31 Jul 2019 10:48:24 -0700 (PDT)
MIME-Version: 1.0
From: Paul Pawlowski <mrarmdev@gmail.com>
Date: Wed, 31 Jul 2019 19:48:13 +0200
Message-ID: <CAKSqxP_po3DRQvhqb-VrwD_NitzSRa0a+28NNA8SajUaZN+qbQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] What to do when a device clears the buffer in the
	start trigger?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,
I have a device which clears the DMA buffer when I command it to start the
playback. How can this be workarounded?

I found the SNDRV_PCM_INFO_DOUBLE flag, but it doesn't seem that it changes
alsa/alsa-lib behaviour. I wasn't able to find any drivers which shared
this quirk.
I'd like to avoid double buffering if possible, as once the stream is
actually started it's not required.

Thank you,
Paul Pawlowski
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
