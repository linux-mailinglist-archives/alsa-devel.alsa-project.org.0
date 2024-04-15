Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F33D8A48BB
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 09:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63725E7F;
	Mon, 15 Apr 2024 09:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63725E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713165031;
	bh=poPb3YANNLZQNqlov9JPPNkqIOIv2iO21OGLCee8Uyo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l9YVE3ilbev8NDcS87RPkKEeWUlkkAmpXbhwUNVbEO745hHblvHeusLUr3R83Iwwn
	 qSuJXQeOZ/j6/cWzAcxZE7xXntnrGS0AHvArtp8IFLePSbivQJHx0vqbMES8ZteT9I
	 Z9jVWe4Kh5pdaApWDsztF2DDtUWoNy/5RBacbOss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C19CBF805BF; Mon, 15 Apr 2024 09:09:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7F7F8057D;
	Mon, 15 Apr 2024 09:09:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 825E6F80423; Mon, 15 Apr 2024 09:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBF4DF80124
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 09:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBF4DF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=GeyK8PzW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQHuKAfi8bM5kdwnZ+3ssykJIJ5C5Z89SwxAe5HNc/o3J3wlMOvnLRgrNotOkAfqk3MUdTOeIiSCUO7+1LUZLJfPbLJIEv9ztKvZAHn5k43JEt/P3lQkS/2QEjOT8OgZQ7rnBLjBTXxq122SR46yx+jqYaER3TVfcRYUIE2VsCQ4adoVzyGV+MxLrFQm8M0zQgFXf4YQCtwz86J5GaYOB9vvclg6Q9ge0migkVjdUPy+/sch/NOw59hhc217VsBo8WYmAJEWnIrAR56LKpcx8+DNlDh9CtXxu9uFsZD1drjY09pLZ0pIRkiT0kXp7y+/pMwr/qYZQTTsKU4sFwtiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6iPPRRHVuVRpclV59AFIKjAn0gAwF2jx/Th5f7kwxI=;
 b=BbuI6UFEgW0I/zfOEUa/VmdSFzMV/2KjWTl2ClxavI/j2FN1UWu8YfQlW3vLZ/VIrCXrCAGGSridkGNUFXqiAXx6kcJJ75MTyUtvijBeVcL4P8NP2cpyRNWHAOezMvqmAKpxCrvKO3ZhzXMtXVxVynZ4Gtg8ZnH+bYajrLWoSKh6EAY3uJEMydOHXG7a/ZwaT/BLD3Ftqn2oal6SfwPCcOQRmmX1qX4l32XisreWlJmvb24Nvo8jBrAFMNVa+HpYfVSb0tLdJUOYVnDz8dxVJkjAwtIej0AWCBfpoEt4CeW1FFmgw04eTuZsxwZdwxJVYrQD/9eS7/LQNB8Dhk7xrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6iPPRRHVuVRpclV59AFIKjAn0gAwF2jx/Th5f7kwxI=;
 b=GeyK8PzWfLwdkFIR/x+0CNYsjuO6OzAZxZ8Jw5Fdbcc/lob1LafDYBJ6YwFUr6krPd/HItehrbGZjl0topBkVwaFx2SDOb3ERRXwR2OUu9nUgwrLKSdcPdtj4Q+gVi6cBwYhuYdpP1sf6VXbAd7VT0+8O7oOjy1ToTmcQN5Tjo8=
Received: from SI2PR06CA0005.apcprd06.prod.outlook.com (2603:1096:4:186::12)
 by JH0PR03MB7596.apcprd03.prod.outlook.com (2603:1096:990:16::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Mon, 15 Apr
 2024 07:06:56 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::ca) by SI2PR06CA0005.outlook.office365.com
 (2603:1096:4:186::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Mon, 15 Apr 2024 07:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 15 Apr 2024 07:06:56 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 15 Apr
 2024 15:06:53 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 15 Apr
 2024 15:06:52 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 Apr 2024 15:06:52 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <edson.drosdeck@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: nau8821: Add delay control for ADC
Date: Mon, 15 Apr 2024 15:06:47 +0800
Message-ID: <20240415070649.3496487-2-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415070649.3496487-1-wtli@nuvoton.com>
References: <20240415070649.3496487-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|JH0PR03MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae6adfd-9664-404e-d327-08dc5d1aa2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wWOGbf+JYz3PbypDR6zZOzG0OXTREwm3yt78Njlortpik19e/XNBFC70G1GG?=
 =?us-ascii?Q?CrMLb/ZgriEQO3XbKyz56YhyW2hBRtF2qNCKuC2GzNW/b+6oqtjIWGsfnYym?=
 =?us-ascii?Q?MNc3CJLYkR5fO4oSHFce321Bl062tfT7ek8WrijosKLjBknkJkuPojwJcCfr?=
 =?us-ascii?Q?ScnbaFxu4Pm3HbscmuRnOBg6sGgaUD051fHgH7KaRAPw9Cv6QgDp4li8RAzS?=
 =?us-ascii?Q?2A+2glXCghsxXhGXEm3ZzzhcsoKVPH+vyADZVgG1VSavegL/tWm6CuiYLlVm?=
 =?us-ascii?Q?GcGhQTOH1kVom9sVrcos/4t/NcY1CyBI6ADX80mgEDe2xB+n2Rr+eJFK4ihc?=
 =?us-ascii?Q?7oUpi4qw9YQJa7S1ZaAYIF/Yo7p5XPHmdLtZ2ZnS/YXSrbRaGHU76hmEXSAP?=
 =?us-ascii?Q?T7kKhNu4jH1AgdyLT96XcQVQmwU1mQNXWh6fRkeHlooc58ITQmKDh+o0NSVk?=
 =?us-ascii?Q?mW+nDT49Q2JoSe21SjatYqKFUW67VOjKhgFHSjc6ReoJQ2MHmnH2CuUGjQbs?=
 =?us-ascii?Q?3AJpyBXi8/xpbgbTNf8rNAcTsyb8v0Iz7GucUCL3UTyl3spQ3FN+VEVYV6Nv?=
 =?us-ascii?Q?MrCjR1QG3yNMdSRJcVFxzB+g4d2GxglhQGw1aDnwGVBPumx3Uw9hHIAwbtZS?=
 =?us-ascii?Q?S1RXuBnXCYwEg2wLn+C8ZYylgB6+BSEVmaGlgocppTHavI8UaUHCoqDIUlq2?=
 =?us-ascii?Q?aIslreSC8kZQ1oNCVeAqvwGM+3OQ7gWNERyHOqvJYFPEQr+CrhezG8S6vSym?=
 =?us-ascii?Q?h0nXDIaVzrse6lxNaUxYTdUe2eeeA1fUFuDw/VRTa+51tNuARzi/6abS64m0?=
 =?us-ascii?Q?pxJ0sXtRCvBldhizJHFOmyWwrEeWFqHfWK2MYOzrOWu8mjZcU5qL5USkNMmH?=
 =?us-ascii?Q?f5cTUNVNVozvl2hR1YT0vyQPnbtDmjeefaPe6mjR/Za1N6R39xVBWrvmumh6?=
 =?us-ascii?Q?D0YzsiL788BRiuYc31YKDs5aE4WnFSh1YjMETaoO9DdukQEOtL8p3cwzDjs0?=
 =?us-ascii?Q?sI+uIDM54d17Hp/zTOsu6KhMMzIDEkJvRORDtRbgg7QDO/9aPyPon6GfVHAJ?=
 =?us-ascii?Q?51QdSfhKzZMbImeAtbg6lsPU0huOJc4s/8hOKyHDDq3L0WBeVqexTW2paSSR?=
 =?us-ascii?Q?WvUzawyUsEbqUZwYEewA57uT6/uSeamMeehtnqaGg96TlQfjHpSxpRwkRvlV?=
 =?us-ascii?Q?ig3OMvwXtA6I+f5Xfk783paUemomS9aFn4zowJZ/jC5s3QtotvHKJeaa0+DE?=
 =?us-ascii?Q?ahZsccHvW4gAsQuQnq3AjlC1DPXOLeU9bSOLGWOnsW7cGlB3XqP/SuDUldFI?=
 =?us-ascii?Q?NhEA1JbYeLmSjYh8uF5fo6CMMC5woiArFDCLja+mJj1betYre4wHrF9FQTz2?=
 =?us-ascii?Q?kV8QesY=3D?=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 07:06:56.3720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ae6adfd-9664-404e-d327-08dc5d1aa2f3
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7596
Message-ID-Hash: LE6TXJ2HSJFKP3DTB76WSVUWT3JJRU5P
X-Message-ID-Hash: LE6TXJ2HSJFKP3DTB76WSVUWT3JJRU5P
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LE6TXJ2HSJFKP3DTB76WSVUWT3JJRU5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the original fixed delay to the assignment from the property. It
will make it more flexible to different platforms to avoid pop noise at
the beginning of recording.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
index 054b53954ac3..9f44168efb3e 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
@@ -103,6 +103,12 @@ properties:
         just limited to the left adc for design demand.
     type: boolean
 
+  nuvoton,adc-delay-ms:
+    description: Delay (in ms) to make input path stable and avoid pop noise.
+    minimum: 125
+    maximum: 500
+    default: 125
+
   '#sound-dai-cells':
     const: 0
 
@@ -136,6 +142,7 @@ examples:
             nuvoton,jack-eject-debounce = <0>;
             nuvoton,dmic-clk-threshold = <3072000>;
             nuvoton,dmic-slew-rate = <0>;
+            nuvoton,adc-delay-ms = <125>;
             #sound-dai-cells = <0>;
         };
     };
-- 
2.25.1

