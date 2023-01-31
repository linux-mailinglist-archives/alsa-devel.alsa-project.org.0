Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0E6821CD
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:03:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC75EAA;
	Tue, 31 Jan 2023 03:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC75EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130596;
	bh=rC6vpG1Ta9mnRrdRF74hBeGJBtsTTlZH2sKayhKRNb0=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XdYcj8TDzD0HVZWeMJpeEJuuXexE2qD92l1+f6j0YTY0BnTdKa3wBtU9FVm1P7Fo9
	 hApSzCziyeXbB6Cl6HEeypUyxCt8jCfa8Bh/7FJfKO7w6JewRe31/9RBscbFKxc6wB
	 STCL/59xs7zz/OcNWRjkIHQGwgPBJ5cMlnPQxPHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF4D7F805A0;
	Tue, 31 Jan 2023 03:00:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F25CDF805A8; Tue, 31 Jan 2023 03:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2110.outbound.protection.outlook.com [40.107.215.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 056E9F8047D
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 056E9F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RBwtKBcT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ep8R2asfZBHkkZPDjhMz60ZC75exTkXP2p4Ps9HbS97NXMZbM6EUd/h736pZfN3eXyrS6sWf1zgr0dldjMZ1UnoAur9hzQrwYK61PUG+u14tJ+ngEUkNtikV21Qa29A681ch515fSmSDrw9xZkqaeaRN0LvpIlz2/AuZqn2gQkcDWSQflATeoEcpjTJlRTxw8HR1VtYzQ6LaQeOrXYJnJHbCjq4CHHBAbZMKSLX++sTpvTYIWVRfOodNHW71erFP9mLAjc65dexOWUrX/CAe1p2uuPkJzWux1t0NgNpB2XQH9fUEkrItCIEFaRWqMLduZVzI6xS5mliL/sNuYxZ3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2CsvswnVRA/ZNYiMOCeNyvKVtXWrxiY4lp1NA2px+0=;
 b=icwBp65h3owhX/YYuVIE7VqsBCb/uLBwH3HbKxDoD89pkvy12sAV/7XoZu8HIUV5E1csKZR72ly45XRIlDkEXUiMZL8Yt/IsuwAwNf44jjIFCqyyJygbOksOqAzCiybpzsJ15gjJr4nJJBvjIT2uGTe3nt8y1Rluu5a5A9Az8/19kotbopbGhJ2QXDBCjREsIruJMS51AgwKHzAg0Bl6WrRGbsfj1FxWcuzfLvlvHrFVkUQlqw2+Em2mdzakPmrGwNm8BCedOJjfh+1QVsEMW9dyBsav3/1gQohcI8+mn5cx2O8f697t3q2Ii5xNXCnmvYwAWFoWX06nbH1uaqQokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2CsvswnVRA/ZNYiMOCeNyvKVtXWrxiY4lp1NA2px+0=;
 b=RBwtKBcT5UjBI/Hy5AUOgKGnbAsie3ZVoLTqOgwn3HNqr5V8xcnVSmQoq26cGGuxKKgZ5R+/xtsV21CYq1pO334yBXEbawyqc0DZOLe9ERKzSvoj5rboguHwWKiBDrQM0KZ+Ky2Z+dS4Yd8slT5IVly/fQv6EVUIEqC4gkCP+yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:00:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:00:37 +0000
Message-ID: <87v8knea4b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/25] ASoC: sdw-mockup: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:00:37 +0000
X-ClientProxiedBy: TYAPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 67251462-5d91-4ccb-0e02-08db032ef249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b3LTBMZNKdzIqjsBghlYYC3A0iN7HDs2h9HAe/p9HSS9EzHJMqZMwARePMSmrRLcmvTCS2AZq1sWirAiWjihvksQ5lbl2GHh1Tsdf+hiQyOS1bqM40duWvymxGhqSUA5J01qn4hvh8d+ZBBlB/q8iaFBmgXIvHpBqeR5e3G4YyJuriNSIJz+xlInYLW62R7B6gBBTfZPr+HBWXE6QKGTPn7ZOtuG9vm5To3dNDnER+EB2TXwMkmx3Jkuifm+IyZrzNuKhVpVanqxVD3Zu5iOU6HoIbJln/hWd8IPxvEKToSIH8ec2jPr8bNEfze9niRXjGa0PJeWRWAnX39FBx2ICOuIhoPP9FUutv3jd53uDaPbM3WKIbtwnl8L/+cUrPW1/iqhZKrFrKUhzh0IEwnfA9Z+8AD47gd1iJeukqdHZTmWvQLEt9J2hoCmtSY8bECNFulWnQ7BBoKP56RLhqbVzxWj1yrKMsmZGgFbYBxlk2ku+4OjxTlexDAg4P+tbeL4gwnllzsIv4Cwo5p4OUz2No68W/jFYqsUgkTbgFfxD0y6FXDuaR7z2yIRbzOA+8X7l9E5ArscFRCgfjO/Z3iHpNNqrY7aeOpcTic7u9FvVgHo1G+qGMSMbboFCFyc4XwzCRyd++uwSwkJ47Pjc4T7gvBGlBHfATZeWcvd+FTrBYRhTM8AF6QuzjpRYpWzObsPj5plEV18ytml/lEPhwDNfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(4744005)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KSHrpa7raa5541WGtpCG9cHgf40ykXt7O2d1cRZ8tArl9qqzYcKCuzZIsUxD?=
 =?us-ascii?Q?BGAUsEdYAs4H/2w9r/dY2m4SuEk5BJemfPewQbK7HgbX6ZcCEJsvtS1/HkrN?=
 =?us-ascii?Q?U/+wVH3hDHOupUzDOmeaL7xWWZs5odcy94h9vTnPhJF3DhDSyjnhc97pQr6T?=
 =?us-ascii?Q?oPIwW5SVfALyuuRJ85cICf1684U1klbLE6+tsst0ebyjbqQUM7XfzSRV2cRI?=
 =?us-ascii?Q?j97s7EG0lbh2/FyawvD0/R2eOfKOniggJBEjkiOf0p/kzn3YW75FrW8B1r8t?=
 =?us-ascii?Q?b9gI4MMIhn9mXbXxryaIBSwzri13MW8P2KNEMwrVW0fmNh0bEhDiXVTlNAqT?=
 =?us-ascii?Q?0O2hz1nXgsP9Eu+OBxMFajJYcCy9u1HuVd8mhho06l0aqTd6yIhx/x+mcY0v?=
 =?us-ascii?Q?VABURJipDdAFPiBlipQomOP+ZgrKkKHR1ya37QAqyaSbDH+4EYveesyVz7Fj?=
 =?us-ascii?Q?odorY9T83WSVqeF7U1B/jhcBrHymNY+mJ+OTYVlvxJGMsimBaroLCFy898C7?=
 =?us-ascii?Q?QzjdYFROs21gS3RudmrkmNBDB1J7T+UhLbE/thOLaK8hLVdPLlQMdJWzAwot?=
 =?us-ascii?Q?yXyF62RWdPswGcx/1KpeBnqiO1TpXKySAFkgi2xgbaWtl1ku51rA+AXlLsAi?=
 =?us-ascii?Q?Ezu64u1kKbplzn5gy87PNPc2IODEMspQHrLf8GHlGGefMhwr01MQeiVrhVgb?=
 =?us-ascii?Q?8IrzFT0zLwFH6du/L7pGJ9hZ1TCEL4Er1eiuiKtSGiU41fjSBm2Ca/m619c0?=
 =?us-ascii?Q?UKYIgvZCwhrQVL2d+b7VikJ/cc1y9YaDIfeQo2Rslrb9GPz+IPV3G7y0JWn0?=
 =?us-ascii?Q?07calh0YISaT3SAHX0YNodVTahgp57KziH7vpDPb6ZDxiyCW6G+i3U1aIYvj?=
 =?us-ascii?Q?qdf78klEX6puCw5+qAmoa/mkWls2VYgFU6hBFGgEq2H4MqMbhxI1qpqweagN?=
 =?us-ascii?Q?cTBNpl1I0jzVDuVNPHCSQWXwGNhqnZZfhj+0tF/TbMQNcCTwg36647aSUczh?=
 =?us-ascii?Q?vLHycEoQdFxFGK96C+WuKoTGq0zCaRx8JVC9pXgFe629/NV5filgD5EHIQMr?=
 =?us-ascii?Q?3NcyyIaO5d717Q1uFaySmIt1X+DiQBfaO49mKVgyPfQog7sbrUoRXLO36elo?=
 =?us-ascii?Q?7UY2iOk3hkJCwA4MdX7Am4+VwMo7mfA3jUeKGuvtLyqcFp4H7zGRFj5dYDIC?=
 =?us-ascii?Q?qKhAOv+exsmXcUxe39Mxa6+IZc3vvICjkBttVGWUEHLXaxabB2h1hGsTTdgh?=
 =?us-ascii?Q?inA9Aws8hyXhe7kL//AHhKSWREyiLoxSWiZIuzexGduHtlXYKmT+y6jzGZ48?=
 =?us-ascii?Q?t23Y1Sm8ziZnweiouyhlZ2izsfr+v1z3owfPhwyLV+9HgQ7sPpGrF9W6e3CT?=
 =?us-ascii?Q?oeMyCSMl/i97mTgNRzSDJ9DGepoDk+IgUVpJiGyFxYoEUxSdga9nbd6mRSsN?=
 =?us-ascii?Q?sW1pvBj8mjCMDV0dj6usTQwrZJkrYayZwu3KXdCV/tm9qb6yU6fn5VCZgFJd?=
 =?us-ascii?Q?vZB3tOZIT5gIjP9NDF5LLs+A5pqzAF8yxjMMlXNXAtLrleq6spnX/JuQSfj1?=
 =?us-ascii?Q?qFXebqZtYgZByKQrzn+lQ/0kojyt03wI4Zya2mUsjuRZorZZwF2C+mzuhO17?=
 =?us-ascii?Q?QVe5wRw3ehum71OvtvtQdgw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67251462-5d91-4ccb-0e02-08db032ef249
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:00:37.2091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaczDUXqK4nsuY0ENGJzDVCjGAcJFxZ86JXMf/9xd742LROYG/rnb98yktbSFX84di3Hio64Lgs6NQO4pXFrNbR4AHWki41Nm3zDbjKsf2lYWl6nNWQ3s8+k9hV0jPSO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sdw-mockup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index af52f2728854..62b02d764f09 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -57,10 +57,7 @@ static int sdw_mockup_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

