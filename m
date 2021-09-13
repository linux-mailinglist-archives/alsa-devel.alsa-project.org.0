Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9B4099EC
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E81A017A1;
	Mon, 13 Sep 2021 18:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E81A017A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551759;
	bh=9hQV9wgh+7i+ImlxStZNduDNpYAWx6Y2VGobwwQ1PII=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKuvPEi2VGEMEB4K9/ANEA21FYqGCLaT7w6tiYj+UoUO71t4VKOO2Blw3uzU5VrJ7
	 e+Ez2uBimrGOBNW8b+LdRVO+E8YZDchMZX4E7hX0Ltl1X9RbVVJWRrDUMaQ3B4DuAb
	 nmvAN3y95O7DfVGpC14ldnBilapebI7uYYmwbDzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 517D6F80568;
	Mon, 13 Sep 2021 18:44:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5DA7F804E3; Mon, 13 Sep 2021 18:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96D53F8027C
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96D53F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="MrXQXort"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwPOCl50Vu8WtE0kUyWXjn4b6FL4IPV/4Zr2boq7kcRtO0toBOC5hDJQmLfqgsUWjGpBUR0+J/7zDbpjvovtqGh18aXvXEuL2kwCg4W78fzsqemTB62fsWYtMb/chsmUKhbEO19Si+YLTNXf/ylsDMyK89xWg2ybIqT2JL5XfFi8QpKAdkR0itwxddxXcyH7GQyEWYRbsJbw9iwxr3jIiYAhuDqO1+W+0RtE/jUym8gFrn0zEUHGEYKYRLAEI32HP18vZqoRfRPfe8d9f8lFJEEUAUnWc6sqRy1c68AVn3ne/jgxPUwAifysMlLTSnL7tvGVyXPjf+5hvIYfTM8Zzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5Sv49BjwBAc/XG2MQL1IUO4PQWmyH0R7fIh9dsZcEmY=;
 b=iF+WvGG2IbjmFpQKLjsVG4Rn1qCigaUoM8+nH9bX7+MSvvI7l8KZ8EhQeyc1nCD1gcfFsfSAJrHf37RRuw9lvgeVEPkkXOa0nsNlYACeUuZnuElnJ+CatPwfUh2kKiejzytXdj9Drpbw5p62Py8VG9+bTWCbejMLgyPKW0xAiHRv/81u/aZMoMoPm9Pk7r1pTIjCfPsD4oq5RwataznJlbvqKHOCW1p1V88XdGaD7A/Dk4VETBUmGHr1brED/e+JZjB1n/RkC4j6b8960JM0YDfizxeiwYTHxJ2nJYvEFBmKRx7TPD4SxrmITPqP6pPw3Z4uzxjVDMgpuIMbVSM+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Sv49BjwBAc/XG2MQL1IUO4PQWmyH0R7fIh9dsZcEmY=;
 b=MrXQXortZtKATn56fqjgKTVf4RrLY1Vv2uYxeh8E4yldFGkggXDrzLccEx1Yl/BJzMWRPj4Ah1eTShOLzlqM9jYvZaJWYMDcIreVni6sL3CqIIbD0FD73Om58ACkmx8PLZYjRh2kgPHVJ4NkiAe7bN0efxjvcABYFBYHTEY4E5puuNqhs6BmmxgUEJGGtb3DygBlr7FbT6FnwSQYlfoXiWp5SQr+VSfmcgl/m2/In8oohnlkf/BOmWz0zhkrkbcWyzaXpyxXof6YGgUG4Oq1o47RV903C1iE28iuPrUThS9C/uvcZv5ZKI1Lp0sk8zzI8Px6Wi7lNuWcj39IVv5R4A==
Received: from DM3PR12CA0071.namprd12.prod.outlook.com (2603:10b6:0:57::15) by
 DM6PR12MB4975.namprd12.prod.outlook.com (2603:10b6:5:1bd::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Mon, 13 Sep 2021 16:43:43 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::2e) by DM3PR12CA0071.outlook.office365.com
 (2603:10b6:0:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:43:41 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 09:43:39 -0700
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:36 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/13] arm64: tegra: Extend APE audio support on Jetson
 platforms
Date: Mon, 13 Sep 2021 22:12:21 +0530
Message-ID: <1631551342-25469-14-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b31f833-2f24-4baa-af7a-08d976d5a4e6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4975:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4975BEBA1A6F6B231CE11420A7D99@DM6PR12MB4975.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4sJEQCSE+vnI8MBH50/WBfOAbeRbVW7a/ODAPC+ztV/VlpMpbkSHhJANmbrvtTdU+EjPdRKpshQMo4J+ff9YzvetQFVmcTcyn648MbGSSJA+RwqAnY+i4Nnp9pb3nxL3mWfYM8cd8DYW4qyXC79O8Md2Yr+l1qqVhtJV7vGiNp+QwTycBt8UF2BCqeqBfATDbARk/RoCyoRQqBlwrYN5JYd7AL6nB/NkBxFLH8Ygh922jEb5TNzGviv2+id9NOVTuTpqRlR0GRbx4xC1N/V5vl+rMqU1uFh5BcG13dLmlXfCHpS54Z+TCCDB8bkT3rJFpTyATM3LIrfRpdyHZsauOi+KDSrOYO+4PvW2pS8MY+mkoO4XzWymU4az9+pujZwvm08+w3ttvu3SdGTYT7hx2qCmPTSh6xD1TuaOJP5+e2PyrUAJU8VnsOSOIW+F42BwuVRdsWygB/RqyT7zIpWeoY5TKetLDdZBuPgnRlZDfKMHsfWLTnAXgZY2gHaEcOKB9AjeuH9uw9eKBzWnvyRPBP0jSDstZpzt6f+PUCjBE2UEVacXovouCMGCEArBnmLPCcSelbI52ewUBzUAsrMlDirVXNXT6tRTc9anVHUg1fyiyfsZTaLp+spMMPIVaBdgmiX+rWrhSVlJnCafHK5WNgI770PoesT/0NfnsDSTJCXlyVD1vAk3kpP5VKr8bveNsPrj3/THUqs/iW1I1SKBz3zZMI2UdYX3jXWphXj5BNkKRgdXxlrPdGZXbGVyC3f3
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(70206006)(54906003)(40140700001)(4326008)(336012)(6666004)(478600001)(2616005)(921005)(110136005)(83380400001)(70586007)(30864003)(66574015)(8936002)(7636003)(86362001)(82310400003)(316002)(36860700001)(356005)(2906002)(26005)(82740400003)(107886003)(426003)(47076005)(7696005)(36756003)(186003)(8676002)(7416002)(5660300002)(21314003)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:43:41.5189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b31f833-2f24-4baa-af7a-08d976d5a4e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4975
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
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

Extend APE audio support by adding more audio components such as SFC,
MVC, AMX, ADX and Mixer. These components can be plugged into an audio
path and required processing can be done. ASoC audio-graph based sound
driver is used to facilitate this and thus extend sound bindings as
well.

The components in the path may require different PCM parameters (such
as sample rate, channels or sample size). Depending on the pre-defined
audio paths, these can be statically configured with "convert-xxx" DT
properties in endpoint subnode. The support for the rate and channel
conversion is already available in generic audio-graph driver. Sample
size conversion support can be added based on the need in future.

The support is extended for following platforms:
 * Jertson TX1
 * Jetson Nano
 * Jetson TX2
 * Jetson AGX Xavier
 * Jetson Xavier NX

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1554 ++++++++++++++++++--
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 1493 +++++++++++++++++--
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 1520 +++++++++++++++++--
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  876 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  876 +++++++++++
 5 files changed, 5900 insertions(+), 419 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 74c1a5d..52fa258 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -275,178 +275,1097 @@
 						remote-endpoint = <&dspk2_cif_ep>;
 					};
 				};
+
+				xbar_sfc1_in_port: port@20 {
+					reg = <0x20>;
+
+					xbar_sfc1_in_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_in_ep>;
+					};
+				};
+
+				port@21 {
+					reg = <0x21>;
+
+					xbar_sfc1_out_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc2_in_port: port@22 {
+					reg = <0x22>;
+
+					xbar_sfc2_in_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_in_ep>;
+					};
+				};
+
+				port@23 {
+					reg = <0x23>;
+
+					xbar_sfc2_out_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc3_in_port: port@24 {
+					reg = <0x24>;
+
+					xbar_sfc3_in_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_in_ep>;
+					};
+				};
+
+				port@25 {
+					reg = <0x25>;
+
+					xbar_sfc3_out_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc4_in_port: port@26 {
+					reg = <0x26>;
+
+					xbar_sfc4_in_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_in_ep>;
+					};
+				};
+
+				port@27 {
+					reg = <0x27>;
+
+					xbar_sfc4_out_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc1_in_port: port@28 {
+					reg = <0x28>;
+
+					xbar_mvc1_in_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_in_ep>;
+					};
+				};
+
+				port@29 {
+					reg = <0x29>;
+
+					xbar_mvc1_out_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc2_in_port: port@2a {
+					reg = <0x2a>;
+
+					xbar_mvc2_in_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_in_ep>;
+					};
+				};
+
+				port@2b {
+					reg = <0x2b>;
+
+					xbar_mvc2_out_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_out_ep>;
+					};
+				};
+
+				xbar_amx1_in1_port: port@2c {
+					reg = <0x2c>;
+
+					xbar_amx1_in1_ep: endpoint {
+						remote-endpoint = <&amx1_in1_ep>;
+					};
+				};
+
+				xbar_amx1_in2_port: port@2d {
+					reg = <0x2d>;
+
+					xbar_amx1_in2_ep: endpoint {
+						remote-endpoint = <&amx1_in2_ep>;
+					};
+				};
+
+				xbar_amx1_in3_port: port@2e {
+					reg = <0x2e>;
+
+					xbar_amx1_in3_ep: endpoint {
+						remote-endpoint = <&amx1_in3_ep>;
+					};
+				};
+
+				xbar_amx1_in4_port: port@2f {
+					reg = <0x2f>;
+
+					xbar_amx1_in4_ep: endpoint {
+						remote-endpoint = <&amx1_in4_ep>;
+					};
+				};
+
+				port@30 {
+					reg = <0x30>;
+
+					xbar_amx1_out_ep: endpoint {
+						remote-endpoint = <&amx1_out_ep>;
+					};
+				};
+
+				xbar_amx2_in1_port: port@31 {
+					reg = <0x31>;
+
+					xbar_amx2_in1_ep: endpoint {
+						remote-endpoint = <&amx2_in1_ep>;
+					};
+				};
+
+				xbar_amx2_in2_port: port@32 {
+					reg = <0x32>;
+
+					xbar_amx2_in2_ep: endpoint {
+						remote-endpoint = <&amx2_in2_ep>;
+					};
+				};
+
+				xbar_amx2_in3_port: port@33 {
+					reg = <0x33>;
+
+					xbar_amx2_in3_ep: endpoint {
+						remote-endpoint = <&amx2_in3_ep>;
+					};
+				};
+
+				xbar_amx2_in4_port: port@34 {
+					reg = <0x34>;
+
+					xbar_amx2_in4_ep: endpoint {
+						remote-endpoint = <&amx2_in4_ep>;
+					};
+				};
+
+				port@35 {
+					reg = <0x35>;
+
+					xbar_amx2_out_ep: endpoint {
+						remote-endpoint = <&amx2_out_ep>;
+					};
+				};
+
+				xbar_amx3_in1_port: port@36 {
+					reg = <0x36>;
+
+					xbar_amx3_in1_ep: endpoint {
+						remote-endpoint = <&amx3_in1_ep>;
+					};
+				};
+
+				xbar_amx3_in2_port: port@37 {
+					reg = <0x37>;
+
+					xbar_amx3_in2_ep: endpoint {
+						remote-endpoint = <&amx3_in2_ep>;
+					};
+				};
+
+				xbar_amx3_in3_port: port@38 {
+					reg = <0x38>;
+
+					xbar_amx3_in3_ep: endpoint {
+						remote-endpoint = <&amx3_in3_ep>;
+					};
+				};
+
+				xbar_amx3_in4_port: port@39 {
+					reg = <0x39>;
+
+					xbar_amx3_in4_ep: endpoint {
+						remote-endpoint = <&amx3_in4_ep>;
+					};
+				};
+
+				port@3a {
+					reg = <0x3a>;
+
+					xbar_amx3_out_ep: endpoint {
+						remote-endpoint = <&amx3_out_ep>;
+					};
+				};
+
+				xbar_amx4_in1_port: port@3b {
+					reg = <0x3b>;
+
+					xbar_amx4_in1_ep: endpoint {
+						remote-endpoint = <&amx4_in1_ep>;
+					};
+				};
+
+				xbar_amx4_in2_port: port@3c {
+					reg = <0x3c>;
+
+					xbar_amx4_in2_ep: endpoint {
+						remote-endpoint = <&amx4_in2_ep>;
+					};
+				};
+
+				xbar_amx4_in3_port: port@3d {
+					reg = <0x3d>;
+
+					xbar_amx4_in3_ep: endpoint {
+						remote-endpoint = <&amx4_in3_ep>;
+					};
+				};
+
+				xbar_amx4_in4_port: port@3e {
+					reg = <0x3e>;
+
+					xbar_amx4_in4_ep: endpoint {
+						remote-endpoint = <&amx4_in4_ep>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					xbar_amx4_out_ep: endpoint {
+						remote-endpoint = <&amx4_out_ep>;
+					};
+				};
+
+				xbar_adx1_in_port: port@40 {
+					reg = <0x40>;
+
+					xbar_adx1_in_ep: endpoint {
+						remote-endpoint = <&adx1_in_ep>;
+					};
+				};
+
+				port@41 {
+					reg = <0x41>;
+
+					xbar_adx1_out1_ep: endpoint {
+						remote-endpoint = <&adx1_out1_ep>;
+					};
+				};
+
+				port@42 {
+					reg = <0x42>;
+
+					xbar_adx1_out2_ep: endpoint {
+						remote-endpoint = <&adx1_out2_ep>;
+					};
+				};
+
+				port@43 {
+					reg = <0x43>;
+
+					xbar_adx1_out3_ep: endpoint {
+						remote-endpoint = <&adx1_out3_ep>;
+					};
+				};
+
+				port@44 {
+					reg = <0x44>;
+
+					xbar_adx1_out4_ep: endpoint {
+						remote-endpoint = <&adx1_out4_ep>;
+					};
+				};
+
+				xbar_adx2_in_port: port@45 {
+					reg = <0x45>;
+
+					xbar_adx2_in_ep: endpoint {
+						remote-endpoint = <&adx2_in_ep>;
+					};
+				};
+
+				port@46 {
+					reg = <0x46>;
+
+					xbar_adx2_out1_ep: endpoint {
+						remote-endpoint = <&adx2_out1_ep>;
+					};
+				};
+
+				port@47 {
+					reg = <0x47>;
+
+					xbar_adx2_out2_ep: endpoint {
+						remote-endpoint = <&adx2_out2_ep>;
+					};
+				};
+
+				port@48 {
+					reg = <0x48>;
+
+					xbar_adx2_out3_ep: endpoint {
+						remote-endpoint = <&adx2_out3_ep>;
+					};
+				};
+
+				port@49 {
+					reg = <0x49>;
+
+					xbar_adx2_out4_ep: endpoint {
+						remote-endpoint = <&adx2_out4_ep>;
+					};
+				};
+
+				xbar_adx3_in_port: port@4a {
+					reg = <0x4a>;
+
+					xbar_adx3_in_ep: endpoint {
+						remote-endpoint = <&adx3_in_ep>;
+					};
+				};
+
+				port@4b {
+					reg = <0x4b>;
+
+					xbar_adx3_out1_ep: endpoint {
+						remote-endpoint = <&adx3_out1_ep>;
+					};
+				};
+
+				port@4c {
+					reg = <0x4c>;
+
+					xbar_adx3_out2_ep: endpoint {
+						remote-endpoint = <&adx3_out2_ep>;
+					};
+				};
+
+				port@4d {
+					reg = <0x4d>;
+
+					xbar_adx3_out3_ep: endpoint {
+						remote-endpoint = <&adx3_out3_ep>;
+					};
+				};
+
+				port@4e {
+					reg = <0x4e>;
+
+					xbar_adx3_out4_ep: endpoint {
+						remote-endpoint = <&adx3_out4_ep>;
+					};
+				};
+
+				xbar_adx4_in_port: port@4f {
+					reg = <0x4f>;
+
+					xbar_adx4_in_ep: endpoint {
+						remote-endpoint = <&adx4_in_ep>;
+					};
+				};
+
+				port@50 {
+					reg = <0x50>;
+
+					xbar_adx4_out1_ep: endpoint {
+						remote-endpoint = <&adx4_out1_ep>;
+					};
+				};
+
+				port@51 {
+					reg = <0x51>;
+
+					xbar_adx4_out2_ep: endpoint {
+						remote-endpoint = <&adx4_out2_ep>;
+					};
+				};
+
+				port@52 {
+					reg = <0x52>;
+
+					xbar_adx4_out3_ep: endpoint {
+						remote-endpoint = <&adx4_out3_ep>;
+					};
+				};
+
+				port@53 {
+					reg = <0x53>;
+
+					xbar_adx4_out4_ep: endpoint {
+						remote-endpoint = <&adx4_out4_ep>;
+					};
+				};
+
+				xbar_mixer_in1_port: port@54 {
+					reg = <0x54>;
+
+					xbar_mixer_in1_ep: endpoint {
+						remote-endpoint = <&mixer_in1_ep>;
+					};
+				};
+
+				xbar_mixer_in2_port: port@55 {
+					reg = <0x55>;
+
+					xbar_mixer_in2_ep: endpoint {
+						remote-endpoint = <&mixer_in2_ep>;
+					};
+				};
+
+				xbar_mixer_in3_port: port@56 {
+					reg = <0x56>;
+
+					xbar_mixer_in3_ep: endpoint {
+						remote-endpoint = <&mixer_in3_ep>;
+					};
+				};
+
+				xbar_mixer_in4_port: port@57 {
+					reg = <0x57>;
+
+					xbar_mixer_in4_ep: endpoint {
+						remote-endpoint = <&mixer_in4_ep>;
+					};
+				};
+
+				xbar_mixer_in5_port: port@58 {
+					reg = <0x58>;
+
+					xbar_mixer_in5_ep: endpoint {
+						remote-endpoint = <&mixer_in5_ep>;
+					};
+				};
+
+				xbar_mixer_in6_port: port@59 {
+					reg = <0x59>;
+
+					xbar_mixer_in6_ep: endpoint {
+						remote-endpoint = <&mixer_in6_ep>;
+					};
+				};
+
+				xbar_mixer_in7_port: port@5a {
+					reg = <0x5a>;
+
+					xbar_mixer_in7_ep: endpoint {
+						remote-endpoint = <&mixer_in7_ep>;
+					};
+				};
+
+				xbar_mixer_in8_port: port@5b {
+					reg = <0x5b>;
+
+					xbar_mixer_in8_ep: endpoint {
+						remote-endpoint = <&mixer_in8_ep>;
+					};
+				};
+
+				xbar_mixer_in9_port: port@5c {
+					reg = <0x5c>;
+
+					xbar_mixer_in9_ep: endpoint {
+						remote-endpoint = <&mixer_in9_ep>;
+					};
+				};
+
+				xbar_mixer_in10_port: port@5d {
+					reg = <0x5d>;
+
+					xbar_mixer_in10_ep: endpoint {
+						remote-endpoint = <&mixer_in10_ep>;
+					};
+				};
+
+				port@5e {
+					reg = <0x5e>;
+
+					xbar_mixer_out1_ep: endpoint {
+						remote-endpoint = <&mixer_out1_ep>;
+					};
+				};
+
+				port@5f {
+					reg = <0x5f>;
+
+					xbar_mixer_out2_ep: endpoint {
+						remote-endpoint = <&mixer_out2_ep>;
+					};
+				};
+
+				port@60 {
+					reg = <0x60>;
+
+					xbar_mixer_out3_ep: endpoint {
+						remote-endpoint = <&mixer_out3_ep>;
+					};
+				};
+
+				port@61 {
+					reg = <0x61>;
+
+					xbar_mixer_out4_ep: endpoint {
+						remote-endpoint = <&mixer_out4_ep>;
+					};
+				};
+
+				port@62 {
+					reg = <0x62>;
+
+					xbar_mixer_out5_ep: endpoint {
+						remote-endpoint = <&mixer_out5_ep>;
+					};
+				};
+			};
+
+			admaif@290f000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					admaif0_port: port@0 {
+						reg = <0x0>;
+
+						admaif0_ep: endpoint {
+							remote-endpoint = <&xbar_admaif0_ep>;
+						};
+					};
+
+					admaif1_port: port@1 {
+						reg = <0x1>;
+
+						admaif1_ep: endpoint {
+							remote-endpoint = <&xbar_admaif1_ep>;
+						};
+					};
+
+					admaif2_port: port@2 {
+						reg = <0x2>;
+
+						admaif2_ep: endpoint {
+							remote-endpoint = <&xbar_admaif2_ep>;
+						};
+					};
+
+					admaif3_port: port@3 {
+						reg = <0x3>;
+
+						admaif3_ep: endpoint {
+							remote-endpoint = <&xbar_admaif3_ep>;
+						};
+					};
+
+					admaif4_port: port@4 {
+						reg = <0x4>;
+
+						admaif4_ep: endpoint {
+							remote-endpoint = <&xbar_admaif4_ep>;
+						};
+					};
+
+					admaif5_port: port@5 {
+						reg = <0x5>;
+
+						admaif5_ep: endpoint {
+							remote-endpoint = <&xbar_admaif5_ep>;
+						};
+					};
+
+					admaif6_port: port@6 {
+						reg = <0x6>;
+
+						admaif6_ep: endpoint {
+							remote-endpoint = <&xbar_admaif6_ep>;
+						};
+					};
+
+					admaif7_port: port@7 {
+						reg = <0x7>;
+
+						admaif7_ep: endpoint {
+							remote-endpoint = <&xbar_admaif7_ep>;
+						};
+					};
+
+					admaif8_port: port@8 {
+						reg = <0x8>;
+
+						admaif8_ep: endpoint {
+							remote-endpoint = <&xbar_admaif8_ep>;
+						};
+					};
+
+					admaif9_port: port@9 {
+						reg = <0x9>;
+
+						admaif9_ep: endpoint {
+							remote-endpoint = <&xbar_admaif9_ep>;
+						};
+					};
+
+					admaif10_port: port@a {
+						reg = <0xa>;
+
+						admaif10_ep: endpoint {
+							remote-endpoint = <&xbar_admaif10_ep>;
+						};
+					};
+
+					admaif11_port: port@b {
+						reg = <0xb>;
+
+						admaif11_ep: endpoint {
+							remote-endpoint = <&xbar_admaif11_ep>;
+						};
+					};
+
+					admaif12_port: port@c {
+						reg = <0xc>;
+
+						admaif12_ep: endpoint {
+							remote-endpoint = <&xbar_admaif12_ep>;
+						};
+					};
+
+					admaif13_port: port@d {
+						reg = <0xd>;
+
+						admaif13_ep: endpoint {
+							remote-endpoint = <&xbar_admaif13_ep>;
+						};
+					};
+
+					admaif14_port: port@e {
+						reg = <0xe>;
+
+						admaif14_ep: endpoint {
+							remote-endpoint = <&xbar_admaif14_ep>;
+						};
+					};
+
+					admaif15_port: port@f {
+						reg = <0xf>;
+
+						admaif15_ep: endpoint {
+							remote-endpoint = <&xbar_admaif15_ep>;
+						};
+					};
+
+					admaif16_port: port@10 {
+						reg = <0x10>;
+
+						admaif16_ep: endpoint {
+							remote-endpoint = <&xbar_admaif16_ep>;
+						};
+					};
+
+					admaif17_port: port@11 {
+						reg = <0x11>;
+
+						admaif17_ep: endpoint {
+							remote-endpoint = <&xbar_admaif17_ep>;
+						};
+					};
+
+					admaif18_port: port@12 {
+						reg = <0x12>;
+
+						admaif18_ep: endpoint {
+							remote-endpoint = <&xbar_admaif18_ep>;
+						};
+					};
+
+					admaif19_port: port@13 {
+						reg = <0x13>;
+
+						admaif19_ep: endpoint {
+							remote-endpoint = <&xbar_admaif19_ep>;
+						};
+					};
+				};
+			};
+
+			i2s@2901000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s1_ep>;
+						};
+					};
+
+					i2s1_port: port@1 {
+						reg = <1>;
+
+						i2s1_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901100 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s2_ep>;
+						};
+					};
+
+					i2s2_port: port@1 {
+						reg = <1>;
+
+						i2s2_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s3_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s3_ep>;
+						};
+					};
+
+					i2s3_port: port@1 {
+						reg = <1>;
+
+						i2s3_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
 			};
 
-			admaif@290f000 {
+			i2s@2901300 {
 				status = "okay";
 
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					admaif0_port: port@0 {
-						reg = <0x0>;
+					port@0 {
+						reg = <0>;
 
-						admaif0_ep: endpoint {
-							remote-endpoint = <&xbar_admaif0_ep>;
+						i2s4_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s4_ep>;
 						};
 					};
 
-					admaif1_port: port@1 {
-						reg = <0x1>;
+					i2s4_port: port@1 {
+						reg = <1>;
 
-						admaif1_ep: endpoint {
-							remote-endpoint = <&xbar_admaif1_ep>;
+						i2s4_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif2_port: port@2 {
-						reg = <0x2>;
+			i2s@2901400 {
+				status = "okay";
 
-						admaif2_ep: endpoint {
-							remote-endpoint = <&xbar_admaif2_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s5_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s5_ep>;
 						};
 					};
 
-					admaif3_port: port@3 {
-						reg = <0x3>;
+					i2s5_port: port@1 {
+						reg = <1>;
 
-						admaif3_ep: endpoint {
-							remote-endpoint = <&xbar_admaif3_ep>;
+						i2s5_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif4_port: port@4 {
-						reg = <0x4>;
+			i2s@2901500 {
+				status = "okay";
 
-						admaif4_ep: endpoint {
-							remote-endpoint = <&xbar_admaif4_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						i2s6_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s6_ep>;
 						};
 					};
 
-					admaif5_port: port@5 {
-						reg = <0x5>;
+					i2s6_port: port@1 {
+						reg = <1>;
 
-						admaif5_ep: endpoint {
-							remote-endpoint = <&xbar_admaif5_ep>;
+						i2s6_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif6_port: port@6 {
-						reg = <0x6>;
+			dmic@2904000 {
+				status = "okay";
 
-						admaif6_ep: endpoint {
-							remote-endpoint = <&xbar_admaif6_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic1_ep>;
 						};
 					};
 
-					admaif7_port: port@7 {
-						reg = <0x7>;
+					dmic1_port: port@1 {
+						reg = <1>;
 
-						admaif7_ep: endpoint {
-							remote-endpoint = <&xbar_admaif7_ep>;
+						dmic1_dap_ep: endpoint {
+							/* Place holder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif8_port: port@8 {
-						reg = <0x8>;
+			dmic@2904100 {
+				status = "okay";
 
-						admaif8_ep: endpoint {
-							remote-endpoint = <&xbar_admaif8_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic2_ep>;
 						};
 					};
 
-					admaif9_port: port@9 {
-						reg = <0x9>;
+					dmic2_port: port@1 {
+						reg = <1>;
 
-						admaif9_ep: endpoint {
-							remote-endpoint = <&xbar_admaif9_ep>;
+						dmic2_dap_ep: endpoint {
+							/* Place holder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif10_port: port@a {
-						reg = <0xa>;
+			dmic@2904200 {
+				status = "okay";
 
-						admaif10_ep: endpoint {
-							remote-endpoint = <&xbar_admaif10_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dmic3_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic3_ep>;
 						};
 					};
 
-					admaif11_port: port@b {
-						reg = <0xb>;
+					dmic3_port: port@1 {
+						reg = <1>;
 
-						admaif11_ep: endpoint {
-							remote-endpoint = <&xbar_admaif11_ep>;
+						dmic3_dap_ep: endpoint {
+							/* Place holder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif12_port: port@c {
-						reg = <0xc>;
+			dspk@2905000 {
+				status = "okay";
 
-						admaif12_ep: endpoint {
-							remote-endpoint = <&xbar_admaif12_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dspk1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dspk1_ep>;
 						};
 					};
 
-					admaif13_port: port@d {
-						reg = <0xd>;
+					dspk1_port: port@1 {
+						reg = <1>;
 
-						admaif13_ep: endpoint {
-							remote-endpoint = <&xbar_admaif13_ep>;
+						dspk1_dap_ep: endpoint {
+							/* Place holder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif14_port: port@e {
-						reg = <0xe>;
+			dspk@2905100 {
+				status = "okay";
 
-						admaif14_ep: endpoint {
-							remote-endpoint = <&xbar_admaif14_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dspk2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dspk2_ep>;
 						};
 					};
 
-					admaif15_port: port@f {
-						reg = <0xf>;
+					dspk2_port: port@1 {
+						reg = <1>;
 
-						admaif15_ep: endpoint {
-							remote-endpoint = <&xbar_admaif15_ep>;
+						dspk2_dap_ep: endpoint {
+							/* Place holder for external Codec */
 						};
 					};
+				};
+			};
 
-					admaif16_port: port@10 {
-						reg = <0x10>;
+			sfc@2902000 {
+				status = "okay";
 
-						admaif16_ep: endpoint {
-							remote-endpoint = <&xbar_admaif16_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_in_ep>;
+							convert-rate = <44100>;
 						};
 					};
 
-					admaif17_port: port@11 {
-						reg = <0x11>;
+					sfc1_out_port: port@1 {
+						reg = <1>;
 
-						admaif17_ep: endpoint {
-							remote-endpoint = <&xbar_admaif17_ep>;
+						sfc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_out_ep>;
+							convert-rate = <48000>;
+						};
+					};
+				};
+			};
+
+			sfc@2902200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_in_ep>;
+						};
+					};
+
+					sfc2_out_port: port@1 {
+						reg = <1>;
+
+						sfc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_out_ep>;
+						};
+					};
+				};
+			};
+
+			sfc@2902400 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc3_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_in_ep>;
+						};
+					};
+
+					sfc3_out_port: port@1 {
+						reg = <1>;
+
+						sfc3_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_out_ep>;
 						};
 					};
+				};
+			};
 
-					admaif18_port: port@12 {
-						reg = <0x12>;
+			sfc@2902600 {
+				status = "okay";
 
-						admaif18_ep: endpoint {
-							remote-endpoint = <&xbar_admaif18_ep>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc4_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_in_ep>;
 						};
 					};
 
-					admaif19_port: port@13 {
-						reg = <0x13>;
+					sfc4_out_port: port@1 {
+						reg = <1>;
 
-						admaif19_ep: endpoint {
-							remote-endpoint = <&xbar_admaif19_ep>;
+						sfc4_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_out_ep>;
 						};
 					};
 				};
 			};
 
-			i2s@2901000 {
+			mvc@290a000 {
 				status = "okay";
 
 				ports {
@@ -456,23 +1375,22 @@
 					port@0 {
 						reg = <0>;
 
-						i2s1_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s1_ep>;
+						mvc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_in_ep>;
 						};
 					};
 
-					i2s1_port: port@1 {
+					mvc1_out_port: port@1 {
 						reg = <1>;
 
-						i2s1_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
+						mvc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_out_ep>;
 						};
 					};
 				};
 			};
 
-			i2s@2901100 {
+			mvc@290a200 {
 				status = "okay";
 
 				ports {
@@ -482,23 +1400,22 @@
 					port@0 {
 						reg = <0>;
 
-						i2s2_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s2_ep>;
+						mvc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_in_ep>;
 						};
 					};
 
-					i2s2_port: port@1 {
+					mvc2_out_port: port@1 {
 						reg = <1>;
 
-						i2s2_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
+						mvc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_out_ep>;
 						};
 					};
 				};
 			};
 
-			i2s@2901200 {
+			amx@2903000 {
 				status = "okay";
 
 				ports {
@@ -508,23 +1425,46 @@
 					port@0 {
 						reg = <0>;
 
-						i2s3_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s3_ep>;
+						amx1_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in1_ep>;
 						};
 					};
 
-					i2s3_port: port@1 {
+					port@1 {
 						reg = <1>;
 
-						i2s3_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
+						amx1_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						amx1_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						amx1_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in4_ep>;
+						};
+					};
+
+					amx1_out_port: port@4 {
+						reg = <4>;
+
+						amx1_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_out_ep>;
 						};
 					};
 				};
 			};
 
-			i2s@2901300 {
+			amx@2903100 {
 				status = "okay";
 
 				ports {
@@ -534,23 +1474,46 @@
 					port@0 {
 						reg = <0>;
 
-						i2s4_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s4_ep>;
+						amx2_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in1_ep>;
 						};
 					};
 
-					i2s4_port: port@1 {
+					port@1 {
 						reg = <1>;
 
-						i2s4_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
+						amx2_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in2_ep>;
+						};
+					};
+
+					amx2_in3_port: port@2 {
+						reg = <2>;
+
+						amx2_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in3_ep>;
+						};
+					};
+
+					amx2_in4_port: port@3 {
+						reg = <3>;
+
+						amx2_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in4_ep>;
+						};
+					};
+
+					amx2_out_port: port@4 {
+						reg = <4>;
+
+						amx2_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_out_ep>;
 						};
 					};
 				};
 			};
 
-			i2s@2901400 {
+			amx@2903200 {
 				status = "okay";
 
 				ports {
@@ -560,23 +1523,46 @@
 					port@0 {
 						reg = <0>;
 
-						i2s5_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s5_ep>;
+						amx3_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx3_in1_ep>;
 						};
 					};
 
-					i2s5_port: port@1 {
+					port@1 {
 						reg = <1>;
 
-						i2s5_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
+						amx3_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx3_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						amx3_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx3_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						amx3_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx3_in4_ep>;
+						};
+					};
+
+					amx3_out_port: port@4 {
+						reg = <4>;
+
+						amx3_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx3_out_ep>;
 						};
 					};
 				};
 			};
 
-			i2s@2901500 {
+			amx@2903300 {
 				status = "okay";
 
 				ports {
@@ -586,23 +1572,46 @@
 					port@0 {
 						reg = <0>;
 
-						i2s6_cif_ep: endpoint {
-							remote-endpoint = <&xbar_i2s6_ep>;
+						amx4_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx4_in1_ep>;
 						};
 					};
 
-					i2s6_port: port@1 {
+					port@1 {
 						reg = <1>;
 
-						i2s6_dap_ep: endpoint {
-							dai-format = "i2s";
-							/* Placeholder for external Codec */
+						amx4_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx4_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						amx4_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx4_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						amx4_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx4_in4_ep>;
+						};
+					};
+
+					amx4_out_port: port@4 {
+						reg = <4>;
+
+						amx4_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx4_out_ep>;
 						};
 					};
 				};
 			};
 
-			dmic@2904000 {
+			adx@2903800 {
 				status = "okay";
 
 				ports {
@@ -612,22 +1621,46 @@
 					port@0 {
 						reg = <0>;
 
-						dmic1_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic1_ep>;
+						adx1_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_in_ep>;
 						};
 					};
 
-					dmic1_port: port@1 {
+					adx1_out1_port: port@1 {
 						reg = <1>;
 
-						dmic1_dap_ep: endpoint {
-							/* Place holder for external Codec */
+						adx1_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out1_ep>;
+						};
+					};
+
+					adx1_out2_port: port@2 {
+						reg = <2>;
+
+						adx1_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out2_ep>;
+						};
+					};
+
+					adx1_out3_port: port@3 {
+						reg = <3>;
+
+						adx1_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out3_ep>;
+						};
+					};
+
+					adx1_out4_port: port@4 {
+						reg = <4>;
+
+						adx1_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out4_ep>;
 						};
 					};
 				};
 			};
 
-			dmic@2904100 {
+			adx@2903900 {
 				status = "okay";
 
 				ports {
@@ -637,22 +1670,46 @@
 					port@0 {
 						reg = <0>;
 
-						dmic2_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic2_ep>;
+						adx2_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_in_ep>;
 						};
 					};
 
-					dmic2_port: port@1 {
+					adx2_out1_port: port@1 {
 						reg = <1>;
 
-						dmic2_dap_ep: endpoint {
-							/* Place holder for external Codec */
+						adx2_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out1_ep>;
+						};
+					};
+
+					adx2_out2_port: port@2 {
+						reg = <2>;
+
+						adx2_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out2_ep>;
+						};
+					};
+
+					adx2_out3_port: port@3 {
+						reg = <3>;
+
+						adx2_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out3_ep>;
+						};
+					};
+
+					adx2_out4_port: port@4 {
+						reg = <4>;
+
+						adx2_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out4_ep>;
 						};
 					};
 				};
 			};
 
-			dmic@2904200 {
+			adx@2903a00 {
 				status = "okay";
 
 				ports {
@@ -662,22 +1719,46 @@
 					port@0 {
 						reg = <0>;
 
-						dmic3_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dmic3_ep>;
+						adx3_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx3_in_ep>;
 						};
 					};
 
-					dmic3_port: port@1 {
+					adx3_out1_port: port@1 {
 						reg = <1>;
 
-						dmic3_dap_ep: endpoint {
-							/* Place holder for external Codec */
+						adx3_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx3_out1_ep>;
+						};
+					};
+
+					adx3_out2_port: port@2 {
+						reg = <2>;
+
+						adx3_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx3_out2_ep>;
+						};
+					};
+
+					adx3_out3_port: port@3 {
+						reg = <3>;
+
+						adx3_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx3_out3_ep>;
+						};
+					};
+
+					adx3_out4_port: port@4 {
+						reg = <4>;
+
+						adx3_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx3_out4_ep>;
 						};
 					};
 				};
 			};
 
-			dspk@2905000 {
+			adx@2903b00 {
 				status = "okay";
 
 				ports {
@@ -687,22 +1768,46 @@
 					port@0 {
 						reg = <0>;
 
-						dspk1_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dspk1_ep>;
+						adx4_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx4_in_ep>;
 						};
 					};
 
-					dspk1_port: port@1 {
+					adx4_out1_port: port@1 {
 						reg = <1>;
 
-						dspk1_dap_ep: endpoint {
-							/* Place holder for external Codec */
+						adx4_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx4_out1_ep>;
+						};
+					};
+
+					adx4_out2_port: port@2 {
+						reg = <2>;
+
+						adx4_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx4_out2_ep>;
+						};
+					};
+
+					adx4_out3_port: port@3 {
+						reg = <3>;
+
+						adx4_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx4_out3_ep>;
+						};
+					};
+
+					adx4_out4_port: port@4 {
+						reg = <4>;
+
+						adx4_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx4_out4_ep>;
 						};
 					};
 				};
 			};
 
-			dspk@2905100 {
+			amixer@290bb00 {
 				status = "okay";
 
 				ports {
@@ -710,18 +1815,122 @@
 					#size-cells = <0>;
 
 					port@0 {
-						reg = <0>;
+						reg = <0x0>;
 
-						dspk2_cif_ep: endpoint {
-							remote-endpoint = <&xbar_dspk2_ep>;
+						mixer_in1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in1_ep>;
 						};
 					};
 
-					dspk2_port: port@1 {
-						reg = <1>;
+					port@1 {
+						reg = <0x1>;
 
-						dspk2_dap_ep: endpoint {
-							/* Place holder for external Codec */
+						mixer_in2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <0x2>;
+
+						mixer_in3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <0x3>;
+
+						mixer_in4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in4_ep>;
+						};
+					};
+
+					port@4 {
+						reg = <0x4>;
+
+						mixer_in5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in5_ep>;
+						};
+					};
+
+					port@5 {
+						reg = <0x5>;
+
+						mixer_in6_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in6_ep>;
+						};
+					};
+
+					port@6 {
+						reg = <0x6>;
+
+						mixer_in7_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in7_ep>;
+						};
+					};
+
+					port@7 {
+						reg = <0x7>;
+
+						mixer_in8_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in8_ep>;
+						};
+					};
+
+					port@8 {
+						reg = <0x8>;
+
+						mixer_in9_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in9_ep>;
+						};
+					};
+
+					port@9 {
+						reg = <0x9>;
+
+						mixer_in10_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in10_ep>;
+						};
+					};
+
+					mixer_out1_port: port@a {
+						reg = <0xa>;
+
+						mixer_out1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out1_ep>;
+						};
+					};
+
+					mixer_out2_port: port@b {
+						reg = <0xb>;
+
+						mixer_out2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out2_ep>;
+						};
+					};
+
+					mixer_out3_port: port@c {
+						reg = <0xc>;
+
+						mixer_out3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out3_ep>;
+						};
+					};
+
+					mixer_out4_port: port@d {
+						reg = <0xd>;
+
+						mixer_out4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out4_ep>;
+						};
+					};
+
+					mixer_out5_port: port@e {
+						reg = <0xe>;
+
+						mixer_out5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out5_ep>;
 						};
 					};
 				};
@@ -1104,6 +2313,41 @@
 		       <&xbar_i2s4_port>, <&xbar_i2s5_port>, <&xbar_i2s6_port>,
 		       <&xbar_dmic1_port>, <&xbar_dmic2_port>, <&xbar_dmic3_port>,
 		       <&xbar_dspk1_port>, <&xbar_dspk2_port>,
+		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
+		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
+		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
+		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
+		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
+		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
+		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
+		       <&xbar_amx3_in1_port>, <&xbar_amx3_in2_port>,
+		       <&xbar_amx3_in3_port>, <&xbar_amx3_in4_port>,
+		       <&xbar_amx4_in1_port>, <&xbar_amx4_in2_port>,
+		       <&xbar_amx4_in3_port>, <&xbar_amx4_in4_port>,
+		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
+		       <&xbar_adx3_in_port>, <&xbar_adx4_in_port>,
+		       <&xbar_mixer_in1_port>, <&xbar_mixer_in2_port>,
+		       <&xbar_mixer_in3_port>, <&xbar_mixer_in4_port>,
+		       <&xbar_mixer_in5_port>, <&xbar_mixer_in6_port>,
+		       <&xbar_mixer_in7_port>, <&xbar_mixer_in8_port>,
+		       <&xbar_mixer_in9_port>, <&xbar_mixer_in10_port>,
+		       /* HW accelerators */
+		       <&sfc1_out_port>, <&sfc2_out_port>,
+		       <&sfc3_out_port>, <&sfc4_out_port>,
+		       <&mvc1_out_port>, <&mvc2_out_port>,
+		       <&amx1_out_port>, <&amx2_out_port>,
+		       <&amx3_out_port>, <&amx4_out_port>,
+		       <&adx1_out1_port>, <&adx1_out2_port>,
+		       <&adx1_out3_port>, <&adx1_out4_port>,
+		       <&adx2_out1_port>, <&adx2_out2_port>,
+		       <&adx2_out3_port>, <&adx2_out4_port>,
+		       <&adx3_out1_port>, <&adx3_out2_port>,
+		       <&adx3_out3_port>, <&adx3_out4_port>,
+		       <&adx4_out1_port>, <&adx4_out2_port>,
+		       <&adx4_out3_port>, <&adx4_out4_port>,
+		       <&mixer_out1_port>, <&mixer_out2_port>,
+		       <&mixer_out3_port>, <&mixer_out4_port>,
+		       <&mixer_out5_port>,
 		       /* I/O */
 		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>,
 		       <&i2s5_port>, <&i2s6_port>, <&dmic1_port>, <&dmic2_port>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 96bd01c..fab34d6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -228,178 +228,1238 @@
 							remote-endpoint = <&dmic3_cif_ep>;
 						};
 					};
+
+					xbar_sfc1_in_port: port@20 {
+						reg = <0x20>;
+
+						xbar_sfc1_in_ep: endpoint {
+							remote-endpoint = <&sfc1_cif_in_ep>;
+						};
+					};
+
+					port@21 {
+						reg = <0x21>;
+
+						xbar_sfc1_out_ep: endpoint {
+							remote-endpoint = <&sfc1_cif_out_ep>;
+						};
+					};
+
+					xbar_sfc2_in_port: port@22 {
+						reg = <0x22>;
+
+						xbar_sfc2_in_ep: endpoint {
+							remote-endpoint = <&sfc2_cif_in_ep>;
+						};
+					};
+
+					port@23 {
+						reg = <0x23>;
+
+						xbar_sfc2_out_ep: endpoint {
+							remote-endpoint = <&sfc2_cif_out_ep>;
+						};
+					};
+
+					xbar_sfc3_in_port: port@24 {
+						reg = <0x24>;
+
+						xbar_sfc3_in_ep: endpoint {
+							remote-endpoint = <&sfc3_cif_in_ep>;
+						};
+					};
+
+					port@25 {
+						reg = <0x25>;
+
+						xbar_sfc3_out_ep: endpoint {
+							remote-endpoint = <&sfc3_cif_out_ep>;
+						};
+					};
+
+					xbar_sfc4_in_port: port@26 {
+						reg = <0x26>;
+
+						xbar_sfc4_in_ep: endpoint {
+							remote-endpoint = <&sfc4_cif_in_ep>;
+						};
+					};
+
+					port@27 {
+						reg = <0x27>;
+
+						xbar_sfc4_out_ep: endpoint {
+							remote-endpoint = <&sfc4_cif_out_ep>;
+						};
+					};
+
+					xbar_mvc1_in_port: port@28 {
+						reg = <0x28>;
+
+						xbar_mvc1_in_ep: endpoint {
+							remote-endpoint = <&mvc1_cif_in_ep>;
+						};
+					};
+
+					port@29 {
+						reg = <0x29>;
+
+						xbar_mvc1_out_ep: endpoint {
+							remote-endpoint = <&mvc1_cif_out_ep>;
+						};
+					};
+
+					xbar_mvc2_in_port: port@2a {
+						reg = <0x2a>;
+
+						xbar_mvc2_in_ep: endpoint {
+							remote-endpoint = <&mvc2_cif_in_ep>;
+						};
+					};
+
+					port@2b {
+						reg = <0x2b>;
+
+						xbar_mvc2_out_ep: endpoint {
+							remote-endpoint = <&mvc2_cif_out_ep>;
+						};
+					};
+
+					xbar_amx1_in1_port: port@2c {
+						reg = <0x2c>;
+
+						xbar_amx1_in1_ep: endpoint {
+							remote-endpoint = <&amx1_in1_ep>;
+						};
+					};
+
+					xbar_amx1_in2_port: port@2d {
+						reg = <0x2d>;
+
+						xbar_amx1_in2_ep: endpoint {
+							remote-endpoint = <&amx1_in2_ep>;
+						};
+					};
+
+					xbar_amx1_in3_port: port@2e {
+						reg = <0x2e>;
+
+						xbar_amx1_in3_ep: endpoint {
+							remote-endpoint = <&amx1_in3_ep>;
+						};
+					};
+
+					xbar_amx1_in4_port: port@2f {
+						reg = <0x2f>;
+
+						xbar_amx1_in4_ep: endpoint {
+							remote-endpoint = <&amx1_in4_ep>;
+						};
+					};
+
+					port@30 {
+						reg = <0x30>;
+
+						xbar_amx1_out_ep: endpoint {
+							remote-endpoint = <&amx1_out_ep>;
+						};
+					};
+
+					xbar_amx2_in1_port: port@31 {
+						reg = <0x31>;
+
+						xbar_amx2_in1_ep: endpoint {
+							remote-endpoint = <&amx2_in1_ep>;
+						};
+					};
+
+					xbar_amx2_in2_port: port@32 {
+						reg = <0x32>;
+
+						xbar_amx2_in2_ep: endpoint {
+							remote-endpoint = <&amx2_in2_ep>;
+						};
+					};
+
+					xbar_amx2_in3_port: port@33 {
+						reg = <0x33>;
+
+						xbar_amx2_in3_ep: endpoint {
+							remote-endpoint = <&amx2_in3_ep>;
+						};
+					};
+
+					xbar_amx2_in4_port: port@34 {
+						reg = <0x34>;
+
+						xbar_amx2_in4_ep: endpoint {
+							remote-endpoint = <&amx2_in4_ep>;
+						};
+					};
+
+					port@35 {
+						reg = <0x35>;
+
+						xbar_amx2_out_ep: endpoint {
+							remote-endpoint = <&amx2_out_ep>;
+						};
+					};
+
+					xbar_amx3_in1_port: port@36 {
+						reg = <0x36>;
+
+						xbar_amx3_in1_ep: endpoint {
+							remote-endpoint = <&amx3_in1_ep>;
+						};
+					};
+
+					xbar_amx3_in2_port: port@37 {
+						reg = <0x37>;
+
+						xbar_amx3_in2_ep: endpoint {
+							remote-endpoint = <&amx3_in2_ep>;
+						};
+					};
+
+					xbar_amx3_in3_port: port@38 {
+						reg = <0x38>;
+
+						xbar_amx3_in3_ep: endpoint {
+							remote-endpoint = <&amx3_in3_ep>;
+						};
+					};
+
+					xbar_amx3_in4_port: port@39 {
+						reg = <0x39>;
+
+						xbar_amx3_in4_ep: endpoint {
+							remote-endpoint = <&amx3_in4_ep>;
+						};
+					};
+
+					port@3a {
+						reg = <0x3a>;
+
+						xbar_amx3_out_ep: endpoint {
+							remote-endpoint = <&amx3_out_ep>;
+						};
+					};
+
+					xbar_amx4_in1_port: port@3b {
+						reg = <0x3b>;
+
+						xbar_amx4_in1_ep: endpoint {
+							remote-endpoint = <&amx4_in1_ep>;
+						};
+					};
+
+					xbar_amx4_in2_port: port@3c {
+						reg = <0x3c>;
+
+						xbar_amx4_in2_ep: endpoint {
+							remote-endpoint = <&amx4_in2_ep>;
+						};
+					};
+
+					xbar_amx4_in3_port: port@3d {
+						reg = <0x3d>;
+
+						xbar_amx4_in3_ep: endpoint {
+							remote-endpoint = <&amx4_in3_ep>;
+						};
+					};
+
+					xbar_amx4_in4_port: port@3e {
+						reg = <0x3e>;
+
+						xbar_amx4_in4_ep: endpoint {
+							remote-endpoint = <&amx4_in4_ep>;
+						};
+					};
+
+					port@3f {
+						reg = <0x3f>;
+
+						xbar_amx4_out_ep: endpoint {
+							remote-endpoint = <&amx4_out_ep>;
+						};
+					};
+
+					xbar_adx1_in_port: port@40 {
+						reg = <0x40>;
+
+						xbar_adx1_in_ep: endpoint {
+							remote-endpoint = <&adx1_in_ep>;
+						};
+					};
+
+					port@41 {
+						reg = <0x41>;
+
+						xbar_adx1_out1_ep: endpoint {
+							remote-endpoint = <&adx1_out1_ep>;
+						};
+					};
+
+					port@42 {
+						reg = <0x42>;
+
+						xbar_adx1_out2_ep: endpoint {
+							remote-endpoint = <&adx1_out2_ep>;
+						};
+					};
+
+					port@43 {
+						reg = <0x43>;
+
+						xbar_adx1_out3_ep: endpoint {
+							remote-endpoint = <&adx1_out3_ep>;
+						};
+					};
+
+					port@44 {
+						reg = <0x44>;
+
+						xbar_adx1_out4_ep: endpoint {
+							remote-endpoint = <&adx1_out4_ep>;
+						};
+					};
+
+					xbar_adx2_in_port: port@45 {
+						reg = <0x45>;
+
+						xbar_adx2_in_ep: endpoint {
+							remote-endpoint = <&adx2_in_ep>;
+						};
+					};
+
+					port@46 {
+						reg = <0x46>;
+
+						xbar_adx2_out1_ep: endpoint {
+							remote-endpoint = <&adx2_out1_ep>;
+						};
+					};
+
+					port@47 {
+						reg = <0x47>;
+
+						xbar_adx2_out2_ep: endpoint {
+							remote-endpoint = <&adx2_out2_ep>;
+						};
+					};
+
+					port@48 {
+						reg = <0x48>;
+
+						xbar_adx2_out3_ep: endpoint {
+							remote-endpoint = <&adx2_out3_ep>;
+						};
+					};
+
+					port@49 {
+						reg = <0x49>;
+
+						xbar_adx2_out4_ep: endpoint {
+							remote-endpoint = <&adx2_out4_ep>;
+						};
+					};
+
+					xbar_adx3_in_port: port@4a {
+						reg = <0x4a>;
+
+						xbar_adx3_in_ep: endpoint {
+							remote-endpoint = <&adx3_in_ep>;
+						};
+					};
+
+					port@4b {
+						reg = <0x4b>;
+
+						xbar_adx3_out1_ep: endpoint {
+							remote-endpoint = <&adx3_out1_ep>;
+						};
+					};
+
+					port@4c {
+						reg = <0x4c>;
+
+						xbar_adx3_out2_ep: endpoint {
+							remote-endpoint = <&adx3_out2_ep>;
+						};
+					};
+
+					port@4d {
+						reg = <0x4d>;
+
+						xbar_adx3_out3_ep: endpoint {
+							remote-endpoint = <&adx3_out3_ep>;
+						};
+					};
+
+					port@4e {
+						reg = <0x4e>;
+
+						xbar_adx3_out4_ep: endpoint {
+							remote-endpoint = <&adx3_out4_ep>;
+						};
+					};
+
+					xbar_adx4_in_port: port@4f {
+						reg = <0x4f>;
+
+						xbar_adx4_in_ep: endpoint {
+							remote-endpoint = <&adx4_in_ep>;
+						};
+					};
+
+					port@50 {
+						reg = <0x50>;
+
+						xbar_adx4_out1_ep: endpoint {
+							remote-endpoint = <&adx4_out1_ep>;
+						};
+					};
+
+					port@51 {
+						reg = <0x51>;
+
+						xbar_adx4_out2_ep: endpoint {
+							remote-endpoint = <&adx4_out2_ep>;
+						};
+					};
+
+					port@52 {
+						reg = <0x52>;
+
+						xbar_adx4_out3_ep: endpoint {
+							remote-endpoint = <&adx4_out3_ep>;
+						};
+					};
+
+					port@53 {
+						reg = <0x53>;
+
+						xbar_adx4_out4_ep: endpoint {
+							remote-endpoint = <&adx4_out4_ep>;
+						};
+					};
+
+					xbar_mixer_in1_port: port@54 {
+						reg = <0x54>;
+
+						xbar_mixer_in1_ep: endpoint {
+							remote-endpoint = <&mixer_in1_ep>;
+						};
+					};
+
+					xbar_mixer_in2_port: port@55 {
+						reg = <0x55>;
+
+						xbar_mixer_in2_ep: endpoint {
+							remote-endpoint = <&mixer_in2_ep>;
+						};
+					};
+
+					xbar_mixer_in3_port: port@56 {
+						reg = <0x56>;
+
+						xbar_mixer_in3_ep: endpoint {
+							remote-endpoint = <&mixer_in3_ep>;
+						};
+					};
+
+					xbar_mixer_in4_port: port@57 {
+						reg = <0x57>;
+
+						xbar_mixer_in4_ep: endpoint {
+							remote-endpoint = <&mixer_in4_ep>;
+						};
+					};
+
+					xbar_mixer_in5_port: port@58 {
+						reg = <0x58>;
+
+						xbar_mixer_in5_ep: endpoint {
+							remote-endpoint = <&mixer_in5_ep>;
+						};
+					};
+
+					xbar_mixer_in6_port: port@59 {
+						reg = <0x59>;
+
+						xbar_mixer_in6_ep: endpoint {
+							remote-endpoint = <&mixer_in6_ep>;
+						};
+					};
+
+					xbar_mixer_in7_port: port@5a {
+						reg = <0x5a>;
+
+						xbar_mixer_in7_ep: endpoint {
+							remote-endpoint = <&mixer_in7_ep>;
+						};
+					};
+
+					xbar_mixer_in8_port: port@5b {
+						reg = <0x5b>;
+
+						xbar_mixer_in8_ep: endpoint {
+							remote-endpoint = <&mixer_in8_ep>;
+						};
+					};
+
+					xbar_mixer_in9_port: port@5c {
+						reg = <0x5c>;
+
+						xbar_mixer_in9_ep: endpoint {
+							remote-endpoint = <&mixer_in9_ep>;
+						};
+					};
+
+					xbar_mixer_in10_port: port@5d {
+						reg = <0x5d>;
+
+						xbar_mixer_in10_ep: endpoint {
+							remote-endpoint = <&mixer_in10_ep>;
+						};
+					};
+
+					port@5e {
+						reg = <0x5e>;
+
+						xbar_mixer_out1_ep: endpoint {
+							remote-endpoint = <&mixer_out1_ep>;
+						};
+					};
+
+					port@5f {
+						reg = <0x5f>;
+
+						xbar_mixer_out2_ep: endpoint {
+							remote-endpoint = <&mixer_out2_ep>;
+						};
+					};
+
+					port@60 {
+						reg = <0x60>;
+
+						xbar_mixer_out3_ep: endpoint {
+							remote-endpoint = <&mixer_out3_ep>;
+						};
+					};
+
+					port@61 {
+						reg = <0x61>;
+
+						xbar_mixer_out4_ep: endpoint {
+							remote-endpoint = <&mixer_out4_ep>;
+						};
+					};
+
+					port@62 {
+						reg = <0x62>;
+
+						xbar_mixer_out5_ep: endpoint {
+							remote-endpoint = <&mixer_out5_ep>;
+						};
+					};
+				};
+
+				admaif@290f000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						admaif0_port: port@0 {
+							reg = <0x0>;
+
+							admaif0_ep: endpoint {
+								remote-endpoint = <&xbar_admaif0_ep>;
+							};
+						};
+
+						admaif1_port: port@1 {
+							reg = <0x1>;
+
+							admaif1_ep: endpoint {
+								remote-endpoint = <&xbar_admaif1_ep>;
+							};
+						};
+
+						admaif2_port: port@2 {
+							reg = <0x2>;
+
+							admaif2_ep: endpoint {
+								remote-endpoint = <&xbar_admaif2_ep>;
+							};
+						};
+
+						admaif3_port: port@3 {
+							reg = <0x3>;
+
+							admaif3_ep: endpoint {
+								remote-endpoint = <&xbar_admaif3_ep>;
+							};
+						};
+
+						admaif4_port: port@4 {
+							reg = <0x4>;
+
+							admaif4_ep: endpoint {
+								remote-endpoint = <&xbar_admaif4_ep>;
+							};
+						};
+
+						admaif5_port: port@5 {
+							reg = <0x5>;
+
+							admaif5_ep: endpoint {
+								remote-endpoint = <&xbar_admaif5_ep>;
+							};
+						};
+
+						admaif6_port: port@6 {
+							reg = <0x6>;
+
+							admaif6_ep: endpoint {
+								remote-endpoint = <&xbar_admaif6_ep>;
+							};
+						};
+
+						admaif7_port: port@7 {
+							reg = <0x7>;
+
+							admaif7_ep: endpoint {
+								remote-endpoint = <&xbar_admaif7_ep>;
+							};
+						};
+
+						admaif8_port: port@8 {
+							reg = <0x8>;
+
+							admaif8_ep: endpoint {
+								remote-endpoint = <&xbar_admaif8_ep>;
+							};
+						};
+
+						admaif9_port: port@9 {
+							reg = <0x9>;
+
+							admaif9_ep: endpoint {
+								remote-endpoint = <&xbar_admaif9_ep>;
+							};
+						};
+
+						admaif10_port: port@a {
+							reg = <0xa>;
+
+							admaif10_ep: endpoint {
+								remote-endpoint = <&xbar_admaif10_ep>;
+							};
+						};
+
+						admaif11_port: port@b {
+							reg = <0xb>;
+
+							admaif11_ep: endpoint {
+								remote-endpoint = <&xbar_admaif11_ep>;
+							};
+						};
+
+						admaif12_port: port@c {
+							reg = <0xc>;
+
+							admaif12_ep: endpoint {
+								remote-endpoint = <&xbar_admaif12_ep>;
+							};
+						};
+
+						admaif13_port: port@d {
+							reg = <0xd>;
+
+							admaif13_ep: endpoint {
+								remote-endpoint = <&xbar_admaif13_ep>;
+							};
+						};
+
+						admaif14_port: port@e {
+							reg = <0xe>;
+
+							admaif14_ep: endpoint {
+								remote-endpoint = <&xbar_admaif14_ep>;
+							};
+						};
+
+						admaif15_port: port@f {
+							reg = <0xf>;
+
+							admaif15_ep: endpoint {
+								remote-endpoint = <&xbar_admaif15_ep>;
+							};
+						};
+
+						admaif16_port: port@10 {
+							reg = <0x10>;
+
+							admaif16_ep: endpoint {
+								remote-endpoint = <&xbar_admaif16_ep>;
+							};
+						};
+
+						admaif17_port: port@11 {
+							reg = <0x11>;
+
+							admaif17_ep: endpoint {
+								remote-endpoint = <&xbar_admaif17_ep>;
+							};
+						};
+
+						admaif18_port: port@12 {
+							reg = <0x12>;
+
+							admaif18_ep: endpoint {
+								remote-endpoint = <&xbar_admaif18_ep>;
+							};
+						};
+
+						admaif19_port: port@13 {
+							reg = <0x13>;
+
+							admaif19_ep: endpoint {
+								remote-endpoint = <&xbar_admaif19_ep>;
+							};
+						};
+					};
+				};
+
+				i2s@2901000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s1_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s1_ep>;
+							};
+						};
+
+						i2s1_port: port@1 {
+							reg = <1>;
+
+							i2s1_dap_ep: endpoint {
+								dai-format = "i2s";
+								remote-endpoint = <&rt5658_ep>;
+							};
+						};
+					};
+				};
+
+				i2s@2901100 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s2_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s2_ep>;
+							};
+						};
+
+						i2s2_port: port@1 {
+							reg = <1>;
+
+							i2s2_dap_ep: endpoint {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				i2s@2901300 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s4_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s4_ep>;
+							};
+						};
+
+						i2s4_port: port@1 {
+							reg = <1>;
+
+							i2s4_dap_ep: endpoint {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				i2s@2901500 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s6_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s6_ep>;
+							};
+						};
+
+						i2s6_port: port@1 {
+							reg = <1>;
+
+							i2s6_dap_ep: endpoint@0 {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dmic@2904200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dmic3_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic3_ep>;
+							};
+						};
+
+						dmic3_port: port@1 {
+							reg = <1>;
+
+							dmic3_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				sfc@2902000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc1_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc1_in_ep>;
+							};
+						};
+
+						sfc1_out_port: port@1 {
+							reg = <1>;
+
+							sfc1_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc1_out_ep>;
+							};
+						};
+					};
+				};
+
+				sfc@2902200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc2_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc2_in_ep>;
+							};
+						};
+
+						sfc2_out_port: port@1 {
+							reg = <1>;
+
+							sfc2_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc2_out_ep>;
+							};
+						};
+					};
+				};
+
+				sfc@2902400 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc3_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc3_in_ep>;
+							};
+						};
+
+						sfc3_out_port: port@1 {
+							reg = <1>;
+
+							sfc3_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc3_out_ep>;
+							};
+						};
+					};
+				};
+
+				sfc@2902600 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc4_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc4_in_ep>;
+							};
+						};
+
+						sfc4_out_port: port@1 {
+							reg = <1>;
+
+							sfc4_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc4_out_ep>;
+							};
+						};
+					};
+				};
+
+				mvc@290a000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							mvc1_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_mvc1_in_ep>;
+							};
+						};
+
+						mvc1_out_port: port@1 {
+							reg = <1>;
+
+							mvc1_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_mvc1_out_ep>;
+							};
+						};
+					};
+				};
+
+				mvc@290a200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							mvc2_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_mvc2_in_ep>;
+							};
+						};
+
+						mvc2_out_port: port@1 {
+							reg = <1>;
+
+							mvc2_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_mvc2_out_ep>;
+							};
+						};
+					};
+				};
+
+				amx@2903000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							amx1_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in1_ep>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+
+							amx1_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in2_ep>;
+							};
+						};
+
+						port@2 {
+							reg = <2>;
+
+							amx1_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in3_ep>;
+							};
+						};
+
+						port@3 {
+							reg = <3>;
+
+							amx1_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in4_ep>;
+							};
+						};
+
+						amx1_out_port: port@4 {
+							reg = <4>;
+
+							amx1_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_out_ep>;
+							};
+						};
+					};
 				};
 
-				admaif@290f000 {
+				amx@2903100 {
 					status = "okay";
 
 					ports {
 						#address-cells = <1>;
 						#size-cells = <0>;
 
-						admaif0_port: port@0 {
-							reg = <0x0>;
+						port@0 {
+							reg = <0>;
 
-							admaif0_ep: endpoint {
-								remote-endpoint = <&xbar_admaif0_ep>;
+							amx2_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in1_ep>;
 							};
 						};
 
-						admaif1_port: port@1 {
-							reg = <0x1>;
+						port@1 {
+							reg = <1>;
 
-							admaif1_ep: endpoint {
-								remote-endpoint = <&xbar_admaif1_ep>;
+							amx2_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in2_ep>;
 							};
 						};
 
-						admaif2_port: port@2 {
-							reg = <0x2>;
+						amx2_in3_port: port@2 {
+							reg = <2>;
 
-							admaif2_ep: endpoint {
-								remote-endpoint = <&xbar_admaif2_ep>;
+							amx2_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in3_ep>;
 							};
 						};
 
-						admaif3_port: port@3 {
-							reg = <0x3>;
+						amx2_in4_port: port@3 {
+							reg = <3>;
 
-							admaif3_ep: endpoint {
-								remote-endpoint = <&xbar_admaif3_ep>;
+							amx2_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in4_ep>;
 							};
 						};
 
-						admaif4_port: port@4 {
-							reg = <0x4>;
+						amx2_out_port: port@4 {
+							reg = <4>;
 
-							admaif4_ep: endpoint {
-								remote-endpoint = <&xbar_admaif4_ep>;
+							amx2_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_out_ep>;
 							};
 						};
+					};
+				};
 
-						admaif5_port: port@5 {
-							reg = <0x5>;
+				amx@2903200 {
+					status = "okay";
 
-							admaif5_ep: endpoint {
-								remote-endpoint = <&xbar_admaif5_ep>;
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							amx3_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in1_ep>;
 							};
 						};
 
-						admaif6_port: port@6 {
-							reg = <0x6>;
+						port@1 {
+							reg = <1>;
 
-							admaif6_ep: endpoint {
-								remote-endpoint = <&xbar_admaif6_ep>;
+							amx3_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in2_ep>;
 							};
 						};
 
-						admaif7_port: port@7 {
-							reg = <0x7>;
+						port@2 {
+							reg = <2>;
 
-							admaif7_ep: endpoint {
-								remote-endpoint = <&xbar_admaif7_ep>;
+							amx3_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in3_ep>;
 							};
 						};
 
-						admaif8_port: port@8 {
-							reg = <0x8>;
+						port@3 {
+							reg = <3>;
 
-							admaif8_ep: endpoint {
-								remote-endpoint = <&xbar_admaif8_ep>;
+							amx3_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in4_ep>;
 							};
 						};
 
-						admaif9_port: port@9 {
-							reg = <0x9>;
+						amx3_out_port: port@4 {
+							reg = <4>;
 
-							admaif9_ep: endpoint {
-								remote-endpoint = <&xbar_admaif9_ep>;
+							amx3_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_out_ep>;
 							};
 						};
+					};
+				};
 
-						admaif10_port: port@a {
-							reg = <0xa>;
+				amx@2903300 {
+					status = "okay";
 
-							admaif10_ep: endpoint {
-								remote-endpoint = <&xbar_admaif10_ep>;
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							amx4_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in1_ep>;
 							};
 						};
 
-						admaif11_port: port@b {
-							reg = <0xb>;
+						port@1 {
+							reg = <1>;
 
-							admaif11_ep: endpoint {
-								remote-endpoint = <&xbar_admaif11_ep>;
+							amx4_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in2_ep>;
 							};
 						};
 
-						admaif12_port: port@c {
-							reg = <0xc>;
+						port@2 {
+							reg = <2>;
 
-							admaif12_ep: endpoint {
-								remote-endpoint = <&xbar_admaif12_ep>;
+							amx4_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in3_ep>;
 							};
 						};
 
-						admaif13_port: port@d {
-							reg = <0xd>;
+						port@3 {
+							reg = <3>;
 
-							admaif13_ep: endpoint {
-								remote-endpoint = <&xbar_admaif13_ep>;
+							amx4_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in4_ep>;
 							};
 						};
 
-						admaif14_port: port@e {
-							reg = <0xe>;
+						amx4_out_port: port@4 {
+							reg = <4>;
 
-							admaif14_ep: endpoint {
-								remote-endpoint = <&xbar_admaif14_ep>;
+							amx4_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_out_ep>;
 							};
 						};
+					};
+				};
 
-						admaif15_port: port@f {
-							reg = <0xf>;
+				adx@2903800 {
+					status = "okay";
 
-							admaif15_ep: endpoint {
-								remote-endpoint = <&xbar_admaif15_ep>;
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							adx1_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_in_ep>;
 							};
 						};
 
-						admaif16_port: port@10 {
-							reg = <0x10>;
+						adx1_out1_port: port@1 {
+							reg = <1>;
 
-							admaif16_ep: endpoint {
-								remote-endpoint = <&xbar_admaif16_ep>;
+							adx1_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out1_ep>;
 							};
 						};
 
-						admaif17_port: port@11 {
-							reg = <0x11>;
+						adx1_out2_port: port@2 {
+							reg = <2>;
 
-							admaif17_ep: endpoint {
-								remote-endpoint = <&xbar_admaif17_ep>;
+							adx1_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out2_ep>;
 							};
 						};
 
-						admaif18_port: port@12 {
-							reg = <0x12>;
+						adx1_out3_port: port@3 {
+							reg = <3>;
 
-							admaif18_ep: endpoint {
-								remote-endpoint = <&xbar_admaif18_ep>;
+							adx1_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out3_ep>;
 							};
 						};
 
-						admaif19_port: port@13 {
-							reg = <0x13>;
+						adx1_out4_port: port@4 {
+							reg = <4>;
 
-							admaif19_ep: endpoint {
-								remote-endpoint = <&xbar_admaif19_ep>;
+							adx1_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out4_ep>;
 							};
 						};
 					};
 				};
 
-				i2s@2901000 {
+				adx@2903900 {
 					status = "okay";
 
 					ports {
@@ -409,49 +1469,46 @@
 						port@0 {
 							reg = <0>;
 
-							i2s1_cif_ep: endpoint {
-								remote-endpoint = <&xbar_i2s1_ep>;
+							adx2_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_in_ep>;
 							};
 						};
 
-						i2s1_port: port@1 {
+						adx2_out1_port: port@1 {
 							reg = <1>;
 
-							i2s1_dap_ep: endpoint {
-								dai-format = "i2s";
-								remote-endpoint = <&rt5658_ep>;
+							adx2_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out1_ep>;
 							};
 						};
-					};
-				};
 
-				i2s@2901100 {
-					status = "okay";
+						adx2_out2_port: port@2 {
+							reg = <2>;
 
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
+							adx2_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out2_ep>;
+							};
+						};
 
-						port@0 {
-							reg = <0>;
+						adx2_out3_port: port@3 {
+							reg = <3>;
 
-							i2s2_cif_ep: endpoint {
-								remote-endpoint = <&xbar_i2s2_ep>;
+							adx2_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out3_ep>;
 							};
 						};
 
-						i2s2_port: port@1 {
-							reg = <1>;
+						adx2_out4_port: port@4 {
+							reg = <4>;
 
-							i2s2_dap_ep: endpoint {
-								dai-format = "i2s";
-								/* Place holder for external Codec */
+							adx2_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out4_ep>;
 							};
 						};
 					};
 				};
 
-				i2s@2901300 {
+				adx@2903a00 {
 					status = "okay";
 
 					ports {
@@ -461,23 +1518,46 @@
 						port@0 {
 							reg = <0>;
 
-							i2s4_cif_ep: endpoint {
-								remote-endpoint = <&xbar_i2s4_ep>;
+							adx3_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_in_ep>;
 							};
 						};
 
-						i2s4_port: port@1 {
+						adx3_out1_port: port@1 {
 							reg = <1>;
 
-							i2s4_dap_ep: endpoint {
-								dai-format = "i2s";
-								/* Place holder for external Codec */
+							adx3_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out1_ep>;
+							};
+						};
+
+						adx3_out2_port: port@2 {
+							reg = <2>;
+
+							adx3_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out2_ep>;
+							};
+						};
+
+						adx3_out3_port: port@3 {
+							reg = <3>;
+
+							adx3_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out3_ep>;
+							};
+						};
+
+						adx3_out4_port: port@4 {
+							reg = <4>;
+
+							adx3_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out4_ep>;
 							};
 						};
 					};
 				};
 
-				i2s@2901500 {
+				adx@2903b00 {
 					status = "okay";
 
 					ports {
@@ -487,23 +1567,46 @@
 						port@0 {
 							reg = <0>;
 
-							i2s6_cif_ep: endpoint {
-								remote-endpoint = <&xbar_i2s6_ep>;
+							adx4_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_in_ep>;
 							};
 						};
 
-						i2s6_port: port@1 {
+						adx4_out1_port: port@1 {
 							reg = <1>;
 
-							i2s6_dap_ep: endpoint@0 {
-								dai-format = "i2s";
-								/* Place holder for external Codec */
+							adx4_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out1_ep>;
+							};
+						};
+
+						adx4_out2_port: port@2 {
+							reg = <2>;
+
+							adx4_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out2_ep>;
+							};
+						};
+
+						adx4_out3_port: port@3 {
+							reg = <3>;
+
+							adx4_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out3_ep>;
+							};
+						};
+
+						adx4_out4_port: port@4 {
+							reg = <4>;
+
+							adx4_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out4_ep>;
 							};
 						};
 					};
 				};
 
-				dmic@2904200 {
+				amixer@290bb00 {
 					status = "okay";
 
 					ports {
@@ -511,18 +1614,122 @@
 						#size-cells = <0>;
 
 						port@0 {
-							reg = <0>;
+							reg = <0x0>;
 
-							dmic3_cif_ep: endpoint {
-								remote-endpoint = <&xbar_dmic3_ep>;
+							mixer_in1_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in1_ep>;
 							};
 						};
 
-						dmic3_port: port@1 {
-							reg = <1>;
+						port@1 {
+							reg = <0x1>;
 
-							dmic3_dap_ep: endpoint {
-								/* Place holder for external Codec */
+							mixer_in2_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in2_ep>;
+							};
+						};
+
+						port@2 {
+							reg = <0x2>;
+
+							mixer_in3_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in3_ep>;
+							};
+						};
+
+						port@3 {
+							reg = <0x3>;
+
+							mixer_in4_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in4_ep>;
+							};
+						};
+
+						port@4 {
+							reg = <0x4>;
+
+							mixer_in5_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in5_ep>;
+							};
+						};
+
+						port@5 {
+							reg = <0x5>;
+
+							mixer_in6_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in6_ep>;
+							};
+						};
+
+						port@6 {
+							reg = <0x6>;
+
+							mixer_in7_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in7_ep>;
+							};
+						};
+
+						port@7 {
+							reg = <0x7>;
+
+							mixer_in8_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in8_ep>;
+							};
+						};
+
+						port@8 {
+							reg = <0x8>;
+
+							mixer_in9_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in9_ep>;
+							};
+						};
+
+						port@9 {
+							reg = <0x9>;
+
+							mixer_in10_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in10_ep>;
+							};
+						};
+
+						mixer_out1_port: port@a {
+							reg = <0xa>;
+
+							mixer_out1_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out1_ep>;
+							};
+						};
+
+						mixer_out2_port: port@b {
+							reg = <0xb>;
+
+							mixer_out2_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out2_ep>;
+							};
+						};
+
+						mixer_out3_port: port@c {
+							reg = <0xc>;
+
+							mixer_out3_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out3_ep>;
+							};
+						};
+
+						mixer_out4_port: port@d {
+							reg = <0xd>;
+
+							mixer_out4_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out4_ep>;
+							};
+						};
+
+						mixer_out5_port: port@e {
+							reg = <0xe>;
+
+							mixer_out5_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out5_ep>;
 							};
 						};
 					};
@@ -827,6 +2034,40 @@
 		       /* XBAR Ports */
 		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s4_port>,
 		       <&xbar_i2s6_port>, <&xbar_dmic3_port>,
+		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
+		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
+		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
+		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
+		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
+		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
+		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
+		       <&xbar_amx3_in1_port>, <&xbar_amx3_in2_port>,
+		       <&xbar_amx3_in3_port>, <&xbar_amx3_in4_port>,
+		       <&xbar_amx4_in1_port>, <&xbar_amx4_in2_port>,
+		       <&xbar_amx4_in3_port>, <&xbar_amx4_in4_port>,
+		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
+		       <&xbar_adx3_in_port>, <&xbar_adx4_in_port>,
+		       <&xbar_mixer_in1_port>, <&xbar_mixer_in2_port>,
+		       <&xbar_mixer_in3_port>, <&xbar_mixer_in4_port>,
+		       <&xbar_mixer_in5_port>, <&xbar_mixer_in6_port>,
+		       <&xbar_mixer_in7_port>, <&xbar_mixer_in8_port>,
+		       <&xbar_mixer_in9_port>, <&xbar_mixer_in10_port>,
+		       /* HW accelerators */
+		       <&sfc1_out_port>, <&sfc2_out_port>,
+		       <&sfc3_out_port>, <&sfc4_out_port>,
+		       <&mvc1_out_port>, <&mvc2_out_port>,
+		       <&amx1_out_port>, <&amx2_out_port>,
+		       <&amx3_out_port>, <&amx4_out_port>,
+		       <&adx1_out1_port>, <&adx1_out2_port>,
+		       <&adx1_out3_port>, <&adx1_out4_port>,
+		       <&adx2_out1_port>, <&adx2_out2_port>,
+		       <&adx2_out3_port>, <&adx2_out4_port>,
+		       <&adx3_out1_port>, <&adx3_out2_port>,
+		       <&adx3_out3_port>, <&adx3_out4_port>,
+		       <&adx4_out1_port>, <&adx4_out2_port>,
+		       <&adx4_out3_port>, <&adx4_out4_port>,
+		       <&mixer_out1_port>, <&mixer_out2_port>, <&mixer_out3_port>,
+		       <&mixer_out4_port>, <&mixer_out5_port>,
 		       /* BE I/O Ports */
 		       <&i2s1_port>, <&i2s2_port>, <&i2s4_port>, <&i2s6_port>,
 		       <&dmic3_port>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index 836a7e0..48fc9cf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -238,178 +238,1190 @@
 							remote-endpoint = <&dspk2_cif_ep>;
 						};
 					};
+
+					xbar_sfc1_in_port: port@20 {
+						reg = <0x20>;
+
+						xbar_sfc1_in_ep: endpoint {
+							remote-endpoint = <&sfc1_cif_in_ep>;
+						};
+					};
+
+					port@21 {
+						reg = <0x21>;
+
+						xbar_sfc1_out_ep: endpoint {
+							remote-endpoint = <&sfc1_cif_out_ep>;
+						};
+					};
+
+					xbar_sfc2_in_port: port@22 {
+						reg = <0x22>;
+
+						xbar_sfc2_in_ep: endpoint {
+							remote-endpoint = <&sfc2_cif_in_ep>;
+						};
+					};
+
+					port@23 {
+						reg = <0x23>;
+
+						xbar_sfc2_out_ep: endpoint {
+							remote-endpoint = <&sfc2_cif_out_ep>;
+						};
+					};
+
+					xbar_sfc3_in_port: port@24 {
+						reg = <0x24>;
+
+						xbar_sfc3_in_ep: endpoint {
+							remote-endpoint = <&sfc3_cif_in_ep>;
+						};
+					};
+
+					port@25 {
+						reg = <0x25>;
+
+						xbar_sfc3_out_ep: endpoint {
+							remote-endpoint = <&sfc3_cif_out_ep>;
+						};
+					};
+
+					xbar_sfc4_in_port: port@26 {
+						reg = <0x26>;
+
+						xbar_sfc4_in_ep: endpoint {
+							remote-endpoint = <&sfc4_cif_in_ep>;
+						};
+					};
+
+					port@27 {
+						reg = <0x27>;
+
+						xbar_sfc4_out_ep: endpoint {
+							remote-endpoint = <&sfc4_cif_out_ep>;
+						};
+					};
+
+					xbar_mvc1_in_port: port@28 {
+						reg = <0x28>;
+
+						xbar_mvc1_in_ep: endpoint {
+							remote-endpoint = <&mvc1_cif_in_ep>;
+						};
+					};
+
+					port@29 {
+						reg = <0x29>;
+
+						xbar_mvc1_out_ep: endpoint {
+							remote-endpoint = <&mvc1_cif_out_ep>;
+						};
+					};
+
+					xbar_mvc2_in_port: port@2a {
+						reg = <0x2a>;
+
+						xbar_mvc2_in_ep: endpoint {
+							remote-endpoint = <&mvc2_cif_in_ep>;
+						};
+					};
+
+					port@2b {
+						reg = <0x2b>;
+
+						xbar_mvc2_out_ep: endpoint {
+							remote-endpoint = <&mvc2_cif_out_ep>;
+						};
+					};
+
+					xbar_amx1_in1_port: port@2c {
+						reg = <0x2c>;
+
+						xbar_amx1_in1_ep: endpoint {
+							remote-endpoint = <&amx1_in1_ep>;
+						};
+					};
+
+					xbar_amx1_in2_port: port@2d {
+						reg = <0x2d>;
+
+						xbar_amx1_in2_ep: endpoint {
+							remote-endpoint = <&amx1_in2_ep>;
+						};
+					};
+
+					xbar_amx1_in3_port: port@2e {
+						reg = <0x2e>;
+
+						xbar_amx1_in3_ep: endpoint {
+							remote-endpoint = <&amx1_in3_ep>;
+						};
+					};
+
+					xbar_amx1_in4_port: port@2f {
+						reg = <0x2f>;
+
+						xbar_amx1_in4_ep: endpoint {
+							remote-endpoint = <&amx1_in4_ep>;
+						};
+					};
+
+					port@30 {
+						reg = <0x30>;
+
+						xbar_amx1_out_ep: endpoint {
+							remote-endpoint = <&amx1_out_ep>;
+						};
+					};
+
+					xbar_amx2_in1_port: port@31 {
+						reg = <0x31>;
+
+						xbar_amx2_in1_ep: endpoint {
+							remote-endpoint = <&amx2_in1_ep>;
+						};
+					};
+
+					xbar_amx2_in2_port: port@32 {
+						reg = <0x32>;
+
+						xbar_amx2_in2_ep: endpoint {
+							remote-endpoint = <&amx2_in2_ep>;
+						};
+					};
+
+					xbar_amx2_in3_port: port@33 {
+						reg = <0x33>;
+
+						xbar_amx2_in3_ep: endpoint {
+							remote-endpoint = <&amx2_in3_ep>;
+						};
+					};
+
+					xbar_amx2_in4_port: port@34 {
+						reg = <0x34>;
+
+						xbar_amx2_in4_ep: endpoint {
+							remote-endpoint = <&amx2_in4_ep>;
+						};
+					};
+
+					port@35 {
+						reg = <0x35>;
+
+						xbar_amx2_out_ep: endpoint {
+							remote-endpoint = <&amx2_out_ep>;
+						};
+					};
+
+					xbar_amx3_in1_port: port@36 {
+						reg = <0x36>;
+
+						xbar_amx3_in1_ep: endpoint {
+							remote-endpoint = <&amx3_in1_ep>;
+						};
+					};
+
+					xbar_amx3_in2_port: port@37 {
+						reg = <0x37>;
+
+						xbar_amx3_in2_ep: endpoint {
+							remote-endpoint = <&amx3_in2_ep>;
+						};
+					};
+
+					xbar_amx3_in3_port: port@38 {
+						reg = <0x38>;
+
+						xbar_amx3_in3_ep: endpoint {
+							remote-endpoint = <&amx3_in3_ep>;
+						};
+					};
+
+					xbar_amx3_in4_port: port@39 {
+						reg = <0x39>;
+
+						xbar_amx3_in4_ep: endpoint {
+							remote-endpoint = <&amx3_in4_ep>;
+						};
+					};
+
+					port@3a {
+						reg = <0x3a>;
+
+						xbar_amx3_out_ep: endpoint {
+							remote-endpoint = <&amx3_out_ep>;
+						};
+					};
+
+					xbar_amx4_in1_port: port@3b {
+						reg = <0x3b>;
+
+						xbar_amx4_in1_ep: endpoint {
+							remote-endpoint = <&amx4_in1_ep>;
+						};
+					};
+
+					xbar_amx4_in2_port: port@3c {
+						reg = <0x3c>;
+
+						xbar_amx4_in2_ep: endpoint {
+							remote-endpoint = <&amx4_in2_ep>;
+						};
+					};
+
+					xbar_amx4_in3_port: port@3d {
+						reg = <0x3d>;
+
+						xbar_amx4_in3_ep: endpoint {
+							remote-endpoint = <&amx4_in3_ep>;
+						};
+					};
+
+					xbar_amx4_in4_port: port@3e {
+						reg = <0x3e>;
+
+						xbar_amx4_in4_ep: endpoint {
+							remote-endpoint = <&amx4_in4_ep>;
+						};
+					};
+
+					port@3f {
+						reg = <0x3f>;
+
+						xbar_amx4_out_ep: endpoint {
+							remote-endpoint = <&amx4_out_ep>;
+						};
+					};
+
+					xbar_adx1_in_port: port@40 {
+						reg = <0x40>;
+
+						xbar_adx1_in_ep: endpoint {
+							remote-endpoint = <&adx1_in_ep>;
+						};
+					};
+
+					port@41 {
+						reg = <0x41>;
+
+						xbar_adx1_out1_ep: endpoint {
+							remote-endpoint = <&adx1_out1_ep>;
+						};
+					};
+
+					port@42 {
+						reg = <0x42>;
+
+						xbar_adx1_out2_ep: endpoint {
+							remote-endpoint = <&adx1_out2_ep>;
+						};
+					};
+
+					port@43 {
+						reg = <0x43>;
+
+						xbar_adx1_out3_ep: endpoint {
+							remote-endpoint = <&adx1_out3_ep>;
+						};
+					};
+
+					port@44 {
+						reg = <0x44>;
+
+						xbar_adx1_out4_ep: endpoint {
+							remote-endpoint = <&adx1_out4_ep>;
+						};
+					};
+
+					xbar_adx2_in_port: port@45 {
+						reg = <0x45>;
+
+						xbar_adx2_in_ep: endpoint {
+							remote-endpoint = <&adx2_in_ep>;
+						};
+					};
+
+					port@46 {
+						reg = <0x46>;
+
+						xbar_adx2_out1_ep: endpoint {
+							remote-endpoint = <&adx2_out1_ep>;
+						};
+					};
+
+					port@47 {
+						reg = <0x47>;
+
+						xbar_adx2_out2_ep: endpoint {
+							remote-endpoint = <&adx2_out2_ep>;
+						};
+					};
+
+					port@48 {
+						reg = <0x48>;
+
+						xbar_adx2_out3_ep: endpoint {
+							remote-endpoint = <&adx2_out3_ep>;
+						};
+					};
+
+					port@49 {
+						reg = <0x49>;
+
+						xbar_adx2_out4_ep: endpoint {
+							remote-endpoint = <&adx2_out4_ep>;
+						};
+					};
+
+					xbar_adx3_in_port: port@4a {
+						reg = <0x4a>;
+
+						xbar_adx3_in_ep: endpoint {
+							remote-endpoint = <&adx3_in_ep>;
+						};
+					};
+
+					port@4b {
+						reg = <0x4b>;
+
+						xbar_adx3_out1_ep: endpoint {
+							remote-endpoint = <&adx3_out1_ep>;
+						};
+					};
+
+					port@4c {
+						reg = <0x4c>;
+
+						xbar_adx3_out2_ep: endpoint {
+							remote-endpoint = <&adx3_out2_ep>;
+						};
+					};
+
+					port@4d {
+						reg = <0x4d>;
+
+						xbar_adx3_out3_ep: endpoint {
+							remote-endpoint = <&adx3_out3_ep>;
+						};
+					};
+
+					port@4e {
+						reg = <0x4e>;
+
+						xbar_adx3_out4_ep: endpoint {
+							remote-endpoint = <&adx3_out4_ep>;
+						};
+					};
+
+					xbar_adx4_in_port: port@4f {
+						reg = <0x4f>;
+
+						xbar_adx4_in_ep: endpoint {
+							remote-endpoint = <&adx4_in_ep>;
+						};
+					};
+
+					port@50 {
+						reg = <0x50>;
+
+						xbar_adx4_out1_ep: endpoint {
+							remote-endpoint = <&adx4_out1_ep>;
+						};
+					};
+
+					port@51 {
+						reg = <0x51>;
+
+						xbar_adx4_out2_ep: endpoint {
+							remote-endpoint = <&adx4_out2_ep>;
+						};
+					};
+
+					port@52 {
+						reg = <0x52>;
+
+						xbar_adx4_out3_ep: endpoint {
+							remote-endpoint = <&adx4_out3_ep>;
+						};
+					};
+
+					port@53 {
+						reg = <0x53>;
+
+						xbar_adx4_out4_ep: endpoint {
+							remote-endpoint = <&adx4_out4_ep>;
+						};
+					};
+
+					xbar_mixer_in1_port: port@54 {
+						reg = <0x54>;
+
+						xbar_mixer_in1_ep: endpoint {
+							remote-endpoint = <&mixer_in1_ep>;
+						};
+					};
+
+					xbar_mixer_in2_port: port@55 {
+						reg = <0x55>;
+
+						xbar_mixer_in2_ep: endpoint {
+							remote-endpoint = <&mixer_in2_ep>;
+						};
+					};
+
+					xbar_mixer_in3_port: port@56 {
+						reg = <0x56>;
+
+						xbar_mixer_in3_ep: endpoint {
+							remote-endpoint = <&mixer_in3_ep>;
+						};
+					};
+
+					xbar_mixer_in4_port: port@57 {
+						reg = <0x57>;
+
+						xbar_mixer_in4_ep: endpoint {
+							remote-endpoint = <&mixer_in4_ep>;
+						};
+					};
+
+					xbar_mixer_in5_port: port@58 {
+						reg = <0x58>;
+
+						xbar_mixer_in5_ep: endpoint {
+							remote-endpoint = <&mixer_in5_ep>;
+						};
+					};
+
+					xbar_mixer_in6_port: port@59 {
+						reg = <0x59>;
+
+						xbar_mixer_in6_ep: endpoint {
+							remote-endpoint = <&mixer_in6_ep>;
+						};
+					};
+
+					xbar_mixer_in7_port: port@5a {
+						reg = <0x5a>;
+
+						xbar_mixer_in7_ep: endpoint {
+							remote-endpoint = <&mixer_in7_ep>;
+						};
+					};
+
+					xbar_mixer_in8_port: port@5b {
+						reg = <0x5b>;
+
+						xbar_mixer_in8_ep: endpoint {
+							remote-endpoint = <&mixer_in8_ep>;
+						};
+					};
+
+					xbar_mixer_in9_port: port@5c {
+						reg = <0x5c>;
+
+						xbar_mixer_in9_ep: endpoint {
+							remote-endpoint = <&mixer_in9_ep>;
+						};
+					};
+
+					xbar_mixer_in10_port: port@5d {
+						reg = <0x5d>;
+
+						xbar_mixer_in10_ep: endpoint {
+							remote-endpoint = <&mixer_in10_ep>;
+						};
+					};
+
+					port@5e {
+						reg = <0x5e>;
+
+						xbar_mixer_out1_ep: endpoint {
+							remote-endpoint = <&mixer_out1_ep>;
+						};
+					};
+
+					port@5f {
+						reg = <0x5f>;
+
+						xbar_mixer_out2_ep: endpoint {
+							remote-endpoint = <&mixer_out2_ep>;
+						};
+					};
+
+					port@60 {
+						reg = <0x60>;
+
+						xbar_mixer_out3_ep: endpoint {
+							remote-endpoint = <&mixer_out3_ep>;
+						};
+					};
+
+					port@61 {
+						reg = <0x61>;
+
+						xbar_mixer_out4_ep: endpoint {
+							remote-endpoint = <&mixer_out4_ep>;
+						};
+					};
+
+					port@62 {
+						reg = <0x62>;
+
+						xbar_mixer_out5_ep: endpoint {
+							remote-endpoint = <&mixer_out5_ep>;
+						};
+					};
+				};
+
+				admaif@290f000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						admaif0_port: port@0 {
+							reg = <0x0>;
+
+							admaif0_ep: endpoint {
+								remote-endpoint = <&xbar_admaif0_ep>;
+							};
+						};
+
+						admaif1_port: port@1 {
+							reg = <0x1>;
+
+							admaif1_ep: endpoint {
+								remote-endpoint = <&xbar_admaif1_ep>;
+							};
+						};
+
+						admaif2_port: port@2 {
+							reg = <0x2>;
+
+							admaif2_ep: endpoint {
+								remote-endpoint = <&xbar_admaif2_ep>;
+							};
+						};
+
+						admaif3_port: port@3 {
+							reg = <0x3>;
+
+							admaif3_ep: endpoint {
+								remote-endpoint = <&xbar_admaif3_ep>;
+							};
+						};
+
+						admaif4_port: port@4 {
+							reg = <0x4>;
+
+							admaif4_ep: endpoint {
+								remote-endpoint = <&xbar_admaif4_ep>;
+							};
+						};
+
+						admaif5_port: port@5 {
+							reg = <0x5>;
+
+							admaif5_ep: endpoint {
+								remote-endpoint = <&xbar_admaif5_ep>;
+							};
+						};
+
+						admaif6_port: port@6 {
+							reg = <0x6>;
+
+							admaif6_ep: endpoint {
+								remote-endpoint = <&xbar_admaif6_ep>;
+							};
+						};
+
+						admaif7_port: port@7 {
+							reg = <0x7>;
+
+							admaif7_ep: endpoint {
+								remote-endpoint = <&xbar_admaif7_ep>;
+							};
+						};
+
+						admaif8_port: port@8 {
+							reg = <0x8>;
+
+							admaif8_ep: endpoint {
+								remote-endpoint = <&xbar_admaif8_ep>;
+							};
+						};
+
+						admaif9_port: port@9 {
+							reg = <0x9>;
+
+							admaif9_ep: endpoint {
+								remote-endpoint = <&xbar_admaif9_ep>;
+							};
+						};
+
+						admaif10_port: port@a {
+							reg = <0xa>;
+
+							admaif10_ep: endpoint {
+								remote-endpoint = <&xbar_admaif10_ep>;
+							};
+						};
+
+						admaif11_port: port@b {
+							reg = <0xb>;
+
+							admaif11_ep: endpoint {
+								remote-endpoint = <&xbar_admaif11_ep>;
+							};
+						};
+
+						admaif12_port: port@c {
+							reg = <0xc>;
+
+							admaif12_ep: endpoint {
+								remote-endpoint = <&xbar_admaif12_ep>;
+							};
+						};
+
+						admaif13_port: port@d {
+							reg = <0xd>;
+
+							admaif13_ep: endpoint {
+								remote-endpoint = <&xbar_admaif13_ep>;
+							};
+						};
+
+						admaif14_port: port@e {
+							reg = <0xe>;
+
+							admaif14_ep: endpoint {
+								remote-endpoint = <&xbar_admaif14_ep>;
+							};
+						};
+
+						admaif15_port: port@f {
+							reg = <0xf>;
+
+							admaif15_ep: endpoint {
+								remote-endpoint = <&xbar_admaif15_ep>;
+							};
+						};
+
+						admaif16_port: port@10 {
+							reg = <0x10>;
+
+							admaif16_ep: endpoint {
+								remote-endpoint = <&xbar_admaif16_ep>;
+							};
+						};
+
+						admaif17_port: port@11 {
+							reg = <0x11>;
+
+							admaif17_ep: endpoint {
+								remote-endpoint = <&xbar_admaif17_ep>;
+							};
+						};
+
+						admaif18_port: port@12 {
+							reg = <0x12>;
+
+							admaif18_ep: endpoint {
+								remote-endpoint = <&xbar_admaif18_ep>;
+							};
+						};
+
+						admaif19_port: port@13 {
+							reg = <0x13>;
+
+							admaif19_ep: endpoint {
+								remote-endpoint = <&xbar_admaif19_ep>;
+							};
+						};
+					};
+				};
+
+				i2s@2901200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s3_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s3_ep>;
+							};
+						};
+
+						i2s3_port: port@1 {
+							reg = <1>;
+
+							i2s3_dap_ep: endpoint {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				i2s@2901400 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							i2s5_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s5_ep>;
+							};
+						};
+
+						i2s5_port: port@1 {
+							reg = <1>;
+
+							i2s5_dap_ep: endpoint@0 {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
 				};
 
-				admaif@290f000 {
+				dmic@2904000 {
 					status = "okay";
 
 					ports {
 						#address-cells = <1>;
 						#size-cells = <0>;
 
-						admaif0_port: port@0 {
-							reg = <0x0>;
+						port@0 {
+							reg = <0>;
 
-							admaif0_ep: endpoint {
-								remote-endpoint = <&xbar_admaif0_ep>;
+							dmic1_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic1_ep>;
 							};
 						};
 
-						admaif1_port: port@1 {
-							reg = <0x1>;
+						dmic1_port: port@1 {
+							reg = <1>;
 
-							admaif1_ep: endpoint {
-								remote-endpoint = <&xbar_admaif1_ep>;
+							dmic1_dap_ep: endpoint {
+								/* Place holder for external Codec */
 							};
 						};
+					};
+				};
 
-						admaif2_port: port@2 {
-							reg = <0x2>;
+				dmic@2904100 {
+					status = "okay";
 
-							admaif2_ep: endpoint {
-								remote-endpoint = <&xbar_admaif2_ep>;
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dmic2_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic2_ep>;
 							};
 						};
 
-						admaif3_port: port@3 {
-							reg = <0x3>;
+						dmic2_port: port@1 {
+							reg = <1>;
 
-							admaif3_ep: endpoint {
-								remote-endpoint = <&xbar_admaif3_ep>;
+							dmic2_dap_ep: endpoint {
+								/* Place holder for external Codec */
 							};
 						};
+					};
+				};
 
-						admaif4_port: port@4 {
-							reg = <0x4>;
+				dmic@2904300 {
+					status = "okay";
 
-							admaif4_ep: endpoint {
-								remote-endpoint = <&xbar_admaif4_ep>;
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dmic4_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic4_ep>;
+							};
+						};
+
+						dmic4_port: port@1 {
+							reg = <1>;
+
+							dmic4_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dspk@2905000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dspk1_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dspk1_ep>;
+							};
+						};
+
+						dspk1_port: port@1 {
+							reg = <1>;
+
+							dspk1_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dspk@2905100 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							dspk2_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dspk2_ep>;
+							};
+						};
+
+						dspk2_port: port@1 {
+							reg = <1>;
+
+							dspk2_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				sfc@2902000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc1_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc1_in_ep>;
+								convert-rate = <44100>;
+							};
+						};
+
+						sfc1_out_port: port@1 {
+							reg = <1>;
+
+							sfc1_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc1_out_ep>;
+								convert-rate = <48000>;
+							};
+						};
+					};
+				};
+
+				sfc@2902200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc2_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc2_in_ep>;
+							};
+						};
+
+						sfc2_out_port: port@1 {
+							reg = <1>;
+
+							sfc2_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc2_out_ep>;
+							};
+						};
+					};
+				};
+
+				sfc@2902400 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc3_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc3_in_ep>;
+							};
+						};
+
+						sfc3_out_port: port@1 {
+							reg = <1>;
+
+							sfc3_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc3_out_ep>;
+							};
+						};
+					};
+				};
+
+				sfc@2902600 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							sfc4_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_sfc4_in_ep>;
+							};
+						};
+
+						sfc4_out_port: port@1 {
+							reg = <1>;
+
+							sfc4_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_sfc4_out_ep>;
+							};
+						};
+					};
+				};
+
+				mvc@290a000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							mvc1_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_mvc1_in_ep>;
+							};
+						};
+
+						mvc1_out_port: port@1 {
+							reg = <1>;
+
+							mvc1_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_mvc1_out_ep>;
+							};
+						};
+					};
+				};
+
+				mvc@290a200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							mvc2_cif_in_ep: endpoint {
+								remote-endpoint = <&xbar_mvc2_in_ep>;
+							};
+						};
+
+						mvc2_out_port: port@1 {
+							reg = <1>;
+
+							mvc2_cif_out_ep: endpoint {
+								remote-endpoint = <&xbar_mvc2_out_ep>;
+							};
+						};
+					};
+				};
+
+				amx@2903000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							amx1_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in1_ep>;
 							};
 						};
 
-						admaif5_port: port@5 {
-							reg = <0x5>;
+						port@1 {
+							reg = <1>;
 
-							admaif5_ep: endpoint {
-								remote-endpoint = <&xbar_admaif5_ep>;
+							amx1_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in2_ep>;
 							};
 						};
 
-						admaif6_port: port@6 {
-							reg = <0x6>;
+						port@2 {
+							reg = <2>;
 
-							admaif6_ep: endpoint {
-								remote-endpoint = <&xbar_admaif6_ep>;
+							amx1_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in3_ep>;
 							};
 						};
 
-						admaif7_port: port@7 {
-							reg = <0x7>;
+						port@3 {
+							reg = <3>;
 
-							admaif7_ep: endpoint {
-								remote-endpoint = <&xbar_admaif7_ep>;
+							amx1_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_in4_ep>;
 							};
 						};
 
-						admaif8_port: port@8 {
-							reg = <0x8>;
+						amx1_out_port: port@4 {
+							reg = <4>;
 
-							admaif8_ep: endpoint {
-								remote-endpoint = <&xbar_admaif8_ep>;
+							amx1_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx1_out_ep>;
 							};
 						};
+					};
+				};
 
-						admaif9_port: port@9 {
-							reg = <0x9>;
+				amx@2903100 {
+					status = "okay";
 
-							admaif9_ep: endpoint {
-								remote-endpoint = <&xbar_admaif9_ep>;
-							};
-						};
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
 
-						admaif10_port: port@a {
-							reg = <0xa>;
+						port@0 {
+							reg = <0>;
 
-							admaif10_ep: endpoint {
-								remote-endpoint = <&xbar_admaif10_ep>;
+							amx2_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in1_ep>;
 							};
 						};
 
-						admaif11_port: port@b {
-							reg = <0xb>;
+						port@1 {
+							reg = <1>;
 
-							admaif11_ep: endpoint {
-								remote-endpoint = <&xbar_admaif11_ep>;
+							amx2_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in2_ep>;
 							};
 						};
 
-						admaif12_port: port@c {
-							reg = <0xc>;
+						amx2_in3_port: port@2 {
+							reg = <2>;
 
-							admaif12_ep: endpoint {
-								remote-endpoint = <&xbar_admaif12_ep>;
+							amx2_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in3_ep>;
 							};
 						};
 
-						admaif13_port: port@d {
-							reg = <0xd>;
+						amx2_in4_port: port@3 {
+							reg = <3>;
 
-							admaif13_ep: endpoint {
-								remote-endpoint = <&xbar_admaif13_ep>;
+							amx2_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_in4_ep>;
 							};
 						};
 
-						admaif14_port: port@e {
-							reg = <0xe>;
+						amx2_out_port: port@4 {
+							reg = <4>;
 
-							admaif14_ep: endpoint {
-								remote-endpoint = <&xbar_admaif14_ep>;
+							amx2_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx2_out_ep>;
 							};
 						};
+					};
+				};
 
-						admaif15_port: port@f {
-							reg = <0xf>;
+				amx@2903200 {
+					status = "okay";
 
-							admaif15_ep: endpoint {
-								remote-endpoint = <&xbar_admaif15_ep>;
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+
+							amx3_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in1_ep>;
 							};
 						};
 
-						admaif16_port: port@10 {
-							reg = <0x10>;
+						port@1 {
+							reg = <1>;
 
-							admaif16_ep: endpoint {
-								remote-endpoint = <&xbar_admaif16_ep>;
+							amx3_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in2_ep>;
 							};
 						};
 
-						admaif17_port: port@11 {
-							reg = <0x11>;
+						port@2 {
+							reg = <2>;
 
-							admaif17_ep: endpoint {
-								remote-endpoint = <&xbar_admaif17_ep>;
+							amx3_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in3_ep>;
 							};
 						};
 
-						admaif18_port: port@12 {
-							reg = <0x12>;
+						port@3 {
+							reg = <3>;
 
-							admaif18_ep: endpoint {
-								remote-endpoint = <&xbar_admaif18_ep>;
+							amx3_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_in4_ep>;
 							};
 						};
 
-						admaif19_port: port@13 {
-							reg = <0x13>;
+						amx3_out_port: port@4 {
+							reg = <4>;
 
-							admaif19_ep: endpoint {
-								remote-endpoint = <&xbar_admaif19_ep>;
+							amx3_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx3_out_ep>;
 							};
 						};
 					};
 				};
 
-				i2s@2901200 {
+				amx@2903300 {
 					status = "okay";
 
 					ports {
@@ -419,49 +1431,46 @@
 						port@0 {
 							reg = <0>;
 
-							i2s3_cif_ep: endpoint {
-								remote-endpoint = <&xbar_i2s3_ep>;
+							amx4_in1_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in1_ep>;
 							};
 						};
 
-						i2s3_port: port@1 {
+						port@1 {
 							reg = <1>;
 
-							i2s3_dap_ep: endpoint {
-								dai-format = "i2s";
-								/* Place holder for external Codec */
+							amx4_in2_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in2_ep>;
 							};
 						};
-					};
-				};
 
-				i2s@2901400 {
-					status = "okay";
+						port@2 {
+							reg = <2>;
 
-					ports {
-						#address-cells = <1>;
-						#size-cells = <0>;
+							amx4_in3_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in3_ep>;
+							};
+						};
 
-						port@0 {
-							reg = <0>;
+						port@3 {
+							reg = <3>;
 
-							i2s5_cif_ep: endpoint {
-								remote-endpoint = <&xbar_i2s5_ep>;
+							amx4_in4_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_in4_ep>;
 							};
 						};
 
-						i2s5_port: port@1 {
-							reg = <1>;
+						amx4_out_port: port@4 {
+							reg = <4>;
 
-							i2s5_dap_ep: endpoint@0 {
-								dai-format = "i2s";
-								/* Place holder for external Codec */
+							amx4_out_ep: endpoint {
+								remote-endpoint = <&xbar_amx4_out_ep>;
 							};
 						};
 					};
 				};
 
-				dmic@2904000 {
+				adx@2903800 {
 					status = "okay";
 
 					ports {
@@ -471,22 +1480,46 @@
 						port@0 {
 							reg = <0>;
 
-							dmic1_cif_ep: endpoint {
-								remote-endpoint = <&xbar_dmic1_ep>;
+							adx1_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_in_ep>;
 							};
 						};
 
-						dmic1_port: port@1 {
+						adx1_out1_port: port@1 {
 							reg = <1>;
 
-							dmic1_dap_ep: endpoint {
-								/* Place holder for external Codec */
+							adx1_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out1_ep>;
+							};
+						};
+
+						adx1_out2_port: port@2 {
+							reg = <2>;
+
+							adx1_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out2_ep>;
+							};
+						};
+
+						adx1_out3_port: port@3 {
+							reg = <3>;
+
+							adx1_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out3_ep>;
+							};
+						};
+
+						adx1_out4_port: port@4 {
+							reg = <4>;
+
+							adx1_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx1_out4_ep>;
 							};
 						};
 					};
 				};
 
-				dmic@2904100 {
+				adx@2903900 {
 					status = "okay";
 
 					ports {
@@ -496,22 +1529,46 @@
 						port@0 {
 							reg = <0>;
 
-							dmic2_cif_ep: endpoint {
-								remote-endpoint = <&xbar_dmic2_ep>;
+							adx2_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_in_ep>;
 							};
 						};
 
-						dmic2_port: port@1 {
+						adx2_out1_port: port@1 {
 							reg = <1>;
 
-							dmic2_dap_ep: endpoint {
-								/* Place holder for external Codec */
+							adx2_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out1_ep>;
+							};
+						};
+
+						adx2_out2_port: port@2 {
+							reg = <2>;
+
+							adx2_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out2_ep>;
+							};
+						};
+
+						adx2_out3_port: port@3 {
+							reg = <3>;
+
+							adx2_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out3_ep>;
+							};
+						};
+
+						adx2_out4_port: port@4 {
+							reg = <4>;
+
+							adx2_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx2_out4_ep>;
 							};
 						};
 					};
 				};
 
-				dmic@2904300 {
+				adx@2903a00 {
 					status = "okay";
 
 					ports {
@@ -521,22 +1578,46 @@
 						port@0 {
 							reg = <0>;
 
-							dmic4_cif_ep: endpoint {
-								remote-endpoint = <&xbar_dmic4_ep>;
+							adx3_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_in_ep>;
 							};
 						};
 
-						dmic4_port: port@1 {
+						adx3_out1_port: port@1 {
 							reg = <1>;
 
-							dmic4_dap_ep: endpoint {
-								/* Place holder for external Codec */
+							adx3_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out1_ep>;
+							};
+						};
+
+						adx3_out2_port: port@2 {
+							reg = <2>;
+
+							adx3_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out2_ep>;
+							};
+						};
+
+						adx3_out3_port: port@3 {
+							reg = <3>;
+
+							adx3_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out3_ep>;
+							};
+						};
+
+						adx3_out4_port: port@4 {
+							reg = <4>;
+
+							adx3_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx3_out4_ep>;
 							};
 						};
 					};
 				};
 
-				dspk@2905000 {
+				adx@2903b00 {
 					status = "okay";
 
 					ports {
@@ -546,22 +1627,46 @@
 						port@0 {
 							reg = <0>;
 
-							dspk1_cif_ep: endpoint {
-								remote-endpoint = <&xbar_dspk1_ep>;
+							adx4_in_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_in_ep>;
 							};
 						};
 
-						dspk1_port: port@1 {
+						adx4_out1_port: port@1 {
 							reg = <1>;
 
-							dspk1_dap_ep: endpoint {
-								/* Place holder for external Codec */
+							adx4_out1_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out1_ep>;
+							};
+						};
+
+						adx4_out2_port: port@2 {
+							reg = <2>;
+
+							adx4_out2_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out2_ep>;
+							};
+						};
+
+						adx4_out3_port: port@3 {
+							reg = <3>;
+
+							adx4_out3_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out3_ep>;
+							};
+						};
+
+						adx4_out4_port: port@4 {
+							reg = <4>;
+
+							adx4_out4_ep: endpoint {
+								remote-endpoint = <&xbar_adx4_out4_ep>;
 							};
 						};
 					};
 				};
 
-				dspk@2905100 {
+				amixer@290bb00 {
 					status = "okay";
 
 					ports {
@@ -569,18 +1674,122 @@
 						#size-cells = <0>;
 
 						port@0 {
-							reg = <0>;
+							reg = <0x0>;
 
-							dspk2_cif_ep: endpoint {
-								remote-endpoint = <&xbar_dspk2_ep>;
+							mixer_in1_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in1_ep>;
 							};
 						};
 
-						dspk2_port: port@1 {
-							reg = <1>;
+						port@1 {
+							reg = <0x1>;
 
-							dspk2_dap_ep: endpoint {
-								/* Place holder for external Codec */
+							mixer_in2_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in2_ep>;
+							};
+						};
+
+						port@2 {
+							reg = <0x2>;
+
+							mixer_in3_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in3_ep>;
+							};
+						};
+
+						port@3 {
+							reg = <0x3>;
+
+							mixer_in4_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in4_ep>;
+							};
+						};
+
+						port@4 {
+							reg = <0x4>;
+
+							mixer_in5_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in5_ep>;
+							};
+						};
+
+						port@5 {
+							reg = <0x5>;
+
+							mixer_in6_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in6_ep>;
+							};
+						};
+
+						port@6 {
+							reg = <0x6>;
+
+							mixer_in7_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in7_ep>;
+							};
+						};
+
+						port@7 {
+							reg = <0x7>;
+
+							mixer_in8_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in8_ep>;
+							};
+						};
+
+						port@8 {
+							reg = <0x8>;
+
+							mixer_in9_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in9_ep>;
+							};
+						};
+
+						port@9 {
+							reg = <0x9>;
+
+							mixer_in10_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_in10_ep>;
+							};
+						};
+
+						mixer_out1_port: port@a {
+							reg = <0xa>;
+
+							mixer_out1_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out1_ep>;
+							};
+						};
+
+						mixer_out2_port: port@b {
+							reg = <0xb>;
+
+							mixer_out2_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out2_ep>;
+							};
+						};
+
+						mixer_out3_port: port@c {
+							reg = <0xc>;
+
+							mixer_out3_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out3_ep>;
+							};
+						};
+
+						mixer_out4_port: port@d {
+							reg = <0xd>;
+
+							mixer_out4_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out4_ep>;
+							};
+						};
+
+						mixer_out5_port: port@e {
+							reg = <0xe>;
+
+							mixer_out5_ep: endpoint {
+								remote-endpoint = <&xbar_mixer_out5_ep>;
 							};
 						};
 					};
@@ -850,6 +2059,41 @@
 		       <&xbar_i2s3_port>, <&xbar_i2s5_port>,
 		       <&xbar_dmic1_port>, <&xbar_dmic2_port>, <&xbar_dmic4_port>,
 		       <&xbar_dspk1_port>, <&xbar_dspk2_port>,
+		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
+		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
+		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
+		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
+		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
+		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
+		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
+		       <&xbar_amx3_in1_port>, <&xbar_amx3_in2_port>,
+		       <&xbar_amx3_in3_port>, <&xbar_amx3_in4_port>,
+		       <&xbar_amx4_in1_port>, <&xbar_amx4_in2_port>,
+		       <&xbar_amx4_in3_port>, <&xbar_amx4_in4_port>,
+		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
+		       <&xbar_adx3_in_port>, <&xbar_adx4_in_port>,
+		       <&xbar_mixer_in1_port>, <&xbar_mixer_in2_port>,
+		       <&xbar_mixer_in3_port>, <&xbar_mixer_in4_port>,
+		       <&xbar_mixer_in5_port>, <&xbar_mixer_in6_port>,
+		       <&xbar_mixer_in7_port>, <&xbar_mixer_in8_port>,
+		       <&xbar_mixer_in9_port>, <&xbar_mixer_in10_port>,
+		       /* HW accelerators */
+		       <&sfc1_out_port>, <&sfc2_out_port>,
+		       <&sfc3_out_port>, <&sfc4_out_port>,
+		       <&mvc1_out_port>, <&mvc2_out_port>,
+		       <&amx1_out_port>, <&amx2_out_port>,
+		       <&amx3_out_port>, <&amx4_out_port>,
+		       <&adx1_out1_port>, <&adx1_out2_port>,
+		       <&adx1_out3_port>, <&adx1_out4_port>,
+		       <&adx2_out1_port>, <&adx2_out2_port>,
+		       <&adx2_out3_port>, <&adx2_out4_port>,
+		       <&adx3_out1_port>, <&adx3_out2_port>,
+		       <&adx3_out3_port>, <&adx3_out4_port>,
+		       <&adx4_out1_port>, <&adx4_out2_port>,
+		       <&adx4_out3_port>, <&adx4_out4_port>,
+		       <&mixer_out1_port>, <&mixer_out2_port>,
+		       <&mixer_out3_port>, <&mixer_out4_port>,
+		       <&mixer_out5_port>,
 		       /* BE I/O Ports */
 		       <&i2s3_port>, <&i2s5_port>,
 		       <&dmic1_port>, <&dmic2_port>, <&dmic4_port>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 7d3e363..2e17df6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -339,6 +339,481 @@
 				};
 			};
 
+			sfc@702d2000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_in_ep>;
+						};
+					};
+
+					sfc1_out_port: port@1 {
+						reg = <1>;
+
+						sfc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_out_ep>;
+						};
+					};
+				};
+			};
+
+			sfc@702d2200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_in_ep>;
+						};
+					};
+
+					sfc2_out_port: port@1 {
+						reg = <1>;
+
+						sfc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_out_ep>;
+						};
+					};
+				};
+			};
+
+			sfc@702d2400 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc3_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_in_ep>;
+						};
+					};
+
+					sfc3_out_port: port@1 {
+						reg = <1>;
+
+						sfc3_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_out_ep>;
+						};
+					};
+				};
+			};
+
+			sfc@702d2600 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc4_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_in_ep>;
+						};
+					};
+
+					sfc4_out_port: port@1 {
+						reg = <1>;
+
+						sfc4_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_out_ep>;
+						};
+					};
+				};
+			};
+
+			mvc@702da000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mvc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_in_ep>;
+						};
+					};
+
+					mvc1_out_port: port@1 {
+						reg = <1>;
+
+						mvc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_out_ep>;
+						};
+					};
+				};
+			};
+
+			mvc@702da200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mvc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_in_ep>;
+						};
+					};
+
+					mvc2_out_port: port@1 {
+						reg = <1>;
+
+						mvc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_out_ep>;
+						};
+					};
+				};
+			};
+
+			amx@702d3000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						amx1_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						amx1_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						amx1_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						amx1_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in4_ep>;
+						};
+					};
+
+					amx1_out_port: port@4 {
+						reg = <4>;
+
+						amx1_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_out_ep>;
+						};
+					};
+				};
+			};
+
+			amx@702d3100 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						amx2_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						amx2_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in2_ep>;
+						};
+					};
+
+					amx2_in3_port: port@2 {
+						reg = <2>;
+
+						amx2_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in3_ep>;
+						};
+					};
+
+					amx2_in4_port: port@3 {
+						reg = <3>;
+
+						amx2_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in4_ep>;
+						};
+					};
+
+					amx2_out_port: port@4 {
+						reg = <4>;
+
+						amx2_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_out_ep>;
+						};
+					};
+				};
+			};
+
+			adx@702d3800 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						adx1_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_in_ep>;
+						};
+					};
+
+					adx1_out1_port: port@1 {
+						reg = <1>;
+
+						adx1_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out1_ep>;
+						};
+					};
+
+					adx1_out2_port: port@2 {
+						reg = <2>;
+
+						adx1_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out2_ep>;
+						};
+					};
+
+					adx1_out3_port: port@3 {
+						reg = <3>;
+
+						adx1_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out3_ep>;
+						};
+					};
+
+					adx1_out4_port: port@4 {
+						reg = <4>;
+
+						adx1_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out4_ep>;
+						};
+					};
+				};
+			};
+
+			adx@702d3900 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						adx2_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_in_ep>;
+						};
+					};
+
+					adx2_out1_port: port@1 {
+						reg = <1>;
+
+						adx2_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out1_ep>;
+						};
+					};
+
+					adx2_out2_port: port@2 {
+						reg = <2>;
+
+						adx2_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out2_ep>;
+						};
+					};
+
+					adx2_out3_port: port@3 {
+						reg = <3>;
+
+						adx2_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out3_ep>;
+						};
+					};
+
+					adx2_out4_port: port@4 {
+						reg = <4>;
+
+						adx2_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out4_ep>;
+						};
+					};
+				};
+			};
+
+			amixer@702dbb00 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0x0>;
+
+						mixer_in1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <0x1>;
+
+						mixer_in2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <0x2>;
+
+						mixer_in3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <0x3>;
+
+						mixer_in4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in4_ep>;
+						};
+					};
+
+					port@4 {
+						reg = <0x4>;
+
+						mixer_in5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in5_ep>;
+						};
+					};
+
+					port@5 {
+						reg = <0x5>;
+
+						mixer_in6_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in6_ep>;
+						};
+					};
+
+					port@6 {
+						reg = <0x6>;
+
+						mixer_in7_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in7_ep>;
+						};
+					};
+
+					port@7 {
+						reg = <0x7>;
+
+						mixer_in8_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in8_ep>;
+						};
+					};
+
+					port@8 {
+						reg = <0x8>;
+
+						mixer_in9_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in9_ep>;
+						};
+					};
+
+					port@9 {
+						reg = <0x9>;
+
+						mixer_in10_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in10_ep>;
+						};
+					};
+
+					mixer_out1_port: port@a {
+						reg = <0xa>;
+
+						mixer_out1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out1_ep>;
+						};
+					};
+
+					mixer_out2_port: port@b {
+						reg = <0xb>;
+
+						mixer_out2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out2_ep>;
+						};
+					};
+
+					mixer_out3_port: port@c {
+						reg = <0xc>;
+
+						mixer_out3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out3_ep>;
+						};
+					};
+
+					mixer_out4_port: port@d {
+						reg = <0xd>;
+
+						mixer_out4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out4_ep>;
+						};
+					};
+
+					mixer_out5_port: port@e {
+						reg = <0xe>;
+
+						mixer_out5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out5_ep>;
+						};
+					};
+				};
+			};
+
 			ports {
 				xbar_i2s1_port: port@a {
 					reg = <0xa>;
@@ -403,6 +878,382 @@
 						remote-endpoint = <&dmic3_cif_ep>;
 					};
 				};
+
+				xbar_sfc1_in_port: port@12 {
+					reg = <0x12>;
+
+					xbar_sfc1_in_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_in_ep>;
+					};
+				};
+
+				port@13 {
+					reg = <0x13>;
+
+					xbar_sfc1_out_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc2_in_port: port@14 {
+					reg = <0x14>;
+
+					xbar_sfc2_in_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_in_ep>;
+					};
+				};
+
+				port@15 {
+					reg = <0x15>;
+
+					xbar_sfc2_out_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc3_in_port: port@16 {
+					reg = <0x16>;
+
+					xbar_sfc3_in_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_in_ep>;
+					};
+				};
+
+				port@17 {
+					reg = <0x17>;
+
+					xbar_sfc3_out_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc4_in_port: port@18 {
+					reg = <0x18>;
+
+					xbar_sfc4_in_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_in_ep>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					xbar_sfc4_out_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc1_in_port: port@1a {
+					reg = <0x1a>;
+
+					xbar_mvc1_in_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_in_ep>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					xbar_mvc1_out_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc2_in_port: port@1c {
+					reg = <0x1c>;
+
+					xbar_mvc2_in_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_in_ep>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					xbar_mvc2_out_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_out_ep>;
+					};
+				};
+
+				xbar_amx1_in1_port: port@1e {
+					reg = <0x1e>;
+
+					xbar_amx1_in1_ep: endpoint {
+						remote-endpoint = <&amx1_in1_ep>;
+					};
+				};
+
+				xbar_amx1_in2_port: port@1f {
+					reg = <0x1f>;
+
+					xbar_amx1_in2_ep: endpoint {
+						remote-endpoint = <&amx1_in2_ep>;
+					};
+				};
+
+				xbar_amx1_in3_port: port@20 {
+					reg = <0x20>;
+
+					xbar_amx1_in3_ep: endpoint {
+						remote-endpoint = <&amx1_in3_ep>;
+					};
+				};
+
+				xbar_amx1_in4_port: port@21 {
+					reg = <0x21>;
+
+					xbar_amx1_in4_ep: endpoint {
+						remote-endpoint = <&amx1_in4_ep>;
+					};
+				};
+
+				port@22 {
+					reg = <0x22>;
+
+					xbar_amx1_out_ep: endpoint {
+						remote-endpoint = <&amx1_out_ep>;
+					};
+				};
+
+				xbar_amx2_in1_port: port@23 {
+					reg = <0x23>;
+
+					xbar_amx2_in1_ep: endpoint {
+						remote-endpoint = <&amx2_in1_ep>;
+					};
+				};
+
+				xbar_amx2_in2_port: port@24 {
+					reg = <0x24>;
+
+					xbar_amx2_in2_ep: endpoint {
+						remote-endpoint = <&amx2_in2_ep>;
+					};
+				};
+
+				xbar_amx2_in3_port: port@25 {
+					reg = <0x25>;
+
+					xbar_amx2_in3_ep: endpoint {
+						remote-endpoint = <&amx2_in3_ep>;
+					};
+				};
+
+				xbar_amx2_in4_port: port@26 {
+					reg = <0x26>;
+
+					xbar_amx2_in4_ep: endpoint {
+						remote-endpoint = <&amx2_in4_ep>;
+					};
+				};
+
+				port@27 {
+					reg = <0x27>;
+
+					xbar_amx2_out_ep: endpoint {
+						remote-endpoint = <&amx2_out_ep>;
+					};
+				};
+
+				xbar_adx1_in_port: port@28 {
+					reg = <0x28>;
+
+					xbar_adx1_in_ep: endpoint {
+						remote-endpoint = <&adx1_in_ep>;
+					};
+				};
+
+				port@29 {
+					reg = <0x29>;
+
+					xbar_adx1_out1_ep: endpoint {
+						remote-endpoint = <&adx1_out1_ep>;
+					};
+				};
+
+				port@2a {
+					reg = <0x2a>;
+
+					xbar_adx1_out2_ep: endpoint {
+						remote-endpoint = <&adx1_out2_ep>;
+					};
+				};
+
+				port@2b {
+					reg = <0x2b>;
+
+					xbar_adx1_out3_ep: endpoint {
+						remote-endpoint = <&adx1_out3_ep>;
+					};
+				};
+
+				port@2c {
+					reg = <0x2c>;
+
+					xbar_adx1_out4_ep: endpoint {
+						remote-endpoint = <&adx1_out4_ep>;
+					};
+				};
+
+				xbar_adx2_in_port: port@2d {
+					reg = <0x2d>;
+
+					xbar_adx2_in_ep: endpoint {
+						remote-endpoint = <&adx2_in_ep>;
+					};
+				};
+
+				port@2e {
+					reg = <0x2e>;
+
+					xbar_adx2_out1_ep: endpoint {
+						remote-endpoint = <&adx2_out1_ep>;
+					};
+				};
+
+				port@2f {
+					reg = <0x2f>;
+
+					xbar_adx2_out2_ep: endpoint {
+						remote-endpoint = <&adx2_out2_ep>;
+					};
+				};
+
+				port@30 {
+					reg = <0x30>;
+
+					xbar_adx2_out3_ep: endpoint {
+						remote-endpoint = <&adx2_out3_ep>;
+					};
+				};
+
+				port@31 {
+					reg = <0x31>;
+
+					xbar_adx2_out4_ep: endpoint {
+						remote-endpoint = <&adx2_out4_ep>;
+					};
+				};
+
+				xbar_mixer_in1_port: port@32 {
+					reg = <0x32>;
+
+					xbar_mixer_in1_ep: endpoint {
+						remote-endpoint = <&mixer_in1_ep>;
+					};
+				};
+
+				xbar_mixer_in2_port: port@33 {
+					reg = <0x33>;
+
+					xbar_mixer_in2_ep: endpoint {
+						remote-endpoint = <&mixer_in2_ep>;
+					};
+				};
+
+				xbar_mixer_in3_port: port@34 {
+					reg = <0x34>;
+
+					xbar_mixer_in3_ep: endpoint {
+						remote-endpoint = <&mixer_in3_ep>;
+					};
+				};
+
+				xbar_mixer_in4_port: port@35 {
+					reg = <0x35>;
+
+					xbar_mixer_in4_ep: endpoint {
+						remote-endpoint = <&mixer_in4_ep>;
+					};
+				};
+
+				xbar_mixer_in5_port: port@36 {
+					reg = <0x36>;
+
+					xbar_mixer_in5_ep: endpoint {
+						remote-endpoint = <&mixer_in5_ep>;
+					};
+				};
+
+				xbar_mixer_in6_port: port@37 {
+					reg = <0x37>;
+
+					xbar_mixer_in6_ep: endpoint {
+						remote-endpoint = <&mixer_in6_ep>;
+					};
+				};
+
+				xbar_mixer_in7_port: port@38 {
+					reg = <0x38>;
+
+					xbar_mixer_in7_ep: endpoint {
+						remote-endpoint = <&mixer_in7_ep>;
+					};
+				};
+
+				xbar_mixer_in8_port: port@39 {
+					reg = <0x39>;
+
+					xbar_mixer_in8_ep: endpoint {
+						remote-endpoint = <&mixer_in8_ep>;
+					};
+				};
+
+				xbar_mixer_in9_port: port@3a {
+					reg = <0x3a>;
+
+					xbar_mixer_in9_ep: endpoint {
+						remote-endpoint = <&mixer_in9_ep>;
+					};
+				};
+
+				xbar_mixer_in10_port: port@3b {
+					reg = <0x3b>;
+
+					xbar_mixer_in10_ep: endpoint {
+						remote-endpoint = <&mixer_in10_ep>;
+					};
+				};
+
+				port@3c {
+					reg = <0x3c>;
+
+					xbar_mixer_out1_ep: endpoint {
+						remote-endpoint = <&mixer_out1_ep>;
+					};
+				};
+
+				port@3d {
+					reg = <0x3d>;
+
+					xbar_mixer_out2_ep: endpoint {
+						remote-endpoint = <&mixer_out2_ep>;
+					};
+				};
+
+				port@3e {
+					reg = <0x3e>;
+
+					xbar_mixer_out3_ep: endpoint {
+						remote-endpoint = <&mixer_out3_ep>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					xbar_mixer_out4_ep: endpoint {
+						remote-endpoint = <&mixer_out4_ep>;
+					};
+				};
+
+				port@40 {
+					reg = <0x40>;
+
+					xbar_mixer_out5_ep: endpoint {
+						remote-endpoint = <&mixer_out5_ep>;
+					};
+				};
 			};
 		};
 	};
@@ -420,6 +1271,31 @@
 		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s3_port>,
 		       <&xbar_i2s4_port>, <&xbar_i2s5_port>, <&xbar_dmic1_port>,
 		       <&xbar_dmic2_port>, <&xbar_dmic3_port>,
+		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
+		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
+		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
+		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
+		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
+		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
+		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
+		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
+		       <&xbar_mixer_in1_port>, <&xbar_mixer_in2_port>,
+		       <&xbar_mixer_in3_port>, <&xbar_mixer_in4_port>,
+		       <&xbar_mixer_in5_port>, <&xbar_mixer_in6_port>,
+		       <&xbar_mixer_in7_port>, <&xbar_mixer_in8_port>,
+		       <&xbar_mixer_in9_port>, <&xbar_mixer_in10_port>,
+		       /* HW accelerators */
+		       <&sfc1_out_port>, <&sfc2_out_port>,
+		       <&sfc3_out_port>, <&sfc4_out_port>,
+		       <&mvc1_out_port>, <&mvc2_out_port>,
+		       <&amx1_out_port>, <&amx2_out_port>,
+		       <&adx1_out1_port>, <&adx1_out2_port>,
+		       <&adx1_out3_port>, <&adx1_out4_port>,
+		       <&adx2_out1_port>, <&adx2_out2_port>,
+		       <&adx2_out3_port>, <&adx2_out4_port>,
+		       <&mixer_out1_port>, <&mixer_out2_port>,
+		       <&mixer_out3_port>, <&mixer_out4_port>,
+		       <&mixer_out5_port>,
 		       /* I/O DAP Ports */
 		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>,
 		       <&i2s5_port>, <&dmic1_port>, <&dmic2_port>, <&dmic3_port>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 7dbb13f..030f264 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -746,6 +746,481 @@
 				};
 			};
 
+			sfc@702d2000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_in_ep>;
+						};
+					};
+
+					sfc1_out_port: port@1 {
+						reg = <1>;
+
+						sfc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc1_out_ep>;
+						};
+					};
+				};
+			};
+
+			sfc@702d2200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_in_ep>;
+						};
+					};
+
+					sfc2_out_port: port@1 {
+						reg = <1>;
+
+						sfc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc2_out_ep>;
+						};
+					};
+				};
+			};
+
+			sfc@702d2400 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc3_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_in_ep>;
+						};
+					};
+
+					sfc3_out_port: port@1 {
+						reg = <1>;
+
+						sfc3_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc3_out_ep>;
+						};
+					};
+				};
+			};
+
+			sfc@702d2600 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sfc4_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_in_ep>;
+						};
+					};
+
+					sfc4_out_port: port@1 {
+						reg = <1>;
+
+						sfc4_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_sfc4_out_ep>;
+						};
+					};
+				};
+			};
+
+			mvc@702da000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mvc1_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_in_ep>;
+						};
+					};
+
+					mvc1_out_port: port@1 {
+						reg = <1>;
+
+						mvc1_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc1_out_ep>;
+						};
+					};
+				};
+			};
+
+			mvc@702da200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mvc2_cif_in_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_in_ep>;
+						};
+					};
+
+					mvc2_out_port: port@1 {
+						reg = <1>;
+
+						mvc2_cif_out_ep: endpoint {
+							remote-endpoint = <&xbar_mvc2_out_ep>;
+						};
+					};
+				};
+			};
+
+			amx@702d3000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						amx1_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						amx1_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						amx1_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						amx1_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_in4_ep>;
+						};
+					};
+
+					amx1_out_port: port@4 {
+						reg = <4>;
+
+						amx1_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx1_out_ep>;
+						};
+					};
+				};
+			};
+
+			amx@702d3100 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						amx2_in1_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						amx2_in2_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in2_ep>;
+						};
+					};
+
+					amx2_in3_port: port@2 {
+						reg = <2>;
+
+						amx2_in3_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in3_ep>;
+						};
+					};
+
+					amx2_in4_port: port@3 {
+						reg = <3>;
+
+						amx2_in4_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_in4_ep>;
+						};
+					};
+
+					amx2_out_port: port@4 {
+						reg = <4>;
+
+						amx2_out_ep: endpoint {
+							remote-endpoint = <&xbar_amx2_out_ep>;
+						};
+					};
+				};
+			};
+
+			adx@702d3800 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						adx1_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_in_ep>;
+						};
+					};
+
+					adx1_out1_port: port@1 {
+						reg = <1>;
+
+						adx1_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out1_ep>;
+						};
+					};
+
+					adx1_out2_port: port@2 {
+						reg = <2>;
+
+						adx1_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out2_ep>;
+						};
+					};
+
+					adx1_out3_port: port@3 {
+						reg = <3>;
+
+						adx1_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out3_ep>;
+						};
+					};
+
+					adx1_out4_port: port@4 {
+						reg = <4>;
+
+						adx1_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx1_out4_ep>;
+						};
+					};
+				};
+			};
+
+			adx@702d3900 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						adx2_in_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_in_ep>;
+						};
+					};
+
+					adx2_out1_port: port@1 {
+						reg = <1>;
+
+						adx2_out1_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out1_ep>;
+						};
+					};
+
+					adx2_out2_port: port@2 {
+						reg = <2>;
+
+						adx2_out2_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out2_ep>;
+						};
+					};
+
+					adx2_out3_port: port@3 {
+						reg = <3>;
+
+						adx2_out3_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out3_ep>;
+						};
+					};
+
+					adx2_out4_port: port@4 {
+						reg = <4>;
+
+						adx2_out4_ep: endpoint {
+							remote-endpoint = <&xbar_adx2_out4_ep>;
+						};
+					};
+				};
+			};
+
+			amixer@702dbb00 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0x0>;
+
+						mixer_in1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in1_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <0x1>;
+
+						mixer_in2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in2_ep>;
+						};
+					};
+
+					port@2 {
+						reg = <0x2>;
+
+						mixer_in3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in3_ep>;
+						};
+					};
+
+					port@3 {
+						reg = <0x3>;
+
+						mixer_in4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in4_ep>;
+						};
+					};
+
+					port@4 {
+						reg = <0x4>;
+
+						mixer_in5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in5_ep>;
+						};
+					};
+
+					port@5 {
+						reg = <0x5>;
+
+						mixer_in6_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in6_ep>;
+						};
+					};
+
+					port@6 {
+						reg = <0x6>;
+
+						mixer_in7_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in7_ep>;
+						};
+					};
+
+					port@7 {
+						reg = <0x7>;
+
+						mixer_in8_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in8_ep>;
+						};
+					};
+
+					port@8 {
+						reg = <0x8>;
+
+						mixer_in9_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in9_ep>;
+						};
+					};
+
+					port@9 {
+						reg = <0x9>;
+
+						mixer_in10_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_in10_ep>;
+						};
+					};
+
+					mixer_out1_port: port@a {
+						reg = <0xa>;
+
+						mixer_out1_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out1_ep>;
+						};
+					};
+
+					mixer_out2_port: port@b {
+						reg = <0xb>;
+
+						mixer_out2_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out2_ep>;
+						};
+					};
+
+					mixer_out3_port: port@c {
+						reg = <0xc>;
+
+						mixer_out3_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out3_ep>;
+						};
+					};
+
+					mixer_out4_port: port@d {
+						reg = <0xd>;
+
+						mixer_out4_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out4_ep>;
+						};
+					};
+
+					mixer_out5_port: port@e {
+						reg = <0xe>;
+
+						mixer_out5_ep: endpoint {
+							remote-endpoint = <&xbar_mixer_out5_ep>;
+						};
+					};
+				};
+			};
+
 			ports {
 				xbar_i2s3_port: port@c {
 					reg = <0xc>;
@@ -778,6 +1253,382 @@
 						remote-endpoint = <&dmic2_cif_ep>;
 					};
 				};
+
+				xbar_sfc1_in_port: port@12 {
+					reg = <0x12>;
+
+					xbar_sfc1_in_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_in_ep>;
+					};
+				};
+
+				port@13 {
+					reg = <0x13>;
+
+					xbar_sfc1_out_ep: endpoint {
+						remote-endpoint = <&sfc1_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc2_in_port: port@14 {
+					reg = <0x14>;
+
+					xbar_sfc2_in_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_in_ep>;
+					};
+				};
+
+				port@15 {
+					reg = <0x15>;
+
+					xbar_sfc2_out_ep: endpoint {
+						remote-endpoint = <&sfc2_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc3_in_port: port@16 {
+					reg = <0x16>;
+
+					xbar_sfc3_in_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_in_ep>;
+					};
+				};
+
+				port@17 {
+					reg = <0x17>;
+
+					xbar_sfc3_out_ep: endpoint {
+						remote-endpoint = <&sfc3_cif_out_ep>;
+					};
+				};
+
+				xbar_sfc4_in_port: port@18 {
+					reg = <0x18>;
+
+					xbar_sfc4_in_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_in_ep>;
+					};
+				};
+
+				port@19 {
+					reg = <0x19>;
+
+					xbar_sfc4_out_ep: endpoint {
+						remote-endpoint = <&sfc4_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc1_in_port: port@1a {
+					reg = <0x1a>;
+
+					xbar_mvc1_in_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_in_ep>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					xbar_mvc1_out_ep: endpoint {
+						remote-endpoint = <&mvc1_cif_out_ep>;
+					};
+				};
+
+				xbar_mvc2_in_port: port@1c {
+					reg = <0x1c>;
+
+					xbar_mvc2_in_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_in_ep>;
+					};
+				};
+
+				port@1d {
+					reg = <0x1d>;
+
+					xbar_mvc2_out_ep: endpoint {
+						remote-endpoint = <&mvc2_cif_out_ep>;
+					};
+				};
+
+				xbar_amx1_in1_port: port@1e {
+					reg = <0x1e>;
+
+					xbar_amx1_in1_ep: endpoint {
+						remote-endpoint = <&amx1_in1_ep>;
+					};
+				};
+
+				xbar_amx1_in2_port: port@1f {
+					reg = <0x1f>;
+
+					xbar_amx1_in2_ep: endpoint {
+						remote-endpoint = <&amx1_in2_ep>;
+					};
+				};
+
+				xbar_amx1_in3_port: port@20 {
+					reg = <0x20>;
+
+					xbar_amx1_in3_ep: endpoint {
+						remote-endpoint = <&amx1_in3_ep>;
+					};
+				};
+
+				xbar_amx1_in4_port: port@21 {
+					reg = <0x21>;
+
+					xbar_amx1_in4_ep: endpoint {
+						remote-endpoint = <&amx1_in4_ep>;
+					};
+				};
+
+				port@22 {
+					reg = <0x22>;
+
+					xbar_amx1_out_ep: endpoint {
+						remote-endpoint = <&amx1_out_ep>;
+					};
+				};
+
+				xbar_amx2_in1_port: port@23 {
+					reg = <0x23>;
+
+					xbar_amx2_in1_ep: endpoint {
+						remote-endpoint = <&amx2_in1_ep>;
+					};
+				};
+
+				xbar_amx2_in2_port: port@24 {
+					reg = <0x24>;
+
+					xbar_amx2_in2_ep: endpoint {
+						remote-endpoint = <&amx2_in2_ep>;
+					};
+				};
+
+				xbar_amx2_in3_port: port@25 {
+					reg = <0x25>;
+
+					xbar_amx2_in3_ep: endpoint {
+						remote-endpoint = <&amx2_in3_ep>;
+					};
+				};
+
+				xbar_amx2_in4_port: port@26 {
+					reg = <0x26>;
+
+					xbar_amx2_in4_ep: endpoint {
+						remote-endpoint = <&amx2_in4_ep>;
+					};
+				};
+
+				port@27 {
+					reg = <0x27>;
+
+					xbar_amx2_out_ep: endpoint {
+						remote-endpoint = <&amx2_out_ep>;
+					};
+				};
+
+				xbar_adx1_in_port: port@28 {
+					reg = <0x28>;
+
+					xbar_adx1_in_ep: endpoint {
+						remote-endpoint = <&adx1_in_ep>;
+					};
+				};
+
+				port@29 {
+					reg = <0x29>;
+
+					xbar_adx1_out1_ep: endpoint {
+						remote-endpoint = <&adx1_out1_ep>;
+					};
+				};
+
+				port@2a {
+					reg = <0x2a>;
+
+					xbar_adx1_out2_ep: endpoint {
+						remote-endpoint = <&adx1_out2_ep>;
+					};
+				};
+
+				port@2b {
+					reg = <0x2b>;
+
+					xbar_adx1_out3_ep: endpoint {
+						remote-endpoint = <&adx1_out3_ep>;
+					};
+				};
+
+				port@2c {
+					reg = <0x2c>;
+
+					xbar_adx1_out4_ep: endpoint {
+						remote-endpoint = <&adx1_out4_ep>;
+					};
+				};
+
+				xbar_adx2_in_port: port@2d {
+					reg = <0x2d>;
+
+					xbar_adx2_in_ep: endpoint {
+						remote-endpoint = <&adx2_in_ep>;
+					};
+				};
+
+				port@2e {
+					reg = <0x2e>;
+
+					xbar_adx2_out1_ep: endpoint {
+						remote-endpoint = <&adx2_out1_ep>;
+					};
+				};
+
+				port@2f {
+					reg = <0x2f>;
+
+					xbar_adx2_out2_ep: endpoint {
+						remote-endpoint = <&adx2_out2_ep>;
+					};
+				};
+
+				port@30 {
+					reg = <0x30>;
+
+					xbar_adx2_out3_ep: endpoint {
+						remote-endpoint = <&adx2_out3_ep>;
+					};
+				};
+
+				port@31 {
+					reg = <0x31>;
+
+					xbar_adx2_out4_ep: endpoint {
+						remote-endpoint = <&adx2_out4_ep>;
+					};
+				};
+
+				xbar_mixer_in1_port: port@32 {
+					reg = <0x32>;
+
+					xbar_mixer_in1_ep: endpoint {
+						remote-endpoint = <&mixer_in1_ep>;
+					};
+				};
+
+				xbar_mixer_in2_port: port@33 {
+					reg = <0x33>;
+
+					xbar_mixer_in2_ep: endpoint {
+						remote-endpoint = <&mixer_in2_ep>;
+					};
+				};
+
+				xbar_mixer_in3_port: port@34 {
+					reg = <0x34>;
+
+					xbar_mixer_in3_ep: endpoint {
+						remote-endpoint = <&mixer_in3_ep>;
+					};
+				};
+
+				xbar_mixer_in4_port: port@35 {
+					reg = <0x35>;
+
+					xbar_mixer_in4_ep: endpoint {
+						remote-endpoint = <&mixer_in4_ep>;
+					};
+				};
+
+				xbar_mixer_in5_port: port@36 {
+					reg = <0x36>;
+
+					xbar_mixer_in5_ep: endpoint {
+						remote-endpoint = <&mixer_in5_ep>;
+					};
+				};
+
+				xbar_mixer_in6_port: port@37 {
+					reg = <0x37>;
+
+					xbar_mixer_in6_ep: endpoint {
+						remote-endpoint = <&mixer_in6_ep>;
+					};
+				};
+
+				xbar_mixer_in7_port: port@38 {
+					reg = <0x38>;
+
+					xbar_mixer_in7_ep: endpoint {
+						remote-endpoint = <&mixer_in7_ep>;
+					};
+				};
+
+				xbar_mixer_in8_port: port@39 {
+					reg = <0x39>;
+
+					xbar_mixer_in8_ep: endpoint {
+						remote-endpoint = <&mixer_in8_ep>;
+					};
+				};
+
+				xbar_mixer_in9_port: port@3a {
+					reg = <0x3a>;
+
+					xbar_mixer_in9_ep: endpoint {
+						remote-endpoint = <&mixer_in9_ep>;
+					};
+				};
+
+				xbar_mixer_in10_port: port@3b {
+					reg = <0x3b>;
+
+					xbar_mixer_in10_ep: endpoint {
+						remote-endpoint = <&mixer_in10_ep>;
+					};
+				};
+
+				port@3c {
+					reg = <0x3c>;
+
+					xbar_mixer_out1_ep: endpoint {
+						remote-endpoint = <&mixer_out1_ep>;
+					};
+				};
+
+				port@3d {
+					reg = <0x3d>;
+
+					xbar_mixer_out2_ep: endpoint {
+						remote-endpoint = <&mixer_out2_ep>;
+					};
+				};
+
+				port@3e {
+					reg = <0x3e>;
+
+					xbar_mixer_out3_ep: endpoint {
+						remote-endpoint = <&mixer_out3_ep>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					xbar_mixer_out4_ep: endpoint {
+						remote-endpoint = <&mixer_out4_ep>;
+					};
+				};
+
+				port@40 {
+					reg = <0x40>;
+
+					xbar_mixer_out5_ep: endpoint {
+						remote-endpoint = <&mixer_out5_ep>;
+					};
+				};
 			};
 		};
 	};
@@ -1039,6 +1890,31 @@
 		       /* Router */
 		       <&xbar_i2s3_port>, <&xbar_i2s4_port>,
 		       <&xbar_dmic1_port>, <&xbar_dmic2_port>,
+		       <&xbar_sfc1_in_port>, <&xbar_sfc2_in_port>,
+		       <&xbar_sfc3_in_port>, <&xbar_sfc4_in_port>,
+		       <&xbar_mvc1_in_port>, <&xbar_mvc2_in_port>,
+		       <&xbar_amx1_in1_port>, <&xbar_amx1_in2_port>,
+		       <&xbar_amx1_in3_port>, <&xbar_amx1_in4_port>,
+		       <&xbar_amx2_in1_port>, <&xbar_amx2_in2_port>,
+		       <&xbar_amx2_in3_port>, <&xbar_amx2_in4_port>,
+		       <&xbar_adx1_in_port>, <&xbar_adx2_in_port>,
+		       <&xbar_mixer_in1_port>, <&xbar_mixer_in2_port>,
+		       <&xbar_mixer_in3_port>, <&xbar_mixer_in4_port>,
+		       <&xbar_mixer_in5_port>, <&xbar_mixer_in6_port>,
+		       <&xbar_mixer_in7_port>, <&xbar_mixer_in8_port>,
+		       <&xbar_mixer_in9_port>, <&xbar_mixer_in10_port>,
+		       /* HW accelerators */
+		       <&sfc1_out_port>, <&sfc2_out_port>,
+		       <&sfc3_out_port>, <&sfc4_out_port>,
+		       <&mvc1_out_port>, <&mvc2_out_port>,
+		       <&amx1_out_port>, <&amx2_out_port>,
+		       <&adx1_out1_port>, <&adx1_out2_port>,
+		       <&adx1_out3_port>, <&adx1_out4_port>,
+		       <&adx2_out1_port>, <&adx2_out2_port>,
+		       <&adx2_out3_port>, <&adx2_out4_port>,
+		       <&mixer_out1_port>, <&mixer_out2_port>,
+		       <&mixer_out3_port>, <&mixer_out4_port>,
+		       <&mixer_out5_port>,
 		       /* I/O DAP Ports */
 		       <&i2s3_port>, <&i2s4_port>,
 		       <&dmic1_port>, <&dmic2_port>;
-- 
2.7.4

