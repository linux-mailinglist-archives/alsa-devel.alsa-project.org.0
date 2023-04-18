Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5616E55C9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 02:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 669CBDF7;
	Tue, 18 Apr 2023 02:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 669CBDF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681777546;
	bh=B6pMiZIuiWj4gHxFk9ROuez4bPCBeko7cVhaNMuDFSs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kJAINWtR/+zzb5GEmum3PbXxMmgZXn4QmxdRD/lQ8RYmTufuR4HkY61r3A9vLWH90
	 n8IKDTkVYXXlopIE2fkcYncF2JWTg2E+9ilX+ZN83Ca4RcrqMo6X9rrny5/jKDd6/X
	 soXj7n2HfCPLTIJ9hDD78iGBotRXuPnCtAztYDO4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 165CEF80149;
	Tue, 18 Apr 2023 02:24:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04880F80510; Tue, 18 Apr 2023 02:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9306BF80149
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 02:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9306BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EJlSjfPu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfKgWturI32xsgkxwwF7CzSK11YRF0DfvCEtm43Ee6NLdgAu7KTDNLavd1vJkZTAmsJiP/SbcErurrqAudcBQfSgyItKT5n6Ky84awGPAPo5/rCtLF737V8vlRCTBC9MxhA355OjGyzYK3iDuObFDzqCMKvz06QEOnbWNLeXu3KpqGM1BWHDRjpm32+guduphB/DllTfSupJvIM6VJVeZshdRlMXstxyI4PFGlDmgRgVE/xjUsR+JzfuFaln5CEaTZidCHPCBm9XtXvbHy1eHGSsRwmeEoKSzYKMIFhugW5j+3X8u5oI2KOrz17bUA0F+rO60R+aCnto3Nj9KueRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG7k8UGtCHvZZMsM3BMgjlksc9muxPdsnEU2Bx8IXzg=;
 b=VX5orOXH1Ok4SHKTcCwApmugb9++zuXBOFs/VjLX4c3iyS2b6+MUTqwBzkM3Mj8vQe3nz7p4uHz3OOcOKI4g9QngZYpDVhkSbVf+fMPMtyx413SxipQPeSgf0t3q6VAVXfcLaMeL0ZaqgmksY8xuvbHRfcoEpMkgwJZMHxs+fqOGNpIYMIE6tdso8JXy1tSHISu+S0qhcGdZSK3Urzz47lia1u6tBm/RsMRbG2jEc+YyblQU4pM+Wjph48g6jLPo3ErBF0hCx0PVVclyvUG7Ie0yET/Uwb6lnHRASSPjSRHiY1zvFHPc4/TbcFGUCFpz6Z9MKqi+x7GF8dk0t3MpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG7k8UGtCHvZZMsM3BMgjlksc9muxPdsnEU2Bx8IXzg=;
 b=EJlSjfPuXLzZ+1BGReh3GCkdxTXw5h5QtgPhW4Z1Q19YIBwqfU4JB5brr4/wgAEiNNaMMe4vX5EkBRzzcAU4rxc9C15sOQHmc4FgceCuLLQXWuhCHwQmw9FWU+pb3l2T08/3fSUGIi1dMNKVSQR30mlp8zwP0K5fytgn9jNKmT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8855.jpnprd01.prod.outlook.com (2603:1096:400:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:24:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:24:45 +0000
Message-ID: <87ttxe2g1f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/11] ASoC: qcom: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 00:24:45 +0000
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 1478852e-a3b1-4200-1976-08db3fa34fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ure4YBH0Bn735diYSCksfo12+2jsdAx7dUcdVIyiGCl+MNJSKI6nyWwUA67siT0+txjyXSikPr40QCRWkVmzgZ9TqP+4dOOB0X0pD+ZeQTpitvtnqJPwtNxIIWG96rBxXjBtsGpKM18bLkiiS3VxP2y7bS7dlMG8p0Q3qrJmIUs4GyJoyFknyQvVB3lkw8urKZhrfWRYUrPZA3HRQqqjTReJHlYSesjdMUPEgfLAstlH2ARdFJAwQkwa6mWlStl88VjaSYckkBali7kBtDdTqnOAMr8exCH8Gw0NHbAvVczUOVSzrqMNqIMB9mEymglCW2ENXGt2n+OtPkE145RivFUU90jqSOitt6+caZJNL0am0pQgDBse4D4EcGo1+hlXL16wR4st/DfI6Yi8dMAcfOu96Vz3VQADPkC7ZYRFEkUEzYXoVNq+ezaW598jJ/4YQhIj57rrRfILM5/w7Js4T7Rk3/vyCXqtava1iPd3Elv4E+VL0MKrLnkuODAx8rCUj/8DlSQVNRQgT/vsD1raYtIcZ6OdkSdz5qbwb2fG4dmcga3tk4/2ywLKvcv23hFOcRIzRR+YgasHDla2wY1VQC5Qu8O0qhO/Sz/Nl2u+HFsGjO/BvtXAqsU7p5oZezMd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(186003)(38100700002)(38350700002)(52116002)(66556008)(66946007)(66476007)(4744005)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(41300700001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sUF3odDAYxV7dFxcP1XHdXEibfBX2szf1WhioJXQMbAsPpjUudWYwhFDq6/r?=
 =?us-ascii?Q?erf+XhAWfiZqOGpfMDNpErYVEUEzJrOW8wTy5QpplX/QcKekwdf9f25fRyqR?=
 =?us-ascii?Q?8+VN/TgODed2bdjW0aBXiTU+b0LW8Hm4QtHQzevH9WFYFBAzrvluq3gTtxrt?=
 =?us-ascii?Q?zs1xVwd7CoqkxAHry8enyhzAjWBv1IN0CjwtSAzDvWaJCljVyrSjCSF+jHSQ?=
 =?us-ascii?Q?FR+7pwW/BR++FIUrxGMwyd4iO3I0/gkK2+EuyKwWbCitm0TjBAjc3ZzXDgEs?=
 =?us-ascii?Q?+HnfmWwgBVUf+1v9c0ZAtkTY/H+Xe3Tzil5zreB+Y5RayNUcqzscgEB3dvul?=
 =?us-ascii?Q?QtqxceiOArqGR5qg/h7ccIz7DbCgXNoT8DGrI5dwjKAqK56h3q7ZwBx87IBb?=
 =?us-ascii?Q?A+QhT0ZihLOTXEEMyH0YzkbYweVA1S02uIqfPHu3svXx2xOIppii0SwoT0yN?=
 =?us-ascii?Q?20rrCSc1o6RoYpaNVgOoNG1Njsh1ifC4PvtTmgmanU916MeJKPHrqOpe3SMb?=
 =?us-ascii?Q?jgiObeh86v0SMhCdShfIQxl2uIClFR0qqlfatpaIx34WznFoaLE4kGXPON7e?=
 =?us-ascii?Q?2aOu2K6jTf+6FTSIElnV296jnlTYObTJALjXxmQLdNsCd3hTxy4JUWWU6Hpl?=
 =?us-ascii?Q?hxv061s4NurXsCF5m6951SCVav/z/GOous6wioe0WbzxVov8cVwBUgb6ElmT?=
 =?us-ascii?Q?0Wy16DIXFp7AF1mc6qszxpi1YTLOu31S/gmyrmf5bPXnBxWG0eCDhbYZkhlJ?=
 =?us-ascii?Q?ayc7lkog9OUmhGUZkCTBVQX8/3QUhbNCih0d9iqiOYI25NI1/+CwCLWalQMX?=
 =?us-ascii?Q?C953Rrd4KL0pSbtWtdOYWa2BcWH6vZBe8d1MhJFvP5kSFmY8VGpwmp+q0+ut?=
 =?us-ascii?Q?IByR1Bg7WkIrXixPI5ta9Ggr6DV38PzVrPHirbSLtM6rA/mT84ShaegkzO0B?=
 =?us-ascii?Q?nIrmEiOkcD8pYdBwtpj2M5yl1U8HuGrIr2UcOrX9FD1+1mOclfA/3NsJ1A9k?=
 =?us-ascii?Q?J7jkKbZU4nXdtTZRDhCIH+Z6I3m9WSAsgq9tDhNa8EpgheOAh7OOxg0VPfde?=
 =?us-ascii?Q?YFsjLCZqJvFS8R52ATOTtd9P35DLubCafOS2Lw5wiTISaOT2u3+dMnaPxNA8?=
 =?us-ascii?Q?JeU/is9gu83+uQOPtuLG5A4cukUQJt50g8jiKG5vFQOrTlJMd9Ge0Lh5D9wG?=
 =?us-ascii?Q?d0cGZHjE85YroRutpFZhuQsw29XFLiZ/1XplR6c+25J/kGCD4IvY+29PqY0l?=
 =?us-ascii?Q?fE615oOVY1kLrNJKWdw0sxWA6Mkmy3LhEXsDyTLYvgjgaR1ZYmOkqrahzf5x?=
 =?us-ascii?Q?RccZ5YYI95CpSongy8PriEbs5n6+xS5ygNijzXAaWFqWIONHbLzbNDOORvu6?=
 =?us-ascii?Q?b9y9Qj58Yz77Qz73ZLcLJZXXCSn5ZGu896DP/c8hPRBhJyhi57NDVAV2RvGo?=
 =?us-ascii?Q?d7+kvzVwNd3dwFuTUOzsTSSbNVZyyyb/422z91/YTlYwnHsJ5Wd6/RpZqir1?=
 =?us-ascii?Q?/p+pEyND5riXEt1xrE0O5WZXWzKPPNsAIO8yVBjcuTNh/+d3hoaOgHn9TMwx?=
 =?us-ascii?Q?Py/DtnvRSWBeM94p1nLq4ojBKKjzgKiN6e4YxZqx0EqYsO/W95nTPyFGJB26?=
 =?us-ascii?Q?SkrdAKCJZPNCUIrPX5iXKeA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1478852e-a3b1-4200-1976-08db3fa34fab
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:24:45.2877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xzieA9b7rmzuG5Y8xd28MZIVVVqMLS1azwmLyER3nQCE+uF88vkQIPaOy9WjWTplGA1tGwZV/+tBMjIkqathtJPamz20A6pS0zv75fcunS0oc6yvAzddjGB68CuF5mYn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8855
Message-ID-Hash: H6T236TM6XVXHCFGUUX2NXWEKJDWTHYA
X-Message-ID-Hash: H6T236TM6XVXHCFGUUX2NXWEKJDWTHYA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6T236TM6XVXHCFGUUX2NXWEKJDWTHYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/common.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c1f24af17506..cab5a7937a57 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -140,17 +140,8 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			}
 		} else {
 			/* DPCM frontend */
-			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
-			if (!dlc) {
-				ret = -ENOMEM;
-				goto err;
-			}
-
-			link->codecs	 = dlc;
+			link->codecs	 = &asoc_dummy_dlc;
 			link->num_codecs = 1;
-
-			link->codecs->dai_name = "snd-soc-dummy-dai";
-			link->codecs->name = "snd-soc-dummy";
 			link->dynamic = 1;
 		}
 
-- 
2.25.1

