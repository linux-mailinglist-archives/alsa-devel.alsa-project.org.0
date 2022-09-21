Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB605BF590
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 06:46:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93F3F1607;
	Wed, 21 Sep 2022 06:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93F3F1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663735599;
	bh=vvNvu+MVUECt/VjfO6EeA0exOFmFC1+RDnN9fQlLb18=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QLjawba4B8OFp073olAR4z0QyWhMgUGF4gwwyq+F6U7cAGYKanRLUF0sAKZ2gsVZH
	 IJgDpGGJil28PZBukRCAwrikygubDsEEV3sYzaFE2LamSr+Pu9S5JyK/RL3+lt59I7
	 aHO6gBbQmj0sMIE1cv9qu+W0q09mdC+u3Ut4bN+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6181AF80543;
	Wed, 21 Sep 2022 06:45:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3326F8047C; Wed, 21 Sep 2022 06:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2055.outbound.protection.outlook.com [40.107.128.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11B7CF800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 06:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B7CF800C9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTIJXYBJzaxB+Q9DAfYviZzvqop08c457RVVD+0OzkMrKBd7F62SJN2m5YqVxnhQjpFNcECJ+7BVnqBQVagGOZhJa8sn+5XrGmVquPEW4aZJxZBfCt742P5s4cuXHLfYzfhmQjK+SGmqFVjz0Bqcfdnk07rSt4MDT2seVxI5M1oRLZzyUI8SNWHvJ3GXvSzbrUmVdKV9YSAlm9Y9ckER+dRiKvieFSzWhWl9DRiFol17sYmb4EvjTrrqEyZx+mQmgBPYF4fkRMnYkKJBwuQR7pV1F41NtFpSsr5nGWi30yNSKxzNcinPGZCdrEDQG65NXOChKanVz9UYUYKBZ2hrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK/OeaLs4UapkQ5/0FPcM/Merz6TacPz7mdoXdz9JdU=;
 b=FzGBF2lHrYWBVSwS/D9shGEfjdfYlqLCc26qvbfgE2xbOxDHoTXowtYR68a3SUPJQaL0tFOcg9QIkeRtBJFndtOTh/jO90QpgTi0qPDGAzsxvXfy92Cort1WkueWsyvw4pCQgxWTogIJQCtA7pKmOp0kb0blec9yaGEOKoGt4SavGBgAeWIxIQVqvQqA9M2xuIufdEoAU9Dwa96oC4paG2XbtUsIB3oA1Y+P7r9sQjdCAY9erKHcaZNbdlEzN9EPULzACIK85sLU6Bp1j1wgUnRGbbcO91gAY91T87F2gtMGJDo3scAvieYwm+Qjr+iAvyJcx5EIz3r3UbSE9M/ZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB1564.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.16; Wed, 21 Sep 2022 04:44:46 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5632.023; Wed, 21 Sep 2022
 04:44:46 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Date: Wed, 21 Sep 2022 13:44:05 +0900
Message-Id: <20220921044405.4441-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220921044405.4441-1-kiseok.jo@irondevice.com>
References: <20220921044405.4441-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:100:2d::35) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SL2P216MB1564:EE_
X-MS-Office365-Filtering-Correlation-Id: b67ec851-a43c-4d06-87e2-08da9b8c01fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgejMDETb96kczhNxTUsFuI4KPpxWvi8cQI97dgHUwEbTFlQNooh4NtDK5GhaZluZcDbTaoKxxmirlbKZQ9kapPUlIXpI7YCUT8CElQxXaqhzokDk5xURJJaGeRuPeXZN/KTjAtBYc3y2789KRh/XibIEax4qWjMUbyhULTN6tG+T0FeBh3YjkKtSzSeAsyccRqtUpyRF1JK2dxIcR/hyuaY+RaRTD14hw5aGbQp0hlU92NBHdrjaRl9mFf5NH03NAtJy9IKqcK6aYdUyLY3zWDBre1/Z3916F1omsFatO9alZ/S7R6qstq7jM8lTX51ZM+L1uTQWoBDUcggMWbD1KFyCB/gnHhXCQUDSATJs5JzyPnS5h8AjqlM2TqTiTTW9RVMcrCnpHGxCLrgVy0HQMvsDyZIMwEpmbrNsWcNvNeDKYfuMDwwggPgWQnZnPg4DWqp5fu0nhF3NkxF/wJV9GIgjC8jBNGZjY5Da50ltj2XzTX6pfz+CTy6cU8ZXdBdCN6GDa9ZrI6rTnXMx9+OXwqLNaK5VPB+VU56uPr4TVBlNlJx7/IXGVFnGlnia0xQyxATwVXHYtwqZM2hjBWTVNqJYrDefUuILBjt/5iasLR4UnuRBr3xq/Fb9tFkkLEuy09qiRVpiouNsOVT/Y3PvD0CAk5o7546VRb3lIFB8hMXqNjfeWIQVzWdepSRwA4y/tdNi1rh2fxfccHhuWJxDmiQZbjRAgH6xqO0PqZBXnKQQ+ElGa1Qoyne0NVRdhC/NUAaM+q/roInYy3eQ79uuAC1uRh+E0w1L/XMlNR0aF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(366004)(396003)(136003)(346002)(376002)(451199015)(2616005)(186003)(52116002)(2906002)(36756003)(41300700001)(1076003)(6666004)(107886003)(966005)(86362001)(44832011)(38100700002)(38350700002)(8676002)(316002)(110136005)(6506007)(6512007)(26005)(4326008)(5660300002)(8936002)(6486002)(66946007)(478600001)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tepTz4Gn4c0yEsPmhdPaXIO1gKLHVh/m9p2/ZQrpmc+9FvMCQjVp/yWclkXb?=
 =?us-ascii?Q?VLb7ObkwhnDBaURMfA3rAxeWS+CtWa2yeI6Qa1cvVU6ATlYcn+Vhr2jXY2eO?=
 =?us-ascii?Q?b1iqbm54WB4Y7P50vh8QTVm5b8siTyYUn622Xq8PwIdQr1U3kGkfudD8iQ6d?=
 =?us-ascii?Q?x4b3SMJySUL17lDhH3O6PWhFNAYW+auJS9up73BA0L6NMerJWrHO5+iC4mqp?=
 =?us-ascii?Q?HXbJIG8ypsCB9VICeX5+wzIXJUe/6l6F/mmQhzdl28zOl4odGllIT6vzpZyp?=
 =?us-ascii?Q?ZRwmqj4DwbYKD4+ak1+kEMNrLzkdvhM4tSu5VhMsu8eiEig218ZwvOHadvDu?=
 =?us-ascii?Q?2DRpmMqRw90lbBJl3vi4NmbYMjuOvJEY+bbKfpgUM3DE6s8nFLwo2dbcFYHN?=
 =?us-ascii?Q?/Beqvpi8RrsJsHvWRia24cm7gbMbuiu4gI0g7nAg40lQaqLHdg5n8M1FJ0tm?=
 =?us-ascii?Q?/e1/zkpXC9/BP6gqg2++eIG0Z6RxwPms8kOGFGH8H3nC6OrtHHhg3Ea2CA16?=
 =?us-ascii?Q?zOXneSwt1ObrIuNbearh/HeoWX4YI900pyPExc77cVppMeC7Y5ctI27kVqZ0?=
 =?us-ascii?Q?dxW/5sEVVnGRnt9hraQgxvUVo9HPmC5Mr6tzZvM6t0I2LfvJe/R/EcU1eulW?=
 =?us-ascii?Q?MJYKKvO0jWq2CawqcR5IgRKCtilRAGFWsijLweEM7V8nFtWB4lm8deb/TcTT?=
 =?us-ascii?Q?W3+aqChNdh7CLiTQusX1bGlv3fnoev3b3l53XpAk0n1cXRfGOHzg991n/C2d?=
 =?us-ascii?Q?uPDUu8hFQWSc4gLiHWqNQY7oFVTIVtqQfD4RGh1olMDyu5cvmASo23PwtyUG?=
 =?us-ascii?Q?AWKcnRtGD2xnbj+otWrNXOGBPrXNhTM7T1dPNXwPApXh14nXnfMeTlExyzhn?=
 =?us-ascii?Q?QqpcyZyfPVAfU03fBDCb/mlHL7vk3EzNo4Bi+j4HBf0u6UcY6mINTNoT7f9C?=
 =?us-ascii?Q?ydp18J3bbO9EzhNvP64jhMuVm7zlNRS7/z6fHvtpmb/WJmsPJYSok338kOPP?=
 =?us-ascii?Q?93Y9a/g/R63bqr4pg4fg6IVmfk/7aAlYX3vS+yPz5m/n/NoqhbwMJhOCdF/U?=
 =?us-ascii?Q?vaDqwfc1cn0YdDJStm2gVcKYHSy9HT0aWf9SjvHmobkRRpU6wDvtAznYefCy?=
 =?us-ascii?Q?n9NyRXtcBEu98YPfcXxxTTHZFKYyNR9Umgd0CYUGI+6+3nfvicHCQXRNGy/b?=
 =?us-ascii?Q?JhSOez3W/1f6YetdZJRutyUF6CG9o48zjyHENxdVg7YOnyANQlDmtZGN1pEa?=
 =?us-ascii?Q?eU2DeD/gYpcNzDDA5vufP8M7JYwjloEycjV6C62zccosb7eiNGM4yEx3gSPe?=
 =?us-ascii?Q?619Zg7stllxUtHFOBBkKwwgxvsTPgEeJy0N9eo4mei6KfKGECdf9kt+Y1N2J?=
 =?us-ascii?Q?DiTsmUVDyGIL74j229w8QDRmh9amtfO1FMMD6ehEjRKRpNqViFOW+1tjsyJ3?=
 =?us-ascii?Q?rKS/WrMNxk/30kTUM/wu6wARje6YtyeY8fUcyn41oF2/BS6l+w3fkZWv7EdT?=
 =?us-ascii?Q?chqJO7wDP3ZEaQClOJv0W5Y2Eqnwt/nxrr7Dnst8c12JrFp5PU4uXfr/foEC?=
 =?us-ascii?Q?kuYQXeGTS9BikVs5G+RsYegM/Iut0eBKOxPZ9Nu/?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67ec851-a43c-4d06-87e2-08da9b8c01fb
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 04:44:46.0147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1txUHKa+AUdy9dUHmuD4izJlAD4DZqU99N+QXBG4v59lCJtDucbQlpS75DY24m7vQl0VxfQtqNW7t7DXFMFI5iQ4WvmZRlQedQKqRvwavo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1564
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

