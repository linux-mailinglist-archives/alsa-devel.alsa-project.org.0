Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F98AF808
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 10:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6641116FB;
	Wed, 11 Sep 2019 10:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6641116FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568190895;
	bh=XcZ/BbKa5c39satMxIDIOZovtqgsL0e0zz4C7DjU9s0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nS2nFmK4XP3jogeRMuxavJyuqEsoR+CuWvlGVVQPFj7Fz6lczs9sgXBQ+Alk5yzDw
	 WkrOAo8Ds71YqpfuARvwPcaiYSA2aqFx5fVQ+lzubdLYbZMHG2mjbYOAEKq3Ag/JrX
	 yLdMbnKJ6HxOblgaV7lwoXMPHEWn95+VYqELwitI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEEFF80323;
	Wed, 11 Sep 2019 10:33:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB018F80323; Wed, 11 Sep 2019 10:33:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD92F801ED
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 10:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD92F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qS3OozSF"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8B8X1ND035245;
 Wed, 11 Sep 2019 03:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568190781;
 bh=fcNN+WN8xYAvhrqp5C5Tt0ze8OKvxCs2HHoYY/JHz1c=;
 h=From:To:CC:Subject:Date;
 b=qS3OozSFvtrqEQgNRvbTIbTn+FhzqMdn1a41YGnFTnGuWbSRZWfXf+H1GoQ9doQ0B
 VJnDoSdagA6S+3ELLy6UVdlAedKljazxWZEd2CVu8Ial5sDVO1U/14veSqg48OUhNm
 ukzZPuXb7iGVUtTnbMo0T3h6P72w9Zbv7n7kp3Mg=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8B8X18k077338
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Sep 2019 03:33:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 03:33:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 03:33:01 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8B8WwYe094294;
 Wed, 11 Sep 2019 03:32:59 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 11 Sep 2019 11:33:31 +0300
Message-ID: <20190911083331.16801-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, arthur.she@linaro.org
Subject: [alsa-devel] [PATCH] ASoC: dmaengine: Replace strncpy() with
	strscpy_pad() for pcm->name
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

While it is safe to use strncpy in this case, the advice is to move to
strscpy or strscpy_pad.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index d93db2c2b527..5552c66ca642 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -308,9 +308,9 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 			pcm->flags |= SND_DMAENGINE_PCM_FLAG_NO_RESIDUE;
 
 		if (rtd->pcm->streams[i].pcm->name[0] == '\0') {
-			strncpy(rtd->pcm->streams[i].pcm->name,
-				rtd->pcm->streams[i].pcm->id,
-				sizeof(rtd->pcm->streams[i].pcm->name));
+			strscpy_pad(rtd->pcm->streams[i].pcm->name,
+				    rtd->pcm->streams[i].pcm->id,
+				    sizeof(rtd->pcm->streams[i].pcm->name));
 		}
 	}
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
