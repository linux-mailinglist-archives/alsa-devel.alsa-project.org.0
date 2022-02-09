Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177B4AE896
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 05:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E96E516A3;
	Wed,  9 Feb 2022 05:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E96E516A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644380804;
	bh=VAWq/rWWCFh6qSzDmMfL56wZQirNM6fXpW+/EwhqIi0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYUQs9i6ElBgWu89MysFUZZa2yDhuONj/aB98XyqJb3OD2R8rIpKdP0Jl1FGbH233
	 egwKlLxwuaFjkaL4OzCprCJmCVhFwalGx21QiBWaXft/l234Nn5m8hJ3kg3J6OlUu4
	 O0mQ0RAfW5hBrFj50+FXd35j9GzG60rEvKc0rzGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C214F80529;
	Wed,  9 Feb 2022 05:24:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75923F80527; Wed,  9 Feb 2022 05:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16FCCF8051C
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 05:24:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16FCCF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="t9HaUZ6Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T81n3NxqKy4Z1hNGDQ1axfSjBr9UyfLI3e8Ryzx3k1Q/tvezXTHiv/ur/CKvch2L0Bk1vIU0ZO77O1rtJh/S28PhPjxZklFPd9PayJ/Ncbdj2g8+WI8QFzPHW+XMReX5cnih2nf+ttkIyMPh7PqKCMLLlJlIr/FAQ3kC6NAe4Rm1gzxezs0cBF8LhVovYtGyAwAcUA7OEYoblz+vtv0yqqQG49h+ecWd5xE7c2zMryXi2JJaiHHNE2CZ80Ktp7SaDIDXT1G3Sdo8GRc41DL55swLnvReWgy38mCTi+0hyxnk3UT6fPSkvNnJnHAfRArvX9uwJJF2Z62LnWii/8Y3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqSv5upnBHfrIMKWFCoWxPoIIXnra5crEdhhW/W4OXo=;
 b=ahGextFFtN5qFzI2Q7P8s1mCyoqRD8wFWLdRP7Xx42m9ARHkNMJ0hsWMyh405678O9xgBhjTKPJU/8Nuu5XNuYPrDceWGKq+nE1pFHYQ7naqJvsvX6DIOFJyRvQ40kVGkZxiZG9YkT7Q0OXM5cWaJMNF72SflHG/QSIeKfYnePWTAzUzJDeuvMJkb+MEjI8FMKbPvQNjH+kU1UC5ylJSt4tyrg10sbbMyk8weRa2xWFxdE2JSEh/7kPWvhsJvb2Bv49T6W2ZW3dI9TFKLntZpdqmoI2tC2kO29WZJAaFIH+JfN/aBjzZGtpMF6aSpoW8g/8s2ExaXgB/l4j4k2l7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqSv5upnBHfrIMKWFCoWxPoIIXnra5crEdhhW/W4OXo=;
 b=t9HaUZ6ZS4IYrcuwZWZE7agOpcYXvaytiJHjXuz3pAFy3/n/GktTBGEGYGqyR5oUhPTjB0Yv9Swlfi2d17YNX73kFR9xKPybsFGUlmRW92Yh/IMPUzElFlMmVpR2yTwEhHb7g8ElQe1MRzMEo1xrYEvgkxr7ESW4aN+Xr82rz+HAP+6R52OWnW3NkjI3e9bTXXWCcdzrbJctFmJkZWxgctDqZM/qbitTuB+e7Mc5xEwRglQESU0bteOardSfLSJsQq0sDq11OZ21431qGsY1P/oBPKe5pZQ0NfS+P+5mDjW0W4cvzNOT+dhUKnmNwPL4VyCYvu6hAX0oFL3wVWwHcw==
Received: from CO1PR15CA0064.namprd15.prod.outlook.com (2603:10b6:101:1f::32)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 04:24:12 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::1e) by CO1PR15CA0064.outlook.office365.com
 (2603:10b6:101:1f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Wed, 9 Feb 2022 04:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 04:24:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 9 Feb 2022 04:24:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Tue, 8 Feb 2022
 20:24:10 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Tue, 8 Feb 2022 20:24:06 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v1 5/6] dt-bindings: Document Tegra234 HDA support
Date: Wed, 9 Feb 2022 09:53:25 +0530
Message-ID: <20220209042326.15764-6-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209042326.15764-1-mkumard@nvidia.com>
References: <20220209042326.15764-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10f50571-da0f-493a-2a78-08d9eb8405ac
X-MS-TrafficTypeDiagnostic: LV2PR12MB5775:EE_
X-Microsoft-Antispam-PRVS: <LV2PR12MB5775705EC65CA225785E62D0C12E9@LV2PR12MB5775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqGO0NZoop5eHo3G5xjQ+JwRsHg15G2uqvjpuyrs6o0mx/5t7HySYPD1/FL8KGGHI2Pk//+vUohVFHQXXuyM5va9Ao51HWnsXm+rVeFVvqQCBMmqLytO7ug5pwf//ciuvuL3Lpg8UOXGIVxbkZWNM4Mc2ueh/xkMWR7YOU5qooC81ANADYlH2ypM/A3+x4mpqUlWTCilZqMZsMGhPtOAVG2SfvYAKae3X+wkkDK3aoNvUtSk9r7v3c0ZPcR7597jFdglF+BZmFjrNFdffZZylISlYAbdJB14tx5kYLv+4XigUrYMgju5CYyu4f+zrTIpOILDY0odGfscNHC1e2itDU4goOBUaeUJ5pNvKPEuQjLb4XdzG5WDAA8FLpIxbGADS3hgwFhSoF/b+G0OyiLU6q8REctNYiEdAQHoIesbc1p6BXc4aXhjDxKAfecysv422swECMGeHB8xnsalzEuwvHLBJuVTrClCG892R9eP+iYC40G6SJAGr84fsjckyJPUGTHtzRMXrb8OCr9aTQiADBAkpiL4hBtcMo2tQ2eXatQ4RrGjlFBYXEavSSpIeagvO752wxJU9Pp7/htAy9+Kl3g3PAm6l0BkD25HpVbLZOJLnVkDoha27UK8hbBLYJHzXJUN5qzuyFtfrzD1M3JZnsr7PV2k1S24BkGHo1QjZOWIZw9A5LARKmGp3T6GlpEm6gAAd8YleoL/c0LjxltGoeJSgHi/2gDuiPzYy/3hYoTPsB8kjzRbbRooGwvipazif/FlC9JcWbIxWIJjf4853eEylhKb91ekCOiHJTUrq1Q=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(26005)(2906002)(336012)(426003)(47076005)(4326008)(8676002)(2616005)(8936002)(1076003)(107886003)(82310400004)(86362001)(70206006)(70586007)(83380400001)(81166007)(36860700001)(356005)(5660300002)(110136005)(6636002)(36756003)(316002)(40460700003)(7696005)(6666004)(508600001)(54906003)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 04:24:11.2077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f50571-da0f-493a-2a78-08d9eb8405ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
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

