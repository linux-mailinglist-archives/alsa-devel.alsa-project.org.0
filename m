Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C078D736068
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8E5DF2;
	Tue, 20 Jun 2023 02:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8E5DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219610;
	bh=SQfl/Lm4c4WQY/Ut4U8+MtsIlKY+kvfooTy76LODdfA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jv9isAre1d64HDg+twJqDHtMnmqjzU/1/m8W+L+WWRJ0xoALME7NtKPrEm9wyoUu6
	 9f0IgRY2LwbRBNm2jgCj5ELP6ST6nmx01hDesfZek0w/cABSj2D6Bbg4pOyD/WUzKf
	 PiUAzLC1eIwNX6qbbqQbo0U6ZGCLX+4vq1IpHZkg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C951DF805AD; Tue, 20 Jun 2023 02:05:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39076F80552;
	Tue, 20 Jun 2023 02:05:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0623DF80567; Tue, 20 Jun 2023 02:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 882B9F80169
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 882B9F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KOhbYsMP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+nxJEcdGOuJ1Pt65td2Oh6Sk4pV054pbKI0+UPatmM1/iilwY64f2Z1Y0xKy1mDiWcK+FWSP9lHTMB2AlZZ9XG6lNIwPQ7Tf33Z2NnP3yWVV147py1OtNIqFzb/sAVatFNF9X4X2OPFObM7SocgBkRyKaddswkwHYEYUpCDn1qNRK47TsQkH+FEnfmC1Fa48GJQDGlv2g0i5oKbanCBstaHvWfnifD2lx4pisSGarQhyftuFydV+ohCdf3JP0yXmybQh43+rAEbKT7xd7lq9Eli0R9pRbbfH2UvSwMZQOqnchopRju/Kz76gEZv9rPWvH9hvdbXGoVv7t8AU6BZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3cnTSYNObeUqX/qdhnrop8SoSE+v2ywFfyyC6JIURU=;
 b=hoBIUHNpoGXVorfWCYlWx9JTBa28Woz5graOUljPcunwsUfxukCGcl8Oqs6hzTVA+LLUDxrbYu6d6/JfCxt9a4+5CsYA6QAbMRMIsYsoYu5cU6PeCQdomzaErmyF8UAieWQmhGxoXYlSUdYGMlpcW4Uw150BFnyvWQz84OJfK3CLdeokoqZY5RBrNf1rJLKpCIRL0vA8dliBPl3TQH19yXKFO2nz4WRguF0/Lc859ph1XfuARU0R1tFOEdd0K4y6mW0sIIPJxA945b92hKTrDmRqLFycVgKdcbpzNZVPOa8YFqN6MGzbOQzWpV/0wxAMk4sfUuB9IKEAeUBEYFNaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3cnTSYNObeUqX/qdhnrop8SoSE+v2ywFfyyC6JIURU=;
 b=KOhbYsMPbsuryqu7Iy4ZRvtsOPko56ipKZPcy5XqH0fx6kiQThI7sjxpP0CC2Z8KoFU2j4N6Sjp3oN1qEihs5/U6dWNdqfa/WgBVnIvMFzHrrjEQGweuFpoMXLZey1RQ5O4HdItlORwXWzEEQTxHAzn3VvnEpPzjq4nvH9zK3CM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10176.jpnprd01.prod.outlook.com (2603:1096:400:1e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:05:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:05:19 +0000
Message-ID: <874jn3dmm8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/9] ASoC: samsung: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:05:19 +0000
X-ClientProxiedBy: TYAPR01CA0002.jpnprd01.prod.outlook.com (2603:1096:404::14)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10176:EE_
X-MS-Office365-Filtering-Correlation-Id: 2599adb5-f8e4-4d80-be07-08db712208ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ErDaT2Xc4Rcor0thBVqIJcPqyMjI4Scezhn8O/gjCE2Ok981GfUl7QDPfD49W31qZt3kihdkIR4tinaS5jzQZ1OD/yMvQmH4s6J17ja4dNyes+NWJ/OvmguIzQJ9HG5jEc+XP8uv73yj2rwzkSBrvPuyR6I+IXK3gAD4UHSOr94AfhKcJaINUDQtZYUxY65R9YI2rx6Cw5CDfBTS2/VA6cpEkFn+ByrpQL5c5XbiY6IkaN+s87CkNMSidx6tI3qtg0ZlEXOxAKBhH7wez34dSLXEd40degRbvn7NxmF7b0xF2b992LpTbcw4UqftX0vC6mQ7RWCqW7pBYI6vekOPN6gtdUswCMxdqA6bjKgAUPc++/R+WO96kO+dJ+PolAU/Vblk4Miey98p6yjB2lQOr/+Su4joTD+8zSvoI0hVjGUa/SAYTJfHySeG3dTzE5N5DBGPiI+aIh7bIdut9FAk87ois+JK/WQih20IQM/mckzhsf/wVERR4lmsv1uZ1CnB9NFx1tQV64MHTABuwsYaP5d/86SFYLt/zvuOh//l1jy9s+WZ6+h2pMO/8l1PME366QeHmlviJULRp1uiNPHtm18tfTCWFfq+HNWlEQPCOrjN+DnSDkmaBb8ZyU3MGQrt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(2906002)(52116002)(6486002)(38100700002)(38350700002)(2616005)(83380400001)(26005)(6506007)(6512007)(186003)(41300700001)(110136005)(86362001)(478600001)(316002)(36756003)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fZiR5SqfbAvxCfyBei7joaWC1vVxqO52bs+/GH9JapU4Upf78j6lscuDgck+?=
 =?us-ascii?Q?NxBcODBTkAlAocwzefN6W6cXhu1nUwG1iGh8jsKpzxqle6qmUrbIezjOHIhC?=
 =?us-ascii?Q?OMKzv/cl7JdcOAW3rFQXWeZhg8XR0rdCZCGZ6AmzOdvjjlPD/56x/GXgaAJI?=
 =?us-ascii?Q?OEhepOwPOX6aIHSu9Xc7Kdq7hVcdvkdfL7jH/xQTsWk5mNpa3FL7rIjJmhHu?=
 =?us-ascii?Q?IlvmP5IG6I6YlPtkS6AErMojS1eJZZYVignb7INJGumI8BnSjQ36TLOGjvF4?=
 =?us-ascii?Q?JRoNpJy+r6Wx0woPmZRSUrJcaq8ZFgKTqVivNrTghvwtgUauvqy3fIU47qSy?=
 =?us-ascii?Q?1yDre879G94/ndSwSr4yOk/xppp915cjsCxdEiclxPHQUMeRp0hSXYNMYZYS?=
 =?us-ascii?Q?oASAL2s1bQbBVlbEvwnO5tM/OcVoKjuokGn1y4VxZ17R8EDTmaMWUsjvtD8Z?=
 =?us-ascii?Q?RIRXdDxM7blYNWXCyOANcAPzJus0SJCT3Rltrdm/3SWvmm2VrMiFmXr4JnFH?=
 =?us-ascii?Q?YqjrTzkMm9NLJfU7z7BslIxTCo6nGAcd9NrhbOw8m/y89XJ6gSOCD7v/B8hm?=
 =?us-ascii?Q?AqTUAkR5HalX8UrSejFjX81EbSm2EmzxRD4mA+oL/eu47sZlLGCZ6zaLkyUI?=
 =?us-ascii?Q?sNSDDE52QhAIFBbxXxKVVk4bHwMIBkHcAhkeEnPhr7DjKHPf0GdW8pIvy4zY?=
 =?us-ascii?Q?EzBfZpITI6X2desYawvQIploin2Uz/m6NMdJZXpaemDwpOZ5rf6966VrzenP?=
 =?us-ascii?Q?r1PxCR75QUeZXzHred11o9Ypru08ze5xC4TR4wzL1tUwTKb44bYmhSwiGvAm?=
 =?us-ascii?Q?tniJj61wxeU9tO3K3YBQk4zPqQVg0sXn7ltpAwDF9urrFhefyaHnKO0BoMBB?=
 =?us-ascii?Q?+Qtv7ZYF1+loADMR4/57qm55BKK/0B/yFSf+45ZO+2M8MGvSfES8MK/981SB?=
 =?us-ascii?Q?xlPjhfVTGGSjxLpRgmzo7mbAQJcO87uRq5bbgMrzRkT+fNenXKACW1p+Goj7?=
 =?us-ascii?Q?ykrX4a93YUKAthhC3dZk0dMpuRsn64mYFz9R0W32PX6XD73mgHNBomnHcKC4?=
 =?us-ascii?Q?161P2+yLo5sqdNUM9+exirJNAwfeT8S8JV5ib6CI2CwBKxUZlC+AC8Hzenyn?=
 =?us-ascii?Q?QymjvGd0J1WaDyYMUuKA45BLkh09YzW0OCZrzr9dY6zWgxpS23Yi3xJwqC1w?=
 =?us-ascii?Q?syjWlIL1okPXcNcvw6tjqzNN6T6pHcHo+6n8hXQBIRhu5z95erk6Ww+/yjsg?=
 =?us-ascii?Q?TCCb5gvq+O5UHJ/KjVFDwC12ezZMYkt5qN0j+3kcLsQTZ4MA+XFT6IOB1+bD?=
 =?us-ascii?Q?P/joU7uKI365vdsGBTRHmMQELcVbOqyFNrRvaxl1mxIDJK0tNKYbs8G42Xig?=
 =?us-ascii?Q?cJ3tpRfTj5qlv5ZbXnxkrcRIugJZDITewgogaTQqb1S7ezh/2o+OxU5IJI9x?=
 =?us-ascii?Q?Ccyf23TjnaqnekuNr0w7EucT6J+Wgarymd/Vickm51l5VtzORGxZktT6c3bC?=
 =?us-ascii?Q?ID67LtHiZosCZpY7PDNdhhXQzTbT2mhtAYsBlPPsCD69/W9kd0ZUCEYbAncG?=
 =?us-ascii?Q?OCfTYwxn/etoz99VjPKW4FokirZFf0ORRshsWnt1kUrcVjOpBW6/XVTbju9l?=
 =?us-ascii?Q?ABzYYM0D50BoBynwNvKs43Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2599adb5-f8e4-4d80-be07-08db712208ee
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:05:19.6731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aBEfJcyxdLka5N5Vb33qu1rg6OulnYAOESrKtJ9/p4ZI8Q1v1EHDDpGAxdqK+1hLN6KL7g36QZGgrdJ73PY/I/vXm9pwqe9AevGZdANjbzWAdii+dMV1/q750QpAC3TU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10176
Message-ID-Hash: UWJDEYHDTBGBOVXDWXM3RJJTMMO65M4M
X-Message-ID-Hash: UWJDEYHDTBGBOVXDWXM3RJJTMMO65M4M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWJDEYHDTBGBOVXDWXM3RJJTMMO65M4M/>
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
note: need deep check


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

