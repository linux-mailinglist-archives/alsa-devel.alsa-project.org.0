Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAA7B35D0
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 16:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D495E84;
	Fri, 29 Sep 2023 16:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D495E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695998168;
	bh=MNDpD+ZRpRo/H6q3R50ORVBx4KYg7ZFZTvg6EXTA/uI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZSAGJT0y2bZaS8kfMOAolFQQc6f9wfosl28pH69xe1crUdUcZhgqbmcSxXUykUEFA
	 B3jniw5ODomNPa3hGURVv7ciNV/4gX4ZJbEF7H7DLBNMT7/Fu2fgavoKkCxiHh5JYx
	 40fLHPn+kcREYN+YuHe90Cg9ZX4wDeVvkourGC/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E327FF80552; Fri, 29 Sep 2023 16:35:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7184F80552;
	Fri, 29 Sep 2023 16:35:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01002F8016A; Fri, 29 Sep 2023 16:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FD1DF80549
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 16:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FD1DF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=HkndQvwR
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38TAeIGr005143;
	Fri, 29 Sep 2023 16:33:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=YRwFzN9sJrm8EQk5qELoxeRuHtwm/cD9tpyZdSShViU=; b=Hk
	ndQvwR1/l/mOrDDZ0qqDHCXs+sl3GQeMjsWvLG9uwkRU1YiWv2oaH/lO5BYk5vGd
	qLisESIp7symHAU27/jURaTuhQ0BtqQspKYpOHZUFBc2oRMRhk1LhjGITBQSKrGo
	rCtZbrLfLVrZbMGtkYBO/qnfQlLjOj2lcdcZk0+yGf8mjJFVUDAgFaDfehT5lK9D
	35f0r+1+HQuZomGyiHnJBGhEUIdrGU2E6KaBdiiiQ3ksNqpyLYXA93LZjxW9kLfZ
	nlUosoT76h1/JNrMx0ivJDVji8Mj4XmqrX7Hm1ywGb7hImpJTPyYT9YqLoDaKJpe
	o6tV/v/e6Es8KKmFVEPA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3taayj1wcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 16:33:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B186100058;
	Fri, 29 Sep 2023 16:33:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 944EE23BE01;
	Fri, 29 Sep 2023 16:33:01 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 16:33:01 +0200
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
Subject: [PATCH v5 08/11] arm64: dts: st: add RIFSC as an access controller
 for STM32MP25x boards
Date: Fri, 29 Sep 2023 16:28:49 +0200
Message-ID: <20230929142852.578394-9-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_13,2023-09-28_03,2023-05-22_02
Message-ID-Hash: 4TPR64COWQUBD4724ADNMOFTJNZZBV7H
X-Message-ID-Hash: 4TPR64COWQUBD4724ADNMOFTJNZZBV7H
X-MailFrom: prvs=86360455f8=gatien.chevallier@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TPR64COWQUBD4724ADNMOFTJNZZBV7H/>
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

Changes in V5:
    	- Renamed feature-domain* to access-control*

Changes in V2:
	- Fix rifsc node name
	- Move the "ranges" property under the
	  "feature-domains" one

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 5268a4321841..34dbb59e1fe0 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -105,11 +105,13 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		ranges = <0x0 0x0 0x0 0x80000000>;
 
-		rifsc: rifsc-bus@42080000 {
-			compatible = "simple-bus";
+		rifsc: bus@42080000 {
+			compatible = "st,stm32mp25-rifsc";
 			reg = <0x42080000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			access-control-provider;
+			#access-controller-cells = <1>;
 			ranges;
 
 			usart2: serial@400e0000 {
@@ -117,6 +119,7 @@ usart2: serial@400e0000 {
 				reg = <0x400e0000 0x400>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&ck_flexgen_08>;
+				access-controller = <&rifsc 32>;
 				status = "disabled";
 			};
 		};
-- 
2.25.1

