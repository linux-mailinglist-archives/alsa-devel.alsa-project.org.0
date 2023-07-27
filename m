Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6536A7656C0
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 17:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C5DA847;
	Thu, 27 Jul 2023 17:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C5DA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690470291;
	bh=sYAFTE79+RoX0LsvWor3HthbARpspjQmix6P+HTVRLs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XBXTVAF2FLMocsB0GFnZ9bHF5DGQYhv2m/9SDoFP2l990lthWGJKJQVgc9GUnZOtI
	 YHh8GjSX8G355C43UpaW12KpA3whEhB19tDiLM0FhnoGQ0yTo6mzt5uP0jXBf6dLlS
	 cic/0ARcNYebzpmqUxZ5DLhIl7S6O+U0kVkRFa+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E759F801F5; Thu, 27 Jul 2023 17:04:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C4AF80163;
	Thu, 27 Jul 2023 17:03:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F668F8019B; Thu, 27 Jul 2023 17:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 599B4F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 17:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 599B4F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=WKh8WR22
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RBD8l4020221;
	Thu, 27 Jul 2023 17:03:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=doC1Pd1d3NibZb37WWHiE70DKjD6XTr1B8pDdUXXdeU=;
 b=WKh8WR22AxBJ/QxFWaS3op28d0rl7a8Nyuf6roe+2yyfevhAi98xg0CqHDltNkrDgyCQ
 cNGzI37Wav5oon8GfmjPvsK5pvTKyvP5Li5Saxd7N15R8t87i/2RCDrx3Yoqj/haszej
 HsgcbTr9VqAs50j6UB6X28DAq7G5/Mx6ah0v/eg4zZUVfyeLLhX2MHCmJgLSDWST6NIB
 r9bRDSvd10mF/j4yGAj88HdwyJ54sPzWV5wF+J/hMKLnx0od6XRv09VPyNNSDi8LKtla
 xQ6DWpi3LzqPNU++36daT5H/8/mF2t15BFr7jtJWvhBOotJ202ikt8n3HS0WS3xpGXy4 8w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s3qgy97v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 17:03:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4313010002A;
	Thu, 27 Jul 2023 17:03:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3859B209BA1;
	Thu, 27 Jul 2023 17:03:35 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Jul
 2023 17:03:34 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Frank Rowand
	<frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [RFC v2 00/11] iio: add iio backend device type
Date: Thu, 27 Jul 2023 17:03:11 +0200
Message-ID: <20230727150324.1157933-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
Message-ID-Hash: KUW22GVIPNANOBKDTQBGC43IVJDMZPVH
X-Message-ID-Hash: KUW22GVIPNANOBKDTQBGC43IVJDMZPVH
X-MailFrom: prvs=5572493f00=olivier.moysan@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUW22GVIPNANOBKDTQBGC43IVJDMZPVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This v2 is an addon to initial RFC:
https://lore.kernel.org/lkml/20230623140944.2613002-1-olivier.moysan@foss.st.com/

Despite the "IIO backend" naming has to be changed (as pointed out by
Jonathan previously), it has been kept here, for time being. The
appropriated naming still has to be discussed later on.

In the previous RFC the "IIO backend" concept was proposed through
a set of template APIs.

This v2 implements a functionnal exemple based on STM32 DFSDM,
to bring scaling support to this peripheral.

Olivier Moysan (11):
  iio: introduce iio backend device
  of: property: add device link support for io-backends
  dt-bindings: iio: stm32-dfsdm-adc: add scaling support
  dt-bindings: iio: adc: add scaling support to sd modulator
  iio: adc: stm32-dfsdm: manage dfsdm as a channel provider
  iio: adc: stm32-dfsdm: adopt generic channel bindings
  iio: adc: stm32-dfsdm: add scaling support to dfsdm
  iio: adc: sd modulator: add scale and offset support
  ARM: dts: stm32: adopt new dfsdm bindings on stm32mp151
  ARM: dts: stm32: add dfsdm pins muxing on stm32mp15
  ARM: dts: stm32: add dfsdm iio support on stm32mp157c-ev

 .../iio/adc/sigma-delta-modulator.yaml        |   9 +-
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 189 ++++++------------
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   |  39 ++++
 arch/arm/boot/dts/st/stm32mp151.dtsi          |  18 +-
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  68 +++++++
 drivers/iio/Makefile                          |   1 +
 drivers/iio/adc/sd_adc_modulator.c            | 106 ++++++++--
 drivers/iio/adc/stm32-dfsdm-adc.c             | 187 +++++++++++------
 drivers/iio/industrialio-backend.c            | 107 ++++++++++
 drivers/of/property.c                         |   2 +
 include/linux/iio/backend.h                   |  56 ++++++
 11 files changed, 561 insertions(+), 221 deletions(-)
 create mode 100644 drivers/iio/industrialio-backend.c
 create mode 100644 include/linux/iio/backend.h

-- 
2.25.1

