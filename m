Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72E73616E
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA8AA4B;
	Tue, 20 Jun 2023 04:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA8AA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227388;
	bh=sThBh9CANAyFgEwOKlVIZMDiX8/Hi+yxljF6atV4/HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jXxMLFWgei/wlV8AUeq08qrZtLQb9xpja7YRNUYA4vYAlVTrebn/p7CUN3LAMG5mi
	 j1APB4+6Cumq3GX5roCUUqcy+x2xBsZfbKc/w0SOkl6yADgjFybwyvt1+6Laxcbi8e
	 YDswX3TDDfMP5wrB0APEjbHeBi5KWn845WYGPa4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66E0EF805A9; Tue, 20 Jun 2023 04:14:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF3AF80587;
	Tue, 20 Jun 2023 04:14:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0F72F8057C; Tue, 20 Jun 2023 04:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB7F8F80563
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB7F8F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lFs7w2GV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHv35i8KypesJT5+paPFj6yXgz1YLwvz5T6NsJ0LLNxR8MqCDi0B4/JUqbjbiaAsKUZ4BNwipn8R97hty23eklSErVRxbOe1NQTt/fbjIJe7mQnKHByZPwuBg04cUqqeKtQIKPmtGsZ2WmY3KXMdXhI0gANQS4JcPldG+r6rAgpAyY+FoABV5rKkSrYKkDkUm30GkDP/jPmCODgQjVs/y/pdBx1BlYkBmXM43Ea4gkXUbeeAsKaKq2yldhgnkD8Ur6VTLi5CXBJA2HUdUL2yqZF1iM/E2OA/OiKrq/tFnHWwBbDaiuVgt558uQ36iJkfBxtg2R7UPKedzuNMNzOnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XArk0njumHjOYVXHbxOAWfCFth7uv5h7+T2/ANYBKo=;
 b=LNb7vEK7QfL8+LJ4LDy/BZQ+udrp6m4/kDUYj2/wrRMxdrm6QbgPN3ETTGKUrrNOobNOL9NkgbFqyUNRjEfcXNFduubDyIgtIQir9ce9BaExwHQswBC9saEOhNopNYl81tLi9cktgdG34wouCUM1azvxT7ccGbPlsv+aC9lkhAmvCXOoDI1nszhEznKWrrqJT2cugoGucAM7CQpQbkQGO7/CBQ3l7LB4mZOW0vYT0d83son7Y/TBHE6X89CUtF8lDLHg5ioujoSPD/Jj+ifmMx1rlAkGZRjEX1K96cIsI6IuMgM7bLrwIkMyR8ulKfLWQ7HYFLmb76owIquCjfbxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XArk0njumHjOYVXHbxOAWfCFth7uv5h7+T2/ANYBKo=;
 b=lFs7w2GV7JzlixVgnB40EY/QlTg8u8e//TAwTmrRK3We/K3McZVbzhyTpPW2yEp7AzuuKx+doHyLpR7lmDwsLYi6/Z4ZBz3zsnBoYbh5hF6ODfZ/GK+B3QXmGKcmrbLRfDmhHmVlI2bGuqo2Wlpyln5sf/TuScj2skqFlFrETzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:24 +0000
Message-ID: <87mt0udgn3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v3 4/9] ASoC: qcom: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:24 +0000
X-ClientProxiedBy: TYCPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:405:1::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c25988-21c6-4b51-fe9c-08db71341155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OZ+Yyh7crsG54ydhItBfslLys5mwzoPf4NPu/PX9fsutOtu19hmupwk9ar3PXJ+loHbVfm7HazWqC5mEBF4E6l8Rym+NJzOpZOtisNfkjy7gtFIoq1yCVABx+4SSCQdiOWcQtipZdCZW1Xu31NILiINVHToDYeISncQAkatFpZEYC4E8bsAOYwIghtUSAqJfnKBQXYRmwnAdBewELNATWkLN/pGTZgy42bwLapPwcm5e3MYmWDUAG6YjymjT/epbRGa81kaDR5as+oz/6JpF8G0bBYOiFrcEQEW6G9ZwaBMdcO6HbP/PU4q15icjK/m5pjVxnXhkUvNPl57DErVCU+KVNXz+emK+vO5in+pWbBHNqq10+iAiZoAbHc+uCjQ/KlXVlmYLi8ivt443EhBnouxSLvxuYuhjC3lka7scnEK/BqZYcOt/7ccErxSTC3V53QT76ZoHNlDUmOPDGJZET7OMrd//KDA8y9WBf5EJgaLP7numcdy7G0Zz6BORRRKkPK/IOX2PLe8ZMEe71IgSXJ852lJ95UFheJhdNtTOgfo8FHiqHmevRt9O74WlEh+2OZ4VmuTituFymUVuKsCcmUS2A6M7byPhEGFfijtn8rpbyML0TFJHSWu3tufALdUb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(2906002)(5660300002)(8936002)(8676002)(36756003)(41300700001)(86362001)(478600001)(26005)(6506007)(6512007)(186003)(110136005)(52116002)(6486002)(66946007)(66556008)(66476007)(4326008)(316002)(38100700002)(38350700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xgIUsV3hmuDDLRSh7QebAnks8Iux1GBZ5joMWubCfwPCqifq7yH0zmWdVk/9?=
 =?us-ascii?Q?hjw4ADBuj62Z6bSYu07I3NNxQkX3gLDshLE2LFIkd3wxscb6HtNs/vLqW26n?=
 =?us-ascii?Q?jh0NXeT/CPPs0+uDbGaoM50sjGUCq/4lVHoRF7m5c5aKpqICAyo/fGfOHZbD?=
 =?us-ascii?Q?9562BftUPN89nNYRRJOQc+J4ZJku3eNY4puxk4cqoiBHOaZE+L0UEthpbd2o?=
 =?us-ascii?Q?tmk5/dz4VzLXmbCYEfuJY4gSX0u/9SQTV35ICbz94PRWc0BEqXpmcffKoFaP?=
 =?us-ascii?Q?cE7Iymk7Z2NWq0Srqhg3HT+FA+5KpidiBDWJoRAX5RPmkezSe6hcPwCFqWbx?=
 =?us-ascii?Q?F9EuUhvMAGkLEbe3m3RcfChw9d6GeGg0fpc+60ZifQfiOZ9qGOz/T4T66zr7?=
 =?us-ascii?Q?QSWgTgVZ2PIsYsE/KdYjrfSrZalhdqpzrHQiIi1hh3ak0hCA5RawrhHB2AXh?=
 =?us-ascii?Q?sDd7p7obXf0G/7mc+xwKgKfN3HUfGn13jSUSSvrDsgMwM2XBRWJJ3wYrzGRO?=
 =?us-ascii?Q?dBasQf13kAQBaUeFN2yzHwCosKe7BjweuZPQ8BGoNf1k4PsxKGz8+NYeQ/9B?=
 =?us-ascii?Q?TpjymRTlF0qwLr5yeLi7/kf8/RtOPyB/zzJMn/ry3FqNNoJafVZv/+SEjTKv?=
 =?us-ascii?Q?FPP2ZMvadgHwmCeDV7rUCKbFKl1RyX3jljaGngyXVHf6Ijv2LbxJnl079BTp?=
 =?us-ascii?Q?73D7kTNAFSVnuTx12K7bUSNk5Lt8kRc0GIR/NyZN8DgbzSpHgH1cbNuR1Wk/?=
 =?us-ascii?Q?UZPqcxChPiLvXod2s6m2H52sbVr4Dzs2bSGdYCNREgpLVCB4Gvbe8YXA3LT6?=
 =?us-ascii?Q?4Q85A9RC2cwWhhj0WWAbN4M33WjXfu9nAzPcZqC19kPUVxww6qmtek6cVFAT?=
 =?us-ascii?Q?/Ov37NJSfUmRFw+3qLW3GAPNPhYdYPAi96xJ7SPJqwJH7njuQo0an1P2DAKs?=
 =?us-ascii?Q?GZDMy/XnGMgyqjwZxRrSZ7aeYaDb9ad1D0AEBtkjaQZwc40UgytNAmOH3ozS?=
 =?us-ascii?Q?5XD/e0vERARnSDN1yY177w2cpZRYU8NbNbuvkYTLUs1xuaQkS6lDhLVtUXZP?=
 =?us-ascii?Q?kBrYBaiNlFOukJMTwGpOE/+w8dpOZEYrg4IN607QzymLuh5q2T4TVpZGfBr8?=
 =?us-ascii?Q?6TdLjo526svb3mGc7HiuB+ev28JiIh/h14ZZRRq7ehBL4XrPuCpcaxfMZjvr?=
 =?us-ascii?Q?VseJaxPhyTwoycAcQrv115aR/FAqp0hn5T61MLMW0R3zaEoRkLDU+WgXuiDp?=
 =?us-ascii?Q?Mz/QeZfwLwAWN4vzULc5PokFEcVENHxeAikbvnV94TC3pKZ1xLG4E4sdVZ6s?=
 =?us-ascii?Q?KJglj+pPnKgpB/8c68FM9rP/IzAEWbwjT6PGZgFN54ILH7fh6jn9Zhnjx0LD?=
 =?us-ascii?Q?1Zdhq9QRAmc2jjiRdgfYnjwGf4zxghccghBjkKHQ4lL48pk4tzp2wRcMSYst?=
 =?us-ascii?Q?Jh1BqgbDANzSRu4uXpUf9ZH6I+6wczAkzf1DZROVp5eNMPZWrIg0dR1Tsowd?=
 =?us-ascii?Q?7cJFsnhXeumKJNUVu4c+41/RyA2ye/hBzM11WP+aKvZvKrD7G1qU7Zc6R5RS?=
 =?us-ascii?Q?mXra1v19xrizyk3RnwRVjdRyarvSJNAv45mVEhZV9sx0UtLwWrLDscNS06Gq?=
 =?us-ascii?Q?J/f9JZi3MRNyo5Yt4tnw1Lc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99c25988-21c6-4b51-fe9c-08db71341155
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:24.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BA1GQ3h0V9nV71nsUhdmY7MJMKC+5rMPWmzNAvxOVgipS+rVWlwfZwWE0PqHa9c5L3FxHTAutL62D00z0xo57DjWURlXRSmRvAYVA18B2koKW1QS03BTXyDc4gHZb69E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: 4GILRKLMUEAM2WG4OVVIKA2WWV3VMHZK
X-Message-ID-Hash: 4GILRKLMUEAM2WG4OVVIKA2WWV3VMHZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GILRKLMUEAM2WG4OVVIKA2WWV3VMHZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/common.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index d9ebb883b999..43b0a888f1e8 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -96,22 +96,15 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
-		ret = of_parse_phandle_with_args(cpu, "sound-dai",
-					"#sound-dai-cells", 0, &args);
-		if (ret) {
-			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
-			goto err;
-		}
-		link->cpus->of_node = args.np;
-		link->id = args.args[0];
-
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
+		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
 			goto err;
 		}
 
+		link->id = args.args[0];
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
-- 
2.25.1

