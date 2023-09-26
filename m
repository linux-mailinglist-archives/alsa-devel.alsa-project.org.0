Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA1B7AE5D4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F82EB0;
	Tue, 26 Sep 2023 08:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F82EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709643;
	bh=8ewh8S9j0SK9ho9ixNpW8SlYXSlxw+m+1J91A4QFtF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IwE2MKPy/utHv0mXBj1DlMVuEqBZN9kN53tfbEccbV2ug8ozkaZ90J7GzzTvDJhp1
	 boWxD9EqYfC0C6gyHssCS431Gcl8pmdOxdKD19FeEhBbQvS22z8QkN90mGf3809hNU
	 s/GlzC9Kyb5oJLYXxZSqb4yoIEcwam180oq/AIIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55FD1F80633; Tue, 26 Sep 2023 08:23:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A05F4F8061F;
	Tue, 26 Sep 2023 08:23:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55440F805C6; Tue, 26 Sep 2023 08:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4637EF80552
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4637EF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PuXAbSUS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tvlnd4GgOMui4+6n50av4Dh5gptiDWNFvBmU4Z7kzq3AYZJQeMab+zX2qGENtfnUAPz+HhxBO629OJ/4eu+VPuTmbJP9btYB729LEH9rGVoGXRZSXTANOFzpyRWpjf0I1pv+kueqEVZy/uAosmnyTIjB21y9hssmMRjpPUQV8Wc2yPQPhljPkA3r9dQvSbNDoNaxNARMpcTCc9Qr6kVO0EUqnHjEvGtie/kyPz+kLKCfpH3GnhQkzJmPeBhQ3QF3yvBRruO0/JdeHd/vXsnSnn9dAZIwHvK1tP3HLKTh9OMkZMPZJs36jFQdIdSRmbuV2/UCb1fslNP8Ibp7ip5OlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCnhR2D7o+QIbJf6c/MV9fZDsZZA8M32TNJW4KYzNSs=;
 b=eFB1/XomU0vqaKxZfBEQdM54vZzpxJezG9AUVRQ3sOyDxaca1Vpl1lD2MpSsAPrpydT4iW5RMtxqAK/JX1xSU74nXKTYWfa1YtJKZ37wDwAO4lJmiBviDaWzEp+aTTLStgonN/cG70XXz2zGOPT02Ess6cVnbdj0Py7C4jzbaHtyZTJ0noFF/a9PrNMsegwRKDPl5/px4Cigby2uX7viJ0oON707O38n4Z4A57DeyRXPXh/xMaT9qSLT6YhAOY3N76h/Z/TT3m0Y8kTTou1REzFGVEWzp7t/Ur5wLvLCmfFZBpq/ysh4C+E4RgXcrRQj5AbwiJMfYHDEmPq+2loaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCnhR2D7o+QIbJf6c/MV9fZDsZZA8M32TNJW4KYzNSs=;
 b=PuXAbSUSEEFV4MHGy/OzE7JdfT+3qrX0S+P0yHPRCay6KD7V/tuVgJM+NzD48ygCtttAj91ZysKIF7gCzl8jGg5sADCXTQ6LBmlZ6OWNtMQ/PTpvFaVEQLJvgs1IGHQn05idTB1AlOjDK0fWc9GLjGApqaCphPP5/eU7jjh1Ie8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:54 +0000
Message-ID: <87fs31h2rl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 24/54] ASoC: cirrus: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:54 +0000
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: deba52e5-4ac6-475e-a08f-08dbbe5904ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CJFvHyCjG0dFiijh72DI312kSIamVrSwE8HCYfK0J7rg5CmV86/ra2nOvbeBqDbbFbyH3lE59DGM+1JNQBkuMxRoHMscBhVEE6Ve0GZ8FI5ECX1pKYDcFYUO6hP00JmMKuMOuCdlKYwio3DGqOkkG+wJZarTpnY0eXnGzMu08Ha6tMNF9FYjb7kGJhurZpZxID8oXRF1bPJXeL/IcxDC0Kn6LD3EmD99IrdwWRrEgyrWq9FCA2FQsQi/oZU0F6MrCU8/yMwI7Dr7nvKQgx1E79G+aXlzP3DLLbmzKycsvpJoE3MgKLcclpjWSDy5JGu2vWlNvAeqD9aqn4oxVndZpgpX288mxuBQl3WRaWVHYUyPW4WH+Jwfg0aHgg1zEzrT+9T57yUI5kCeesDx84NfRsCWsB2g7nkC3hU9qHWgKX4FKjT7bck4UbL8qv89Ry9VDl2nqdRgBPnIV9Wo1ndkOR4tSa8dB4D30ohJtKcfw+I4Ex2WVj2xhyTbTxqKQnr5erXUvHNaOHODvcmB2WlAucN33OsqDA4XM81ZqUJ2tUBENsMGzINqvRMXFO1oGEi5f7Q2p3Nnxy0tv/2wa+t1RTHFSEKwZqTvbdD6DcU8+6Xx+joSiwW8JhWCeYBSMgJszVTpE1ARr9nHQG5w1s006A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BhNPR1Sh5J1g4a/Hj62SylNZdktqOsSjYzSLpHq+XNOl3qAYnKnU5RryzQKU?=
 =?us-ascii?Q?r06u1OhEwwG7S81C6isfqJejPB9xLmeSaHQs2E9xUC3I0sFkyMrLsL01yzzG?=
 =?us-ascii?Q?f2ZnpakvvHJCtWtaG6erzOIVLw53ymyUj0H/NfIaHPEMIU+T5PCMRbOH5gED?=
 =?us-ascii?Q?qZqOay7ihL62RNl1KZDJIDqAK9ATW5awjGD5i7TFYBE9EUgcO2sFk+mnfFAS?=
 =?us-ascii?Q?dasbxmIGrdFj50DyVZgARHa9Itawf76GVA8i62hmqhAxq6SgiuCdvA8WRVC3?=
 =?us-ascii?Q?YLaPPToHIG7T5ifLhhPpdTOl5ggkdvM7QRp7TNU16+2H3s4eGWOFBeixFdhz?=
 =?us-ascii?Q?T1yIn4XpOI1TKo4CUhCWzyYg7W8PreFSvkdqCRBN4QiBPzBHL/pIUDRxjyNv?=
 =?us-ascii?Q?IBz+lkoLsTdTAENp0+HGdQzNr8Y1g9J1RTCkj0jY0CkG8OmQqEJUt0oButgH?=
 =?us-ascii?Q?HlamKXioAIe8dIXK1QX+ept2ouvIUI+LabKip87hD+deGB/XaMTmNovGmx6o?=
 =?us-ascii?Q?6kRGoBLDWH+rB2fduMnzmLSmFuUN8kpH/USkVT3QnZJDLuTcyCfv3iUxHcbv?=
 =?us-ascii?Q?V4URDwxTMquvI03Zh6cmssh5T86QNN2degZB4KebSq2D2iN5Nti/WgPlpWDo?=
 =?us-ascii?Q?ihp2w3AvXV3XEBJpcEOJ/VMTngl7S4WwaHPnlT1VUAqX1H7MIoHdmvHAXqPq?=
 =?us-ascii?Q?x6wffi6Sq9aV/d+H/4IAnNcKoVjNa2n0VF/VyTyU7uRk4bCEuCWRL+kgylBt?=
 =?us-ascii?Q?aa3sHdPI8C2goE+zJWkDGvjgy2wTlDbIV2ODc5kgCPLK6AOoqfLXby/eWswH?=
 =?us-ascii?Q?/uuyU4t0x4UrhiJXPhYuut7XpHP9Hix1Oeili80IaO9wVzb0j4VsFUj9eolz?=
 =?us-ascii?Q?LKRwsMgHgSMZeDqwy/C/GWGG+flALJR3utaEekqamqsmMYkX0p+ws9Hcq0Nc?=
 =?us-ascii?Q?mifhp1J3jaSAG9ovNE0Ge3ea8NcQ5zZu72/G3ltcbecS5wWyGAosJgZhDPiM?=
 =?us-ascii?Q?IVEo0xzd0vIxr2oM+ZB7XPOm4lTlubyHbJ+6MViHp4PkBpPri1q4NQ2Dxxfk?=
 =?us-ascii?Q?Eg4anxDdC2uG/MpJn7cuqAMXh1F3ta56uvXeJFwTeti9Cd/3BgHOfbvq8F/e?=
 =?us-ascii?Q?auqu+cYQ9nkHNOasnpY0Yme2abkbOLhdZBjfw29GSWdK/nlPy2/+3xwFOEM5?=
 =?us-ascii?Q?8nm5nwq9GjzuGnf3bS6dy3StZl4UWYYKuMYlSPA16SgL00AkEH3zXQ1A9vWK?=
 =?us-ascii?Q?jHdjZVcBVFpWOOgoF2hqa9LfEtzf+ZuP1xvrPmtJVW4Nh4hyuvTwsVu+dA9R?=
 =?us-ascii?Q?BNguRRYEvVA3Bc65zbkS4eGP8+8OMGaPUgJpbM5B2VQvUyBncBcgeBMMCV9C?=
 =?us-ascii?Q?dk2qA7QJ3q4yr3lbM0CPnp13XKi1oNxFlHseImHdqdwOzJWX1cxpIIDyq2P/?=
 =?us-ascii?Q?JeQiYUrPQ0dOdRr/rkLAzCqFddErw/euV2L9kOHb/gzBR5A/62CVzrs0ZFkc?=
 =?us-ascii?Q?ZEMSlyEebiz3eSafoKmR8rQaW4bB0FX3MCbbTWkDvefPSqaSnO+dMeZy31q7?=
 =?us-ascii?Q?vqGUDA6xGX1okngiRH7rnU3avervDuVeTP2r9BnMm3m2FBLBsUnxkyf5sM88?=
 =?us-ascii?Q?uOArAPomKcQm2aK3F1+kwjk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 deba52e5-4ac6-475e-a08f-08dbbe5904ef
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:54.8231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TnjBdL/dVutbXPy3v1kbsATkWjkl+aM8lpGumUDWUxKbRLzbQgYlhWRV6179hq5pSnVjbyZjJNkNnYKP6A9DhW0pZWEMxnq7nP/KFd21rfvS9JqwbJpvj1fKTS2QjOwy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: WFQVT3YYZO223LAKD5AYW7FNMIBOO346
X-Message-ID-Hash: WFQVT3YYZO223LAKD5AYW7FNMIBOO346
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFQVT3YYZO223LAKD5AYW7FNMIBOO346/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/edb93xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index f49caab21a25..6b6817256331 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -22,9 +22,9 @@
 static int edb93xx_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int err;
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
-- 
2.25.1

