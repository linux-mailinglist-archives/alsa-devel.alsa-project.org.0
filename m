Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66445DCA0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 15:47:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1A9B18CC;
	Thu, 25 Nov 2021 15:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1A9B18CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637851644;
	bh=0vBqV2djx4jhmgXU1KrDnqdjD1o6xE1kzvBcRgqK3P0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R31np41N9JjtIqTsS1a6nbDVdTj27PCOxte27LF9b4mjuIkZboavNVKR7lCbdKDgh
	 WKx2DC+G9cIGGTSSbhwGVXXzQ5ocx+QZYUzg3UXoP331wGp2exZO6efY+sAYA8YdeE
	 cQCBNLzGfuADeWYdmx2tzrfg6kA77ZTjCcLEU3p0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4618F804BC;
	Thu, 25 Nov 2021 15:44:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A2B3F804BC; Thu, 25 Nov 2021 15:44:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39903F804AB
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 15:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39903F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="Uk6l0ezK"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AP9OCMP002618;
 Thu, 25 Nov 2021 15:44:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=8TcwlTK97rQnX8N3x7FHRcKkfLTqnGhIJuDXv5FUVZ8=;
 b=Uk6l0ezKrfl9hNDCNgbbup2DhSsUP3mFmeyjs4nnoiw7sEISxDV+5yMrJbXy7d0Uk9TO
 wKpeM6MHGLMkbWWIMKOHsJxp+/cErXhceXd0UkVVrQmz8mCOKveDPpBB+uwyRerc6OQ8
 xUASM40h6LrYEHGZT0y3l0kG4YYRocJb6JmOaZCE7OKZD53dIrKcUEPx5mbFoA0RxESO
 ND2yWgia0QKkuKH0Sid84kYUXRrfYNrq9GYBE7xjDNil6di2hcDnCoErIuihRIH/TqA3
 HNM97ddr7G/N63O4Lr8Oii4Ly67npCEE64VIaybu0GxcQm0D3e4T+aEVaRHFG7uNpDHB ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cj3cykuvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:44:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4537A100038;
 Thu, 25 Nov 2021 15:44:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D788237D97;
 Thu, 25 Nov 2021 15:44:22 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 25 Nov 2021 15:44:21
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@st.com>, "Rob
 Herring" <robh+dt@kernel.org>, <arnaud.pouliquen@foss.st.com>,
 <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH v2 2/4] ASoC: dt-bindings: stm32: i2s: allow additional
 properties.
Date: Thu, 25 Nov 2021 15:40:51 +0100
Message-ID: <20211125144053.774-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125144053.774-1-olivier.moysan@foss.st.com>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Olivier Moysan <olivier.moysan@foss.st.com>,
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

The STM32 SPI peripheral supports both SPI and I2S protocols.
In the SoC device tree the node describes the peripheral as an
SPI peripheral by default. This default configuration can be
overwritten in board device tree to use the IP as an I2S peripheral.
In this case the address-cells and size-cells properties from
SoC DT SPI node should not be checked against STM32 I2S bindings.
Set additionalProperties to "true" to allow these extra properties.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
index 64b70ac539f8..33ba15363c0f 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -73,7 +73,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |
-- 
2.17.1

