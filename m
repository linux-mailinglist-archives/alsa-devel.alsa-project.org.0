Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AC7BF89C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 12:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ABDC14F4;
	Tue, 10 Oct 2023 12:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ABDC14F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696933596;
	bh=eclUJLKE2tn9x0AxY37CzdNYdn06+dFVhjrhoXMhmtc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qg2nbu5YadeBZoJtvy//k6WxR1gDj9Nvr+vPxqHk0PL3NJhiGFFCq4n+3ri+a7ZZU
	 xwdFQz9RZttewqZrWj7TgTLAdEeZbYyLSMlMomapPlkXu/F1fOARqGgfe9A6okkI6C
	 Dlu+6CEu9XGZRCPyQF2/YS785v8SOYz55Bd09apk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76D25F80567; Tue, 10 Oct 2023 12:24:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBB2F8055B;
	Tue, 10 Oct 2023 12:24:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14031F802BE; Tue, 10 Oct 2023 12:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98E6FF80130
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 12:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98E6FF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TRHWt0Ky
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39A7lgWQ020417;
	Tue, 10 Oct 2023 05:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=e
	hQDW4OCxe0t0n3Rmmo3JU4cvesPwbEw+cTH9CpbbjU=; b=TRHWt0KyfnITHppT7
	zr0DPx0XkLolwoKUXlvo2kWOBO7nP5uXj7B2py7ym9HD6qqXrAdkU7lWLfWgGst8
	RUxbPrDF0vvnszlfwEvecxV0d/uP6vuzmnxztOi961YpVh9pmvMWagGvcCJd8Fke
	JXSN5dQX8IKR73r3XMCFfv2B4IIPJg/O/5wSHL8e4PDOl6kLWBQJsl+KKVtUwxPv
	PcKbt6CMFQx+JZyVBES1Ra0r5hRif0oAzZc8iaCSeRc0IVA04jLPtYcZLuwjrRK+
	I8IbwQUeOdzHZ4ZKvYCpBGvOgruIDm2DBCqNwUAdId27Fhxfm+sNvFBBmGzexgi/
	DWxAA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3tkhhaj8w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 05:24:27 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 10 Oct
 2023 11:24:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 10 Oct 2023 11:24:26 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0F69746B;
	Tue, 10 Oct 2023 10:24:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: cirrus,cs42l43: Update values for
 bias sense
Date: Tue, 10 Oct 2023 11:24:24 +0100
Message-ID: <20231010102425.3662364-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2sswtg7ynSaiV0-6SsqCawI4igxNZL1j
X-Proofpoint-GUID: 2sswtg7ynSaiV0-6SsqCawI4igxNZL1j
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AAF54J23ICSJEN6M6BE2FCKJ5KDFJ22C
X-Message-ID-Hash: AAF54J23ICSJEN6M6BE2FCKJ5KDFJ22C
X-MailFrom: prvs=5647b14960=ckeepax@opensource.cirrus.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AAF54J23ICSJEN6M6BE2FCKJ5KDFJ22C/>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Just rebased on v6.6-rc5. Worth noting the conflicting patch was:

aa7627111c68 ("ASoC: dt-bindings: ASoC: cirrus,cs42l43: Update a couple of default values")

Thanks,
Charles

 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
index 7a6de938b11d1..4118aa54bbd55 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
@@ -82,7 +82,7 @@ properties:
     description:
       Current at which the headset micbias sense clamp will engage, 0 to
       disable.
-    enum: [ 0, 14, 23, 41, 50, 60, 68, 86, 95 ]
+    enum: [ 0, 14, 24, 43, 52, 61, 71, 90, 99 ]
     default: 0
 
   cirrus,bias-ramp-ms:
-- 
2.39.2

