Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D616143E2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 05:23:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAB191698;
	Tue,  1 Nov 2022 05:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAB191698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667276581;
	bh=3sZMlupY7wH86ADcnfHMsT3oqywUWy3Sed7IDU8DXyY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYgVVc5LWUYWdJUfbkRL3EFYPIPOJ2oGWmMupPcqU7EvxPxf39fUyBOcIv/QH9sYd
	 is7VUFFBxRbG3Nxku5psdxFmRrB/ZDnqFAoQzbjrulpfF8+T5ByYIXGoxxCiUJTZ7h
	 LRrS2Z44LvAEy+d2+WzdVlYj2ZBNDgO1uF+p9N8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677D1F800F3;
	Tue,  1 Nov 2022 05:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E956F80519; Tue,  1 Nov 2022 05:22:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ADEAF800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 05:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ADEAF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="XgpjZKzw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1OcM/EN3UGkTgplmsgRM0QDY22pOIvdkkrMXnY7wPVdYBYbpv+eqdSOQoWQtBXQw/ao4phA4TotydRyCpUrsszMcYvhkLiUPf3fdfTpEXQqfMsqUQFdqweZPFAIgeJIiJucl+3m8ecnyDu9gVz/whQztdc9yyl5V717ugbOyyERY5FtdWath8ZLyQE40Yu+tU5E3VTqKW8WwFObzz3dyFml54SP+jMsmNxNdnc+y3L3XCepABepjnuc/KJYqLxD+Bl0ZO8Aww/YjRX7pYRcAh9rN/kwVbti7gjvdiK15wehguLWlxQo+EVQC5+bqiOF6EINHUm+i/JG7WeOxqpPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ybq9QIvBIF3wx9jLC7sSgA79IOgIp7RelteXiqTsoh0=;
 b=BmWPMiMYqiP4sWj5B3WVOaSUCIyf1EfmE3zs7/Mfj5FXwdj7OZbHwEg7ccUhl/q9Z7EbrE2h9z4TBwiMr1m6lI2RfL/tQysPMihhZuItvHFpJlH7JV7NllUq0rgfPUkbpdDEQxfIGekLy5hcobUMtgXh+nMQsk9O86bd0pvl5A3ni95g420KeXRc5kx/36z8LV6HZan5Il33DSQ1Z9nTY07OatW5mYFYLfIHFTojF2jYpH9SxsBQ6CFiq6BANSMkV57xQKpK4sXZLIsmOkWHeh4Nl4VQ+Zey7F+OU0sPSMWWj0oBHm2qPffQdBccUl17wC9sSkhVtcd+WI023CT1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ybq9QIvBIF3wx9jLC7sSgA79IOgIp7RelteXiqTsoh0=;
 b=XgpjZKzwxmMuSx8VQlg23NEFTc+9VIZmNStHphSdB97O2Y2YaeJkw7VdU5OeqvJ69i7qPCQNWxwPAUS8E6Xgtd1mLuWxrrmFGLev5x9dkxfja2CMbe+G+cFQrYrU0b+/BrIjThIYFDj8drvG8LZbcisocI7Q2mTarFN1WCL2U10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9813.jpnprd01.prod.outlook.com (2603:1096:400:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 04:21:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1%6]) with mapi id 15.20.5769.018; Tue, 1 Nov 2022
 04:21:55 +0000
Message-ID: <874jvj8ftp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: simple-card-utils: remove
 asoc_simple_convert_fixup()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <875yfz8fuq.wl-kuninori.morimoto.gx@renesas.com>
References: <875yfz8fuq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Nov 2022 04:21:54 +0000
X-ClientProxiedBy: TY2PR06CA0038.apcprd06.prod.outlook.com
 (2603:1096:404:2e::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9813:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb66911-4508-4bd7-bb0a-08dabbc09be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQDhH0f5UfjWwmlSfntvhAg9Xs0iOMS2VLsjI4HN16Q5Qv6Xva3V6jOaap6a34d9pULltTwOGi5k4JXadfYU+DFasYw4TxVGXkKbzZLLyhWkdqG36fF+n9dgoP3+4bBgr7cLfyc6/DAf6W6IlZbYD8xOGAIY1bdRg0NhuS4AB8/N7sXTjfeHBosBsWWuHkQDuS8K8hAQZTGKCbUNZSH/7GbcF2oofqhgmtJ2QOLAgL3rhBSueZrbdmPRcZOXKoqBBj+sM799gupSGFm1f3X2sZPN1orq+SHyhv8sCjbE3bHUPoZFYoFVhbXlSoFIGGhvJO6T64nmj+5GsSH3MpXSSDClHyBK5zQqFK5gQiGaSyCjNugKRwKHYRIbO1/CDDoPjtXv6NngKSMzjmkN+11D/7bLpKMnixi1ArBuPPzB3XxifjpSucCQahAN0aSNsn8iVPPIWf2imudeZ3Q74xrb8wFicgUH+in+A47LZ1y/Sw99exvt5QDQe9gCPOdXQG4wWpFIrfzghaP4d4q7U5twYcpz64YBP45gnIUtIF2dd2kOADA+0fQrynCeIijRb8Aq7DmafENbzM2/andRXjXX7r/H6CE13qO1n0nJzeJ0/bK4gahV9eLCk63X6wrlndV8jkdB2WprUyebKGKiJ+FOypj7G/6c0HQGyoOFCjDEE0casv4OvjkfrDJcFF/JaaA1sAQ1xmlHlz4LclECvL/Y1QCu2FL/5VIT/RrtG9HLEZDKLb5yXzNErridPYUZ5ZgsLbEL++ukpdvpY4a/8QUKxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199015)(38350700002)(38100700002)(2906002)(41300700001)(6506007)(26005)(316002)(66476007)(8676002)(4326008)(66946007)(66556008)(6512007)(52116002)(2616005)(186003)(6916009)(8936002)(86362001)(36756003)(5660300002)(478600001)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K2WU2HMqHUFYxGB1+wzUEjJmaknVOjJWtjpX/o06GeA0H4Nkl1tLngcIyT5U?=
 =?us-ascii?Q?FBl77ROcKQp3FNmtYURpraPPkczVwoh/fWbDAvu8KbrZ7TediZA4qzU12Kph?=
 =?us-ascii?Q?4ZH4yyQhcsHegdBl8bkn1I1uUSU2s7CexGRqrPke3RY1Tskay/QsQluzlevA?=
 =?us-ascii?Q?SB4e55vky7IPLHwh2kn91g8SkwohF361Y19ThCn/OkjiElviId3GuTTcy4MG?=
 =?us-ascii?Q?41f5vOsXYYOqWkVkHtguKtGErexFmV4t5BoXLWrdfqsVyhE5VRxx/Mr39fKd?=
 =?us-ascii?Q?PUXl90VHB/ZvNS970MZGNJrlsgm5faHZx1zW7j5Lf+md+lnf37c7zqFezp3j?=
 =?us-ascii?Q?Q3ICjGLAzoA4WQViMj+X4bVJAa+/Bkn+8eb7ckqEBy/NImHT0QKjPAb2K5oc?=
 =?us-ascii?Q?KmHQDjg9TwWTZLVcYWndRUiDpcqohnvN1Q+wA2BwK75FVFClCCB3mADnXskp?=
 =?us-ascii?Q?lF5rlEV2h2vMdWxXDYSdBtZPiHD4g/zu7yfNXuulaIolNMxZT68HiVSgeHZd?=
 =?us-ascii?Q?LWanNXxLiC3tsGtaeh5p8bBaoNYCDnKVOdu+FeYDNHDjKFN+dPwrud3AaA5l?=
 =?us-ascii?Q?v+nG1CY1vJXH21a329uYAgUuN54yJPoE6iU/yGlYqEg2UGmSrhK1ENn2ZGzq?=
 =?us-ascii?Q?u21dhwnLZZlU67qRz3+nllrWw7Nh2HHnz1gzVdwt9oM9Mb9one7YrnFZ/UYa?=
 =?us-ascii?Q?o/S61o0TkTsylTj8U8SQX0KRJnJ119OCSzhLB5vgmzoaZGZQ9XO9fbUt6kc4?=
 =?us-ascii?Q?UYfEWUQsp5IUfZViOaJVR9EpkPQIAE8RkIXOBj4oz2VukiI+z5WqVoTUefO/?=
 =?us-ascii?Q?9sVepkItV/INdty6KsfUB4HuIBWYhDcHQCpi4dPvhAlIftMAW1NE6gJWx0C8?=
 =?us-ascii?Q?3XayKAmakwyKo5yABFMjhyzVpbKm5VFDiveGMYhT2lV71s2kN6B6LasL87sj?=
 =?us-ascii?Q?qtHt/7ekl9BNghgEr45WcuSu+YXutFzh+Gp/44nPjNvicRAfhP3zXCco8SoZ?=
 =?us-ascii?Q?2WTA71uK7RJqUZNG21U45fwbmCmAIMTC6K4cPG1up8ggjO/LL1I9iqP6ulJZ?=
 =?us-ascii?Q?/3EE1mIKATK5V0Kyl5rlov9pyQZNBNrCJ+RkqLLA0XuOHF4tuWGJX83mu4mU?=
 =?us-ascii?Q?IjaST6UDkpr+jfAxOcaScH5zeOF/YrC+nzaeolDLJS/bb/JqPQ3QPV3LJTM4?=
 =?us-ascii?Q?kH9hP9WmIrTp3z02in7Ht6+TjDJubRpwvhPy+UHNCLJ8+yxFr6qRtLNP2U82?=
 =?us-ascii?Q?vpZmT+VM+uf+G0ekgTsd+NIlaGYjnbwXeaa0c4Pc3Y0hZRi9nRhNEEN8fOAj?=
 =?us-ascii?Q?nr/AlcooTfUooC0NR9e22kO4N5Piyv6IMvjBzIWmauY6SAvcHocBcypL3UhV?=
 =?us-ascii?Q?79SoE8a6zWhsnNfLtKecf/djK+T5aTlnkwoawnUiMv8U97gikN973YmmRB9K?=
 =?us-ascii?Q?cDMwQuZuNI3BglMAJvMrBTP8FedcxqFoCogLnIEQ2Fs6WIUWYJN8VgRpbLMk?=
 =?us-ascii?Q?GFWHl3uUAJONXjNdJpH2N7d4YgaaAgzzQPqY4VaItdcoEJLWnNQCcx+0W/MF?=
 =?us-ascii?Q?RvFtX0F5NTjl4saoOoRivJYYqzFpYwoeVosMbdGytgI+bXD8lI38Mc2PeITV?=
 =?us-ascii?Q?UGdp3Ec1MWOSxArlAbQNoTA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb66911-4508-4bd7-bb0a-08dabbc09be8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 04:21:55.1119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69hdjpNUyXhY0RsoIcjzomULntGTyml+7kMUHp0cFR9qwfVcHK4Sf3JjycNMNqq9MVVwqypd/ZWGgJUubSPABrHFbEdVuWsobXkscGbtIBZOHZHofC/h7YZCAQvhi1Up
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9813
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

No one is using asoc_simple_convert_fixup(), we don't need to
export its symbol. This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |  2 --
 sound/soc/generic/simple-card-utils.c | 35 ++++++++++-----------------
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 25e049f44178..38590f1ae9ee 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -173,8 +173,6 @@ void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 
 void asoc_simple_clean_reference(struct snd_soc_card *card);
 
-void asoc_simple_convert_fixup(struct asoc_simple_data *data,
-				      struct snd_pcm_hw_params *params);
 void asoc_simple_parse_convert(struct device_node *np, char *prefix,
 			       struct asoc_simple_data *data);
 bool asoc_simple_is_convert_required(const struct asoc_simple_data *data);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index be69bbc47f81..e35becce9635 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -41,27 +41,6 @@ static void asoc_simple_fixup_sample_fmt(struct asoc_simple_data *data,
 	}
 }
 
-void asoc_simple_convert_fixup(struct asoc_simple_data *data,
-			       struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *rate = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *channels = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_CHANNELS);
-
-	if (data->convert_rate)
-		rate->min =
-		rate->max = data->convert_rate;
-
-	if (data->convert_channels)
-		channels->min =
-		channels->max = data->convert_channels;
-
-	if (data->convert_sample_format)
-		asoc_simple_fixup_sample_fmt(data, params);
-}
-EXPORT_SYMBOL_GPL(asoc_simple_convert_fixup);
-
 void asoc_simple_parse_convert(struct device_node *np,
 			       char *prefix,
 			       struct asoc_simple_data *data)
@@ -522,8 +501,20 @@ int asoc_simple_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, rtd->num);
+	struct asoc_simple_data *data = &dai_props->adata;
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	if (data->convert_rate)
+		rate->min =
+		rate->max = data->convert_rate;
 
-	asoc_simple_convert_fixup(&dai_props->adata, params);
+	if (data->convert_channels)
+		channels->min =
+		channels->max = data->convert_channels;
+
+	if (data->convert_sample_format)
+		asoc_simple_fixup_sample_fmt(data, params);
 
 	return 0;
 }
-- 
2.25.1

