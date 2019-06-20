Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68194CAA2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 11:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A7EF1616;
	Thu, 20 Jun 2019 11:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A7EF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561022523;
	bh=O1PrfQSowTMGjSSkRfkBbPg76PgnQUFQUeu0vvqQeaI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnCpjF9cPBYDEKHnKRU+Gsyy1A0VpWSpvV0HOPHTUCQy+47NJImH80NEeBj0YmRw4
	 r4NDkI+/RvN71wF6++op0URLAfW3w/7UWuNcTr/tvn/K5T0E6ttvUXayOBQFJUsEUm
	 vcwNZ2H4706TfpxeCqRs0hmzw8aWORlDgsbD/3Q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E8D8F89722;
	Thu, 20 Jun 2019 11:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67875F8971C; Thu, 20 Jun 2019 11:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B5DF80C15
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 11:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B5DF80C15
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gmsMWRso"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K9JSM4118065;
 Thu, 20 Jun 2019 04:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561022368;
 bh=x8kr7zJsYkgOqRB4PAWstormjyFXvIPK2AVaSeIoYts=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=gmsMWRsoTBrPh4nsopGoaWa9m4UjZLsMbwZfFiM6Y/Ck2Jl+Rd7mMTeXsoqMSKjoc
 j+wn+TBEQTpR73RgyulDgLcmj5D2P0HskzlhOYTjhwWhAbHjH4y++xkvaqkoy/XvQL
 4daeeUn+l2z0H8EJKd44t4CWlIyY/+iZOSAOc6SY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K9JS1V045227
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Jun 2019 04:19:28 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 04:19:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 04:19:28 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K9JOBh086408;
 Thu, 20 Jun 2019 04:19:26 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 20 Jun 2019 12:20:01 +0300
Message-ID: <20190620092002.13766-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190620092002.13766-1-peter.ujfalusi@ti.com>
References: <20190620092002.13766-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, misael.lopez@ti.com, jsarha@ti.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: ti: davinci-mcasp: Set unused
	serializers as INACTIVE
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

Unused serializers needs to be configured as INACTIVE, otherwise they will
underflow/overflow when multiple serializers are connected, but some are
not needed for the given stream.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index a8378d223a9e..8bec0dc4f754 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -848,14 +848,15 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 					rx_ser < max_active_serializers) {
 			clear_bit(PIN_BIT_AXR(i), &mcasp->pdir);
 			rx_ser++;
-		} else if (mcasp->serial_dir[i] == INACTIVE_MODE) {
+		} else {
+			/* Inactive or unused pin, set it to inactive */
 			mcasp_mod_bits(mcasp, DAVINCI_MCASP_XRSRCTL_REG(i),
 				       SRMOD_INACTIVE, SRMOD_MASK);
-			clear_bit(PIN_BIT_AXR(i), &mcasp->pdir);
-		} else if (mcasp->serial_dir[i] == TX_MODE) {
-			/* Unused TX pins, clear PDIR  */
-			mcasp_mod_bits(mcasp, DAVINCI_MCASP_XRSRCTL_REG(i),
-				       mcasp->dismod, DISMOD_MASK);
+			/* If unused, set DISMOD for the pin */
+			if (mcasp->serial_dir[i] != INACTIVE_MODE)
+				mcasp_mod_bits(mcasp,
+					       DAVINCI_MCASP_XRSRCTL_REG(i),
+					       mcasp->dismod, DISMOD_MASK);
 			clear_bit(PIN_BIT_AXR(i), &mcasp->pdir);
 		}
 	}
@@ -965,6 +966,7 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 		for (i = 0; i < active_slots; i++)
 			mask |= (1 << i);
 	}
+
 	mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, TX_ASYNC);
 
 	if (!mcasp->dat_port)
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
