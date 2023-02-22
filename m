Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA369F391
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 12:41:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4D13EA4;
	Wed, 22 Feb 2023 12:41:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4D13EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677066114;
	bh=8TBDZH/6wMLqrhlL7era0XAZQ2zslsi9WKEBbl/XLt4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=okCzO89GEkWHzR/dfLVaTVBgj5zf1m3talZVrselkgfwts/RoCnm9lp4c1fT7o7r/
	 5HTHBzj4q8IR01Hv34m40FzsO2fCAOmWH4jrcAOp9yniN0Fjq4I1DyZ+gPibucCRLN
	 4G45p8RmkYBhm+ht4aSX3kaEAPX1WeLd6LlDeQEc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17166F80496;
	Wed, 22 Feb 2023 12:40:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40BC2F80266; Wed, 22 Feb 2023 12:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D6D1F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 12:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D6D1F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=LhTjORy4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIemaKe77Wsu2C+fMWQr20pmswIN+nIpOnkDBuWoTQde2b4jdEGA2eo78hmq2wVxFjitFYh67FduchFScyC9G/CdQLg747eDVVKfI76pwfPLpcM4KkjVAfXFIMVnO7fOPfcB61gMoTnS1GsHpjT/ecfeBZS2+PkUSl/ApkcuDtm8s629r7+O/s0BkKbjAQ5f4K6bNsRp7SwqVQTt6AChMZE6fvvvxeTJogdb0PR6f/VDGPhl3neIJMaPbR6e6EuWeeRlZObjj9JlU4h906RBiwC3cSPFhrmNbx7PDTGTelXLJ/+NVJ5hH6SjDMIls7amYSvMDpohlPF0ofLZOMnEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtcZAwk5EysrhwhqzECWflI0n27MoP9/dUC5dmt/jSM=;
 b=AumPljQC2HAscvpoFbr0Wd0Rwu3cJwoDoH3Vjh3iR7TL5siSwuofNYV6+9g8VzNWeOkr8MMLYWFtV6UZd3Ujyj+yOg1CyW+peRbT/IQ1pE9MJLWVAzzbXWerfKMXjXxdN2eJ1bZo8NqxkPsdeqBHeoV7jYUGDxASGbfe3e7Yd2OKwHlup3V7SNd1rm08BlGUkZcqVKXqcgOsKlU6kAEUAB7Im8V1XcyooydAbwzTip1x1/+TuL6YO/jXffr8UsH7dJKb/PtLOPIXMbFmtFYo/mDrEH+tSu2j4HagKk1p4GK+evaal41xW96l2T6BpffqagcjmVGfwZ8F19jTBjC2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtcZAwk5EysrhwhqzECWflI0n27MoP9/dUC5dmt/jSM=;
 b=LhTjORy4x5v9RG6cfR80eN6yXO4HQaz9MpvJCqxFHHB0g6MrxzeDPPUNQIV34oqDmuTRHN2TcUdHYfQ4KBUQRSjn8qRe3U3MgzJEM7eWfebJeaBVQRcq5b5H8u+DKUNn8Cg0PU9tbVlPGrHRs6ZTdeae9C9H2RdpDZ51OOJKFmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 11:40:05 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8562:affc:e0c:c610]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8562:affc:e0c:c610%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 11:40:05 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] ASoC: dt-bindings: wlf,wm8524: Convert to json-schema
Date: Wed, 22 Feb 2023 19:39:42 +0800
Message-Id: <20230222113945.3390672-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|DBBPR04MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3f02d3-9691-4f2a-fbbe-08db14c98ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w7c9aZzcVFPieFFapaKPPPxmzgVmRhAR5YUjAY3sCHucOUxX1/8JTNAyiE7WYWWJh4bH0tjwZ1Aa+L/9aLBFNfswCwWrr5cbcKT5JEcdxPpgLM/pgZKfm+3K5rWm69A1pegzt7JyORu0acniLrCDrM1v0medHUJclwk9ii7RvIYmL8O42zFK7Appj5pcYSPdb5HPYEkcSc/zwBrjzqCQ2eATICyW7/sN/r53eSxAc4btBRjtOe9QGEjViN9y7En030+2N8p8by03E7x/boHGu4YFYWMbHbLGKsmxq/oSBOhjiuokLoSCRRRKfeS/Jhikw8bL6nuno6UrmaJPv3StzyBTFTmeSaVnanBbnJL7CGoKtD+0JWMEAfVCS9w5Da1HiZ6N/E8mwaDpsKqUaNvYtLZpxSIrcgGt3J8QsauehAUDby3qN1gan0pUcnLUd6uqjNhoJK0W7NPXazhYQhBlwGa7JTjd+7mxdzP7w+rnB3TYWNK+0Y52JuD3DrsjQHV7OE/oMViZVbSl1sHaCRJ9m1ZoMtEB88aGRrYnZygFySIqQIdC4KQCijfZH8zSRSpNy333nl3YdemV5InFHNqL1Q+RNY7Zhz+QR4FZRAfClSWitCCaIDFnnnMmM2GGeHat5RO2FeXgU6IvWdfLVHPwG9wAo6Yn33PPUItHpEYhu04ufyv8tSJiQUz1hk0bRYPyPyrpMbGso/T0SryezcNhjaHXBIoA/Fh01AJ+kkzwtGQ5YHyKsmtW1/Sn/zoMkGSc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199018)(83380400001)(44832011)(36756003)(2906002)(5660300002)(7416002)(1076003)(6486002)(86362001)(6666004)(6512007)(478600001)(966005)(8936002)(41300700001)(52116002)(38350700002)(38100700002)(2616005)(26005)(186003)(921005)(6506007)(66476007)(316002)(8676002)(66556008)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p3UKDDqHnBaOEKQ/8KX+JDPJHnjRw/8tmA5Hy3XnNw5AKJ9P70/Be6ftpJzM?=
 =?us-ascii?Q?kZWUyt4IscrBfxX873ea/SMqbOd5m8UGzDZtPkefHnBiqpHjfpXXj38BUn1K?=
 =?us-ascii?Q?HvWgPixlp4eXTsJyxSWJr+LZkyPreTg+KQDP0idK8/yKu3kLB00xne3ZaE/d?=
 =?us-ascii?Q?vluKawfYErQHlqIeFGU55BvniUZd1amkax60UlsnWAyYfoFO/AS74WfHDhkf?=
 =?us-ascii?Q?dMPhzWgWasaHlZ/UG43kTJ3+3MXBw2GQIqFxPZH/YqNv/Z38+EAl3cwVzWE8?=
 =?us-ascii?Q?Jvv1KWR03JKpAw7/oGrrDl8pV+FE7Gg2Q7KzIrDntdjtzbhtpit9Py1/435D?=
 =?us-ascii?Q?8fpxlPAehhJe7v+2OIHLBJb2W36aftNmrbZSXj8LtlgMF7RcHgAivLuQtDtz?=
 =?us-ascii?Q?gKSEEqARzz4DyCzVPwg7OzLMFOIttJ/TjpbqEaIKzuQ8TL5JRf3KpQXSPChH?=
 =?us-ascii?Q?3glnvVVUPiTd/HxdVdhn2IKZp18p75FWzAcMN8TsmhRMlpvL+eYjthaEo5eq?=
 =?us-ascii?Q?fMz2/A/hLSX4ZbCWRnc/Zmjq80HEAUTy3Hms+3e2gii7+L8JJ6nqIlxGv6zm?=
 =?us-ascii?Q?rTlVInND7Y5tIZFiUeefzMWqUc69pp0219zA42wLjOY0Jb4KI40vk/buK2gm?=
 =?us-ascii?Q?8Y54phHTF2cnBr+61C6m+CLaPXYY7f01e5Fs2eW7uh3/7UfwSFiqG9Vq8vFR?=
 =?us-ascii?Q?jqV2wxS2qWP8pAFDxzSQFI33IWA6FPoVx06DJbLFMFZd1XTrn+9k4IXWuGwg?=
 =?us-ascii?Q?CKtC6leVRyDCwfeTvZZpptWZ3zqMezXk0ZI7cRqFF8t5smn8jWnZahKzIv9P?=
 =?us-ascii?Q?x9Aj/IAwqplG3yxbrYEvvLqh3+dZXbsE7YpaVWd6aZmj7Gkm1opl1cHdFvEL?=
 =?us-ascii?Q?Dnu3o8wbH4KsZPtPuYY/xvSR+7mwzjpZSpRcoSOHpu6eMUBgg1E+2vNu6Tsh?=
 =?us-ascii?Q?js7K5/tryUyNf0DZZcMWCOT9On5DmJQbI0gwKxxN+cjtYf5t0sQAa98eNyCm?=
 =?us-ascii?Q?10phGqs3K5i2UnSR16lEzwBXsj5Sv8v/iXhMLFkHO2dldOpgWDM3QMp9Ohpx?=
 =?us-ascii?Q?4l/Hm7x/qh95Ofk+1rHhQ2Rs8p7knH/FlIQe+e7pTu4hI4keNs1aZk4ouhVP?=
 =?us-ascii?Q?59ihydhvbzTgIaW0HGpJII1aIemahResF7LkfWl7WUq3m0HiGt/EcDAyb1gB?=
 =?us-ascii?Q?Kmqk72Rw+Rn9bU4AxXFf06eviMoQgcTIRzNJlyltVN9uTYaFeq0SdRlI2c9W?=
 =?us-ascii?Q?z/aMLJEJu1qca34SHmaCOyk3TN0lPKJwcACL6jMnv8eZOZmZdeuK7wz+4TiL?=
 =?us-ascii?Q?ejHZTRJxNPP5qEoac9RlUlzmrlXDl7XGCBaGOL66gEJpt370VW7ewkXnA3lw?=
 =?us-ascii?Q?Us41a6/H4YW3mSmIWaNhUV1kNvpD5aKwK2WyUttxTG1vNLLMa9ySt4Cjcuyy?=
 =?us-ascii?Q?Muoq7BrSsMDXgOi1YQ5JAorAqZibV9RTHqG6P1KZtHA3AespWjHVIUBzw0WU?=
 =?us-ascii?Q?RHtrWCo7MihpeFVSFKWqT4VcKg5nTk3sPUe3HrYnv5zqIucHQyTpqKhV1Voc?=
 =?us-ascii?Q?VlgcWhRoPon6MruZL+S1HoaKy65bw0ECcvaIX6jP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a3f02d3-9691-4f2a-fbbe-08db14c98ae7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 11:40:05.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 G+GsdpMfEp10WWEBiojEsfzxyZKITkQNpvHov0JMC1YhRau7pC/uiKaQX7InREdjLokGIB0VMuqaLLrzTEsyHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Message-ID-Hash: 7R5YZJC5SI3IJDYO7LZKVCLZ5KXVUY4L
X-Message-ID-Hash: 7R5YZJC5SI3IJDYO7LZKVCLZ5KXVUY4L
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Chancel Liu <chancel.liu@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7R5YZJC5SI3IJDYO7LZKVCLZ5KXVUY4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Wolfson WM8524 24-bit 192KHz Stereo DAC device tree
binding documentation to json-schema.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/wlf,wm8524.yaml | 37 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8524.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8524.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
new file mode 100644
index 000000000000..09c54cc7de95
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8524.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wolfson WM8524 24-bit 192KHz Stereo DAC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    const: wlf,wm8524
+
+  "#sound-dai-cells":
+    const: 0
+
+  wlf,mute-gpios:
+    maxItems: 1
+    description:
+      a GPIO spec for the MUTE pin.
+
+required:
+  - compatible
+  - wlf,mute-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    wm8524: codec {
+            compatible = "wlf,wm8524";
+            wlf,mute-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8524.txt b/Documentation/devicetree/bindings/sound/wm8524.txt
deleted file mode 100644
index f6c0c263b135..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8524.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-WM8524 audio CODEC
-
-This device does not use I2C or SPI but a simple Hardware Control Interface.
-
-Required properties:
-
-  - compatible : "wlf,wm8524"
-
-  - wlf,mute-gpios: a GPIO spec for the MUTE pin.
-
-Example:
-
-wm8524: codec {
-	compatible = "wlf,wm8524";
-	wlf,mute-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
-};
-- 
2.25.1

