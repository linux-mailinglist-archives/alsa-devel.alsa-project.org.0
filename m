Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0B051A894
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41321688;
	Wed,  4 May 2022 19:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41321688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684293;
	bh=USKDwQRr7WWEjh4rpX0pu7cT6wfK60f2ePXNOrdZFJw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/qCnynrxwK1JDy2WtFp5/sBxIgpSrPSqib6TM28mBPCvKYtZlOl5ItkjSVTLc1Qz
	 QYKhyctKadnhTslrGR41PqGNT7h51qnqVD4rJDoCua/jIOh8+slE/c1aQ/8QwIvX3Y
	 asNIMKNLh9nBQNvs5EymoMnMSpNF+jVYwGeQASng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1AAF80538;
	Wed,  4 May 2022 19:09:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1A84F80533; Wed,  4 May 2022 19:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AADD5F80166
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AADD5F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IVSgAPrH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq3001835;
 Wed, 4 May 2022 12:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=nYqn+GKDwKK25SWBWrV7lsZ0+GOZYWJKCzdENLiH9ww=;
 b=IVSgAPrHiyeXAxkKJRIj3MjXdfnaaFqhINpR1iewvscmkwA+fwtjsIpdomwDpVx9aiHQ
 p+8o32SAma5kWk3159tEYMzKODmo7Fpk4a6xSB3kA1MSLJIPguYUmN2T6TXwaxKM3TNG
 0H+9yNo3vQM9aMVZBnmSWHX0P8ejLIuPjgRV6t9Yhv6OBNv2Qto/607putTI2d2jZA64
 l5q2VjZpzk3expIu4ISxXt535LYtERC8jQzrR6DugxzZ4qO/CnwN8hGu3RwE77tatxgr
 qezTANdCYDusj86YeEoDJom7t/wNORMQre5GBswT0kGs62GI/xqlY7LOrHweaBlJekbn 8g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 330FFB10;
 Wed,  4 May 2022 17:09:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness flag
Date: Wed, 4 May 2022 18:08:28 +0100
Message-ID: <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7cO-NHnns4JYpS7pti-6iw9cMIvGoLBc
X-Proofpoint-GUID: 7cO-NHnns4JYpS7pti-6iw9cMIvGoLBc
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

Add a comment to make the purpose of the endianness flag on the
snd_soc_component structure more clear.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 766dc6f009c0b..5a764c3099d3e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -169,6 +169,15 @@ struct snd_soc_component_driver {
 	unsigned int idle_bias_on:1;
 	unsigned int suspend_bias_off:1;
 	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
+	/*
+	 * Indicates that the component does not care about the endianness of
+	 * PCM audio data and the core will ensure that both LE and BE variants
+	 * of each used format are present. Typically this is because the
+	 * component sits behind a bus that abstracts away the endian of the
+	 * original data, ie. one for which the transmission endian is defined
+	 * (I2S/SLIMbus/SoundWire), or the concept of endian doesn't exist (PDM,
+	 * analogue).
+	 */
 	unsigned int endianness:1;
 	unsigned int non_legacy_dai_naming:1;
 
-- 
2.30.2

