Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF5A8AD49
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 05:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 071B31664;
	Tue, 13 Aug 2019 05:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 071B31664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565667885;
	bh=d9hoiF0auYL7Mo0ekdV/SrwbO5HUIIAX8cev5pMQma0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vmLOZ59GjRd0ilL4eMK1fldqoqL//lXJX95kTUKBrLWiG9oF4S9ZFO5/3SjsRdHxy
	 bzGfzOKL0JJa2B7Qhm1+dy07DG7LV2hop53Z3GQ6IM/lS1wP+pAIiZOs/lOdK7S5XK
	 6fQi//Xl7i5LKDpixPVwC+ljU8KIy0Q8eLJp52qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30330F80273;
	Tue, 13 Aug 2019 05:43:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F017F80273; Tue, 13 Aug 2019 05:42:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76070F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 05:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76070F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Nn0LLbEo"
Received: by mail-pg1-x542.google.com with SMTP id u17so50516116pgi.6
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0k9YKjP/cSKJilQHVEEEWvX6n5tlm0qX23zD4SCMvhE=;
 b=Nn0LLbEocWdQsZe0KwASTMeF3yvcOUKdkEWMYH1WHDcbYZWs1/M9S46ADNJLT6ztKg
 ohnPs8aI1SGl2ecJD5x4iWvugHTXqr1TmFHT9cv+2mrcs8/YL8avkYWxe2qtcS225nYV
 P14ZkKXD8rYHbCL1BztGCkUqvwFTpCDtg2APVRC3DfIiLoTr2T0mY9ymE1fahlqjs1tt
 jAqGyWq1s5KnLlyXrLJxyCGWMSHc4nX72i9PyAnH4BPXneTS8wdr1UA9Qv5ybNJHztXl
 ZERPDzUATurdIpD42BJbH+z1ziScK9WqqXl1xpmFhDYq6wbbAGEnOCag2tCMQ1v41Qcb
 7ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0k9YKjP/cSKJilQHVEEEWvX6n5tlm0qX23zD4SCMvhE=;
 b=j8rQlythhRPWxFtv8L7djaiTth46gjOQH7tJED+0ksTU3pHfFHwEUOiyvHlvCI58HB
 apXi3pNuu7a5tNLCHxyUdhU4rnuSa9OQSzcz5v+3ud6lIYRPgi7g+U0WYfWa+cKL4goZ
 ZrFG2VFSCzS8XW2jr+GLIRVl/fpPQM9LDTxGHpHC//ISe9jaLiaPNDtROOAeLiK+r2zn
 ZmQeFeUSGRuD6u1zXU8Ng0+JAW7sijVumPbC/L85Xy00JGuK2DG4OQKTan1KFoQUyGQf
 NQraAocilhKTLDqOOYPUxWHc5g5ImEXn88vTDNSziiIripdEBaYkADmTzxqI4CVqbufr
 4daw==
X-Gm-Message-State: APjAAAU8aRkFugfbHR+W9WddDy360FwRi0wDS38nKasEAgWLvCQQ8elV
 BxivhaiTiFJ1PVYcJUFVzxydWIs0YbU=
X-Google-Smtp-Source: APXvYqzuXbjPwNtkLqe7J3EZLKeX4YYvLOu0YBW46xJSkLaMzHDG9bUK3ND0R2GCFO8QqIz8Vs5+KQ==
X-Received: by 2002:a63:ed55:: with SMTP id m21mr32978136pgk.343.1565667771751; 
 Mon, 12 Aug 2019 20:42:51 -0700 (PDT)
Received: from masabert (150-66-86-142m5.mineo.jp. [150.66.86.142])
 by smtp.gmail.com with ESMTPSA id q10sm10076800pfl.8.2019.08.12.20.42.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 20:42:51 -0700 (PDT)
Received: by masabert (Postfix, from userid 1000)
 id 7F0F62011CB; Tue, 13 Aug 2019 12:42:37 +0900 (JST)
From: Masanari Iida <standby24x7@gmail.com>
To: linux-kernel@vger.kernel.org, peter.ujfalusi@ti.com, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
 alsa-devel@alsa-project.org
Date: Tue, 13 Aug 2019 12:42:35 +0900
Message-Id: <20190813034235.30673-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
MIME-Version: 1.0
Cc: Masanari Iida <standby24x7@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: ti: Fix typos in ti/Kconfig
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

This patch fixes some spelling typo in Kconfig.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 sound/soc/ti/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 2197f3e1eaed..87a9b9dd4e98 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -12,7 +12,7 @@ config SND_SOC_TI_SDMA_PCM
 
 comment "Texas Instruments DAI support for:"
 config SND_SOC_DAVINCI_ASP
-	tristate "daVinci Audio Serial Port (ASP) or McBSP suport"
+	tristate "daVinci Audio Serial Port (ASP) or McBSP support"
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	select SND_SOC_TI_EDMA_PCM
 	help
@@ -33,7 +33,7 @@ config SND_SOC_DAVINCI_MCASP
 	  - Keystone devices
 
 config SND_SOC_DAVINCI_VCIF
-	tristate "daVinci Voice Interface (VCIF) suport"
+	tristate "daVinci Voice Interface (VCIF) support"
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	select SND_SOC_TI_EDMA_PCM
 	help
-- 
2.23.0.rc2

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
