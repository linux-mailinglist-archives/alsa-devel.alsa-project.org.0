Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 482293425F1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 20:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7572167C;
	Fri, 19 Mar 2021 20:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7572167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616181347;
	bh=XZYjb6QL+4pM8ZA9ca+Lq5CIeW+qjVc8y7Yo4tJKPLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qEfmxtST0QzNpN5WZnbOtCgosuvGFVU2JxK7pYsC66Glpbm+b0NGN8xueUJjNVI7y
	 PHLIYgMD+y9ZPwg3wJzEEBTZDvY/SUsmUfl39yQos+n2rJhMJGMfjWbuiak4aJ/N+E
	 tqMgw1cyw4Q8XhNmtztqshBc8Ql2hI5NjE6QdNPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 322A8F80124;
	Fri, 19 Mar 2021 20:14:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB18CF8023C; Fri, 19 Mar 2021 20:14:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2100.outbound.protection.outlook.com [40.92.21.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BF48F80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 20:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF48F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="LgUI1kRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFU5KON7XckPXQ/zPIoveUFE5XKWMU9nI67U479W3vH8KLm7i8TNlW+W8JsV+ZH4udJHO+3zlSoVreUNu22+muNzPiNucxFZgLJ3LvfEkSsjSjCkcfE3iEqBA1m+ehr+FDB4ryPseKrfzUoU/ZjrnEs9jVevIqSz6J3uv/ihjllDUUpdlVsAcy0eGGdhKRuLfg86/7dbinQJdL5mxpzphjUeRcQW+1E18dOuCAwYUBB4JSbgow1DAvcBNw9gLzwMLKhMywcNnm1cUDCTUDHgsWaBtEez2FOlN2o4lpicu6HdmcwomQ1xNXfppjktrjrsgd6XveSOcWX/Rv+NfFQNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF+i1am0mqGlM4sD1vKDBc5dgMNmfc7h7SdCjtsPQl0=;
 b=EZWFCRRWcHh5WQr3IbXuz4W/+ibQPUDksd/MljYYLwsuQGQny9Taw5rF4RYOGV25oZExStA+RQ0Twi4B1r/t7ujYv9rUIrdkLJk4/qyqh7MqJ17OB7kDeuOYGXGf1tFDSc4zqt/Cx3TtQAbvBYOvc3O23ODnL5JFEzki/B7+HS3hEanuvNjUPAJQ0KyYvDwoVYy7q8XnQn84DSFVuSPcuj1fn8EaTA647NX3sITTy9iuj+2aFeHoMMoKw4f4Rc1pW52W9TkhrULXeALYvPtqP6Fqh4VwyHjao38uxnAxA7jwa32HRzrSmWzR/mGSF/p49F87kWR4VlOnlCDuwBwNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF+i1am0mqGlM4sD1vKDBc5dgMNmfc7h7SdCjtsPQl0=;
 b=LgUI1kRzOHF7dubTzyMO8xI19tbH/vJqXk3tO5JVbN3g6+R9oqmx/DKf3gaiQMWJOpLRaukLooGUkPABJtxvOZPs2liO0kWMycva4K35bfQkCQQXgWGsIYFGNelIvk7dycJcQ4un17CoElX46poiJbest99GBXTjccA0U+937p6o7/JP5DJ3wxtpGe+lm77eT+yz86XGOrwVl/d71j51RaZT7+UHXtN4huseFWP7Iy3PUMNOWjuuiR4yL4Q+8gUet7XryTaymjupg5A3DsRIfgZYJd5PKSU//WZLZOK94ZbC1bY3LTglCjCsCTlPdkdLeW3sqsghR9BsAQ2vGymjZQ==
Received: from BN8NAM12FT062.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::50) by
 BN8NAM12HT152.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::438)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9; Fri, 19 Mar
 2021 19:13:58 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc66::53) by BN8NAM12FT062.mail.protection.outlook.com
 (2a01:111:e400:fc66::321) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Fri, 19 Mar 2021 19:13:58 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:578469A77F0D4F4470BFB324BF7A2416D627D4ABDB06C6A57F7F803C971CFD54;
 UpperCasedChecksum:0D9005D7321A0F95E4C525492FBC6DFEEB1CE35D420D923829973328AA91334B;
 SizeAsReceived:7531; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 19:13:58 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 3/4] dt-bindings: Add Rockchip rk817 audio CODEC support
Date: Fri, 19 Mar 2021 14:13:36 -0500
Message-ID: <SN6PR06MB5342F6C37745ECEDFBFBE978A5689@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319191337.9414-1-macromorgan@hotmail.com>
References: <20210319191337.9414-1-macromorgan@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [a8KuAtJ1LvODWzTNSnGxhtlDcN+dSRju]
X-ClientProxiedBy: SN1PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:802:20::15) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210319191337.9414-3-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN1PR12CA0044.namprd12.prod.outlook.com (2603:10b6:802:20::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 19:13:57 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d832b206-5f14-44e6-26ce-08d8eb0b255e
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?FxEr8kVTuhr9YqQ01nJa/znbAevm76fKv6GkSNc/dX4T6XfKUS8OmlGfsH7A?=
 =?us-ascii?Q?1uGskvPs+fg9+YmR79fy153AUMfetEjU5uAUNg+7p7/ojpvgWs/p+NqhyTSf?=
 =?us-ascii?Q?IvETKUFqQGd133SAu3NzRnMRbDTehhB0m7x5CApO4IYi4niTW2gB5DztEu8f?=
 =?us-ascii?Q?KAg6JdULiA8yNu2g3zAgFtS+UHUrRck4F81Z8gQxJt9fdF3DKwF3DKhWXsC6?=
 =?us-ascii?Q?iI8b0tChb18dv+dDqhOmaRSDv4hKgmNa9RmdCeWMV5vHrHAHggPeh5XCXjgi?=
 =?us-ascii?Q?9pU++TrmsuktSRLWWsEwh5m/H6+dXPHx8SzxMmvR5PG/DdAL+Gl4Bym+eLE9?=
 =?us-ascii?Q?tHheZ+WzinGYo5CV3Hh+7Ag70ktqDVzll2PqA6miEDVLj32/OHb1U0COri+C?=
 =?us-ascii?Q?+l/5+Y171iuoXvxbOfZDID0C/Uj8vuDv0+nXVCWBp/hh6ZEXfZuO6CqxuYKF?=
 =?us-ascii?Q?8AefQZu0mWVW2zWKbVA6HBFgrnnnF7EVaM6Ijm3/zRELS37VbWhVeTIyuCjq?=
 =?us-ascii?Q?ulz81YGMtoa7btCMFwxfPZ0TX2gfCkoStlUvyE600QzWMQ63hcIQ9RkzPCOt?=
 =?us-ascii?Q?PYbiC6jD+JEyaZs4V/n4WC2/h5Uj326LL6gZlBQ4kJhfuIqO/M7r1sRB9013?=
 =?us-ascii?Q?vzKarCQmhtAabx76kJeSz2u1+94tVZIyoy1Mk2/OAOeQ5kulQ+OYbkS4xqRZ?=
 =?us-ascii?Q?JifFXSlwVNqi1cKzqpRGf0qXAvqlszI6ao+oMJI6+ZaYh+OTRUk80fYB/gdg?=
 =?us-ascii?Q?4SiYnIP8R6YxQmXT36MSU5CCmE23CaI5KawpB4tnE9VQRv9HgXCG9VDJG6MR?=
 =?us-ascii?Q?CiEgj6xEqpoG6cqC5LXiM5f7qXG47Jt3ovPl4GVWaAVKfIUxaNb1DCs4JAfA?=
 =?us-ascii?Q?5xSqc3WCtNBH6wBIsyvZerL+OHWlCW0bnwsOERlEjWngxIx0y2T/U3HiYC04?=
 =?us-ascii?Q?5M+mHedr9pClvoEJMD0PApHKNl0C+Nppr1aoE93P+Scqx9v9CZb02lHtmfaR?=
 =?us-ascii?Q?HdvlROUM4ra9ZaaJWetcuEcFQAgueu3zVG4H?=
X-MS-TrafficTypeDiagnostic: BN8NAM12HT152:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xovgymdYR8JYNXOzacXz2BtSFS/MxrVJZkZMC0bjwFdzRHCIOr4h+OxMznCMZvmCZuzb5kCmMEXFsRbhTIhJcyhuUrRVtBuRoZfXkRQOEoh1K9F3OdPfQH5FC13tTy1CC6u2lcUEkkpce/glI9l6GaJomgWGgjuR0Ldt1gLbpsI5RIMYBKnbcr+ie8czAsRAVGliR03zxtqSkaZ4JYrKUpo1ObGgIkXP4nxcoXpC76oxX7ZjoPHc6lXmv7ZhnfEch+Apuk2lVrdHTjDJFws/cTvzccwgh35+TXUCX7BKZl4nusQZUhU/OsZvGsAWiTdNlRJ3dYxs0tZxE8bsAWT8j9H1pZ3WQwIzC4HNrwAovBtEoeeh2zJM6EXEXRMNmyGUZAwZSIN7jdbNost5P4ihuAuIHS0U50WzE8SMkLdyC3g=
X-MS-Exchange-AntiSpam-MessageData: TTYJ69W3pofw0QwHBF+xKPYqpkB6f/qjbtc43EIM6u8afhR0e3tlu4kQMKYKbkRg1JgzHmrMszFxmqS4PbOv1ZTh9+kpAdEUWjwTYgZiM4DTurbvN9XeAXOpcioFPAyl2MNzu1MyeP/fgxjHpHUcAw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d832b206-5f14-44e6-26ce-08d8eb0b255e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 19:13:58.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT062.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT152
Cc: broonie@kernel.org, heiko@sntech.de, pierre-louis.bossart@linux.intel.com,
 Chris Morgan <macromorgan@hotmail.com>, tiwai@suse.com
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

Create dt-binding documentation to document rk817 codec.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/sound/rockchip,rk817-codec.yaml  | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
new file mode 100644
index 000000000000..845886e2fdf4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip-rk817.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk817 audio codec
+
+description:
+  The rk817 codec is an I2C codec integrated with every Rockchip
+  rk817 PMIC MFD.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk817-codec
+
+  "#sound-dai-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: "mclk"
+
+  mic-in-differential:
+    description: the microphone is in differential mode.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+rk817: pmic@20 {
+	compatible = "rockchip,rk817";
+	reg = <0x20>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmic_int>, <&i2s_8ch_mclk>;
+	#sound-dai-cells = <0>;
+	clocks = <&cru SCLK_I2S_8CH_OUT>;
+	clock-names = "mclk";
+
+	........
+
+	rk817_codec: codec {
+			mic-in-differential;
+			status = "okay";
+	};
+
+	........
+
+};
-- 
2.25.1

