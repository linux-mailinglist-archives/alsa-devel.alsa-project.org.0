Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995F6BA845
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:45:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58A18132C;
	Wed, 15 Mar 2023 07:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58A18132C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862719;
	bh=psTf+7TLkJmfjndFllmTh58/jBKN7BLlhZrT60bfsxs=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QRRMgLwb1cZ8NK0MZ+UAPtRguCNUs8hq/MNTewfHcfNxMkCyr20HoxDwtb6J0Z7gy
	 qJqKTkFREBfth/6P9fU53eJolXiYqNzu8BRT8GKYxuSnHru2wjy34/RjWOdqKnH7We
	 iAUse8B3eERkgKHv1Fubz0qGGdJ6u0GYbou6J9ZU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0930F8016C;
	Wed, 15 Mar 2023 07:44:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D34F3F80425; Wed, 15 Mar 2023 07:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE380F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE380F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ladn8uGD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPil+wW8ycDBjsum+hvOI+GjemoOVsV3H6GdO9ElKsuB5e9WErwbM2m725wSc17XUHq/yqFEFzCPNLgqTnjC6KgtzS6Z+3bIZQkncY5hFkuimpZqjvyG/iAxtork4Paq1V+2P+PIIGdGlh4J7tavvw4WNW0Bezi1w/xCIJ5zUCfmkYKl3AXcJB+nwmLPVVf4vbxG4vBd0yDx16Wxs1hqNO910zdC3Hp1C+u6JxR35gErBD3uEHHzUAmHjhSq6OyIpDvTgP/v38XbAhC5TRBMOEsSaKd1eHQImAFL8Vgr5x3TLVZEJ9W2fgjaUISYXj3MKLwSUP4GCdhGtpqSQZhX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XHAZ1LedYVT9m06Nwqx5KJXuFNHWXPTXCst3XKndDM=;
 b=SRB78H9C+cQHlxW3cAW3WBRezwDQkRpPBxIRPKOSbO57m/zEJWojprUxUk6AdXf9+H1Oj5zidZ4KX2VhWcTmYZ92KqbjOIzeiMVu+dVx+XjAJW2lnHKdBRn87HUIIL6NPTjCFJAoHf9+Yf/qgaewjwRJsMQ1oxGFijARhWbHQmlI4LR7CpUtJiD/54aYBpQuebrFVYSwNKNT+uGMIaHgsYIMNDiqR0s7hte+7+xfNO0wiZASyFNey1bjotUqzc5quzhHmA3aOurJhvuRIcWjUs6uHB+J3nq1xmLirOO2Qzx76grGepTysIX3wpJVYMaDq7Qu8rTrrHdq6h8WbQYubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XHAZ1LedYVT9m06Nwqx5KJXuFNHWXPTXCst3XKndDM=;
 b=ladn8uGDTtEXI52JDCmQjjtHvqUnsOCRppSHReVDDIFVpCdoa1XuUIk8K68ykxaUb9qzNKdzqta4uKD+l+McXN3MkrnoCTRLEigDZzM7oW7EhzdWYEKYqLJtj00LxNODUbexYg/5n2kaPSII3i9/vH/55KOPvWEpal1VoDacqVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11479.jpnprd01.prod.outlook.com (2603:1096:400:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 06:42:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Wed, 15 Mar 2023
 06:42:10 +0000
Message-ID: <874jqmjz25.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: ti: remove unnecessary dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Mar 2023 06:42:10 +0000
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11479:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd332c7-37c1-4c3f-3ac9-08db25206747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rf3wflmKFSXEvInEoPa/oHOHfwvBNCDuGfWT/MIYrQYTtp9XEJw3V0CH6kCt5yNMorc+RYZYY6crXYKOmpfKRMwJKwaQvwuYLGleK5Tl0Wwu83uEZAZB/5OEY04AiRX8Rp3v61bBtmZLH8cNDpKGAFiQ9/6x3MY2+jvfJxQthVfK6xlSPit42lBoxR0sHj8jqfsYVH4mX3A9ZqdKwjtSgdtvXvJQEMGFnJ+lkpXnEMFjv/IGxEd/NvfsUvZU5RSxHlGfGTR6Hb6Y2Us4OSf5K2hDm4B+IHm4jT6dHPWSdQiTnlh+J7MHZV+RlQdXb19/QR9vHpAuzWpOFg3HxBnCFHkX6hmWNvmsJyzhVbt+Zq8bH1RuKSlaAQR27Xt2AsT46HpEH8t9xkT4ddRCXt6Df7/QVYesFdlL8vnuEt0JB1hwQmUwJME6exi8fjpU5858GFzVV0HhvmooUs23SXNOnWbN682XNWMhwZn0ImBsX28vH3bjWoze4zm2ytxsJtGFT8Vnwm3xeJIW9w44Janjl8QnzfYcL/TXYkeSSSWg5HOgrgMI+eJyUjP0rs2h4W8vOHAKmhjXmBh8A4uWMziJSwINRckuRLE6PfRie+p/6NK9NcXBzLcl112wXz8qYAj6ONdbQp6SmhaLUy6YuFdKQtD7UwWJ7IF25vxyISY2+DGtk0zd5sW0KBJ9jzcf7dG5Fhn/YvbFSm/VCvqpT2u8+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(83380400001)(5660300002)(478600001)(52116002)(2616005)(2906002)(86362001)(26005)(6506007)(6512007)(6486002)(36756003)(186003)(41300700001)(38350700002)(38100700002)(4326008)(6916009)(66946007)(66556008)(8676002)(66476007)(8936002)(316002)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y1HXzJHHPFd9hfADlU/ow4OhNVJMq1HMrbQnZaBdKtNblw8UR735l2HvcZnF?=
 =?us-ascii?Q?JjFNWuvDzDpKFnilJTgGifZUiy4RHqDrCHv+CnWKHwDqy/JQbliITCrRgKzY?=
 =?us-ascii?Q?a/S9lL+Dg+Wib3vgr0xu5Q0jeCw4cZ4eLtE/fzmmy9ckoXVNYt4vn+WoIsbB?=
 =?us-ascii?Q?YvaTdTTWLeWIzcfhOvo4WovXfHNszJJz5JeNgz8JvYBBB8GKTs2VTSCLoIf1?=
 =?us-ascii?Q?DS4HThKjDK5ZttNh+TGLII7OiSL1A7SqEf9bS0BFHPmygfiDSJww0GOfomHk?=
 =?us-ascii?Q?NRz24dt332cMzz+AQO9E/3RGX++AnFFVt+DYCgh7gImr7LK68SzEQVFv4VuU?=
 =?us-ascii?Q?FZ65gsjFnyRQV+AdxFk9m4Ti8liW5OaC3TjJRstcxfoCjl/q5hGO/7aqqd74?=
 =?us-ascii?Q?KLUsp7ekri7eraC6bqLFQbvHmpqEaLGXPagW2tZcwxP9GZLQ9BVGZjTZ45Kf?=
 =?us-ascii?Q?lStHvb0kjNPKMZ/bTO5VW1EbKPJzseHnEIIj4KAmsQfMH+jlgcHVWsacGfTz?=
 =?us-ascii?Q?DyyBrhuXx7+0lx2KOzl53uC1YjtJeY1DuS6U2C6DTK4trllcC1o0E71sv5L0?=
 =?us-ascii?Q?/Y9ZBdUmiozsUAVxgaKTI3HBp9avcBGFbNLNQ58p34/u684JZB26IBQejZUa?=
 =?us-ascii?Q?PUiE1K2gaikXQ+GWUzSqPGBLoTLuWfTKJ6qe/6941b43xbjlyXFlsUQ1b8/s?=
 =?us-ascii?Q?J1MYiplxwJ7nC8TztRLE+jmIW/RQP3HzHg17272IVu8X2+VZz0o+8O6hqieK?=
 =?us-ascii?Q?GeLz5PTgiA21KaIZXY6OAXCx6bXNylelMhh5KeP36oK5nZSBWtwluYrxEhWN?=
 =?us-ascii?Q?vvfN1tGsPW0HjZXZeMqLuowxpCNWXk6pn0ukZmhh3BGyMd/kWm4GJf7+m188?=
 =?us-ascii?Q?XHm6vVJ+SCqWE5vAUP2obcgLVEJdZ5Rax764sBKZ75twCQDvNbzcDhpTgVqU?=
 =?us-ascii?Q?Y2eUdpcdH5J2munDracMwVRUMVKRO0VieJQw546iz8ijtrZqdsoEe73/yMST?=
 =?us-ascii?Q?rVpgBKDWit/FgDrESokD6unssb191wSEvSMlZDuZ621cbymi+BCu80F6C+WS?=
 =?us-ascii?Q?CoIKlnaZvvwNDHvcasHOOnaOKPpZY3h7dyXtNCCn+1lhhKC5iCq9aSE3VwpR?=
 =?us-ascii?Q?5O/JCpLUCYZbAplQbN/lrn0ZwswlI4gkznRK//khhLV7mb0Za56P/agJK7WS?=
 =?us-ascii?Q?s8cXYPVcF2OhjjVj1BoyD0HE8KJbNtDgV46iJPkYNDMvJGhW1V4j37yAnsgI?=
 =?us-ascii?Q?IV1WIk2cJh/TtWl6WcIHRriDnhN6jNCmgeq+/0+1xLJYnWfWzP8ACye0AF03?=
 =?us-ascii?Q?2t6YuYNLLO2J/PIeYQCfpu2m0+BJ8kqyjrCuxxGEEau7USVEUMA3TlnXH5Ho?=
 =?us-ascii?Q?LNtr0JbabgQW6XOVo2sW8aruz8RyafS5GQqjX1UXfbVARRxb4tsEKkOXqSP4?=
 =?us-ascii?Q?lLxJxAu8m5rWWPO836l4b9n304JA51fD2AA6FHN6o8EX7yFPBxVjLpNxbO66?=
 =?us-ascii?Q?ciTCjepQxVYb5odeNrTkclfUrMuiUeJKZm7B4UrEOPhVIOeyJoXse4acxVgU?=
 =?us-ascii?Q?hhhg+0xFBgUU1NbmCUoVhNUo29dmJukz/ZHYiHTUiSTEcWRtxJkxFbjKAzSD?=
 =?us-ascii?Q?0cF7CHJ0Z1dl0BV0OJj/FWw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fd332c7-37c1-4c3f-3ac9-08db25206747
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:42:10.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NPNZNBuQclSDqOk5cGZxTpvl/csDYgHOz3pV4BFmIR+/cQKhodi8/6cfcojF1rs7Nszy77wcyI6bvy2hKuNqcN4NNnBdfnofMWTEZAb8IwVrJOR0R+1+XflrVB9dsMLp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11479
Message-ID-Hash: CHBUD5HDM7IRFUZ67JXDBNWXZTQLN2RW
X-Message-ID-Hash: CHBUD5HDM7IRFUZ67JXDBNWXZTQLN2RW
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHBUD5HDM7IRFUZ67JXDBNWXZTQLN2RW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-hdmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 0dc0475670ff..7d270092e6ec 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -365,20 +365,17 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	compnent = devm_kzalloc(dev, 3 * sizeof(*compnent), GFP_KERNEL);
+	compnent = devm_kzalloc(dev, 2 * sizeof(*compnent), GFP_KERNEL);
 	if (!compnent)
 		return -ENOMEM;
 	card->dai_link->cpus		= &compnent[0];
 	card->dai_link->num_cpus	= 1;
 	card->dai_link->codecs		= &compnent[1];
 	card->dai_link->num_codecs	= 1;
-	card->dai_link->platforms	= &compnent[2];
-	card->dai_link->num_platforms	= 1;
 
 	card->dai_link->name = card->name;
 	card->dai_link->stream_name = card->name;
 	card->dai_link->cpus->dai_name = dev_name(ad->dssdev);
-	card->dai_link->platforms->name = dev_name(ad->dssdev);
 	card->dai_link->codecs->name = "snd-soc-dummy";
 	card->dai_link->codecs->dai_name = "snd-soc-dummy-dai";
 	card->num_links = 1;
-- 
2.25.1

