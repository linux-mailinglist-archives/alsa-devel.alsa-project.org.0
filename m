Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE6A3518
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 12:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4854166A;
	Fri, 30 Aug 2019 12:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4854166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567161767;
	bh=nSCZ2Nw9/vxgWYG1Kmhs7cex4D5IDVaFRd9N6O+I11I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I21/z64k53G0JEe+Bwzx8EYn9CCJzjrqfL1npkyPUs0IiILVRz6Bnb7oSBpG1l1B6
	 R9xq5zFC0Yt7lfrKFH8xVd93rMjsCsYq66ZEyKuRddbd0V3hD5KE3a2BwpqtDaBnhq
	 v1ZxJTvObGdPU3qi2XjYo+L5TtfKQ6K1H5qSWkLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49A13F805FD;
	Fri, 30 Aug 2019 12:38:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE656F80369; Fri, 30 Aug 2019 12:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D58BFF80444
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 12:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58BFF80444
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZdTzbK4e"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcQNW099247;
 Fri, 30 Aug 2019 05:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1567161506;
 bh=2kobuWY2JAROmNdm5Ov1K80KHF4G7p2A0YzGSoYJlgY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZdTzbK4eoG93dD/2r1r/Fwaj/TMG4JssiYDYLadIRaYsQau3uqVCRF5PQTn56UR2y
 bR77gd4ydCI4RdG7CX3TKt4/wRv+FCk+IBJrUIpng1B9daYYlCZZnj7jY0+q9fo0uK
 qpIzOrS4gvdaTOpj9JBCBVJMbwKnZxJ4D3ORpCkI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UAcQP3028024
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Aug 2019 05:38:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 05:38:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 05:38:26 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcG3c076275;
 Fri, 30 Aug 2019 05:38:24 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 30 Aug 2019 13:38:41 +0300
Message-ID: <20190830103841.25128-5-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190830103841.25128-1-peter.ujfalusi@ti.com>
References: <20190830103841.25128-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, nsekhar@ti.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 4/4] ASoC: ti: davinci-evm: Do not fail if the
	dai_set_sysclk returns -ENOTSUPP
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

The davinci McBSP (davinci-i2s) driver does not implement the set_sysclk
callback, which is fine and should not be treated as error.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index bfd8d1a03ba7..686b23d7a90d 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -68,7 +68,7 @@ static int evm_hw_params(struct snd_pcm_substream *substream,
 
 	/* set the CPU system clock */
 	ret = snd_soc_dai_set_sysclk(cpu_dai, 0, sysclk, SND_SOC_CLOCK_OUT);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOTSUPP)
 		return ret;
 
 	return 0;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
