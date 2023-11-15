Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 520637DDCC8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 07:41:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C19A4E;
	Wed,  1 Nov 2023 07:40:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C19A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698820859;
	bh=X8zLZBga7hH7h3WZl64TI9myJMdSyLN1coxQFwMkREU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AHv5nb4SjSo5jtSOD+Gjs96Inz0Db49J/FeKJJkxmvYZI3eZ8CUFfCRvZfWuBEn5G
	 qgJalaIUVjmQW6cuPgqU2h1Y6rmjBgLIXEnfLRCswie2q68eCz4IZgu2ez3ERYU2Pl
	 d/97r2nZIllbT87g/+JwelV2eV3rb2UNXaO2Y+lQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF58F80537; Wed,  1 Nov 2023 07:39:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F2A6F80425;
	Wed,  1 Nov 2023 07:39:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44963F80431; Wed,  1 Nov 2023 07:39:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01hn2239.outbound.protection.outlook.com [52.100.0.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C219CF8016D
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 07:35:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C219CF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=WoEjLaV6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDN1LiiRhVrMfF3BZ85LPvHg3bbusGAm6yQbuUviQKmo8H98p875lYyn8jBYDu3sr/Iz93zezu403/puPfYVgHFGRgO5mzv52RdJgLGe1RYD/u78cIkwCCPMaxZJF3j/gAwtcaCmQf5FZNaTmsuT2sjMpvrEa51GzZOe4nGN9JjCZPrsgOq55Fc1J52RsP+gFzglXngKyO8/8YVrAtXE28KDJSEpnN18c/iH+MiZxv39XMKaeJwntq+iOmnthUv+6UUb1k3vapRF6S8Idyt33DcF45esk1PTFhUpNpfq6V/6KIqwmEISoitm13/n2Bx1IWhYfGRU3WY+vYJMuC+AsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJC37DQbAUBAsFLLjmR5HaLGx4anaYHtwuAVwlSTkmY=;
 b=I5vLifETqA7r4APum+Sq8ySbBe7WD6ACMjI+u64IntOObw6UlCjUSPyD+hpGl+ocnTVhmhGMAedotLkfhzr2Y8WTHNJ90bJMIIrRniM0K+H7f+9nR1UBUQIusX+VC/UDnqKu8dwNg9Dx4qXien0JVbHXU5IYFSx8wR3albGjSuwLjePE1/DCnVauBzr6TywVN+surkGNP4nuAVcl9hqw+r/wsR3BPZXZDzxS1g7g3+SSwb4PCo8bCw+wsOZ0ayEs/P7M3a0zstSuO0vpF8UU+0HVWYBiUCNOzAjKg7MrNaOKCK2ONYcuVk9AZkyHzq6ngXwsLah19tzEEIDPBxJ5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJC37DQbAUBAsFLLjmR5HaLGx4anaYHtwuAVwlSTkmY=;
 b=WoEjLaV6YYi2hXJTmvDfnqso0Fy7K//2Khh9NpN6h6MkWzaSd2eJJ3uUAF18WGBBM/PdokNrkLHCOYCcesf5GOhmYEhhOO3eNhhRLiB0I6n5HOEgnah2JVwWJRHsQtD/KejFjIO2HnlM6Fb2wz5byc4s3gM8ldMj0hmdlf4WtGc=
Received: from PS2PR02CA0001.apcprd02.prod.outlook.com (2603:1096:300:41::13)
 by KL1PR03MB8474.apcprd03.prod.outlook.com (2603:1096:820:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Wed, 1 Nov
 2023 06:35:33 +0000
Received: from HK3PEPF0000021B.apcprd03.prod.outlook.com
 (2603:1096:300:41:cafe::d5) by PS2PR02CA0001.outlook.office365.com
 (2603:1096:300:41::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 06:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 HK3PEPF0000021B.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 1 Nov 2023 06:35:33 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Nov
 2023 14:35:17 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 1 Nov
 2023 14:35:16 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 1 Nov 2023 14:35:16 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate
Date: Wed, 1 Nov 2023 14:35:13 +0800
Message-ID: <20231101063514.666754-2-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101063514.666754-1-wtli@nuvoton.com>
References: <20231101063514.666754-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[211.75.126.7];domain=NTHCCAS01.nuvoton.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021B:EE_|KL1PR03MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: f094038a-8c88-434b-1ff1-08dbdaa4c012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o0xfzbxCLR6sTNuQdBsw8H6Tw+lk9qg2GD4BIbzbXww9+D9uiKGzwnP+OnAkmiUHslNmJYxrrrjt4skQNIoZsnR/ueyp+/nSFs+e5JYjtou+Fa62g8uUqQJqt2bpC1de0d38JB+1/PUd55fK+kikim2za5jsggaomM6vfG5ctR/ERVOJRMadUoeoA0MeRhbQyjfukO55itYd9UftwJi3+Ew3n/24qnbfiUKbU++bslDB5HwD3Q+rQH/Va6kDNYdBoi1U8ekogiiICYFYT99uzFAEZxUC9tKSbjxUOE53XutQQT93Ql2LmClsv13mzNVtuIdcmOoBGNoppZlBuLrySm/rrElmbrlegiMmxGU+o4HOgLNARD4ev+D8sn/eSwtflKyNBgQ0CFWUh3fDtyNVGfa3Z1UUig2KelCGQtKfyz6tADKuFWTftAI7ByoJEqDqPBNVZXOnO9tbonpSuSgNLYeE8c1Ohd9WrGKB31jcWxUHxv9lMSbtqxWWu8NN4sISFmekLI1WVppsvXOiES7rFQq39LnBe8aBiXjWXAHYDshBCk0bepUzOIIXKHtQKYBorWfQkZKv8ueYiADRC/zWM4i+a1jCXF6ov+R9YO26WQBjhw2YGxkBEWKoNPc0i0y2JN6sWl6FZH0fn5wsdfwYgxS/cWF91NrCUuTldyP9PXOk4skL91OzuyaPOiBeQHZywYNaJw8yTknJ6MCCf351m8ckkNkFmzIG7V4VClljs7URWF0lXCmpGty2OnL623H1BtDfOcxt/5Gu5IDp1KU+xPCIA1cRqQRMGBerHkRPP3mz34TS2s/9L07Iz8m1iIcjqORJBB3RvTX7FfQYILWznTbwXApVzIabcMK2+WiSjtc=
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(5400799018)(186009)(64100799003)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(40480700001)(26005)(2616005)(40460700003)(36756003)(86362001)(81166007)(356005)(82740400003)(426003)(336012)(34020700004)(2906002)(5660300002)(7416002)(1076003)(478600001)(36860700001)(6666004)(47076005)(6916009)(8676002)(4326008)(8936002)(70206006)(316002)(70586007)(54906003)(41300700001)(12100799048);DIR:OUT;SFP:1501;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 06:35:33.4493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f094038a-8c88-434b-1ff1-08dbdaa4c012
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021B.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8474
Message-ID-Hash: IZNUCOPOHQ3WTYZOOXFP6T3VNJLZYHEE
X-Message-ID-Hash: IZNUCOPOHQ3WTYZOOXFP6T3VNJLZYHEE
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZNUCOPOHQ3WTYZOOXFP6T3VNJLZYHEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add input with DMIC slew rate controls

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
index 3e54abd4ca74..48c389276a15 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
@@ -89,6 +89,13 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 3072000
 
+  nuvoton,dmic-slew-rate:
+    description: The range 0 to 7 represents the speed of DMIC slew rate.
+        The lowest value 0 means the slowest rate and the highest value
+        7 means the fastest rate.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
   nuvoton,left-input-single-end:
     description: Enable left input with single-ended settings if set.
         For the headset mic application, the single-ended control is
@@ -127,6 +134,7 @@ examples:
             nuvoton,jack-insert-debounce = <7>;
             nuvoton,jack-eject-debounce = <0>;
             nuvoton,dmic-clk-threshold = <3072000>;
+            nuvoton,dmic-slew-rate= <0>;
             #sound-dai-cells = <0>;
         };
     };
-- 
2.25.1

