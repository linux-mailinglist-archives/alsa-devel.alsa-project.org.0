Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04A9EE084
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2024 08:47:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8844341B;
	Thu, 12 Dec 2024 08:46:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E007CF805EF; Thu, 12 Dec 2024 08:46:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E92D1F805EA;
	Thu, 12 Dec 2024 08:46:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7820FF802BE; Thu, 12 Dec 2024 08:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2614::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F36EDF80246
	for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2024 08:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F36EDF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=ZcStINzc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DE49PC8EEE5TWaJjIZc/DIov4DtY8fJ2kE5gzM+rHOJyurYL4Kv/zdK5o+bdwu9Ng2sNJ+qJfTCVys3HO0xHsqWy6fBKzMKJLzcSL20ZklYlYdflyeMD0QDmOXnOSfRunuyg2ZFBYiM72axhBtXldPWgc1JWxlZzDrRPdUk1Z2fxxCx5UdzjRMXjTd2DKeBggq8ZSdEdedh1x+3Tjnd9/bNPeKwVsd1Sh3C1gRSLPr2ro81ubCef/5gLRIPEN8cqTwaDPyLl6nCRkPHJFg63Y5/w7NuLMsUJGZzyPfZ5JHw/+qHen9efjGVWsMsDmN6uQ0kpvW9tl7+6KdBES20qCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sWeVsIaATm7hVEpA/2OiVm3+pET2HYag/XaD38+9/8=;
 b=QpHj48hqXBLpdufMVPj1BD/bSw9vRaDhCXIRTWeG6hYParXQBaaLlFRR8umwMTizPFKAW8fc/G5eoxb+kLxKzFEXElK2kwbHSVu7QFshDFtW8iDP4kvq3XMOWTzvpprQvQUEFsU+vwFDUXiEBilWJjMA/G0vX3B7+31Lk4bDOum7S2VwKR2r39aLAFbXPHg8PGV9gp6ZPMbO7omm5f9o66ecC9z7KPTmsPnADAGD0e4Q7TkqQm7CO144PPfrHqU0GR5ZDtr+lQ3MlFu5rn+rQSxVuzWj8QOkDY7PqKzXuYbRuOAwwA4Vs2b1LMtlZCzRrUnZwngjkUiQEDceNCPaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sWeVsIaATm7hVEpA/2OiVm3+pET2HYag/XaD38+9/8=;
 b=ZcStINzcOOCiRFMMx0ulV1yG5bLr0mZTgLjKwXcTjKJwvFtKl8yaaKXq2fOhqPbDX6uNP1qKymdBUwINH70EoWTRXUFfvhFEBAk8DNzymk8egChVFtjk4e7dkVIL0mlkuzrMZQ4teBouSZnUtcc9pZDFJpa0DLtlmYjok0ZukuDfTE+GwwRR10wVriBzjlnmjTy0lwDBeuj3+tIGdSCcI42HA/ULMFFa5iUD78TnSmKIpkpa1vhyaH9TgnPxOOHvo9yKoQIFtzPWMmusKclAq1E0iDLTyN3g0le9ZdrQyoupR0TcK0o1vCwIe57L//0aXFbqsf4Fo1V9FF0Kl8ESyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 07:45:49 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 07:45:49 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 1/6] ALSA: compress: Add output rate and output format
 support
Date: Thu, 12 Dec 2024 15:45:04 +0800
Message-Id: <20241212074509.3445859-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 907e659e-7271-4a4f-866b-08dd1a80feda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9jkJKlJe1rysRsl4oGmvfLbjNiByny+P5lb6JJtG3qfa2TBMXgPQVLOgHyUc?=
 =?us-ascii?Q?YbdrGr955mEMtFfjOX9O2sVb+oT5MTrSab6dOM+4xBCVM3bN+ICYi8z64HLf?=
 =?us-ascii?Q?BTAjIJZp2AfYen60sLe0M6+LckUQvz16wveXZjsbljcTsb4Oqs+FSyx/8XxV?=
 =?us-ascii?Q?cwMRoRCWw7wRWRn19Jr22uvWe/4OgOAWpoWKTnJe+kz3BGsZXJeeJXPmnKhB?=
 =?us-ascii?Q?+Y/ZlUK6GDVCXGOJAr11Dxhm1D3dgfLLHjvVs3hB38NCFCXa91UOECVn+OVx?=
 =?us-ascii?Q?b0R/oHUO0r8N5Bx7o7DNFLGrVpGTe26H4zmNn4o1SnSK1Ghp1fUKpaoDUdGL?=
 =?us-ascii?Q?OpYHaXqs6g8AK0hj+KAREHHnLwSubX2Yc4/L/iSgMHlB/OGG4M7N1W/3S5rv?=
 =?us-ascii?Q?NnZ/09tWTVJL66mCJ+CFeyOqmUO6RCEY2IMN0C3u17SUScKFQS/j9J6vJOBf?=
 =?us-ascii?Q?ZC5XSDVqAfShn6ZJnFtFtYVWT2EBiMxCvB0Ayc8culN5j5eKMsCPWoIG3NES?=
 =?us-ascii?Q?m3QSGTsiQVsBMlvJ2oiQqbNjH2xaEcj1nD1tAeec3grSN25DoaprSxXKwQub?=
 =?us-ascii?Q?d50rsFqt3sDOLnXsJ54Jv4bkXkWsee8yft6aOMvyeLHMq1HFkoQgSPgiJ89h?=
 =?us-ascii?Q?IqSoNwNEaUWve1Jl1hsmafOxY1286CGm9tfdfvSkAwIP/iSfquaK2jvWRj+y?=
 =?us-ascii?Q?VLzVSD4HTwmryLZcxU6zVQIwKJOEHFTU4mwb/udSbHkcZJ7G2VxTfJPMrBEN?=
 =?us-ascii?Q?f0RO4GC5QDOmcZPDujG0b+jxR6+VDIUGRDsX/vF4NKah5OGQU9fuVApYUp5x?=
 =?us-ascii?Q?2jTabO2mYsiyo82fjoBNtT1b9UHRo11QxPB7j0NTmIJw0Cc7NGycg8tFNceo?=
 =?us-ascii?Q?yMUzUGP26V58sJ44sxIdoRL3R5y0DWcydKb0jgXKU3r6Ri67MeBH7jCNkJwD?=
 =?us-ascii?Q?EUEHNoktkRNwM6z4DYORSwfDSl6siLtW7jlufSWX6oE0mnBbfKEgWCs7ZwI3?=
 =?us-ascii?Q?K/wmeTAqRnPqFZBDmcwhfuFmILQHjiYk0IAlFTU+T+zNDd7qk/RUvUSXm+0E?=
 =?us-ascii?Q?r4W+UjZ9wwA6VTDVhV6IGV71BfMC4skPm+pRaVlZl/Xx/HZqEnvVNO34YTux?=
 =?us-ascii?Q?qXlAXIM98u/oEIn405KPVyCRSdul9/ysKbfGMGd/SRsOWDGg7oP1/Gm0xZaB?=
 =?us-ascii?Q?Y2qXPwBPh0EtKF/EYHXbMaVA9/4uRNhVinFN7shrzGC5mGF6fz9TTL6Rbn68?=
 =?us-ascii?Q?DBO+wSSYVINKBeOlLXxJZshO3SLvW8D59yOQhwtLQi8hPcyECB/PLemi5Udk?=
 =?us-ascii?Q?VA+qZ+7pzZAIVBJ8UowgcIBlnmaUoy2lmJVXKtms3oZkI4hImRYTqrM4yrmg?=
 =?us-ascii?Q?9SG6PiXeD9x15rdv/l27F5SnpAfGBBJwhhTd+Eo08v4hGD3vnPP4r2e3r1Ae?=
 =?us-ascii?Q?UxijWYuX6/Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C9ynaNiTja/6nQTJQmkmwZLXjZnhpEoiVxG1MFCI5WDq1w2g7WlUTB1VpWSe?=
 =?us-ascii?Q?FemLDGrdDQejHAkMrOYO1QvA/0dywdQB1AJ1LaNStS+pM3BLgUEZqyQrxI9A?=
 =?us-ascii?Q?LOIvU6/a80Pr0WP/xljFy06KnWsBrkZvbPPP7MN1J4OzJh9tv+x9HDF2KKAV?=
 =?us-ascii?Q?WcfWy267UF523YBBwc5weUwycZtYNtQWFNi83Ghzd31bBb102S3hqA4XBWse?=
 =?us-ascii?Q?hMX9/NkY4jU9SLxtI7rBusH/8oKpjY5RA+jb8HpkmK+BiYU2U3gRRZDSIiX6?=
 =?us-ascii?Q?0F82szFCXYUODu+EeO9M7ZHfqWtsbfPP8lE0KZnLHgcUeNdvPhxZ96M9NA6F?=
 =?us-ascii?Q?F5W+r/W1ECbJy5E9WHMQqWke20WVqJxG+mtNIT2m9zyXS5GBMQLxs4da+N7L?=
 =?us-ascii?Q?7RIkOGPaPTkAef1v5sxGomRcJDmYrnkJ05craiHD4U48Sde18jhP5SQfy9Zd?=
 =?us-ascii?Q?B+NSz3jKPsxqG7YboMt7Xlq98HnwLbJqioFkb6ojz4OSDdvfrEEk6lRT3+8y?=
 =?us-ascii?Q?Hg3h0+xtOxBWGtW9YrYmGxsiJc6Bb/zB73O7i/3Z2QtbzuIH/IVYikfrPs6Q?=
 =?us-ascii?Q?xBDU+MYGPefh48gF12tcgAvmBiU3gjI0YLkt5NsQEQ3TpWbL9Ud420d6Fec6?=
 =?us-ascii?Q?W/JMAd3hCG5fUn7eyD9bM58mJaaZVDnbt94LTqxSCK8xD6zwkj7R5cHPqE+Z?=
 =?us-ascii?Q?IDSZWEairi3gUYhgdDZMApK+SpN0UmWNwApMrZR3JgT/0FH+x8QilvaIPWqr?=
 =?us-ascii?Q?knGKEZiBAIAqBFpYWv/4nPhclyllEIEA72eOQmJW4a3sejUr/06wh2qawGIM?=
 =?us-ascii?Q?pYAusRUNIRiuVflleSAHuth9cmHwoV3Vt8aP4NIr5LwsvtSumxJaaaOalF8u?=
 =?us-ascii?Q?qujJ8dLv79Vq61gG4SN9QnmARGowo7+q7609LhNnCk1FRVuz43JhiHlvl6Q7?=
 =?us-ascii?Q?jbKPo6OhRfYhjqSLE/PZNN7QAYYg8JXKVIvs3vrcK1Ue7sglQ3vMSbX7RSDa?=
 =?us-ascii?Q?Z2rGfjgZbhVqf6s6hJCt5iiuDKzT4cxI3Isd1b5KMiznYNpGO65u43vAOeNg?=
 =?us-ascii?Q?hqn23uYsYGmpsHEOAGxmLZsRxSy8O4GMOH3eWYWaDKaNL4Tb+0+F2N3QTAlX?=
 =?us-ascii?Q?oDpWhcw5AP8dcoWrQaZfmWgpVdZiDGDW2ih1d065Lsml5T2XhaOEWyGP3RjJ?=
 =?us-ascii?Q?wSJlSrmSrsJe2EgMX3QzZWmZCeSeMfNZVKxa+eDn+LufH07spbXU4NLJq/Kr?=
 =?us-ascii?Q?EKfj9J+bJ/7RKq9LNJlZIZ/FAO7m+4OKczxN+UpduW2xHfsHAKmb1unGDtHJ?=
 =?us-ascii?Q?JYesXfPYq0YRcPVSpZa29VfWGyvntVHalFJg1thxlnsyL0M6VKRa/xLv5pbP?=
 =?us-ascii?Q?Ycvdvgpa+/2eD17I25GSHj0gNEBX9HbAqHV/dKq/H2uuwjCwemfuprdSVBzd?=
 =?us-ascii?Q?79TIHjDhfOs3yNS+1OagX+v15IAfui9qk7mrS11c0lSL6opEkK7f9dLOl7m4?=
 =?us-ascii?Q?dQO/pRr8hAa48ohSAXjS+D0b+J8vt7owDbByC8ZDjNYG42z8Dc2GAF/uos+s?=
 =?us-ascii?Q?n0zARWkn0t8xpxrwPAlhLVvpbBSbM7MxP3pUiVQn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 907e659e-7271-4a4f-866b-08dd1a80feda
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 07:45:49.2826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zq7pepo/ltlCMBzm+qLCVLICoNiXWUBckZUl3uRwz69CWu6Bvo4djJ1bjNdcreWrCXy0w9P7EJathnTBY9n2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256
Message-ID-Hash: KXIY645CTTVGS3UYMSB3LQ6DYHVO4HXZ
X-Message-ID-Hash: KXIY645CTTVGS3UYMSB3LQ6DYHVO4HXZ
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXIY645CTTVGS3UYMSB3LQ6DYHVO4HXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
struct snd_codec_desc, these are used for accelerator usage.

Current accelerator example is sample rate converter (SRC).
Define struct snd_codec_desc_src for descript minmum and maxmum
sample rates. And add 'src_d' in union snd_codec_options
structure. These are mainly used for capbility query.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..bc7648a30746 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -334,6 +334,14 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct {
+		__u32 out_sample_rate;
+	} src_d;
+} __attribute__((packed, aligned(4)));
+
+struct snd_codec_desc_src {
+	__u32 out_sample_rate_min;
+	__u32 out_sample_rate_max;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
@@ -347,6 +355,9 @@ union snd_codec_options {
  * @modes: Supported modes. See SND_AUDIOMODE defines
  * @formats: Supported formats. See SND_AUDIOSTREAMFORMAT defines
  * @min_buffer: Minimum buffer size handled by codec implementation
+ * @pcm_formats: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
+ * @u_space: union space (for codec dependent data)
  * @reserved: reserved for future use
  *
  * This structure provides a scalar value for profiles, modes and stream
@@ -370,7 +381,12 @@ struct snd_codec_desc {
 	__u32 modes;
 	__u32 formats;
 	__u32 min_buffer;
-	__u32 reserved[15];
+	__u32 pcm_formats;
+	union {
+		__u32 u_space[6];
+		struct snd_codec_desc_src src;
+	} __attribute__((packed, aligned(4)));
+	__u32 reserved[8];
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec
@@ -395,6 +411,8 @@ struct snd_codec_desc {
  * @align: Block alignment in bytes of an audio sample.
  *		Only required for PCM or IEC formats.
  * @options: encoder-specific settings
+ * @pcm_format: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
  * @reserved: reserved for future use
  */
 
@@ -411,7 +429,8 @@ struct snd_codec {
 	__u32 format;
 	__u32 align;
 	union snd_codec_options options;
-	__u32 reserved[3];
+	__u32 pcm_format;
+	__u32 reserved[2];
 } __attribute__((packed, aligned(4)));
 
 #endif
-- 
2.34.1

