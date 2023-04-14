Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B0C6E2120
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 12:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013E0E72;
	Fri, 14 Apr 2023 12:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013E0E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681468887;
	bh=BuOSg/rMMJzIANH0hQRRJWXtZmxJu14PHn/PQMyNQeg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hZI/nSnhs3C3B9MjDTeqg0ACJeJmAf6nnX4h0hcDI3GLWmLYsUwSgtgV/of23PKI1
	 IYml8aNUVJEmHt0XhW0HGh2ye6f6oMDU/RHyhWuuA1C4dkCittXialU3Qlvz8DxNY2
	 QwzB6mOJlFr+Ti9Y0KPZAtlwYD20+XHaOfiaLCfA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3755FF8032B;
	Fri, 14 Apr 2023 12:40:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7585F8032B; Fri, 14 Apr 2023 12:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6C70F80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 12:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C70F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=K/1zx2QY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXBBAXxlXqSCbKfWm+zRp/VVU72R/8GA1PS9voXH968k2e+T781n9lCjOM2BBgQMmco9oyfReeyheRYiephZRXMuSWiESzCkLKkmAZv8xDN+uEwYwM8QDhhskan8FxVTNe1q2MnOxIbFvYT0ft2whlECeXPod7WUIYZGNfWOj78lhvb24QEO98aGIdXkiumoJFs+06G3ydqaOQjGzYejv7eOJmUU7oQDdmD0bD/V/f6cbIa5HXx39RY29B5bucydR3+ub8cMLZHX96xyZscc0yGBkJVqzDAwVAJYNf0UGrhPAwo1iPcNIHLlQcE1SHsbyjrn82QzENFzv0lVDh3xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSFBOcLzbFJru8R9wKbIwCeBLBhaOSp9suGzN/xGp9U=;
 b=MJKCcCrTZlgGK9B3wc4vd/sbe6t9kLVXdaiHJ7osQRW8BePMiZbGOHKzABMAJeTkPWnvrDKymk5hfTUgZhSlPRHRTSMXivVuQ0wvvItjMoy1vnCKGLQkDemhErznG5q2oW0v0tZBoelCn78oW6AfWt6/A9McXfHzvnjcnXw28gYSacxWkXeYrKUb0WdEzf84J96MUTDBhFE+ppMz+/YVlE/PNs6xBoN/Imz9Ji47aQBK/qnKnch3pWsT26gvm9C+jwIvkVZ8ZZsY6VmXYYlEahkDdjTQb+JHx8FrU4jGP8cSKCTWHTKtWHWBe+0JrBNoU3gXLheCpqXaO6mwPAs/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSFBOcLzbFJru8R9wKbIwCeBLBhaOSp9suGzN/xGp9U=;
 b=K/1zx2QYn+FLHHKI6AqewXH69DLzlB79aireT0tOr79WW0iTnknqOhS+TmXugYQzYHdjT8+mRUq3kFQgXIVSIkuScV2w1768BAm/qUbhP7HhpENUWHmbXsekIlWG+z8ubsN40YFRjKinbZqqh1QzULIxSud508Lc/yHGdWlyJjQ=
Received: from TY2PR02CA0015.apcprd02.prod.outlook.com (2603:1096:404:56::27)
 by SI2PR03MB5401.apcprd03.prod.outlook.com (2603:1096:4:102::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:40:15 +0000
Received: from TYZAPC01FT032.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:56:cafe::48) by TY2PR02CA0015.outlook.office365.com
 (2603:1096:404:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.34 via Frontend
 Transport; Fri, 14 Apr 2023 10:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 TYZAPC01FT032.mail.protection.outlook.com (10.118.152.128) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6298.33 via Frontend Transport; Fri, 14 Apr 2023 10:40:14 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 Apr 2023 18:40:12 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 14 Apr
 2023 18:40:11 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.7 via Frontend Transport;
 Fri, 14 Apr 2023 18:40:11 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for input
 path
Date: Fri, 14 Apr 2023 18:39:42 +0800
Message-ID: <20230414103941.39566-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT032:EE_|SI2PR03MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b06910-2d3c-4f3d-9cf2-08db3cd4a1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jp77+rPek1elJj8KakpQx+lkWwcxZ3qZDl5QVBoB7rPv1/zWjXZ9pDFfmlAXy1x8n43B7IArfPRSyouamCSH/uGx3nfKp4ufA0ik1FIhlnzIttU3S9jvSpSN4+ZOsUPzuZ3+ede59SJ8z6s5vDWLBm0q4bmV9+NnOGpBc2CfRpDcuND/zCexsgihZGMO+klndBf/rzgWY2NoaiVzv+Og/EqX1zjE7359D20qsc1a6R7ByM8pX0c5wcBT8rrKPrNlTh3CqE4weNQBplAIcBcFA4kJdV+/iEtUnsJKwNPUI0BWGKrtGwWTt5klVPtD/JGFF+VTB/ikzcc/FLlwvRLvgTqyBtEqbWAcKf/P3jFhm38S+A/O1qTDbCjKflBBBnHxWRN896V39XsStfl2crBYfi5mTj0ozpzNGPDCWc2Z9gRXfAqLHFb528sul0fmtDmC1Gac86djwbMEpXnQt8J86SGzwoeBSTYfg7KgbCbUvaz4Y1bolwVF22b7Udopohac3d/QurFi1Jciybx03lZqpCtqrBJ5wvK9qzbJu/SGn0ZRMVD1627HJzCbab5Bz19UJmkXWb4+TTLiou7gmypxH8WrEXGKXpBr/Uv2MgmgMv9iA8zN5uXUIxsU2mWMSIBPaftsmSbdhAhl8kaFgXWlrwz5Acad0SVPJzHOgWwIBplJOVOsI6Q+JBOTqY+hr45+1tCtrN205yUKWZ7mWEEyxw==
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(26005)(8676002)(186003)(8936002)(40460700003)(1076003)(316002)(478600001)(82310400005)(33656002)(86362001)(54906003)(70206006)(6666004)(36756003)(6916009)(4326008)(40480700001)(81166007)(356005)(70586007)(41300700001)(82740400003)(2616005)(83380400001)(36860700001)(47076005)(336012)(426003)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:40:14.9057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78b06910-2d3c-4f3d-9cf2-08db3cd4a1e3
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	TYZAPC01FT032.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5401
Message-ID-Hash: FQ6WGH6PBSRSPHSVLJSI5CPFCZFWF7AE
X-Message-ID-Hash: FQ6WGH6PBSRSPHSVLJSI5CPFCZFWF7AE
X-MailFrom: CTLIN0@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, SJLIN0@nuvoton.com, WTLI@nuvoton.com, CTLIN0@nuvoton.com,
 ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQ6WGH6PBSRSPHSVLJSI5CPFCZFWF7AE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the original fixed delay to the assignment from property. It will make
more flexible to different platforms for avoiding pop noise at the beginning
of recording.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 Documentation/devicetree/bindings/sound/nau8825.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Documentation/devicetree/bindings/sound/nau8825.txt
index cb861aca8d40..a9c34526f4cb 100644
--- a/Documentation/devicetree/bindings/sound/nau8825.txt
+++ b/Documentation/devicetree/bindings/sound/nau8825.txt
@@ -74,6 +74,9 @@ Optional properties:
   - nuvoton,adcout-drive-strong: make the drive strength of ADCOUT IO PIN strong if set.
       Otherwise, the drive keeps normal strength.
 
+  - nuvoton,adc-delay-ms: Delay (in ms) to make input path stable and avoid pop noise. The
+      default value is 125 and range between 125 to 500 ms.
+
   - clocks: list of phandle and clock specifier pairs according to common clock bindings for the
       clocks described in clock-names
   - clock-names: should include "mclk" for the MCLK master clock
-- 
2.25.1

