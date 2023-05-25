Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9615710516
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35FA0836;
	Thu, 25 May 2023 07:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35FA0836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990894;
	bh=N/B4Y38hjWN36QyDhxmBfVcYZer2SdQFwlHsfgd9Bco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QIAKbuonwmlk4a0001SepvjantY5/dRCM9zUG8HeQBzuoijffvKU5rtzVOszbwS+j
	 ukFrrHLqoUdhMgeiw/vwhU0OiP7aVD1p1ZaiEKKwjjfWTwc02/dL2M9LRss8evMvY3
	 Z84PJFsJ46e9oCogkoIp5GTbTuLkX08r3a3mjCZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F948F806CC; Thu, 25 May 2023 03:22:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB60F806C2;
	Thu, 25 May 2023 03:22:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D42CFF806BB; Thu, 25 May 2023 03:21:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E1FBF806B0
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1FBF806B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=B+dkmBsY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuF/jB+gWBWfCAqzltEgoZyUueCvxoCcg1sKZ1RYruPa+P8Lz9ddMbiQWws2SM+b7M8W9cHPKy/UH17Gz0nDTLHGB9FXd90MgP3McFGld/dH1yxb6hL7rH1GFVDwYtLGlmNeBB/DJsYGY2LQ0aCNqaNN5sAvcmIyKpnhZpmdf9gdml7XuN4bR/ABHugybb/RFlkchqLi/svXAbHKMl3nKngEh4oEhPI4ezcV3jMmJqHPY8uy0KnfGPe4ivEnoqFPu6IFTDW1Xj1xVkgaUEmtfV8AetIeOfSJs5MgfxWTC2YA6e82DO132cdHgt7yEEfVae6pkKtlV4RipRkpJeFWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee6ivP1wWvXZ4wj3pxJ8Yls6cXQZCmml9pEsGukaNPs=;
 b=MVYBym+pvlU59EWPiPtt9frCk5+c5S1qAIwYV0jbHCTTu4SlWC12fV+pTMxmNMHyHaFdeD2rdJba+UCHca0ge1ouPqltqlUlWhwSfKiQzYeCYYE+L96HSDdOAGWRGQWTTbufxeOZwHGDB47IHKhju9J2IeHuVTT0fpD80ZuaNaYleeml1HgrsE7l7QYEpU5C+WVjmI97ucLmtb3RygNWzFP3Jd4u8bp/cAKN1xYWoMlkRHvHiRv8nJzn8In79faQqzQ/Hts0IH/iGfQuJz7zDghJdqniSo3cxAVAqNtOLJdm3AB3wrm39FI+Y8mkGnwBbzqa6K11wi9+ebiK6Q8ybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ee6ivP1wWvXZ4wj3pxJ8Yls6cXQZCmml9pEsGukaNPs=;
 b=B+dkmBsYJlgDfvMjcOrei1+W9DssT+Y9z6wFTKplBCEVVQJgjYLCHnob7hr0+o2y2TQrfZwwG9273R1NuaBWcImAz8Zjodij8gekGXw8ugHi/L6EGsSFq1mMHiofZFW71Q5SZyF9XFtXCELvLgsimKlEWrnYdA5eWes/Jf6FAJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB9477.jpnprd01.prod.outlook.com (2603:1096:400:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 01:21:44 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:21:43 +0000
Message-ID: <874jo1gq8p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 18/21] ASoC: soc-core.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:21:43 +0000
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6d5201-c634-40f1-c67b-08db5cbe664f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xM0ZqBIMUFosp524smm8XF2Z6Xooyts/wuOsdc8M3EnHdZlgCnY4BVOQ4Uk5ieqpx6x+9DlPQF+H4U03A7Sb9JQd9EtE62Fchtm40jnyq9IilONpSLPd/YAbQlRGiXcadYVXw9z8bOlWqPfCCm2k/yUGa2F90XgoXrdtDkFHQKUuCyPpuYJwJTi8+jvwoR3mIv2RMZ8XfuNPr19QWudiMRTxmKfdy6qTLueYAvQanse2MBRxxAtqefTh3ODUcYxtmDugcIrX3AU4OnBqFnI3UYkE04IXKzo5w3z7w+ScpgWncxe7yvM2jBrfs+H02RxpMquiB9wLa77IOAB+pY04WgP7ra+FY2pGoTCjEhAeR/kHkIVlItqCKzNbCC7NClH4D9oAwz5yy7k5+0GljpjyjCKMwdmDOf17Kal+eV8RjiwhISMFVad/o6U++vII+aCz/nZTJVNsDqaTFWbTsJS+HCECWoa33ioQOB+5spZzCgrioBg5tnqSyev25o10l3t1Y2aDHxmBt1xVFfUWBFPGc/oD9jyq22vax7ZFTUEpNPXrSoh0qOz9N4Xt0KMlHt0oDrDPesbiD6ZC4XyuglShsmMVgFTgiKZ9ObjuDcXZD0RHGW7NSipsFDxnI6g4BQ+X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(38100700002)(38350700002)(6486002)(2906002)(66946007)(66476007)(4326008)(8936002)(8676002)(41300700001)(66556008)(316002)(36756003)(5660300002)(478600001)(2616005)(52116002)(110136005)(186003)(6512007)(83380400001)(86362001)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?UKDx8m+HC6nJBrnZ96dgNvoZJVxNxKUm/wcaOhGBX9Key4GXhoS74BzAQP?=
 =?iso-8859-2?Q?N8hrDDCohOJD7jbPBjBziCCg99/87LODRvIVhp/GLeT0thLJBnRs23WY0v?=
 =?iso-8859-2?Q?zETwwXhE264cqrkEQXj0Rfs1s/jD393FKmcnJhS09HlHFEi62JLG/aR1A+?=
 =?iso-8859-2?Q?GbVRsLfZB33i7gCKCXLPh6Br8xJNWpcJhz/tM0ADZgM6HdqA36EO3bRmWs?=
 =?iso-8859-2?Q?cBJabnZqs63mDZpMWDTLE0Z8L0xM5Mx9ygdjJmsbuhuRD8L30nqyxKtFE6?=
 =?iso-8859-2?Q?Tmn/lMLDzSeb2tsou/lCkfQoljf3PDP5ntQK9wyY4z23kfETsULk+/BCgm?=
 =?iso-8859-2?Q?URk2y7kwCAv/+g8TNcNS+SS9TtfgJMU2rM1zuCW6wSfTkWoRbpUpdB7Qda?=
 =?iso-8859-2?Q?kuUtuMNX8bfhEPzN3j2SqTVjvsWP090ocDdU9B6AMJzVSVQHWauqM9MFGj?=
 =?iso-8859-2?Q?m5tOX34jm8rofo9V00nXNx8OfbwJcKC9fqUFwymf5gkMMVgjuZbwQAjtzo?=
 =?iso-8859-2?Q?AysLskM/bh3UQiAfI48RK0P/zqDINz5njti5gAGNJwk5MTvjZgtuEHgj5u?=
 =?iso-8859-2?Q?wHRI5etO+jEmg91bQ7n7uBSGB05NXsLsRvwJPRq7BZsbUVMbss3nikwcPu?=
 =?iso-8859-2?Q?a63nb3XVr/o9sFSCbwyFs+wov0J0X5nszPOdHL1fLvFyvTvKTw5ceVqZzJ?=
 =?iso-8859-2?Q?gSfOa5f7hgQW7noEoj4KKJ7vRi7M3bn68tqm7RQpEruuc108hj2igbn6Sg?=
 =?iso-8859-2?Q?vs54Mccg/uNBaZdo8Q5hLkJom/Se3jlszH0vRYUB71BAXMnuN31/Tdl3Tx?=
 =?iso-8859-2?Q?KDN1vSKtWqnRnPDNr96OPkQ48dFazQt5mwgwT7zAjwt1/6BgxzltV357Cz?=
 =?iso-8859-2?Q?/h83SYj1ONYoCnRTuJg+nw7rcUlKokqOiILEqyrNq0qS0ys02fgjJsNNHr?=
 =?iso-8859-2?Q?yA8LR/mCD1vG8v5kPSyigamsTCd4dpMNHzXoKcdZHw8OD6Wj3Z+zUB2xDx?=
 =?iso-8859-2?Q?QGNb8pLF4wcneKlg10CP4XfTVQUprmWzygIC2V3rCKiFg2w3CIuR1WDQgu?=
 =?iso-8859-2?Q?zq9gZSRYBnsgNn1NCr0AZbkF9WpwdOaB6eEvFgT0NCpsw/OuxYyg18C96s?=
 =?iso-8859-2?Q?KhO167ZSXswaWDRMIxCuKEEUgOxHCDhqhZE7JU/f90x0E1HuI1JTpVXgFO?=
 =?iso-8859-2?Q?WSmnGNuun1DBmjvn9pORQ2FOFmdkw5iWplRD77QKrDImNZd0CGGU0Pg+1T?=
 =?iso-8859-2?Q?puqP01vFVWC6a8Ot2gV5DzGnevpqUOvnqzPiBq/V9rWmNRb8+uaX+tqHzQ?=
 =?iso-8859-2?Q?G4zouk4plUsqaMfI4BjZRRxr+f0d1A6BulNInZD39UlBUaVZ6pBfbsL5Je?=
 =?iso-8859-2?Q?drGgx+LxQGgZO6QzXaeJy0tSya1cBQwGHbPA9VDiJxzbh3u8bEsA7m9Whd?=
 =?iso-8859-2?Q?2WMBnDuH9XazPb91OmNl2F9YKhA0FYcT7pdVxy3PlR+Vhbn67MKQf2l4sB?=
 =?iso-8859-2?Q?AoLVAr7yXqTATNdLB5/ERDs6J9XZmND2NEuYjw/2lX8SdEv+CGBjPOMp4i?=
 =?iso-8859-2?Q?6ZsZUq8GJGIa95AmmBcnuCqAJ1Y6lMkSK4U1JpByMbU+uhsgrSP1f0RCop?=
 =?iso-8859-2?Q?m0V/CsfnE7N5W83U+FAFRk3gZYe3Rm5+RUK9u60hY6Ysue19wAev+vAciu?=
 =?iso-8859-2?Q?V7MTEvHP0XBsMFoiZW0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d6d5201-c634-40f1-c67b-08db5cbe664f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:21:43.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9g+Otc0KRZI/4CBO1n8VSnM69U2XrBqKfcSt1ptajiPTyFhik04sxwXwTmBO6OQ6ZBF9ZBEgQXJaaSy90D2DAx/zYITM1zP3Dw/noki/5jgXMXTF9IxGJZpCFpki6SzH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9477
Message-ID-Hash: EQTQD7CMOAV3XHPZ7L2JAWYM6DMSJUJG
X-Message-ID-Hash: EQTQD7CMOAV3XHPZ7L2JAWYM6DMSJUJG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQTQD7CMOAV3XHPZ7L2JAWYM6DMSJUJG/>
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
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b48efc3a08d2..f57911e4e4d5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1781,25 +1781,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *=
card)
 				dai_link->platforms->name =3D component->name;
=20
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm =3D 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_pl=
ayback=3D1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_ca=
pture=3D1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback =3D !dai_link->capture_only;
-					dai_link->dpcm_capture =3D !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm =3D 1;
=20
 			/*
 			 * override any BE fixups
--=20
2.25.1

