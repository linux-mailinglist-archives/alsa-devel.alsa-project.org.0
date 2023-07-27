Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16193764435
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 05:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EEED828;
	Thu, 27 Jul 2023 05:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EEED828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690427808;
	bh=piF1mhf+J/2geDFwhaC60KdDeeVMASCA93weVxdnJVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NvAB/ERP30zGJwGnf+AL3ddqj0YTFfUCwsy+F1ZJ+zPvENQAWfoZQmcrTzqXMhKPy
	 NNHQbgDmEocQu81McjEseKMgKStcwi8gjfbaq+s7Calu6x410Ty6WSIEgtt0oj7wzC
	 nQb/oYTHj4/4D0SdA8kHwGYKlXshcSk0c5Ktwz80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 506F6F800D2; Thu, 27 Jul 2023 05:15:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8089F8019B;
	Thu, 27 Jul 2023 05:15:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B42CDF801F5; Thu, 27 Jul 2023 05:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,UPPERCASE_50_75,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C32D4F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 05:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C32D4F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=EKG/Wxjp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj2slRJP8+5bAGyk69Jlj45DCvaJhdQ4UiG4b8Z5ZQzl3USFzyUoj8FvdNSo95YMT9Y5/A/q7fbCKrL41h3qqc6uViVSYJxixdTK/6o4RX4xh/u9/Oiwp45pe0dtxMue+eWNjcXcV4mGBBWsFl4oSeTzRp8pxb7VflAlRZy9fTl0zJl+p5w3a7jKOWgKJYIGu8pbtfb+1HKqf7mD6eAyDE7br9sXAPHOw33tDu6FwH/FMLGBifgvAQ32NcQHNPYg4qy2vZNzDB5WS+W0lhoA0e7R4fdz/ntFll4EJtmMTDNAOsVNWixmPXRrlNA8fVzHBWhzS5ntHwb8rOtg/T1GbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rusdyh1WKkrdaep8m2fBU7OV+3d1BgCX3Rmavs7o8A=;
 b=QxqGjGs/YRKrlHfamZfj1NWRBDlq0dn7tEHqnPMbg5QIDrHQQe83bfyJ9/qdBtDrwommwukfcL0vit/PSo8l+3PnjJNK+IoyWm0aKMsKWn/6jYu+qeiTqYCJbYsmp7U8y/+KWLpoeaRx9QMF2IUKpu1pcsS8CPkQQ3OYmk7umAsxKIDxkaxsLENpuW7V+6Jtcb9edvKuLcr7f/8PvZWz6meFkujJ7o139wF3W4Mrm7PNa2f+wSp3tiQeAG8BMj1rrZS1Kb+1yhLQb3B6xfnWfN7qsClOj11kE1y3KRynjLok2TUKDPYnK/UsF+2n0hS8rFCqeQhh9Xn06bp03s9Xig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rusdyh1WKkrdaep8m2fBU7OV+3d1BgCX3Rmavs7o8A=;
 b=EKG/Wxjpsuh0kMntopAdiM/Ew2BrbTEiwe4T+b/oSDeMCOtglwBiOGqDoYaD6mfNukswOLSnWMVvBBpcgfC1dTv1DTyXbV7246X2XtVcw8JkYMyJPJuNn4lZFZNmULfYCTqVTnbO2mrbtHpL5BV+AZQTA13EXfm49MMWs7TTyyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS4PR04MB9411.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 03:15:35 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:15:34 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 1/3] ASoC: fsl_micfil: Add new registers and new bit
 definition
Date: Thu, 27 Jul 2023 11:14:57 +0800
Message-Id: <20230727031459.571559-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727031459.571559-1-chancel.liu@nxp.com>
References: <20230727031459.571559-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS4PR04MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: bb834e58-4e68-4bae-5cad-08db8e4fbe35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8pQKMOrkYWdMiYsz2lpl9Kf3STdz5F1tufNRgbeubLZYTRcrdpDbEeDZstYyj0+yS3yVYPqzh2MlGNJI8qAsnAtI1dNhfyBuYW1pp3cJqHq3tWCsulTbHstaXaqua92Msb+GDPBKiw05ybzik5SP5GSbI2v5k8ZMCozYTAf+wk/9Cs9fXwW87B9eKKv+cOUDWRD9sgg+jClSthqTqoOYIaYb3jldPuelfaurpZ/Ob9kUc276/SEhqKv4AMLdCeeWZPwf9P0gZjqeVjDc4OwYusuaiN2M3hCuyYHtvxLu0J/WSbQoisW2gp3QWZOjY11/fs3UDDGHTqjYZsvs/KWWig5SPSQEjJaOLgUtoIqpwjhV4TZKO03hymyXfnNBpUfpMi/JqiguQdTuPkzqdptVhrKLAsmrfF8yJOuOClR2yQJjinywuML4Hs3MpmsHU1cokoux3vbw+6VvwXMzorgdIzeSAfqqNzB/QGf/iPG1wkgMvUk9eHTKZZA2FydBiAWIsKyjoDGp947/885E5qmgskXItRjLV2b26ktaY09Dwl+o6POGrYDwXQoXV8OqJLDQ/4Lg1a9mwfuzonIVZYlr0X00TvBNOfMxe4OjGn9uU4VcCOIb0NSSD4kLYJ1mKt3is9tu+yKqKT/sJw7kbIFSDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(36756003)(86362001)(921005)(52116002)(2906002)(478600001)(38100700002)(38350700002)(186003)(26005)(1076003)(2616005)(6506007)(41300700001)(7416002)(44832011)(8676002)(6666004)(6512007)(5660300002)(6486002)(66556008)(66946007)(83380400001)(66476007)(4326008)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gkvwpMrx5WEq/Cu7uElJMY6iHdxyCbpR5ffJRjqmgjwrpWGwl8xbAUyE1lNF?=
 =?us-ascii?Q?na0qLWZSoBXcqjHFKKW1sajRja90FxYxKBNpe327MqPmAHTuRv5udMoVzIei?=
 =?us-ascii?Q?it4zhkbYrOSdUIW3FTSOG4PPOiWyZfzEAEs2FpMKSKYTu9iM0RS14WJi/zN4?=
 =?us-ascii?Q?FMThbFI4JNdknc5f9j6SxnQgaIUsjTK7F0h5KV/Hd1Cn05bkQU/UqojUgSsE?=
 =?us-ascii?Q?E57heqMeB23ZHjbpsALXxOzNlV8yJleJ7Z8NFo7MEJZ4paYkpbrHPgXWeRsz?=
 =?us-ascii?Q?KuiyOFGX2bE2RdGMSpjpJ72E3V+SDvYO/WctVA6PfVmus05eVqinaXdbfuKb?=
 =?us-ascii?Q?iUVP4pxKVJ31AvewzvBfHpXJERntaTWO0j88ZCrLYtSpzULCXgGTqg3WZ+7A?=
 =?us-ascii?Q?H1hK0TeaEaR3wO/im+zSpELQuxPdyIv7eduN+46B+JESsSjm1y1g4gchXPXv?=
 =?us-ascii?Q?sz+JNwVsmPD40rN8wKzSBjVj1zdO8Rk383v8CCKG7Xwrh13JhBbdrOAFwsUm?=
 =?us-ascii?Q?2IoL4qc4wyPFL166oOatSXHkMQHYAw7vfbR6KbDDFvgFx/yCvRUr2wklSNDo?=
 =?us-ascii?Q?zPBzIlygnOwNpwVwbq1M0B+gysdouC48yl+NE405aCBEMFn0AOw17tXJmzN2?=
 =?us-ascii?Q?Bazxf/wiiuJQ0LMdBR3IBkF6zaQeBiRNUA5bXKfoGFewJQG4Oku+r+/h0+y/?=
 =?us-ascii?Q?bkBZNs0sDD+LJs9zkGi4ZPL/jG5EdriGTWTlzoLoeVEWdz2yvq6AYRb9uVLv?=
 =?us-ascii?Q?8SIFTpasLqFF98Qjmfsk8y+YANm+fdVq+4bLDZBmO/jfhHD1mKQDfxMiAgJo?=
 =?us-ascii?Q?ywkCkEy5HzmzQvZ8lsRCAwy3L89EjHst/5tNu0xwJjvbdTypDA3l2pfD/xGA?=
 =?us-ascii?Q?lTYpipv6OO6tnOvfKQvH5gd6cyWZII3sW8i/fIx0Ew5o7VRlRxWnfdX55Q/C?=
 =?us-ascii?Q?ZG8jXSYfjl0jFmRYbfiOBKFVVn8ZHOVhE64c0nPf4VT5kKASs1bxAxXAOlPX?=
 =?us-ascii?Q?YHLoo5aa1ToiZY44FrF1iBUSOx7f6ZXEs0nDxk9Mbg7PsXzfy9XiMdDiM8R/?=
 =?us-ascii?Q?IbRhh+szby6FkaIdKRV5Yy1FI+EN7Ypi8g44LlmedzdOAnJ5FnWBXk3S3zRr?=
 =?us-ascii?Q?ZYsCJ0obNQWTzOBlRY+TKP+gcpBkgYE5C01fBY2QS7iRFfqCGE62L4noX64h?=
 =?us-ascii?Q?YGn21cxgQYLmJb8MTbC4ylx12TlqaGrSnFzMiF7FXYSFEyS5Qhph40Dswnk2?=
 =?us-ascii?Q?B8o0eLwFCi+8kaxlr/HnPZ1Z8c/aUeTGGGWXlbQ8wXj3eHt+lMdUIussvjzn?=
 =?us-ascii?Q?9VTbAwM4lYjG/msVnYOcVs0CpHH+OJcA4Fgo7mIXphf382w3YR6uBKGGP2HL?=
 =?us-ascii?Q?FpWArc7dI89PAoNqgUM+i2MAHTE3WifvJYznGJla5roB8sc5+llUNmk6/BTK?=
 =?us-ascii?Q?/ZWNukcbaaiSvaQpnFlgydTsL9RkuoIomF1iKduSBCxzK0feG5ay9kOV1Zzu?=
 =?us-ascii?Q?WPKkkQiXQZwtPWsWR0rZC3C0hzMcTVlhBPMzdfFjPN9ZTBMCChYVorUHjnPj?=
 =?us-ascii?Q?WNtusXpsZ+lBKj4oENm62HAr0vGIqt6Rg71QBoXh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb834e58-4e68-4bae-5cad-08db8e4fbe35
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 03:15:34.9340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9WGervjfsW1N0MxHCwr2hjK6XpKzQCu0e8B5WQ1sR4symR+SxdrULZzcs9Er/lilIcCeLVWPcqccyxb6E4RNEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9411
Message-ID-Hash: 6RMR7ZRVY5V2H5N2PA22JPOG6UPP34WH
X-Message-ID-Hash: 6RMR7ZRVY5V2H5N2PA22JPOG6UPP34WH
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RMR7ZRVY5V2H5N2PA22JPOG6UPP34WH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MICFIL IP is upgraded on i.MX93 platform. These new registers and new
bit definition are added to complete the register list.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c |  6 ++++++
 sound/soc/fsl/fsl_micfil.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 3f08082a55be..b15febf19c02 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -825,6 +825,9 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:
+	case REG_MICFIL_FSYNC_CTRL:
+	case REG_MICFIL_VERID:
+	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:
@@ -849,6 +852,7 @@ static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:	/* Write 1 to Clear */
+	case REG_MICFIL_FSYNC_CTRL:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:	/* Write 1 to Clear */
@@ -873,6 +877,8 @@ static bool fsl_micfil_volatile_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DATACH5:
 	case REG_MICFIL_DATACH6:
 	case REG_MICFIL_DATACH7:
+	case REG_MICFIL_VERID:
+	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_STAT:
 	case REG_MICFIL_VAD0_NDATA:
 		return true;
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index 9237a1c4cb8f..b3c392ef5daf 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -24,6 +24,9 @@
 #define REG_MICFIL_DC_CTRL		0x64
 #define REG_MICFIL_OUT_CTRL		0x74
 #define REG_MICFIL_OUT_STAT		0x7C
+#define REG_MICFIL_FSYNC_CTRL		0x80
+#define REG_MICFIL_VERID		0x84
+#define REG_MICFIL_PARAM		0x88
 #define REG_MICFIL_VAD0_CTRL1		0x90
 #define REG_MICFIL_VAD0_CTRL2		0x94
 #define REG_MICFIL_VAD0_STAT		0x98
@@ -39,6 +42,8 @@
 #define MICFIL_CTRL1_DBG		BIT(28)
 #define MICFIL_CTRL1_SRES		BIT(27)
 #define MICFIL_CTRL1_DBGE		BIT(26)
+#define MICFIL_CTRL1_DECFILS		BIT(20)
+#define MICFIL_CTRL1_FSYNCEN		BIT(16)
 
 #define MICFIL_CTRL1_DISEL_DISABLE	0
 #define MICFIL_CTRL1_DISEL_DMA		1
@@ -82,6 +87,29 @@
 #define MICFIL_DC_CUTOFF_152Hz         2
 #define MICFIL_DC_BYPASS               3
 
+/* MICFIL VERID Register -- REG_MICFIL_VERID */
+#define MICFIL_VERID_MAJOR_SHIFT        24
+#define MICFIL_VERID_MAJOR_MASK         GENMASK(31, 24)
+#define MICFIL_VERID_MINOR_SHIFT        16
+#define MICFIL_VERID_MINOR_MASK         GENMASK(23, 16)
+#define MICFIL_VERID_FEATURE_SHIFT      0
+#define MICFIL_VERID_FEATURE_MASK       GENMASK(15, 0)
+
+/* MICFIL PARAM Register -- REG_MICFIL_PARAM */
+#define MICFIL_PARAM_NUM_HWVAD_SHIFT    24
+#define MICFIL_PARAM_NUM_HWVAD_MASK     GENMASK(27, 24)
+#define MICFIL_PARAM_HWVAD_ZCD          BIT(19)
+#define MICFIL_PARAM_HWVAD_ENERGY_MODE  BIT(17)
+#define MICFIL_PARAM_HWVAD              BIT(16)
+#define MICFIL_PARAM_DC_OUT_BYPASS      BIT(11)
+#define MICFIL_PARAM_DC_IN_BYPASS       BIT(10)
+#define MICFIL_PARAM_LOW_POWER          BIT(9)
+#define MICFIL_PARAM_FIL_OUT_WIDTH      BIT(8)
+#define MICFIL_PARAM_FIFO_PTRWID_SHIFT  4
+#define MICFIL_PARAM_FIFO_PTRWID_MASK   GENMASK(7, 4)
+#define MICFIL_PARAM_NPAIR_SHIFT        0
+#define MICFIL_PARAM_NPAIR_MASK         GENMASK(3, 0)
+
 /* MICFIL HWVAD0 Control 1 Register -- REG_MICFIL_VAD0_CTRL1*/
 #define MICFIL_VAD0_CTRL1_CHSEL		GENMASK(26, 24)
 #define MICFIL_VAD0_CTRL1_CICOSR	GENMASK(19, 16)
-- 
2.25.1

