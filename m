Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2D7D916D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 10:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE21FDE5;
	Fri, 27 Oct 2023 10:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE21FDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698395190;
	bh=E2WlQuk7He5RpSPivVjPwBYE+GIoMaCLwD/1MzOLpa0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ClMxSoMBBQEW6/lprMBZemftcLBtZ8Xh+WgPZD2PeWQ+iVr2VeNpVD4jqEovW1xrT
	 gHmJV7UrkJtLJLBtvvJoGuCB7SObsilbARa66YiVEbPJr1SMb5XpbiFJdv5hakNV5N
	 9/X9NvZC8TVo8N3cu/wmpf1p9PDzIUW9QStbAZnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 859CAF80537; Fri, 27 Oct 2023 10:24:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1284DF8055A;
	Fri, 27 Oct 2023 10:24:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7DAFF8019B; Fri, 27 Oct 2023 10:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01hn2210.outbound.protection.outlook.com [52.100.223.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8391F80165
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 10:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8391F80165
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=ishZ9lPg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2VSADzU8+zOGTdGAub/wjb6f0c3Q0irnXMberNOwIvvuCijvOeK/4OLqVyuW3lNqXhspKk8mWMi/+chDgJGhEaW074I9Xh9bmbpcOR6ONbNjN72AhkSssuzFR8VZFqmvvDJYZIz4EezBqIBYLGIzbLAhKhYALzOobU0YOQvRbdNnt4Y/OiOc7g8DMPl3Ur3nsc/0XiQO43iaZnxv0cpLkZns8Wy/E+1bwfWAC+T9A62HfuTpRYTKWodv6Ob1Q2HHXHZu1CSqUSJ9O6pcVGL7MIIV2VHFT1PN3N8p2IuGXT0aRsMFtl5RoMtkbXKPIEJUV9cXWLSmTu5OrAAGIgMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt2o6lml7NHiDsdz7Vz3adYyXTn7O+g5Y64ZCnOGZWA=;
 b=J5DffkDHfhR8NstLKjPbTZTvzaBPO9R1jD8w/JRgf2PVRqVe5hx7xi6UkkFdiVYpqvaAT0yRXRySYwvAvuiHs76hAjW+eQj2CMvI0dF1IXeXI3fIIJTGfGx0MKk2LoXjcmJofK/V8oVYHXM1mZ0Hxuk8qlbYR3axoyfKJ2XmgOP+0+Wn3pls7IxVAoRpgN8GJawACGXT5STzsphGy+iQF0Hv9F7Jz+E+jkX33AEGzqk4oG+NDF2zdT+27FEupygfaK2X+apmnVUIlvwgMqgVlaFG5drCkXgRNGHGxTK0lmOT124hhSKTAjeg8nEUuJEZTODyW86xM2gpeuDFb7G5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt2o6lml7NHiDsdz7Vz3adYyXTn7O+g5Y64ZCnOGZWA=;
 b=ishZ9lPgnEI2ZvZ9E5a4S+B98ZqpUSpRltNVkAd9ioF9nqZkemIXVX5WJ+Z1Pple84oE/EcpVGARnnoO1ZCFGEbG6rgzzAqnlQjLB1h//S44ZjnCujtO9uQtEjE7utFS0Zi9DOBKuLU1OkJ4AkEGKoR7kwDqUfdqbzdN7MByIh8=
Received: from SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17) by
 SI2PR03MB5417.apcprd03.prod.outlook.com (2603:1096:4:105::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.22; Fri, 27 Oct 2023 08:21:57 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::52) by SG2PR04CA0155.outlook.office365.com
 (2603:1096:4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23 via Frontend
 Transport; Fri, 27 Oct 2023 08:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Fri, 27 Oct 2023 08:21:57 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Oct
 2023 16:21:56 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 27 Oct
 2023 16:21:55 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Oct 2023 16:21:55 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<scott6986@gmail.com>, <supercraig0719@gmail.com>, <dardar923@gmail.com>,
	<wtli@nuvoton.com>
Subject: [PATCH v2 0/2] Add DMIC slew rate select
Date: Fri, 27 Oct 2023 16:21:42 +0800
Message-ID: <20231027082144.639369-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[211.75.126.7];domain=NTHCCAS01.nuvoton.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SI2PR03MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dbb48b-72dc-4b0f-a571-08dbd6c5c969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tHG6/kAg3jPR4SO7/jqiYWqph9DagF5ohWAuLK96r2FFy1S96v9guf0iJZdEIXAfVDnpWMRempiJTuQ6T3FWPtgy7yYpT4kXIda0C861J6d23Ge9GyN1Oh/xiMmEtCN9uX1uykK+nnMT8L0SCDIjVXiuFim1FRJVgE1F10fUBqy+vmbe3QWBnti8UlhGiuTe4mGk6yEPlp+QkwDVF2UkeQ1eOyFThe39qrvWKtPyzh8yXoifnL4Cq7BX8XPVfHD4ZqqrO9lvA8NgWcmzS+vnZCzzqHBN6yuiofnwtUNOa1pxlDqTh6XApM01T6BII74nseMQSJudOl3LiQzy6cUoc0jPcsrOZx0uGj2MsVAVsNn2pQXj0O7DwYX5ZmrglqXEsdn9U1xDXzUAwpooGIjogrpzu3WBWVNz6PYNcPHEDn+iRRnGPgwJDqBueF31828UEdx2ZtGHhZ/U6jPu46OcY++2eLPcKiPjwVenTc9ieGbHyxUNUu+yk/RNrAvgToaOw3DepMVmUMFAYgGkalHO82EMyMOy8i92WAmi0t6iM+law5aWcSCN3f22NtfxreWQoabACm1fKxOMirb1wamOWonG3NwI9P+IQZBoI2WCjLwRDfLFzEOX2q9XGH7IA0uvma2BNGa3kNsfNLolTov1VmCeEi6sif37dYPL4XKeg1SIQ2pYa0qytvBqCXagSOa9ZgihfvyC3ZG1sZKtP0f905bcuA+IAwzNtVfbUUykuCSFeuRGoa8uyt+yLcVRdwJ7SAl/q1d7l6QgtJ4Z0qx/d0SkitURqLAyOA5a3XsxWnGgoAO+UEqs6u+9d2sFiTJPlMhPoAMogYtqAncED41GmoRkLrOx+IsuMq7kcMsm2B0=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(5400799018)(36840700001)(40470700004)(46966006)(7416002)(8676002)(6916009)(316002)(2616005)(70206006)(70586007)(41300700001)(1076003)(5660300002)(54906003)(4744005)(4326008)(8936002)(2906002)(478600001)(40480700001)(40460700003)(6666004)(36756003)(36860700001)(81166007)(34020700004)(47076005)(107886003)(26005)(336012)(426003)(82740400003)(86362001)(356005)(12100799048);DIR:OUT;SFP:1501;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 08:21:57.8008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 13dbb48b-72dc-4b0f-a571-08dbd6c5c969
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5417
Message-ID-Hash: P5HMZIXR7SNM2JOTFBEKMKAMQEPTD7AJ
X-Message-ID-Hash: P5HMZIXR7SNM2JOTFBEKMKAMQEPTD7AJ
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5HMZIXR7SNM2JOTFBEKMKAMQEPTD7AJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Determine DMIC slew rate via property setup. 

Change:
V1 -> V2:
  - Corrected description of DMIC slew rate. 

Seven Lee (2):
  ASoC: dt-bindings: nau8821: Add DMIC slew rate selection
  ASoC: nau8821: Add slew rate controls.

 .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
 sound/soc/codecs/nau8821.c                                | 7 +++++++
 sound/soc/codecs/nau8821.h                                | 3 +++
 3 files changed, 18 insertions(+)

-- 
2.25.1

