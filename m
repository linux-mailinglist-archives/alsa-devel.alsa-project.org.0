Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BC88D836
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 08:59:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE652C06;
	Wed, 27 Mar 2024 08:59:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE652C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711526365;
	bh=KcpvCSLZRo8Nfh45hvHZk5IfZTlTMKSqQ7SJZTaumH0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tPB4nNU0ngsHaHsmgWvu0iXCfmx+07CgIbRO2So+4ht601GYEEebBwoPot9MwcVJE
	 87jNaxAjsl8Utj2tAM6s4FomlHO0Oq23QwVoevIozOxMVRxWSvGD1lISIk4X6RQ02l
	 chb7vnU290shB33+P5udAszdf+ayZi/dEjI8tBQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33991F805C4; Wed, 27 Mar 2024 08:58:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54265F805CA;
	Wed, 27 Mar 2024 08:58:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B382F802DB; Wed, 27 Mar 2024 08:58:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32AEFF8025F
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 08:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32AEFF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=V+7XteFg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELjvAfb/DzucMGnSxv9tW0ijN0te/CnOCG78t7GKNDN4mo7Ln66MRVHmhr4cnH0dTa4gOJE4W94bJ3KV5iFUlJluqmbKrqECIWVid84mFBGO3+T07sqk7f6VBhWBqPvwJyMv4HH5eoClEk37oRBmy9FxYUkpLJGBgAnf0s57gmzHkK8ryqc1KMOiQiySmKtOYZkU3AWRiZ+VOOgCnpAqQii1Q151/Qtv4b/zVdaFGy0d5+BsFZGEsS8AdHL18AOWYqQ3/Ihe+2X+Um4EPKey3T3fMdz0wqLxa7dHdcaFq52ndscOuaTyq4veYsoOF3YiXtnfr0johTOZWofKIpb6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VY54/bVH5xqZ+TsuTNHsbve5RcuM1pZy9jC43LA6+eE=;
 b=MOSBddc2lbdR5yDJs2HaxV3cAPZ1T1ELeMYz+7pTRHs892bs82qkpfp7EUIKa6Rp1a953Ck9LFEcCQEYEMNo5+NqQIfLy3SG+LLbCtPtpfS0IUamEKJsMDF6wl0mOlPzdD7PvfHwN71XCYyvNbwO/1NC6KL0DCzKSYShiSa7ZMpy63gngX0lZ8o3LXyz2ygowD752BxuYwNeCBc/gsEyUNhic57DUXTi9C4/WMsUq/ipWPa9ruy5TWoepG67kQbvI5/DI8H3STPBtHWyOs1J8b7UfolzkJNRgOM5CkPc6vEaog8gmucSkUoadj6oDAxN8UjXuJswAzudJSbcsLZV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VY54/bVH5xqZ+TsuTNHsbve5RcuM1pZy9jC43LA6+eE=;
 b=V+7XteFgZFi0KhVArGdm8jvqq0oA62wbJ7kTQ4BUhl/VhnZlAVZgRWoed3Gbk55SztWgK8BP3z0ylGvucVOSRKHHJhorcGvMCFPl/UfYxhNUtC3G0U+YBYgj0b7x/PzJuQ434dI2kYnChjEbkzbwh/jyljBnNQv2o0SogYnx6+8=
Received: from PSBPR02CA0007.apcprd02.prod.outlook.com (2603:1096:301::17) by
 SEZPR03MB6716.apcprd03.prod.outlook.com (2603:1096:101:64::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.23; Wed, 27 Mar 2024 07:58:00 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:301:0:cafe::2e) by PSBPR02CA0007.outlook.office365.com
 (2603:1096:301::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 07:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 07:57:59 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 27 Mar
 2024 15:57:57 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 27 Mar 2024 15:57:57 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>, <wtli@nuvoton.com>,
	<scott6986@gmail.com>, <supercraig0719@gmail.com>, <dardar923@gmail.com>
Subject: [PATCH v5 0/2] ASoC: nau8325: Modify driver code and dtschema.
Date: Wed, 27 Mar 2024 15:57:53 +0800
Message-ID: <20240327075755.3410381-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|SEZPR03MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f61dfc5-d5de-4746-410d-08dc4e339efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PESunSWPWnuspWEH7OvekPgMIre2veKnrEgRl22veQgCqrAS6sbcGFc+UnJrqQLhwDEf9Af8NmkK4bZFKTCtEOajq12PsSyCkanEOc6CBEybBoy1ipUlnMPPokpwb+31odVp7vx4eQmV1xrGO5gdfz5SbK+xDHEj2mzEtSIHu7tnLHJO4zn8YH553cokx58lTroo5Hnl6Y6LnC21+tKw6XfCY1J4M6oBKv+vSZh4Ji5hKBc07c5JikgBqBGHh4OOtGeW1Vjzyddlx2qbKGneMvwPiIhIi6oAmPTOYIrtYkEHGP8J0YO1HKCU0WEl2lbWpNcL6JR8uKNaqjeX8HShxywsBNm341QvQqOdTk2PtnHW+/wavRzAZd/7QUYb2PK9p5KnK2XIWZ/hrdADcCkp9gNQGKOO9FNF6RmlFom9F0SMulJPRXBdWh9ngYw6wXcQhMfXBq5a2HmhY+dnrGnLcDTCju2lpNhKGJlCNIXXUZDZWDTrlPVTWjPKjI1lkw/4tBUE7bgaq2xuenxhJtcbFfknhZ9bIhCga/JWoAV7jiOZMz0e7e8DLG98SE1uajfMGZ69LW8HmoFMa4uw1OfwY04JWl/UR1Xw69Penhmd8gR/qbEi9VEyGWHV7Hh/2S5AdrWiUbqqULBFLldZs5FmZWKa3r7SBIuECrbIuAIxpX0ipuTUjN5Z3KtgfoZ99r8+OON/QaGbs+vR+PZM0u0dLEbV8y/j7pdwF3t5/ud/R6XhcS9OzgI9HzaAbF9pw8/F
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(82310400014)(7416005)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 07:57:59.7216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f61dfc5-d5de-4746-410d-08dc4e339efe
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6716
Message-ID-Hash: S2NLUXZ44TCKVEAZBJZAVGIJBYOUSW3H
X-Message-ID-Hash: S2NLUXZ44TCKVEAZBJZAVGIJBYOUSW3H
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S2NLUXZ44TCKVEAZBJZAVGIJBYOUSW3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Revise properties description and use standard units in dtschema.
The unit conversion driver based on the attribute must also be
changed accordingly.

Change:
V1 -> V2:
- Revise the driver description part for the C++ comment.
- In the nau8325_clkdet_put function, modify the max variable to hard code.
- Removed "Clock Detection" switch control.
- modify the "ALC Enable" switch name.
- Revise the dtschema for "nuvoton,dac-vref".

V2 -> V3:
- Properties use standard unit suffixes.
- Modify the enum definition.
- Driver code should be used dev_dbg().

V3 -> V4:
- Properties use standard unit suffixes.
- Modify the enum definition.

V4->V5:
- Properties use standard unit suffixes for vref-impedance and dac-vref.
- Revise the enum definition.
- Modify the code related to properties usage in the NAU8325 codec driver.
- Re-arrange header files in alphabetical order.

Seven Lee (2):
  ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
  ASoC: nau8325: new driver

 .../bindings/sound/nuvoton,nau8325.yaml       |  80 ++
 sound/soc/codecs/nau8325.c                    | 893 ++++++++++++++++++
 sound/soc/codecs/nau8325.h                    | 391 ++++++++
 3 files changed, 1364 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
 create mode 100644 sound/soc/codecs/nau8325.c
 create mode 100644 sound/soc/codecs/nau8325.h

-- 
2.25.1

