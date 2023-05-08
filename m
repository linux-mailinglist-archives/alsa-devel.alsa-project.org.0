Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 954546FBBA7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B021192;
	Tue,  9 May 2023 01:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B021192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683590115;
	bh=Rg4IMg9HSQc2Sr58+u9l3fWjEPnlBoiFdfeVUui35Ws=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UcYJkCc+dJVaNZdXSbOCX+OLlgdc+NyJbgIwMMB1j9V8ErTALdR9bPeHTRUZsHpLY
	 vFEizkstfRs9YQhks9+Ss+duRQhbtaOLlYaPEQwBpEsxwoHiwRUYgZ7lQel9N7XLwt
	 KHVLwbKc2KVqc3H25Wj7WZ6orNPMwrf2A0k1vx5g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABC0DF805AE;
	Tue,  9 May 2023 01:52:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0534FF805AB; Tue,  9 May 2023 01:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F7EDF80580
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7EDF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P9YBvKuk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ds2nLBNOaTxePRULdxkonxWE7fIW+QjLq0pQFtotfWIv9X5gs8jnBM4ftClSBym7dCmD8Xwnt30OZ8A+wZKh3zM5MKUo42TZc/idjncT9/L0qNrE4MDe8gU+uZJ2vyJDoP6I17GoR7SDoPdzcY9s0hFxMX3GytpZImFHe44uw83GqqjN3kcE/sNsiKpheTIQbQGlRw5+QlqZP2Uv5RxhTjrTnWjgImCmdzoDmCt/9c9vAzUB7A6ee1Tu07+hW6ObD9X9o1H2yvDakI1dXFgi2+XjoJdXOXyRKNzW0DasAuCsamx94f6tUv2aFhdAQSxKmRri9goWA5VCsXal/vgzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGdsGLXilvyRuqIfhQ5sQ2F04f/JwMzcCnoqTqDCXB4=;
 b=TnWNyY6E3xNLqC4tEIevzT/6rPkAl8AULSBz7dV+bk13Vyk1LoL42ooVHZwvX7HrDCyfomNb69HuUed34dP4L95w/WrkF8ba7mXbCtz0L21DdWmhJSWUi8MTE+i9AG8dq1qWfEoM5bF4xKtYAMi2h2dMA/zOJZxzLBGrV/HbtgYhDyC1tJGQ9kTlRU1J8pzY/mfJWfoRf4U1NLsqfyMO43/nda9yXT96eNPBBQyrAzv/AVEsAWitFoqPHLyTHipctGi0LbGcyD0LsaJPoHbBTc2SXAd/g+CEigL7oBxaDshpCUDC6XSIxXfA33G0c/ePb/SUuoIqpkSgk3IJf67OHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGdsGLXilvyRuqIfhQ5sQ2F04f/JwMzcCnoqTqDCXB4=;
 b=P9YBvKukohNt9CS5fMhcAZoAdz4cAbPJoRmU25fMc3JhGtsRuyBv61aelyR/MIMYFc56Pqv19LdxYXIE93nC/pXJvIO3L3uERowM4svcFocm34qnHdY2m6GVgs2D+KJ27HHq5biIXdfPIKNOMbI85oOgilwSOHhlrkvvhr688rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:52:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:52:24 +0000
Message-ID: <87y1lyjs94.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [RESEND][PATCH v2 12/13] ASoC: simple_card_utils.c: use
 asoc_dummy_dlc
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:52:24 +0000
X-ClientProxiedBy: TYBP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 8278fea7-a63e-42d7-7bc9-08db501f4578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FGwisFw0J072B+QLdB9vI1KRaeVtg5+swX8AzrUSBQnVMQOS0x4RBqyLmJEbh3NdgNftbUhddhaCWpLlXHBqk1daEVjQlQ0upfD8/zLzDWCuwv+CDzHq+hCkDbzxl4Whn4t/tITZcMMEwqJekwEFvTwxVDKDPB+fnjVylLDaWwfDt5arKxjf9Xm6VSYVfu5K1cPm5m8LESg9QsfBvhBzY4B3/epPdIIKPfeKYfqyifVmQe8RzAA88EQN0fn3TIq7Ymhsu35FE1ufWgtdqO5/2xrddSRswzkTCoazEtjbWtFUGC+fSjsCyTpp/8HmXBzX7n5Bt4iaBCt9ZHU/c3M/Gbif2hM0CJFtzfcxPec8fg/rG2fGUAwl53yS50qxcPxhROr4ZTA9EXewu4UvTsVSh2pCuhVoXTexy62Sz5xs3KC/QdMcmvsUH6G637cb5/Z4rQYa9TJ3V1hH8y1k1qOxSyWZ9YGZMCnWjCe+niLF3IyLeuw8KJ6u+zHJSw7TWYYjAyeJqaRclWUnnRrDRAuik2V0hV/p53N/AUo3LQK3tPcJB9tS182Qa86WiCs37M2lcKCiSvVrjE6r6llO7gwJUSMyJ69zgJU1EaHxsvNNMkI3hhqRY8amxSV54++S5f73
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oO5qwE4L1fAzy5L97V71rgztwrO4kTeSIFqvEB6lrNztOmIpgSrQmefkrSSM?=
 =?us-ascii?Q?Z5JvNqmZogTEJR3zDzQdaqNP82tqNhf0H+0HLUl3/Eg+y11ZzimkYp3teNIW?=
 =?us-ascii?Q?QCUnvmCRZsEh9NJ7kGsrFg11c8lW5mqNDEtqRsG3Cc0AsLP1ul8k48rvfBy7?=
 =?us-ascii?Q?scO4Ys5E4Htdz7GYfKOOpPZ9pMh1sjM4+cb1B7sNJtvASRu0Y5TlPY/AasTx?=
 =?us-ascii?Q?NFdvaIkTZWeXkTWL5/oOTnHpdbs2AlKQeAMjkyvqRutdjilpUIeytb4KOhJQ?=
 =?us-ascii?Q?vwan8mmKitiP31nF/M4MICxVsECxjays+hr3ysbMdy4lHIoeumQCxSKKX5Y4?=
 =?us-ascii?Q?LthZw3RY/8JwOQxWbDESwB3t8ihj1kEd8OMsvqB3JMSYSaav1ew1GOV3j4E7?=
 =?us-ascii?Q?M7kX1ibse2D0G2c8lRMSPu+f+YMTOX+hsMmYl2en2TeM/RvvNdnw7ZjuFA3V?=
 =?us-ascii?Q?fctTV+a1DTDGpYsi9LXsv1/IM4egDwTca4ZLZENsXjC68mmt/q3GBy2s4t9A?=
 =?us-ascii?Q?mwl9VFzpbPRMhCJMS/GcNrwiVRiofQgAMafhdxsc5o4FGLwUVRhAuXnqzUir?=
 =?us-ascii?Q?QAiIfxic3Tjcrcx7sxPoDdTX+wzGHhvyki9lZSmIPgg81lnAPaz3iNYQK7/S?=
 =?us-ascii?Q?oywgRw4eG6vGaESr+gJOjJbQh085husBSocMvMbJuZxKEQojTHSTIey7iRWp?=
 =?us-ascii?Q?duA2k5bV6wwKKVP4fgGWjqwfjtARw4hIXkHgWWE901buq5DLp2qxcewMe9n7?=
 =?us-ascii?Q?trHo5m1ivgSwB6A2YCjBHXl+qaktLZq2zc+KaicRuYMWX0sFo+Z1EPBud+Ou?=
 =?us-ascii?Q?e3gIQrg2Zw7NS3G4e0bBeu9urjkPdVfDEbd0/9eXSEnvWzWkpKW8A6D2yHC4?=
 =?us-ascii?Q?KdvKo+7HgecKzT4phwqcNmGMZL+cnrQh0St5BS/b4W0RoiUaoKbLauG1nTia?=
 =?us-ascii?Q?HP+Azs2B79lSL8bgh65iJ9NH8ZJovWndEA08AxmUFbMXM7eta5o0L5RvSVek?=
 =?us-ascii?Q?ir9I+slo2EMYobaaoV0SEOw9ttBjS8Zugtnb7bWbXxvTdQFLv+7dyd0mgGTL?=
 =?us-ascii?Q?GE1KnbZIh/Q3JmrrOdYT0/22MMgkQwa+w41EF6FGrWe+6FV5RDQWF2Kx4yyS?=
 =?us-ascii?Q?5zvMsDD9fQLVQhASGVgF1wYRbr7OnYiqN0jKHIu+ENd4m4Gh5kF5v1Jd32xZ?=
 =?us-ascii?Q?phqMTr23NpRLhd9ocBgH9IIyKB/CEMFCr2oCwZbJ2JLXp/Piw1Okv39U7VpZ?=
 =?us-ascii?Q?vx2rAAXknw8s1rfXu74sNvkFQOmwVExYrj0zs7TK1h+5PqhpAQtaOB31x3RE?=
 =?us-ascii?Q?3GKnHaHmLy+Ymgmkc5R/nfZvZs6poZEMJYwtARpeW6gRPV7EiZn4Gx2y8L5C?=
 =?us-ascii?Q?HZGSrKsojpowxRZ/kAjcNTPcirY8R03TIW1u3M+tCLna7JITv0A6edk5hdCO?=
 =?us-ascii?Q?PYq23Phfh+KPy/8m29qdpBvEt2WJgq0qIzsKsvqCt0DtpjYakN94D0FnPu3Z?=
 =?us-ascii?Q?WxlNi7oOG3G6684Lku2dQWeZXSCRsmYwdKPisrws+yt2clIvqwxyAdBpQ7v5?=
 =?us-ascii?Q?jAB+dKRCV4f78gMZihmkYXApJvLozCkJqIGN1xXCf3K0EXJDFLos76qXxa+x?=
 =?us-ascii?Q?ikcNZ/VV/cgLKV18MEunPG8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8278fea7-a63e-42d7-7bc9-08db501f4578
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:52:24.3955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wb0M+IsdW3VdD59omDkVfvMxT6N8XBuUlvGI5R7r4h61onKNkSic1FbKiLci+2suorDYouEL/w4H2mjripS9rLf8ovEpgibJAqNXzA0oWbmcysmnmsi2KmzV5xGRQTMJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: BG4JC7OOSSAOU6J7UN7UESQIV5TJ3QUL
X-Message-ID-Hash: BG4JC7OOSSAOU6J7UN7UESQIV5TJ3QUL
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BG4JC7OOSSAOU6J7UN7UESQIV5TJ3QUL/>
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
 include/sound/simple_card_utils.h     | 1 -
 sound/soc/generic/simple-card-utils.c | 9 ++-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a3f3f3aa9e6e..0e46f985eeda 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -73,7 +73,6 @@ struct asoc_simple_priv {
 	struct snd_soc_dai_link *dai_link;
 	struct asoc_simple_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
-	struct snd_soc_dai_link_component dummy;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
 	const struct snd_soc_ops *ops;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 467edd96eae5..b5ac0f0d5e8e 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -889,11 +889,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 	dev_dbg(dev, "link %d, dais %d, ccnf %d\n",
 		li->link, dai_num, cnf_num);
 
-	/* dummy CPU/Codec */
-	priv->dummy.of_node	= NULL;
-	priv->dummy.dai_name	= "snd-soc-dummy-dai";
-	priv->dummy.name	= "snd-soc-dummy";
-
 	priv->dai_props		= dai_props;
 	priv->dai_link		= dai_link;
 	priv->dais		= dais;
@@ -919,7 +914,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 		} else {
 			/* DPCM Be's CPU = dummy */
 			dai_props[i].cpus	=
-			dai_link[i].cpus	= &priv->dummy;
+			dai_link[i].cpus	= &asoc_dummy_dlc;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= 1;
 		}
@@ -943,7 +938,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 		} else {
 			/* DPCM Fe's Codec = dummy */
 			dai_props[i].codecs	=
-			dai_link[i].codecs	= &priv->dummy;
+			dai_link[i].codecs	= &asoc_dummy_dlc;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= 1;
 		}
-- 
2.25.1

