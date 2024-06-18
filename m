Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC190D875
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 18:11:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 727AD9F6;
	Tue, 18 Jun 2024 18:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 727AD9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718727071;
	bh=kZKXbV0lhStB0O+275SN390lj+8/FT/2I41VGYaOVP0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bZF+TRBAeWNe1CXSsnWoqsGi21PPc5/4oW4dj00XsrVd7FXsWrjuQN5qzp+DUZ4UZ
	 ZwYDoU9kbNKPTXvYgkwKYflEwSBo73nb+4jv1uN8njpg8vJx+axWa27v34L/kfONHm
	 xLKpGObaDMwCk/xOvxUhgn89myT/GLkBCv6voFDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A9EFF804D6; Tue, 18 Jun 2024 18:10:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC251F804D6;
	Tue, 18 Jun 2024 18:10:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 142C0F8023A; Tue, 18 Jun 2024 18:10:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 914A4F801EB
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 18:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914A4F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=FpKjfsjY
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45IG79xx022142;
	Tue, 18 Jun 2024 18:10:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=z5NFMMQZPHGp3gWcmS7/W4
	PryNOHDlUiWMV40ZjgePg=; b=FpKjfsjYe0UVIP+QQtTdvaQXnWCVXGDk+0nyYT
	VMrq1aGxqwh/BYEyjx3zPbzo4w55eDVXrVlD/TeEnDZTjYvKJWZigq8PWceQ9fxq
	RMvKyGzBH7TngcD/ZVRei/LQJsyCqg8Ry26HFoLH6/LUSX9PpW2+pA4mo8KN+IPZ
	+9kHhGS1oBmpg5xq3ddYoBvU83HAfqMnpGBYn1LgPHy+Jda/4E2ljDNmiYcbqIcV
	Y1XPxuGv01WZC5jFnjZKcK8iDW6ckcyNRNFAG7fQPDKNTBb7lPbaSRwKcq0chGsK
	A9ZX/ikCiuhqnjRyik2IA+OmiIQj+WzvQY55sMVdCbd416NA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys1ucv1py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 18:10:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5C25040044;
	Tue, 18 Jun 2024 18:10:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 612BA21D3C9;
	Tue, 18 Jun 2024 18:09:22 +0200 (CEST)
Received: from localhost (10.252.27.64) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 18:09:22 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olivier Moysan
	<olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nuno Sa
	<nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown
	<broonie@kernel.org>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/8] iio: adc: dfsdm: add scaling support
Date: Tue, 18 Jun 2024 18:08:26 +0200
Message-ID: <20240618160836.945242-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.27.64]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
Message-ID-Hash: A2VGJWCJ7PUEYUF7VVH465EBHAWCOMDB
X-Message-ID-Hash: A2VGJWCJ7PUEYUF7VVH465EBHAWCOMDB
X-MailFrom: prvs=68998c6755=olivier.moysan@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2VGJWCJ7PUEYUF7VVH465EBHAWCOMDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The aim of this serie is to add scaling support to STM32 DFSDM
peripheral in the analog context.

The DFSDM currently operates as a consumer of IIO channels
provided by a generic SD modulator. As previously discussed in RFC [1],
this topology is not suitable for implementing scaling.

This series brings the integration of the DFSDM driver with the new 
IIO backend framework [2], enabling the DFSDM IIO device to offer 
scaling feature based on reference voltage data obtained from the
IIO SD modulator backend. This generic SD modulator backend takes the
place of the former SD modulator, used with legacy implementation.

The DFSDM driver has been updated to adopt the generic ADC channel
binding [3]. The reasons for this include:
- Reducing the use of proprietary properties
- Simplifying the coexistence of legacy and new backend bindings
- Prepare the support of the MDF peripheral on STM32MP25 SoC

Backward compatibility is maintained through legacy support.

This series extends the backend framework with the following APIs 
(which may need further refinement):
- read_raw:
	This API is intented to retrieve the voltage information from the
	backend. It is based on IIO read_raw API, but maybe we need
	a more specialized API here.
- iio_backend_disable / iio_backend_enable:
	backend enable/disable to be used for PM management
- devm_iio_backend_subnode_get
	Intended for parsing DT subnodes to allow generic channel binding
	support, as generic channel DT nodes are not populated as devices.
	Ideally, a single API would be better, but I could not 
	identify a suitable alternative that doesn't affect the existing API
	(devm_iio_backend_get).

[1]: https://lore.kernel.org/lkml/20200204101008.11411-1-olivier.moysan@st.com/
[2]: https://lore.kernel.org/all/20240206-iio-backend-v9-0-df66d159c000@analog.com/
[3]: devicetree/bindings/iio/adc/adc.yaml

Olivier Moysan (8):
  iio: add read raw service to iio backend framework
  iio: add enable and disable services to iio backend framework
  iio: add child nodes support in iio backend framework
  dt-bindings: iio: dfsdm: move to backend framework
  dt-bindings: iio: add sigma delta modulator backend
  iio: adc: stm32-dfsdm: adopt generic channels bindings
  iio: add sd modulator generic iio backend
  iio: adc: stm32-dfsdm: add scaling support to dfsdm

 .../iio/adc/sd-modulator-backend.yaml         |  43 +++
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 158 ++++++++-
 drivers/iio/adc/Kconfig                       |  11 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/sd_adc_backend.c              | 110 +++++++
 drivers/iio/adc/stm32-dfsdm-adc.c             | 302 +++++++++++++++---
 drivers/iio/industrialio-backend.c            |  90 +++++-
 include/linux/iio/backend.h                   |   7 +
 8 files changed, 664 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/sd-modulator-backend.yaml
 create mode 100644 drivers/iio/adc/sd_adc_backend.c


base-commit: 7db8a847f98caae68c70bdab9ba92d1af38e5656
-- 
2.25.1

