Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D324CAD8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 11:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42B4C846;
	Thu, 20 Jun 2019 11:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42B4C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561022912;
	bh=DgiILTzJS38f+rtF5dpVykBr9/OS/8s/gydoQXUswrY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8UHJef6NI3lR0UqSkK57W+25UiqOgtiuJO2g9p2QRi/YXH6dLAG+mRRsAU4VTRIW
	 fjyjKRYI6B1jhn/AZg75SEOd6iEqip3tq9mcPvJdEP+CWhk6T6YVFk3lL+Iv67evfJ
	 w4xrsHy0yMf6Mlxradgof7hNyYqbuYZse3yKrRLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2128FF89724;
	Thu, 20 Jun 2019 11:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652AEF89732; Thu, 20 Jun 2019 11:26:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85D71F80C15
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 11:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85D71F80C15
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zHG12IlH"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K9QO9I120398;
 Thu, 20 Jun 2019 04:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561022784;
 bh=GgYjlqsoYBexDRLn5sGpZwigU+4NrDZfmKSjJFW5UoU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=zHG12IlHlJT/KvqxyzD433sz26XcdvzJL0UlNa+Uh6hnf6P1scoKncmVgW83uqlIh
 c6N13cPwLc2XIzXxQ707qSquffXU0nYdYbxffyp9VEYKKtE91zcLIK/Ho9DiSC5xiA
 7F21dA7Y+o5hh7ldSsB8HV7TlKVVfEAMmNhthnH8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K9QONU089654
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Jun 2019 04:26:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 04:26:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 04:26:23 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K9QJ0r061353;
 Thu, 20 Jun 2019 04:26:21 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 20 Jun 2019 12:26:55 +0300
Message-ID: <20190620092656.14759-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190620092656.14759-1-peter.ujfalusi@ti.com>
References: <20190620092656.14759-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: pcm3168a: Rename min_frame_size to
	slot_width
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

It represents slot size and not frame.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/codecs/pcm3168a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index ed0b4317c9ae..861d24cc002e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -432,7 +432,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	u32 val, mask, shift, reg;
 	unsigned int rate, fmt, ratio, max_ratio;
 	unsigned int chan;
-	int i, min_frame_size;
+	int i, slot_width;
 
 	rate = params_rate(params);
 	chan = params_channels(params);
@@ -467,11 +467,11 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (pcm3168a->slot_width)
-		min_frame_size = pcm3168a->slot_width;
+		slot_width = pcm3168a->slot_width;
 	else
-		min_frame_size = params_width(params);
+		slot_width = params_width(params);
 
-	switch (min_frame_size) {
+	switch (slot_width) {
 	case 16:
 		if (master_mode || (fmt != PCM3168A_FMT_RIGHT_J)) {
 			dev_err(component->dev, "16-bit slots are supported only for slave mode using right justified\n");
@@ -488,7 +488,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	case 32:
 		break;
 	default:
-		dev_err(component->dev, "unsupported frame size: %d\n", min_frame_size);
+		dev_err(component->dev, "unsupported frame size: %d\n", slot_width);
 		return -EINVAL;
 	}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
