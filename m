Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD14E8DFF
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 08:17:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707C416BB;
	Mon, 28 Mar 2022 08:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707C416BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648448275;
	bh=DjWN7oZAG82tChhcoSIgrNp4DIrgqwe+6rKSSd9vT8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VRk3ZYQtAVIHqw41iEDAxPY6QqKDOqyrIetKOitfG10Z8ilbB40yE5RL7DbLKp2s4
	 iIrPJZRqs1uHf2JqQDgVI8px2q8OT80EnL5rq/zzdLfCLGyBng7+VAYds6tBblQppf
	 7DqjkrxYtEERRRt1nY2mYvDuoYdLuMQTJ1qZjv34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F08FF80524;
	Mon, 28 Mar 2022 08:16:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E22F8050F; Mon, 28 Mar 2022 08:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 741FAF8050F
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 08:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 741FAF8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="rz7hwoeM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuyfTbFAsZZq5pWS2XJXsDAHhNn2Jt7Qyq9C27WQhCcK2F8oy1BMek8u3uQBEhythNV8PleNeK/IycGx5QhYtd94boKvCG8rQMeOlMI7lxpyoSctrY3efdntEtqOi1MxkLFZc5lO+JP5CSTERY2jgGkOxJ9iOp2hhxXYzKG/HPgnAbNP1Nf11bmLWLMVeB5/vpkRA6abcwV5mU8LgFaQernaNsWxCKpG8X/o1DErztLxY8u7d0qeGF7a26ZsEikBFzHXLLpX+X2xL77WtI7XAIcM2O8X+vY5UQ6rJ+2u2qbzgkfAyeG+bN75eoaWLbnN7pwDieqDTI/FENnOxGmJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFugAI6B8RrsIWb50yazBzK0Q5kazWT6V8B7QX7uLgw=;
 b=fEZ+ytOa/IJK1xgjVp9Mc5zzmsDtAyqK3raeruqNpKnJKkpmeWkDqbMO603irKIkwbWWj4Xek5iDcyJG0Ewkiyczjw4oEJXvyEmru1/j2srak+ulfr4Hpc+7mx2r3mUB/M9z6sm928klFs0TBwvEboVtB+CkkrfnRia8vjoafZUbXq4YbPWKW6Smxhnb0W3YtZ0shtV3RcWPS3rAX6b7kQCBATI0bBCr8UXXeWuDWxqqSjKp4fm6li5RU+4mh/v3StoQRzdhMrGnyhtyVyx3EZdyfnDWLgga457FOkvUbF17ajmv/0eUBj9Zu5V58qqauYnZUjvKDrqXgIL+B05QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFugAI6B8RrsIWb50yazBzK0Q5kazWT6V8B7QX7uLgw=;
 b=rz7hwoeMJV87y80asiF0j63e60SFfb+u4rZqEC0m0WW71mfg5CwEMoaQxBBvsxYEvtl/xxvSonvo8g6n2dwll8l3EofsHH77riBVs/7f4xRwHff1Iz9nuzd3BGmuC1QhCTz33aswzms2ApK+8FoUEZgblyiHO1ewSmtXFLrqodtg/BZ9qTzJPW38oB0K4SbNyHGC8L/gAvggPheAEqjofae6kuFgoKIbuwpQKxr8LSeqeTyWufjUCyjDcDCy2EKcolFMhcski8UoSQzjkTMu15wiLr6ACmwQnj4SnyU7OvETvJFP3smCYeuZg2XI1mj+hYAeYmJtKrt9mBS552uKoQ==
Received: from MW4PR04CA0238.namprd04.prod.outlook.com (2603:10b6:303:87::33)
 by BY5PR12MB3697.namprd12.prod.outlook.com (2603:10b6:a03:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 06:15:48 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::2c) by MW4PR04CA0238.outlook.office365.com
 (2603:10b6:303:87::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Mon, 28 Mar 2022 06:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 06:15:48 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 28 Mar 2022 06:15:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 27 Mar
 2022 23:15:47 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Sun, 27 Mar 2022 23:15:43 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <peter.ujfalusi@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH v2 3/6] ASoC: dt-bindings: Extend clock bindings of rt5659
Date: Mon, 28 Mar 2022 11:44:07 +0530
Message-ID: <1648448050-15237-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff197eb2-2888-41e8-7849-08da108266f5
X-MS-TrafficTypeDiagnostic: BY5PR12MB3697:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB369760067D7B51344D9A3475A71D9@BY5PR12MB3697.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQJz9iiE5r6RsKkiH0F3a701+UWuLxYWs98fM6EuhuVap5VYMIdq1QwfB+V3wXAftiTZKVVbbYYI8z7hGUWlHxZQrQ3avRk46HsqH4W32iGW9ckd2XVOiLQ3iGvNsE/nqMYO+sflbYMfmlVqXbLuf/xWGdysQJ+jrAWz9F2v9wmfv7IqZQVTMi3EkhgSWIydRlPZggfY3q9SaZh5scLNrs+mUJLv9Og08o41ry3XURPMHYd4otBjkiMs/ntDUDIIFoW0k+ZUCJu7B4so+OkYznon0658af0S1pQNf7YSUno6M+jCQJZjta8FHG+/s9kwyLCQ6jBoJMU3aBm7ZZRMIoYmg4kqS3JEnXWs87K+fjZ0R0WBaxooMypefm7vI3n1uNZwioHo0LiOxgEBfT1r3+SfGGEUWIydANr0BoZr6HtLL9H/3rHKztsoB2UCFHOhwjb65ggEjKL1jAW7ARdwkDeC3ee0uQuIgFHbdSFIv2rTMTOtTahVs8DJgZX8niTWvMuDCwjT3tf9Zd3ICS43Q/o8UgQa7QFnjwCiDAsEIJ6ebybnd2r+wn4GuissM+wvYPfY4NgL/cbrhnRGb3N39dz90mX69ARanKTCYI8Qw17Y/gG0Xz9qKeBQQFmlEtUOAHqIIsRzz3JJCMrPcCqxcmhT3p1XvWEIuq0uDe96H25QtOLMJNzRDpSrYYiJleQLnFd2G6sZbiDbg5nWjpGHCg==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7696005)(508600001)(6666004)(426003)(107886003)(336012)(26005)(186003)(47076005)(82310400004)(36756003)(36860700001)(83380400001)(316002)(40460700003)(4326008)(70206006)(8676002)(70586007)(54906003)(110136005)(356005)(81166007)(2616005)(5660300002)(2906002)(7416002)(8936002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:15:48.4252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff197eb2-2888-41e8-7849-08da108266f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3697
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

The rt5658 or rt5659 CODEC system clock (SYSCLK) can be derived from
various clock sources. For example it can be derived either from master
clock (MCLK) or by internal PLL. The internal PLL again can take input
clock references from bit clocks (BCLKs) and MCLK. To enable a flexible
clocking configuration the DT binding is extended here.

It makes use of standard clock bindings and sets up the clock relation
via DT.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
---
 .../devicetree/bindings/sound/realtek,rt5659.yaml  | 53 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
index b0485b8..0c2f3cb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
@@ -29,12 +29,28 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Master clock (MCLK) to the CODEC
+    description: |
+      CODEC can receive multiple clock inputs like Master
+      clock (MCLK), I2S bit clocks (BCLK1, BCLK2, BCLK3,
+      BCLK4). The CODEC SYSCLK can be generated from MCLK
+      or internal PLL. In turn PLL can reference from MCLK
+      and BCLKs.
 
   clock-names:
-    items:
-      - const: mclk
+    description: |
+      The clock names can be combination of following:
+        "mclk"        : Master clock
+        "pll_ref"     : Reference to CODEC PLL clock
+        "sysclk"      : CODEC SYSCLK
+        "^bclk[1-4]$" : Bit clocks to CODEC
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    description: PLL output clock
+    $ref: /schemas/types.yaml#/definitions/string
+    const: rt5659_pll_out
 
   realtek,in1-differential:
     description: MIC1 input is differntial and not single-ended.
@@ -97,6 +113,7 @@ required:
 
 examples:
   - |
+    /* SYSCLK derived from MCLK */
     #include<dt-bindings/gpio/tegra194-gpio.h>
     #include<dt-bindings/clock/tegra194-clock.h>
 
@@ -114,3 +131,31 @@ examples:
             realtek,jd-src = <2>;
         };
     };
+
+  - |
+    /*
+     * SYSCLK is derived from CODEC internal PLL and PLL uses I2S1 BCLK
+     * as the clock reference.
+     */
+    #include<dt-bindings/gpio/tegra194-gpio.h>
+    #include<dt-bindings/clock/tegra194-clock.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rt5658: audio-codec@1a {
+            compatible = "realtek,rt5658";
+            reg = <0x1a>;
+            interrupt-parent = <&gpio>;
+            interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+            clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>,
+                     <&bpmp TEGRA194_CLK_I2S1>,
+                     <&bpmp TEGRA194_CLK_I2S1>,
+                     <&rt5658 0>;
+            clock-names = "mclk", "bclk1", "pll_ref", "sysclk";
+            #clock-cells = <1>;
+            clock-output-names = "rt5659_pll_out";
+            realtek,jd-src = <2>;
+        };
+    };
-- 
2.7.4

