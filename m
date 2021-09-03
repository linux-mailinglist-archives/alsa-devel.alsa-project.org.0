Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753140037D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C542E18C5;
	Fri,  3 Sep 2021 18:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C542E18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687090;
	bh=OQy3xyp6ATk7guCkQsAlNVFUp7t23cRn5TlrzHYh8QE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxNmod3EDCwfzM8Im6HEykjpidHwtQWOZeJXFVjQ0iB9v2LcKEamWl0Kxxr3QExrY
	 aN3Soc3fwW3QmwiKBwhc61PwO3XeGPKb20iD2qddNwBs5hvdr7Rc0klN0BD1FddUJc
	 81QzKpSuiYMo5mZu1JJLI3uVsF8mpgJghZ/EI4fY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B682F802E3;
	Fri,  3 Sep 2021 18:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1254FF80254; Fri,  3 Sep 2021 18:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33585F804E7
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33585F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="HHLV4eZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQZee4PXNZ0sbD/A8rNPS5Dg8qbTR34eGnBTwmoe9N6RpaY6pp1frA+kJerBloRei+LW2g7R/dqN1ngXbtcDzO9QZOK+fEjuskotebkZjR8xfLyffFrMel0R3NDqFH32R9A4JZR/xg/lx9vvpD/6GFZLc9AUXkXA2xaZAh/pNy4upFypfz2frZGbWdzEk+lL8r/G6yn/5lPA4r2IFMUQxArXPX7Cdw3HBUN+EqlPTB4D5THpm6m2fuWzpxyE04cEfvaFUaq6+5lwSzEWgq38TcdJmFJHMj3YMxH/H+Rwhs+1hELLbXcVm4PSr9QGSUJSkvE90vzOhqgOcgq821cbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IqYDkXfxFiPyPl1mKIxBWrw6lLH23mqdxkSJRBoeKAs=;
 b=Vf98XlIT9HeogPIG7W5xmR272ATymWf8Tg6a+Dzohsbt+ZCVil582a2BJB8fytm6U8hJldXioMqbgMZxEuIb2zffwMfglLNVbeevyddXTNpSbGuxX/y3+c/zZOr3Asb0ebGTZtigdv55/44U1GazHrvQETLwOO0vdrKLrchaTD9V2OwAOVm4E1XkAtzPLT8Ei/3L1xHQfo28srfo36VW1uSSDZmDgec1WdhuDfHYkTRbAuIUSwaUrkg9Y5y6HP1tNLH7ayKeAxVD6JoHA/1yC7CtNKVTOA1MdFRHe46YVdMNles9cPsT21ylu7DXIf51tpA6LSADep9ifY3nmALTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqYDkXfxFiPyPl1mKIxBWrw6lLH23mqdxkSJRBoeKAs=;
 b=HHLV4eZGwOege+AA3cUYYMDdCOmtERCbuTgpT7ketai0Rh/TIpr060xuQgtzgZrnI3CE5eS6VDoWKl2IWcq6vSW8FqfDZjXVeLrioYhyXrOaEtWeTrM/qZYocDW9xFttfLnHB7kXwWxi51BMD5YZXx7Wfwg88Vn3tXIgEnRvXL5GXGJhZ/0oSI7zYz/DJZCdAK3p/I3shy4ARTOwx7LigUjKYjnzBkiMu2+6BXqQeiaDb0qV6kTwFaGbOYl0hkNfwrG+8l89P3GtYL2+aXmQ/ksNhKsPdgNl2LChG0dMRlZjce2UkjMaj1kzNGsCvlF69cZJ2nwFiNKwCOBctky30A==
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 16:36:17 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::2) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Fri, 3 Sep 2021 16:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 16:36:16 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 16:35:35 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 16:35:35 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 09:35:32 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>
Subject: [PATCH v3 3/3] ASoC: Remove name-prefix.txt
Date: Fri, 3 Sep 2021 22:05:19 +0530
Message-ID: <1630686919-19495-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 768b6e4e-edbd-498e-99c2-08d96ef8f3b4
X-MS-TrafficTypeDiagnostic: CH2PR12MB4261:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42614FBB92D928F8383AA3F8A7CF9@CH2PR12MB4261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XwRcPSs/pLwHusrN+Bf0qMdAu4qOzNwNkS7SNp5KXb0bHpB16ubls716vK0nZbFNIJCLHhyM6nBXNrPADSe3/obhwnCTgreaQnyN137wNhy1Yx2xKEOOExyFLpIzlNXrgX/wdvxLI+mE3yuN43tX/PJIuyBpvo5Nu66IcIMoUpA8et4aT9S2JR9ZHGgPinslWD1e9hqwOQuvtpikOaF9E8GGiZPDsug/Kt5EvXmYO7m1KHRbcU6s4FWNkUUDrOVEABCmFO3zpgY5Xzl/H1XTXOCOtSqRcRCpJn9r/22ikGij+qE1lDj/FDUNO+1D6igMzRN/0QrVJpphAAIQuWExwRK7HC4oBxPHlkSGnI38ZE03S2Zr8zRNDmbdYAFhz4gvS/v6J+Y1aind1sj40VK/DmDAVuNjVa54Pm52RAM5hfMjAO30VC0fPDKh88IicS7tvWMN4N4XYWysHQDSgIoReThKu4cTHbSs2b2zTz/VIfUl/QUhJ7OTw5Jm11sGtUGCrf2e4dkLvj2HDDGLXItgqseH/6yyWFvpd840u6LyClYNlsTBE2PltrQ0Bdf8CwhEVZW/eMHRSQ+cw1UJWlRVzTB06XwdMscobRIQKedguVWNQaxK+d3GQwBeqje0rXQOeoEvhci5dMMHEpwxYVhASvTr3t7OiGgpdLlCXR5ueZHpuPoEoA6Qxm2eWz8rvz3a
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966006)(36840700001)(26005)(107886003)(82740400003)(86362001)(426003)(4326008)(7636003)(36860700001)(478600001)(6666004)(336012)(70586007)(70206006)(2616005)(186003)(83380400001)(2906002)(7696005)(82310400003)(47076005)(8676002)(110136005)(316002)(5660300002)(356005)(54906003)(8936002)(7416002)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 16:36:16.3772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 768b6e4e-edbd-498e-99c2-08d96ef8f3b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, jbrunet@baylibre.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Since schema name-prefix.yaml is available and references are updated,
remove txt based doc.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/sound/name-prefix.txt      | 24 ----------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt

diff --git a/Documentation/devicetree/bindings/sound/name-prefix.txt b/Documentation/devicetree/bindings/sound/name-prefix.txt
deleted file mode 100644
index 6457759..00000000
--- a/Documentation/devicetree/bindings/sound/name-prefix.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Name prefix:
-
-Card implementing the routing property define the connection between
-audio components as list of string pair. Component using the same
-sink/source names may use the name prefix property to prepend the
-name of their sinks/sources with the provided string.
-
-Optional name prefix property:
-- sound-name-prefix : string using as prefix for the sink/source names of
-		      the component.
-
-Example: Two instances of the same component.
-
-amp0: analog-amplifier@0 {
-	compatible = "simple-audio-amplifier";
-	enable-gpios = <&gpio GPIOH_3 0>;
-	sound-name-prefix = "FRONT";
-};
-
-amp1: analog-amplifier@1 {
-	compatible = "simple-audio-amplifier";
-	enable-gpios = <&gpio GPIOH_4 0>;
-	sound-name-prefix = "BACK";
-};
-- 
2.7.4

