Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B2724180
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 13:59:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55CE9823;
	Tue,  6 Jun 2023 13:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55CE9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686052747;
	bh=eDETaWd0iMtsugBwp+4YXSDWu6NjjHkUp3CQAEU3CaQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ipyg8pLkORMusUmAYg6qcwqu6w0Oay2ug0C5bW7wE+5DAeAnW7jkMA57VBjiGGfw8
	 KWzB8yA2L1lOVq6VYSM6n66JOobKstluW08FruLxtEkZdKeOBtEajokp9zfBs0SqEs
	 pi1T0Y1MXdoC32x3+jaUOrTrcHtqBf9d+M5kBvfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 427F0F804DA; Tue,  6 Jun 2023 13:57:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CE9CF8016C;
	Tue,  6 Jun 2023 13:57:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F096CF80290; Tue,  6 Jun 2023 13:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1264F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 13:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1264F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=TwjC20W0
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3568Pucb004495;
	Tue, 6 Jun 2023 13:57:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=+QFsuZdE66Bb7uRQiJHsVqVL3CZ42NwQ6vPMIiT1SPE=;
 b=TwjC20W0ZfeiHe/s5oyEkOo097BxXxDdIiBCs/i+MeRMEUWgGjFRmwkyi11rYSwXou63
 MCU+y8uPni72YzkBvRiBrw7p3L1dbAik3xM3wpSaK4Tlg1ArnJEV3PF4poZsICGQTAXh
 p+n3hv+pkhxLdpSpVdVlUURLhUo3n5RYpChNjliK8+kkOsGMVhrHwi+5JutPxuFkL/JH
 lz/KV+cIAGSVhYJAaxDHd/a7tw46BXKsHwH3pxhwOOUqGk/pz4b3a2VH4xxF38fQiJA+
 zQT9umkmw4z2fHlQJaaVaY/Wf7KvbFXwCT8WySF8QnvnIriHkv+pEN+ySi/uXUE52O2w Nw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r219escb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 13:57:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC67210002A;
	Tue,  6 Jun 2023 13:57:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 930E421D3B3;
	Tue,  6 Jun 2023 13:57:43 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 6 Jun
 2023 13:57:43 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Alexandre Torgue <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] ASoC: stm32: fix dtbs_check warnings
Date: Tue, 6 Jun 2023 13:56:01 +0200
Message-ID: <20230606115605.1633595-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
Message-ID-Hash: RMM6CQHU6PRH2B6DOL5VCE6BYHSMGGNL
X-Message-ID-Hash: RMM6CQHU6PRH2B6DOL5VCE6BYHSMGGNL
X-MailFrom: prvs=45217e30f3=olivier.moysan@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMM6CQHU6PRH2B6DOL5VCE6BYHSMGGNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix dtbs_check warnings in STM32MP15 DK boards Devices Trees for
STM32 I2S and Cirrus CS42L51 codec.

- Add OF graph port property in I2S and CS42L51 DT bindings.
  Fixes warnings:
  audio-controller@4000b000: Unevaluated properties are not allowed 
  ('port' was unexpected)
  cs42l51@4a: Unevaluated properties are not allowed
  ('port' was unexpected)
- Correct OF graph DAI audio format property for STM32MP15x Dkx I2S node

Changes in v2:
- Add port example in i2s and cs42l51 binding

Olivier Moysan (3):
  ASoC: dt-bindings: stm32: document audio of graph port for i2s
  ASoC: dt-bindings: document audio of graph port for cs42l51
  ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx

 .../devicetree/bindings/sound/cirrus,cs42l51.yaml     | 11 +++++++++++
 .../devicetree/bindings/sound/st,stm32-i2s.yaml       | 11 +++++++++++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                |  2 +-
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.25.1

