Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC3274431
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 16:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD441720;
	Tue, 22 Sep 2020 16:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD441720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600784770;
	bh=YC5kyfCgZTHgsmZKJjGAe0133weltevGArfx3C+jDP0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QHzcdZwOHVlG/crWk6Uyv/gzz2scSbSSaljEyLb/V5Hd1sc3Epq0u/g9n8qNwo5hA
	 vJq0X09lFc3hiAnfo9+BU0XR+V5aA5P3ZgAqMw0lyjmgCGOlAnGVKctdWjZ5Hz+ywK
	 ejxWDubbL6bz6LeN1YwcyeHqy7FUuEasoRj3yvlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06146F8010A;
	Tue, 22 Sep 2020 16:24:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9FBF80232; Tue, 22 Sep 2020 16:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8DB9F8010A
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 16:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DB9F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WZYsY/t4"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MEOEOP075109;
 Tue, 22 Sep 2020 09:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600784654;
 bh=10S2ODGxKZj5Pa33vv/awVmNVy3euFxke4kAERw9wUI=;
 h=From:To:CC:Subject:Date;
 b=WZYsY/t4z5VBqUiFfShd/9RDdZEUz6VdDkCb/cPaZUyCniqq6n7wYonwVt1UUN11T
 8xpbKAWNmOXlLf9cjYBGpPruAtNoanPT7rAzOFg1/B4nSwNqq0eAiAL4/o+k7GLtUm
 rR0TaTF0io2iqCIMLXZZMq6Sgn+KT0lllFQqFzlI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MEOEjo068194;
 Tue, 22 Sep 2020 09:24:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 09:24:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 09:24:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MEODBE054756;
 Tue, 22 Sep 2020 09:24:13 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH] ASoC: tas2562: Remove duplicate code for I/V sense
Date: Tue, 22 Sep 2020 09:24:11 -0500
Message-ID: <20200922142411.10364-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Remove duplicate code for programming the I/V sense the call to update
the register was duplicated in commit 09ed395b05feb ("ASoC: tas2562:
Add voltage sense slot configuration").

Fixes: 09ed395b05feb ("ASoC: tas2562: Add voltage sense slot configuration")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2562.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index da820e8d59a1..f1ff204e3ad0 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -253,18 +253,6 @@ static int tas2562_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG5,
-					    TAS2562_TDM_CFG5_VSNS_SLOT_MASK,
-					    tas2562->v_sense_slot);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG6,
-					    TAS2562_TDM_CFG6_ISNS_SLOT_MASK,
-					    tas2562->i_sense_slot);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.28.0

