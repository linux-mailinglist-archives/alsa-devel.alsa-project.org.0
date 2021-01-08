Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF01A2EF572
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 314BB16AA;
	Fri,  8 Jan 2021 17:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 314BB16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610122030;
	bh=zke0cwuYWPy87yWbSu/IGJK4NZo9qlg+tKhtBHwPB5U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjJ4Ghdwgu3NkUr+EMBTylPFoQgtiJd+nnfTj6WsKip99xIJ1e1w/XKFRw7TpzMXs
	 4rZ3TYr7KiVpVLORQF9TkBdiqSUK5DgDgTF6o7M6T4u0QZyAt15KVdJNtS9OVX2BDy
	 yLjSutjvpR3ByK1A2YomYMeR9wJM1XsR4Kdf62/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C37AF80166;
	Fri,  8 Jan 2021 17:05:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 853F1F80166; Fri,  8 Jan 2021 17:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0B4CF80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B4CF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VpR7EusF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 108G2BWD031086; Fri, 8 Jan 2021 10:05:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=jmswdNoeuPYWCu6tey6zuSVbEdkvG2AmuQ5MyVpdB2c=;
 b=VpR7EusFX0phly5iHULIsqN9p97CEPVAs6UxmRFXEeo+5F0YWVrijVtBsO5/O8/eKaEL
 Ab95v9E3YAuDpDRu5QbtXJqFz+U2oMSMdZbVKQuDIUOFyKhPeDhJb8PVkMdU4cbMR2XE
 tWVq1pEOEJUdY5V+9ErETJDSR70BNQjVmwzkMQzd9oQ9ldZlmoFL85Z7M2eKUcoNL7c0
 vlpNLI04sBpjTNFGiUcptWlO02Ql3lxGwqS4LYLDiYOggZ08Waz+IECmvwLmFm+mVOPD
 j6UKrXZ69Kfw7r2GSxwrXcrYGRw3scjuxGL8xUbyZkk9bV3aJwkFAPAvm1N8QqFHxe8V ew== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 35wqjm2gnm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Jan 2021 10:05:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 8 Jan 2021
 16:05:08 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 8 Jan 2021 16:05:08 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.226])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2510811CC;
 Fri,  8 Jan 2021 16:05:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>,
 <f.fainelli@gmail.com>
Subject: [PATCH v4 4/6] ASoC: madera: Allow codecs to be selected from kernel
 config
Date: Fri, 8 Jan 2021 16:04:59 +0000
Message-ID: <20210108160501.7638-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108160501.7638-1-rf@opensource.cirrus.com>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=978
 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101080091
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
index 9bf6bfdaf11e..599dd8d2577f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -678,23 +678,23 @@ config SND_SOC_CS4349
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

