Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174E86FEA6
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 11:16:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF1185D;
	Mon,  4 Mar 2024 11:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF1185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709547384;
	bh=0khqBNUQxb9CtIDoPY6PVAOXP03RqEdHWBbtYLlkd/g=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LSlo/WKpZ/uGmSltR6TTzxuMZBkoJs/zsA4jwOyg90MyIE6Aok/hjAfl/auuDIPL0
	 Wnv8s38S5EF+Q9CYk3D2zc/gmEk780scpgMNtyboFRTnTQE+ZjjW5jKgZ2cQgXXIdk
	 AY1oZW0H2YKdTJAOpnmT6KbClxs6auMdT1roy6do=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68FBBF805AB; Mon,  4 Mar 2024 11:15:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC21FF80579;
	Mon,  4 Mar 2024 11:15:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07DE2F8014B; Mon,  4 Mar 2024 11:15:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA3AAF8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 11:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA3AAF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=gWy9mdyV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoQ4MWNvvOujda9N3uvq+KfFenEPOHenUiKNmSn85IFBckkQpu9vvsTaA6OXPOrt6vyjVmU7eoQqFJ55cyANDthN/PNGuIDr9PU1uewlu0yaNFY+41IBD0Qovggn1wFNDDxTjz44D5aw3JNyeH6m1QgLM/51w5A+hjkT2cAaW76bkxt7T856KJ/EBDP4u/dBBddiI96OhMqyNcgVqEKMl8huM5yMz11bnEeWjFVhRpMIURcp42pUrTa43VfEnxFUqpiWa1fSqu5xOwP7uad4ha3YLB+1C5nLx6g0iULqyPMEu7tq1nDLQ1w1GyAmX73H5vQimkWbFlDM+U9CQSAWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbZlyRIuopFFJKT/MYPMSBytwonfG8AnNSxOYtJz73o=;
 b=IPnbSKo/MpkJxigvu2WF1XSyNS28IuWT5TOWiFOqKv5WLDJQWMbYoawezh4m7CEg4Xn6DZT9jqNFaikmvkEm01acPcjWCg3awmjd5vEW6XIFsT4YjbgcJUxLEToK+vpb8OcLbQsULlzAOTkE7jrynpzwoyCKp9kg2UUCi6p1z4PMhQAdQd9kSct33OavhbYXS3cDyr3izOZiwbUPK/M/AkTsaGh7Md2P2XTcGCVaaWbGYp+9uilIKMMb70ySnwi/lwiTaEulq5D4uQYahi8z3n8DNnQqxUaYt4fdm5T0VzWR6xlywuIqmxxI+BZJKdTC4EKFfVvu97F568EiEIexfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbZlyRIuopFFJKT/MYPMSBytwonfG8AnNSxOYtJz73o=;
 b=gWy9mdyVHWKDQZPiDmKGoVfN4lm64mhOe0vvjmaJOF2iKZywpLP9PJkjltkyxnHsbYkFdAjXV876wOY6rI5l3OY47sBpqYT0LRQo0wbFP6LfI3+yk9KQt6MINbO7iX5IETc1rD94VhSld99aVfvqy/vULamVYJeKr4ALJcKojgA=
Received: from PS2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::28) by PUZPR03MB7188.apcprd03.prod.outlook.com
 (2603:1096:301:119::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Mon, 4 Mar
 2024 10:15:32 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::ad) by PS2PR01CA0040.outlook.office365.com
 (2603:1096:300:58::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 10:15:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 10:15:32 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 4 Mar
 2024 18:15:29 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 4 Mar
 2024 18:15:29 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 4 Mar 2024 18:15:29 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v3 0/2] ASoC: nau8325: Modify driver code and dtschema.
Date: Mon, 4 Mar 2024 18:15:21 +0800
Message-ID: <20240304101523.538989-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|PUZPR03MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: f189045e-be69-4877-941b-08dc3c34065d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G1TkMTnQVNE3BG9y87Pjuf4mlRmTHSFR5SX4lXqJaoHBTh/AQW8uswHpbk0VKhDZCDXZgLQgSWo4nEBxT+0TXczKOb7Q5nxTC726s1lvC2vSK3tcuOXGa0gzFh0WOW9Vnj8hMhT5tMnE+hCGe4vhlD4dmfcs+t8yRHZakY+ui+mCRtiiAUimkpHpY2yg2D6DF2680oICLz3L5oCB+0/yII+6XWFXUpV4YXGqroCqgZBXnmUp1JJYLH+xuD2qn4pahWDFW4w6wWi2epYQNe01GDvcXC64pK+H3mh4aXDHwJ5M7OKGNDJTqUIc4DLDYEzDIMG051N6btLLFZVuLrp7V3xSoHyz2PsSrxGPe/I1SevRKVPiJp85DZkkIQXcf1kQ9MJGdYQFFDJ3NK4NTL3csTcHPaTtTLAgw9dvNpotrgBCtMaUr29ICwJM317h6DkBKHyOawF9JREj8+YUBxbD3n0VC3lzXIWLVhoID271S6ZzNHZ/w8Vh6rR06hMjjHS4PYCOK0WGhrzE4MFu/5x6EcsRgzZP1uVvWoqAxVW4kWchclzidbseJi9TRUNq8xK41Oxt25tKJCTh5Ch1NR5FomFovcoPK+lEWZZREITUvlPyzvaAIaNqvh7NzU2HWw6iCuRhn0XE/bCCFn8Pg8LaCVRr8siKEXaIw3x5fr7xxdDdvgrKtuqGaAraK0xlfPuNAwfOZLIdillLgSo2iBEb/702X5fmzu9n5dfnxCkX3gy2FeMV6bHCSOlY2PAbDxPa
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 10:15:32.2061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f189045e-be69-4877-941b-08dc3c34065d
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7188
Message-ID-Hash: X6I4DCHRWUZWWIZQ6GGJXFECSPPHKCJA
X-Message-ID-Hash: X6I4DCHRWUZWWIZQ6GGJXFECSPPHKCJA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6I4DCHRWUZWWIZQ6GGJXFECSPPHKCJA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modify properties of "nuvoton,dac-vref" in dtschema.
For driver code, changed dev_err() to dev_dbg().

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

Seven Lee (2):
  ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
  ASoC: nau8325: new driver

 .../bindings/sound/nuvoton,nau8325.yaml       |  74 ++
 sound/soc/codecs/nau8325.c                    | 856 ++++++++++++++++++
 sound/soc/codecs/nau8325.h                    | 391 ++++++++
 3 files changed, 1321 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
 create mode 100755 sound/soc/codecs/nau8325.c
 create mode 100644 sound/soc/codecs/nau8325.h

-- 
2.25.1

