Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC5FADC6
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 10:56:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 303401612;
	Wed, 13 Nov 2019 10:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 303401612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573638982;
	bh=ibMPZxiUgTHxeJfCqTFJV3W4hXKxaLc27IBJTGTRJbw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UDLtXPv2730RIjbA3gqBmDBgRRiN7BAgvyKLOAM3poxN/iX8rXsDAuGPJIvF++7YH
	 FOn2MICwMfz0AG2veKfofa5wPL07zLQb/LC22Vlk1ehDBsJWa+b+ih/j6lhUJwjd4U
	 fwjChQFqdzu0jq9xCEro3N+WkHgF3xG9KpX5YcN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C59F80635;
	Wed, 13 Nov 2019 10:54:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6248EF80635; Wed, 13 Nov 2019 10:53:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C53F80095
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 10:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C53F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rVRXNrOW"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD9rZ0V089866;
 Wed, 13 Nov 2019 03:53:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573638815;
 bh=hYh1EUFha/ylbf5ZiyeOjQ/Riy1tVsc+1RvgaMEdHNY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rVRXNrOWKtsFJdE+4ID4buQQPghk1FG7GXNdVaK6a9e+0bTwdZVMgvn4yeCrjdzkA
 HKloqqZVJd6JWJ1KWOB2zvguWupKfy8nGxybY6As2WJW4N4ri9GV3sWampSc88vWsP
 ZijDcXOjXC4Ryv49iNW+W3h2Y2n19aEgwWKOnGJo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9rZwu081844;
 Wed, 13 Nov 2019 03:53:35 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 03:53:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 03:53:17 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9rUGT121188;
 Wed, 13 Nov 2019 03:53:32 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <lars@metafoo.de>
Date: Wed, 13 Nov 2019 11:54:44 +0200
Message-ID: <20191113095445.3211-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113095445.3211-1-peter.ujfalusi@ti.com>
References: <20191113095445.3211-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org, jsarha@ti.com,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] ASoC: dmaengine: Use dma_request_chan()
	directly for channel request
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

dma_request_slave_channel_reason() is:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f4c755209e03..a428ff393ea2 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -387,7 +387,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			name = dmaengine_pcm_dma_channel_names[i];
 		if (config && config->chan_names[i])
 			name = config->chan_names[i];
-		chan = dma_request_slave_channel_reason(dev, name);
+		chan = dma_request_chan(dev, name);
 		if (IS_ERR(chan)) {
 			if (PTR_ERR(chan) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
