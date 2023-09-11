Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBF479B116
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E964DDF9;
	Tue, 12 Sep 2023 01:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E964DDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476260;
	bh=Mg1XqPwszpOF59vuPtvbX65pjFq+HMhxwqsVeBnv+l8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0Q0e47pyJ9aF1f6ce36G2Fx8X3Mro3SAnbPbZHvxK38pbKwNafkAw1sUEpllwF5N
	 QzQHzxT30AOIGIL7YBBIMt9cpkHn7BF9589i8qeCe811GXCokWYiDGENJVpr/c3Z4u
	 4UiBWHSPAxF+K9HndpNbKwgN/VthU9vD0+j8qpmY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F93F805E6; Tue, 12 Sep 2023 01:48:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B19B1F805D9;
	Tue, 12 Sep 2023 01:48:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A47DDF8059F; Tue, 12 Sep 2023 01:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10723F80587
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10723F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YFomxmeK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDYPIYXAMBx/e3+tmIq+jlwREmse9sBMTM1jrdSikg6kt5pwZEI3cNAzttmbYj46dDZuBKYJtvpq5xxHRl4GjqaAra+td2jyIAfEYsfnEyHzTzIuNvJA0eXAN2kNQhzP6lgwQZ8iTmBZy5eQr/uT+0Y4koNWBOLaanfV8VMctWZ+Vjav6BOixnpdJfxrsi4vzBb9PK06BcXloV6uZs4lJy0K/9eJbok+lz2a6g+nhv81NM+JyBXmGZOeIj/+8pZVN5MVhyKB2MxR4xS108A0iidPgnG2YMLB43zUfWvbJjN4++g+yjnyizGJK98Rfi6YH3nENJvuE1Sv+Dp0ldkpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ9xgw+7GoSduwprRAow0+5fwlZ5NLGXCZ4eEoEzrW4=;
 b=Hz9InIzRS8ueLqb/qRJteWoHXwu3to3NDZSAxRHhne0olbyxOPQegjbgRck+tEEwO57DDsCenWuYbyEyDK/okNWV6cK8Cp/n7YBoVc1WWm18HVLtcLGDACd6+N4D4dw2oE+3xe3VoA5/saIxxuqbTfFpPapiS2VM6rhgaZZ+unD1P7rYWyPwyjTRyy3MuQ4+B0kMiGih7sNAoShMNaHsRfiVU2wZKULNnRkHjvY7CrCrNXL019RvbX/1YuZQWrjhymDZ9W/LdTQjgbuluuComuxnczo2B7yfIx/bCgwjd5aK5LAOLYgru8xKAi+7IXYrSVFBfmKPToA5lwx6ltpVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ9xgw+7GoSduwprRAow0+5fwlZ5NLGXCZ4eEoEzrW4=;
 b=YFomxmeKWrIXSul0nPwtHcUtiV4+lt2AJz3fw8yOLMJlD0MtG4MCVsBP4a6WcLNcr7H6cE21ZsCE7a91vf1ooMsWGqBrivHOS9hTXee2EPB9wflhHsitmLl6XeHxcZc4SIfO2aQoTAevfa8AtKG6vyqvv4laR/zehA47c5BR5PM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:48:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:08 +0000
Message-ID: <8734zks24o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/54] ASoC: img: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:07 +0000
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 25818d2f-348d-4fc1-a15c-08dbb3218cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uBNm/XVHlDeu0QgGw4+hLNo61dljEHPbp+cJ5aZnomQ5/33y4X/2Rb7riXTMXiU61mU1pLXfNlcmaiw48PO8FRFeWWfwku0ziHFI4ZiSEvVHh6e9VFDpbiZot/UD6zMXSM4MqhdWpb8WNppXDu8qqFUdo8DVwYD5udMpmopCCbR+noYgW5pJb7+4PHrmVe+kViyQ0bqrOn+ROcvt6bKhrIwoTSeGXejhdrboRJPs+hvoTqeJjAGx1tZQ0VpVbKpPEgTfGudI4O/8LkmMovwoEOGJG2YgZyLJPFAKX8L8O3xmskRW6h4GiRqmmsr5qF+e13lMEHkBZg9M1FJ+fcwHEbj35Z5O9c0trl4B12cxCCweBS45etkIZVfhpnepNHcT6NkDEpkT+OoyT54JXSsd4L92qVVNR9gnwxO2ubQ2d40poI6rxUSBdGZdOp4dIKIe5YypmRN/ZRj4qba7DqOG1Ur8RLuibCiWU9npd7esy1yaAieiyk9dFg593EQKdnz9NQ5P9BRUmeDmTZ7rP7ITBEwhkb5Spjqamsc49krT5Bda+E9j1ziNUIQ6sV+mUhIza+DlVYcLkCuyJom8oV9w9t7XYi2mpzcY6FoAP6topcrGe18NyfXzC9BwIOc91zFYz1v+Z1diAWCycdKOEOQx2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+c6/WlA/FKgutRQOD9mtracC9COwgysPCruFGku1Yh6txRyhquTjHPu+SykK?=
 =?us-ascii?Q?AT71rdbo2KrXMTiLiWkoFurr29l5w+lIBufLmZNDCdz6U8XZZqWoWLOb0qWE?=
 =?us-ascii?Q?FPiPmPGkUmqwAStfQHpAJb+zf2oRkf5dDCey83pyleLq1fl12omPCEjQxBkq?=
 =?us-ascii?Q?ddEoXXHSS8QQCpP2JP7FDqhbzUWVPsQjbp3D09OUxkn6wjU8RmWM2O9QC8cd?=
 =?us-ascii?Q?PxBbH0WVCrUB/xvxOh4ObyhsZGFsgR5gHMk30UO0Bsz36V22ECDaBQQd27R1?=
 =?us-ascii?Q?JfgjlwA7e8e6ljlI2dlgLJVb9sXamN3ZGK1uDlp4BFiYDNLEgUoMWCzo1arN?=
 =?us-ascii?Q?x7cGSgoUMVRlBvyYDkjuwaVHMpPEl/Qubg6y9sNzoCC0StZw7gvWyufJD7Fy?=
 =?us-ascii?Q?j6TVKxg+ULj3c/YwzdTu1Q1PglmVVSiu2SQWdaLCfHpPfj6GLf424OvkWR7c?=
 =?us-ascii?Q?W+eIvSj0rNPz4KqC5IIkv/K8ELB/FgQIxBCabcxrBaJfLdywdpvNDGM2T6C5?=
 =?us-ascii?Q?HxnTdjqsIfwzmfsMUijp2aL2uClTTvfpDzSNGZSALUfrbeuYq9FMC55pLM9v?=
 =?us-ascii?Q?HApwMROUBjyxpXqs/nGt3gqh24s/hrijqHfgK5KScxDYEGAhPZuo7UbRCX+5?=
 =?us-ascii?Q?hsq9cXUJ+SMmqX9dB4tSENeSoeekclp+jsBt0pmS5J3b8AkjIaH0nINwsQ5O?=
 =?us-ascii?Q?sdOLeeBQ08P6lz4d4PIOmG6IMhReDyxeFWB//AX22nnv740lYhIMyukslEKb?=
 =?us-ascii?Q?5EVo3YDAVbTcGFOZZKcCgxGV7i0HlK8djvQq1ujt2AwSgndJUICq7RDPauMr?=
 =?us-ascii?Q?VA66oIXzG3rBhIMUYIHn806KZ/A2WVEgm6dbGhYPE5vsQmjfOs9+/wMhv+6G?=
 =?us-ascii?Q?wbI/+BC/JNJudPCKG3zL/F12yKNL4gGRJHNRSyVnUJPTEltgcpWueXLpkZ5+?=
 =?us-ascii?Q?v6pekDWn4uumDuACDaFSO25LHkD8Iz7F7Zqp88x2hIKwd5GWJ0iJg1fZ5LB4?=
 =?us-ascii?Q?UlcbCyYDrmJhH/VEuMmfCNp6DdKjkACFftUqEaHq+J6thS9QAsV+eXEUESrZ?=
 =?us-ascii?Q?Hyvd+rIIxa/juEQkWFYqGq7LqOBdkq2J5E/a4eLOrQZEaBA10AViDuXZlec3?=
 =?us-ascii?Q?pIMPJ+uDaUl7d6jZwtrbS33TO03LRc7vGBLZZQijdpzPGCypy/g6E5DhOKmK?=
 =?us-ascii?Q?Zb+lm7tosTpwBRc0pYHex+wQgBim4PV9Eef8O+uoxFs1CTQ442JhohT19H0z?=
 =?us-ascii?Q?4On+VbsAGYjmDbka0pddmD/SP1zA0nKWymUJcXhUaMse/YKFM18IVrRk8BEp?=
 =?us-ascii?Q?IVqoaDsQGXlXmIlyBUdSx4DYpOQa+LOZGU3nQC+pCa9+dddSB5SXniO6KJCD?=
 =?us-ascii?Q?0k/68FPKrBmAOI+VxYV51FVqG3IdkTagg8lb1g2cDlKsBBAqVKyvp+/IQXri?=
 =?us-ascii?Q?W8O7WmyOUZtZ65fb+3yyiNUQc5vvv8QmtxHONNFPF2U5EOS6VrvORYAnkXjG?=
 =?us-ascii?Q?PQ6dvAeWQUhrxbmCgxiCZ+n5GKxspqlJeD3qakWeScNGw6hy6BDD7UnPhF8S?=
 =?us-ascii?Q?+CBgh4ptlXykgpHkjaBVvVXRhQYzrQeh7we9c2f5pZM6J8yDGNjJnTBVE/wg?=
 =?us-ascii?Q?xzHTBCJaYyO9YLU8fIRolmM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25818d2f-348d-4fc1-a15c-08dbb3218cd2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:08.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KDQ9LDwrWBrFkh4PcqSdbEbUwlI4yB9QhcX+6SQ7zn3s2XmFhbGL2wqZh/YSksvkq4hBXRZ6G+1JQkVTZGaBoV77vWnkNWWIqCTEzkjwzhNjb2L9eW1tfybcKdPB1l01
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: R5YP45EDGXV2JBVJCTSJKDHZ5CE3GF42
X-Message-ID-Hash: R5YP45EDGXV2JBVJCTSJKDHZ5CE3GF42
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5YP45EDGXV2JBVJCTSJKDHZ5CE3GF42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/img/img-i2s-in.c  | 2 +-
 sound/soc/img/img-i2s-out.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index b6b6339c164bc..dacc29fcf24b3 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -399,7 +399,7 @@ static int img_i2s_in_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), st);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), st);
 
 	ret = snd_hwparams_to_dma_slave_config(st, params, sc);
 	if (ret)
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index 41ea5ba52181e..f442d985ab87e 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -405,7 +405,7 @@ static int img_i2s_out_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), st);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), st);
 
 	ret = snd_hwparams_to_dma_slave_config(st, params, sc);
 	if (ret)
-- 
2.25.1

