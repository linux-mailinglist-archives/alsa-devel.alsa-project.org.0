Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3BF90A30D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 06:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C74C868;
	Mon, 17 Jun 2024 06:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C74C868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718598613;
	bh=jx5Uujx2jz16Ml/vAe4609bE7iAn+4uxm//cn6CBnNU=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LMg5GwT/OH+zWz+bUQfJgejg/Bxy40LhZNalqY7cYs4n56np1ITMbFjxYpTtu/v/+
	 6JqVUBfTvrJu3Puc/D7Ehiz1dytsMBRA8ZrbbhygkHhkN9/993UXP2aKOEtwsIqTqQ
	 pt0i1gDEtnjn/FmD5FZo7jZbaz0YJQX2ub8SAm+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 834E3F805B5; Mon, 17 Jun 2024 06:29:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3593F805AB;
	Mon, 17 Jun 2024 06:29:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EE16F8023A; Mon, 17 Jun 2024 06:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AA8DF80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 06:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA8DF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nicqiPDA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+nwM5osk1jRgMCxRhLPs/vhe4ZPbBSJg3DhawWqSK7Rq2xR84SZoDQrGg6Lr//HI/MDFjrM9fRyY3xHLdBysFKOwreacEddS6uVL3ifY3nI9Yoln0297dJSARxSgh1D6kDplG2WkO/VvbYrN8McctEEwX+vFz5xlU1DOigqiociNG/rpQ1FBlPxxyNFecIP7fDbeWjZlh0ua6EZp1GXKkCqQssDHQGtxPzCjxg9qu7COIhvKuWgZoLe1u5F/4yquHNIPn+JHcnzHfaef9xbugG6yBhzuYF6hwA7jupP4qRE+7Sz8MZdFH2vguzMT6JPkhAjE4BYSWatZdwlv62YqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/seRSagG8t05lFvyi6+Z6FCT/dEy6a4qDbBPJWfFxD0=;
 b=VO8deq+Y9YVZRXNOsFC0Po1xtNo6moakSdv12+9+x8tbk+6HqaEGX5V6oH1XCJQGsMa+Uw/myHtkw9Mv6jPzkS/lIIPyNxCZo3sIg0MPR9paRk0AIjkTXoXVgAANFG9d7n51osI5ASpH0U8kIBbA0/voKqxQI0zjFORif7XwO0VNJaYWBnyNi1PMAwUPFlzY/IupE84qwU7XpUFwcp9mjI3UfXk0JBTQKC1YWjq7xeY9PayB5OGHNuLCOn63Bfdlor5AWWLfsvGxRkvkUTUcRNZD/QrmMfJyvQsPDCjH4M++ei5p8a/mbW8ByPzTsJGb1q6CMrf45Tfq+eFJonr6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/seRSagG8t05lFvyi6+Z6FCT/dEy6a4qDbBPJWfFxD0=;
 b=nicqiPDAjpbArUBvhazMaD290h6u1KofHG3ByMGiWz0vv69ImmPXKCZjntsJrQLVn3xQmFjRAFK44+1C7fgsJ2piWzkZVBILERnI+rHUcjtXye1Wi5B8WuoZq2YrG1wFTQqU4+yER83vNVMstOA5hUiaFvNi3lpFhBnHsnKisEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11808.jpnprd01.prod.outlook.com
 (2603:1096:604:22e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 04:26:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 04:26:38 +0000
Message-ID: <878qz4ry81.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2: add support for aux devices
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 04:26:38 +0000
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11808:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cdc7f8-e252-4ed6-e1e4-08dc8e85ae6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sRCNbQKYDxqsu2j17A/+kQcFmMkQpCjwL/ii2yD8fCWe+Thf0vkK1anlcRnd?=
 =?us-ascii?Q?dG5an4Po3+VlkKwxAmRMpKcGmy6sUnr4WVEwJdl9xfrQnsKMzxum0Z2B8EWL?=
 =?us-ascii?Q?VYU5S1v7xSsv+2xcGXr3VTU7XWVI+b51ElBSe/21p3ytPNai3SymjBlpSWzt?=
 =?us-ascii?Q?khKoHb8dh+AuooQcdRcbwvd040ggmO2B+nz4u9dPrBeB46AMAtD7dIv7QLt6?=
 =?us-ascii?Q?V270kZto9SbcGqL23uKOqlOPx5S0NxxPLUzx9//GEsUV3eaCZh94NSb7ip/R?=
 =?us-ascii?Q?OAZXPVPTmgreaVYqu/aqC9Ro2Rb721/mtm6i+uYIp3hNC+C4HfIEkxcU8Zr+?=
 =?us-ascii?Q?DRdPTmCoaMKJ8/URy6c/88RSVqBQxMARcDwr66kf18GTq3JgZSbAriMUKzkb?=
 =?us-ascii?Q?FsUJ7gVfI33Yy/mB5dk2aXDOskUnPG79W7tDHD0Qjf7qKF7fKQRDe1iq4YTK?=
 =?us-ascii?Q?aoyap9Gb0nMLKfOtmM8lBl39UwJYbD1aw4qwkxot6pRqA5928mL0uoZRxq2y?=
 =?us-ascii?Q?qLRIoxGOLmKobRdvEDdT7mUK0vxnLEvcAugbCsH2z39qgSTP5pBnwcarusrb?=
 =?us-ascii?Q?PwaVwTXCkDveqopia0iV24ae86Ij0ntkGPKKYnyRy1UJhJ8uwsZc4XNeCgWT?=
 =?us-ascii?Q?+P45QJ2r6bdJKrSoljdBNHNjwHNUEAZs0qxbqTy0DSGsWeQdR2T8kCgw5Wls?=
 =?us-ascii?Q?Ac/mUYTtS2kEub9pWYikUH9bhfoTt8R2FlGO1/qFJbj39KqQF1MY0gUdnzbM?=
 =?us-ascii?Q?KHDpM2HwXPGd5BI0BnY5SksIYmbOMLlMpx669XrcsQavPtX98vD0d6RMnfKj?=
 =?us-ascii?Q?ZOYWnEjkVNc6fnh9oebUm5qtKv9tzIlVF+gE1EyOivR/Au5LWnAO2HKi3veA?=
 =?us-ascii?Q?EMIXSGXYEdAIbqLnXCJG4TrtcBPGX3uRvyn2OtcgzwzFsE2ljtMsunWgwXNc?=
 =?us-ascii?Q?JBNIENkZ/TZooDRXxgq3eL+2D42Fq3EDIVEgDI3lKwaNDSB4RMW+tv6TXRiN?=
 =?us-ascii?Q?1wAi2t+ETkHa5+QFbbpiSQ0JjOSyuhXo78C7DYZWBJVjKutxH9nBole1UKie?=
 =?us-ascii?Q?SDzVZkvWy33BfOsEwkPlX1nVxQkhbxhCGV7OxT7GexyvdF8s/FgNasluzcvt?=
 =?us-ascii?Q?MiPlkbYaJ6yWTKnXp77qt5M6u/Qiqmy5ynu9by6sxLIOKYrBut45ZV2v0W59?=
 =?us-ascii?Q?v68XK5LjvfN5FI9mh6MmDvH0penWYpth5qYu6s+xmMjOv5bHZfp3xBc6t2FD?=
 =?us-ascii?Q?9Uoigy4zXc2m4bvhT0hV3Y9JQKcZaTQe6CTEJaL/JlTqthiCe2Nc8mutBPLv?=
 =?us-ascii?Q?VqRaB07sjIgG/BZJwwEXImxXlKRU09cfDRJ4NcY0dRSlHpIamrY9NLLv18Fn?=
 =?us-ascii?Q?ASMnDNQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v/WEkH22di93leEb/XolcPL2qzTzkoWfcfReoXzcA8+HrbKdmRuF67gvoHJM?=
 =?us-ascii?Q?eBF8/MTEk+53j6xpmKjrlsh4fdfpN7/3Y/2GS3QGOckpG4eBN31ZyGAg9Lvy?=
 =?us-ascii?Q?jfWEQY2D7PuEmY/1ncFlXgVGMoeOyu2hfJ1cI3VsuGzDPbUysUShIa9MUmYK?=
 =?us-ascii?Q?H7VurWC0WD0Pxc72UsYEORmtddYWJFZotXjI781zFYUvcC2KEgAVfjKqecTb?=
 =?us-ascii?Q?Ygr6Z6lY26E+pRHRALRKx7miUh31W8kYiKb17FTX7SmV4TxOF98T9xl8/HL1?=
 =?us-ascii?Q?lEnzk1zl+zHU9hmkDwAmaa820BMrCTEsYz7vE6OYQojI0ZhL81M23jqTsGjv?=
 =?us-ascii?Q?KvzXiFih0uoiwLCauIRaStgfP4HXvi+cLeZnXihYwcRd/SonL82oABP0w+P+?=
 =?us-ascii?Q?ANbb9PUYAWg5V1YxCqCFCVqu68TqyzR4Vrfne6XzbLwfu2XSznzOMkC7vC9Z?=
 =?us-ascii?Q?1g/bI7vHxgJwN+vy8/11E9n+a+kY5zVffrlZ0bS5M6VZP3jlR0QjLgU3pRWS?=
 =?us-ascii?Q?YOTEIqvBKqyT0Umrzov4pQgZzjLRxiZm5yxFPB+UnZ3OUPyIxN/S32f1D7xz?=
 =?us-ascii?Q?CbU7RcAQibgj8TCmZobCnoMiXXEY8u0NplJQhM62x71tkZgTnQJaVyLV1VAI?=
 =?us-ascii?Q?0XTOj0QuFLVwdEG2myF89MR5jQZ9Ed+OX1+JD/M3TiB7XmCkmXt7tfXj4W8x?=
 =?us-ascii?Q?ApLuXVW+WusfzuyMOu/w9lP4tdQaJXBheo8gJwghpRWGWqyKnsS2XoqhnLmy?=
 =?us-ascii?Q?ipl4nBhCiS4aUsvNWzdsHTX9yYGSfJdQ/lkubYczG2yp9kT0rzmyZjvr4i8y?=
 =?us-ascii?Q?kF1dXVlfIVkcVo3wO3VRAFmsE1LYnhYpkxLIUnyeJ14z1ku1KpswJisrV0sl?=
 =?us-ascii?Q?KQrbcl18gKD71dSOCzBc0Mcw+EeMvXEw9GM9n9Ca//p/3hweyb4pl85yR+0G?=
 =?us-ascii?Q?XeZbiSGBvl6a/GDgRhMKPF1Zccxo5TgqIPKt5tUAObL9lVIxFJso4UDWfnNA?=
 =?us-ascii?Q?cSWxSVDe0yP0dJU2bPNGj6eof6gzGwzfg3hUcNGqk4R+GCFR1ZeMRVNpw8JK?=
 =?us-ascii?Q?A1eF6TY9h07w2HVtobEl5rxi/x91rvHGcBDJWxFhatazuOkANwPNtfxqtzaA?=
 =?us-ascii?Q?+u3H7JPsmjJop7DSq30UIwP8SQJk8J7HWJxqeqscjlefinOsoXl/Gaee+3Eb?=
 =?us-ascii?Q?9STqwIf88X14rP8cA3myHgFDll0hxMKIZiTWzulfdTPSPHiXIRwoJefaDvMZ?=
 =?us-ascii?Q?fj02FII801addoD3UrkDnxnqEjkRG2LJtr2iJpbWL8n0UYy3RFc2YrvQKr4s?=
 =?us-ascii?Q?uFx332DjNEHmda5RRutrrEdEXacesHyBeXMzlFMjdj8+d+6C7IosfItKB5Vu?=
 =?us-ascii?Q?TaXxO3ikXh3xACgak34gFpKoys2FULZh8Wc3crVNeWD8kOAVcnqJQ1kuyGKb?=
 =?us-ascii?Q?jdpvoOGojyze6eTzxxH4jpgYFPwUQPwVuFIMYMDf316XTyGVqRUc2cBbuOXe?=
 =?us-ascii?Q?Ob9S7JhDclvKFrlin5usMs4wo8Tq4hVYQnNqNsH20Ys41xU6qZHRKbxS0Gsl?=
 =?us-ascii?Q?f4jb5YYSXCBTyDruTFS68vAenWzFGRtqaqoXLg6BtJ+W9DloIgFx9I+HZTz3?=
 =?us-ascii?Q?ka67WxhkCXV0EUHOk8SO7U4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b7cdc7f8-e252-4ed6-e1e4-08dc8e85ae6e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 04:26:38.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f5GcIM7JQfZ33QK7UBDpPLDi7RteG9yJmYGOZnsibVDR630JaySxt20tdN9DzCDuaNYiT3BedswrxMek5tHTBQtm/3pH4XQZTjYsRg7l3OCPCm+XXON/9ruPXjaNC2ge
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11808
Message-ID-Hash: Q42KDYV3MZDYQMI3SOKABKPVNAKP7RA6
X-Message-ID-Hash: Q42KDYV3MZDYQMI3SOKABKPVNAKP7RA6
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q42KDYV3MZDYQMI3SOKABKPVNAKP7RA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree property to define auxiliary devices to be added to
Audio Graph Card which is already supported on Simle Card.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 8eea81888758..be5a4ebfddd4 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1398,6 +1398,10 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	simple_util_debug_info(priv);
 
+	ret = snd_soc_of_parse_aux_devs(card, "aux-devs");
+	if (ret < 0)
+		goto err;
+
 	ret = devm_snd_soc_register_card(dev, card);
 err:
 	devm_kfree(dev, li);
-- 
2.43.0

