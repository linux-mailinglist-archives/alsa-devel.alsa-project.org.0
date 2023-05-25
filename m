Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B2710518
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7ECAA4B;
	Thu, 25 May 2023 07:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7ECAA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990907;
	bh=YqJpV+wa+eh/1atWvJawt5Z+jctdtUxKrhSoOn5Ob/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L/0kqQecEe7Y3SEhxEAIanas5lUg2JWZVAshN7KWHrTeL1Y7Wy+WrO/ndaEyYL05y
	 rpmkobUQDpopqxJyQhNknct4ZZRQS/9C3t1pkuGxJpXkyV5NnapgDZXwzZP7/0llHl
	 4bcA2yf0MYYyxKQ6niqBaLAxqCnIn02rvuRmj0sE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 821DEF806B3; Thu, 25 May 2023 03:21:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF8B9F806B9;
	Thu, 25 May 2023 03:21:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B881F806BA; Thu, 25 May 2023 03:21:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 446E5F806B3
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 446E5F806B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QRk3+liK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3o8ue3YXi3bnEGxV5QXVasJgHnpIsLjAhuF+5lug14cUoKV9ZyQqM+tdGBBoV4UWLJcIPq1o8jP5yeZC5xEjZI6JUgt10A8iVQ6PiiGOZd+yryT6vDcnw7fqXqG+jjZN8Zvt9QwiZ9OYtOpjxssLec7JiPG3bq4GYtk8mzTICnmtIDv25scFSa85frjuXnrgE0lH3Ji4JtsTekG/ZIxLVenF2fE5NHQkJY5M9s88lvNSExQ8MmeKP70Y+hcDhcEgW769GJlNM8jAXb0iynjFyd5AfQF51Omeb4SWWmrhD1LZ+uQI+w6Y1J+syxcVHHRuxGFwBXE5Az3UzPBbYb+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVk8l+qY3eox022LwdgTxhzFUmt3NGvSxT+SY2a5z1c=;
 b=ZPrGRJHBlIAFC/pgBwMlmeq11MwJyFezg6IFCSmWL9L7iO/KMDPm1sIvowznHrQrCBL3f2WISUKCd9i8+h8SmeSZTz38oBWQN+WsQgL+QQ0BxCNY1jc85skzjq91Fq3xe11ahDBZH3WVPb7ENKUFu6s9E2Xb75b7qBEJu8XjRzFiSAEMrqXfSsF6ISpB1tCFgfR+FXO9CjFciB/TyimxftZP+meGwV34wKq1rrYHAizEZOLEUvDhf4EUKQ65B2eQIXX14FiGY1F6JfnSi6PDwqo4ju6uZMealTo67hq9w+VWWBBmnDdXB2Feu1+kBjYUWQFCPht9ELkOd8ig2USfwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVk8l+qY3eox022LwdgTxhzFUmt3NGvSxT+SY2a5z1c=;
 b=QRk3+liKfYmC29iVEzdhliP/Gn11vF9vSAnYVWtuYzKZvjRc4h8h9oTbjFYgIYCEox+2ZZIP+wFlJQZUncMXyrRe8F3T5OYBdXBYBnKPmlxlScf4r0Pr2MNSVZU3GNXWqt3D489NqxJsS3iUTI577076lKY5umzV+LQSVLr/kP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB9477.jpnprd01.prod.outlook.com (2603:1096:400:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 01:21:50 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:21:50 +0000
Message-ID: <87353lgq8i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3?=
 =?ISO-8859-1?Q?=B6nig=22?= <u.kleine-koenig@pengutronix.de>, Jaroslav
 Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 19/21] ASoC: soc-topology.c: replace dpcm_playback/capture
 to playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:21:50 +0000
X-ClientProxiedBy: TYWPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::18) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 76124991-e3b2-4be6-1637-08db5cbe6a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EeqaSWkHfs2N2VvzZUnUDUFq9k5iCc9gljNpKydXOPEpxONzyoWzd5QSIwQRT7WFZxrF6fgsLLQZlhThodU0oQ4CfblYtwrQndaE9zfCfD7j0Hhwv5kCtf2587wzdmmyOssjYozK3GhgWWZeuLkAqB6TSL0X1mLPofsBUYIoyUg4BfclRt8+sSO6YEa465up5Vh1/xNMXSeIHpP3wnDtAbqDSmEqk+Xs6uuWotNRyWG/kQ6DPu/7d1T79K9e1ad2Df2F/xI+BVrgGpWJxPEP3Z0hOyEdsqX7zArCCR+LiNZRRTL6yGLk3rvMZ6fTFCnC1ChHbNo4ld2TUt958KweDmd9Gxgr97k3C4VKZSfGGidRCk8QdnkkPj9wmMEZMOwsnsVFcQX5z5WcYX3A91oZ60wdpGkIlJHi0ZSAIgymAiBeCwFTGuFK63MNCMtaoxAfmrN+XxA2ZeuANQMPlgNPxwzstingDPylqWmpA7EI6R+9UuRH3Fm0DQ5B18xO2uAIyHuzH0NAfppwZSfuy/phhBz4Hf+EZgPemMPw4TZ0SdbmEAeE6S6+FAaYIcYJj5Xg8kNVqrLxL1akhy0QHj0ZtuRksUhm4srAJDLObcU77fnuSrPZRgW34JCSIfHP7r03
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(38100700002)(38350700002)(6486002)(2906002)(66946007)(66476007)(4326008)(8936002)(8676002)(41300700001)(66556008)(316002)(36756003)(5660300002)(478600001)(2616005)(52116002)(110136005)(186003)(6512007)(83380400001)(86362001)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J7PT+i3XY4HL97RWAdOx/TCxVBXqVQ/ghjJaUNa1cFvsXRJdn38hXj5ejScG?=
 =?us-ascii?Q?P1BrVz/jGzttfRbr3YQzoiptih2Ln3dQsShJBWbzLtdrygSJtAF0WmBJeHNt?=
 =?us-ascii?Q?3aSg6TynP5Jk8k3qTO7Uim0eN7W/RU7VBhe9VEaXUxocuycFtEF3IWtUmNof?=
 =?us-ascii?Q?gPCqpo92WWy40givtWRsZlrZ6NAEHKTBMjvJwsXySZTkcZReM4LmGtML7Sj2?=
 =?us-ascii?Q?TMQ8icm+9ebUcZV/7Mr0hESfvjTFQroli5N9c0pLU3oQpBWXRy3DxM9aygRm?=
 =?us-ascii?Q?QwkGqRjiQtxngwn69dnUanbf2kJ/BIfa/1rCQrFO7titnp09recpYfRU2HEJ?=
 =?us-ascii?Q?JSPosQCZfAVfvoxCliWTcbTkiB4/zPemcMimKDhEwvVG4MjDunXu3KnDEScP?=
 =?us-ascii?Q?PYUoAeQrk6J98VcwEuvTDosApE926ncmSmoeMlSwmgtEOHT5LMw222L6DPiF?=
 =?us-ascii?Q?ll08JrQKtkXc1OVuHDWTm5E1nJlNaQvVOJZ+ukMW9pyRIH0iSWq4NQGLdKP1?=
 =?us-ascii?Q?+wmXDFSUU0qfhK4zlOQ/4gOc+cfjElXaV5dBllcqwNKEsOWNZ747uDMVPjOq?=
 =?us-ascii?Q?/NV9NYofJzg9Hw14a8hG5k2qrNROr/SJbbOt1W4AvM6I7ZyEv3655qQCRSMk?=
 =?us-ascii?Q?BdMbAcm6dFaG/xAstwIhmHGoJ9WtrB3AftLFctqb1T7zbfJmFFnA1q1y1yj2?=
 =?us-ascii?Q?jW45it1SdfohoUV+YgjUhxg7jALMAwwRw67yhQfA++sEXk0vbz84GZhVVGlE?=
 =?us-ascii?Q?ZDdUhB8Lg6T7x3yUmAeMSYFkzNNXaZh1W2VcJwTfZnQHbUeCEnRZ+mvksnDW?=
 =?us-ascii?Q?6GksdYTjwuBe6wSJwvAhu4VQfEMgGQTeyk9PCk1Onu+5HDPMmQU0LZlH8Bhx?=
 =?us-ascii?Q?qMTqL/2DoH4l/0eJgUTGkYKSUzvPiYLlfUm5SVqP88oQ7c3j+iYhRjxCK1+x?=
 =?us-ascii?Q?iaiAmERR8VL9ndQomCIhq4XhoDw2HZcvJ/3xrXeiVKk7maZqIHIcWkMJ8f8z?=
 =?us-ascii?Q?Pw9wVHhR8sxkSPr4SkBLP4h5oGGbBJlFK8FDrF0EKwfi2Ozk31C6OxTmR0lD?=
 =?us-ascii?Q?sfQ95wO+muJqc1UyjBySfeoA+FSrVJSRooq40XMaehf8xryaUEawsyVegjR2?=
 =?us-ascii?Q?3b1DC9ENS0yHAthZgvtVpZ2R2biObec7kYJ1gpXuiRsFrJ8fGKX0WzFgIHkE?=
 =?us-ascii?Q?ZDmU7nORZ+bf2EKfg5N2jxnGB2ZJ12LQbWG/66wVbBwnuNCudbShcp9OC38p?=
 =?us-ascii?Q?UpAwVgDti4G/WtgHj8fNRrrzVVqoSAmU5zWlYpDm9y4zqPPebOjOabmehM+V?=
 =?us-ascii?Q?6SvZlJwBl1gCX8rU4A1QxIl+WYzgGp0gMowu/2gCQK8QzBRNTbIUpfMXto91?=
 =?us-ascii?Q?BQt7NJcetdWJE/TAQeTAiDOGM4rJckVd29bKv8ePEyDctwZ3VxwDOIRal9nl?=
 =?us-ascii?Q?r7lKOvt66gDwm5BTfIcAOm6sFb7PIeuvwYNUE7nXe3aRoHv7WPwIW0GA3W0x?=
 =?us-ascii?Q?13Y5vyQXvFzflR71z0DLYMtFnVVJ0hxO2nsm9//XEQSTex3Vqr+Dj4DstiSi?=
 =?us-ascii?Q?p6RJVN29FFMr1TYFaD2PW970D5aGirGjBNAnIjZYRU02FID3K5rOBik8sj5+?=
 =?us-ascii?Q?zarfMKuSZEdw9CU8XfSIMQ0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76124991-e3b2-4be6-1637-08db5cbe6a5f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:21:50.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XB+HEiQ9Z2nvndsKCPlkFev3h5/LWORGTgQmOsAzPcIUDWj2d7BM+Sy1wbWbTU1hIOqBUBfk9RiScj8ey0hkxZFKqee2cK3PucZSA/Y+il1VwNkbsPz+SaSyi2flKji8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9477
Message-ID-Hash: O3NVWFPGGFV25JMI5JJKIDMRPOSNLEHX
X-Message-ID-Hash: O3NVWFPGGFV25JMI5JJKIDMRPOSNLEHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3NVWFPGGFV25JMI5JJKIDMRPOSNLEHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 2cd3540cec04..703a366e0abe 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -94,8 +94,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 47ab5cf99497..cc1f08f2f17b 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1735,8 +1735,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only = le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = le32_to_cpu(pcm->capture)  && !le32_to_cpu(pcm->playback);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.25.1

