Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11448774EF1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BEB4EAA;
	Wed,  9 Aug 2023 01:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BEB4EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535896;
	bh=8DDA3ZsEcpUYfitnGsBG1GKt3dHMydxb6pRV33K9gJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nbJYpIH7MPWAYnFQ1+NVmy8tUPOiZYkGkBHxE+zbe6vNqZ0/V5tt/sIPzaJpFQ23p
	 bhyk9XQ0LHkERHlbKjmuXUYnm45WGWLlKfwMdfpIekR1jNUZDM+AEWCJWChXi7y72S
	 Hd0RrWe+vF7ZxkCsLbbn8YlhByKgh1wndqvd+RAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38C20F805DA; Wed,  9 Aug 2023 00:58:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C88B9F8069F;
	Wed,  9 Aug 2023 00:58:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6063F806A6; Wed,  9 Aug 2023 00:58:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 398AFF805F3
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 398AFF805F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GLHZu3Io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDZKrKyFSaGqI9yGIr/6/5F1KQvuOTAk2bqkWNi+4I7L5LjREXD1aLtfc87qdDqXOkget3RuKEK+95FO9DqxgJ9UUkA8T/6X6jFDeBqhFriAXc4shXsRoG04Hm9LzzcM/artnH+s7VyIzV1B57q1zVif+bzZppU75IIW/Yjhh43HvcvgXVC4Q2ynd8vcOM0K9+YyZjcmNnlgiihaMQYCIMv/nmN20L1smZRMapO9lJt7zkdIKzToUoUF1kfQbvhiNv2h9nFt6Yz6lpoS7HpwEMGysYoGANdFAXCEKKdLd/W98+Iq5nsh5CA4XDbA3hhXPFU/TfcV0zqkkuejtpyHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKq6T7FRjRttJRqu1BgCjKuUzmLPhsJ1iq8fEzEzPZc=;
 b=TUkjPmDaYtrKxeWWd1Qzyl1Gok0RdXJ0SGBAgrze+fPoO0TQy3hPw6ITpGW3ir9P5PKm0DPVhpnnG/7b7wYtOUvdyRU7DU/9t77ZQvSGfFmum54UIerbpXZnDMJ2sYenho/jRLuH0dMwOTRK92bDSuOAkQHciekNfsXoG1WRpgLa2D8INhFmo312PVJIdHT4fVH3A9lISFWt09QmujABjFDoVuTibx+fhyUm6K3+fJ2A759rVvDBltIHHY2VOICVob5g+aP+JLEswZsuo0ynjV3pwQ0u9w+AD/DaB4yjz9hSFpy0PE6H230zVqCRwdi5VbTjsWH1A9ieSBK1M/lc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKq6T7FRjRttJRqu1BgCjKuUzmLPhsJ1iq8fEzEzPZc=;
 b=GLHZu3IoaJ4vizHWHRQHG0NStZMVUPJrj5W887HIB3wt40/3HemC15XSxCgVyDLMry5Q7HKxx+Ipg/RMpTKiFO5RVkM9ShCCXNPqLpPgDmIPReg/KncKykrv3Zpvpqh0JtOFnoCZVpJu1Jkf0aCkYJPb3NcNQy2plxs8zWfEBSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:25 +0000
Message-ID: <87msz19m5r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 32/39] ASoC: starfive: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:25 +0000
X-ClientProxiedBy: TY1PR01CA0184.jpnprd01.prod.outlook.com (2603:1096:403::14)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: e776f855-db00-4c3e-972c-08db9862f8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I/3kztJ71K/E/nx/P4/G5nckj35k7NPJ+FG/W3LHy1vRi57x3oq8ximX9UwYYpOaVzYYM5N62iTAS6laXN9J36c8q3YSimQc5UjRXyX//95iprG6c1q1EgD7NlU8nWDivUVN8fzl1LdFSMVtaDnvdrd8R+sZTJI3WwWsLBnr1z7J1EWo31otO+bkyr/upp1tcwEoCUi7sUK46MiA4RH10wZOiwK+OVHgmXYkp4FvO5/aIQsmO9Uc2q1O7xnqnOBBe45OaEyQVSfYtbYCuwO0yYheceob1lB3PttynfVlmcuX8EB0pTafgEvJhk4dnETDoEarXU9ww70KzSqfhcFAQu5OR+1HvAk/NDc/5sVT/Irbmv9PAYzogYq6dWyv2swSuShloX4/Uwo9Q+nJSXndNlPE29OXA7NreZLKTHPo3J4m6zV+2S0qbwDcZPuV8Ee7LmA6kA5PJnw5B/MvXQUTdIrzFDP+BtvY13TZW1qkDK+dxH410UdrxRS8H9y9a5tBvRBpfW9L8HzpXzWNlXeX1MuMJfxGfNKs2OF0jQ4OZuQ/h1D1kBq18RBO31fQnnzNWNJFWoJeuPJMwfqepxkKH9zYjp/cdV6mbYYvgoo53HD6OqAUbMzHNYK6EDsjTYeu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0A4IPGraFfgC/ZgPCTw6JXfCPbc0dNvujH9A/GrawBfjerOrISrsHFd07Cvc?=
 =?us-ascii?Q?KStNyyFczrzqAXR39Kow6T1r1C39AIwKKAYsmLBo8wQcmuNUT6jgw6sUW1uZ?=
 =?us-ascii?Q?+pWO5foVXNGyuP117KaK3MM9TGZ2OyCKrfMBWcxDxT73OKZKaO7zXHtW/ZBn?=
 =?us-ascii?Q?fZnAGVt3m3GkuMUbKfrChlA8JLj+1krGqX0GfKNJDU3indBLJRX2e/23pa9K?=
 =?us-ascii?Q?K8PBXTjeFCPI3VN5RkkhgQH3NfIZ1zVCJ56aXXueLH1ZbAHK2KbY17aM4AFw?=
 =?us-ascii?Q?VsuKZPHlPENSf2oG7At3I7FgXSJbIxvsD+IGGnrGktZwYRJIxdbYiDreSY16?=
 =?us-ascii?Q?EyRqC0Mua06lSvsSQXabMAdNejHYo491At5k77+KlsGQH7dH/Zey4QUH7tPf?=
 =?us-ascii?Q?46zcBZuNMG0t/lI5hi6tQUvBjlH8P/IrRQ4A9hkxzbDsbG30AY1XqS3iKDHi?=
 =?us-ascii?Q?qlv45MTi4Vu8UHLv8lm2lIf1qlNLGKkTLn9eXzn96zgZt4cP/LVAe+FcmiMt?=
 =?us-ascii?Q?t1aOvB2bktdwCwkBKAoHDheUodUbMh9ZFWCNWlinsd640jOi3D3WZPjjshgR?=
 =?us-ascii?Q?voeF5aHUvK0ROx9VO+SO3nFloQtCsJo4oy7n0e8Wv/GRuMSsU0cY0UDfG22x?=
 =?us-ascii?Q?cHZnQfSJL4w56p+8iqeigFZXDJvpPsQC5Bo9ZvXzVzAfY9dZ4CVdXNZRSPdN?=
 =?us-ascii?Q?Lm1NXkLcHAgcNjx2mh1/liaVYezgdkgCgWSeBSTQtutxQPuv+46yRJmjeGq9?=
 =?us-ascii?Q?GJ6t8bjBTwBB43tYZYZX6QE9LHunVOMRlCuXSpPPBa8DRQC0o9qW6s0entxW?=
 =?us-ascii?Q?XB8NUZrX8Z0uKkqaw71k6I1yJnaDB9KYtotqzhrt2dU0Dmbqhe+vtObH0Jcc?=
 =?us-ascii?Q?23+IDi7nt7SksZX5RFoZkZ7HPhQTgcCl/6ouiWgTbVEUIqPDkR+L/KkgWDOJ?=
 =?us-ascii?Q?g0Ok5mQ4tJu1Efg9B486GkWsjVgDiuatzNUx3/Ec829Jzym4NGRvfE07yD8E?=
 =?us-ascii?Q?b3wMEN7D+1+ctxPbydrJRwFRn4jDJrZhbTwigc49kce1sMoTjHKhDlNxZZff?=
 =?us-ascii?Q?aJm5AWjYZsA8u1EUoOqnMs9T2VtehGHLDZl7yM59ju/LUSnIcrZRQHNHyDNj?=
 =?us-ascii?Q?6BY+PjNBDMrtJHQxqE3M/IdYRLZuZMmeiaFtxOXSeUBeHm6UMnsvtNCN5IDa?=
 =?us-ascii?Q?BL0oCYIPz7rvyQW28pude+GiDMM8U6yUTufzax1WKwMTI81Xt8taZUWra2oh?=
 =?us-ascii?Q?8J9G5DJRfcU4n2l2lmAHleSh4f2xrdGd0tIMb1fPG0zNkZvvE+rDzCHO0C4f?=
 =?us-ascii?Q?GdvzQ8iqZ+qnBe3yjX6e3yG2H1LcfJdgAaXthwjvgdLtSjBiY3R/xsty7Pms?=
 =?us-ascii?Q?gGPug/PdF67R79dKobNNBMgUSNE0IfbP5GWu9ganoMQEYDvY3/1tpD3zuv/3?=
 =?us-ascii?Q?/tXYnqSdV7p8SpmUAKBRzBuIsBvTaI0VqY1UizagF7fj8nYzcPf6g7PufHYL?=
 =?us-ascii?Q?/IOXq+bQZTqx8Jxd9x66xVhFqk/2Vw7Un+VSvYoC+K859zQm6HsOawLA5jqo?=
 =?us-ascii?Q?+QM6gsxVXy0tWeD79KJEfuiYPWkD/A7s7pIbWcEw7wDq/peBGh90lYt8hi29?=
 =?us-ascii?Q?INwU+hx+eXt/DuN1HRC3qgg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e776f855-db00-4c3e-972c-08db9862f8d1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:25.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7ghNDLznbikPhfRQB83Kt8nCApHeXqCys57vBK2t2qWrg3yzosgzp5UYCKE1BYiUxsiEgiFbpTUetaDKuuSJ8oUURYkNUIW1c/xv4/BztFMkqVrdSiSFh07wyp29YG8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: EFFCHW3T7MTEUNXRM4WIKJJSGK2ABJZP
X-Message-ID-Hash: EFFCHW3T7MTEUNXRM4WIKJJSGK2ABJZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFFCHW3T7MTEUNXRM4WIKJJSGK2ABJZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Walker Chen <walker.chen@starfivetech.com>
---
 sound/soc/starfive/jh7110_tdm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 705f1420097b..8c117794b028 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -463,13 +463,6 @@ static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
-	.startup	= jh7110_tdm_startup,
-	.hw_params	= jh7110_tdm_hw_params,
-	.trigger	= jh7110_tdm_trigger,
-	.set_fmt	= jh7110_tdm_set_dai_fmt,
-};
-
 static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
@@ -479,6 +472,14 @@ static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
+	.probe		= jh7110_tdm_dai_probe,
+	.startup	= jh7110_tdm_startup,
+	.hw_params	= jh7110_tdm_hw_params,
+	.trigger	= jh7110_tdm_trigger,
+	.set_fmt	= jh7110_tdm_set_dai_fmt,
+};
+
 #define JH7110_TDM_RATES	SNDRV_PCM_RATE_8000_48000
 
 #define JH7110_TDM_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
@@ -502,7 +503,6 @@ static struct snd_soc_dai_driver jh7110_tdm_dai = {
 		.formats        = JH7110_TDM_FORMATS,
 	},
 	.ops = &jh7110_tdm_dai_ops,
-	.probe = jh7110_tdm_dai_probe,
 	.symmetric_rate = 1,
 };
 
-- 
2.25.1

