Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DB1F8DD6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788221679;
	Mon, 15 Jun 2020 08:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788221679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202574;
	bh=qt1Oxwmr6kui0cYxkhiHpXSs6xtgBLPPFgmcWgX0wEQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o9BPWljXRJAbSwVYkX7EnCOgywkr0P5AXlzcWNfD6+rOlUonBKA2e2YETkwyJn45l
	 LgQEtD/P1iRwSlX3xNPT20Q8eYsaeg82KfgcJL8UxulRr5snsMdvyXuJhl7umoXrf/
	 yAagLs2ZIANCQ1qbsg85FGA3JOMPCGwiHGwUJFXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFEBAF8028F;
	Mon, 15 Jun 2020 08:26:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA5DFF8022B; Sun, 14 Jun 2020 05:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E308F800CD
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 05:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E308F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="RCPqZHOT"
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49l0S14xHyz9vbsb
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 03:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJTk_0-Ce93R for <alsa-devel@alsa-project.org>;
 Sat, 13 Jun 2020 22:33:53 -0500 (CDT)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49l0S136CZz9vbsT
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 22:33:52 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49l0S136CZz9vbsT
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49l0S136CZz9vbsT
Received: by mail-io1-f69.google.com with SMTP id b30so8960735ioc.8
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 20:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=XJ6IMqjGiHhE6cmEbhidHkelmuGZ0N00fySDcl0BZ0Y=;
 b=RCPqZHOTlWV3l7+1oiYCxljpHmbk3Vk2FFESqIGIuZYEKlFcK7H5LrOb23XIzkcQeZ
 WhM1b5WXU6vzr/g+HtvHM472+dxGp6yLvE/3q58mlhvXk3Aflwnhf0aiKXqQEXszg+oW
 X1aKtOp9qoZD5YMEP+Ea47OrYOM/9X6v68pZfo3sNZyhxVKG2CQ2Klf2L5161j8c6fj4
 Qres46gtzoPMvxS/4lGvKcU53HeXhUSW9wZjtIZSNw/XLpkZOjhFuN4+eLFlnLgo68pj
 MoAsFtlisAtqLggUlmwL9fRYb2uBWUyV7froQVfnLzzFLNe2I6oAUj0YePngSworYW+O
 O7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XJ6IMqjGiHhE6cmEbhidHkelmuGZ0N00fySDcl0BZ0Y=;
 b=fjytxkpzA+rTk9Tf5jcVVgQ+Hn1B0JNnV3tEuXU326dptk2xz3xmIvN6PT4DvzPHgh
 z9tps0mByl7Y27Lyy+Ok93huxaSIh6RMJ4rXZURWdrNJTCdr4uFZA/hLvy3SCOxt2TqI
 dtPgH8H3qreTrtto3YE28Ssyh6L4kHMeXkApCmACOuVL/NOfidmT500Fr+Ud8t/gn2B7
 BgBLwSDfMGHCIZRLGcy43vm0mQAtctimXhLjgpdGeXmXJM47bqTVSAvL18oSIQeoH3Am
 VIJvRaQZgQmaCLeThXDJJxqdlRVMecuk1ubB/TGrRUOKQ3e8DzPGEAXdfB8J+XXD5POj
 u4+A==
X-Gm-Message-State: AOAM533v5Jwsyj+FvqIAL/YtkdC0FiYMcGtdNAk2tf127vHXS/EgAqqx
 VF0+MyJEsYVzkwdSnv1C387qEIoMHk6Btzv2jEia0Q2GHL+qiiHp2FtX9JU6E/W6bDW4XB4Ij6W
 e4PuVghraumws0bWuZ9LAGP0Bvko=
X-Received: by 2002:a05:6602:2e05:: with SMTP id
 o5mr21472155iow.28.1592105632516; 
 Sat, 13 Jun 2020 20:33:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyQxM25g4plSaC+vGKbkygobkILoafY5rQEhoKV/Z8/cZP1AgGP3MWxJz/Yj++R/EZwGS9KQ==
X-Received: by 2002:a05:6602:2e05:: with SMTP id
 o5mr21472135iow.28.1592105632167; 
 Sat, 13 Jun 2020 20:33:52 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
 by smtp.gmail.com with ESMTPSA id 4sm5763940ilc.34.2020.06.13.20.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 20:33:51 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Subject: [PATCH] ASoC: img-parallel-out: Fix a reference count leak
Date: Sat, 13 Jun 2020 22:33:43 -0500
Message-Id: <20200614033344.1814-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:10 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, wu000273@umn.edu
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

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 sound/soc/img/img-parallel-out.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 5ddbe3a31c2e..4da49a42e854 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -163,8 +163,10 @@ static int img_prl_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	ret = pm_runtime_get_sync(prl->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(prl->dev);
 		return ret;
+	}
 
 	reg = img_prl_out_readl(prl, IMG_PRL_OUT_CTL);
 	reg = (reg & ~IMG_PRL_OUT_CTL_EDGE_MASK) | control_set;
-- 
2.17.1

