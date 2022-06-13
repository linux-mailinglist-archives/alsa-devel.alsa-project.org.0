Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F6D548DFD
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 18:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5321D1680;
	Mon, 13 Jun 2022 18:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5321D1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655137024;
	bh=S0dAH/CdxW0KHK6zr90B3XVc489hI3J0MsMEsIe41cw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QI8J3Es1YJLzEamTSuIn9jJGH+55/0B0zhuk48jVxcvijAB9yrRspuIOFKnz8nQf9
	 HxDUTaemGJ8GMGx7l2+JxykSRGRWyo9XQl75AzdD+dmwmxNtR8b+oeRUXaI1dKnI9B
	 iHlK3xz2rAcX0mblUawDlN9MJbTOG96ZQMeAuuW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7474F804CC;
	Mon, 13 Jun 2022 18:16:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50FBCF804CC; Mon, 13 Jun 2022 18:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FE41F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 18:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE41F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TGsnFcqG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DBuxUh006945;
 Mon, 13 Jun 2022 11:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oaA7oUhxhYUv3GT9ya+N4kfY6bFaVDi56FfyAbH3CmY=;
 b=TGsnFcqGzzZtTnHDKYCMYRBijkKHSpjBSY5vb/RMpXj1vXoOgQTYsDCIiWVcGO3OsD2l
 eWo15uyZNjCYVraF6AgYar1i6YQWduzXtVE5qop3cegmdixRsNkNPiElDP7h2sEpooXr
 VeSbIyOBa+HEs/ZjE+pmWx7XxpvN6O0reA7lRJdSRsN6tYY2hiQDxfkTgkwwhBuMQby+
 tcHdz5pS7H53eaA234Mrfy/IjGJV0s+3pOFWhb7xPppyvZPbNo5+QTvJYpRewuLNPx11
 ugAw56x4rlr9cZ43MhqHXyKATg9j/ffLvNXtqi4AITGLMeHjI/23DWpjwelr15RvhVUd jQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq24mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Jun 2022 11:15:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 17:15:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 13 Jun 2022 17:15:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D5098458;
 Mon, 13 Jun 2022 16:15:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <samuel@sholland.org>
Subject: [PATCH 2/2] ASoC: mediatek: mt8186: Use new direct clock defines
Date: Mon, 13 Jun 2022 17:15:52 +0100
Message-ID: <20220613161552.481337-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: l8ShZbS2HEhRTIrTc26Mw8OO2G2WDCou
X-Proofpoint-GUID: l8ShZbS2HEhRTIrTc26Mw8OO2G2WDCou
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 wens@csie.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-sunxi@lists.linux.dev
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

Update this driver to the new direct clock producer/consumer defines. It
appears this driver was added with the inversion taken account of but
still uses the CODEC defines so no inversion of the producer/consumer
is necessary.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Note this patch is completely untested, I don't have hardware and the
mt8186 doesn't seem to be included in any makefiles at the moment so I
can't build test either. But the change is trivial and I am pretty
confident I have read the code correctly. It would be good if someone
from Mediatek could have a quick look over though.

Thanks,
Charles

 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
index dfff209b60da4..c6ead7c252f01 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
@@ -585,10 +585,10 @@ static int mtk_dai_tdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
 		tdm_priv->slave_mode = false;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BC_FC:
 		tdm_priv->slave_mode = true;
 		break;
 	default:
-- 
2.30.2

