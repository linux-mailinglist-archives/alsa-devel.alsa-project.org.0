Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E6A350D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 12:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8F515F8;
	Fri, 30 Aug 2019 12:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8F515F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567161613;
	bh=Lxs7tqO7n+gd0FFCOr981CHPasNEeORIiAycp81apQ4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c8c+3ZIqLsMjnU3FCPc0hM+IANBmjvhIH736rHqapOxcnU5AHUnLsX9z7ZaBpo/Xx
	 WLvO1fptdu5igIBgzuTnKwsRHEinngjdAwaSiGe9ok/ycxXuBGENutC5IRUXLMrpo0
	 dXaSxj8WnMb4Qcbb9FIrHNGUnCKvkp5gsyyDWnSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8114FF80377;
	Fri, 30 Aug 2019 12:38:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF8E6F8036C; Fri, 30 Aug 2019 12:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBD0DF800E7
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 12:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBD0DF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pXqaVVy/"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcJc8121857;
 Fri, 30 Aug 2019 05:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1567161499;
 bh=PEtyBDRVuUg45ipLY+S+ZuxpDuvqx/qkDHeAS3yV02c=;
 h=From:To:CC:Subject:Date;
 b=pXqaVVy/T0z+TeIM+9MtNnb8Hj2EzHaIwzDBqK7e1K4fs4l1xP9LkcA/QBC5nz5TY
 FcRtIMUyEXJIP9UNldzpnfcr0YTuQCmMZEGBTf28eExXHEeqHEwaTqxLlvy8Sucf8f
 kmhjU8e3UnMIWrsQHoW37zZalEblPt5ioHgcrtgw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UAcJip019540
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Aug 2019 05:38:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 05:38:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 05:38:18 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcG3Y076275;
 Fri, 30 Aug 2019 05:38:17 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 30 Aug 2019 13:38:37 +0300
Message-ID: <20190830103841.25128-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, nsekhar@ti.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 0/4] ASoC: ti: davinci: Fixes for daVinci
	boards with McBSP
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

Hi,

Morimoto-san pointed out in a private thread that the davinci-i2s driver is
using snd_soc_rtdcom_lookup(), which is should not really.

It took a while to get access to a daVinci board which uses McBSP, but
eventually I got access to a remote dm644x-evm and dma365-evm.

Initially the audio was not even probing on them (fixes sent for mach-davinci),
but then the driver was still crashing and not behaving correctly.

With the 4 patch dm644x-evm have working audio and the offending
snd_soc_rtdcom_lookup() is gone from the driver.
dm365-evm still have some issues regarding to EDMA, but it looks like a system
issue which can be fixed later.

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: ti: davinci-i2s: Add S32_LE as support format
  ASoC: ti: davinci-i2s: Move the XSYNCERR workaround to .prepare
    callback
  ASoC: ti: edma-pcm: Fix for legacy dma_slave_map based channel lookup
  ASoC: ti: davinci-evm: Do not fail if the dai_set_sysclk returns
    -ENOTSUPP

 sound/soc/ti/davinci-evm.c |  2 +-
 sound/soc/ti/davinci-i2s.c | 90 +++++++++++++++++---------------------
 sound/soc/ti/edma-pcm.c    | 17 ++++++-
 3 files changed, 57 insertions(+), 52 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
