Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADB8521F31
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF96718BA;
	Tue, 10 May 2022 17:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF96718BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652197228;
	bh=5N+oDhzs8rlZRckrfLBD4c23kDhUJHiVFBs0WkZ/PWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBPMA+H9Uh0PWNFrP4LuWBuJnkfw+ast/c11UxOdw2YmoxFLLQ3pPMk5f3dOfFBz5
	 qQt8rLyvkEcyGzJDrXgt0E+h5tke/EDvjB1JeUY7QeQGZPr/o/6XO85kWWXa2Kspk5
	 6txfFphSjyLSPed93bTAalYHezfPsK3C6x8CUDrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BDAF804FF;
	Tue, 10 May 2022 17:38:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 936DDF8019D; Tue, 10 May 2022 17:38:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F78CF80153
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F78CF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GGX0L1eX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A1Vu6u002517;
 Tue, 10 May 2022 10:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=CAGqj+TaOlGcTduhW6lm+mCWgMXxx/GyWKbpEzW7OBM=;
 b=GGX0L1eXl1fXW8DJV+07j27J63fSEz9nS8zIkVtOe2uX882T6a3eKluaSETS0h6TLVwv
 eOw2dYQ51FQqx9VBcJ89pWgZMsl8O7VQ2Rop/Ea+m7/qvT5qcNH2t1rgXPHI+9KkSRVo
 xDP9xNJMJ1eht4FOZZhVn0PJ89WbsSvXNwXfE/v2zqwaOetS1uF1g0dVI97fJ+3yhcpy
 IyjmaAVfz8eE7b+uZ5gMBxQBxSxB4cFemM3AmhDQAMiHx0ohCv/uQOeAO4tKmpvnY51A
 toH54g0xhXDL9oD4gkLXU5TN7GebG34rbpfDAxobi+wXoAN36ygjI9iybUz9XZFhUw+x 9w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nvgdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 May 2022 10:38:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 16:38:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Tue, 10 May 2022 16:38:43 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 81E6411D3;
 Tue, 10 May 2022 15:38:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: wm9090: Remove redundant endianness flag
Date: Tue, 10 May 2022 16:38:43 +0100
Message-ID: <20220510153843.1029540-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220510153843.1029540-1-ckeepax@opensource.cirrus.com>
References: <20220510153843.1029540-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _gT-9Z_-gtZjMxcLzUWbHeBuZBUS2kpE
X-Proofpoint-GUID: _gT-9Z_-gtZjMxcLzUWbHeBuZBUS2kpE
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
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

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device has no DAI links and as such the flag would have
no effect, remove the redundant flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm9090.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wm9090.c b/sound/soc/codecs/wm9090.c
index 1bae81a7d3908..f7d80f1e37a80 100644
--- a/sound/soc/codecs/wm9090.c
+++ b/sound/soc/codecs/wm9090.c
@@ -543,7 +543,6 @@ static const struct snd_soc_component_driver soc_component_dev_wm9090 = {
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
 };
 
-- 
2.30.2

