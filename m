Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580D78373D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 03:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BFB83E8;
	Tue, 22 Aug 2023 03:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BFB83E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692666736;
	bh=kvsrsBcC52JqyhLtCY/2ywNDQ5cgErDzxuH6w7aTT9s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Sr6xD8nWjGY45QBEKBE/TYdPHa9DdD99VkawzE6ukIteskPghqITPkLMiKIT7P0o+
	 jiWi8ucdUkiCk6YT7J60vVGJpI+iFmgxrnGipWeJNtAe6HPXrD+uPadiX6FOvTs/po
	 xgORhfihahqV6AAsyoi3QOmtQNE9zuK8UpCSFnpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20FEFF8025F; Tue, 22 Aug 2023 03:11:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CA8BF800F5;
	Tue, 22 Aug 2023 03:11:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9259F80158; Tue, 22 Aug 2023 03:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06D80F800AE
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 03:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D80F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RUfVdzpE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd+TIxgYVbrL2P+V0cO67BqG6VgAa0IZqYWUdZz6jBFo6RJAojLxD/TjpE157VQdoinw5qM40KTsVT4SV12plwhcrIaOMEnM8NDAeGUz1rQyREJDvzy7CHOQUOnSINrdB1vWJ1rRcjkD7yYN5OqiQgcDzNW7HAiEX8ptBKoax0SbIRhPJgP+isPkfPcot7YsSgbfPTZKwnAyts8OBDcugw+HKQkRF2R8gvffJQNVOYHpY7CuddhPT4girmjhWYS744IfBjr275mnXGmyS9CVuf5gdtFF74QFvQ5mT7YP77vTe6aZzptIuGrCkBqgxrUlneUmQxtI1fDgcDtdMWPPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6LWuxqRJN7onJC4d6QsnMV5L2dTQxTT3Meuh9uN2yQ=;
 b=mCS9jygZ15FZnO8XlbScrCND1wdodCsC16cF8QE+MjevdKT+v8fZdBLw8qnZ5rCnpQJDs53pC0YqwE6e8x4BRAEv4KOD5fbTkosDqO6dAavt/q4fQ14NlFX0H+Zx8G5mSAHr+McSde0Mg0kGIwGCjMdMrbgtfSD41+kGfyafwQ8MPOzXnS/Nw2SzfzU98bVTpGKBY+AGqj6/2CPEuXfXK1AKfHmca8GocoirYFOaHmDgcJ9Hdv5TghsUR//gjspuNOXdKgUjPsIL9kA+4lrjyWPYzt8YJocvsSblbLqeSUkMETC0kl+l/4sjEtYVS1Umbx2NsuDxMKhnR+DBeOuvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6LWuxqRJN7onJC4d6QsnMV5L2dTQxTT3Meuh9uN2yQ=;
 b=RUfVdzpEpVHGMHtheGhu082yMzKUqoiG0MJ07E/uNkXtMcS4/4foH2DhGsGVEZeqtiKn0XbhlAuwrcmehvq7Urz/lrlE0whNVghJhYkkcFf/6G4tb9d2UFRtdB8bH5toSQk8CyWUf4/BcsgV/WZNvEKFIv5ERWBW1frSTe6N+ts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9708.jpnprd01.prod.outlook.com (2603:1096:400:232::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 01:11:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 01:11:00 +0000
Message-ID: <87a5ujubj0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi
 Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] ASoC: fsl: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 01:10:59 +0000
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 9940f6ae-3b9a-4b59-8dc7-08dba2aca5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPhow7as2JmyXywFGx03wISvAnbxp9BRLq19IZcYu+WqalDJcOHn2xmpcj9ptwyL6dIXqVpnHJqh4FYb/mFBapPjIhpFXIMHJgCYTkrvu2qSHy7P22Mhjdg4Ou3DAllS3l/7CzLd1ckYcVutM5V4t3QRZdtA/Ag2bcoy3FSZavUtqemqcn5gTscTlZmBEy48Hp4G0Bm5lR0F2qzfGBQG1Kpchx0N626ImNch+5MpTsdCzhF/pYWAkOMUPBzEERCY2tYojxBsA3r7tXq+UyRvNGNjjb+5hMhGzmtwKGRjMLQzp+XGN0dOLl1p26IOoGUIhXsZwPqGWtQdfWRbsx1+pyS6ZZ4zcfqiDXdfFThlWNb8/dqiYg7NpKDUH90UyzPPK8NYdRieXZWdZZNXdDDGCJSOBlnyirOeCUnB/zFhT6A2u9jwaXSd+MGcmazBYE1wDnUKXgaLl88lEAQiTzXgaHasJTikQ8sniZioHLDbh6H/Kt1Q4jJ8e+7ApLdXCl0hG1fdlVjXPa1eFd4GT+N4OgVDqRpbTKZCz1KyDrErjkG1Y4Q1R7AGTTUDg6jn4mV/LtRfopftiJcH+IgHGpyQbjLJX0V3VBWxS660q1OBXEA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(110136005)(36756003)(316002)(66476007)(66556008)(66946007)(8936002)(8676002)(4326008)(5660300002)(6506007)(6486002)(6512007)(2616005)(26005)(52116002)(41300700001)(38100700002)(38350700002)(966005)(83380400001)(86362001)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KoLn7IQhDdd8TxwsinaBnYG4jrt//hc8lNzpSnRGCe5Ga8yF08lDOdqfeNWR?=
 =?us-ascii?Q?+HLQm2oiqQGv/zpExGCHKF7GJJnOk8oQbDzuhb8ruzjStvjghptMe6JTWogT?=
 =?us-ascii?Q?LgMiWQMtHNavzTSQcNe9vCSkrAO0znxUPzxbU8PYe0I9qFcGHPz+bQzckz3o?=
 =?us-ascii?Q?NPxBGFgVAvR8yRWtdoTbNntgIi+j17pv+0+TsOKmJliKqwF4YDIjL+yS/xRz?=
 =?us-ascii?Q?jQXFqNRsfpqJmaJr04LJ/Y6Wn4ou87aWVa/pBaSB4chZU+H95mFu4sIfqTgj?=
 =?us-ascii?Q?eOFR+pUV3zG1svUxMCh5lDlNH/anp+DM0TvG+kJL8Oakfk1ocBRxwD0GiiFC?=
 =?us-ascii?Q?XEGH7g9RpHzNjSVL9g2opqizJNw5sNHVZRbOMvF0WFnRxTZYcNRLbu8dVZSP?=
 =?us-ascii?Q?y75SIBb2GBVaRj4E/fie0KqxykYyoX0roBNHEZWapCYIoHHLQvIxsf70T2VA?=
 =?us-ascii?Q?DJEKADYlRMtn3wbGPR92Q2RXpmoHoNT3QAVJSx+DOPUq17bSs0QenlsMPtmC?=
 =?us-ascii?Q?0rX6xbfIjo9o16kLogL5U8/gDXa2Sj0bO8iWY2SWrjF4OcgaRB3ChtQpY+KI?=
 =?us-ascii?Q?scf+HLdQuyRiAweW4voJ0brcxJYRX9N3pdwfn/PbRl1LkZdUIT8KeKrBf79G?=
 =?us-ascii?Q?jlzFTC3LgeApLWEBagvb4uzlLRvZEsfS+dJGyMhbs6JPfZabYmrMtEXYsWri?=
 =?us-ascii?Q?v2nDrur4MMiRptU7kFvpo2whtHUeFHrYMnNeEWJr3A3wgjQImJjMt4eZuH0p?=
 =?us-ascii?Q?ojbBQNylSQL35ojodsLM3LJaARCU4H5Nb21uUHccx3D8ukf5mW+89O8+RCgY?=
 =?us-ascii?Q?MryP7eKQgV8d1ANl8r/sWJUOgXcWxnCMvqMn3/oQq6qJ5o1upH6KjyY11CC4?=
 =?us-ascii?Q?p2v4gmab+zsISpK8z5svZZkMCyFnyBooBmnt2z0HytcPJilLMDnVXgQZZ9SQ?=
 =?us-ascii?Q?FN/ebVpyX1uOSMftVaZhu+vVF4cHtJnh5tCzYhr0w2u2bqRVluc87q7EEmQh?=
 =?us-ascii?Q?WO3mnwMT63RinIRuzS4YihyXzN51N4tu5A0lCM41t9pLAGuWUgaiI3xc6xtC?=
 =?us-ascii?Q?rnMtXbM4IcN42YggMpeNwOy/91qccyUuznpMxuiH4NzT/FdVdm0sySNWr4gZ?=
 =?us-ascii?Q?yoES+4tUivGwqHylCxFkShjW+tfXam4gBgGTHdWAOq7vq4bye0Q9p9iXlvzb?=
 =?us-ascii?Q?QU3rcANh7Y14e7Wj98huhYd3vZiojguwY9EF4+666tPGDYR2CfB7/v5mSGdZ?=
 =?us-ascii?Q?908VcEbAkXgpU4KCpP7xhrjV3iSAtcQZo/a0zXNwX9diwlzMGO4ayYFhVy4k?=
 =?us-ascii?Q?7ZAf4VTcDLw2/BxtmYEF/hnYNnmfE2xAAC4GlMCTOFNHM3vM3NOREFPmcIPD?=
 =?us-ascii?Q?7W3LJ7pXKWoc3pkG/IhbDMKGlcRAtBjU78Txnx/wcH7HIaBFIhDFGFamgoKV?=
 =?us-ascii?Q?aIjCdyH41vZUvkMI/149C0Xu7OKtQBPl3YIje6oyLzzNY01pf3+C6AV1gk1r?=
 =?us-ascii?Q?eTsH4u7DvHErVahLNSLDbJGGVUS91emS7wdNN+fyW0kfr2ylzCzWmSzo6Nmd?=
 =?us-ascii?Q?+vCjDU3smA+uPMvxjllvbTt2bJ9+RiI3WdILNm4C9gS3v4mlbuEbbMOthtwP?=
 =?us-ascii?Q?mX0hiP+MSVyWlOwtZtDkJUU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9940f6ae-3b9a-4b59-8dc7-08dba2aca5af
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:11:00.5629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UZTtGfmOQ1aG45/v/5uRcdEDnrfk0FsG55Alw9TrRqRXaBzP0EkuIwwGSSzZFDMceVURsMfrWWlltLU0Vjxbkjx1DxVn0F60gOca5bWt5/iBPlN7VHLNENkD345WH0qW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9708
Message-ID-Hash: TX7CAYSEQ5MHWDK5P3A353MD5EWPBSWF
X-Message-ID-Hash: TX7CAYSEQ5MHWDK5P3A353MD5EWPBSWF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TX7CAYSEQ5MHWDK5P3A353MD5EWPBSWF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308152047.psX1QNDh-lkp@intel.com/
Cc: Randy Dunlap <rdunlap@infradead.org>
Fixes: 446b31e89493 ("ASoC: soc-dai.h: remove unused call back functions")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/mpc5200_psc_ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 40a4a2667394..1671bcd4ee3d 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -222,6 +222,7 @@ static int psc_ac97_probe(struct snd_soc_dai *cpu_dai)
  * psc_ac97_dai_template: template CPU Digital Audio Interface
  */
 static const struct snd_soc_dai_ops psc_ac97_analog_ops = {
+	.probe		= psc_ac97_probe,
 	.hw_params	= psc_ac97_hw_analog_params,
 	.trigger	= psc_ac97_trigger,
 };
@@ -233,7 +234,6 @@ static const struct snd_soc_dai_ops psc_ac97_digital_ops = {
 static struct snd_soc_dai_driver psc_ac97_dai[] = {
 {
 	.name = "mpc5200-psc-ac97.0",
-	.probe	= psc_ac97_probe,
 	.playback = {
 		.stream_name	= "AC97 Playback",
 		.channels_min   = 1,
-- 
2.25.1

