Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C967EB74
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:48:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8028CE89;
	Fri, 27 Jan 2023 17:47:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8028CE89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674838097;
	bh=DVHxhmA57+qFC63oTvJvlS6T4gX8OnXWB14LnaFmM3A=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lD6I1uwHsOn7OJVPj4mTxh61Xi/CLwH6K9rMVI036aBPSQ6yDTyMnLVwvy1tO8xZg
	 UpdQLRhq40zpTgyaBnEoGXw/CqlxXa/wDYf1r3tUgcoHPr1vGi4SOZTSIdZgj2pvXo
	 oo5VXMw3on2t7T740qVLHjFD079plQXjf9y5KxHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A986F80549;
	Fri, 27 Jan 2023 17:46:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09D84F8007C; Fri, 27 Jan 2023 17:41:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A1DCF801F7
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1DCF801F7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=BjQh+a2g
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RE2pQv007570; Fri, 27 Jan 2023 17:41:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=A6zmRHSUYsMdoUpGI6Iqs9zAp5mpTn+BpeTwOOm0jbw=;
 b=BjQh+a2gyUS4e2SpUe5ml/kLj/8c9clCSCwi7aRP7AfCw04Pmir3sHq9cWxy19gdvaOD
 k7WUOuAelYrcmDrWnNql4fYwM4Apin41sR4xT98In5iqcF6saiUKNUMTgqBMC+C3A5T/
 CWd+hHq68z8T3crOhn8JapMJUB7jDWW+oyRtGNmTSAENesaTuuDRFs2bnNiU8IMfD9SL
 zX42yPG7ub5KpvjONC5tW4gIZ5uDLT22oKWNxPMXauTIepQ7QzlWt/MUg968XhG5bHL+
 5EDrIBWYQ/gYrYVVXBUdsPeZp8Fv9BB0ypr14IBausynlfE7/9Yzy504zHV9Rqi1z4Cq /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n89eqdd7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 17:41:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33B7310002A;
 Fri, 27 Jan 2023 17:41:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15A4421D3EF;
 Fri, 27 Jan 2023 17:41:21 +0100 (CET)
Received: from localhost (10.201.21.177) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 27 Jan
 2023 17:41:20 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>, <jic23@kernel.org>,
 <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
 <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>
Subject: [PATCH v3 0/6] Introduce STM32 system bus
Date: Fri, 27 Jan 2023 17:40:34 +0100
Message-ID: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_10,2023-01-27_01,2022-06-22_01
X-Mailman-Approved-At: Fri, 27 Jan 2023 17:46:04 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Document STM32 System Bus. This bus is intended to control firewall
access for the peripherals connected to it.

For every peripheral, the bus checks the firewall registers to see
if the peripheral is configured as non-secure. If the peripheral
is configured as secure, the node is marked populated, so the
device won't be probed.

This is useful as a firewall configuration sanity check and avoid
platform crashes in case peripherals are incorrectly configured.

The STM32 System Bus implements the feature-domain-controller
bindings. It is used by peripherals to reference a domain
controller, in this case the firewall feature domain.
The bus uses the ID referenced by the feature-domains property to
know where to look in the firewall to get the security configuration
for the peripheral. This allows a device tree description rather
than a hardcoded peripheral table in the bus driver.

On STM32MP13/15 platforms, the firewall bus is represented by the
ETZPC node, which is responsible for the securing / MCU isolating
the capable peripherals.

STM32MP13/15 device trees are updated in this series to implement
the bus. All peripherals that are securable or MCU isolation capable
by the ETZPC are connected to the bus.

Changes in V2:
	- Corrected YAMLS errors highlighted by Rob's robot
	- Re-ordered Signed-off-by tags in two patches

Changes in V3:
	- Document feature-domains property in YAML documentation for
	concerned periperals under the System Bus
	- Fix STM32 System Bus YAML documentation
	- Remove STM32 System bus bindings that were currently used
	as helpers for device tree
	- Correct few errors in driver
	- Add missing peripherals under the System Bus that were in
	SoC variation device tree files
	- Fix node names

Gatien Chevallier (5):
  dt-bindings: treewide: add feature-domains description in binding
    files
  dt-bindings: bus: add STM32 System Bus
  bus: stm32_sys_bus: add support for STM32MP15 and STM32MP13 system bus
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP15x boards
  ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards

Oleksii Moisieiev (1):
  dt-bindings: Document common device controller bindings

 .../devicetree/bindings/bus/st,sys-bus.yaml   |  127 +
 .../bindings/crypto/st,stm32-hash.yaml        |    5 +
 .../devicetree/bindings/dma/st,stm32-dma.yaml |    5 +
 .../bindings/dma/st,stm32-dmamux.yaml         |    5 +
 .../feature-domain-controller.yaml            |   84 +
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |    5 +
 .../bindings/iio/adc/st,stm32-adc.yaml        |    5 +
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |    5 +
 .../bindings/iio/dac/st,stm32-dac.yaml        |    5 +
 .../bindings/media/st,stm32-cec.yaml          |    5 +
 .../bindings/media/st,stm32-dcmi.yaml         |    5 +
 .../memory-controllers/st,stm32-fmc2-ebi.yaml |    5 +
 .../bindings/mfd/st,stm32-lptimer.yaml        |    5 +
 .../bindings/mfd/st,stm32-timers.yaml         |    6 +
 .../devicetree/bindings/mmc/arm,pl18x.yaml    |    5 +
 .../devicetree/bindings/net/stm32-dwmac.yaml  |    5 +
 .../bindings/phy/phy-stm32-usbphyc.yaml       |    5 +
 .../bindings/regulator/st,stm32-vrefbuf.yaml  |    5 +
 .../devicetree/bindings/rng/st,stm32-rng.yaml |    5 +
 .../bindings/serial/st,stm32-uart.yaml        |    5 +
 .../bindings/sound/st,stm32-i2s.yaml          |    5 +
 .../bindings/sound/st,stm32-sai.yaml          |    5 +
 .../bindings/sound/st,stm32-spdifrx.yaml      |    5 +
 .../bindings/spi/st,stm32-qspi.yaml           |    5 +
 .../devicetree/bindings/spi/st,stm32-spi.yaml |    5 +
 .../devicetree/bindings/usb/dwc2.yaml         |    5 +
 MAINTAINERS                                   |    6 +
 arch/arm/boot/dts/stm32mp131.dtsi             |  407 +--
 arch/arm/boot/dts/stm32mp133.dtsi             |   51 +-
 arch/arm/boot/dts/stm32mp13xc.dtsi            |   19 +-
 arch/arm/boot/dts/stm32mp13xf.dtsi            |   18 +-
 arch/arm/boot/dts/stm32mp151.dtsi             | 2722 +++++++++--------
 arch/arm/boot/dts/stm32mp153.dtsi             |   52 +-
 arch/arm/boot/dts/stm32mp15xc.dtsi            |   19 +-
 drivers/bus/Kconfig                           |    9 +
 drivers/bus/Makefile                          |    1 +
 drivers/bus/stm32_sys_bus.c                   |  168 +
 37 files changed, 2208 insertions(+), 1596 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/st,sys-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
 create mode 100644 drivers/bus/stm32_sys_bus.c

-- 
2.35.3

