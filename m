Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C45046B310
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 07:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6A5209F;
	Tue,  7 Dec 2021 07:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6A5209F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638859164;
	bh=ZSFFaC6M+w56ORgzC379EeWXVk3nKk/PrGfYT7vZxCs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZgUPOsbS8YobTf+P8h0C1DtHeaxmnUKvJxeReV0lW0dcjrZNKgpS8L/hvT7Ozh+zr
	 v6N53NQ1zyslDT8WrbnE/yzKxJP+Z1IJRkKgD+5x4ODm6oQQQ3GR7knotTRUuAA1xI
	 cBCconm5h3/YTqCQOS4sRT0B7C3m+BX5MOhu1z0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F27C2F8050F;
	Tue,  7 Dec 2021 07:37:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0C1DF804AE; Tue,  7 Dec 2021 07:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B02F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 07:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B02F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="MSk0wdB9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClCietFfUi0Lber1khBtFarFcUjvmiMzBPEdV30uk12cAZzx7wr4zPbwIaW2DDQoKRcP7vGX67aTxmTeciLqx/qNFcLAadOWdwTyDbgYxDzGqZK8FseWkg/Pq32RigccLjnZxcud7vYFP43DwyrVDA5HUVqhzDhpqU2XPm4imAeoy1O1YyTf5qLYlPls19vJii1yrv8qiiuOpY0l6wqMijK3ndw9D/fjtHtgkIh+RrsiosjbGl/mDz60v0fu/5mcXQRg3Se9Cg5Jna3ebntb80wvgRnDPM1W6oNrJ8ZJ9BuTnC+OP0tTSQNFgeQaI2g4V+pl64cChcjAc0FvTg2dXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZzxHMw/2ozMPo4Qjh+XUik16XR0GaZEoXXoPWIFhMg=;
 b=Ee7rt8Zb186wjv31nxvYXfuPQP3HcNoEEjE14LmB8IwoekDis5XF083DFIOlYU4SaTB3hRSnz8ZKZUwqTFCeQC8c08Nyxz2+tZI6VXb4fMgV/McoCUT3lPZVUxTCQ3gqNMAeXM3CqJam3nsy7s4qbDQnh/cDeJdNAr1T52kUOJGG3A92OSwBPCme1cHkE2AJKLt5+5MiwJW3VHXXhJxiPn3gO8+7Bnenie5w0+L3iM/MprXd+SbTiYQP70FHc4HZU7C38+uNvQM7Q+inc+D8f1EtNejvl7h00LDFiKx20eTD+IpjW4u8vQFJuSF+GEIRZ9j8M+Cxl1Y+vs11Fz+img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZzxHMw/2ozMPo4Qjh+XUik16XR0GaZEoXXoPWIFhMg=;
 b=MSk0wdB9g5+DyOYKOiDFHqftfahhB1sWgbJh1nBKE+YKbyYqH5eF+xYwag/haurXYQlgqFr0mqURliEjYZsGiCVuc+CRWL8aMd8KrEXMoDYHua2W+881EckiU/Aq6NtidLg25pGO6rdwFx2AtPjgUqNK8zqzwAp/blx7hMBAl0cJsV+NrfdOFNU1lhmdc/lMEifEMxKcCJ8eT8l2ORiE9oQV2xBKmGp5OE2f2BJB7Z0so2xO479WRJfQb07mh6vz9fH/r/lwAS/L1aM/TtqIZh73xRYOEUoCu9hUpPGp/1xqZ6DCbWe12+8DYIK2Dv+XnvQo6Ygr2ExVZ9l1jUgBbA==
Received: from BN1PR14CA0021.namprd14.prod.outlook.com (2603:10b6:408:e3::26)
 by MW2PR12MB2457.namprd12.prod.outlook.com (2603:10b6:907:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 7 Dec
 2021 06:37:26 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::88) by BN1PR14CA0021.outlook.office365.com
 (2603:10b6:408:e3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Tue, 7 Dec 2021 06:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 06:37:24 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 6 Dec
 2021 22:37:21 -0800
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 6 Dec 2021 22:37:18 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <perex@perex.cz>
Subject: [PATCH 2/3] dt-bindings: sound: tegra: Update HDA resets
Date: Tue, 7 Dec 2021 12:02:49 +0530
Message-ID: <1638858770-22594-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdd70184-c3de-449c-15d3-08d9b94c07f0
X-MS-TrafficTypeDiagnostic: MW2PR12MB2457:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB245776857F9CDCAFF02552FBA76E9@MW2PR12MB2457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOnEkPzfeRRrC6r6EPa5LeeoH0ljrGrkS02WS/QhwX1VYfsdTB4N3BEfImg2PoLHAmJDtpcc/cVmAXbcTy5TrUvCXlfFWD7h1684CYmWDIVPP9uVhwwU65zlTQYoUzWZIYeodNcabWNO6C8qeiIcY4sKLL3ZVYUNJ1P1miBK/qkLeYVGef4oBBHkN1EaZoaC5WvgceVZQ5jOTlNt5DZZx3aY1u96VqvUPQUNqWhUIOyPkVw6BXEDTe0v4msgPXWAgyoKJLHBYTy+G6VWqOGPRxmwXcptP8CGdwnPwJle5f2VeoGlWdb53/tHMVQXU1AgFtTX2Wg3x5452SwLqlEh/H9xyrlR9U1Jk94FBFnhe9Ss++2o4CcEn4g3JNN47ArUOphANtwXQGeA85SLOd05J1jEybU5LFCSfrlQ9p66y5x/1pERAa31ZY61Mq1hisIRJuExnuyCd1S74e/+orerif+hwEWMJ8WwL3PbLCYwwfzc8ORFdcC2bBiQQ+mENev/pgcG4p0AoClgnGx1cWc2bRs3B/CmM25yObSSQcd6Wk+tBtRR1b/RAPZin2/tjZsft7pjy4PtM2Nsk1rM9u4cFBAgBYMCcBlb0zG9wBibmpfMIvTarslWZGyIKvRxjhdlXcXR8b+HYvdFMXxwpjkAbskgp0SGCLWgjnjMEJq7JJPbA82qFJk9m2HryTHiw3w7HXyqWmzwaIkeMXDkXXpsiky60Ndv0NxQp3xqsIgoddrmTqHisSna/wXF+05bErkq2ezCIpX6xhLD6ExY5pmvfZYkgqhssvT6SpViOG+tblo=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(336012)(8936002)(426003)(110136005)(40460700001)(2906002)(54906003)(83380400001)(186003)(36756003)(15650500001)(4326008)(316002)(2616005)(7696005)(82310400004)(356005)(107886003)(5660300002)(70586007)(508600001)(34070700002)(70206006)(7636003)(86362001)(47076005)(6666004)(8676002)(26005)(36860700001)(7416002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 06:37:24.0058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd70184-c3de-449c-15d3-08d9b94c07f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2457
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com
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

Tegra194 HDA has only two resets unlike the previous generations of
Tegra SoCs. Hence update the reset list accordingly.

Fixes: 2d8f8955fe02 ("dt-bindings: tegra: Convert HDA doc to json-schema")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index b55775e..70dbdff5 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -50,13 +50,18 @@ properties:
       - const: hda2codec_2x
 
   resets:
+    minItems: 2
     maxItems: 3
 
   reset-names:
-    items:
-      - const: hda
-      - const: hda2hdmi
-      - const: hda2codec_2x
+    oneOf:
+      - items:
+          - const: hda
+          - const: hda2hdmi
+          - const: hda2codec_2x
+      - items:
+          - const: hda
+          - const: hda2hdmi
 
   power-domains:
     maxItems: 1
-- 
2.7.4

