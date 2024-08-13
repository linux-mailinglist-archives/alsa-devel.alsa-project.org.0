Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DE94FC11
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 05:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A9D218D;
	Tue, 13 Aug 2024 05:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A9D218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723518260;
	bh=kpnHCLVDXgSBOvxyt0dmKJpnUwZCJsXiuXvuy47Tvyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pygm0ys6uVD+PrfKBcgzyAMm+0cXpuLRiRisx1UbH0Ya9vSWHBGQb645ATlWyvcsK
	 FedyjL/iqqJljRhE4yi5Jz/wfgz7aMv1zXtmk972sa3lVKoZ5ENNMim/N7SzAxlBla
	 tG7IkXfZIR+bUv+4Nv8x3YfisPXePa60eh+L3q34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5792F805AF; Tue, 13 Aug 2024 05:03:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A8AAF805AB;
	Tue, 13 Aug 2024 05:03:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E51C8F8016E; Tue, 13 Aug 2024 04:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39BAEF8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 04:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39BAEF8016E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHAQ7KN+nUb4RyISGhtn7DQahTlM1vcOqJonk1VyLG4ivu+wPE9+T3IPMpvZruzCW3DQ/uOmya+2/ODo4n8d5vw0mvPJzZqyGN1yPfJVqo7aQFlx0rEvF10xtofZvRHJ54AQrl4k2iAMfMTirac7m0RwWnRoW7bNwOO7bLWx6QloEdzo2UCD//TcAmkUlYF7GIkRRG2UijlhDwF1a1XEfJi76DS4EIFnAE2KJEY6SQc85TB/XXunIZioI/XKObiEx+J5RJehI4jDhIGFI7ZxFbud+wa6WKd25KH0dBrFtWooAb6O+VS2wwTYK4PBrkt7PYg5VXXBIkUvEBH8l/CmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIPSJ/KZEZ8ezSvpT0mU1+BRBMRuKo1R9DcvH8kp7UU=;
 b=ONR09zctwaU1KUA1CTTt39MvTf33GjVDheV2XtdPj0vAeXL44Qu7y4fW3RlrJhCvbj+/aUqJ3pg9EukfO36e5PChcEjt0ywX5qQq/RynhiXrtTFi+RdbfrnsC/kA1Qf0RkuCZLRnNRkZzvKbAkpGOF+PCrFrVuZUEVjVx3XiZGfNAIbasfifmdY+evJ0Lu3U/vbf1iY9s7QdLq0LD1VpFuoshASTObWgsV0w5jVkQrwTKINTee4UFhYG/Y5exFFRewr5mSKoHW0p6eKl4s9bAUHZonP5B3Dn3Q6JqsgM0W++pC7iCc3tGNk0x6VfX10aYK1Ewt+qVus4OcoiXKSCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE1P216MB2218.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 02:54:50 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 02:54:50 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: sma1307: Add bindings for Iron Device SMA1307
 amplifier
Date: Tue, 13 Aug 2024 11:54:36 +0900
Message-Id: <20240813025436.52410-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813025436.52410-1-kiseok.jo@irondevice.com>
References: <20240813025436.52410-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::14) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|SE1P216MB2218:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a22444-4db7-4db0-7deb-08dcbb434caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xtS+SV6ZemCLJQn9+y6VkdqeN/97KraLTw9eFlky3Xh4fR9/sqSvc8O1tZCo?=
 =?us-ascii?Q?XcouvZvWd/AR8FwCjfdWIjnxxdJbDNFHcoarWiUuncRAVFj2KF/g3ks7KMYW?=
 =?us-ascii?Q?QcnBerjJ9uaskTCmVvZaU4P06rPG2Uku5vAyWF9RRZQBe09lTYHqWOVTiUOb?=
 =?us-ascii?Q?sBhDnn+/0cBqS2OdMWDTIlHbd9G89OVVvojwe0+Y+mmsAsIR+cMbdM+FhW3f?=
 =?us-ascii?Q?CSH1IY7f1EElflK2U5x56WSi5PU8Tvgf4azRi/vHoF+YdoXkJ8uDSisWM1/k?=
 =?us-ascii?Q?rYnuXHVqIk1OOAhYv0CCs6esIU6+kGmS33btGLX+qYzHc93PZzE3wO9tslEC?=
 =?us-ascii?Q?mVeG0PKDLru7jpBe93CqQUVRo5/C14B4UwalnW7ijLimC0z4d6wmr9ZKh3PN?=
 =?us-ascii?Q?yUcNusKRRSjseXYN79Na/06w5JdT7FwMAsPcOip6p1TG/HVHu1gq7u92cfmv?=
 =?us-ascii?Q?AXj6XdXyws1EeHwU4M45V88QxYOeNzwd+bcIIStDbGi7De8rRP8D39N+doxR?=
 =?us-ascii?Q?T+Qdepn6zoA5P7uCrJ4BaJ+M2CoXKEsrmb7Oenc64edHv620hkjHGQOez9Ua?=
 =?us-ascii?Q?G7/i0wYBICdd2PpQf6h3dma1WGZSrOuzGq6mq4OtgI9iAcGzJIufQ4BYzOGN?=
 =?us-ascii?Q?gWLtfx0a4ncfGavKJwDzfvMbvA6TAKQxNNJgdrKQ7iU2yn6b2Fu5uBu6lUhL?=
 =?us-ascii?Q?gy256BW7DSF8yeSnTjJoAi1QsAtfQTLBeaUY+hRPVTDqIt3EmpsE8KvWntrv?=
 =?us-ascii?Q?eGhsZ222rAg8SSrRQnxODPzJ4uzrBbl8AAchnuUREZo2S0PNcp2aPtKH2QS1?=
 =?us-ascii?Q?uG6UanzO0+Ufcw3dWbDKG5NwVB3pQRxRXKAbvewqajBnNd9huf7aWzUGxCDj?=
 =?us-ascii?Q?Cw2OHT0PZAqbJLTYog3me23Arw57vTsVGCQGUrSXOVLvCUKPqhaWF9UVd9Ux?=
 =?us-ascii?Q?VV8lDPuI9gtgVVEPMEhweupfGFI8p8vCRxEj15fUrUV3airSNs04XeLg3e8y?=
 =?us-ascii?Q?TzY6TlBcU3a29W7JpzgWbRCCb0BBG3UA6H2VHtcrKknfAa9JEipV2m+KXoMe?=
 =?us-ascii?Q?6z416j3mTsFRMYdQHOmF+jdLIAK3hRNrs8Fs5/NPDV8yPv4WLZOuuQZjYLWu?=
 =?us-ascii?Q?+3+2KfozydqYDfBqo5UrRjwaz2zfI5a4K1RTQEM8oXNK1oKOGJFEiMYeVgk6?=
 =?us-ascii?Q?AR3C7/c3SOKqUvOH6KIBpL1O4pCQRdDMOE9r6gxz4tOSTSD7Z7TNJ7mRQNUl?=
 =?us-ascii?Q?OXxSkQpANvSFQMGUwZSvrslmPeAyhkXQzKcECcZkYbfYXdCCYsNxTGr7kWL3?=
 =?us-ascii?Q?ZdjHbtU69Rhz0MQlK0bd4E/uM13qsWCf08a48F/5UkjuBdE4b6FKYtMBPcJj?=
 =?us-ascii?Q?iAQywns=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?krdTN0/UyTUiBlqBfDykylJWv6f51DY6WV9l2IRNzCaeU6RTt4jculp83CYJ?=
 =?us-ascii?Q?8FloriBxAG+vCaua1Ja0yBbJe/iBnWZnWhwCR2jwhsKKGUWdyre3ysyO0VrU?=
 =?us-ascii?Q?7A379wfLwjl89aQB+8e3HvFLSwY6IDOM51FeXotwPAr6y996G1xd3VDFYIJZ?=
 =?us-ascii?Q?VKYB8kCUeZsv4iPcok1gWTB0oL3do82tb5p4cSw5x1XbdDORQzOjVdhlPRmg?=
 =?us-ascii?Q?u00TKY29fDCsZzCAV8eCKAeJbH6QSZ1lyVB7zegcNMajeJRx2/k5V871vyCc?=
 =?us-ascii?Q?XnUVb+K353ltk26UspXKjtuC87EanPMC/bvpOUBnrT2hjU+iKwNTfznr0USy?=
 =?us-ascii?Q?BoXP3O5Tg0iJhdU9bV9q+UWzQhp1KcaryUXW+svr+n7HYeF7rNJk+F7IyqNJ?=
 =?us-ascii?Q?sk/ZrkgGPLpINAiH+Lq94HCFAUELV4/ops/4DF21Bf5l+i5FrlJyPLM0j2nb?=
 =?us-ascii?Q?Xuk4gOf7lDq8920JUh6kKAaitfFaMuzCT+vvq24skHDn9YMWV8rK6deVrIP8?=
 =?us-ascii?Q?DWJCcR/AWu94eoZ0Ryvn0MuXlAyPK+U7kh6ss9/R/V9GQVefymwjWfAUB/Y9?=
 =?us-ascii?Q?fXZFxIbkbWEeiL/dG6XpY5DdDNtTSxY3uCoHXgInzpnj54vYq6k/Gvd7lyJi?=
 =?us-ascii?Q?YuzM458SLUw9RfBq5kleQWXSfV7QKoXTDCD1Afv8ByItdmv5TFT64wWfAZ1f?=
 =?us-ascii?Q?1USqVtYuz4a95NUlCwV6XzRk2XGv69hMoyOTdEHKdG3zrEz3//lSZ/9YCU/7?=
 =?us-ascii?Q?bqDghXFVu1WOtz+ztCXdqqosn/40QXeKXxLsRu+nLJNzQcm5rf/V3YYqk0wR?=
 =?us-ascii?Q?2gLb0Bu75zlgGorEjeXbQ3DC9HBQmffvYzSbl2VpaYWkeseVOhcvpuCcGHQQ?=
 =?us-ascii?Q?WhLcX8UteE8nXv78bGNF6v0ND7wQ1iPRukCdHFinjpnw5xkyE/iQRZvgkVqG?=
 =?us-ascii?Q?VybiSuz6WqlU5uJ8DVE3AzErF3q1t3qNrmOBMRnAMyWbZxdW3+VbZCD3kHXb?=
 =?us-ascii?Q?Z8uWqlNvkeagRkxlQlJ/0BLRQQ8ibEi1taZtNjPjBfnAwC5VL4/0bFYnYhKc?=
 =?us-ascii?Q?cXwpRLrn+TPhTb6XXi6AGmAUL4Xdofrgkv06QSsA8OHIH3SSR7nIcRqHAJCW?=
 =?us-ascii?Q?qVMwz7uBQop9dQAC4qgewS1ViYUYvhHn/5HDtkZsmEYyeldKA1UlgaQ6eWAm?=
 =?us-ascii?Q?tZarft8nDrq78HgluPHBkgJYp4E82/U+VXnXEOvUGCdHWjMDnI/DPa2yBOln?=
 =?us-ascii?Q?MfJVHCbPF4eXtt1eejesA7Z+GlHy7VtW42AjUpwGjShSDNHgpjLxTxm39SJi?=
 =?us-ascii?Q?C+1WtGIlRU1DWWuF/+IHzRgM+lnMnqxav3WFYZxpw0uz7Mniq5OkBRwGnBuV?=
 =?us-ascii?Q?FfmpULOcq6v7KDq14oYGNUFTRULi6xtf8C05VOT3CS4W7M47Ulr1XLXdX3V5?=
 =?us-ascii?Q?KWuEGcOzH2a8PXpR+udmRFGX9N6Kkz3/72T5s826q69UbMTQ6F8HdkKOzjZY?=
 =?us-ascii?Q?inuPT+CgRur3F/IoV/HrW1OyAn7kI3qnoAncp9DyreVk08BQaTPU5cIWOV86?=
 =?us-ascii?Q?jne+jY/ZYxKVJ4FiONougaamb/RkgVo2xLph/rY/?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42a22444-4db7-4db0-7deb-08dcbb434caa
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 02:54:50.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +ve8ITUTxpw4EknfQ3szpWlftHZzdmAx51Qci4Jt/ES8ktFIx0wgR4XI+gtf4tzn/Y0rgQQbBNfTssfaVkHw7FHwL6Gsp+MyPpzz7sP191w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2218
Message-ID-Hash: 2WERFB5L2YZ6WGPDA5BNM3FZZD7MO4JF
X-Message-ID-Hash: 2WERFB5L2YZ6WGPDA5BNM3FZZD7MO4JF
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WERFB5L2YZ6WGPDA5BNM3FZZD7MO4JF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1307.yaml    | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
new file mode 100644
index 000000000000..a2bcbdc3444e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/irondevice,sma1307.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Iron Device SMA1307 Audio Amplifier
+
+maintainers:
+  - Kiseok Jo <kiseok.jo@irondevice.com>
+
+description:
+  SMA1307 boosted digital speaker amplifier
+  with feedback-loop.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - irondevice,sma1307a-w
+      - irondevice,sma1307a-f
+      - irondevice,sma1307aq-f
+    description:
+      It is divided according to the package.
+      The WLCSP packages are denoted with 'w', and the QFN packages are denoted
+      with 'f'. If a 'q' is added, it indicated the product is AEC-Q100
+      qualified for automotive applications.
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      only in sma1307
+
+  '#sound-dai-cells':
+    const: 1
+
+  use-binary:
+    description:
+      whether to use binary files for device settings.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@1e {
+            compatible = "irondevice,sma1307a-w";
+            reg = <0x1e>;
+            #sound-dai-cells = <1>;
+            interrupt-parent = <&gpio>;
+            interrupts = <4 0>;
+        };
+    };
-- 
2.39.2

