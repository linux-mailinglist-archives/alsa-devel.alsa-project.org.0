Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F384E8DFE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 08:17:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2698016DE;
	Mon, 28 Mar 2022 08:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2698016DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648448247;
	bh=SwpHnIzkZYB61t5sSHG22qrsOKT16FRiPNCllOM50Lc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fUXqO5UdBU9LYxzvBxBwICgco9/3qSvLQPhxGkDS5wEls3XKnDrGTUBVfRkKI2BgR
	 GSSSIyaR5kLNYIuM2ubEGqS0F9nwk3aAgZMUkmf7Pu+nT7z0lB2cgkAbx3MovFvtZz
	 bk5VX3YcR155fQTOa3gzNPCFLBW/nrkVcNCJ6NLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B05F8026D;
	Mon, 28 Mar 2022 08:15:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66494F80517; Mon, 28 Mar 2022 08:15:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C6E1F8026D
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 08:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6E1F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="PsYcGbX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp8T30aj6473IQ1gUek1pe+7KSPyIDsttdrjSF16aG/r8Hmh/lBAnIaB3Z35qPtGcVZuptYOd1T4apb4nEFbFEaFeLmrkL7mRPjZVGfPz1hHX6FNYEHG9r/kqpEQMctFrRbwHr/dKtEH6hIcco5+QNKguREn/jU99DmsZcJ7x6QsK7ds9JWu+Uwe5nU+ASVjSH6FYIaqwB5fNrG/6REQeGUc6MGbAtBikfDyKoh8dACcHWc2Ujgje6Fp0Z74V+vb2LU+dfMwHhqv3JRD5ZnHKxEkwXAafFi+VB9MQZELyfoqdc9j4TPOizJ7ubI/8FdRBBEIu9K+9GzkOe+G+LrEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1dDbdgBbuRUF/R6Gp1XO1Prxllo1uu315sK6fAK/mI=;
 b=HS72dUoXPi9yJrng4sF4CMi1P0pZCbZBmqVMVfqp8svYxapbSPc3A8AUdhUaC9lE43KsJsk8l8IoZS5IbLuWEJ14F2w7FtlUCdI0Dq4/f+EBTRTEFPm0p0/RaBBOSsBClKq0yZfg7Ltd8fPhIXECYo5Z2Sl9YnvYvGF6KSyOVe6IHuT1mQFizLLVt5L9JRrfprIHW+s6OlpNLVZEbt5Pu6R/kr8+3jaPjRSIdJL9ruYitjBmfB0UxZEhN3iQufDXNNuJTdGDSyEu9EerU/saJN5ADX5lRjmmVbFBkzn4OVq3nrEJ1HOGgEqsQTLMCoSum0PcAKmHoTsJOfp8/16prA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1dDbdgBbuRUF/R6Gp1XO1Prxllo1uu315sK6fAK/mI=;
 b=PsYcGbX6DpUduDnRiSchug9+NJkbOcrf+boYDMft7G3pfvTCsGZzmFOCcwFYjPJ3F92nNLrCGQvDyL4MB8GGmMKdpO68tjKM4+L9hWFIWKIgn/k8ylE1FnEIpk0XUSO5UlLwCo6E0d/gFFF7dUFwpByzgWXcvDjDo0ugPvsxPDWoQCI1Kz2PPYinYAc9qoFq27zOuE0Ibg9czs8jls6tbI0T5+cDqt47jF4iroWeMKktnF5vG47WtXy5wsnmMlx56JbV0VumxaVH6BlYxAHhL4fa2ICUxits0Yi8H8/xI3/brMMYJkdO+28oVCW9BYAIbF6WRWPmqnAe3kUwB0patw==
Received: from MW4PR03CA0221.namprd03.prod.outlook.com (2603:10b6:303:b9::16)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Mon, 28 Mar 2022 06:15:44 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::42) by MW4PR03CA0221.outlook.office365.com
 (2603:10b6:303:b9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.26 via Frontend
 Transport; Mon, 28 Mar 2022 06:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 06:15:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 28 Mar 2022 06:15:43 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 27 Mar
 2022 23:15:42 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Sun, 27 Mar 2022 23:15:38 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <peter.ujfalusi@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH v2 2/6] ASoC: dt-bindings: Add audio-graph-port bindings
 to rt5659
Date: Mon, 28 Mar 2022 11:44:06 +0530
Message-ID: <1648448050-15237-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57391aba-7eae-40cf-0626-08da10826464
X-MS-TrafficTypeDiagnostic: DM4PR12MB6010:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB6010EBEA7AD3E7C7A6444616A71D9@DM4PR12MB6010.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rk1G3ev2NNLfINnovFkEmIKeHJVYT3NGnalFdhWGUHlYVyA7py1xieLobZWnObQ6XdUZ7liaJ21f1BtcLOC1vMcQx8vBMp3r4gsN4XRYe9jtHCErumTqkqhiqAJ/ZChgY01QZjCmjdCGkM+2qAS6YOFCPTA/9Y4X9IIgNWEpce0fzEDsuao1dN8GQD4JKmf9eXjbbEuuzw9kkC6JTyux0eFioOxEkeJo7IltLGD88tOF/ldth/g27jnhHiUsxPQWQH8chdV3R57DFcL2VJxVxtrOCThBEKTwiwvhHROiuZ3Lski2U69FxywoHwfBZz0WrAqRgSHktvQbLSOvLETGLu319oSRsrYgg/M6a6GcrXHEwpDsfBfAlbeRy7onpvGg75okEha9uPUBmYMKP7QTPoKZVmIBlfrDywUd5k3OpItCuFQNAHaEkeAxa6VNeMyjQCzKUQyvYtMdcfBbsi90uToYLxeLZTbTlt11dHnK2ek7dlKkVEk6Sg9eCvRajD2wYGzgNrcH7orX5aJJxShsfpdVSE8UUUNgEsp+cQpuWKz9+26PYaMbR0rfy/eiwn4P2hP8pBJuKb5SM9UXjTMJA1uS6Bar44vgzBzrLJIS+Sfkx115qdToEmy2EuWIZB9euNE0gxdnueAXjnLbuIhJEoLpfhRggXvghoyZOXNuXdAl8OiBK6fPAxgs8O1jm7No28qEKiGtm8Nw8bQI2pmKAg==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82310400004)(7416002)(110136005)(8936002)(54906003)(4744005)(2906002)(86362001)(4326008)(8676002)(5660300002)(70586007)(316002)(356005)(81166007)(47076005)(70206006)(186003)(26005)(426003)(2616005)(336012)(107886003)(7696005)(40460700003)(36860700001)(36756003)(508600001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:15:44.1322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57391aba-7eae-40cf-0626-08da10826464
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010
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

To use rt5658 or rt5659 audio CODEC with generic audio-graph-card machine
driver, the CODEC requires "port" bindings. Thus add "audio-graph-port"
reference to the rt5659 binding.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
---
 Documentation/devicetree/bindings/sound/realtek,rt5659.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
index 3bd9b6f..b0485b8 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
@@ -84,6 +84,10 @@ properties:
 
   sound-name-prefix: true
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 required:
-- 
2.7.4

