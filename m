Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C7976C1BD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC31784D;
	Wed,  2 Aug 2023 02:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC31784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937811;
	bh=zyaD3CneJBCHPhjzHIH8xczflKIOCrBDMUTN9vUWLC4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h6F9Sk7bbWTRadv/60TPO5viUO3783jCmgnyyw7OPrBSIYTZBfzgC9afUh+qKuDo8
	 mEhTstdekpWGDaZFmLaD5FgTcSe+c/FQo+d3SkPm83OijAaeYxJHj7W0C0SLT4MPbS
	 jGIQVwZDsDaQ7f8AqKwK76fvc7nwSe7/Rh/hVH5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F7E6F80553; Wed,  2 Aug 2023 02:54:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F6F5F8057B;
	Wed,  2 Aug 2023 02:54:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFC94F805E5; Wed,  2 Aug 2023 02:54:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AEF9F805E4
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEF9F805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p/C4KR12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xlr/xyejQcPv7cidaP8He5pizVNNhnU6XgA/5i2Gt42xb7SEUBwb1+Cu0jqBWQrRDf+HWw21TJuEHgyn2x9/oOXoxoEvQN+yqMWiV3hAWqMsiqIhkTcUAUh03fCySDiDhkAqtTm1v/qBaqKPtna7ryZzNcCZagOT6ippGFpnp5fr68GzoZvlMn9nLlv+TTjVJ3cBrlsGswWP5dI2o0xMGWkdVvl1t1vtTXDW7w9/niEnsUZzeGnR/oNGBtLYSeUr105PBhlmBL/UeOfuEYRE5IxQ26YdM/bdzfgt76j/7tjO8RBngnLIbhx6mvy85+/oXZ0T3osgIUdtWREIH4QJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WorLyNuTyiO/HF4y0aCr+/Xphl7RDfKyAJg2FnPGeOk=;
 b=PbZs+FHxy0DecibiiOEubyO5UksuJb5nRsttqFBxgeXXrM7OyNB+YLrDdJ4xobEZTm4YU9IAU/Es+vW29iIsglHLmOPe1E/yUqZdpNyCb9KPD8AP76j1znUTQtaahGC22d51Ch5ybPR8FQ5otzHzvnR2+MLAS4IlVggHsvHQEN99rDtRvRuVmzbGaBicnB6lhAHBQ4L4Ry/9cZb4hNOi22ms39zixwWW7FEae7BT1KvHTMPTj8seAeF2a+TEKYwrs7Sf2x/xYabb+Cf0E2ujnjbluBN4ygtOV5AsakM+EkWhY7AWggvr98UKznDXxb8rSR65cWOGDcS9YyzLT5BqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WorLyNuTyiO/HF4y0aCr+/Xphl7RDfKyAJg2FnPGeOk=;
 b=p/C4KR12k5EBVzKOLWTxocNZnk7sv413zv2nHdXV1bnvQGBau0PZzPIuyB/rxukD9IPrbjTF/DfcJ+lJ4BoupFmvrCJNSN3Kr5P4z0zf9vbRJLd50uGJHLTKG7dNN9gYFHGf8CgBTDFOlMISrcQwn+ShZHGvcYQA5ddMtVEsPww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:54:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:54:01 +0000
Message-ID: <87r0omtgba.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 13/38] ASoC: stm: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:54:01 +0000
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa5bc0f-0edf-4f24-cbc5-08db92f2f656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M569lUEeS7TqaVEspKSvKglTEzHFMUTjwlQCCkCOcjplbGYxvoe8x1G5Tls1d3UXZ6LRn4jrDiz3TsTy4lBzpj4TFDQsxz/yz5ncrQXkBpQxMnEBBOkPcwfytVuPgFGfsHxLlI3IafBOsRihKmliEhV//fSyCD/pa4cJr0Qz9j+gVYVumcctuOE5E2Rbei5oUppDXTENhfBQCyqxYb/kZhbhN9HuqF805I/bmEhQX8OBmjKlclWobrpNbxFI9CVr5akyUCq1vp3n1BgBVOXqI550MKfXTjkniW/nGkPgOj3v0OIRwG0roKh6uDrZbxk2jPXqB+utT3CsI4atWYj8ManAUyXXaUYahAZNiZAL3g+Ie521YpIW4rdwckWvxvYnwvwTaDakXInZpC5+0FQ98hm66QgakpUDmDzd4i3e2HRKz+s7WY3lsk5c7+m5byciL7nYPwBIa9glAwwT0M+fSQD0/Cuity0gYi5oATaZsM0YN0us6a3GqPTa2PtNAKN9tDLKSdbrbbtkgHC8SJ4/AJ6eBo6ItRWOhpFMYpgbPBj0cNVXXkGn4yCxXj8NCh8SoZpsKHC+PnGeHdjGp4ByZ/e+PQapJ1TzvL2BuiVMomj5pXf1cSlnZExciN2jBN66
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(26005)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?093OgwHp6GCEg7pNsRtSM6lXxLH2z6V0od+UAH8ANKRp/nJ7eb6DkIkW/Q8j?=
 =?us-ascii?Q?dSOeF5xqUHunfzuvxGdybb0RNCwbgU6sjb978J44tn68nma891zUr26Re3pl?=
 =?us-ascii?Q?rgk8jFOdsKpkKXrC6Ise+AaoahpzDPeJ6J0SIzHmbo5rpCtvxLoJgdshTJ10?=
 =?us-ascii?Q?pdWM1y1oEKG5MEHLiO59YYwZ4K7pegyLul3M6ks3qed4ZnQwEbgEaZzFErOk?=
 =?us-ascii?Q?oSb3QB0ds2EfqRRAwyVct1d8bFhbvdRQMSHHkSLUew8L7J7L45eha9pvjOyk?=
 =?us-ascii?Q?cBG7BZWw+qANxoipuM6Sh4RrzPUgBleEWj1asBiCXqV9w9VLQDFjpZIYp4aL?=
 =?us-ascii?Q?XXp/jRR7LP1vNlbn1Jp4rY8xdKoijzkAo7VerINZATjsLf0nn3nykHH1LWsa?=
 =?us-ascii?Q?W7h3QWpq3PGG1P4/cWg6KbtR9q/7PEmnkiDUfWp8ZBwzMyQzP8fCiziF7479?=
 =?us-ascii?Q?iY4YiYR7T8594fF6+X5ysm8jCzPoPqsyB6C+OE9Sw3x6y9QBmukrQf6wjH90?=
 =?us-ascii?Q?2v/xzgCFYJM5Gyde9l2fenboBjlku4LUxkP+/TWQUG2P6htMW3tn19sh6BCC?=
 =?us-ascii?Q?sBrRAI/cG/YcJRS3kOjHKS3CJwzxCKu45CFUchTkKcv5Fhc/IjesCEhgx+N6?=
 =?us-ascii?Q?2+GaYdVjGLCddtaK5QiKLby2kZE/Eo0HGbW+g5xejy6iNIRlBGc7yufWsjER?=
 =?us-ascii?Q?jE4juZCn4U/r/nb9FOB+nKVOguuUbZ4k3e3JyW2jI9xa416/ggu9E+zFx9Hg?=
 =?us-ascii?Q?QCcODeK5IfwNKKZiZF1F6O//rtzGGgt75NU8x00ziTUR72hF1tOvkoI9TCDd?=
 =?us-ascii?Q?xsnM/citssNq4u2x3GeHFFNDaAIlpBao+NQWwDSmRVVGZFAsV4hG/tVs4UXA?=
 =?us-ascii?Q?IqJWi0kKFhRbcuN+U/IUfv5P5L5s7YJsXs91zrh4j96G8X6fEkZjlpSkYeHT?=
 =?us-ascii?Q?gk6DdbDwifQYVUznEHN5duutQTkG03yYt/dfuPvOkpnCkiVidcqiGNk2e8Ra?=
 =?us-ascii?Q?gP34d91XBtXV/wuRqOBQh1z3jrfd0vyfHzg1aDqp3YOiSVS+F8otFrYpjVHg?=
 =?us-ascii?Q?/pBXMxtj+34B19su8u/RAQ3nkR+boTtYwV2RRySwxM+U0ePJAIfgQrwsOJES?=
 =?us-ascii?Q?7PwG3tl2WxwGmAhP4P18WULeC6PB0+R084eO0SHYMDmVvAOv7dJnhsEHG2Lj?=
 =?us-ascii?Q?ZA1Mpz2zqQ4iAQuzkM1bJzXZTerYgYVccyfoxzBhx0T5IylrrdOKajgeaR+N?=
 =?us-ascii?Q?V/ydrPslOiplGiByqpmNolRKvmYFZ+cCqSG+PkFpH+LJrFxsKPxi/pbRfVV0?=
 =?us-ascii?Q?jRv5jOWjppqg/xpEjN+cpkOxk6NMc+LBDCjw/L2Pk8nkXLEEsRGh5BO90bem?=
 =?us-ascii?Q?ClmWOiDbcQ57ZY+h8boJFth1Yf+ymIvShM7OvzCBlxuiX5H/oSmdPv0AZ5sQ?=
 =?us-ascii?Q?eCIeDzRaOWJSIYVEW4Is4SAGIlOxSdtm8tsU6Ljg7RSrzlkQsp7jzIetHakP?=
 =?us-ascii?Q?lve1SJZasQJmZ8NdrDfcXuDCX/GfEv4E6aHJa9/QUVVe/PfYB+3rlQG/CUQF?=
 =?us-ascii?Q?wyV8glZXW3CyhUcdnpjBPY8cuZOXMNbwCEReuSHyO9icHzr/nyefbH3T3n7E?=
 =?us-ascii?Q?YnX1F3+VBlPYFAxRPWzPfdw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fa5bc0f-0edf-4f24-cbc5-08db92f2f656
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:54:01.7292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wZbqqyqA7IcHGuqd1oTmhW6QQC7PIsVM8/a2Ax0iVNQ3yoesfS9CCoullUM0p2X4BP8tpds74wSUzZvaXj5ghXDWHmLlHavHyjMlO9FxUspZQQo2/InLJcMOriKYd69L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: T3PPXEVFUTZ7KXLZERHFF5ZCJZ37V7NS
X-Message-ID-Hash: T3PPXEVFUTZ7KXLZERHFF5ZCJZ37V7NS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3PPXEVFUTZ7KXLZERHFF5ZCJZ37V7NS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_i2s.c     |  2 +-
 sound/soc/stm/stm32_sai_sub.c | 18 ++++++++++++++----
 sound/soc/stm/stm32_spdifrx.c |  2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 387130701960..06a42130f5e4 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -953,6 +953,7 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 };
 
 static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
+	.probe		= stm32_i2s_dai_probe,
 	.set_sysclk	= stm32_i2s_set_sysclk,
 	.set_fmt	= stm32_i2s_set_dai_fmt,
 	.startup	= stm32_i2s_startup,
@@ -1002,7 +1003,6 @@ static int stm32_i2s_dais_init(struct platform_device *pdev,
 	if (!dai_ptr)
 		return -ENOMEM;
 
-	dai_ptr->probe = stm32_i2s_dai_probe;
 	dai_ptr->ops = &stm32_i2s_pcm_dai_ops;
 	dai_ptr->id = 1;
 	stm32_i2s_dai_init(&dai_ptr->playback, "playback");
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 271ec5b3378d..42d67b7a68e8 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1222,6 +1222,19 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 }
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
+	.probe		= stm32_sai_dai_probe,
+	.set_sysclk	= stm32_sai_set_sysclk,
+	.set_fmt	= stm32_sai_set_dai_fmt,
+	.set_tdm_slot	= stm32_sai_set_dai_tdm_slot,
+	.startup	= stm32_sai_startup,
+	.hw_params	= stm32_sai_hw_params,
+	.trigger	= stm32_sai_trigger,
+	.shutdown	= stm32_sai_shutdown,
+	.pcm_new	= stm32_sai_pcm_new,
+};
+
+static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops2 = {
+	.probe		= stm32_sai_dai_probe,
 	.set_sysclk	= stm32_sai_set_sysclk,
 	.set_fmt	= stm32_sai_set_dai_fmt,
 	.set_tdm_slot	= stm32_sai_set_dai_tdm_slot,
@@ -1287,8 +1300,6 @@ static const struct snd_pcm_hardware stm32_sai_pcm_hw = {
 };
 
 static struct snd_soc_dai_driver stm32_sai_playback_dai = {
-		.probe = stm32_sai_dai_probe,
-		.pcm_new = stm32_sai_pcm_new,
 		.id = 1, /* avoid call to fmt_single_name() */
 		.playback = {
 			.channels_min = 1,
@@ -1306,7 +1317,6 @@ static struct snd_soc_dai_driver stm32_sai_playback_dai = {
 };
 
 static struct snd_soc_dai_driver stm32_sai_capture_dai = {
-		.probe = stm32_sai_dai_probe,
 		.id = 1, /* avoid call to fmt_single_name() */
 		.capture = {
 			.channels_min = 1,
@@ -1320,7 +1330,7 @@ static struct snd_soc_dai_driver stm32_sai_capture_dai = {
 				SNDRV_PCM_FMTBIT_S16_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
-		.ops = &stm32_sai_pcm_dai_ops,
+		.ops = &stm32_sai_pcm_dai_ops2,
 };
 
 static const struct snd_dmaengine_pcm_config stm32_sai_pcm_config = {
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index a4066f271f2d..a359b528b26b 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -856,6 +856,7 @@ static void stm32_spdifrx_shutdown(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops stm32_spdifrx_pcm_dai_ops = {
+	.probe		= stm32_spdifrx_dai_probe,
 	.startup	= stm32_spdifrx_startup,
 	.hw_params	= stm32_spdifrx_hw_params,
 	.trigger	= stm32_spdifrx_trigger,
@@ -864,7 +865,6 @@ static const struct snd_soc_dai_ops stm32_spdifrx_pcm_dai_ops = {
 
 static struct snd_soc_dai_driver stm32_spdifrx_dai[] = {
 	{
-		.probe = stm32_spdifrx_dai_probe,
 		.capture = {
 			.stream_name = "CPU-Capture",
 			.channels_min = 1,
-- 
2.25.1

