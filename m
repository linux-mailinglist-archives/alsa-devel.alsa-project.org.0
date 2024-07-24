Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD693B416
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 17:45:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67002E85;
	Wed, 24 Jul 2024 17:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67002E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721835921;
	bh=axlpV6JSOMpwViy5zK5sk4CqpYlgmQDwfFgRCua7VAk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k/zWroIVQ8mnxyxvJreUi4GnrA1oua/yrm+hPt3OeUuly6OwRFT0qt/06tmBxdHNy
	 TTwgM+OBZA0hEtGOoFqlvIRi1050KbO8Q7YU3iao3KiGyxF1x+HVEi7OeTe3OdPIED
	 24sWSzUscHtwVF1FGyLWRHyJTSJ5LVlr1Ex0n8Rw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD431F805BB; Wed, 24 Jul 2024 17:44:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F87F805AF;
	Wed, 24 Jul 2024 17:44:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A14DF8026D; Wed, 24 Jul 2024 17:39:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B6CFF8007E
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 17:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B6CFF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=KH8JIolz
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46OAuBKg025611;
	Wed, 24 Jul 2024 17:38:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=5e/bBHkAvYeYOa7Vq1i1fQ
	+yXa4HHwh9qRhHcKe0cQ0=; b=KH8JIolzJRP7CA2TbDg1cGPB7ToUpJAxMelsae
	AKj6SD/27t74+xBSN3gVbQPZMg1SCeLzJFBqdFmrLwWkAjy5yrMGMMPUkIFqjCZd
	gc3+B9dypNnFhmz5MD5Y7UvfzYPhF7NVLWlQiC3eCSumlNI5vDjpKXxYAQ9tLH6B
	02K3XGyKwOmw+aSU+5a3OL78APvmgJGOGoENIpNAS/09ZYPenDTUv39U686IcXrV
	LasrHLMJE2OTvDiOPkxKYopBff019vgsFDovCjQoI0wqhiUPo2qc0ubyfdJem2I+
	iVbd1FZL2q7orORl+PrRZrMlXeCwIRBEYh+3gKqAdLAahIqw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40gr6j5x09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 17:38:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B40C940045;
	Wed, 24 Jul 2024 17:38:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36D6E240079;
	Wed, 24 Jul 2024 17:37:27 +0200 (CEST)
Received: from localhost (10.252.12.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 24 Jul
 2024 17:37:26 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nuno Sa
	<nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown
	<broonie@kernel.org>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 0/9] iio: adc: dfsdm: add scaling support
Date: Wed, 24 Jul 2024 17:36:28 +0200
Message-ID: <20240724153639.803263-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.12.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_15,2024-07-24_01,2024-05-17_01
Message-ID-Hash: 7I4C7WAU45T3HWVWIDUJ7LR227V3NQDG
X-Message-ID-Hash: 7I4C7WAU45T3HWVWIDUJ7LR227V3NQDG
X-MailFrom: prvs=7935aa3e7e=olivier.moysan@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7I4C7WAU45T3HWVWIDUJ7LR227V3NQDG/>
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

This series extends the backend framework with the following APIs:
- iio_backend_read_raw:
	This API is intented to retrieve channel attributes from the
	backend. It is based on IIO framework read_raw API.
- iio_backend_read_scale / iio_backend_read_offset
	Dedicated APIs to read scale and offset channel values.
- iio_backend_disable / iio_backend_enable:
	backend enable/disable to be used for PM management
- devm_iio_backend_fwnode_get
	Intended for parsing DT subnodes to allow generic channel binding
	support, as generic channel DT nodes are not populated as devices.

[1]: https://lore.kernel.org/lkml/20200204101008.11411-1-olivier.moysan@st.com/
[2]: https://lore.kernel.org/all/20240206-iio-backend-v9-0-df66d159c000@analog.com/
[3]: devicetree/bindings/iio/adc/adc.yaml

Changes in v2:
- Update enable/disable backend API
- Rename devm_iio_backend_subnode_get(), as devm_iio_backend_fwnode_get()
- Update iio_backend_read_raw() prototype to fully match IIO framework
  read_raw callback prototype.
- Change st,adc-channel-type property name and type in DFSDM binding
- Remove sd-backend and rename ads1201 compatibles in SD binding

Changes in v3:
- Add iio_backend_read_scale and iio_backend_read_offset
- Remove sd-backend compatible. Adapt existing sd modulator driver and
  binding to support backend topology.
- Misc corrections in DFSDM binding & minor changes in DFSDM driver

Changes in v4:
- Remove allOf and rework examples in SD modulator binding
- Wrap lines to 80 characters in IIO code

Changes in v5:
- Move iio_backend_read_scale and iio_backend_read_offset to inline
  and update prototype
- Fix channel number & remove legacy binding example in DFSDM binding
- Rearrange DFSDM patches to fix build issue in serie
- Split SD modulator binding patch.
  Move reference voltage change in a separate patch

Olivier Moysan (9):
  iio: add read scale and offset services to iio backend framework
  iio: add enable and disable services to iio backend framework
  iio: add child nodes support in iio backend framework
  dt-bindings: iio: dfsdm: move to backend framework
  dt-bindings: iio: add backend support to sd modulator
  dt-bindings: iio: add vref support to sd modulator
  iio: adc: stm32-dfsdm: adopt generic channels bindings
  iio: add iio backend support to sd modulator
  iio: adc: stm32-dfsdm: add scaling support to dfsdm

 .../iio/adc/sigma-delta-modulator.yaml        |  25 +-
 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 124 +++++++-
 drivers/iio/adc/Kconfig                       |   2 +
 drivers/iio/adc/sd_adc_modulator.c            |  92 +++++-
 drivers/iio/adc/stm32-dfsdm-adc.c             | 293 +++++++++++++++---
 drivers/iio/industrialio-backend.c            | 101 +++++-
 include/linux/iio/backend.h                   |  29 +-
 7 files changed, 593 insertions(+), 73 deletions(-)


base-commit: 472438c7e0e2261c6737a8321f46ef176eef1c8f
-- 
2.25.1

