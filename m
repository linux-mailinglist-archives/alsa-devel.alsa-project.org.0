Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8112DD479
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 16:44:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26EBC18CC;
	Thu, 17 Dec 2020 16:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26EBC18CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608219861;
	bh=pUaZdMR5Hd7gPgaGrI1OmgCscbg/hdMVqnEpEgW1fXE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1YYIfqWvZLPXB7wvqfE96Lpm6x5OZi4IWn0fEZBp9FwX6vlXJFBdSeD/Y5LsCWKh
	 MnMDlh6mjDQDm+/hCGo23sFfcIjMc4oQbwbkSsUoRsmqQZiMzNqGoE30oMTpzBPiD4
	 YGDwJriIg7eO2LUPDDVbGwFB4CLapoJQzqSUwCUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADDD5F804D6;
	Thu, 17 Dec 2020 16:42:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA638F804CB; Thu, 17 Dec 2020 16:41:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3930F800C7
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 16:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3930F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VqrlKQan"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BHFPi9A001634; Thu, 17 Dec 2020 09:41:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=YAEVmqUSTWxDxxY33QVvJnlnd8rBeoEIPPK9oM8cveE=;
 b=VqrlKQanNhvLFwxyiCKqkrwevjyjX6DmKmrSArTMftbgCXacgwl5/bkqLk3O34uxp4IU
 RZSJGdynfkC50Ib/Toth6eZnnD8KhGDO9wKqKjuZ77qjGUK7sQI/yXVNQc59E2i2mYjq
 LH7m8EUgXx81PPrSNrLM2tqtY2Z2DwSG8msvfmRT4md+7Em1+UwNLQazQ9SeFYgpeGPy
 Cfmfemqm5mY9jGyiCgINnYr8Fduecsqcmf1EztA/6CvDWVTh9ZTHhWaZtVHMHuBgEtyh
 6GiJZVHVn7q5Ld/ysQAWE/Rn6DjzFyNhWoyFrVmr7+Rq8aOjKdniFqQUFIOxDVekkrPD +A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35cu5rxy90-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Dec 2020 09:41:49 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 17 Dec
 2020 15:41:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 17 Dec 2020 15:41:47 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.236])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 41F6D11CB;
 Thu, 17 Dec 2020 15:41:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>
Subject: [PATCH v3 4/6] ASoC: madera: Allow codecs to be selected from kernel
 config
Date: Thu, 17 Dec 2020 15:41:40 +0000
Message-ID: <20201217154142.24301-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201217154142.24301-1-rf@opensource.cirrus.com>
References: <20201217154142.24301-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 mlxscore=0
 mlxlogscore=908 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170108
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

The codec Kconfig options were hidden and intended to be selected by
the machine driver that requires them. But that means having either a
dedicated machine driver or building all codecs.

This patch makes the Kconfig options visible so that they can be
selected independently of the machine driver, allowing the codec to be
used with simple-card and other machine drivers that are not hardcoded
to use a fixed set of codecs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 34c6dd04b85a..e8a56f897cc8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -658,23 +658,23 @@ config SND_SOC_CS4349
 	depends on I2C
 
 config SND_SOC_CS47L15
-	tristate
+	tristate "Cirrus Logic CS47L15 CODEC"
 
 config SND_SOC_CS47L24
 	tristate
 	depends on MFD_CS47L24
 
 config SND_SOC_CS47L35
-	tristate
+	tristate "Cirrus Logic CS47L35 CODEC"
 
 config SND_SOC_CS47L85
-	tristate
+	tristate "Cirrus Logic CS47L85 CODEC"
 
 config SND_SOC_CS47L90
-	tristate
+	tristate "Cirrus Logic CS47L90 CODEC"
 
 config SND_SOC_CS47L92
-	tristate
+	tristate "Cirrus Logic CS47L92 CODEC"
 
 # Cirrus Logic Quad-Channel ADC
 config SND_SOC_CS53L30
-- 
2.20.1

