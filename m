Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72D6EC3AD
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:38:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF05CE92;
	Mon, 24 Apr 2023 04:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF05CE92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303913;
	bh=ZJj6L2IyHkU0m7v70oCDiCV3ec+Xmvy7r5v7h0vA2fQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TdXyceVfdQ5RU7XVujj8BNlJ/G2/LZtIctvXNay96wYs8YOt38fstKe1+HFczD9od
	 8bguAZwYwVbMf5OWs+VtYdYk7cRD59Qga3H1SYfzpnZrvqVHLaLpfsoKNrb9mKhPXx
	 aJYcm7xH4MDWolgyR+45ATongi3RBK/nlxJ2jkCo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A50D0F80549;
	Mon, 24 Apr 2023 04:37:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33F73F80557; Mon, 24 Apr 2023 04:37:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 60621F80549
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60621F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UKYflfAW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFqMdEewN9UQ/6BN7tFPKH3pbTxiL/uDG+sv9Nj8XoXCb+EyHhowTQNSw8gP0Jk4tKyc1PetOtzURCMZ6xe3stVwipRrtEUR8CcigIypFRpI9U8yKG7wsCM7l+9DWxRIdIFGzVs2Mc7rGG60wPoKEhS3+2UmESwfDFBe+0H5AXcQ1oHrHvRY2QB7Ls5wYI/g16WCDnixDl9wcRakg2J37Kaq92w7QNsr7sjqmY9HIREwuP/wVxxESNg/QvCAtpM9FguOg67sd2ukqbrmCJzX662KETXXacy0EpNFdq4k+h8Zhb+fG42WyyN2149/L/WuyBHnJZDiKO7Gj2bDtk9XSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brsO5m2NcuD7PSPK7lBj8uHBboetIwSFbmapRzxiUcg=;
 b=O1dh3UZ5ZNnAI5Uu+fkH8trXRris6s8gCOc5Huhh3hzl4Yg/FC3M+Su9NZQctt32YgClNx4Zo//v1tg6jVoZTnMV2pQPf8aR4T4KpaJ6Ir+tHakBE+EveGQMQnTEyx8iZldrEsKLGusovFGQt+p+IvSH9IsnYRNJnKUxz+wmDTMOgve6UnAJtW0rGfw3qbwe667ELociVJw2iiWVy2q/QisKLyV/bxo2FFKm07cIJPJBPfxVuKDXRo7L6f6tfZBwNmSCCo46jM8twwOHnP6k4TN+Y1oCSIqG26P5edXDWIcA0Zqr3AmWS7SsOqQX9zmSgMexxAGVKEfL9cznKrGaog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brsO5m2NcuD7PSPK7lBj8uHBboetIwSFbmapRzxiUcg=;
 b=UKYflfAW5Su1weGZpCq7pquUE8QHXkukKiiTla93rFzRpEhSw1RYoWr+RzGiJ2XAYPbNAqdhvYIbEO/AOi26Fo6cFH5xg2Sx14FWxViir4OQ4hL3U45MwvbMnn2v1BQDGBwnc7O8xUhQ67hOA/PPUQ8oC/w2cJ2A65bYNz5yfDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:36:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:36:52 +0000
Message-ID: <871qka0zwb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/13] ASoC: atmel: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:36:52 +0000
X-ClientProxiedBy: TYCP286CA0180.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b924fb-1d23-4fd0-b5e0-08db446cc354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IJaLZdDGdAPZymKxHiz6fiDmyFttmhiVopcA4zRIhJlPoarTMP399/8K5ZIb1v2EV16fLEeB1j5t5H06dtliSHiaPcF8Pne/dSIqF5inItr+F4VcbWokm6Sh3j4yIDZhYlTiZNx1h2EIHToL9I3Ux4uzN4/LkXhmIoGTYDIf4qF/RM+nE+UBbDLKG9bRcU3w9mDAJU2IoTEpefbXwnSDuzCTrT+VTrhzJYCmsCcSd5hBDxkYEFsN4I65//s9tCUbJnEy1ZuJlKc4KA3YJyZkJiLCZpvTPYvb9pMHEMDc9NGDIxJ6vLVW4PoUd/L8voJtttJ1uSz9mmLZ2ktx1/VDAoNyuGuYXezw/X+VsLSFUYRcqb8H+gbfQh8nNBnzlDs0cWYbzzosTAUTeaXN7KLmCwzfTTNoN7F/NeHe43cxq08fQ/cUktXGRovXpw4WhyvwLYoMvc6iQOPIiacvYTl59kFFu2+hDU4OpnObGHy7viQpHyr4H+UPu/lSS7VEdJ8KqWVYOApwTZ052j1K0MaoG3a/qqHYrSajRR/G3ANb5bwvPEdi6WD1tCvG9KxoIwRphAoe2u/DGjyFv+C3pkN4YTQSiPSPqsxDJNEuO8Tm28+0DKZy2lTpkA3xmDkKXSi7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(83380400001)(2616005)(6506007)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4SQLTalXFZFQJagPcFIE4gEVVnc+7Tj16oCSSF24MXq+nGzbp7ecEvsjDjD6?=
 =?us-ascii?Q?0a25yiJ2vysTgOjf0tQPgtvqmu0JwVYhVYtuGrkeiiHfeae4SAIpMM8YlJoS?=
 =?us-ascii?Q?knAqb/abbxSIF31nMY7jkezeskVWIAMuoppBP0vGz/J5r7UmVKSR3wvG/pWP?=
 =?us-ascii?Q?qhCdY9vffzIqxaNyiMxsam5ck6QIc/cbTspF6wbmtZDJqoDfJNbe85yPLP4o?=
 =?us-ascii?Q?kzMqNHfaP0dPID6fP6HM//w558gnp7a/v06bC0sL+EXjKL0yP5YB8tLpBgo5?=
 =?us-ascii?Q?Q3T5F3895GdUpNGGW+hXG2vZ/FoVgM/rGjrXtjLUXOy1wTqnvvTF3P/RBnvH?=
 =?us-ascii?Q?7c9cBvbala5lgx14AHPjKiuZMkBgr+EqIdZdFeAbmKAaZnZfFYUL8XxCXpfA?=
 =?us-ascii?Q?ScbXylASsyKdW5aDcC4kt76aOhb5XJbNqNLupsWMigNR4wzvLqXc6s8H5Z2j?=
 =?us-ascii?Q?dLy7M+rHG6U6Xrjx+HwqUZNYci9Ss3y7sFZRAnU5zZR92PGTnRMwfiJW/zVa?=
 =?us-ascii?Q?HD+0lbbz2R5T1lFjxDoGxD/eMcDXG5a6XTcKal0oDmO+PpisLN6SovC2bOGt?=
 =?us-ascii?Q?0DReKwj8FTAYgX9C3EExSjyCbMbVcYuFk8Iz2WiTqViUMbIjHWDbrubBuQaZ?=
 =?us-ascii?Q?/obRvtk4kfYUQ1kMLYM7HhWgzZ25GyyMgT9LXkED5UgHv0igiJSgmV/iDGPT?=
 =?us-ascii?Q?2nNoLrs1QXoqgdH1/fH0/mEchxX0J+wCiLSsW3yXzsraac2lKdSJRqflfsCb?=
 =?us-ascii?Q?m0MRhs8x5zJ8TI3rH4SqoM5u4q5gTLtC4ooPRVCAmJz3HH5iwZpSTe2GxoIM?=
 =?us-ascii?Q?TM6t24QPbpZUmi7tjYpk8FDTlKg0u/9N2nIz40Lwom+GVxeGJesqMgHjY9Fh?=
 =?us-ascii?Q?FFKNjNTsGEUbzV9leo/+g/MXeKS667swCwVo2bhW4p93sgZje/E+rQdR8FtY?=
 =?us-ascii?Q?uf/42EHhnG7W/0SwmIbyxMsa0ZZKWHjodXPXB8vtSJlqHgEo24nscy6IPIwN?=
 =?us-ascii?Q?j5JwmjVtWghiT/7SlhtfA/VrPdCSPW6M5G6hiQNeJVOZB+LPLef4/7aliVnN?=
 =?us-ascii?Q?RYDWZeqx7Bl6jKfPCTQQ+wglbIL/pIavYet1t7yWWSJa0JQW1QVjMPp3Vh6t?=
 =?us-ascii?Q?Rh0hR1Usn3GvxReX8IRQExrzc4QNqR16dGSdJI5U/Zg5J23tUfFg6T26e6xg?=
 =?us-ascii?Q?Wi1W4f+gnRLBmDbGWf/DSOFQnPM4+FirrspkX54kkswsIV+kzblXACwFCzWe?=
 =?us-ascii?Q?fAVKV4npDsQOxhUBS/5pKYJ1AgwZ9Tw/YoS5Fbfka5aOGWPxTtJQmSXNhT09?=
 =?us-ascii?Q?L37GMae8bR0WTb/OlTRYhu9jLorqBS2EH6QPb9E+NT5doRj1eeQvGXHoF69T?=
 =?us-ascii?Q?u/Qk/ybAMij8YHzJG0L33626PGmyUwvmckzPDOU47ppeS3lz2hDlaR3lgIeT?=
 =?us-ascii?Q?oWi18GCatGO3r9S5wncm+JdBjTYzCQ5mWpYoJ3Jm3DcV+4j8yDM1gEaActLe?=
 =?us-ascii?Q?t1351rWWonhmDWf5GEPqXRjxh3HsqzF2UEFCpbHwL/rfHdzX94E4IT6hYwn4?=
 =?us-ascii?Q?ZQrFoePKcWR2pzH2QerTMBpWzIK0Nvbmuhe2cjJQvgbXlOyDvkQQLHsCxaQv?=
 =?us-ascii?Q?LRF3SxUTlSn98nBF50+lS8o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18b924fb-1d23-4fd0-b5e0-08db446cc354
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:36:52.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xyPbJ2yhrBFkcBTSLKibBZo9Ra6dM8QhixuDE+1BwAmrojYpZURzqI3aWfmLItGP9J/x9p3tAAgj7kAeVJ2pu+pnoKGFZf9elPT5V25ZF2yEy0fyObZ8xh2j12dF7dR8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070
Message-ID-Hash: CLMVVSP4MJYOZHZL64KPGJMHG7YHTFT6
X-Message-ID-Hash: CLMVVSP4MJYOZHZL64KPGJMHG7YHTFT6
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLMVVSP4MJYOZHZL64KPGJMHG7YHTFT6/>
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
 sound/soc/atmel/atmel-classd.c | 8 +++-----
 sound/soc/atmel/atmel-pdmic.c  | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 007ab746973d..4c1985711218 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -473,21 +473,19 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
-	dai_link->cpus		= &comp[0];
-	dai_link->codecs	= &comp[1];
+	dai_link->cpus		= comp;
+	dai_link->codecs	= &asoc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
 
 	dai_link->name			= "CLASSD";
 	dai_link->stream_name		= "CLASSD PCM";
-	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= "snd-soc-dummy";
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 00c7b3a34ef5..efcbdd1a629f 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -496,21 +496,19 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
-	dai_link->cpus		= &comp[0];
-	dai_link->codecs	= &comp[1];
+	dai_link->cpus		= comp;
+	dai_link->codecs	= &asoc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
 
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
-	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= "snd-soc-dummy";
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
-- 
2.25.1

