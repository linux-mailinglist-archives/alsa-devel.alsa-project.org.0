Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8D51AA41
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF0C175A;
	Wed,  4 May 2022 19:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF0C175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684790;
	bh=nKObHZpfBoAQxBJsSCpIcE15bN7MnEbCK4aOhOv8M4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TYXK7xAo5S/dNVMgpsjBIhItxKn+Xu6guNTjJOh9AaURsWxzMjrl0N+mc8YOLSQ2C
	 CBactRTR4fwrF35yVV+Juynbab3ino/ivTL6neFtc0DvmL6N1fSBpULxog16d1eXH8
	 GkWhBdRU8TOxto+wcpWFQo2VRiPiiabMla2bmK0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9911F80526;
	Wed,  4 May 2022 19:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0816AF80607; Wed,  4 May 2022 19:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D87C9F80519
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D87C9F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EWolbUiG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqO001835;
 Wed, 4 May 2022 12:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4VbmYjUMoZKa4PhAJfmG3feKfzd1hOblf/idtuGHkvc=;
 b=EWolbUiGk1weT494ErDQR1kBHtn2+AH5s+muHxpARNwqHzobmQNhWC6zb2Ftr+IDcyEh
 9ud4ptQwPApfC3MUJfCbxlLoJg5Q3LeATzBYKr8X+AaAT3sTLtF/G4ivzqVNftwawkd5
 rL4gjBdWlfzY/UrKJzgzBTDppdUcVAZlCYlg1Dq1PbisoHmvDM/lsEy2tex0sQBnEgeN
 gSTByZ+v9KUPo4ieqIAPFg1V9szbsjvX5H3ydCHgcy7FWMR4xrMm8mofEZRcg4G7E/Nu
 IiqBljkbNDF97AL7RDl6u17zHWILlnUXzwGmKZzqviuyTJmRjEzwJI+ublFgMbw7lfRS 7A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-20
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2F33011D4;
 Wed,  4 May 2022 17:09:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 34/38] ASoC: rt1308-sdw: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:01 +0100
Message-ID: <20220504170905.332415-35-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3MJRWWDKVbOLR2bSfAfns-UWExb4VeVO
X-Proofpoint-GUID: 3MJRWWDKVbOLR2bSfAfns-UWExb4VeVO
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, kmarinushkin@birdec.com,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 chrome-platform@lists.linux.dev, codrin.ciubotariu@microchip.com,
 alsa-devel@alsa-project.org, bleung@chromium.org, cychiang@chromium.org
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
link. This device receives audio over a SoundWire DAI and as such
should have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1308-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 1ef836a68a56f..1c11b42dd76e0 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -615,6 +615,7 @@ static const struct snd_soc_component_driver soc_component_sdw_rt1308 = {
 	.num_dapm_widgets = ARRAY_SIZE(rt1308_dapm_widgets),
 	.dapm_routes = rt1308_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(rt1308_dapm_routes),
+	.endianness = 1,
 };
 
 static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
-- 
2.30.2

