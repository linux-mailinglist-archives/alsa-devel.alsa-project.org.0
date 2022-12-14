Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1D164C1CE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:24:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E2118C5;
	Wed, 14 Dec 2022 02:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E2118C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670981072;
	bh=kA+fCb7so7ptxwYBrfIb82nvYtQmQCkuva5va+ZYo6c=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NFoLJHaUgEBKmANIiIYaPXQ7CMvSAXRzMsC+AclejaQuO3Qe6wiuwZnsjbUKgJKSr
	 v3C8EZzr+xfTq8kFrWGyOzQRGvQHx2fQeooHpj8QcSb9Xu3rX0ZrWcWAkkmSnEbG0W
	 qkvpvdBfx65AGbUoeD8tQ/m1/lzsre7wahfr8Xgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE6AAF80534;
	Wed, 14 Dec 2022 02:23:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B74F80536; Wed, 14 Dec 2022 02:23:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 107FBF804FD
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 107FBF804FD
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dXCxuHeW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7Z/O+TZ+nh6Ygq6gOGJgizXpwFfgNbJeOIPg77/TCmPfzRjoY1Tds0UF2AjIFGaS1DaGHtQRcFh+adfr3296x7uTKWSH0sHiQFRAriCXOv2tVzTV9ZGf7ka1MK9NlANz5+w6zfnNRWmtynLjwzFBsKiXCX2ljS54mOis/XWXEfdgSWx0dWDVy1wLW4l4zBgWvx6fTFFNaywLbhDofcZU0nf8xWH2NmNksnx89TSV1FJ2+fNDSWxJwL0cCcQnaEnj4XDniRXx33pjapbsda2AKAcVLHKkfsu1dfQ05IpCHewMqELI8v1cDHVLRKdnlkoFy89Ky4CTDn8dovSQOq1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEBlUUOxX9hNp14iJXeC9Nqw5/0+UEOvedNqxogPzc8=;
 b=kU8sDMzhb7fuvcGFGcR0D4/bL8TAwRw4IN+z2JAiFucoLB6PTOxmthHC7idYMABDejayuTklXUjK96PKgdjLUx53ZvuDliSbFr7JYEIM2Vw+BKEdDjbV+tegRSpxYt/maHHK6N5Ll67isk0wUYQsNE48S8/gH79kfdEA08Y/CuX9V2UiyMluI/FtqubiuMePWw7zp7vR1xjtfdBgB/kvvOg7YOigY4vFe9pTh5cypmrGwDxj2uPpve+LyJbataA87b/TAKFgEx12vQWxffrHrUqXhEteyWk5xfX4/HGwKpSdgaV+yxHZYCxF7pajJo/zyemv/KNNlIuHcdUFqXY8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEBlUUOxX9hNp14iJXeC9Nqw5/0+UEOvedNqxogPzc8=;
 b=dXCxuHeWJZHiXWD04XvRwqa+5HXJrVgrWB254iTbc9pDjjP5LuB925Jn2IgWLzXyoiU1oUV2KZBGQ7tFdqREuxvqfczorbwdVdsBaDK66n13xakoYPaGXi19v1+JpGq0+Tz4IqbyWyi9cvtxxGgldqpEpDbVKq3Uji4RS65UtnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9887.jpnprd01.prod.outlook.com (2603:1096:400:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 01:23:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:23:23 +0000
Message-ID: <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/11] ASoC: dt-bindings: ti,pcm3168a: Convert to json-schema
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:23:23 +0000
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9887:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e844013-44e9-45ca-46cf-08dadd71cb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l49eNLY8rZZarOWGbkxgue0hP741+yyZGI/RvXhSOsO3y2OcVQJu1fZXhazrF6sbDfmS7jR+CIILjSp5j5Boc56y+oUpIno1rP+4zFTD7EUvHku/vGZrER8yMqIlQ4gzrB0aZaXijHZI6OL4m6Vkv8PaQsv5I4yFV7DJHbuXiSJRi3AulTpUVFVk69kUxWGFTocYTQGOlz2Bi3mIuXADqOXBtc9ctaDpM6L6hNuD+liUfMIMYlfQmnXN0IfeAmle7wYTyCOuADBw1vytbVelVIjfsT8LFwaRrGD07g3o9C/meazZpP38DkyxR08MM4OOEP26uMoECQqNhnpjT6JCJkuAN3qTBhY03YPpWJT2ZuBlXHD1PAd1PKIoImCzOTZvoqq0BNq5LRz7XugazGsJmV3ni/Q6TvFJflLnZgYTjxRgcRO2mxHO111xb44AYK1s0bLWLiQnRvf7L9Eg5XaFBA22M/q5dinTLQJ+IwG3ceUwGMzUTMsdBQRSAr++I2vxkpS0QunqubThqdwa+KnbAOTv3BYwwX+SUzo4SGPtiQmwWII0MRuu/aXy1WVxjgm1b6Li/2OufpV+efRtRkvENwnapU3HADUOaD3HZ45ByukFEmEwZDhVCd4U3LTuQNQZevguBoGw+DGGU0PObOKjzVUCDh07TsPlqZ6Hq3qu+FV8oxZ6dBrvVtfvYBEf5hZKsf+VvSFGTAchW4OrY2hq/TOwO+wNaWy+YIzjsy8cOIa+WNsClo727xZkTBxT9ARW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(6506007)(83380400001)(41300700001)(478600001)(6486002)(966005)(2616005)(8676002)(66556008)(36756003)(4326008)(66476007)(66946007)(38350700002)(86362001)(38100700002)(2906002)(52116002)(26005)(6512007)(186003)(5660300002)(54906003)(110136005)(7416002)(316002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?59cHVyLUxXA8ttDVP9dhyPnDIoUb7P/sHC9LrJbhVodWRrjoopWzZ2IpMv3I?=
 =?us-ascii?Q?6jN4+fgE6aiSlQ6raUEhqzmfvOexL8rvoSFqyZcz9wvDE5F8/rAQbyt20zti?=
 =?us-ascii?Q?eTWbSGKHeNNAoPhfWOt0D32uT81JDFlwPzMiY4jR0uvJMxLjPP9IEI0r9Ina?=
 =?us-ascii?Q?+ezYl1F/9P4DjlaLp8x8521kWeFGdVLp/ABZbZ7wL9ciPQ3+R4uxuUNoqXhd?=
 =?us-ascii?Q?w248xjvWrEIdlwPvx0NL455tWDCqGF8hVoNgJl3yTfhp8MsHkOxhew6tYaAW?=
 =?us-ascii?Q?O8U3qyq6qhlAJs2TC74nI6N1349da2j/WirODEXx1v2DuONc6/PjuPbSvQIr?=
 =?us-ascii?Q?ojLf7WL9FugGnXqi+PGjbW1GDiLS7SzL5KOTSjrNug6NQpUQ+Lo/vFDX2rFH?=
 =?us-ascii?Q?tE9kHjYGZAv22vNDX3iAAp3t7aWdbwBqsrnGThw/EgcIZ85VNZo9JMDHy7BH?=
 =?us-ascii?Q?DWJrnmLJNlTlT6eOGzZ9XhCjN5tR3Cg0HEKlhVa33HuSkcD/8lM9Jm2z/C0W?=
 =?us-ascii?Q?eYdt1NNavr7zihkJm8lVWyuE2eRWnFy7YTBVhADhQsDk8iu537CUzr0POnrV?=
 =?us-ascii?Q?Yud1bqxnE9w0rBy9pXDa/8vZ5WJDhUOxYYwpZULolvPeAaByVed2bYfiqQYP?=
 =?us-ascii?Q?XJq9WpF6SePK6ELtC3bJR8Oe9iGKy3rvuYb0SLKxCHBusQux1+8+dMsa/1KE?=
 =?us-ascii?Q?k+alqn9AaVc0b6SbNZGMpTjCHzrXzCbzN1mL9nvIAwQSISMwZ074/5+vUafn?=
 =?us-ascii?Q?B4ARj/aeBa2xSboAz1IXD2QPsPlhuKWaRZLxTfJ7XQA5DJW66+vNIWHEbElq?=
 =?us-ascii?Q?WTxnHJ4nZPnkOzpAA62Md7YimzB6JhGOOplVvh7ogeJPIqfwffcUWGgNDvib?=
 =?us-ascii?Q?Zg3xSMD+twN+m+sZC66lL0GTtEt8KhkrmYB6ufh+VKbJqU0bvFTZsVIQhZLz?=
 =?us-ascii?Q?4E01Eda9/0UyjvYrfBe0Bj5xnQGNxxNvv3mR8fLCKk5ZBGfGhSMpM5FIuR6H?=
 =?us-ascii?Q?Nw91FOldU6hlgsHqZLx4LlKL/SKSmVYFCzQcLdtyQ/Kw4c8v6MkPCwIsvHwJ?=
 =?us-ascii?Q?3d4N89qFP1czXETCt/Xq4jye4/20eMmWd1pHHCqZU4mAdWcHDLY+ceJ0evj4?=
 =?us-ascii?Q?JTr47rNRGTrkgOYUmb1CHhIIdG8yyVudBy7Y/1FeQjZINUxSNeoxwBc6Dkpr?=
 =?us-ascii?Q?ZF3KHYZCvKAjrq8aZnkKvqe+PAMzXt8HbUZOQgbe0lSu1F4JvvLipu1z77NS?=
 =?us-ascii?Q?uBKAOCOfRkob3BT9InREGGBxjgF9JdaTdP5lilKpzTiLbrKOsqYnkn+YuaTc?=
 =?us-ascii?Q?YjWfpHtSyFw2i9Cm8EWFseF03NgRorbQD0eNFH96gVHCQzoNbjTfVLQ8L4ql?=
 =?us-ascii?Q?TaBR1VM1Avy2MF6lmYokUEYBl3VZIHnQqB8UNFQP7FbCQKYPpiaDPjxzLoJ7?=
 =?us-ascii?Q?OqVozr4YK6NBRUmhOGZWB/qDu8BlGsb/waBoolNtcxo1q8VD/ZWp8lcp8OQk?=
 =?us-ascii?Q?DVsHlz5Ru9aTlfxwv57+WflOMDiuKb4hpzbA8mbMHr8Z0vsoJO2JHtyd4GQK?=
 =?us-ascii?Q?JacaB5zdIGUm2u0cVb0DocMd2pxjQXLIHo0KhH57I8CYHxu6/4+31kAh7jLW?=
 =?us-ascii?Q?kN7Pnzq7XdH4qBu7JKq3WBw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e844013-44e9-45ca-46cf-08dadd71cb4c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:23:23.9100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjcSu9hjUOlk8InSzk/6NMe9ImYnFPZ5m86lqjvdCdHgYjBCYIBpBBwOzuMiEBbfmHblNgETC+txdcWRM81U++mHP/MM39q6rykvYMrat6jNO7nUQB0mdu0qlAg6ns0I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9887
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Geert Uytterhoeven <geert+renesas@glider.be>

Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
documentation to json-schema.

Add missing properties.
Drop unneeded pinctrl properties from example.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ----------
 .../bindings/sound/ti,pcm3168a.yaml           | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
deleted file mode 100644
index a02ecaab5183..000000000000
--- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Texas Instruments pcm3168a DT bindings
-
-This driver supports both SPI and I2C bus access for this codec
-
-Required properties:
-
-  - compatible: "ti,pcm3168a"
-
-  - clocks : Contains an entry for each entry in clock-names
-
-  - clock-names : Includes the following entries:
-	"scki"	The system clock
-
-  - VDD1-supply : Digital power supply regulator 1 (+3.3V)
-
-  - VDD2-supply : Digital power supply regulator 2 (+3.3V)
-
-  - VCCAD1-supply : ADC power supply regulator 1 (+5V)
-
-  - VCCAD2-supply : ADC power supply regulator 2 (+5V)
-
-  - VCCDA1-supply : DAC power supply regulator 1 (+5V)
-
-  - VCCDA2-supply : DAC power supply regulator 2 (+5V)
-
-For required properties on SPI/I2C, consult SPI/I2C device tree documentation
-
-Optional properties:
-
-  - reset-gpios : Optional reset gpio line connected to RST pin of the codec.
-		  The RST line is low active:
-		  RST = low: device power-down
-		  RST = high: device is enabled
-
-Examples:
-
-i2c0: i2c0@0 {
-
-	...
-
-	pcm3168a: audio-codec@44 {
-		compatible = "ti,pcm3168a";
-		reg = <0x44>;
-		reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
-		clocks = <&clk_core CLK_AUDIO>;
-		clock-names = "scki";
-		VDD1-supply = <&supply3v3>;
-		VDD2-supply = <&supply3v3>;
-		VCCAD1-supply = <&supply5v0>;
-		VCCAD2-supply = <&supply5v0>;
-		VCCDA1-supply = <&supply5v0>;
-		VCCDA2-supply = <&supply5v0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&dac_clk_pin>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
new file mode 100644
index 000000000000..cb8ce6c6baf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm3168a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PCM3168A Audio Codec
+
+maintainers:
+  - Damien Horsley <Damien.Horsley@imgtec.com>
+
+description:
+  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
+  96/192kHz sampling rate, supporting both SPI and I2C bus access.
+
+properties:
+  compatible:
+    const: ti,pcm3168a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System clock input
+
+  clock-names:
+    items:
+      - const: scki
+
+  reset-gpios:
+    items:
+      - description: |
+          GPIO line connected to the active-low RST pin of the codec.
+            RST = low: device power-down
+            RST = high: device is enabled
+
+  "#sound-dai-cells":
+    enum: [0, 1]
+
+  VDD1-supply:
+    description: Digital power supply regulator 1 (+3.3V)
+
+  VDD2-supply:
+    description: Digital power supply regulator 2 (+3.3V)
+
+  VCCAD1-supply:
+    description: ADC power supply regulator 1 (+5V)
+
+  VCCAD2-supply:
+    description: ADC power supply regulator 2 (+5V)
+
+  VCCDA1-supply:
+    description: DAC power supply regulator 1 (+5V)
+
+  VCCDA2-supply:
+    description: DAC power supply regulator 2 (+5V)
+
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/ports
+
+  port:
+    $ref: audio-graph-port.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - VDD1-supply
+  - VDD2-supply
+  - VCCAD1-supply
+  - VCCAD2-supply
+  - VCCDA1-supply
+  - VCCDA2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pcm3168a: audio-codec@44 {
+            compatible = "ti,pcm3168a";
+            reg = <0x44>;
+            reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+            clocks = <&clk_core 42>;
+            clock-names = "scki";
+            VDD1-supply = <&supply3v3>;
+            VDD2-supply = <&supply3v3>;
+            VCCAD1-supply = <&supply5v0>;
+            VCCAD2-supply = <&supply5v0>;
+            VCCDA1-supply = <&supply5v0>;
+            VCCDA2-supply = <&supply5v0>;
+        };
+    };
-- 
2.25.1

