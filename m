Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7A4B06B4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 07:53:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E7121816;
	Thu, 10 Feb 2022 07:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E7121816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644476036;
	bh=VAWq/rWWCFh6qSzDmMfL56wZQirNM6fXpW+/EwhqIi0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YF93WEE8/pCm/Z2LnGtYQAIZM4+NDNWNON4oCc/zUthAR3+vxXgAB+X6ZPpYDJ6pC
	 rkYf1QUgAaFYPzTg7V3FHpCmkpIdZZFDvvJ9wg9LV0tQpJXtyTD3tmUkOtxceTThZE
	 BF6TepyAH1mOKaXdPHaN5zCDPikR4pMNtfRZVaRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BD48F8052D;
	Thu, 10 Feb 2022 07:51:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B20DF80529; Thu, 10 Feb 2022 07:51:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07763F80519
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 07:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07763F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="oDu2yZ6G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJM7/mdSzSKJC2pQBSQpu6MLv03XVmXD6qZYlBPYu4J/psW43cc9q6vBWe8wi+PXiuP+gI8wXGtccOpmC522/GZKiRMHKtvdhTd1Tg7Vnqdt+EC+3/Uk45kg1XjRae7no36mANKhXlmPPfiLYyW1lCGONUGQpEgG0oISSFlhy9GnTrAAxu+M8Ta01rXktfafsavyeAeDJqvoiz0sf82YPF/Or/ii5+JwRwTiwqHloevmWUpoqGVDyhWG29re1WqHBbe0uBGS85zbxRZlemBaVvApmtsj1tHKBwvSLD7WKkU6NRv4WPSOEoblukiN5QT4WqgZDf0paPzBNYzSi5RUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqSv5upnBHfrIMKWFCoWxPoIIXnra5crEdhhW/W4OXo=;
 b=B1GXsSHglvtgM+idaJm68yDUsAYw5wzVBJRwAiwqh1kPWg2iqezTLssXpmMPmoHPJCT1WshgjckxvrqINdsDJr3iCqZ6J3bX7LXLOn+49px5Uxsi/cK1poVb90idNrUtETgX8uObLMdpI2+PB7uleay14Gnbim++N4aRtwv+p81BORMjOL5tjdbnKQ0vbuuLPVXMV1QDtjxu2SiOEAl7meucpXwwRMlxJEc7++zSNiKDIuyyQFo235Fi3bXIwYsFGqvDLoURzIHgVhFE+7KOt0M1Yu+s/V6TjF1DvPcGHppkuNuf9y9R3bs8yV3/2yADEf1DniQYtYa9etS+mMvLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqSv5upnBHfrIMKWFCoWxPoIIXnra5crEdhhW/W4OXo=;
 b=oDu2yZ6GfzTbUYcQOCtSFaGxTnjwuEePn0evGlrgwUbGwE/vMkHaSTF6minvAR7m3NL6L6KFgjw5YGyiJ8ML/vXlwfnISGfF5lOblfq6YzJ6G0GKpwYKlPc7edgk4qV9BxMeX66SlrNmJ+9uQrf2fvIbFPsbOaGA5p8wznNXPp51Gy4y2r8Cs0w2H+PWSfJprDMqbYrT7TTLXzh8E4trbeu/P8BNwUDoG/UehDC/MAutndLVUSZ2udYw2tr2jEQPoKFX2vzPg8p3iT9liaMgDLPUy+0DAn/giz8Rw0B/j+w2gSN+BwSXbgiWuQrYzN0W45w05OCtJPZtH8hU2Gz5QA==
Received: from DM5PR17CA0063.namprd17.prod.outlook.com (2603:10b6:3:13f::25)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 06:51:30 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::7d) by DM5PR17CA0063.outlook.office365.com
 (2603:10b6:3:13f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 06:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 06:51:29 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 06:51:24 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 9 Feb 2022
 22:51:23 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 9 Feb 2022 22:51:20 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v2 5/6] dt-bindings: Document Tegra234 HDA support
Date: Thu, 10 Feb 2022 12:20:56 +0530
Message-ID: <20220210065057.13555-6-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210065057.13555-1-mkumard@nvidia.com>
References: <20220210065057.13555-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab4c882-7308-4da4-19bb-08d9ec61c439
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB271178B145E0356B33EBFB77C12F9@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFN7NlowEG1U7rujNPm9t8SbdlhP5qTCmCofKGr/Gfe5M83zF9D06D0UPJh/R+omPTykzYG/JG7ZL9Ff79FT5tXBICVUbsgXF2aa13su1gNQMRTs1p8AwYD46hhuBt2AiUdzMyCnjd1J16LnRfVpQy1Mj/14ZTYVMJaMZLoKt0auv80u47BO+aT3egA1/1Zfu+ChVk+XrIvq2KJRb7/ylCmql0K5SsMQGxzAXZyMUli7EJc+7sHjUWjyrLIsY467nSs7gCbmqvxITA2uocEQB2JidDf3Syy9JV+CN4pwLH/asZt+MTkfyK10mK8/h7AQW/yDXFBKiHzOEpaC4WMjmiAA6p78gJ/j0dUTbr1biewbws1c+qFPNcyo2Efy0ShHMynYv0qTtc8wXIPJ98F9cgwMpI7X4qyPu5y1ql3DCrk2sGd3SKboo1YBDy8H28h+WOo5AGlfvE0IFDhicn94HjiYN2Rq+wL9Fr5HmBy21U1A7h6r8hXXXoGHOykn2MTvbGnYYiof3JV0vBdLK40/tZzU9vRVWJhYJGzNT+VdmfNsKA2+853gn8TDFoopAF609OLFiN+wUSOnAwr2flsKLjTvd8skpxN3UDwppSJin08i+/bHT4vBYfq9Y942x3chw454GlWR4oS0MNCAlAgJqn7lRylKW0joQoqq76U1k1OgcwIsMA50E6UNIcf2Wc5a7/RaNXLNAHbijoDeByALZJZBPE6z9dveh02pCo5teT8=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(47076005)(186003)(54906003)(26005)(508600001)(110136005)(316002)(6636002)(8676002)(336012)(70206006)(70586007)(83380400001)(36756003)(4326008)(1076003)(8936002)(2616005)(426003)(107886003)(86362001)(40460700003)(82310400004)(36860700001)(81166007)(2906002)(7696005)(6666004)(5660300002)(356005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 06:51:29.6601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab4c882-7308-4da4-19bb-08d9ec61c439
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mohan Kumar <mkumard@nvidia.com>
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

Update binding document for HDA support on Tegra234 chip.

Tegra234 has max of 2 clocks and 2 resets which requires to add
minItems and maxItems for clocks and resets as Tegra chips can
now have minimum of 2 and maximum of 3 clocks and reset support.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index 2c913aa44fee..12c31b4b99e1 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -23,6 +23,7 @@ properties:
       - const: nvidia,tegra30-hda
       - items:
           - enum:
+              - nvidia,tegra234-hda
               - nvidia,tegra194-hda
               - nvidia,tegra186-hda
               - nvidia,tegra210-hda
@@ -41,9 +42,11 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: hda
       - const: hda2hdmi
-- 
2.17.1

