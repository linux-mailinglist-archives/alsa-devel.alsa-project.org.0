Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30312736063
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F3084B;
	Tue, 20 Jun 2023 02:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F3084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219547;
	bh=WRfM+EaUAJ/GF0wh5yn9rMJh3mLALDw2vTTZLQ9MrqY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UT15ZdRj5Ac6XV3ALN8Ho5G+XTlx5RqjizKCr2Dl16hCoDNrXqQA5tYTyBnS5NyRo
	 Dpg9i31iqm78LgUlbYnkyE3tfIeKSReKH+JeBdXHrOixHPLHxtLGtbKS5UX+0mZ2jn
	 GooOg4JOdt3Kig01/7Rc3orsZ+AgRdsFGfdZpVEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A3F8F80557; Tue, 20 Jun 2023 02:04:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87474F80548;
	Tue, 20 Jun 2023 02:04:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87FF2F80549; Tue, 20 Jun 2023 02:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FCA4F80535
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FCA4F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NwlqtrTB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXdHJni5K3rXh/6S65uZRQ/eWdNWjgtQU5GlOR9l3oQXkJ8LeLtfQmI3OrZWTlO3ic7m4uJiSmC6KL8+j/7GQo2csT05gDiwI9UlOlMNcnzk8KL+Ry0n1aFg75hzqnLQfamjpmSpA9fa9akl9+gm1ewGbFa1/m7QCZHycpzXnT0LkIEqk37SzY4fpo6oIUMDem4I3K1LnjOcxNExD3Gv6cGgoFcFUgIDPEFSamLHO0CiNzNZw1oEa14QruJ3Rmb2Ua6EyZYEaTejDvGgn1ReJPMP97UgrDdP2dRnj5/tCez6vn5Sy23kbYm3SnPOfUnPpl4YpN8lhC+wYWMDe5zSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj2ECRFYujO/ykjsLUAf4b2eXmEpGyJUMxJ5FDpRgDA=;
 b=KAVvV5w793UcHwFOBrflcBUm0fagvtHTKM3hAtrwwcTdml1xxmIrABFqC9xsSLAO7ehkDhSwMvhFJJuZuxyx+v+WCC7hIMSCoKqa37vtRqj16YNME+DQg2HPJ3lR567CQ8mpaA3OboX5S95iAnFvKq9K/QX2xqToCObwPM3+c3Gm6PuvoHtgLWc7SWF9icEzpdM8aYRvANpDwR6/7wV0J8aJE06FUlgSZXS9UFg2MpLiRi94ozOgwjXQctsezMB3kII4cPUA2WXP35u28CbjOEujgvSuNPQxp0aTAkrjDxuVONqt97YkOBXSnyx8dwZgHZTkM0C0wJ2YdwuJceuX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yj2ECRFYujO/ykjsLUAf4b2eXmEpGyJUMxJ5FDpRgDA=;
 b=NwlqtrTBk2gJKC7bG5eLnIm210yh9lNI3oHRdGm5rmDJMScdVe86WTq0BNOCpt+oBwJN5ylgVICi8aF6pPKkC+k73z9wfkCxj/vWU7TkK6tFYFxNc4iGw8kAne547IKq3H/aCb/V/CGZYM5SpPtfa4JTsPtsr1FpkidzdviyCTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB6107.jpnprd01.prod.outlook.com (2603:1096:402:32::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 00:04:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:04:06 +0000
Message-ID: <87bkhbdmoa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/9] ASoC: soc-core.c: add snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:04:05 +0000
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: afefdb49-6547-488d-42a3-08db7121dcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DTdyjNRNsunk4Uejhu8L4rOcEKDPjM0m35aC5dhg5I083gcS+hyWwXU//4YBPkeYpybpxPhyT6J3hllH1qzdBSkkhtQEPQpgAEn/uA3TNlU0BTUgUUCL6UpD5zWaCjhuV8q/j2zInGrJsDVoHUKium9Sm1zDsnHMMXVjmReJB3X+quiE43UgC9APNJSCWIruWZOca4pqhJv6/uXrjllrqZGNTTJFocbPKfaAmvHAGN1znRziyyQnEN+f18jxG39RPP4naMsG5ab1n/V3OUplMrX6/c8Q1Fx/4ZsnE3zfjqe4amhXwyDjcr0MbYIdUqPLzBGrAswaYJp7ysz6pLi0r3VW3sHZy7rcJ2QDWDAdtRiXwzIQPJFZn1l3g1TP13w2EGTyVvHOv9k6vcBGDg0r6u+p7c66wlBhSiJbUBw8eYA2bw4dYpCGKFKvQRYu75TUxZHB+PsNN4RI0a1Aup1GehfnUOI7BT9KsQQJwAFVCmB8m68qAV+7n4ROs1/P3Xi/fX+PkpvRZr90FchpF0gstNFANQrFQpY9KQQ0hAC0cmwmp7XYYbPCxOU6O1GgeWUaZPtnRTECXubMEo3nIEVtmvH1rkIdloycs+/ZKB8GWO1Afvey4nIKTQK4j3AJjGdO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(86362001)(41300700001)(8676002)(8936002)(5660300002)(66556008)(66476007)(66946007)(316002)(2616005)(38100700002)(38350700002)(83380400001)(36756003)(186003)(26005)(6512007)(6486002)(6506007)(478600001)(4326008)(110136005)(2906002)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P3NJXZtRRhPGjv8ZGePawNAfOzYM8R2o0cWlMeGKJMiVJvpfGa57JM+viwzk?=
 =?us-ascii?Q?ZCJS99frDpwWh+EG0WFwsz+xbgeLzLE+aTCvjDJ0zVZXu3YzU93VKL7DOOdj?=
 =?us-ascii?Q?hWNwxDEMOCt6tTASg/atW2iGv01Kq23xoeZJH0mSStycjgpY3VlNUJzAr45d?=
 =?us-ascii?Q?G/2GYPZhmC8XmACPI7REDI8GDGZOGjtRU4dU+MIpEsEHE4N1Y1VYfjLefG0Z?=
 =?us-ascii?Q?gEcOnaEra9pgQNt7His0ICa5o3uwzknhg1dL50a1ngDiopcDJMJ3egR6IRlQ?=
 =?us-ascii?Q?+SRWwjefJyqAvj/UuuChWRJuB1Vy2c+/DsyeO9yvBMLD7UGQmJCfWuCICSel?=
 =?us-ascii?Q?F0FVngcbvL1BrN+1l1NJr4esKun/Pp4kjYDsQy6XPN85yhHSiJKVKAf17RVD?=
 =?us-ascii?Q?EHCqjrZ5/pQZDl9fJy7/DFN9AwlrqkjJC2MXd+gJdfFYt6cbLPitHIgSQqbQ?=
 =?us-ascii?Q?kyc9ncuJp8+g0SDEiRHQjPMlCBimk5OtPVq5socpUNVZqTuGHIJJFTPF5Ju0?=
 =?us-ascii?Q?JJabBZqwzNzV2pIfzLhGNTOy9LMQg0YL6UpTmugwn1OoAgW/AVdTDHEhzVsx?=
 =?us-ascii?Q?gtgKYvNC3mQXsUURZ4nmdqMGgiIGk5YNWfiCqAF5w3ZHtCv/O70TQM7UYqkD?=
 =?us-ascii?Q?YQxJ5uwkzzxc3lsq1i9XAotRrGRJ7mhdvPQeRVbJ3sBfZ1sPLtt34NwFfMdl?=
 =?us-ascii?Q?pDDFPTs9BBV9AGJwW4zaUuDduYQc4CgxV/nJrcYEHEyMXn4450mNqTMwtzQs?=
 =?us-ascii?Q?SuHhHSzsq+CP+VMWXDQ+m4DuvWcvfCJwMj6NvnrGEmwTs4oNyoaZ4hJv/t83?=
 =?us-ascii?Q?NW5HBGrP+Kw+9kd8CHrykICDPx4NGWa5//9NwOYgBahKBoOyGacIQh1+NZ65?=
 =?us-ascii?Q?vrwdPTa2HeBkLkcLRNg+gTau6QcsAMeckrOz7ex1DvbKXD2HzPGXK7cIoVE2?=
 =?us-ascii?Q?f9g5oXm0L3wjd2iInOfBTKzw26qNGSQL2G7oi0nUjVWeCFTIqdR/HbJaIaZw?=
 =?us-ascii?Q?ZhDI2cUDgXnrMxjbbjAj7ESTTEnXEzWhMv0EPMkuE16x3rDQqPj9AmeuUler?=
 =?us-ascii?Q?gLM6yR1gOOxjXaFPDX/0RQOO4DW+ypkswtNekM/saeUUz5nOrTiW/9U18BsT?=
 =?us-ascii?Q?54d146diqJGx1Rd8OwZIwVYLQrejW7M8+zyTzPr9Ux70iwIDXtguk4/0WoO4?=
 =?us-ascii?Q?LwdBO8H5zm+BDBnONapKfu1rWY8zsVMMZrpQBuM/Sd4fsdXLchWnTEno6Kzh?=
 =?us-ascii?Q?k9ypUZsL/iVw2YVmfR2kvibYlHCw222jV5ETGWpjsNstQ2LaD5O8zfvpVd6S?=
 =?us-ascii?Q?WOpr6iq/baWvtLz96UXjnu+xP72iPSfLivjs9ESrzizutwkjGoLdiDOGFDcF?=
 =?us-ascii?Q?rV8MLf8fKep5UmiYVO7Y5O7U/4GT9sjk/eLtqncSGPw28MdcYJ9Zd855goLJ?=
 =?us-ascii?Q?3/r7rGX338s5zb1gD3vc59xuP2ZHcnjBocVDOf4SJw+9Ymiu8RdhdiilyACY?=
 =?us-ascii?Q?hyEfKNtq5c29GypG+fb5puzxRd1gRkfdzaoy8Fo8HWnuJRvRgR1RMX7ta9Sq?=
 =?us-ascii?Q?KVy585Jt9anM746LFjyH/YHYnkHj6dZEq2FJ2y6iSKPg4XaRBi72+0wxjC4s?=
 =?us-ascii?Q?XhPAbZzfdNcho9I2vUvPEVI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afefdb49-6547-488d-42a3-08db7121dcf4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:04:06.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aDEpQm94tjN4wfc2+lU/fO3z5H9jDxDI2bpw8T0O0L/4C7M8hnLyzQVRYLrpmf11GJx+/Hws4jezJPV5sv2orWZUZMemYegouyM8QRioLSO+PntShKDIpVmB6HhTrNf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6107
Message-ID-Hash: YKUMU4ASEX7742TDDGJAUR5ZSSHZMMLA
X-Message-ID-Hash: YKUMU4ASEX7742TDDGJAUR5ZSSHZMMLA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKUMU4ASEX7742TDDGJAUR5ZSSHZMMLA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc-core.c has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component). It gets .dai_name, but we need
.of_node too. Therefor user need to arrange.

It will be more useful if it gets both .dai_name and .of_node.
This patch adds snd_soc_{of_}get_dlc() for it, and existing functions
uses it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  6 +++++
 sound/soc/soc-core.c | 53 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a7ae8b26737e..943f0a1b2d27 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1309,6 +1309,12 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 		snd_soc_daifmt_parse_clock_provider_as_bitmap(np, prefix))
 
 int snd_soc_get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream);
+int snd_soc_get_dlc(const struct of_phandle_args *args,
+		    struct snd_soc_dai_link_component *dlc);
+int snd_soc_of_get_dlc(struct device_node *of_node,
+		       struct of_phandle_args *args,
+		       struct snd_soc_dai_link_component *dlc,
+		       int index);
 int snd_soc_get_dai_id(struct device_node *ep);
 int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			 const char **dai_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e8308926bd98..8dba5bb26ffe 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3257,8 +3257,7 @@ int snd_soc_get_dai_id(struct device_node *ep)
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_id);
 
-int snd_soc_get_dai_name(const struct of_phandle_args *args,
-				const char **dai_name)
+int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_component *pos;
 	int ret = -EPROBE_DEFER;
@@ -3270,7 +3269,7 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 		if (component_of_node != args->np || !pos->num_dai)
 			continue;
 
-		ret = snd_soc_component_of_xlate_dai_name(pos, args, dai_name);
+		ret = snd_soc_component_of_xlate_dai_name(pos, args, &dlc->dai_name);
 		if (ret == -ENOTSUPP) {
 			struct snd_soc_dai *dai;
 			int id = -1;
@@ -3301,9 +3300,10 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 				id--;
 			}
 
-			*dai_name = dai->driver->name;
-			if (!*dai_name)
-				*dai_name = pos->name;
+			dlc->of_node	= args->np;
+			dlc->dai_name	= dai->driver->name;
+			if (!dlc->dai_name)
+				dlc->dai_name = pos->name;
 		} else if (ret) {
 			/*
 			 * if another error than ENOTSUPP is returned go on and
@@ -3319,22 +3319,49 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 	mutex_unlock(&client_mutex);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
+EXPORT_SYMBOL_GPL(snd_soc_get_dlc);
 
-int snd_soc_of_get_dai_name(struct device_node *of_node,
-			    const char **dai_name)
+int snd_soc_of_get_dlc(struct device_node *of_node,
+		       struct of_phandle_args *args,
+		       struct snd_soc_dai_link_component *dlc,
+		       int index)
 {
-	struct of_phandle_args args;
+	struct of_phandle_args __args;
 	int ret;
 
+	if (!args)
+		args = &__args;
+
 	ret = of_parse_phandle_with_args(of_node, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
+					 "#sound-dai-cells", index, args);
 	if (ret)
 		return ret;
 
-	ret = snd_soc_get_dai_name(&args, dai_name);
+	return snd_soc_get_dlc(args, dlc);
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_get_dlc);
+
+int snd_soc_get_dai_name(const struct of_phandle_args *args,
+			 const char **dai_name)
+{
+	struct snd_soc_dai_link_component dlc;
+	int ret = snd_soc_get_dlc(args, &dlc);
 
-	of_node_put(args.np);
+	if (ret == 0)
+		*dai_name = dlc.dai_name;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
+
+int snd_soc_of_get_dai_name(struct device_node *of_node,
+			    const char **dai_name)
+{
+	struct snd_soc_dai_link_component dlc;
+	int ret = snd_soc_of_get_dlc(of_node, NULL, &dlc, 0);
+
+	if (ret == 0)
+		*dai_name = dlc.dai_name;
 
 	return ret;
 }
-- 
2.25.1

