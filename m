Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4C693D81
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 05:46:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BFBE20B;
	Mon, 13 Feb 2023 05:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BFBE20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676263568;
	bh=oI9WUdzev9tYgWVL+wyG8aMJj85RunwvgYnIvQCtfN0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pb1ZeVj4HUmTdxadG6kLJQ0HpsRnNv3k3R6eBjzSPZUz7KLWIqfVgYUaXQ8wuqae1
	 XXWctvWyA55gwxxgkr8ZzHSnjza+UXJDloTYjKxzG4O140I731GOJ56zP8QN0UgAl/
	 jN/4VoVUJo+FP18u1zfHnXT2Raz8DW+CXBLSEJGw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75053F804B0;
	Mon, 13 Feb 2023 05:45:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6848BF804B4; Mon, 13 Feb 2023 05:45:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5C79F800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 05:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C79F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=rDrAmm3V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dgwqu88pRF1z3dI7Kzd0DS2n+f+A4Pl0MGW2uJtXvXC3wtLpr43GQvK9K5XxtkP5KFEnrxC22LDr269S8qubKh+SBZclaGqh1gJeMObg7RII2aATBlmjEy+mL5HYGczeU14Mfh+nNcnG7rtXAx+TyF/bU6uasZj2Zip6nPWYpglV9/ygCHZvVTz394ljI3rOaE1FSbQiGMTyaAzZMlTSENikmWnsk9GnhqwOQNus0H95JaFUjoKuqAhAfhPvc4sAp4vVulHccS6x/5nGEBckdfXEDOMNeN3R3d7sqxs9Ttdj3DJUkK0rl5LjR3TuIKEBR0+qgnLtAyRjkfP6vjohIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/WZVYzDzukQqORrB/kxHhA39a9OrbA2HJFGuFmiPIE=;
 b=Vui/Q9dEedH00ZPA96s2WBpESMgLAjHE/4ouUna4llpGmPul5Fa2D9taM4nHIfq5J6aa4Uc3XdMN+EEeSgutHP6UD7jf3eUJQ5sapma9J2F2LQfFK3VfjjNdLuzKuvVgDW5svYoUY34DmCyyRebNN7JrYE58/UYU4aejLwRqVolR05bHpyDkmNHPPBhDBB0+sSHU6CaUrXERqSG5XziVAnBs6DYUZJNXQVRMQTF0Y59nxi3iUvvJyALyJDb7YFYWpmVicQbwqvR62gH24hU4TXQKgzdgxDTrioHQ8slgYqxc2zUN4touGKPh2MvNeb8YhOsEANpLwHcHUeGkXl8DjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/WZVYzDzukQqORrB/kxHhA39a9OrbA2HJFGuFmiPIE=;
 b=rDrAmm3V8haabP8/7+V7CI1tJZP89NDohOstwVl+W/FUsOInLufMkNYSM0XdR8N3KRtywJFtFMxZo6x20O59CODcsj2tj8uEKlyDOOElBi3VU0UklRApZUbJYY46j1nRKdYgOFt9k1vrGQ+U9+TzhOdBO6iHHiTGTGLMusSKtj8s+tt1qrW1PppIgGFq1JEfCUtXxiLIynIzUnsG+Oh0RLnKSPXxBJi877/qWl55QmYvEr0PNVk8z0xu+Hj0YJlKqZO/FDHdzRtU1lpB5aqEMjR0OFaVL5mIf6HkOuXRQO7ttJlZEumsVDlBbCnMeLAMTcuiJX2IrCH9F+ic3PziJQ==
Received: from DM6PR14CA0038.namprd14.prod.outlook.com (2603:10b6:5:18f::15)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 04:44:51 +0000
Received: from DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::70) by DM6PR14CA0038.outlook.office365.com
 (2603:10b6:5:18f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23 via Frontend
 Transport; Mon, 13 Feb 2023 04:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT111.mail.protection.outlook.com (10.13.173.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24 via Frontend Transport; Mon, 13 Feb 2023 04:44:50 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 12 Feb
 2023 20:44:50 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 12 Feb
 2023 20:44:49 -0800
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Sun, 12 Feb
 2023 20:44:45 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <oder_chiou@realtek.com>,
	<broonie@kernel.org>
Subject: [PATCH v2] arm64: tegra: Audio codec support on Jetson AGX Orin
Date: Mon, 13 Feb 2023 10:14:34 +0530
Message-ID: <1676263474-13346-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT111:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d2dcbc-7b98-4e0e-4add-08db0d7d0aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uybXYJJFwgIV+MC3o4LKMg7MiJ2bQOez2ZCVx9k2YOkkuDkQQnG3c2TGHnV/ggMcQCXW8yJjGjOnOSI3juCju63zsjETzseXa9lYpPU0dlfwHDdDQDH4Bkg2fPBP84MQrUSywPSagzFt7Pc2OTonqhEXISKheaLiRl67eiMTowa2BIttvAKqb0OuB2xoqSZdzzlUNhxQPWxxPXpoSk1hQyjXfYgezegmKosJC/7JuD2S8HCXTVFB2raoU8hI1wuBYhx+LUsQ6MgMoOhI3oXJSV2kfo4DtvzzxHXq9u0jGTxFxgmwnkaF33FD+P6/36aI2Xc6qoPFL71aZCxGOJMDc77WuN3NVtaeM9RCuLeexaIp9qchOUlnBeHSdTIQ4EnRpHqukhXJ/SmXbJHRXZs1jDjITcpdE32SNJ9zwZXPax3yXLkBUn/JYkzCoX6SqcXH4ACxtCxawh3BzLRf/wjF0j0egP+rO7zoeYIhC7pU9+1Gn/wsO3aL+DDChcuwxJSDH4fMNKhw8H7Kpj4PBTf/RzQ89hGWaEb9gowPHb5dgKx+7DAT/2d6+204omrLaSHu9as/FBCJdXgNkFxR02TuV/gg8iy2rKte/NBuKVWaS8EjA1ZF6IMzWFGZZmX0kn+9sA+vkKs31GsdjS8Mmp+FGDPFNwr6QF0V/bNsq4a+dBuwoIodN6k7qheUDLZPwCo2XgqHUsLGw9bUybu7JEdVHA==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(40460700003)(2616005)(47076005)(36756003)(426003)(336012)(356005)(82310400005)(82740400003)(40480700001)(7636003)(36860700001)(8936002)(41300700001)(7416002)(5660300002)(6666004)(107886003)(2906002)(186003)(26005)(316002)(110136005)(54906003)(86362001)(7696005)(70586007)(70206006)(8676002)(4326008)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 04:44:50.8227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6d2dcbc-7b98-4e0e-4add-08db0d7d0aff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463
Message-ID-Hash: E5LGO6T4VOS6T43X5Z4K3GJ4PP2AILUL
X-Message-ID-Hash: E5LGO6T4VOS6T43X5Z4K3GJ4PP2AILUL
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5LGO6T4VOS6T43X5Z4K3GJ4PP2AILUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Jetson AGX Orin has onboard RT5640 audio codec. This patch adds the
codec device node and the bindings to I2S1 interface.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 changes in v2:
   * removed explicit 'status' property from audio codec node
   * driver change in the series got merged, so just sending v2 for DT patch.

 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 45 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 8a97478..ddc057f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/sound/rt5640.h>
 
 #include "tegra234-p3701-0000.dtsi"
 #include "tegra234-p3737-0000.dtsi"
@@ -49,7 +50,7 @@
 
 							i2s1_dap: endpoint {
 								dai-format = "i2s";
-								/* placeholder for external codec */
+								remote-endpoint = <&rt5640_ep>;
 							};
 						};
 					};
@@ -2017,6 +2018,30 @@
 			status = "okay";
 		};
 
+		i2c@31e0000 {
+			status = "okay";
+
+			audio-codec@1c {
+				compatible = "realtek,rt5640";
+				reg = <0x1c>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
+				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
+				clock-names = "mclk";
+				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
+				realtek,dmic2-data-pin = <RT5640_DMIC2_DATA_PIN_NONE>;
+				realtek,jack-detect-source = <RT5640_JD_SRC_HDA_HEADER>;
+				sound-name-prefix = "CVB-RT";
+
+				port {
+					rt5640_ep: endpoint {
+						remote-endpoint = <&i2s1_dap>;
+						mclk-fs = <256>;
+					};
+				};
+			};
+		};
+
 		pwm@32a0000 {
 			assigned-clocks = <&bpmp TEGRA234_CLK_PWM3>;
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
@@ -2293,5 +2318,23 @@
 		       <&dmic3_port>;
 
 		label = "NVIDIA Jetson AGX Orin APE";
+
+		widgets = "Microphone",	"CVB-RT MIC Jack",
+			  "Microphone",	"CVB-RT MIC",
+			  "Headphone",	"CVB-RT HP Jack",
+			  "Speaker",	"CVB-RT SPK";
+
+		routing = /* I2S1 <-> RT5640 */
+			  "CVB-RT AIF1 Playback",	"I2S1 DAP-Playback",
+			  "I2S1 DAP-Capture",		"CVB-RT AIF1 Capture",
+			  /* RT5640 codec controls */
+			  "CVB-RT HP Jack",		"CVB-RT HPOL",
+			  "CVB-RT HP Jack",		"CVB-RT HPOR",
+			  "CVB-RT IN1P",		"CVB-RT MIC Jack",
+			  "CVB-RT IN2P",		"CVB-RT MIC Jack",
+			  "CVB-RT SPK",			"CVB-RT SPOLP",
+			  "CVB-RT SPK",			"CVB-RT SPORP",
+			  "CVB-RT DMIC1",		"CVB-RT MIC",
+			  "CVB-RT DMIC2",		"CVB-RT MIC";
 	};
 };
-- 
2.7.4

