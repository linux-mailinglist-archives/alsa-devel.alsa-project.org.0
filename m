Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418189A91
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 11:55:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789BA1674;
	Mon, 12 Aug 2019 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789BA1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565603746;
	bh=O0lVgbF2bbBlLF5WT32ZNDPMkR9z9r44Ytde1NqXE/c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHMVHx10Y97qyLZdNDUUhR3zIBFyl1Drxmj/04OrYwcQi1GP69CVPcGiqTj9QHaV3
	 +jlafQeLNbOBqmNu+bo9HEGBQFK8enkkRVwFZ+1b6tobaMFZU7QSbHxHgqUhlTIj0s
	 WBskhKEFN2MyDeF8Gl91IvvSK+535WAFvHqYKUAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5047EF805F8;
	Mon, 12 Aug 2019 11:52:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BE12F80268; Mon, 12 Aug 2019 11:52:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBADDF80213
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 11:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBADDF80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VyYkuxj+"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7C9qJfn114336;
 Mon, 12 Aug 2019 04:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565603539;
 bh=6+9DRCHkKPSj8uMQMjFLybu79xnkoJ2jmRghrSFHaIA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=VyYkuxj+lBNrFaf63tFoeSoF1XtJSuLHp8JtnWao17RL9hb62aebBZ5zyS9Go6QQp
 l4G3W/iU2YyQwAvWg9V6HM1Dt7aSJ/yXPrhxko3eLbwixkMhAXc1dUT2vEz49SbXjP
 sKWO4X/fcW60K27I8vOSTJ6W8IYeUb3gh2oFVFTM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7C9qJYT104338
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Aug 2019 04:52:19 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 12
 Aug 2019 04:52:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 12 Aug 2019 04:52:19 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7C9qDhR045058;
 Mon, 12 Aug 2019 04:52:17 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 12 Aug 2019 12:52:26 +0300
Message-ID: <20190812095226.18870-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812095226.18870-1-peter.ujfalusi@ti.com>
References: <20190812095226.18870-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: pcm3168a: Allow reconfiguration of
	tdm_slots and slot_width
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

When using right_j format and the codec is slave it can support 16bit
format, but only if slot_width == 16, in the same DAI mode the 24 bit
audio can work with 24 or 32 slot_width.

Because of this, the codec and CPU needs to be reconfigured when the sample
format changes.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/codecs/pcm3168a.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 75fa8e9ee894..50ed86d45c26 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -402,18 +402,6 @@ static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		return -EINVAL;
 	}
 
-	if (io_params->tdm_slots && io_params->tdm_slots != slots) {
-		dev_err(component->dev, "Not matching slots %d vs %d\n",
-			io_params->tdm_slots, slots);
-		return -EINVAL;
-	}
-
-	if (io_params->slot_width && io_params->slot_width != slot_width) {
-		dev_err(component->dev, "Not matching slot_width %d vs %d\n",
-			io_params->slot_width, slot_width);
-		return -EINVAL;
-	}
-
 	io_params->tdm_slots = slots;
 	io_params->slot_width = slot_width;
 	/* Ignore the not relevant mask for the DAI/direction */
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
