Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F163673365
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 09:13:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600607F03;
	Thu, 19 Jan 2023 09:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600607F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674116007;
	bh=+4g507l25VzLlf4pOhvySF9NlEJKa/y/YawPBkHIs74=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oEO+sYLC7dk3zCUIGswmyeFrxFFT0Ton0JVZmbNlv4i7wvQeM2rnVSc7wkCtipp7u
	 wwRWZw7YAD/RA5F+kUa5vz7tkOq/0T8B9q86hDQayIcEL/SJo5zRcPAAIKz6dj1JYr
	 dqV1hJF7fGAoUGP4ezFRtcG36NwlVhFvmjr5tvM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1917F8047B;
	Thu, 19 Jan 2023 09:12:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C73CAF80083; Thu, 19 Jan 2023 09:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2050.outbound.protection.outlook.com [40.107.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8098DF80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 09:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8098DF80083
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX6oeyz1CXnnlFW4eKfqpCyoDn+PB2OmeBF569LwyqN3LMnQnIgLrml58DzHe5w9DNqrkwejDeBnojXKCfpcwXNqv8du7Mb3jROiFnsXttFnsCYWkYh82fBEUKK0GnsHfRj2vTwgKV7qv0vfcGpAy/nDyPZJJSMde1KD0+yLKwHKXg8Ghe6ZicCiePe1MLHAqecINKEYz5sqG1yvpPtCtsf6RFF1NcZSY47QzleIL/PNZLcwtfc65NzBySymxxhD42mzR+rDEmWOzDPXFS3N3XaI0A6zSE93SmPBdlHJfUppzbT4BGyKLSowaaXabwRaUEWlw+lOWo1Dk/g/tgIwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8Wau7pYsociQTPuLtS2tEALmtkmjuzgbuaJ0Mls6CU=;
 b=Y/cZAu+DbvAZIjpKeYq3w6D2i6b6HZw41NkyajSpYCHyPV/9jas+uShQbS2tc76alFXbyT5YaF6L/VkgYfazSN0sgqr/385YoZP0YhpXAyoV/Tnu1nypeqhR13Y9SKQ0BlH75YHO0UvvFrTVFUDqSk/yFX0Cso8nR9yAcdTY6WiXa0YgT8LS4tAkB7WX/JiTlaeCSJZnBAbMajpcWOz+wl6itQyOA/ykClDJih44VjknjPp5P2eDtWkSzztInr7wDbB+TfgqAQPegdG4IBbNcdXZsSvwIfBgneiqjXkm7p+oX68qzzNjT8nzsfK+jD8HO/Jv15uVZnSYhhNt52RmVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0876.KORP216.PROD.OUTLOOK.COM (2603:1096:100:29::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.25; Thu, 19 Jan 2023 08:12:15 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 08:12:14 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] Modified the schema binding and added the vendor prefixes.
Date: Thu, 19 Jan 2023 08:12:00 +0000
Message-Id: <20230119081202.1456-2-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230119081202.1456-1-kiseok.jo@irondevice.com>
References: <20230119081202.1456-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0076.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2::9)
 To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SL2P216MB0876:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cff196d-aa5f-4da7-67c4-08daf9f4dfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IE4i1BJmP14hkzpsK2YZa7+A8B7CmzqTRXacF/JkiBrYnSGPm02wt+ZcOh8MZpz7sCLEGOFjOjFfnbf2Lzc+z9MPf595/ChSI2NaONzFfnTOpOta/MVpQhp7Rgwi5DsRXa0bobAs2ucQYMZTpkHT72VDEqsKnURDMZPsNcTgqs3EARigpGh5oCCx4hD3Gxxm+/+RzxMf5Nqzo6uvSUyFeluLkP3FD6HLO2ha9kAc52WvlHfFKtjcJA7wNAr023hhZLTKjwkjX7ivLbhfvLcFren4lfhy0ZJIzAwPCKEfbBJyKhBrDcVOkrIcljlaobAdqZGiAf6jArX31fvk/Xt1ecwbY468NJJnRiWqAA2nn8ZxeL6NE/MQKl/E28o8frrPMM5JcBzZ79dbxhihrxDOUnrdH6+jYKn78nCWxTjRLB1GtQW6yhYS0FZYXNkqH9jy4gxaNGZ/U/aUEYXp0CG78IYgiPYujmkdI5sxW1gh+y84ue7+C1a5UGCuHLoqrQro1C1cAuBm0sxnIGh8DP2vJLMVdp68I3JGdKnF9I1RsyOcus85fpwPNx/KD+UiRgUQM2ZnA0PqRNUSB9J/ywCNWoOAoS+w8x/d8IriaIVl2kyTqfND9H/FAvmLjW/Pf/dbMwgBfIuqYw3M1egJ7Fy8q32A3gqBjw6fU7wpyScQt26dodMj5yiJlQ/NTIgogGTG7Lb1Qk3wf8sZBUlwGPb8anii/eFDIyFW79N4DZTB7N0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(396003)(39830400003)(376002)(451199015)(86362001)(44832011)(41300700001)(5660300002)(8936002)(38350700002)(36756003)(38100700002)(6486002)(966005)(478600001)(52116002)(6506007)(26005)(186003)(6512007)(6666004)(107886003)(8676002)(6916009)(316002)(4326008)(66556008)(66946007)(66476007)(2616005)(1076003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cc29zyN1rLApnQYMRhxOa7cC7dusdUVqjCLAq37acOZW0Ep59xljGkTqZzZl?=
 =?us-ascii?Q?LVaotw1Hhx6VH65pw2s7cupICOfc0qJTWLyU2yw1T0GJN5/v0EsAIrc0trlH?=
 =?us-ascii?Q?Ohft6DDfH4ya0Oy9JFFy+KeiBHX08zewQ+pAi7XqH8feHop5y1K5rRlqL2+L?=
 =?us-ascii?Q?QyYHTh+GilxbyNelYHNowEq4sNaiV1tKpppa4p0PN6xmc+P6Lg/B2f0gzKDv?=
 =?us-ascii?Q?yDHGzefvTke4yzbFninS0+Ftdv4UThp4C8/cpkmK8R2dySrHSp/erX4eT4Uk?=
 =?us-ascii?Q?pj5sbJDECycFVVODBWUy8xYfjMNHSUX/z9HAon4NzxW3BPZCDe+iSJfXPptU?=
 =?us-ascii?Q?6JTwxn2TSjsABFbKX9x3onrhGIawbD/2wx+7eMRWLC0LjEk6f8KJ4CYYPrub?=
 =?us-ascii?Q?LKeIb3Cw0yTexnF0O52B5LV5kkSamIS8VBD05vzwqKf/YlyDH0P6XsMqfcQP?=
 =?us-ascii?Q?8OSme4jdYJ6ae2RSxFbP7vKBOjAEI3PtQwiDE4jeLp8YmIJOqf6fu+tm76mc?=
 =?us-ascii?Q?SKGLEUugaqZQMTcVgnHCQAzhV4EDzoZ61TGBaZlkCEJJJnOUL6fVy/7JokkH?=
 =?us-ascii?Q?2cgmNBU5w7Qv7+C7jhj5VlkTEYYggecXP6wj1NaNQZj6jBujDgQWNO2wvO6r?=
 =?us-ascii?Q?fyMXIXGmBzZNwApIEc0zTJcE7qR6n55GCJu2fDxoybkZaNXncevNYS3yrE/J?=
 =?us-ascii?Q?cB1A2zCjmzSHzPcqxv4vg6NIFCcUJlOeNuChCQ3JVH8ESGzkbU5MjjAFstgh?=
 =?us-ascii?Q?UBZ/lEXcoIZTwoXxOSscOMHvouozik0uEkgEB8auuSLU0hzo6SkNW48SfVZS?=
 =?us-ascii?Q?n1rJ257FSmXdSxqChmd/PKri/N7moW/ELUVrFaWLWbCY4goBF2LQ7nobZtsi?=
 =?us-ascii?Q?A7hHOW0yCyTZmDvvDmmYpyLLeUobs1tPLRr4+wInsLUlTQJSDdoFDoRQcNA4?=
 =?us-ascii?Q?RgXdCDs2JHQ2LhiEiJVHal4bYC7TVbj2nZCvCmcSMsUeW1xSmBentPZzKdbO?=
 =?us-ascii?Q?7BojwNUisoYQfMo/bu7Fu4Srrme3cpEn/RBT41J3sDT3k0hJrlgIsqPxq6Y4?=
 =?us-ascii?Q?UK2w80jGbgC9HARIBcurOmuuVap6owV2z1ry/SNXsjsV+pWo6OgYwuIGzlFq?=
 =?us-ascii?Q?S+uiuVmn0yw+fs1zWgQxGxiv0FVjNN4EWklvsAtK4bN47uWfU3TP6FQoatYH?=
 =?us-ascii?Q?AUXaXQRN5myY/W7yCSFQnwu4azdH1FF95bh1nj9SPtEUOvIsNArCmWt0wwKH?=
 =?us-ascii?Q?X/46Is2LXVNkTdNtLgw7ssOiV3qUsEum1iOVFuI+vfXhiwBlyQRKo5ZoT9MW?=
 =?us-ascii?Q?1Q6rc4lyGK3lQbGPABxL9sGDEK3r2XbQKdHKq5G+VX4IUpaP6DQwbNg3I7C4?=
 =?us-ascii?Q?2RrRMZZrBbRNhuZSateaycQ11ad51tDilqzFtAXWotaaFEXCqEE6tUtmvz1f?=
 =?us-ascii?Q?RX/285LvKwfue+WpfRgeV2ZpPrn0qrsi9Ju70yFUholpGs2HhDHqub9HG0gY?=
 =?us-ascii?Q?gqdsS82xyoBt2JBn6Yn+woMefTWzxUa2045YLEWl/7r5BkxxH5vNsnPr37pH?=
 =?us-ascii?Q?IyMvO33Tu+qwe5svudFnRy5vYbqqc+HOV9LM5FZC?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cff196d-aa5f-4da7-67c4-08daf9f4dfb2
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 08:12:14.9037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4Qyy+XnrY2gHA5sxVwpdX09IAXSR4zSj+x9cB0EL3OsFBJ4gAFpP94BN3B+FTEejOuPz9whHAjgOrNuvL9Qw/d+axxqbDrNJ3A5Q4C1qWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0876
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
 KiseokJo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: KiseokJo <kiseok.jo@irondevice.com>

Signed-off-by: KiseokJo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml    | 32 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
new file mode 100644
index 000000000000..a7c1ed14accc
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

