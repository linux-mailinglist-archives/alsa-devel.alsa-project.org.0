Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61B47B232
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Dec 2021 18:32:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3274177E;
	Mon, 20 Dec 2021 18:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3274177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640021555;
	bh=ctAlVQVMZbdUCjY1Z7sNnK171dc6UO3P6Ld1n5pRb48=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZx6OFkeRn9GNl+MPVjWSE7QLAoAo5DCyqGqmZtAuAgUT+5gXSXEeg2BI3QF8hlpS
	 3qMk+ZmRI0D6Vd8dmQepDL3Fa3LCO1BOpIA229g8q0SC7ojKRnb09tAspeGLwKW0Se
	 MC0QI1CeriJR0kI0cAtZn0QXQLiCO+GZlXyYCTVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1F0F804EB;
	Mon, 20 Dec 2021 18:31:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DEEEF804FA; Mon, 20 Dec 2021 18:31:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D38AF804EB
 for <alsa-devel@alsa-project.org>; Mon, 20 Dec 2021 18:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D38AF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="bdDKXFHs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obs5sJzuIiZm1kj24e5ACf5SGfmI17vr6hvMXW4x7NfwsFy8W7293QFfO7j7r9vvjwInRJqjXa9d9Mii/vffOy8wnwRUzSXj/2mb9aETY06ZuPodd3L5dYxOp0sjpQhqOSkQH8Ave8tA5JDOg/UMixmq1HBfr6dZzGpgS3u7IOrlraGIWxfW8n4+MVv3rl9qkgzljNmCwJcUzA/pb+EINNYKzYdhQtNTOP3E4uXynPW+pAJz6z3E/5J6/n1FSnEJdjvjtFhDn5P+kKLOLs7/XIpCuSlZh1QlRroVJIVXq6avOAHejSo+IBPk8u7A9I7QhQudy88DBvN+JVx7IRvbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx1z94/eQX7pUUCiHIMemZM8n7EoQkFkT+8DjLx6RXE=;
 b=dmzl0aazXQCUNQ6Tjwb3TWtywj3Nubz57EcKydpfcIu+rh6DcwKR3xTphopdH11Ry91KkycXk9DXMiZukbS5TDzC4/K7hP2DU73S+KjNZD1q4lE7Q05I42h32+d4xFsmXY9QwGWq3oXhBktCaQ5SB8n/gJBTHxZA/4jSPsL/sy4r9DQgn5a7qYY2qMRsHc1qAhJF1g/rteYZ+kB/GcCdpSnY8bE3Mc5SXjkh/Scc3L1wjl3UAr44AzsSLFCIAXmt+AMg+rkZGG6S9iyMg97u4+8aXVu1SU/YMuam0e87/BLsQWdA9fZwn7abY/N54WSWDKwPHEGNEx9sUsz5jUXuZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx1z94/eQX7pUUCiHIMemZM8n7EoQkFkT+8DjLx6RXE=;
 b=bdDKXFHsxiNydmF3ynk4eBYV6yNg/vukoEyCdkN1bMHWxcJj4sY76Xln6NXrbh25+DoOTPPHXwDgJba2MoNa+ed5vooIEOW7eshYQgYoGVgD8dOiFuBotglOKzArcFjsskq1A+OZP9JXKsztWiGBoOeDA9dlo6wJ4lBj0mo9mMEFhemVa6NHSHdxsLoSk0gJm6eHhyotGiJaZ1QuCxAKeM7Ikp0gYL7asg0cAIUvFGNqwgeNEuDrYyxf+/N/0DRFAhXkr0LC3WAqdp8CrsX43vp5+o8hGzuwSUdd8x88Uu3s1uuvc7EhtU+AhG+oiY2fCcXEQ0GgkFPZuUAkA+/uAQ==
Received: from BN9PR03CA0611.namprd03.prod.outlook.com (2603:10b6:408:106::16)
 by MWHPR12MB1280.namprd12.prod.outlook.com (2603:10b6:300:12::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 17:31:17 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::e4) by BN9PR03CA0611.outlook.office365.com
 (2603:10b6:408:106::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Mon, 20 Dec 2021 17:31:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 17:31:15 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 20 Dec 2021 17:30:40 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Dec
 2021 17:30:39 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 20 Dec 2021 17:30:36 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <perex@perex.cz>
Subject: [PATCH v2 2/3] dt-bindings: sound: tegra: Update HDA resets
Date: Mon, 20 Dec 2021 23:00:07 +0530
Message-ID: <1640021408-12824-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640021408-12824-1-git-send-email-spujar@nvidia.com>
References: <1640021408-12824-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f41f6cf2-f591-4c45-0f1a-08d9c3de8662
X-MS-TrafficTypeDiagnostic: MWHPR12MB1280:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB128048116878BD66890B2337A77B9@MWHPR12MB1280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqx6VRYP/w96l05bwbgts7mTw2JLEIVExiPGNvmc760dqknFt6+/RcI1PQ42qvYU63CAwISAcoEEWz85J58SxdmVMfcrVPG1XmolgWL7m0/AlQyjugsbc5pG6qZDGWILFWE8G/3oNhK9vmU/akNiW2KUirP2iStpirXiistHUhGxUvF2eoPFGpllIfiZEoUWr5p5YW6eAHpk22dgUUCSrmodU3SO04l+2ZKuglhWIVviU/ZA28w6KGL7LW2IVnbZsGBNJSr/rHwQnPIWqe+4G4wHh5QIYGQcJWy4GHgqj1j3tb9rx4iUtRkIBWVjD0yTFHdK0BuF4ry9zO3xxq0YWyIa41jCZsKBOOsKg+aIbVv75VBDuwQVtCz/fgjgYPKJvJ1MLIVkSIrmH5cXShTEB5DEfqshcxuJn7ORXXooFR2i9R38Zy9XXcOdJBFREE0TLg9W3LSg7D9nJUNgGdvZ3ADeejmpqAWetkch2nmxibZLvbZARDG3sNzWFcWjTGpPyvhoTWtGlhoH2+cV9jkSeyYWGS7cq/AqVy0DMKDk8sFHRMFVv0jyAYmIDSSSdASNj8TMzau5sHHoBGd0h9SFJ0GAChmjh6UF4Qe7yNE5LSqnxf7nD+ef7NTaTOQ2fD1gsTcnYlbnpdzzT0zDu9hgH13DTTmcVCuT07cGJsP4urS35mZ1EdPG0Uqxr25aiadCWaQCNs8dMfe6V+yxSvfk5k48ISMHYuEvG21zryZ+5PFaGkYn+vpNEU3F7h909aVeBYTil1peSJ/FWYD3K200Er9epxQI/lOk9z5++z6y9KYpjgm2KnzZRSci7xpY4O/RYyN9pRiV66K/YfpsXwbnEw==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(426003)(508600001)(81166007)(7696005)(4744005)(107886003)(5660300002)(7416002)(34020700004)(40460700001)(36756003)(82310400004)(336012)(47076005)(15650500001)(2906002)(316002)(54906003)(4326008)(110136005)(186003)(26005)(6666004)(70206006)(70586007)(36860700001)(356005)(8936002)(83380400001)(2616005)(8676002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 17:31:15.2646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f41f6cf2-f591-4c45-0f1a-08d9c3de8662
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1280
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 mkumard@nvidia.com
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

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
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

