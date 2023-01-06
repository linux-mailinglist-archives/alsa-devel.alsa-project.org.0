Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2465FD6C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:17:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F186D14115;
	Fri,  6 Jan 2023 10:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F186D14115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996675;
	bh=1Qa3+2GkBbW9EfG6aEy7ULobdXNWd+HsJlqr3jL2HcY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ASgkdeBG62AuyLJick3KTc3LD5fKE2fFL2Xxcgbq7S0MM1fGFhVse0ZRWERhVOfoD
	 oUjRSJu0qz2AWVFmZ/Hmdeu00xtOINrZRDNZokINmgevC+cIBNRP1HDy4I8AnCykSJ
	 4EL/RqT1j2jIHq8U8aHIne4rb6zT70y5ELlx8W8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17B8AF80549;
	Fri,  6 Jan 2023 10:16:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F422F8053D; Fri,  6 Jan 2023 10:16:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2040.outbound.protection.outlook.com [40.107.129.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 121EFF8025A
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121EFF8025A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FS2s8quwAwPLNoxSuprpFigsF6PqTwBT9EO/QOrYUFYQmUqd1pHkCtGiUQ9dVF90mPKF+Cdp6VKV6F6ZwXCJJ4yNw2tJ1ZFCNiRGiKVayF0bzs/+gCffsoKyv2clD3Y3TnVDDaD71ZyYL+gxNLzmuSqdN2MRoFx2nrpyIaOLjnC7NUhQ1bPCg1ZSlXZA3NU2Td5aaOM5jSLhuNSU21RKU5vH3ePYUeA9B7KHeMAlnHrynvwPreG1Z7t6QyIXkf8n46/Skp7PA884gWbv8fgSLlTR0F7hfmShkcazArT1yVerC+X6FVnL7DY7B2lL5/x3mDBADNc65M8cTAPpyE6NaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYbvXoJ2XmLdIJqD74b7ZIzghKUJ3PhvxbyYUmdgF2g=;
 b=K8srrcbNYOd451rM25bzY0/ifogdums7Rg43a6Ep+gKDlmXOoQuidVGzcsmjaKNRxcWZiZO3m5K4+tYz8qGK4FBWPf3Q51mGtJchQdxUWRlxzisICvzpQr535FFKNkVOt9ZoJmF02aIZzYIEuneYLY5fgTluoZDrBZ4032MZNMzwgqtyp0+pzdlqP+9XY6BEF1PuIw9sMb5/NU5kDFPzrSu51nS1O+Qns4vJqODeNooNuV6PNJq3gsN179Hhk49D92e9EEHBt+ng9irdu4mgfZ8bVuk5Z0r6/LVZFccVQuDcGNnM0hlyy9Rxc+8WgkjXRcXM/u8On7dKwMXbsSVMTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:56 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:56 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/14] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Date: Fri,  6 Jan 2023 18:15:31 +0900
Message-Id: <20230106091543.2440-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106091543.2440-1-kiseok.jo@irondevice.com>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: adb73e3a-773e-4bca-4c80-08daefc69de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEUgHib0W8IIYDTEAmxgwY1ko4TkYjbKMyUy3vgu95TEdttDKI7dUk/PZ4Fm8ONhj4UCzd2CTwiPGZLzK2oLTb6/1TUKs1Ef3OHSx4AajVVKYUa3QSYpSRnIlrm9YQ0wa84wbeuY76Kimxxa/IJ9aq126kb3fnhlAW0sBXSy/2b9WhQr5cboJAk7w4PEB3NqXcbhaLKNz+dUwEoEAquHv31azY1flUQTQuH2G9dHVZ/haQTIhkgPisTvEuyZ1p3lGIWu/8OjXQwtZR4jE0slZyxpHfer3uGkOYNNGO/ULjg3/Sh6coLEIy4OH5kG1b65HH2tcEJ343ph96NP2r5LPUkhk4aekF/Bcq0LFIQufpuuGB0QJ04fePRvhYnKfcaGS0BqL72yh8YXdlt7z4Rh7RUEaGnDNi4f05P2f/YsP4Em531JPYwiQ7H7g3kzuNhn+TyVKHdJ+SOd4WdXwkrGMU0bpj2Qa6kGqfPIWJRsc7Ow4a5Xhx8V6AGLSbD20/xCAo5tm55Mmpa5nV/XSeFY95HsiVfRd2nRf43q6WUSjQ3doWPB0g4iU4M+W0lK4isUUMWCCiYTdkMKSQgP8yfsydh+a4j2yXG16RRPAZeqxiz50qV++ig1oLTjmi1cgMDxOb6cAIb4gikfLFIZT5y+8xEoMRn4k3wZZ06WRFUOBu7XHfzllRYdVVzqDnz20/bwrmwSzdnZdR1QS2T9IKFKlyx5loeyIxscLWFnhuMcyjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(6916009)(66476007)(66946007)(52116002)(966005)(66556008)(316002)(6486002)(478600001)(26005)(186003)(6512007)(107886003)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UXIDmOHbYGVsLNLut4Gtce6wujdPBVhMUjX0KGpFBeRjgrcgeqOC/PJJaNMD?=
 =?us-ascii?Q?J2YDMmY5sqee6YIrTCE2yb+6mSHcAMSYCF6yTR6pw2kgV5+nX/IBs+xK+TOJ?=
 =?us-ascii?Q?aw3PnHIIT7RfF3Drvhjdf+i1h3UN+8o2tCtRMll2+Xn3KbI1u+k3wAjoswm+?=
 =?us-ascii?Q?/TvPXs93+eRGEgC71F7e0rv3c6uPO8uwzMQyhHpKZrRI/wZEKKwxTtxc2cuX?=
 =?us-ascii?Q?9LTgWu904YnHp/cXo8E5R58/GLVpDZxLb7ZsNTd3KAlt3HYC6YcyYw7iEhho?=
 =?us-ascii?Q?WxZRmnSxgdnz4PSe05WoFcneydcqNjmkf9nVUmDxlkUvtGGHU0EXTQ32NX4X?=
 =?us-ascii?Q?8wdxBrfbpTU9R+tWzmijL5EXFo2kdfoB4+KRkHP7bvZHv/0I1iPGTE3wxxEf?=
 =?us-ascii?Q?xo5/i8l9Q/q1BPDuGIB/UM6Ou8dAXHr8f8DueT3ppLohXLQTklRnrlpBjK/j?=
 =?us-ascii?Q?P3iMdikzsi71r/o+S524F9c15+gUTqIc9wdh4EuyfOjidlaA4nx1CsT/UlPc?=
 =?us-ascii?Q?kSvS2YtwS6ZRF9QrmG9yeQi1lIAxohWT6I6Z26/RHDlJppE3O8vWBxGT04cF?=
 =?us-ascii?Q?95MK9DpSnskij2vaFzRQVcLvi8NmzZutqm9kXRaMi7UqPoaSs4GF7BSWcnN7?=
 =?us-ascii?Q?jXw/EJYAi7W5i8aBC+vpUWmjgVwDEHXrAEtyX5m5SZKzaRv+oUc3bxuNGuOk?=
 =?us-ascii?Q?H95TOiX/36LmWVCczQBQhOvpaMp5ZeuZ9QtvF08sueMNwbBtPAitYblIOjfz?=
 =?us-ascii?Q?gzeR2s3gr9u2qPSKrfWkJ2aCAl57h83q0CcNCo4Jwv8H5q6WkTEvcQtSnWZh?=
 =?us-ascii?Q?cwt5Z5jrKlYQ0wj8vrKMF3j7XGgIHMB0ye4XG0uBzzFIer9rm2fvRHxqtPIt?=
 =?us-ascii?Q?OMte3xSRSSIgox1z+pcLUs0UYHaJ7yZji10iv/bz04+tTbZGYoDDKYs10siH?=
 =?us-ascii?Q?KNkdbIKJVmdp7meq/ndSly25X8JlF6ho69YUcRq60DJVQnVETZ1QjK5PEnK3?=
 =?us-ascii?Q?7QwMYnI0wNvjpfHxhrF7FjOx46w7ukqBEHMlXw1Is+rZzst1ydhvNaq/I7wr?=
 =?us-ascii?Q?Sy7rZPr3SkzJiAtustzdpezP8r08fuQB8BlSKzsrhoku6EKsy0sRdAA67uzv?=
 =?us-ascii?Q?TdaB0A9IFuNwywniVl/R6N7yps+oXSg0sxCxtEulzO21fF0Nd4re5vyUgYQT?=
 =?us-ascii?Q?wUUfl1nOqkR0ArPtX8EvQF+ndMKXjwzfawAA7vixY83CvWoiYAYQ9u20Ch7h?=
 =?us-ascii?Q?27QOmI86g8BoPaM+ns3j8cBIdNVw2z73EJBplmI5AZyA5dOGsNQuYB38lEZD?=
 =?us-ascii?Q?OkIKNlHU58VKWmNP8ykTvLQL5yulNl/+OW0F/yWE3E75l6IOU422fq3MJKqX?=
 =?us-ascii?Q?DJ6kyw/3a6HBOcQOWzj5JXrdtNKg9MWX1QpfnnYxXxgxsu+v8sHiZY7ONow0?=
 =?us-ascii?Q?lu3xIdFHN550ITGyjq4T+WT7nV18os7K63uSeIC7h0FwdDRG0rAotdIfX5vu?=
 =?us-ascii?Q?WAeb6wtA4L1RdW7ndO43ME4zENZOeY+fetjQy5kjV7fXwLR0/HrSupDGB8t+?=
 =?us-ascii?Q?zwRSv4z+hQ6EwvqUXA6Y10lDFJflIE1s5GFq74yH?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb73e3a-773e-4bca-4c80-08daefc69de1
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:55.9885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyHvKKNnBrBNrzSaz4Dex5Dr3tjubO10eMmss0a3NMb/kZCkqYT9nppiaNeUZ2FwFJ8MlKO/O3PD1Yq4dmbWgzxiICxLFSB8wsWnZK9tnZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
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

Modified the schema binding and added the vendor prefixes.

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
--=20
2.30.2

