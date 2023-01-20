Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6C674DB8
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:05:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23362DF1;
	Fri, 20 Jan 2023 08:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23362DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198330;
	bh=vsculmxc1hx+N+BUkp7cdH3YTKpGnSwK8BQpqfswg1I=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PDgjubFV/diuZry4KF5SvRh7JlIpZN1De0oltlthBtSukVxHZAEKmYMMAknzGMR9m
	 E76yPoYoSSSEMpxCzXEmT9a5+CFPLW6hSxZLvVwJXTaJxBdTdicS2avYsLAR8FiM7r
	 LHVpBJRRJIWiXwEPHENx86TEcnv7y3rrZjenfuaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D06CEF80482;
	Fri, 20 Jan 2023 08:02:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B39F805AC; Fri, 20 Jan 2023 08:02:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CC1EF805AA
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC1EF805AA
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OZa/pZ0L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz4a/iF1qsqgiTjfNtXLlKksMrlWqK5hlECqDpdmpMUr18GPANn6imt9PzOKG57tgd5rTVs/A4evOva1tTxnfF1O/Q0t+MOnLc0s3X2by/HL/ouwyfBR+QAi6Ki2h+Rb4TLw8U/OJW8ZjSjc5by3T+yqWMCRV9XlvfrkXP0JIy3KYYp/vnqmhPdcdoWt0kKYRg8QrJ5DaZJleF/j9EsYFFJrIkioqBEolgYyG9bZWgyc4dqmN8E0B+QjT2bee+/daMgotCVG65aYURVjG7Or8DDnIWQT8an4j/Gfwi3sbkTf7oKjidBCJcHwvtCusyC5CvNiTnkNWsEO19HPma83TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOk8g/8a41/vqaOtTcIV6Zv9DYWHXY+9CUH4m49GtDs=;
 b=Sf4+stKZq3zSHF9SCyGlfeJ2eksCeW3CGCcqMxSEymvxBPHy8duQd5IWov4CfpHn3kCfH1pVJMgYz0slpFmSZFn/4cfilwbDcg0/4OBhNih0mlKi8NUdxc5+oHsxtkWP19cdUiX0ooY4aURiB7Jcm3Y100dU3s7RGMUr0+lY9RScnIP6sr4s+Xie3zc6fCGdT/5fcllHY6zVzP+51mHHthevQuzPb5gcXn1rZAGnAoEftZkM/t+ixCcvOPIvz6I9QG89YTxHs/0h2n0j5SDxhQxYaK7+N6UfMZKjhKSrZI0aocmmbqkCH4ODRaKUIJ4J+4p+Ir3LtpZoC6VrVF0ELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOk8g/8a41/vqaOtTcIV6Zv9DYWHXY+9CUH4m49GtDs=;
 b=OZa/pZ0LbjjO5H4n6PKEdJh01uBhJKiD0hVw5F4Y9IPMa4qq5kk4ZJQOsjSgXDRuXIoIZvXAV5HTZodiZMh9MWMb9wC8agIM6wTufWkMVmynn8zd/PR8daSpHRs714u5ktJ/GE1/nmZCS1BtcEh3GlLY5xam2b5hmiO2dsusghM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:43 +0000
Message-ID: <87v8l1k7sd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/25] ASoC: cirrus: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:43 +0000
X-ClientProxiedBy: TYCPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:405:1::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: ed91e701-bfde-4945-54a2-08dafab453be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SsfpfBsJOHGKSvZ5HQmDzQ+WdxEtl5WSFdaTjp1aB2qp9+p1TRPYGdhmGwBZH/dKttPb70g2bSVv77TsyGPmj9qL5iU7kYycfgwkXnrS9mcLj2z/+dfJStlJaUIW5gmJ5ocbtA7lll/nBNtUxnXUz4IMpWr3XmAQj5VzMLZc0tQp9p1jliUebgCjnzOvBUzTF7X4XlNEaBdal1/dVwY7YyH166PsQiOaucCXqFH2yh60Gwgb6DCU/dyyM4v6+f/UledtUJz47yqzqmhcZNmJzWSScUk0LFudxLnL4DiiqPFcTlYTFfGiVrSVsUxqlvPt9k5yAxF7ZeHQkmFkkY578RtlJH7mMzk9KUbr9Mu49dBv3qnRxWyHeOCQ8gkLilqSfNt4MhZcfiepr2VT9ZJ7bQLVozv6l/fj12YJ8QJdgmVURJXn/RnoEle6l3yuT/Omn6hVTW+O8bR6v+F7lERJJp3c+DKKT65ZJJeh0cNeUZtdpvNOxd0UifEIDmKEeu/7ldZuQSCtvaMLHf3JVU8xdTUNcL3EphAZSG5L9T7Pw8Wzcjn/+m6foVRQvFofmGSlklrJy2F13bgZloVItXrG0ZiM1vQNAxGkR1Wfy468s7kTJ2WeuPy0D9MC3ffPRBWmtKhT0sv0b5n1KysgtzxiYhV78Oxt5bfklpEBm+7d+U6d5mvA2qI2d/NcR3wC/AHbhO/TbKNmTkv47AfPWLGgyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0prfa0x8W4X0WcaISmJgQszWcZwbm5rbq53FAOel/1AHy5YENPoYBXRd7FQC?=
 =?us-ascii?Q?g/X4csMVi3LLccDM8LrM/hzvPUnrteAwQpIpiWiahMd4DR5otYzxXcb97Csc?=
 =?us-ascii?Q?As/1A22H2CvhwZi5By+m7z21wtaCo1iahm7I7CA877AyZnsyVgwdEEgI1lg0?=
 =?us-ascii?Q?Hts5I8ueQKMbxOZbt+QuCXvYIhSkMBKy536n3OBoyhUQ55FE0y1VgFdv1Axe?=
 =?us-ascii?Q?r7XTy8Ja4QWO6OdmJzIzCBK7z6wVG5m+ylygBE4UkGL78XZU6JvMQpidCPJU?=
 =?us-ascii?Q?v9fn/UfgRl7wb8fOESJPivosqHOZcr0awEFOKbN3YJGor2BRp8xvA+eRkwiA?=
 =?us-ascii?Q?smC7n3euShP9+I1JZj7y3L6n4K7T4G9NvfJsga7bYnjf5tVRwCpkJ625fBtf?=
 =?us-ascii?Q?OZ8D9rjuBk8XsOJV/nGdtc21LoV9fkIlyiCZ/kQjiQHMY++6wmv8qufVPOGY?=
 =?us-ascii?Q?WFuuFe5aoYYN5UNSjZnANP/rsZVgOd3cnwA/Ds+u16liPO/zJ0Twpynx7ZBG?=
 =?us-ascii?Q?jYjKefuxihUE24J+B1kb59Z/QfrzGqm/NWaa1PLylfnd23EckKEL5UbkIPAr?=
 =?us-ascii?Q?RG4jUS6af3VhiNHZAWKBMhzpmi6SOYxZqthuzO89eZ0V0jqzW7eIIR4jthGk?=
 =?us-ascii?Q?NNjE9X0uS1FTXLZ1d1f1NW3/Ezlm2dkmE032ru5gWTRuxDTwu1ggEFjEUIrG?=
 =?us-ascii?Q?Zxi4eNdWomaUh0pFRI7MWjDZKd4gbvb/P+FehRZ4U6Pl3sX0a7jxjPXVfGhs?=
 =?us-ascii?Q?FfiGi1aFLuaMavlsvhkZ7pcNw4dD9qTnS81iq7YgJlONMZrQp7KL4OecBPt4?=
 =?us-ascii?Q?ZL1mXzdAu//lYEc/vxzbmgOX5aWNRHr5KctI2yXXgZieWxaFULHcCgSepbnR?=
 =?us-ascii?Q?BELq9GQWCCA6Gymi/nJDlX8jEFN7ixHqaPyqhdGRe3SCoKBdx3AAoyRAi11T?=
 =?us-ascii?Q?AuIHHeObsKE+Zo5BFhfpuMIQeBcNdR3NvEXNcFAOEeS7oaqsq0ECsqJBrZGl?=
 =?us-ascii?Q?FmGg8sb8Vlg7+uaIoB+pZrBh05DQcqHyF2FreFiYRzKMipPhy/8AA8Af60xT?=
 =?us-ascii?Q?3DX6QMFKjbVKlZYgdLO6b8JEk3wNG0QamPLnmsJhQfpNyQ4DtNRN1R+2GCXQ?=
 =?us-ascii?Q?Lg3ImUvASwxTDlLb3UclrITLB7HrSMtdNaiLgcWx5xu3YlKb2cDa/En231Mf?=
 =?us-ascii?Q?X7+MRWFMKtgEJFG9af5rk9gMGePLJNduS7L9zOw753YvJYtb3FlBigQzkkmJ?=
 =?us-ascii?Q?lXMOoYGpNxWw17NYllmtpkJtVQLXsUYeDgyYYQUDRJlQbh2juudwI8hcPkrE?=
 =?us-ascii?Q?1Df6AtXMJ5jz++4s7Qbv3H1n+nANbnVhWvJZDWJ5SZnnFsQobhid4AOqwvM8?=
 =?us-ascii?Q?y5NaSLF0Qr9Gwfo1EbRO66TeLZZS6QfN4aemU9P2gJctJEYPmw9BRoiDJQ8R?=
 =?us-ascii?Q?IbtrkKRZNVanslYQMwQo6Edo7x2LJT/oZelPd/ApSMh9wTJVlMYbukqcUzjZ?=
 =?us-ascii?Q?WaU4+sjOLpMfkVq3NMvoPYNHztCrn/2J+9jo0i8a2SnfgK+oMM1yGSAC6Lz0?=
 =?us-ascii?Q?RM085tTPkuyAni88grEg6AzpKyWBGhQKE6HdV4LWs1rgVNp67sl1RmzuI71O?=
 =?us-ascii?Q?Azue1SMgUkgzXPET+3f4fOs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed91e701-bfde-4945-54a2-08dafab453be
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:43.4260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjACvbuOBEq9Z2ZiAofAdSVfCBE15ueGrE4FMNM0X0xbqyj3oel+2VPRINylVPy4SFINhzqrF/j7v0PFjHsJBpR4bjiXwnC29BeWXvQevbk4pFfA0Nz23gx9CgmSAm6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/ep93xx-ac97.c | 4 ++--
 sound/soc/cirrus/ep93xx-i2s.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 37593abe6053..cec067c91a0f 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -323,8 +323,8 @@ static int ep93xx_ac97_dai_probe(struct snd_soc_dai *dai)
 	info->dma_params_tx.filter_data = &ep93xx_ac97_pcm_out;
 	info->dma_params_rx.filter_data = &ep93xx_ac97_pcm_in;
 
-	dai->playback_dma_data = &info->dma_params_tx;
-	dai->capture_dma_data = &info->dma_params_rx;
+	snd_soc_dai_init_dma_data(dai,	&info->dma_params_tx,
+					&info->dma_params_rx);
 
 	return 0;
 }
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 982151330c89..8265173a7932 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -202,8 +202,8 @@ static int ep93xx_i2s_dai_probe(struct snd_soc_dai *dai)
 	info->dma_params_rx.filter_data =
 		&ep93xx_i2s_dma_data[SNDRV_PCM_STREAM_CAPTURE];
 
-	dai->playback_dma_data = &info->dma_params_tx;
-	dai->capture_dma_data = &info->dma_params_rx;
+	snd_soc_dai_init_dma_data(dai,	&info->dma_params_tx,
+					&info->dma_params_rx);
 
 	return 0;
 }
-- 
2.25.1

