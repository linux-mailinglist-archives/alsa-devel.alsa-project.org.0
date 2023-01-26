Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C667C29F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 03:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 554C6200;
	Thu, 26 Jan 2023 03:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 554C6200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674698626;
	bh=1nYozB/bT5HZeGFCTWfmGe0qXo0NRutQoEfTk7bx0CM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g/UCp8G9hufqDIDDPb4pUmkA7SBA3Q277UovyJMS5MfroQXx/0oqzFoR7LN6zbUS8
	 Dzkk94/GzFAYvH6EmZvlBOFWR1Xd9HbcHU5Du6MFictfo78e6Yti5+T2ra8terATm9
	 hVuecyNH5ETnX1IGGY1Gi2V9k9anzfbR3zHQxvME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7C6F80163;
	Thu, 26 Jan 2023 03:02:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46E44F80163; Thu, 26 Jan 2023 03:02:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2045.outbound.protection.outlook.com [40.107.255.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C2EEF80163
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 03:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C2EEF80163
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGBtVLCJtCIKhyeH7TqIB5LW3qHM98a1bW8nns8mGS18HYWowrByyK26G6peyqB//2N0u2q4bohz4NRkp3ncEY5u7uGYp20i2hVk34rdZIV8vokFxyNKdrqVnTj7c/P7tlq5hWNDrLh6H+EgRhD7SFeUofh/cwBZrTwFV3sQw9nOq4guEAmztV3P6Bl8qAUgFFcDRUfo8jIMoCe6gv13MXatHNqGFWReZY54IZ9kH1BswbC1pvk5bBFhvIGp4pLEQA4G55SFFUgBTb7ZrcHnRLdTNStaIoN5tV3CGW3/lOSOTk6TwpylkwJurzjGHpxZ6jWEPaJmloj7S7OaDiI8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJN2T7EKn3V39p4UHJd5aGRcJuFs9LUF/X5I6qGxj3g=;
 b=E6XZjULek96eGjBD4rkjQ4DVJGCqtCqNb6JcRFjlG5t7+GFfzsavW6Mz+IOE9/RY0QosqsfpYk1UZtpnDpXJFSaNQdbbZwkqacWnJ8UpURKZZnoEEN9pkUCZe1rNRCH9HJSq/8JKRMmot7dd7YBwHzYSTwOsNz5YERCrpCBqW7l3TKB5ORtlCU6uQmVsYVNF2FptouaXILtgfTJGOzltkZSmsQ1QbY9Hvb4X/Bs3M86AYaLgLeXeakgyScD7eBnsPGtjMreUJYnrOyf++3z/7VY55/vuw8aAjGxBf8B8+DB4aXS0OC9Z+9VfvVozIyCtpBpfUDqhxBYk+J6eKiMf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1256.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a8::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22; Thu, 26 Jan 2023 02:02:33 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 02:02:33 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 2/2] Modified the schema binding and added the vendor
 prefixes.
Date: Thu, 26 Jan 2023 02:01:56 +0000
Message-Id: <20230126020156.3252-4-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230126020156.3252-3-kiseok.jo@irondevice.com>
References: <20230126020156.3252-3-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:100:55::18) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1256:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c7f7ba-353c-42e8-a09f-08daff416320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+vMvDd8G1Ny8IfHuWs89HLYq32ryhgrt0mLJg5T8Oc0U6LPdCiixFbwsmQebdEbMjr4dFuUlj9SBFZhwpnOM1rCuxSqwBeVnY6jB3GV9WjPK4jLLkx5T7XQLguZdKH8Ppd3/kJUl8i9kxgpSeJrF29w4riBANgb8csO/wwxr0I4ZGKj4TmS2iioLcNEmWR+m2XD58IbsUvxIcdPRn4Ik5w7bGAl7nhDmAgF2M32Cn72hHrCNxARqK/wKvKu3+V36sBgaEXj2ac24IIesRka+SQDCcrO0lDO3uUfRZDfkbuMTlK2TUOm1OXuxqzGXL2/lQqMV79U2wa0TGkDX6da/ADO2wodqrTrfr2+4f61IBeBFdg4ods+hxjNt4+jbX3G9DmAVq36Occ84BC5772feN4OkHmnwMgRMZvS/ZnqPPJ2+gyzBNMtBIWhEyQIwXq2uvyzY69s5/05MKuB4G0N0ZyGHSjuAXIY99mpqNjDwEgTt/8BOPIbW42OUjTCvwzEJyRhppS5JmS/La/lscWkE1xhfp32tT41Sa4mi2nSAPbJbg9jUkOZUHDn6UGELPUAz9h3oV8H405pNC2icPG6uusICfbpqF2TPayhV4t9f3QNphkpRzzkN2RKojQKELmZ4RICwMtS2qc/JjgZeCrurK+EiTQnGbR3fPWsIHb/UQRxF5atJCHkGw8mZYqMF/g3pxNm87ReaUZYzQSquzZCBcz1Fll9c9z429dJZMIY4/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39840400004)(376002)(346002)(136003)(366004)(451199018)(38350700002)(86362001)(36756003)(38100700002)(5660300002)(44832011)(41300700001)(4326008)(66556008)(6916009)(66946007)(8676002)(66476007)(316002)(8936002)(2906002)(2616005)(6512007)(26005)(186003)(478600001)(6486002)(52116002)(966005)(6506007)(1076003)(6666004)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vU/mHZnA3e/UIMtbHPbaNTtdTiCySS19mfN0saq82XA0J1ruO4RTjheOdNmv?=
 =?us-ascii?Q?CaRslx0uZrZ1N0aHarrpUdgq4k4O+TDP+aS6mi3Owe+r7KFLBsb5mxLYPW3d?=
 =?us-ascii?Q?UQOTWS7g6MJORtijEt28slR6y1nZlWYhwWYdhEqcV9+cM6dPo0L2J216z3aF?=
 =?us-ascii?Q?szUzRdZGFHeA3MXtBdv8i3y52HkV0UAR2b5mOEuqHIi5+eJ049HMUxnOpEtl?=
 =?us-ascii?Q?HeK4Q0+ATf93jYJse9ah7Wrx5UC+7PPG37jeaPldhS+vVXVi6Rx2rDUtiDV7?=
 =?us-ascii?Q?EJvQ75REYZ2wQd/I9J9mqHAkK6RP83KmTOq9J70GpCbxg7AadkebPfvTs3Xq?=
 =?us-ascii?Q?+EafGkh5o0ccBj75jBQYZcc8znYY2P11GpQ2w0UiJqcLzfF7lMWyLqsg+kx0?=
 =?us-ascii?Q?38I5tnt99wBobznm8O+1/yLJh1EwrDDOuAWUEVUcB8saz7yzEH7bcxZiXTVw?=
 =?us-ascii?Q?z0XVYm140DwLI6+k3JR93H5H6AUOdCMJAhAhG2ydQ5RH7lprHh+fZb5lnwv3?=
 =?us-ascii?Q?lfVANpUMPE3xPzTNBULIIpLO8I7sEXTv6yW40vwHSodch0SxzJ6fuGCpBBd5?=
 =?us-ascii?Q?lEPzseGpji/ackH19mUrRmA5rSzmyeem0+DdIbJ8sx5wLrhr9jXwnK4UOraw?=
 =?us-ascii?Q?Yzr4tFUWkrQPuTtSXZ0hCgmxefKEjHENScdk2XqDUKhdQx0of1gyZ6QR7qpn?=
 =?us-ascii?Q?Ym0KrMIDjROFnyH/F5CxL1urvkqTM5K/+LX+CCnM8gDqfeIAtvziCbffONL6?=
 =?us-ascii?Q?F4pBtq6Fmfk0zaRCtfrW2CJR/SUirO03twjmzcoSYIOZtl6DgGYbcjg7zOlJ?=
 =?us-ascii?Q?/bkEgqu1MzkYfLuAfCklA+N/ziUq+nBUOFUIOUSDCwSiMvKQg1oVyhTG9RV1?=
 =?us-ascii?Q?0/qTGRFf7vDtrV0OhOvSePlPIpD7eBlfFBvz814OkNH+m9r+61gUXnuJkIsu?=
 =?us-ascii?Q?V37ybNQAgNTG+AWZLodx77m+iLpia9INL+gbmAIs7/epagtxmXG//ZiS17Pi?=
 =?us-ascii?Q?h41KUYsNzX6oiesXiGTZ1R5+ZwTQqxow/n/cSGxVTjiFUQLGMyi3fiKG/0E6?=
 =?us-ascii?Q?mirmfIec47aGtu5JlpvyllydyRRXVquusVIGrs4U3YqkQlXzMnsMXE/MRslp?=
 =?us-ascii?Q?ukokCH2ej27bQgz7PE1atOQInL/uvMUtOku5lPU4LMrLPazcxLw4qd6gliJf?=
 =?us-ascii?Q?hDmTI1WcSneM3Zf+CNWVEfWFDgzZOSn9LL1q9AOLTbyCyfCI/1dcGMMhnPLW?=
 =?us-ascii?Q?JmbHbPM1AoT3G/hOHN6x55TMmGlPerbDcvRBPxr/wp4hhnopP3xVpHyn7qoV?=
 =?us-ascii?Q?ADFx+V+KioNgPgsC+fAlcqITCNil/jjtVekGfd0lwO8OtKb2Bl9Q94t1Y+SN?=
 =?us-ascii?Q?oeYEBCEc2Db06YlfDZLV+3VMGI7ZJ9h9sNz2zc0OiD4xX9vo4ktNgyaOz6lM?=
 =?us-ascii?Q?gOQogD+bWW9rWaA+V4/uR4DAWKKyzeMxU1yXwiAdGegDSgswIpeRO/kdLkDx?=
 =?us-ascii?Q?v2IRsRVZXpWlv772SMV9eS3VMFtFYXB6LEjIGt6KT+yc547JVKNzOsZVq2lS?=
 =?us-ascii?Q?/5y4cxqtM84vlwfRQeEhkj7wYJP4hi7vYIYdZUUFng6N3lJ5+7W6LccAlM/s?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c7f7ba-353c-42e8-a09f-08daff416320
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:02:33.0511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gadEQU9r36COnRFgvuOMFjxnhzHHdOGHs1+C/wKz3u6TjXjHIdAhRizMd/ikpGCxNIIv/eImnLec0CwRWy5kSmUQUyxiBxK+7evZsYq904=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1256
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml    | 32 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
new file mode 100644
index 000000000000..eb87374cc812
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/irondevice,sma1303.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Iron Device SMA1303 Audio Amplifier
+
+maintainers:
+  - Kiseok Jo <kiseok.jo@irondevice.com>
+
+description:
+  SMA1303 digital class-D audio amplifier with an integrated boost converter.
+
+allOf:
+  - $ref: name-prefix.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c_bus {
+		sma1303_amp: sma1303@1e {
+			compatible = "irondevice,sma1303";
+			reg = <0x1e>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..271ff119764a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -635,6 +635,8 @@ patternProperties:
     description: Inverse Path
   "^iom,.*":
     description: Iomega Corporation
+  "^irondevice,.*":
+    description: Iron Device Corporation
   "^isee,.*":
     description: ISEE 2007 S.L.
   "^isil,.*":
-- 
2.20.1

