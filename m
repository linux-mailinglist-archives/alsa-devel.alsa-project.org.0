Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878505B8685
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 12:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A551899;
	Wed, 14 Sep 2022 12:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A551899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663152074;
	bh=vvNvu+MVUECt/VjfO6EeA0exOFmFC1+RDnN9fQlLb18=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TLbLeRJOifJiHFZxAKnyWSXJ8L7n1/SkIYjnz521MXTq2OvwOYIaZ1QsBHbAbNWK5
	 dilkvM//DA4JvHIKYCSn3/ZBHUihLvkaID37pZdttYdjqYHzgmT9LHjWCajLT4eTBR
	 X24PEFhB2hsyBwY1ciVV1EAYNTXs7X0JTTX8hCck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85CCFF8053B;
	Wed, 14 Sep 2022 12:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28269F804E6; Wed, 14 Sep 2022 12:39:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2044.outbound.protection.outlook.com [40.107.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FA0DF8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA0DF8008E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeeQc95ya+4YQVCl7oAL0ZZTbrSoZD4PgTeLT/vGvQpxxBe9kpGOqmZBqPxdS/TCSvU+W9TV3VJaWD6JFWQ2nfx+dURmOhMNg2YRgBtmI2kQFL0z4uNaXuwU2UiqWtAQ87s/dy7kqkR2IHjPWvJPCdCRJiXCUgomk29cVAJd88byc6Tifeu5CF+9o6xJI+U8JF37+mxksAfjetDVpjwz8Xx9aQexkptmUgrBO50Nd1MLYFoiilh73tEWynCNFzEWng24gp0akDP4UycCB6gMlsKEG0SSc+lNpQSdwUvnUUoLxOHjgJYB4wyA+th10sAGmayZqsf5kad0B0iCc1KjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK/OeaLs4UapkQ5/0FPcM/Merz6TacPz7mdoXdz9JdU=;
 b=Z5sWE1LlTK/m9FHYiR5NUMpdmW9v1etQn1/KFzLhkJ1YG/crjWbeepqfFlFvzwKYd7Vxw/p9M0/ajGYlnMe+ixctRuVYcBpumpOf6gk7OOTlBcsB8I3Xb5ksNBIE+yIIKC/F/YvfC1DFg+lrvmbgXcr0yoqTgDa+pCDhOG30bl2h9d6KnvdFEtdBtg5OdEygjWbU9UbrUcFDrGwa2RVmtgf5w+PvjpniD0oQ7oQoqekISQg8rQNwLWQXRt7cLnmbI6SkZzTqmrM5fv3ED6deocfgSBvCz44bWBRJv8FJ6HLcGUIBqEYg3g63sJppVULC1YZVCV0wkokzTxC6a0qVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB0430.KORP216.PROD.OUTLOOK.COM (2603:1096:100:d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Wed, 14 Sep 2022 10:39:21 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:39:21 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Date: Wed, 14 Sep 2022 19:38:54 +0900
Message-Id: <20220914103854.11351-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914103854.11351-1-kiseok.jo@irondevice.com>
References: <20220914103854.11351-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0177.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::19) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SLXP216MB0430:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f75c3b8-fc54-4ee9-1f10-08da963d6272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mlwhg3+lslfuAq/jVSB1OZOuaIsnzME08g12sE33h6EkggS2+P2pqTRAlJLB5RcohgzXlM48xUvHxxTkiuXF0UPl7r3I9otEscT3/woH2Z6oRFaYAf6qzVNjNOWabIwZfq6rzlDetLU9imYug45LYL7foIvAJ/TlEDxZizUVOBQGI+VonMuGnlnj1h+l47+xAx1I0VeJRoxYEqzedbPx0kZgz/wFcVJezBMR9GwdIku8PlXVGrbvGPBknNovlIoRlMH6ZW3etWVucjLhUz3WWxDr6EM3VV9uWiVRDocPlHKrV//WJmEryqR/UMaw7RiWCwBgEUxYc+zU09q334HlICM47MVnlmRgUlijecKR9s38RzfvSfl+Ca/RMaSHxoWmXD25KeYoURxayTxtVjTdW+eevck8ros44JRmTp4e7iW29lMGxh9gG0K87J6lkj3O6w/bNTpdeFe/QkLenrjj0K+rm8JqAXLYXx53opw+jF7tyb0UB7xh97u1yDRkdYjVG/H5o/AQWQHsO8ccklvzav/YFsTyhh6JYs0ujeQvjof0Qt+i2b5Vd2fg49k4rkHjFxT77PeKKQak+nU3sDunVF1sguFOTtQVSUPaisem7QzRlZwp6a9/x4eVN7KGogq8szvM49jOkVEt9GBwAp4ftd5Lws4tb+qwC4b1U6MG5gwKxL2ssZPE5f8YLWxdLC9d1h0mYLUYwrlLvePQ5epMesPjQP5g3c/tvCRQnXHYHtEZxRi/2pI3Ib9lx3ifc/RWFHCi2Lm5VjUcLvz3u/ABWqTrPw/9uQCMEhHj/BpzfYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39840400004)(396003)(376002)(346002)(451199015)(6512007)(4326008)(316002)(66946007)(2616005)(5660300002)(478600001)(38350700002)(6486002)(1076003)(38100700002)(44832011)(66556008)(6506007)(107886003)(186003)(26005)(36756003)(6666004)(66476007)(41300700001)(8936002)(110136005)(2906002)(52116002)(966005)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXQ9xPYK00Zfs260T9I3RJkr48Q7RTqbU0j09GoCynFSouUEmRv3TJs9TLUI?=
 =?us-ascii?Q?2bgDYBnw+E/TKabgcGhwcGlIr5RaK7qE19DxhiscpfA/k/zLZmN1M0Mi1AsX?=
 =?us-ascii?Q?7Ld8VEnRQ5R8H0Pg1Ff+SEgSTgX4gkmFfCrT9T2f6ZU59NClg/OKtsx2zfI/?=
 =?us-ascii?Q?MRHqax/tSiLvFQgxuEh/qj0IvTDIYCyZHXCe0/vlmHA8K64M2BA7bKMAz9OA?=
 =?us-ascii?Q?EYR4OWLNMoGrPWwUoY8KKnyWc4o5Tc+ooJy8/882h+qO6MT3HW1YZsNvGX4q?=
 =?us-ascii?Q?Q0U00Q4QUj1VnFHXxcyqpuq5X24cSLxQcyB1H0d42qT5pwGXA6iKIdjfKEaN?=
 =?us-ascii?Q?AVCP5mcgu88m1R416hu0HXp8GAeMlL2bqUZeiE1tSP2NyhPoFQ4+GZwMv6q0?=
 =?us-ascii?Q?BFI+XY0J6zQinJqCWSJdtGShdfxM/I8ymQTnA7zXy7P3tlhPOQ1I1PP5cVY1?=
 =?us-ascii?Q?XQRDnslVRJWI7ROR7Yks2mkxJKrmP2QBhWROTT/cWgp3ZbNYvgr/WyZIi/DQ?=
 =?us-ascii?Q?WyCGeHE9l8kkrWcCWvl5C9H1ZeqBJ+jwwsCe+FeNLylQ9ruGZL5rVBgPOt43?=
 =?us-ascii?Q?1fGZQSCuxHrxJuEoyXI4k5kZOSXeAnqRLwsnjZP+JUah4eepNRG6B7zPesf6?=
 =?us-ascii?Q?TVpDXog7zYzHTDU+4V5D6HHZjKPBTqhfzaeINrBtEMugR44xMyarL15p63OK?=
 =?us-ascii?Q?Vi1M4oPvGsD6IpmfK6+rM42XRhEVsjYdS3wJeN87vHhL60Dao6qqHj0LlHNW?=
 =?us-ascii?Q?/LzMXe6WGgkQFF/ngdH7CyMcFbogQp4IPgU9KHUR8IiWJAzRbKmXk1mYSQov?=
 =?us-ascii?Q?Wl5IV+5k3ZU6ELjo6TSk6JW8DI+IUw4/LuqjULx2wES7eNb3Sp777dNlymEs?=
 =?us-ascii?Q?tqIlwZxfwcMkCGDRop6sZMm90C7vqI5lBpet+v6wfXVtf8h0pt0Lrcd7b27e?=
 =?us-ascii?Q?pgAaWuanczRHXTllqQl0EmEk6IdD9CpEvL/Pc1fe/fTyW+ugD7vPzW7fcozb?=
 =?us-ascii?Q?m7OwLw2KAhxgIv03+GXsA+1s1WMBcgUqtg83MFxfnu5Ni00xnfmJwgc+52XB?=
 =?us-ascii?Q?pr+fdIeHknxJH8z91hMKmSxtfMxuvS5t1LZBiZhoUQcDxUbF4mkKzpAYF+/g?=
 =?us-ascii?Q?Awj3ztymV4Fopagi2DvURu5jwXMNohaVQSJO1xoMCRP1kBDgfzCzL4MxBG0v?=
 =?us-ascii?Q?FqqlE0Lwzw8T1DFaIPdTR/Oervz+WHw9QH+L6TVv02ulCOP2O1IBUY2idi8N?=
 =?us-ascii?Q?6bVoD66yGyhrLRZSQvdZzx+mXhe5VUKtu2t85Eobemv39/GA+nFs76Lsrk9r?=
 =?us-ascii?Q?Lhng65EiyKgSntMu7nIFLTVpp4TYRfiJw8nl6UHQYsOIUKiALQ9RDRuc2i0b?=
 =?us-ascii?Q?wSp9l54x1FPefnNR7BDyoBWWCrtQGhTAXROqM8O4bsi6z9GEBlwal94o4eEp?=
 =?us-ascii?Q?Y8bJJFViaqGjvszj8MBZuz/+WsP12rwPG7K28Lo35ADjC9TpIevKbW2UjEaa?=
 =?us-ascii?Q?bPK/gMO2DCTKxQy5zymbQnBSYHmxohl20T48YiWcZ4h0o/eW9tRh0NdgozDb?=
 =?us-ascii?Q?lheZUPJWUdhaqPMsqnDlVVr/k64MPdrsm9eC4K8x?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f75c3b8-fc54-4ee9-1f10-08da963d6272
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:39:21.8288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJGyEcRMRu7yqdjsbkuZoG+VM9Ulsnqy2QUOjnVH9N9d3WRrKVGyzP5V4ssAAezGC1jVbDX2nYpWTl0gYZsRL4qvkbIddscXHwQS26hfgno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0430
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
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

This adds the schema binding for the Iron Device SMA1303 amplifier.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml    | 40 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1=
303.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yam=
l b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
new file mode 100644
index 000000000000..8c3b85f962ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0D
+%YAML 1.2=0D
+---=0D
+$id: http://devicetree.org/schemas/sound/irondevice,sma1303.yaml#=0D
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0D
+=0D
+title: Iron Device SMA1303 Audio Amplifier=0D
+=0D
+maintainers:=0D
+  - Kiseok Jo <kiseok.jo@irondevice.com>=0D
+=0D
+description:=0D
+  SMA1303 digital class-D audio amplifier with an integrated boost convert=
er.=0D
+=0D
+allOf:=0D
+  - $ref: name-prefix.yaml#=0D
+=0D
+properties:=0D
+  compatible:=0D
+    const: irondevice,sma1303=0D
+=0D
+  reg:=0D
+    description:=0D
+      I2C address of the amplifier. See the datasheet for possible values.=
=0D
+=0D
+required:=0D
+  - compatible=0D
+  - reg=0D
+=0D
+additionalProperties: true=0D
+=0D
+examples:=0D
+  - |=0D
+    #include <dt-bindings/gpio/gpio.h>=0D
+    i2c_bus {=0D
+		sma1303_amp: sma1303@1e {=0D
+			compatible =3D "irondevice,sma1303";=0D
+			reg =3D <0x1e>;=0D
+		};=0D
+	};
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..00ade1489f62 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -621,6 +621,8 @@ patternProperties:
     description: Inverse Path
   "^iom,.*":
     description: Iomega Corporation
+  "^irondevice,.*":
+    description: Iron Device Corporation
   "^isee,.*":
     description: ISEE 2007 S.L.
   "^isil,.*":
--=20
2.30.2

