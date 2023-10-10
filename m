Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B37BFCAF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 15:03:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEDCA1519;
	Tue, 10 Oct 2023 15:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEDCA1519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696942980;
	bh=Sh4FwepnX+3/weEZwU+Nr8oyG5rQYIAwKYeJ4QK1LWY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iTNceOu0XURN33yWY4xPItP57in4fd+vD18GZ5zpt0vfaAX1LNhX28LF5TvNw2W5b
	 e57e22jY9KI/4lFhLvEu81zR3tgv/oFFbQZJTfIgs/f1zmluY1P+c7KlTsYfx4u9Th
	 JKDFBryweq5eBeF8r6zGSw1conF1OOZzXT0c29o0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8F8EF80587; Tue, 10 Oct 2023 15:02:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17779F8057A;
	Tue, 10 Oct 2023 15:02:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B824CF80563; Tue, 10 Oct 2023 15:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C065F80558
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 15:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C065F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=TEedYziW
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39A88gwi001194;
	Tue, 10 Oct 2023 15:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=UsshDYP9Oqyxk+2EV7ru90DdWl28I8GlDHnWNqkU7MY=; b=TE
	edYziWEWSj3lCxmnFBsto/43XWyTMpKaBArYHTLdbdfGTcR9ry2D/vBqGxnrTxY5
	VUo8A2agpqhWuy21Ql2U168a4DfOOtX+QyD27gfHLxZt17yzcDPSrL0rJLmNbcKB
	K1KjMcRtDYXv1ZLrgX6weidGafFp+OPoNnK4DCnPoWdt6LaG2U9KBoFrY4VQSXEv
	xyDeXkXGRud+vu930gEYWmxLb+NmKYz+cp5UR5Jh64zJzM4udaEtZlGAoSDKgQAt
	gIeuqVlQmV7YGbITCz5vAniTpSOIZsPcXUuKFdXwpXCR4NVmOF4XIYogjcW6R0pC
	e3xS7jYJizcQLzH4U1Bg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhg623je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 15:01:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E16A4100058;
	Tue, 10 Oct 2023 15:01:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6E45231518;
	Tue, 10 Oct 2023 15:01:14 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 15:01:14 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v6 08/11] arm64: dts: st: add RIFSC as an access controller
 for STM32MP25x boards
Date: Tue, 10 Oct 2023 14:57:16 +0200
Message-ID: <20231010125719.784627-9-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_08,2023-10-10_01,2023-05-22_02
Message-ID-Hash: JASAURKZLSKRKBT474MHOIAVJ3QHAHXT
X-Message-ID-Hash: JASAURKZLSKRKBT474MHOIAVJ3QHAHXT
X-MailFrom: prvs=86470762f1=gatien.chevallier@foss.st.com
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

RIFSC is a firewall controller. Change its compatible so that it matches
the documentation and reference RIFSC as an access-control-provider.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V6:
    	- Renamed access-controller to access-controllers
    	- Removal of access-control-provider property

Changes in V5:
    	- Renamed feature-domain* to access-control*

Changes in V2:
	- Fix rifsc node name
	- Move the "ranges" property under the
	  "feature-domains" one

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 5268a4321841..f82318351dcd 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -105,11 +105,12 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		ranges = <0x0 0x0 0x0 0x80000000>;
 
-		rifsc: rifsc-bus@42080000 {
-			compatible = "simple-bus";
+		rifsc: bus@42080000 {
+			compatible = "st,stm32mp25-rifsc";
 			reg = <0x42080000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <1>;
 			ranges;
 
 			usart2: serial@400e0000 {
@@ -117,6 +118,7 @@ usart2: serial@400e0000 {
 				reg = <0x400e0000 0x400>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&ck_flexgen_08>;
+				access-controllers = <&rifsc 32>;
 				status = "disabled";
 			};
 		};
-- 
2.35.3

