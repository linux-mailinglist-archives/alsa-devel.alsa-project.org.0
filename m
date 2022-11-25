Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F92638E54
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B5DB1758;
	Fri, 25 Nov 2022 17:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B5DB1758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669394335;
	bh=7BOt1YQIxBZ2zLTf/I2vQYxagl+FZYUheFzJV5Jx36w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQ++btyrUjEv9tHNS5sH5KTsUm2Z7hYHt/+7vx8+bdCmj/IlmNm02WyR5zN7N/700
	 V0P9dt8gUs9G2lCG+RZ05G/iGfWDC52krS1+c9kj1imD/UjwgQ9cMyll6Zv8mtmFAI
	 d5g3G5cRWftE6uI0FUPOtlF271Gx1xh8L6tNYoH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD2FF800B6;
	Fri, 25 Nov 2022 17:37:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1797F8047C; Fri, 25 Nov 2022 17:37:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A1FF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 17:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A1FF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OsTAzDSQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APEqclc007763; Fri, 25 Nov 2022 10:37:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JOnBe8PaN6BKKGWUSWp01EsxgiZ7afN4H0C4l2ndZOw=;
 b=OsTAzDSQzh4jAINUVYg49rssW+4KWTqOsFNNJvkzZ/ueB1cyRVGNxIApYGPbK5oJ4GQ2
 CS/+mZvftguHzjNbWQlUsRCO+b3NpzCjX+9/rXeywvVaH0Qj3YnrKn13w7vhe67I6Rb9
 yfflKV8YlHcrpiEmHOIDPy4Mi05xWqkv5V9Q0m155KNaXgwUs1y5cIiKlmq9fu7qkUte
 c77U0DQaU4M5zbm40vS8zmn/1zJNt93fSE1DVQ9zRzDkGyzCx//dGk42AgyG0O2iQ+WY
 qRJ9RLKS7+MvR1PTSJbWRfEaEYY5PVnYhMLvXXv7OFej+OlmJh6egLhiTiBDhNs8O9pD hg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6yhc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 10:37:50 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 10:37:48 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 25 Nov 2022 10:37:48 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C4FA9B10;
 Fri, 25 Nov 2022 16:37:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 2/2] ASoC: cs42l51: Correct PGA Volume minimum value
Date: Fri, 25 Nov 2022 16:37:48 +0000
Message-ID: <20221125163748.1288942-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125163748.1288942-1-ckeepax@opensource.cirrus.com>
References: <20221125163748.1288942-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: r9LahVjSgH7wlvUHveYmosLx5W6aPcP4
X-Proofpoint-GUID: r9LahVjSgH7wlvUHveYmosLx5W6aPcP4
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, guille.rodriguez@gmail.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com,
 james.schulman@cirrus.com
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

The table in the datasheet actually shows the volume values in the wrong
order, with the two -3dB values being reversed. This appears to have
caused the lower of the two values to be used in the driver when the
higher should have been, correct this mixup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/cs42l51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 51721edd8f53c..e88d9ff95cdfc 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -143,7 +143,7 @@ static const struct snd_kcontrol_new cs42l51_snd_controls[] = {
 			0, 0xA0, 96, adc_att_tlv),
 	SOC_DOUBLE_R_SX_TLV("PGA Volume",
 			CS42L51_ALC_PGA_CTL, CS42L51_ALC_PGB_CTL,
-			0, 0x19, 30, pga_tlv),
+			0, 0x1A, 30, pga_tlv),
 	SOC_SINGLE("Playback Deemphasis Switch", CS42L51_DAC_CTL, 3, 1, 0),
 	SOC_SINGLE("Auto-Mute Switch", CS42L51_DAC_CTL, 2, 1, 0),
 	SOC_SINGLE("Soft Ramp Switch", CS42L51_DAC_CTL, 1, 1, 0),
-- 
2.30.2

