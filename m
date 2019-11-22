Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEDB106717
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 08:33:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E11921801;
	Fri, 22 Nov 2019 08:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E11921801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574407999;
	bh=JOAp7ORsEwfJXo1i1Jax+gO7+BY0CLLDu5YwE3E/+gY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dmuto95UiYareRecyN0mtV8ICldWbM+UXCejsuHjIyGb9Oznb3smrfLns06oWv1uG
	 29J3OsXQL1HSfmtfZzpbeIs5kZTxi/bkT1BjGXpmc28ieXm26bm5hYyiSn0vioL9DA
	 pSMcczrcD9l1QmOx9Sp11a5pyhMTxhZCZr6fGi28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBCD1F80157;
	Fri, 22 Nov 2019 08:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10099F80140; Fri, 22 Nov 2019 08:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 635EBF800EE
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 08:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635EBF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="inW2kLhh"
Received: by mail-qt1-x84a.google.com with SMTP id 2so4061489qtg.8
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 23:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=VN0LFMMhyGnWsVGC32JIOB9RLLljBbJ89h2dnptt08I=;
 b=inW2kLhh+dzvPH4zScSzqE282fHnYLOyxzbnFX3KsvZYD+js0ubk8RN0sdBmkQ3iVC
 lCWQKVl62PplHOJXVYOageiWKjsSkK15VdIkJKSEv2dnERhQqNfWqPxAlcwImWIHfYmU
 mcsVWJZXWTwpBxXBZQDO/8giaoZyXWpqW7AJCb2Kxc5I1ENZLHpI7IrrXLE3/gt5U/fz
 uv0rv1NONY4kt19hWQ0Aw+JlRmb39ntWq9OSyvUf4zm9NDz6AFUzt24OcZ4+SF920UUT
 hxj7Wr6jIvZSOeUosP/TQK5ZjWJJDA0Twyqk3OKRRAlNtD+x+sx+2MQQ/uMFvbspLzTR
 tZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=VN0LFMMhyGnWsVGC32JIOB9RLLljBbJ89h2dnptt08I=;
 b=jH4+Z/yP0FH/i74UEzbDaKq4oii6Is0wNkS3DW6N/6ioFx1+mtM9tO2qF3EvJb87zP
 cJWYPvSriYCYpDy4fBxP6gdObQZkMpI3ley5Bd/Af1QnBVfTvhgcGWuJ2Z3eKhuMtL3y
 sS5AfEWAxG917yqsRJxkjoQ6i1ZajpJCHlbEjJoW5qcy4kDPqaqS9cx/TFT1vcDHm3qd
 8G1uQY0gkPQ+kBogdvuNYfgnPdy7ytwA/rzc15spMm9N1sGPt6FNMt50OVEXa7k+IyEJ
 9djTReWuk6R0EtmS2II73yORFgLQeiNaC/IVL/r428p8lGGMSN+WybCU8Yqy0vIayFaR
 fmhQ==
X-Gm-Message-State: APjAAAWVUsymFkOEHr9YTmImzxpARoKy8xNQ7atkgZ+liqaeLa+/N0XS
 Z2elUPU8+FBmEKmO3jyWvm4Ylx2vHOdk
X-Google-Smtp-Source: APXvYqyrkYEDiA8Qoy7VyqfCIOryLaZY+Rm0WswHINnPBY7iIvN9u5FdjHwDt9ooWLYLZR1CSg9AqgjfangX
X-Received: by 2002:a37:4ed7:: with SMTP id c206mr2368256qkb.440.1574407885224; 
 Thu, 21 Nov 2019 23:31:25 -0800 (PST)
Date: Fri, 22 Nov 2019 15:31:11 +0800
Message-Id: <20191122073114.219945-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH v2 0/3] ASoC: max98090: fix PLL unlocked
	workaround-related
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

This series is a follow up fix for the question:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157364.html

Changes from v1:
ASoC: max98090: remove msleep in PLL unlocked workaround
- add more comments
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158969.html

ASoC: max98090: exit workaround earlier if PLL is locked
- "sleep first and then check the status"
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158998.html

ASoC: max98090: fix possible race conditions
- fix typo
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158966.html
- add more descriptions in commit message

Tzung-Bi Shih (3):
  ASoC: max98090: remove msleep in PLL unlocked workaround
  ASoC: max98090: exit workaround earlier if PLL is locked
  ASoC: max98090: fix possible race conditions

 sound/soc/codecs/max98090.c | 30 +++++++++++++++++++++---------
 sound/soc/codecs/max98090.h |  1 -
 2 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
