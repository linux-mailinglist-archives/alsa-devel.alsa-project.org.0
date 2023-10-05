Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB57B9DED
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 15:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A98E10;
	Thu,  5 Oct 2023 15:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A98E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696514276;
	bh=i4iN8vIWCvXquUGoamnGNC//zqN609TsIbCsAs7fUT4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e1AM+Q7/pH6tt+9OWFwgG+GJxjlwt/eg16hU9S0/kyT2ldgDkokRLSc721Tlw55cB
	 AKJZsEzKR2csVrDzt0OjtaRHcwD71eb6RSmaaAAIN3GFpJnnt2O//J8gUBEK8ke1vH
	 7NemVNN0blGt4a03Gt3izEO3hAJS6xvAlGiu8FKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DF03F80570; Thu,  5 Oct 2023 15:56:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F728F8055B;
	Thu,  5 Oct 2023 15:56:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA694F8047D; Thu,  5 Oct 2023 15:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8892BF800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 15:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8892BF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UnAH0sPk
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3951p8YT007187;
	Thu, 5 Oct 2023 08:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=w
	sRzsqS86v9R2io/BREZgZukOLd/Xh+KnitIp3oeSoM=; b=UnAH0sPkSxTewImPI
	ixdmOh80k1bZYcAT7i9LUIK/BRFw3zr/i7bjvZahlSxQj72B2LrQog6reIXgYkHs
	JBIYaDbhE4gaf3nwEq7RlHVcT6Y52IyC+ymumGlgbZr56Q430OceZQm+ZsyVGmPH
	T5TjdVwRXJ3DE6AtongtGXwPmxFMUbqQ52LP4q8iNCsif0OJALKwIJ4SGHLSumFH
	9Vz2tIkv6Kz1e7DfeMtFGppP06NlPJIz24Y4/rMuoFm+I+s9Vp6AeRJYArrjU3j4
	dI8cDLPtW5989WrRn6qTHr5pv46h3gw2woFBI9a/SxqvMXHsFQhYqhDdWnLCrJ5C
	9sjsw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3th2dta81a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Oct 2023 08:56:02 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 5 Oct
 2023 14:55:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 5 Oct 2023 14:55:59 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D056B15B9;
	Thu,  5 Oct 2023 13:55:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: cirrus,cs42l43: Update values for bias
 sense
Date: Thu, 5 Oct 2023 14:55:58 +0100
Message-ID: <20231005135559.3117994-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6bYxe0ZonFxfqaawcLpN3SzVYUHHu6Id
X-Proofpoint-GUID: 6bYxe0ZonFxfqaawcLpN3SzVYUHHu6Id
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TMMODGMGFK55ZPQNHSIXBDCLV6VYH2KY
X-Message-ID-Hash: TMMODGMGFK55ZPQNHSIXBDCLV6VYH2KY
X-MailFrom: prvs=5642f9fbf5=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Due to an error in the datasheet the bias sense values currently don't
match the hardware. Whilst this is a change to the binding no devices
have yet shipped so updating the binding will not cause any issues.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
index 4fa22fa70ace5..7f9d8c7a635a6 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
@@ -82,7 +82,7 @@ properties:
     description:
       Current at which the headset micbias sense clamp will engage, 0 to
       disable.
-    enum: [ 0, 14, 23, 41, 50, 60, 68, 86, 95 ]
+    enum: [ 0, 14, 24, 43, 52, 61, 71, 90, 99 ]
     default: 14
 
   cirrus,bias-ramp-ms:
-- 
2.39.2

