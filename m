Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993F413664
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 17:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108ED15E2;
	Tue, 21 Sep 2021 17:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108ED15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632238964;
	bh=UZJ5M7qmHI+5gqOM9g4uPk2Y7I1n29quc4M0ICTrJQ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XDqJQFW7u/9k85JKyrmCmrXLzRW1uAGUmPiXY5KxM525napF/+Nc/cyAYTze/Q8B/
	 0NdbzfmIyIVToTGj/sDQ1bmpJkLs0BghpJOIBuMdIp+gA4Agvy386a6Fvk2vzjspfp
	 lu09h+VMswYHDObKog2Nav46VqB+guKr3bzY2fzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F5BCF8026A;
	Tue, 21 Sep 2021 17:41:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D08B5F80268; Tue, 21 Sep 2021 17:41:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D59D0F8011F
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 17:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D59D0F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="Qo98uZGh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ5J78YNsux8hvLj+oYDLBLGR2rE/Vaoy9AJ6whqxqsJ+B4PZ9ICHabdsN/HJ7gcpWrP+sP0lHiJkar76CkRvsvJ/vlT8awd2YHr2zSixplqm99YEDjk2YJCAS1vRzUqwqTjE6pZPU6LKxbYrTWisHb4ugrfOT5EB4rYM7kZs3Ae8QoFtgiij3J68LFbgKwwhBWh9Wnv8MEMSGDZHdVAwVi1ZPUUdbU58CMKrsrheZEk342+bU1yaOUT1cxbI7NST5HArxw5Y7Wrvy+8z9slcwmezy23aoC2oGyIpyylr1KnzakwOaKnD2EM3/YHed2AXXM5ke2glRjEDpC60kRfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=G7/FNYs1Nbllfp/i/hAfpZeNzaxwz4/a0IHAkl/Rgvw=;
 b=DWUuZt7HJpOwE5Dl5hXwX5MoJH/HtCjv0j+rlBx3W6JSbSzyDT7D/eG1xrN+tQSPir4FN/MoEycxINBZESd5n1OgclivIXaX/a8a7P8iI+GVkrpHEnlf/CG74iuMkVLt84vBfxn28bnAvqxY7GDAi0SpBparj871VQa4XAh5AVKufgZYzC2P20qEe8ClpwsT3KU0JxTRRYNV5UXVkl6D+EAiQp6Ym7a1a4q1/0v4svT7VXbB3ijbE885sFGDJo0bz214ouZkuh+0E19ZhCYqGcE+Z+G13RIbnYL/dAoX39MP5ala0Hq8IuAmEvi4+YupzQ4buXXDtO4C3Z4FH7wmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7/FNYs1Nbllfp/i/hAfpZeNzaxwz4/a0IHAkl/Rgvw=;
 b=Qo98uZGhhcqgpFymmDD0lTtIVIeNOhul0vmKQqyaxM+10v5FZeLMDmh2Vj4InlL458VJ2j8m8u2roVCBX3QXUTNmdK3NjncyLKmVMy2s3wG6F8Rsoo1xeizasJ7w5z/M+pZ56GE3O+HxK2hm8fANySM4N31YhoYgmMxIS4Jc04sBZ2bbY0PRn2w6yg07f2dxB5RbWZJC7yoBH6f/0moh6bvEbmHkRT7ssRGRIjnUMqHfJcz0/axB118509jOAtdUpNOvFVjDvJCdFft4DyU8fxamMaT8vBJMLnvNe3hz37Rod9SgD8Rx8YeY+Lj0/VUkTQD+SAlcQCjjXGQMw2KjOg==
Received: from CO2PR18CA0048.namprd18.prod.outlook.com (2603:10b6:104:2::16)
 by DM5PR12MB1545.namprd12.prod.outlook.com (2603:10b6:4:7::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.17; Tue, 21 Sep 2021 15:41:15 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::ae) by CO2PR18CA0048.outlook.office365.com
 (2603:10b6:104:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 15:41:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 15:41:13 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 15:41:13 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 08:41:10 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <stephan@gerhold.net>, <jbrunet@baylibre.com>
Subject: [PATCH] ASoC: Fix warning related to 'sound-name-prefix' binding
Date: Tue, 21 Sep 2021 21:11:00 +0530
Message-ID: <1632238860-16947-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a921e9e3-c2da-4a10-c14d-08d97d163e49
X-MS-TrafficTypeDiagnostic: DM5PR12MB1545:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15456E864006F263C0FF3E3BA7A19@DM5PR12MB1545.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4+V/UwUDo6dB/ylRJose5P3lnisU8QNTNu5Q/0k+FECRdX4DrqqGF5bRNAS3k03YV7wqxy867MS3xYkpfgP3T4Y9iAvlP9wj8DAk7xkGgwa/FZqmQZjPFn+TMC+b+YMULleG/XB76mH7bUxVNYVCOUMmxhwzLhyVpuaxJOTuG1661yw3+OVUtRoAfdmWbsn9AJq0yKvuwMFCWtDkXWhfhGmmKnAm0x685F6nn+wJ1xdW2dNHyA0p3IMQAusPOZIfq5nMuGAIO1HVw0SQoJ0hy3gSEutZjXO4Ly2BtyelEOC7peO98MpvdlA47uwTdedm+/cxTOJGmv111heb4ohuXFBMoLgUDKEo7J3XxglSc9bM8Hakw+ZQsTBuZs/IIWtTf2JF5R0u2yihTzWJ1NHm8eWbsiINajHa3SovQPjVUE+qKTvdixxz1gEuV7SsOR1utYO9cfRCVWUk8IAf8RhF1NpEEju01tqGQdTEkWWaYD+LM6cQtHqc/Ndks+M4iOctm4ldR2iypB0X+BjcQ5q6QjljigJZxd0M83ShTPtahEu9zv8Qk5mskT5EsX6uKebaaQHgNKSX6FmNTUU6H5URxrC9MfdpeAaQAbPQnxfAHyp4GsTvMDIPae+NayXu1Wm7V+uHk5j/pacC92oVQW6BubN2g28fKkE409OCPmcVNSbLXqmT2Om2R71AONg57zjce9GRJuzf80nHI5S3VnfZVw==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8676002)(86362001)(2906002)(316002)(107886003)(47076005)(336012)(36906005)(6666004)(7636003)(508600001)(36860700001)(70206006)(70586007)(7696005)(83380400001)(186003)(26005)(110136005)(426003)(2616005)(5660300002)(36756003)(54906003)(8936002)(82310400003)(4326008)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 15:41:13.6339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a921e9e3-c2da-4a10-c14d-08d97d163e49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
Cc: Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

commit 82d3ec1d89fa ("ASoC: Use schema reference for sound-name-prefix")
added name-prefix.yaml schema and the same reference was used in couple
of other schemas. But this is causing following warning and the same is
fixed in current patch.

 Documentation/devicetree/bindings/sound/nxp,tfa989x.example.dt.yaml:
 audio-codec@34: 'sound-name-prefix' does not match any of the regexes:
 'pinctrl-[0-9]+'
  From schema: Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
 Documentation/devicetree/bindings/sound/nxp,tfa989x.example.dt.yaml:
 audio-codec@36: 'sound-name-prefix' does not match any of the regexes:
 'pinctrl-[0-9]+'
  From schema: Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml

Fixes: 82d3ec1d89fa ("ASoC: Use schema reference for sound-name-prefix")
Reported-by: Rob Herring <robh+dt@kernel.org>
Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml      | 2 ++
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index 68e5ad2..7667471 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -24,6 +24,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
   vddd-supply:
     description: regulator phandle for the VDDD power supply.
 
diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index c597d9d..b5fc35e 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -24,6 +24,8 @@ properties:
     description: |
       GPIOs used to select the input line.
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - mux-gpios
-- 
2.7.4

