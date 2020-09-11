Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD22265C65
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 11:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B120166A;
	Fri, 11 Sep 2020 11:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B120166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599816175;
	bh=oSwSZia1WSdkoCdBcTyXea4VQv9UyVjgf9OUyypqtoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sR7Kk+VwO9R2ZvxnizkqCydP2ijtOLE0ZgIv5Wrc3hiuyoEUDhWQqgHPatg90b0IH
	 4jn2iPGE4wR14CQNyusYb4YC/ytZR9ipT781frMWFNlxR6qxuyVzhyxyB+5ECot+BR
	 vm5iyanvcrJbxirk0C9SlY5qYLTv7+JyvJr4ilvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E97F2F8028B;
	Fri, 11 Sep 2020 11:20:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8DBEF8028B; Fri, 11 Sep 2020 11:20:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37F84F80240
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 11:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F84F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="JlokXir+"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B9GrU1022506; Fri, 11 Sep 2020 11:20:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3OR8qxZpq3JUZtn+62eu3HHTqXzgdbLMzpf40hJBmi0=;
 b=JlokXir+4V+MLlcPGz7yfLqDge+HwQS//ZGrCDY6Q2ctmwVeySzbg2YiiYCtz9qgF5ND
 NBSI58IRoi7wwyHvDSEVP6/uQSVYKFX0d1eazQKJSruCQzSlCN7q1NaOeBlRtNU8KlpE
 JBM3SkQNR8IUwBf5hjiND2XUKUHXj78oOdjqRDDjOnN0gRNFepP9GsxVLLzqcdC9Efqx
 5xQm4SPUUxhwFdB6qXF7QD6dFJc7FyRkdskms9eG7dZUcXFERcc6y/YJN3zIlKyfVLG8
 QZaR2K20CXkGH4mBKSE9fPYEiFUE6idqcQLB2mQuyc2mrGivTeEZIm4uDB2RJqeV/W9l RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev88a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 11:20:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42FBA100034;
 Fri, 11 Sep 2020 11:20:24 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node5.st.com [10.75.127.81])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DD1721FEBE;
 Fri, 11 Sep 2020 11:20:24 +0200 (CEST)
Received: from localhost (10.75.127.44) by GPXDAG6NODE5.st.com (10.75.127.81)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 11 Sep 2020 11:20:23 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <arnaud.pouliquen@st.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: add mclk provider support to stm32 i2s
Date: Fri, 11 Sep 2020 11:19:51 +0200
Message-ID: <20200911091952.14696-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200911091952.14696-1-olivier.moysan@st.com>
References: <20200911091952.14696-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To GPXDAG6NODE5.st.com
 (10.75.127.81)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_03:2020-09-10,
 2020-09-11 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 olivier.moysan@st.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Add master clock provider support to STM32 I2S.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index f32410890589..6feb5a09c184 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -54,6 +54,10 @@ properties:
   resets:
     maxItems: 1
 
+  "#clock-cells":
+    description: Configure the I2S device as MCLK clock provider.
+    const: 0
+
 required:
   - compatible
   - "#sound-dai-cells"
-- 
2.17.1

