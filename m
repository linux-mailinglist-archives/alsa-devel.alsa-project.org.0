Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8385684B3AA
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 12:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6890200;
	Tue,  6 Feb 2024 12:39:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6890200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707219606;
	bh=VT/+OxIyoOo6H3eZuB5ps/bmedQcEHIv03PdGa9zsOc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U1tWjSI9rpNcMP/dtXPpE2RDkRwmaYrdiJ2/nQLXSyqlaV/OSJR3+feF74QCj9mbz
	 GNtF+DDgNshNzDRZhXhI3SnFVPZj7TER+kUv91XYe8/4qOSBZfC6vOC9hMPMfgsozW
	 R0AnZMwOIuPfmcpllHSWPguq8Ykv08SqrpCBQTv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D76FDF805BD; Tue,  6 Feb 2024 12:39:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7CDCF805CB;
	Tue,  6 Feb 2024 12:39:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BACB4F801EB; Tue,  6 Feb 2024 12:39:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7D35F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 12:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7D35F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=l6+/Q2KZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 416AS7om031521;
	Tue, 6 Feb 2024 05:38:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=U
	3jrdINzTbzsq4ZEzk9Ff+i2j8C7e/Bjf0XM9izjTuE=; b=l6+/Q2KZtA7BAUY41
	pBTB19kdyapEFJhsEUz2Y1Q7CRrZJOLHKUDYtxQsrQoZYkC8g9ImnEzQAc+w4qFz
	5x4PyOwfHd21l6GcL2NKlNGU+sFuTrDnl4JFieLpvOHvEACj+D5TQ2KKm+ARUTkb
	ejv1spRZGsBkKLJqWLUxF7zTakCGQ7wJi51zLj3dWjZrZbTbOvlYzk0XchHgNcl9
	nXfAb5dyZN5LciNpap9a/OZGjFKWw16PGLCIPfVUi/8mB3G7jOEpj/kCvbyafz5H
	8iI8s7xRwveH6i7aocFLXGQTbH2WxVwcWpN2R302tH5qhRqQtpG/UlbJ5mfbb0v8
	aZe/g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2bap3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 05:38:52 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 11:38:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 11:38:50 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2E016820241;
	Tue,  6 Feb 2024 11:38:50 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: cs42l43: Handle error from devm_pm_runtime_enable
Date: Tue, 6 Feb 2024 11:38:49 +0000
Message-ID: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uCVt0nHFigik6zGnt1jeAwXSiXzMyFIa
X-Proofpoint-ORIG-GUID: uCVt0nHFigik6zGnt1jeAwXSiXzMyFIa
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IGSOONMBG4EFS3MASYDENFXZM7ZH5UHL
X-Message-ID-Hash: IGSOONMBG4EFS3MASYDENFXZM7ZH5UHL
X-MailFrom: prvs=9766772a2b=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGSOONMBG4EFS3MASYDENFXZM7ZH5UHL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As devm_pm_runtime_enable can fail due to memory allocations, it is
best to handle the error.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 256767ef4c03..f1e119277622 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2283,7 +2283,10 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(priv->dev);
 	pm_runtime_set_active(priv->dev);
 	pm_runtime_get_noresume(priv->dev);
-	devm_pm_runtime_enable(priv->dev);
+
+	ret = devm_pm_runtime_enable(priv->dev);
+	if (ret)
+		goto err_pm;
 
 	for (i = 0; i < ARRAY_SIZE(cs42l43_irqs); i++) {
 		ret = cs42l43_request_irq(priv, dom, cs42l43_irqs[i].name,
-- 
2.30.2

