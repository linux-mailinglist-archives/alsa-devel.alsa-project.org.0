Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9444736171
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D53FD839;
	Tue, 20 Jun 2023 04:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D53FD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227422;
	bh=Kk4hZgj2JBYUPWZxUcJkqUvvPBWN3bcxwIjTTi5PXKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EDJbA3wGRz9fnNh3vS8UU3k1YL0Kom7s06T4ifyjj4oQzqFgAixCcXUmXnU2Kiqk6
	 Awr/Y3A4bdAbuX8Du1aEl+vOdpYg1JMtneAGWRBvWflxuhmU+BWKEjXmor0jIDgg5w
	 GlG5hh5E1vAIji1x8G6ifJRYXPxip2i500oOJJyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27CBBF805AC; Tue, 20 Jun 2023 04:14:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 995BFF805B2;
	Tue, 20 Jun 2023 04:14:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33CB0F805AA; Tue, 20 Jun 2023 04:14:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FA49F8057E
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FA49F8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ipSbSnvP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbtXIy0nTI/73thdPGPdfMaIeKqm9ys5ZQqAzqYf5KOFMThjM2Hyh30XWg6me+3uiRbeRPhSDALx3eTUxtqffF6EULQpwwOCrxvwU/aA1TozTePlJaLGJUP22G6XLTldPKSE0LUQaydBp2mwWE2xvSQanOEJQD3zTyUbXzpoU3X20vffEDdF2dr2s6tW817j+nQxsk/3CgNXt8FkDqtZNTC0wtYUYTSUEGIrZFLYzS9RVdVfCJy4VpLf06TXMSVvuu5suWk/KIjfpfdeKns6q0WJ9Vypk923WmsRWmWRlnXbaNJSYKIIfLAD+/YdRvzZh82zlMSUcm+4eIr6AmGNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW/EPAl/c4IJcKBS0EET6sZwcbjkC2xxga8RU+H815c=;
 b=oDHN6HbuK5w+WtZv6AirSywNK4cNVLjqIpCQNz/+wNPMPM4Dh056NPGhtrAgK5/emKabx5H6xlV1W/QkBXk1L0hUsV8Z5AgpIClEtlWIexJXudk7DcoiJe7xxgBJlnFOEIvstM9xQKUNeM7MW+5AFSgJ156ZAerLQcJxmdHoCHuNMKY4aYQXw3j5PnqfMPWUlNl3NL0N/8SN59UtApsdgCiImDUx7/n5oGJOutQjYid/ovhdKd1aMLMvHgJ29BKDY2aeCgZVRoDP7H7mlKo2aGymkGe3SyN20zfK9n7RU3Ok4udwhSHAOpRikWJ87T/yuAwJm03XibyfxjNlqgeafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mW/EPAl/c4IJcKBS0EET6sZwcbjkC2xxga8RU+H815c=;
 b=ipSbSnvPPEQq1XMbSP+HUwYRWV8+SYN3+9Uw5SpfZWE0SaYNyLpusvHbH7vKfCoYnOiRSMlgSWT/VjaICyOVGcEz33P3YHgWNbdgdU6XFven9fg9B3xa58xcyerEeAqn3SBHpHu6UYeVKt8pP41oV2MZUbSUHKRYZFGcp2lNMZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:35 +0000
Message-ID: <87jzvydgms.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v3 6/9] ASoC: samsung: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:35 +0000
X-ClientProxiedBy: TYCPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:405:3::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 8537d2d5-5ffd-4b33-8ae0-08db713417e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wxRNYsCVJoboM6lyck8vZ2rY8jNdCpnbUPg3akFbiCMFXLxJnx7pJPrNfMT1ueDZItjQ+X8m0ZQY+4VaKQVOXdM1ZzJtIRNqQ3QTta5dY4onrZVzqPODwWzqJjL9IHQLekkgcVmpELFGNnH7Yu0/iA1fWvOMcJvBJh5v6vjtlbNrAMOj1Zgjc4VnjUaPUTiagA5VgEdc6Q//Vrp0FyCso7+f5Um3U7sTCDA/TmlbyGkQOclmwI/BMFo6IDY7hF+1jN5BSkrdvhrGm4jhX9/Jbg/1CHBimq7BtoTOKdXbDPkaIVp1o0Le93qC1C6cXKgFkZHGybs1vREn3WoDiBetr855YXgAJ5UjMi9fRXUb1ohNAzZ5eZifVBYDLpsLq+r50r2mflvqMQxx5G0KXAAUWWI2s68pq5YPlDqC02jJwBNpr7ADkWRh0PbHbI2xfVJb+RmjKz5GsragyfE96Y15sGuaLwpk1L62wvLt2heSaON0W/O9CVafoH0HhKIuQ+h81j2rdeLGvY2U/5YPOFru3xYFcXa992DPrqCwdTr+3bn1t1927i6MWtH0XcPiyqDzw5c2qq2CPK4QSByScXIVFTOkwxgq6qBbdAP3TqBg9kbh4P4Jkh/4tdflc2i5+eVl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(2906002)(5660300002)(8936002)(8676002)(36756003)(41300700001)(86362001)(478600001)(26005)(6506007)(6512007)(186003)(110136005)(52116002)(6486002)(66946007)(66556008)(66476007)(4326008)(316002)(38100700002)(38350700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t2C7e4g3X7wN4Xd56y+wljnlhzoznQ4THT+kAsODgia/CDuPjOoHCbJeHuzA?=
 =?us-ascii?Q?iwco9t4CMsKldVQ8XEbWiiLFpTVdd1SsCryJpAkGPYPqdTQeLDRHUVvSiedE?=
 =?us-ascii?Q?5qH3oM2LSF4MkI3jdyqD2iKToD9vPenk85MCk9edQTmIpQvm2YJ3/PNCm5/7?=
 =?us-ascii?Q?ucxj7DCMrT7y7ppcnpAyPlU/47SnIbc4LBrElG/il9LPHmEub70yWshHRGjH?=
 =?us-ascii?Q?yoyz81Kj/+0OLyZ2IAjKf2VXXTUnZr4mAGQs++eeNUf4Xc8jZU6/nYrDGQYm?=
 =?us-ascii?Q?/dH7vRjTn+S/QRA2ZBxwgYK5Mj/3Rhdzr/MB2Wg/3y8ttDyiYUU1fmNUVuvy?=
 =?us-ascii?Q?25TK/hzAUsYIh95keVel1+EmEybS0Qt9GQIgks9C4Ku55pqlcYadxniZeBan?=
 =?us-ascii?Q?8UzPkSMs3vbU7qZiQzgXTlILqgZYWi1zJ4BSy9+k0tI78Zid8ZozB2sgFNrl?=
 =?us-ascii?Q?xluyRLha9cHAy8FDUnx/g8yCjotzJzX1w+bGTi3Wq4FZdaGQIPEhfKn2FnLw?=
 =?us-ascii?Q?n/87k2jAPDNgHmM8VCSpRCKgd+EqbOPjQySuN5jEByfPUiNkqWzQPsBeM1UA?=
 =?us-ascii?Q?xquiAR+pF1QPpqFEfBIyMHqz3PjnqdSPLZ/3vchG30VKGTi2zJBj/eZ6SkFR?=
 =?us-ascii?Q?J6DerJ/pK804kxxXAJRVucLaUL3hrNYoOdwX+88Lz0emI2LcVZKaqjdLk+M5?=
 =?us-ascii?Q?bS1JGWz+9grtQAZHYaJesLtYSm+O6n1HtWn2sIcQPY7vlZqdQUAp98tn9dfa?=
 =?us-ascii?Q?LBAC9Y7fUaJC4pkeA7VUlrv1n61w+dUfSJ0uKs/cqA9msNAoccnNHEbO6Q7p?=
 =?us-ascii?Q?f3ad+X6092WewlQT0dFKBpp2wD8GKpY7avfYRUe+De43BkiDJp9cE5z+eLc1?=
 =?us-ascii?Q?iz1H5X5uY+E6MDjuDqHGw/gljlW0BXw5OLqaQj4bex8vFgsa8fl9DtvtPtTd?=
 =?us-ascii?Q?4FPSutmUcSV1LiD44yq+OT1UrgKCVrEkLYDahB6azBZ21b5+YzOO3FMCS+DW?=
 =?us-ascii?Q?aTSXc/DvU9D5AXjFx2lMUZIiCHTjVeou60QcRJpRTuIETUimv04g7CKT+KU1?=
 =?us-ascii?Q?8DlEmR4W2ZQpW5ZbTc5FjfxllJMoOZ0PARSfh3Vlw3p7/Wfgy6RFNphkV0b1?=
 =?us-ascii?Q?KqZ+g0p3bZZlwp2AJ6tvC3hG4EZ5xcJiu1HkmUXCeIppuT1OfpBdlagGaAkH?=
 =?us-ascii?Q?XLLkykamteSKtwVCERzo06+A9MES61BiA/mQvANQ2OSmBMc8J8GwPQdMseLC?=
 =?us-ascii?Q?wGoUlab3olb8+hslgsy3ZhBIsSM+V7sKM4w/5cnNS0sTagSjGVm/+ZOhTEgO?=
 =?us-ascii?Q?n22ZLeUS69Svue+md6rsZdqOtoqHIoy05niZRB43aGTu9yKc9/Q35Cxgok6z?=
 =?us-ascii?Q?qoWO1TCPq87TTVU3svMspB1DX+CdjLyacrqNNFBXbpzVSTtQNzu+dMX9/RGZ?=
 =?us-ascii?Q?Wjfp6TLRa++X1I7IVBFCMOIfpgVBjn8pvR4dUM7A5DgnQV2OynTimBJUBr3C?=
 =?us-ascii?Q?TMzE9vTwori/x/g+dtwHWYUvt9ZssKW9J9rYK4s1CeOzlpPJhrW0UeMNbQc4?=
 =?us-ascii?Q?otyv+ZjgzMVBfjab0U8C4+Fyi+a6PoP/wVEjK8OrK3YLo3cp4QiA+tYd78jx?=
 =?us-ascii?Q?UeJnBfaNiw3VTQUNlLm8KEM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8537d2d5-5ffd-4b33-8ae0-08db713417e6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:35.8189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 znfVu2fzIn95r5mOs/Qsw7061WhLcLENHsueiZOg8Vl+PqTTGnQkpcLCONJ4Dx1paqin76DEW2HexBW43g9DIx1cc6m8QRzRLrnXTBPcOAqozIi7VDpxBagK3nMxJuG9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: BPQ6TKAYPUATUPJG3WZGIFS4CQGTSGSV
X-Message-ID-Hash: BPQ6TKAYPUATUPJG3WZGIFS4CQGTSGSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPQ6TKAYPUATUPJG3WZGIFS4CQGTSGSV/>
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

- note: need deep check

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index fd95a79cc9fa..a5442592bde4 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -205,7 +205,6 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *link, *codec_link;
 	int num_pcms, ret, i;
-	struct of_phandle_args args = {};
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -260,20 +259,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < num_pcms; i++, link += 2) {
-		ret = of_parse_phandle_with_args(cpu, "sound-dai",
-						 "#sound-dai-cells", i, &args);
-		if (ret < 0)
-			break;
-
-		if (!args.np) {
-			dev_err(dev, "sound-dai property parse error: %d\n", ret);
-			ret = -EINVAL;
-			break;
-		}
-
-		ret = snd_soc_get_dai_name(&args, &link->cpus->dai_name);
-		of_node_put(args.np);
-
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, i);
 		if (ret < 0)
 			break;
 	}
-- 
2.25.1

