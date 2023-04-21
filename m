Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB3E6EA07F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 02:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A2B2EB1;
	Fri, 21 Apr 2023 02:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A2B2EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682035955;
	bh=E4fgPsGfE2hWP6xmMJO2g+zYp3y/aZZkwWDe2Ej9ku4=;
	h=To:In-Reply-To:References:From:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jzpNtZHBW2oluu2FdHr/IO2G8n2eK1b6ZjnejxZA28IARroBjQDko3sjDGInGgNTT
	 jAzvO+Q0UhaCrJb36PzD4rhJMZql1fW2x0WjwRMMg1SBM21WQMKhQ1py2bm2r0qx36
	 LKTfQnQiR5w9RZ8S9lPZx0sUPUQ1FpQYanXx9vWc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ADB3F804FC;
	Fri, 21 Apr 2023 02:11:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A05BF80510; Fri, 21 Apr 2023 02:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 639FFF8019B
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 02:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 639FFF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KsKi7n2B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSW9Un1EJMag1O7Om5eIlnlVby166m5zAe98P2l8svprUGAtUhKBBJBd5mMqe6F5JBBssPB2XI36aLc4dGr0iPZ0f/qDcM1PTwFoQ8ybd8KDD4PpYp76gOaTfizYbdwLe4pZWu0xBl6Hd4doBqvTMye+tvPU6BYvcxHoutcSd8+QQNsuqQV3xLp6uZu0E0/GEF3ZvkPry5hsgSe9RUN8CmjX5oP/uIGf8VYZcHqHs+T2Mj5uYw93f/oN4PXDgm6dkepU/s2arieNFCrdPxKlB0BmVw4NYNJ2qG7kDw3UEKFZJACb6s4qem6ttxuBZHF163NI4QE3z0+VvKWJ5D8bJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE5oVZgAk1D/PHjJcbxwDmtZ7r+kHM5d/Ob/eN+14vU=;
 b=O/szZI9AsGpoeSAfOyydV+jfwPfAc/CfOxjYXtraSPkNQdV1KPIC0gX9ZMoQKfkcd+3i27RIPEIF3SoKK/LK2/sc9dP4t1R0WEAP3mQQCdbKwsbFPcFNTCSxU0qEdtMvsFTxOLeUZoAKFTpeHnnvwWcszzcsU7DGRHCT6dvi3/OdyQ36eVWohd2zejg03mSkQ1Hc4xVKhxVXVW+T4CHc2S+uThz0t5p5LGt25fuWzK4BzaLqG9pLFU4TMN7ue/fvvrC5kMlka4hB5OUNk2nNTsgL62uFNeX2zpZoFDYGjhIBlvlHHnOPvOk1Zj6olwu8jPYO/pGgturnEbgM0PhAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE5oVZgAk1D/PHjJcbxwDmtZ7r+kHM5d/Ob/eN+14vU=;
 b=KsKi7n2BZIEhHyzEeqyi0sJvGDagnuXWN//7vpY+vIwbSk/Ad4KoBqD5AC/iyF+fxldd9aD33u5v+KO3d+nd8dVkfcxy6fMTP18PkxCIBtCIjizulWrmn2FY5irH58hT4U2vrhmXSQNrMTBwCaI4UdSJLJ5Wjt0MdzR6P+AKE4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11167.jpnprd01.prod.outlook.com (2603:1096:400:3f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 00:10:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:10:56 +0000
Message-ID: <87bkjif628.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 1/4] ASoC: fsl: imx-es8328: cleanup platform which is
 using Generic DMA
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 21 Apr 2023 00:10:56 +0000
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11167:EE_
X-MS-Office365-Filtering-Correlation-Id: 55263f0a-1213-4a5b-a670-08db41fce0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1zNsNmb0OX/9dv6wkCahrF3lMqi5apCBaGCaqozKaHAyHJgBScAdo8TpJR1R/rSL8tNf3wBNKvJ2/rvfZrNvR4tv1Zygr3e2Di8Xn9vFPKCsmGXW+JIfYTT6R+UhgvV41UczDYitB5xPFaCkJ+g8C1UWSW8NLtMQJphbTsZ/MkWxVg2Eqbegb7pHkBWZla/2x04Bz/eu8L7VL6N6gu+0V0/9iCHliLfXflze6+udx4l1L8rCCOzNfCgTTxv7i5LsesIi0fdWwATjB8iWYgqMT65XWjwnOKxAbjlPgK2YLOqcPJ5klmGZeQlFxg9FXKEaEz+ZJtOW0tjonrpiIIrxGY2h1sbHaMBuJE0b1xq/5i+8B73i+s3gc1UvaWjhJ3o7ZIWkItRZLYnqIY0DevkNe+XzkpviFwJDuJWK1UnwM+C1FeF7UE7shk+tlRQOo1qEm52ModVEt8CrLBAMq2NLFy2uc5OnwEqkALXU41yP1Bn3yN0WYdnQIRIBbXwJGf1TMYEXePjofM814qNUbtBQj8Y3RhQdlbV5LMWC8MXkTwTPCximrZnLiDAxWIhwHpV0D77ii038ggrc9uu4VWO0V482SJG/EKB5m0wuvs5m+ZeEs9qcQQM+JHdWYIxZGP+mhtt7vTCpPp3CpGyMSjSiVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(36756003)(2906002)(38100700002)(8936002)(8676002)(38350700002)(5660300002)(86362001)(6486002)(52116002)(6512007)(26005)(6506007)(54906003)(478600001)(2616005)(83380400001)(186003)(66476007)(66946007)(316002)(66556008)(41300700001)(4326008)(6916009)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dB1Me6IXTQPg3anh+9b056b6UZ/0vGC67kzgbCLQ/45VtOiquKBgMuhZv4lV?=
 =?us-ascii?Q?mblcRQkDXPpikHm2rhdKLPcZHua1xqJQYD4SIQJNSfweFkaUgG/bP+HnYx/J?=
 =?us-ascii?Q?KzKRfxEmHdQlauxd5NYmBhYI2fi76O9a1jjKkUUeUd1WoxgZ+hedkfODu8ux?=
 =?us-ascii?Q?6hDmJG4PP1oMbfMk88qKd9wqjQDJB7hXoHcQCqvhCBfM3zzhC5gjSdDRXuww?=
 =?us-ascii?Q?xijejCQlAXYHOyzZAn2S0ozoELBOuJ9M+HUFGp8np3F6lZ2N8JfyDyC8Ut0G?=
 =?us-ascii?Q?ALEkj+QWLJDZ3pC1otxtLG82TBT5ElA4JE5SinOqLWwAWhKj6P8Cpbe7UWhb?=
 =?us-ascii?Q?WrhOkauuZeHqcV3WX2D1PfBeZ0JOmtu54trZMcLKNbnNPxX6zaDATZR3vR73?=
 =?us-ascii?Q?PV95/eFxjb8It0Hbo+1sZxvUXOFzbp2FwEoZbYBL/G09mr9nom5atgpiDNrb?=
 =?us-ascii?Q?zx6HfAScCIAVCbZCmDiwYoSixrIcZcutuTP49a+bW8+TcYSvzKdeYPdjagdV?=
 =?us-ascii?Q?ap9mAcpf3f7Dz1aNvX90Z/PNTj1f6W6ep2DCKqBKiGak1BSjnkLdrneBpkSB?=
 =?us-ascii?Q?n1GlmcaJ3SyTqjbEmTj49o4Bpb3bcw4chuauJeNoPHFnjgv13YJ5lsUfJB5t?=
 =?us-ascii?Q?gc5c6R4ZEwCgWNno9fG/GUQrbnVX6fze5KihfajkBt9sePZnNkZVdp5fiJYo?=
 =?us-ascii?Q?PxjPUUbeeEpCfUNXvYo6PTbLpNcQcg3rxtB4WylMJEG74RPOUjiX2KcgjwOO?=
 =?us-ascii?Q?9Ql+J5gGGeiy+XLJl5OPvxuG9zsAT60AuBj9mowplJkFmcNCM0csQaUP6pla?=
 =?us-ascii?Q?9yUkhGV7kZX6f1qc48fzqS/xVoCl5YIoFK7YbjP9rFUPX+IWm3R6KUPqP/NJ?=
 =?us-ascii?Q?bxptiUCZZuEodfee8rQ7IjCh2NEQf9j58cvgl1K9qPDiHARfeQ1+GaPa33h0?=
 =?us-ascii?Q?3PZhAGXpCb/gKLbCjpIqfKQIYgFWreq4f7Vo8+3QDze/jeaFbXwTQi/AfVqO?=
 =?us-ascii?Q?2fTxlzkEzLMiI0VbeulPcIsN2QN5UyEozMLZN5ToHDDazjhIPUHIOoeYp5eU?=
 =?us-ascii?Q?ikWWCuY832zYu1c0oUTXhb6r4cLEYfgsKLZNILHH4N6z0dbmgcfkS6RbEInr?=
 =?us-ascii?Q?NBmaFlRAxdYnyitTe2whPNkmdRxMlzo4KU/Jb6vQ4K4YbLnp7OH1mnhRKVpi?=
 =?us-ascii?Q?uMRVCij4jScryso4JbfI3oL2HLwlfVFI3AGjUj2zrDEeZDolg66ZGlPu9FNm?=
 =?us-ascii?Q?OrHtR8s4ZmqflJqvQlucPUaJJkP/KUcF+56ChvHFafqaEypJYpl+A4zeKDgf?=
 =?us-ascii?Q?mQIznBXoudyy56A6ioIk9rH6/3rCgUzyD0+aC7bs80Ubk4UK5GsLf9unFaRy?=
 =?us-ascii?Q?5GOOaBUKm6GFRXY+BnWItX1feUeHfhEn31Y7OhKGwcyIcVz6lbdrzoecc8N7?=
 =?us-ascii?Q?dyTkq7YsQzN0HWElFRijwIf5z6o+Oq4lcwsKUM2WhF/CRqA6dyWg8qDBPlml?=
 =?us-ascii?Q?WZMjDaUVdgTmcVsoEoYVR9pi1p/+zPFeitvCrw+bxcRKNL5FF5pN/04ynbo4?=
 =?us-ascii?Q?mWzEhgJRSs8HNJ5BZ3mo+gzvn+yOuH+KQNXN7V/rmm0v+7CTNmmLTTci/5CY?=
 =?us-ascii?Q?ryoMMidKy9QnXg9rWKZFwU4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55263f0a-1213-4a5b-a670-08db41fce0d2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 00:10:56.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lamfwuSn7x02DN14M3VoHv6jaYWIHPcJ7TrWXgos9aZtfbAMOARgLnHNGdkRP1ajJfvwP6dxK8KgH8F9YAVSj8AmlPjXXYNIYyXpZu9ixAsmc7IsVbv7HOsTtDSjJEuy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11167
Message-ID-Hash: QDN3L72KIFKRCNIKAZKYM6SYWWJWNFC3
X-Message-ID-Hash: QDN3L72KIFKRCNIKAZKYM6SYWWJWNFC3
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDN3L72KIFKRCNIKAZKYM6SYWWJWNFC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If CPU is using soc-generic-dmaengine-pcm, Platform Component will be
same as CPU Component. In this case, we can use CPU dlc for Platform dlc.
This patch shares CPU dlc with Platform, and add comment.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-es8328.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index b80c57362fb8..85bd36fb68a2 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -149,7 +149,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
 		goto put_device;
 	}
 
-	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!comp) {
 		ret = -ENOMEM;
 		goto put_device;
@@ -159,9 +159,13 @@ static int imx_es8328_probe(struct platform_device *pdev)
 
 	data->jack_gpio = of_get_named_gpio(pdev->dev.of_node, "jack-gpio", 0);
 
-	data->dai.cpus		= &comp[0];
+	/*
+	 * CPU == Platform
+	 * platform is using soc-generic-dmaengine-pcm
+	 */
+	data->dai.cpus		=
+	data->dai.platforms	= &comp[0];
 	data->dai.codecs	= &comp[1];
-	data->dai.platforms	= &comp[2];
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
@@ -172,7 +176,6 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	data->dai.codecs->dai_name = "es8328-hifi-analog";
 	data->dai.codecs->of_node = codec_np;
 	data->dai.cpus->of_node = ssi_np;
-	data->dai.platforms->of_node = ssi_np;
 	data->dai.init = &imx_es8328_dai_init;
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			    SND_SOC_DAIFMT_CBP_CFP;
-- 
2.25.1

