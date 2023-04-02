Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E96D3ADF
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 00:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 218B43E7;
	Mon,  3 Apr 2023 00:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 218B43E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476324;
	bh=gIJBrBsj4SkhSPTs7KLVLAvBn2xodbIPNRabvgsRqPk=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jGvZzZ9NX2YrBKTsds+vWCIeXj/xBjmlmWZ47x6Z3Mut7KrcqU8XWSQdj7kxgcPjT
	 pXqgufr09pw7hDFKih2cpYZpI5Qy/Ho1IkdItTayGhURQoKJ6UUK7Nbh9RHaFNTZ/3
	 OBFDvYJdQJPgKRempXGdo3sQhlZhYYWL6PGcj8AI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D22FF8052D;
	Mon,  3 Apr 2023 00:57:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 681D4F8024C; Mon,  3 Apr 2023 00:45:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E7C8F8028B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E7C8F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=D62Iq3UN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOrRi15quMtiB8/m3nsViUl1nx9m3i0RxnliKuxp+V7s8PQu4QMJZCOm6bIoWn8f2O/++enOzo38s7ayisaMqgUQviDeTO7YQsEr4vUNj87Iq6e+5iBzXH2xsBecwKi2c9Nx8phrWe6ziXV4unTtMX8iMoi/POYKRct/3bvygrYQdAX0JKdyK5/y9p5fGsQhw05dZ4yKcpRm5gazVQBZWdC/iYlqmvpk+LTwAnNNJoaTvesRKj0oDNqEUuLNnkypOU101kApdEA/eWzL9ifXG9jTRp/3kM7Fn4dPVyIvf+uQ7G0cxFi6Tng95keEQBC27G3KwUuPj0BOqgOBdqojIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4OYbDy3Ad8KUXlgALT5b6fJAYFWjU4kJibigqFUmoI=;
 b=ToUCzlXTJ8czm0DYMkJa4tH6ARkSF3hzhGHjgPwGZ1STAaqSAtBYtMpHrfV0RMQTfZDOhepCcNK3MdstQCoA7LZEZFKGlyEUBSHQGBjX3lK5709Z9VA6fLcnKibRolR57Tk6/YZgFF9BfUC+M76kPe79CszBnSgckbpRf7SNckSO5IGJGpD/z2RcOyCmDovQC6ivL8LCPq2tOEzQKv7T7EREwgYPWNAPhOvPah59Ejcx53fNgrdMx6ocpkGAQcUGq7/CSOVcL2Fa4hVDMnfjRFQMG0SdL+HTnFc3BxB8hfdzCRj//qgGscQvdADbLFAb0e7KsvRbcluZnZIQKao1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4OYbDy3Ad8KUXlgALT5b6fJAYFWjU4kJibigqFUmoI=;
 b=D62Iq3UNmmkebur7qtbFjDGRKpDIjMEIbTcRrlcMi9XLUTsInYUd/h+mdgvl68gjJtCcYzI2VvbFkrSs55kbEX6gs4pNNDfD9iEJg9dtm7GNLuoBtpHBiTUmek/A9Xhiorb26K456eA/OiTQB3aT98is1e/i6gUGkaCdt4moyVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:42:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:42:26 +0000
Message-ID: <87sfdhc3e5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 5/5] ASoC: soc.h: remove unused params/num_params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:42:26 +0000
X-ClientProxiedBy: TYCP286CA0184.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11431:EE_
X-MS-Office365-Filtering-Correlation-Id: b5dd6313-6b65-4fab-bfd2-08db33cb888c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DQqP6cEGZyYuNakl50wBdPuXdee1D8ZTIHgy9pazHNP3JGmTRKURpx7nlH4fM+opkkefcIcnZfbxg1FQ1IYLMZEB/dbE5i6eqnQiJOx+3SvxNZ4lcGwoPWBumqnL2qHSr17VjAme7KljlYuXOfliw5XjqVAKSZxFxcJU6H7JXpWu8++n9jSyDe4cPV4mNzkuJOR8dSfr8+VSjhecBbU9EGx4I2DXvry4fk066QwZEHcbyx7gRCAuSQdVKO80kAlVEhvfPC0iIixNUm2MglFJq0D6fY+ZAPXLFH+sK6y+30QlJzv1bsiH58ALhl9q4GFa65ejQAqem5PeZO87byGKtZpLw55+6G8S3bsPCgfIk54UAWkdiBvnQMTNYRwvuiqh7af7yyUEAEJFSiJwRmAZGtz+GmTOUMFew+v2xKEf1J61AwDWT34PJ/zmojVFo6brigwCj1s/awarXhYtLAerBKsv3/QvxNRH60ddIbWz/lg/EByz4JP3R541xcmqNClikTrrJmINAsicVXE/Jzn9nT3aqvgAdkek5XH7QfdZWngOafwbAStNfom57MXSZkACzfm3+4cM9N0Vzg/rlkAwrCSD8dxCPggJPsJfze+/544mwCeL5tz/wYwa3ApXzERI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MKQZfNMP+DEhMT7ZsRkeSuXtANEn6CeXszOZ7PjIsIxDyQ0sht6qJNSI8zi1?=
 =?us-ascii?Q?ycq1560brFE9/eVt78DvVQmHRao+Q133r9pZvnDTqJM9RKyAU4q89qkZhBaf?=
 =?us-ascii?Q?ioC56BaXPUKLv8pVZkHNZ0vOu1ae1SYwC5ntPYhZvajUNH24ZaLOPtyi5IS6?=
 =?us-ascii?Q?3llTIAiyNUAz1E165NxqZkwz1FAVyhNe83GsFgGwlLYT7qmBNAZ7HPHQ5nH7?=
 =?us-ascii?Q?FI8Kfm7nNbb879QmQ+x2HYmP2CpOIb+kQreMwaucBvVWQPT7TdqDhdqonPrM?=
 =?us-ascii?Q?6S27mbfZ+pIDldIIREJuJZaVwMBlIGVkFwlkNu3BaAAJ6CyrvhQgvrd7kpD7?=
 =?us-ascii?Q?Zq/pUbSlcd5GNjoXgvQ2MBAN//z4T/yZlJPN2DIVTCkGf1SgmIZRXy1J3TgA?=
 =?us-ascii?Q?nmSc5c5+adN+KZn1HYWgaq96op5EOgWZc2x4H1jnS2zAbj0V1O1JPoclQYKT?=
 =?us-ascii?Q?fSaGQD2AMInT0LElq16ZGr3TAtgsp4qnur7loTNsSszxUkWQE1smDnjWQlou?=
 =?us-ascii?Q?CfETfOWsbPi9T67QycdS8kDY9M5EgNISEshaMroz7pp3IJ2Kntut27G0oijZ?=
 =?us-ascii?Q?95EG/U9tG8nG9fBtyw42/YgyqwhA0a0j6jdxTbyJ5M13WT5l50FgdRwslqcy?=
 =?us-ascii?Q?MTOEcuspOInVRolKxzeILxydzhE6dWZ8V37Wt8XvY+00zfPLMdLE3TuyeIwa?=
 =?us-ascii?Q?YbStvWsH9g/0BqPWUTKVRraYbGm5P7rFZCriv1LK2SDvmXWLeDG2FlJxyGaf?=
 =?us-ascii?Q?r6lSKu34nv6z3VdZQGC/YP9vLm7kjnY3XzB4MILDbuSIlqxPmtbIJ6SFJ8jj?=
 =?us-ascii?Q?K6BpC+uklyZ3zySqLOC74jBzIK0i1K7f0Gm7S5hk/fpmfRkJFUYwBPMtIbTF?=
 =?us-ascii?Q?49jNQOvFw+Xhazp09j5BnjyJfU928kGvTlnjJNxKwO9hbt9JXps7QHI8aQHG?=
 =?us-ascii?Q?4AGP0cTFai5m+ACldtSVtJA3dDGYvpy51ieQWtDpp6Adxth6aJnJiqDeLMH0?=
 =?us-ascii?Q?CapUHfgOPIVI6gRu72ELm0o96QKGY/kTbyfCj1kr81SrR4hg5BXA04Y6Nwzj?=
 =?us-ascii?Q?MxyOsyT/Ks69/YwhmLsTZYlmUNgvnu20PR3DlNOGSZDhYaUqmGvivgZb5jg3?=
 =?us-ascii?Q?6ibPWv7/4GyWKozl28l3fVZbwPHNF1Zlq20Ne21nZhTPxwyS6Ki3x1XnEe68?=
 =?us-ascii?Q?ZCMeoRUltaBRauQsMQ5uqYLmkJdphtNdlGAwykXNKG3Zs2NlgU7qQT8vUYhZ?=
 =?us-ascii?Q?z5tG3Xe31V6pLMTePVdauH25oapJzg/OLfhQezEC4+TgE4XF3ieNWN/YtM51?=
 =?us-ascii?Q?q31oxu9949fD1o2qEqYEwMdAP72u5IEwMlj+mMsTSum8vQBIE9ggCzMVxf3z?=
 =?us-ascii?Q?qfq0pXN334PDVjlV22PpJYQWKBRKwP7YH4ZGZb6ghp+LTUMpwB2snz/D/Y1Q?=
 =?us-ascii?Q?qTG+Wu38dZFuPaWrfp3/CAqkWgQ0nzasN6oTf+C3EdrzWRNE3JePy9S2LYLa?=
 =?us-ascii?Q?9q0PbveeUWeTwJHcfiZYSzI/XESGdsSuaKL0JlsO0lE4A7u6HLK2tppDBJEx?=
 =?us-ascii?Q?gWdmnRHdmgHzi3zc0+GfMr3hjP/EWcFTMMkeCyb7wXwd5iKewIgpK7+5Xdcv?=
 =?us-ascii?Q?LIN1RtPRtL296nP4HQ3ozoc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5dd6313-6b65-4fab-bfd2-08db33cb888c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:42:26.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p+3fHwUwyRyH1tJ8N7Wl+AOTZEIiQpq8AWx1baAw43Ys9kTWYK1WYoSNcwKOn0Zv+zfqTzP2wG5Z9w54mUpDzmjhQ1cbOy9mdc9afwpOtODG+mmg1b/r4zW9ZVp7o8dT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
Message-ID-Hash: VKEHI5Y4KKBHZGQRBFYRWNFVRVAXP4FG
X-Message-ID-Hash: VKEHI5Y4KKBHZGQRBFYRWNFVRVAXP4FG
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKEHI5Y4KKBHZGQRBFYRWNFVRVAXP4FG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

No drivers are using params/num_params any more.
Let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  3 ---
 sound/soc/soc-core.c | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 276afdb1f445..3833184c187f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -690,9 +690,6 @@ struct snd_soc_dai_link {
 	const struct snd_soc_pcm_stream *c2c_params;
 	unsigned int num_c2c_params;
 
-	const struct snd_soc_pcm_stream *params;	/* REMOVE ME */
-	unsigned int num_params;			/* REMOVE ME */
-
 	unsigned int dai_fmt;           /* format to set on init */
 
 	enum snd_soc_dpcm_trigger trigger[2]; /* trigger type for DPCM */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 04f1bc8a3128..9bbcff492c1e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2294,9 +2294,6 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
-	struct snd_soc_dai_link *dai_link;
-	int i;
-
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2317,14 +2314,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
 
-	/* REMOVE ME */
-	for_each_card_prelinks(card, i, dai_link) {
-		if (!dai_link->c2c_params) {
-			dai_link->c2c_params	 = dai_link->params;
-			dai_link->num_c2c_params = dai_link->num_params;
-		}
-	}
-
 	return snd_soc_bind_card(card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
-- 
2.25.1

