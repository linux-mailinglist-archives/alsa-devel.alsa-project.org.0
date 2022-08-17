Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CDB596F15
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41F11669;
	Wed, 17 Aug 2022 15:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41F11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741666;
	bh=SELSAZIj5D6LBV5h8mvIzy3TzXLJV9/f3XbMQ/WD6VU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0LNxurALQpSVxUOkPPiaQ5HsRffVuPSURZAPpka4723FyT8JFt0umiqeCye6jVtc
	 kqcHOdCpEyPezV6PhL5wgJXxCooHCx9sALkg3YSwtc+cEEjasbeAGA8ApRm8q5leZs
	 LJjzh0otEtS6Viz/gLFGcQ68+HlJ2+DarRTz0wuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6707F80534;
	Wed, 17 Aug 2022 15:06:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CDB6F802D2; Wed, 17 Aug 2022 05:31:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2081.outbound.protection.outlook.com [40.107.128.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19171F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 05:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19171F80088
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgR2iP/qoQeaVWw8UvsKkAZbnKh0gYDjZWJMEPI7MWT3o0RiYxc3aomQ/Bga8FW3LkVIqVuu849VP46UlHtEMXdLrzPQZMBiKZuXxDXMmlBR6UJeinWie9MNNmDuSFJnl1PccBP3Z8xhda8Cr1Tt1v1lqiICW5jVA18fPg/u71XkGOvM+vyi20ZBwSnZXUEsBPu7qVaS2ywniMNUK133Cx+U6GuHh4cnzqhFnGUV4vyqbrHsbTfYNyhkUeosJEnsgfsWR5sjp1Z5GEdk0E9BK8ozwSZPfGoLDYtF/c0SxNSnJWX8HVfZNYKIkq1bmVMGFYGvKrMHrZqdAEXqX/+8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxikyX/TMkwlZnGybY5kruB6Ic6bGwEawMHsR/fB5nc=;
 b=Ix338l5lwPp648JEvPB9VOzrVWrXCtETOM9Kcd5eoS4bXp3T4t4E7TTaZjs2f1W5lMRUSZNOoPxVVmNpp5mWPkPjlEzdzQbcuRtB4DPEgEr8nltr14s0CaQ6bsqhtu+n/4YCdjfflliwvdJtTdeeRe+mwoPvc7ABMUOd+A6bG6sKuE7wXS40bp6U4VYe09KIH4l5fR/cye0ZbJEjimGYux/GrhOk8k72aOWC6A+ps76UxMWYOD7ZQwz022lJpEFgeciPhUaKxsrHbX6o7ayTubzG9mRifC/so53GIkptGLEHQ6XGWyl7r8JzYksgjiRv0uNohSOL0cugu17My/ZkPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0633.KORP216.PROD.OUTLOOK.COM (2603:1096:100:21::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Wed, 17 Aug 2022 03:31:34 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::113f:874d:449c:f9bc]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::113f:874d:449c:f9bc%6]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 03:31:34 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Date: Wed, 17 Aug 2022 12:29:38 +0900
Message-Id: <20220817032938.2659-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817032938.2659-1-kiseok.jo@irondevice.com>
References: <20220817032938.2659-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0226.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::13) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52bbf14d-d986-4aac-5e32-08da8000fbbb
X-MS-TrafficTypeDiagnostic: SL2P216MB0633:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5Y3vikZdwVkzwdKDNttzODARPE4Ny/sSQzAz323uydlJ26pAjUgb+4ZeNq0W2rFvcIgGmGb5mk+uWslm3/pQMPZEBrCscR1FNI5qpQ1OhqQuvf6frdtLCbAUlBCzP3zJEthw4vnxacRMM94Q51C4v8IijF8WI/IwjDc3cg84Im2m7UXexc7uEF6i8/U5VrHBT1L1eiGvVD58mGkOyBeUz9ZujdwFf3M595Tm2B0Gh8cnJxwJK32GnLx4d2FGL3I8kmMaBjwiQ13sv5Amd6LJ9Sotute/0OCbDwNn5YTxnt6vQHVqMi/sn5jFlxdzoDPfb+VLaHqTH3L7wQnTzErzWmDCU1+2FFgOiG4skDkKFh5S/MzX4ahqzZqa3UAuJ18UmofNdhtcMOKi4ti+/IVz8B7P7u506nJFh/8AKn321A/EAzdyUrPgARQhitOv9mXw0NdzSnDGvzkAY52UhzH6ZDDLVYhlw07jgf0S33riSzgIAcS4H8EEuaVjjzwh/R7/39N1StGgo0Mmw2HeDk7s7X72HrzLOdzGH1rvyektrCjPnjdpCAZGnFHoiLgym9HmtwS+RFYeo5lQocDk9ZrdQhQt3JVL5tCmjeEioI61gkFuxf7yhRka0XCsCE5ykpLDPs+zJu0e8PvhuiwuEi0vK9VQbR4n4+TRW+ftJ/Wu8iN3XsttdRwldlkokp5cGk6tQrjxflsTxqLww5I7yzWeZt7yIAkhp0+AaTeVDVtYt9qRSinN6r9y7Rranqupsl0Yc9Fx3R8XYHAcFTTkoP03rzWbur5U9DWQoeLnnZHaqO5gDbi85apGQ/Hcgo34lMtjdxxKP+JRQzsDAMtyP0SZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39830400003)(366004)(396003)(376002)(136003)(54906003)(4326008)(66476007)(8676002)(66946007)(966005)(8936002)(44832011)(5660300002)(41300700001)(66556008)(110136005)(6512007)(6486002)(186003)(107886003)(6506007)(2906002)(1076003)(36756003)(26005)(2616005)(52116002)(86362001)(38350700002)(478600001)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2iiSO/2j/T1TnlYm9Hv09JweEwWysF1j8Q5r5F8Kb398w4TRn/R+0DTJZRD0?=
 =?us-ascii?Q?urQH4GlJCwwxomzj6itf3igIzGhPICxqLbPzxcIF+ECO1TNEMGUYw27VplUc?=
 =?us-ascii?Q?In3cedGmJOTBYoAlJNa5BjqKvU8Qr8wpb+EarAluG6ePBXz/LjRSXhz/4cMf?=
 =?us-ascii?Q?SfVJYzFvgIYFrbA7N9Z2Me9h7sCf9yByPBdocaj65dvZTK2QXYhqHhe5XccX?=
 =?us-ascii?Q?/wzenvVgoMTLzXnYdoqEhSAtnQNUH+Yj7KX9wbqqphuRrlFw/uF+R+VIB7pZ?=
 =?us-ascii?Q?FFsBWAO2n9/hpI5J0yFK/V9osWSOu3Uu5QBftnQDb7nJ9m/g72OdjL6kTmrg?=
 =?us-ascii?Q?0BptkHLpLInib7nPfIWktoy3UJGfUvX72kwkAL8tG4RN5ngsF4L9riWb1v7/?=
 =?us-ascii?Q?r8fmoXPhTS6smhGGKIQHBzd6oo6tG5rG1Pk/+dcu1Yb62aeilz3qZ61rLkMN?=
 =?us-ascii?Q?8gPVDSlLVawNEyyu1FLHGMI/4KwF/Fii9MmFUCl71ChP4TuaXrRYIBA8e/AQ?=
 =?us-ascii?Q?byiPKq0BnO70BaXI/nJdiwA2t9LVJCWvI40AeOupdY7qRXuYlx1ylGsrS/CW?=
 =?us-ascii?Q?D8OYWLo9QfnFebt3ETRPzHWUiYIvWf5y7P03QEsnqVVmO1S9npZ9/2l18pdo?=
 =?us-ascii?Q?8mdnvXqg/M1CpbJrlt3tSjChfHX1pTXGIX1hpvP1uAy0F/DG0OjtY+XW+bde?=
 =?us-ascii?Q?+wE8meBQWzCnPCJY/88T/OIp0qgNlJoigHjXyFQX0KhzXLVIznblCFtuJstI?=
 =?us-ascii?Q?DNsxak6qGpxuG5D5frLJkrbfwvBEFxkgP/QvuobcmYW+jQnZ1vdW2mWKuMko?=
 =?us-ascii?Q?5upC2xLD1jgoA3CfiKXq7Nr7PJpAuujaTgmqAMJOPNGp3cAj3QFSgVUYneI/?=
 =?us-ascii?Q?wY1qr1DjP2KdUtbUPVJFJELv1g8ixqNUH+v/hLhd0yq3UXVabECc3SLI6B8U?=
 =?us-ascii?Q?p72x1/d+nFx799uBx3BEnedHDM+ymO35s7inkwNUNXnJBsTlutJLmkQkJLf9?=
 =?us-ascii?Q?13jtX4NWPQ+kG+kTAubkgJ6V4dVIXHxuyjDuNxwRIPxLSUZpK4TAKtKMVxE0?=
 =?us-ascii?Q?F+TEz0ELrKMUoulb0DlUNRabpGrX1ccD8qXOFj7chKWCoHGnPcK5KNkxGLrc?=
 =?us-ascii?Q?GuSZ0si5cLz4DBlQHDwVunzYN8lRtOtL5AgW1IFDO9JyupMjc/A4v/Sx22W8?=
 =?us-ascii?Q?9pzfCrghwVwWf8YnQXHe6dYWcZi9aqfgFqw1Yb/cbpLl0TSge/axeM3U2msz?=
 =?us-ascii?Q?nVAHEEU6mdjGr6Ividbx5gmWyTuIf72NFEAYZLzFl7rsugRlOMnSR4ZzCRbM?=
 =?us-ascii?Q?vOlTN8RoyTdKjTTI7YzhmdIYRPoTv99oddqxwPNSoIqPQRSlI8PpYDjxhAw5?=
 =?us-ascii?Q?h0zGBizdlITqvvBHYbraVsLhkJn3/LBLq8N6x+JXzfaBY3cj/aw9fHnYAvYb?=
 =?us-ascii?Q?jSdBwen1b+tYj4ItdxM0Q4X80FL4eMQMTaHBZ+BYMciWP/buCnYUfSPU8lek?=
 =?us-ascii?Q?7X1BUkAWpDsdnYXCjXh+xY+V7Afe2rYwDYcZf6XhcjzdP+Qe8SD3698d2A23?=
 =?us-ascii?Q?X363dguwLYpWvM7G3neGybnDraYrin+Sv7hBWszo?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bbf14d-d986-4aac-5e32-08da8000fbbb
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 03:31:33.9624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAbj/MQC4mw0GoI6EEKRqTL5we97mb5LJxNSMO6rCrdctaQ+64AayJPZfafRSsxZmv8BmZ47lWdjexMdpoi1k20h9MlN4SxP44cVCDjsX2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0633
X-Mailman-Approved-At: Wed, 17 Aug 2022 15:06:17 +0200
Cc: alsa-devel@alsa-project.org, Suk-Min Kang <sukmin.kang@irondevice.com>,
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
 .../bindings/sound/irondevice,sma1303.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1=
303.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yam=
l b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
new file mode 100644
index 000000000000..e11e74d367c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -0,0 +1,56 @@
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
+  init-vol:=0D
+    description:=0D
+      Initial speaker volume level.=0D
+      If specified, the driver will assert speaker volume value at probe t=
ime.=0D
+      If not, default hardcoded value(0x30 / 0dB) was reflected.=0D
+    $ref: "/schemas/types.yaml#/definitions/uint32"=0D
+    minimum: 0=0D
+    maximum: 255=0D
+    default: 49=0D
+=0D
+  stereo-two-chip:=0D
+    description:=0D
+      Stereo for two chip solution=0D
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
+			init-vol =3D <0x31>;=0D
+			stereo-two-chip;=0D
+		};=0D
+	};
\ No newline at end of file
--=20
2.30.2

