Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075433FDFBD
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 18:22:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C9A116CE;
	Wed,  1 Sep 2021 18:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C9A116CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630513333;
	bh=/V4e5p18MPaqd4KUAZsus3hSLUoOjDCXf6wX26DlfDI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uNe9B38rpLLQFbAIQz45bzXw16Axp6zLmNqOUp53lP2XVlHinWxtAfvCx9i9VVQJR
	 q6d57ZNz996rgpq+hq5Ap2gqQl5JS5w89itjFqq9v2CPcfDDcBlpVpwTczLs8ZDQvE
	 EtVa/6YBYPW77UUdMlqcoV9mrck4nV+2p7XHNMNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C35BEF804E3;
	Wed,  1 Sep 2021 18:19:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7434F804F2; Wed,  1 Sep 2021 18:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2041.outbound.protection.outlook.com [40.107.101.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 034A9F804E3
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 18:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 034A9F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="M1+I/hvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDuyZJQ7wgU6YMV8qXkB6ZKtymqyxMbYW7uJB+wLXpPBppETJj5usxlVGKxJgWQFv0SmRSmyv6S1Yydg7rvmoks9dzZozg6+OH0P9ILhq/TTrflv2Zv/yBdoTJd9Oksne6UCVq6INIqDk0/tAyldOnAKoMCREhUa5ALwf5HWY+VoN9xcfXPAV9EdvJ7jmXDA7Hceu520EHttjT4QxcsKUnc5cyeGwrUOSmpZRyOXxMw8vIGLh4ywGlP0V80QT0Ulb3Rz6AZr5x0Eq3Edy9BvSu+i7l2zIhA+qjbC2eBlXluTzib/lFFI2OWrz8MVRICD1IxEbiLnYpCOutTSaGSSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulEuks/h+Di414nv6dgv8MnTivM5vjlJX0nvQDc4L6A=;
 b=WV5Rj12yBIYTDHKNSg6EKj9fgvTJZIf0yJQMnAkCwy9/HgK6DOWFcu3K1jccnSqL73d6d9HVprcbExADGD+34bhG1jHW9gDbLjTHRBogALxsJO1pj/3O0yYVWO/sUjSSe8UboObaIqBxHVzgGstj1F3YN29O82ammGMpMub5GiPMDhGYwjS6jpElyOEdAUqCxLxUUlfH7iQfRpiDkkAdsu6DyDP85RzZqJw6Kym1ffkVGcr1lYeG2UDAkZ70iyHNfoQiZpdv1soRQlVqf86tcxcpSNMNZGOT6d2DDaa9zveq6Oj6A+L6NxJcYmOrQo78RYMEeO91wnXMzODJ/gF3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulEuks/h+Di414nv6dgv8MnTivM5vjlJX0nvQDc4L6A=;
 b=M1+I/hvIBmWng+EGt86BfJ0T3YAO2HboVGH1moZPkFUuqzR449Fy9froGj4pSy54AcXpzsaNl1LI+9DxSE/an325aWWSxp8mDlxca34zl+LJWwSpGwUGu6aGehY0wMV2mftJL1ciuLHp9nX3OzNKcMYvXfrKxhkvzz7L9b2ahI0rk+eG5Q0pln6zAabp/pnnuexagGzmn/Ds4Mg/GeJVeAkmlBUafYVuNAy0Qu849BOAJX9vfRMMTS5/cZmg0E7lxs8ftyh2H1bKk4+tw6Hgy1AfjXXYkzltte+2gkeCLl+7x21/rOjH1pntJrAr0iwhKkxC01jQSCA4M06gdDiyeQ==
Received: from BN9PR03CA0190.namprd03.prod.outlook.com (2603:10b6:408:f9::15)
 by DM5PR1201MB2537.namprd12.prod.outlook.com (2603:10b6:3:eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 16:19:40 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::d8) by BN9PR03CA0190.outlook.office365.com
 (2603:10b6:408:f9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 16:19:39 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 16:19:38 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:35 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>
Subject: [PATCH 3/3] ASoC: Remove name-prefix.txt
Date: Wed, 1 Sep 2021 21:48:31 +0530
Message-ID: <1630513111-18776-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
References: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa039eff-e06c-4281-6792-08d96d644c98
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2537:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB253743E4F910754797E69C04A7CD9@DM5PR1201MB2537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qddCrkbyM9X4UR2rEIN5SA9EvKqRCUVKM6jaH33CT6mZiuI8Uc394VASXAA4NsYw5qjBlUXBQj4aVS2TFJpq6JHtJIjTfEMOVR3yc3Tn0UY5I3luKnccJXGaLmG676KKanAFfAolPATMxgZ+EDNs3Wzvw/BLdqwf9cb4GECjb/ipol9l4FthMKJCpZyK69qGesdzYBNFW5n5IPrrwKUzBgIFbr2wDAa5VyNy6XDbiVLODCsY3jedrLrvTqDdOIy/kSRmkiKOp4m+LzgU7rV8QkpAEy84EFUhfUkEOE3rB55xxtCjaIzxoDI5yMJuaa+ehpwTBo7PRLauC2L4jJP21ypMNkBKax5BVnkBH5TjWeZzVrd2/BUlci0c1uzpbEX0lCC3SEYv39XYS2i1Xeg/Lo3TsOPWr4vDCVG05pUS7XJSp6h5zOe7aR9WTDv4I/wGvsXRSpM9NW9fwT48rczFWN4Dw/z+FxuHiAyObxA3APaRPD03QJyQTMu5eFSxOwGD7iNMKnzFw1rVWYdqY3reMMM1/Es81JeAm5RPxB2TNii51sQxZ/HXnrJI5jxvrmj9YxSoSLokZ72wLZokj4OElJrpuExm6dFWc6uDGUk+OyBb7C1b//USsHR5XIObrHS8Yd5FlxT8vxvB/9IdPZF/7haaqT5B0hRMVqOpHrXJG0/7owOhu7XffTFqdBA5oGgx
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(36840700001)(70586007)(83380400001)(107886003)(2906002)(426003)(70206006)(336012)(4326008)(2616005)(86362001)(478600001)(82310400003)(356005)(7636003)(316002)(36860700001)(7416002)(186003)(110136005)(82740400003)(8936002)(6666004)(5660300002)(47076005)(8676002)(54906003)(36756003)(7696005)(36906005)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 16:19:39.7140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa039eff-e06c-4281-6792-08d96d644c98
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2537
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, aleandre.belloni@bootlin.com,
 jbrunet@baylibre.com
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

