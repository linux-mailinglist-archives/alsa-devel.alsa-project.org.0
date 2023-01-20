Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7125674DCA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:08:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FEC42E26;
	Fri, 20 Jan 2023 08:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FEC42E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198501;
	bh=OtB0k7w7C5eN3fH5vimG8PR/80l5CV+fBviQ9eaoiTc=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KbAJn/OjuCLGrCEX2/uPYIVfGnZgQ4Gx1jXPUfDdhYmGgDVHIXQXBgpg/2DSZkhhF
	 2YX7t2Mbp0PRCZu8s3NyMUK+KCb/KvjRdsauq6kCtBC5nT7ZXXgWovFZfdYqWnHETa
	 WohJzZ3PurM6OhYvn3/YpFTWBNFBXoWlkhVL6mFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A2EF80578;
	Fri, 20 Jan 2023 08:03:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FCB3F8055A; Fri, 20 Jan 2023 08:03:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8685F8055A
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8685F8055A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ft0U9X0p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA3PYdARhE5BCJwHq5Cr6kDpfW2zlB29Up7CDS8CDCTtdbEDhuupMPr5uiYDOwsRZeRKtA0cbbLc1AjmOY79v0Q9SNZU+Mqa2u+WcqH57XYgri4woOomJHhh5GmmufVV6belmcgVCMhBYRwOs/9x0ukS85BIu+SeiVQZlzG0ld4BJJ7KjFixD+1i5ZKQ4YL5vzN193T+QeXz509gy05+R+0mbT8itSm7Tzv0ORyqwfkCFn3yhP9Fex1X/HgfmAaRzlxSbzfeZvpVG+Vd/Z55L+jbJT08T5ZSrvAolmZXBJ0BfMDnzcok4jideCUyVJV5WWedYmNPy/QTgUgZE4pyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STP4KVKhcbex50z8uqxnD2lT7HkMp/HK02DknQellPw=;
 b=CFyNyD5NgRC71p6lJRdia9+KfFawgX0kSL1P7sS12b+X3qNSaRB9TPLTTNAO8fEAg+aQnm1m+MlxT6FoWfhNoIgA46jp/q5290D+6QDelRM4lzM3DuF4UyrFtKS8ne8TB05cMvPyzWcA5F+nyOkhBJgsIMr94LBWWn4oIYQUGJrYOXWN9S860GVfCkygUhms3sVk7Doe88OK1z1tgaE+Alig+hInFAU/ZSwjFbtPpTmr4JocMwUN+3f8Lhi4i543GBMLbNAiTNj3gI4CMOiD4bTCoNgpcRxJlu4cGZ/G80YjxPsBheEyM676PM0BlIfyHGJPZGRgGHOIjpObKqiqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STP4KVKhcbex50z8uqxnD2lT7HkMp/HK02DknQellPw=;
 b=ft0U9X0pE+JO31AIHwIpSg2WX8PjQt9RpDfnFFrew8qxucPIYhq9xs0fxP1RK9+mXZ9VUN1DhXmzc/A8etq9wgAXYTdSUJy4yZGBBLET5uI2EXu4NU2UTMC8J1kvD9oUsxpTqmdkRaG37OYG/7EoLLAdadifJz6ilc/pW30hSEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9821.jpnprd01.prod.outlook.com (2603:1096:400:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:03:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:44 +0000
Message-ID: <87h6wlk7qn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 20/25] ASoC: soc-core.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:44 +0000
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7e00bd-1dd6-414f-df5b-08dafab47866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PuP3KFSF3lpg+PyCPM4NvNstxwlxmjhuGUq5n/+AgRoLyLasGyizxH9kfxwpnhgoNXG0vLX74DP5raSAWMhQKiOu4gzkaGB/1YmHLFsYjuvIjGipiQ/cmib18dHLaIlvcNTCExNH3DdhoP+L4CMttGUZqlWtAFg9kc+eSHsAGkVc6FjuXRfBMDpdPa9bn0vnMOQrY+OdGV/AZYIi4G/xTpFvA9/9ftnti+bPrYv4HZFQh/+Bc9/1ywagiqN1P+tLtEmMqIYzKfKw1uK8kFIZo2/47S2TrlHMizESoOa9v6kn4DBKZSMCZ+WNekISN1hdj7oGy6MzBwqCq0xN4EvhaUqFiHwZITLnWOQnRuBjf5yEVrfXiZLweG2A3uqiw08Aw5qv5nP1adpWDTCt5GiXBqKRdmldLxf3jvlF6oWwbtzv+q8uY3zvynacL767b+xhqdId2B7emLnBS8IWglxz2Iv/iWkeuy7rvdQFQkvrk7o7/S48aLmQKd+TuW4XOSJ3pYkPdLEjR+78Sr4QHjzywozT/c0ayozB5TjFiUxFaOHtdEBF5hc8u1dWiDO+1RpMlooYk0Kldq22s+7jF4mRBbgYaFs5LEoMXO2HUvP8+mBcxyIz37K1LTveY6hewPaFO7Hdmw+XIIKCnOKyA4tg9n43SdoMcHl59C0Sld3zdB3r2ydl/YLX76Esj6qDax8zjDMA92kCVza4R5KXQH5Fww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(8676002)(36756003)(83380400001)(6916009)(66476007)(66556008)(66946007)(4326008)(2616005)(7416002)(54906003)(316002)(86362001)(8936002)(2906002)(38350700002)(38100700002)(5660300002)(41300700001)(6506007)(52116002)(26005)(6512007)(186003)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rk+SpRB7WeRlnZRRFHyepH2yi3fQIM7mcSj/MzwHepL033hU7Q5cVJl+KtMv?=
 =?us-ascii?Q?SOejwY9SZT/E+PJUgKT2vXCeyEtnri0LEztxirLz+hpjla09HDgo8k0vv0dk?=
 =?us-ascii?Q?L7sX7BRNJgn3Hphww9CiqCoensEQy3MD8pDWmtXsEi7zXYncFbqNVBdamphA?=
 =?us-ascii?Q?x3GTi40IKKXkyA54FVh5WJN9k9jhtNEMl2nq70toHVhZCfUjZ10b+9g/33uJ?=
 =?us-ascii?Q?yADc6/lwpfgObNVnkw6/H7O1wxQWJVYprlHffL8WBFWvShT78hOGG43OmJv9?=
 =?us-ascii?Q?Hy6wzSNtg3y9q7yvxuHn4orQNlQC4tI4uhN1oG9Nh0HdeUPva6U+cUxa8q9J?=
 =?us-ascii?Q?lmvsfFFdxC+G3/MYj6pa9gixzeozpDjKy8HmPH0znTceBZz0+05QxXasmAdn?=
 =?us-ascii?Q?rqZmdwt6dwFtTZD92UIVkfg/lSKmkJ7Psa/rJcpSJdSMX0yZkZKjhMEaMQTC?=
 =?us-ascii?Q?tDL4k4o3W9WQuKt+k7DKuQkDiwID0pOKfprSkU0yTjBeXIHTVsVR1sv22L/O?=
 =?us-ascii?Q?UQDRwaroBFnZwftiD3E01gaFQDuIUXPyCRk8MiSqflJf+CP7AcPJhr5jkBKV?=
 =?us-ascii?Q?3G3UrOIm4LFK8spDiChkmY37SA4hC8gd6Zb6kIdI3FnCVF19tAmBILup/Ehz?=
 =?us-ascii?Q?GFpLMCqRh6lwUZXs5Duq3jBkAA0aipLO4b3gF5Z2RIInpQZW/p/7Xi1AOvae?=
 =?us-ascii?Q?yxqkfFA7YQLvcyJx12nIlamXg9Fgyx2hqcyf0shjij5nSVUyX8XyQ/l0oPvz?=
 =?us-ascii?Q?fwz9zaQ6HeQ5k/Cmz+tUA+juXpBlhni8voYHSXvovz/HVzanEvONgPZGvqJz?=
 =?us-ascii?Q?cbXrxk3OEFZMKqbkYZCzdcTH2JdZ6pADA/WHlGbIaVvQqm4w0SqhHHkVmR1L?=
 =?us-ascii?Q?MPTw/4WovAWRU/PmkpLJp7YHEI7rFav4KrubOAdfgH5Z7buKuEsaJcfAMyYY?=
 =?us-ascii?Q?3d8Fm55LbukV9mXMOV4+S84Oanovv5FSZHmDfT8im2i19uayvUE6yYCf7fc4?=
 =?us-ascii?Q?HHGOsWjWreowWcN7nxJATWgWD0OGJFns/3W8WVplVnQAa5JEmpVbucloGUrn?=
 =?us-ascii?Q?55AqL9UTLFMkHeqJH13C6iUt0iO3dZ2q1FmVSfQOEdwPgZVAObIBxoGV2FKy?=
 =?us-ascii?Q?qh+HOXlpJfwFvpPpsVsjWEYmBv/dKMvkf5mi6yDXURfXGQpbothgLOUI8fBp?=
 =?us-ascii?Q?OPnFClGea/jKeYVhoEWO/JroM2dTl2oRH3pB1OVvPPlF6YShArc1q5mzULAm?=
 =?us-ascii?Q?xSxRRRfIoxScJl3aTJCUdoXQAN1+1fOYK6qoUsqA7TYmkibH6ehX2W9RG+Ya?=
 =?us-ascii?Q?DBhp7KGchomj/fPXi70HcugdF3IAmuyOaf2SqHKig9/Zv2x5dhZOBEN4ln2/?=
 =?us-ascii?Q?3vGWjrp+7FkA+COq5gUWGji6aqL7OeaEIFSdSyAauD0G1UztQYHgrtAofcWI?=
 =?us-ascii?Q?MCnh0xhnsl6PieC7zRlo91D9bFiRMGsMQZ6WsyXj2ICJZs8Q1ttv2i7wimLq?=
 =?us-ascii?Q?k0vbxCPR9BTfC075rpKqHot7a3CrFfZuwo7hRzzklmswYEye+IHs+3n4DMaH?=
 =?us-ascii?Q?2xFbF/G4LsgI3JedDdSRwzcdF2s925YaXyBOpGrPeobi7bqLz+wsNnE5aLLL?=
 =?us-ascii?Q?xmMHNYBcutKEfdnfQWgJEw0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7e00bd-1dd6-414f-df5b-08dafab47866
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:44.8817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3v2nS5u7qgL5VQ16KeCnOUxjT/k3jhKLXMfkQKwi7NiaCGjqWgaUjSSi+vaPqLwn5cVw+m73PSEfuelY+8ThdZeQDIC/+Dp8d9LHdmCyixn1StkhEWDickyRayXrdOg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9821
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
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e613698824fd..71b022f7edfd 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -553,7 +553,7 @@ int snd_soc_suspend(struct device *dev)
 	int i;
 
 	/* If the card is not initialized yet there is nothing to do */
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/*
@@ -695,7 +695,7 @@ int snd_soc_resume(struct device *dev)
 	struct snd_soc_component *component;
 
 	/* If the card is not initialized yet there is nothing to do */
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/* activate pins from sleep state */
@@ -1915,7 +1915,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 {
-	if (card->instantiated) {
+	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
 		snd_soc_flush_all_delayed_work(card);
 
@@ -2126,7 +2126,7 @@ int snd_soc_poweroff(struct device *dev)
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	struct snd_soc_component *component;
 
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/*
-- 
2.25.1

