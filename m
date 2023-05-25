Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F10B7104CD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87141204;
	Thu, 25 May 2023 06:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87141204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990578;
	bh=eXkDvqezi7ERAGj77f83+BFDRaBmKx1vpn1imIQSQqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DoJ4QGSSHE2QfF1Fl5bQNiIHJiZd0nlk1sAlfzpnITYAVuLtJTGhwRspInjgG7SIC
	 aAVe5dDn+RfAB3kn0D5coxm7Sy6tHgEvDxLCIgzWZncgGvU9zPAhg+QIwJ2+qap9FS
	 8+JchXp8zyMs/tVDS4IoK2oDlBDhdtD61FcECBVo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBFF2F805F1; Thu, 25 May 2023 03:18:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9817AF805F2;
	Thu, 25 May 2023 03:18:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFC27F805F3; Thu, 25 May 2023 03:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E864F805F1
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E864F805F1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ARGWOVQo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2CB5YHyr5OM0CQujogt9prON3pJtIclm3t3UkwAp2rvZSN7LMvmPSMVZstW+dlqEDZ1zdT1eXrQBniAcjzYwq0xersJ4OsnFGWMMy46iDclPIItPjDow+819JSElBlhGUq9KuyN6jphxL2KewyPdQL22emHzWdNpwNmMAPEnDi8Oz3qTpj82y+fR9jl/KrK3UGB3GNpAFrz/97LGDYSwt51rFzm7JjVOvlbI4l/MxRUAEpFgvdSPwLoPNw0j1cDJDMQfypY0qZlTAZa79zP2ksY2vSiUCgz582XOpD0Lb36HDn+sX2HLURk0xdnxaNjnyIOpqLs0AZkkYunX5CAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URYLGPDTAxi+1oEIac+j4tw5WMwXWhid+7elBPBpCKA=;
 b=Cfi94kwLvXdyUtQi75NYsgBpio2QzWQWCTgNPXPwE624mmjGA4PQtkyeDW2/QUSxLDL3tOleqskWf5KVQxOZbIH9m9Z7rM+e+CmVo/WFPfr6yduYwF60pKvR/G3SCZRn4GLrtPnMG8hNpE+MMSkjQJuR3Citp4L5UFAyOBwMlqlD7rkqfWQnAX+XUU4LdTXagx2JO65jtsrfe4wQecCSdugtqNjZ62nRn8qtzQIhJu+EJ5eFC5SVszSYwLn++uQjtiR/EwvH8qykFaa6luHDRprE/pjWyCNvuSIbKLFif4o61zhU++mVv2qvL5CJ4My62HIIvs/+hBuWfm1PAKM2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URYLGPDTAxi+1oEIac+j4tw5WMwXWhid+7elBPBpCKA=;
 b=ARGWOVQoSiqE6jSWw3DNj/Pc+Tjj8s8B33A8Dp240vLzScfv7ozqJYbz7zhsFpYltYL1B6xKJ+38fbJBgODa09uvTQ6smeVuzeHh4mnDCPhkHkEboX2Ifsh+/3LgI+plg7q4We2HSXlP8TkKJWJjvv8+pitsljLSQDaAJWmDbpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:18:19 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:18:19 +0000
Message-ID: <87mt1tgqec.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/21] ASoC: soc-pcm.c: tidyup playback/capture_only at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:18:19 +0000
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: e10ac641-9345-49e3-d73b-08db5cbdecf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rTo9YABORz3I/q9d8Hb09FPRLfkzgztju+JdedFPrqtRJacsQXXgGR/qa08UCOXCEx19XWn6svVG+3jeI1dmiRf+1wp2ZC9Xt8aPKT/nZjmL0QLbKOW2KEw1Jl8VJScjGNdIITpwYMt9O9zLwN/2rwFHCswkrThNTxwVzYSY8dfOwO4WvQjWI8FtdUjAIVAMHA9w8XVsonUBmQzodpr4XJkKY54qIcCkgH9pIaHQfc/NZj6ndJgvcNnpu/4+Qk6icbZ8ulpQ+I7hpsgc55wTcZPhL2VA+6a1yS2yS4n/F2wCc05byruKuMhoaAK1NcMSQbVuUfwoiMVr/10zMA/Agq+9zu+TbD+se+5sua1Z0TBk8jk90rihI7Dm9EC21FMMabnV7ZQrxeC46pZS8is3ZqsR77eqQhkkagxU5Sw1ggVPhHWRH3eQRf4jV95Fqi1Xyuf/YedU4N0Q0aZOK/a8UX3ChyEcIO0PspqwzQxtGtbSpWgg4cTmDsQYvd1UhKY/Kqbo8/E+mcPxyfsoHOhkx12t8sXVNs/BHTrf8/+lE90tT1NtyApbGggS4cCLKS7o2LX2EpnkIdNMCek18Ef/9su+k106AY2MR7lHAkNjh7UcLZuFyzhRHMbutGRxr/2u
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(6486002)(110136005)(2616005)(6512007)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38350700002)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?JQe5Nq/m3B+EwTwa9F/tS1h9i8uMHs0oNE6RzxR0CbyWbQYgj5OZFIfWmT?=
 =?iso-8859-2?Q?chmGANQJ0XBCk3UmoGBjP+rV/sB91+XxlCfLC38TEfvLtbH0XUhl5saL1z?=
 =?iso-8859-2?Q?8egIRSJ/qwwhBKKsDztOHWgq2mbrgj+dzN3lh0eq3wvzGMFbXAQlWwFsEs?=
 =?iso-8859-2?Q?xwJyUEmmgZdeiZOYh1s4c+TLRdRI/7GwAakhrxonl00nHCW0DMMJzupxT1?=
 =?iso-8859-2?Q?5LbUiF/ibYFMJRY3HRY3s/kgq7XVFNq5Om/Oy9f/SRNyqnIDEpzTtnwb04?=
 =?iso-8859-2?Q?Do0tFvZlptK9p2aWfskuxgv0QaKi3kBi+oaUtBMM97bc2mxBq2tVGAVfwR?=
 =?iso-8859-2?Q?jJ/s1cXdjSrZCbA8d3Q0JP5Dw79MTy/10BbTja4K0hVK6IFu+geNG9TpSa?=
 =?iso-8859-2?Q?decz1uLNN/KNIMDQJ88dA1y+fppK051ZsAQW4Rc5xwQL6yYEBcBPDBetX8?=
 =?iso-8859-2?Q?s7sO0+Qc/Uc8RD6il5cu0M9IHu5KbuAxRcWDx7viNy4AuxuQNNJvCzQUx5?=
 =?iso-8859-2?Q?AtB8r/jy3xRfQh53++o73MYJvuOQ4mMuYOtVqLidH8sf7/IFgaNEaygOdg?=
 =?iso-8859-2?Q?lQqk2OxBWTGp7CvKkb8AcJs57yHjxRJjyJ77nmnx/SDMSSJPPZ8rM76dni?=
 =?iso-8859-2?Q?4xe0pmpbWqo6AexJuRRGQOlumhCcjSlfeUrjm/9hdcMJiHLzvr20y1LsU9?=
 =?iso-8859-2?Q?7UlT5GNJ5QuKxC7/Oe+l6QY1CRBGd95hLoJiQbuC6kq3djnFF2BMj5h/z9?=
 =?iso-8859-2?Q?Q4cIH8HiNiFvsdk3aqizzFpbYtmVbq9d6PvccPBTd+w4mo3R0gKLpfajx+?=
 =?iso-8859-2?Q?aQ6szACxTW/HaIQoPuKp6UQGO77c61RwvcloFHydQrS84lJOcsZAyXEG8f?=
 =?iso-8859-2?Q?N1foex4+XO4vjRHq1SGnZnSwCJc9GgKr2vAMBBUWIeFbNEWV+Z6PdrYASy?=
 =?iso-8859-2?Q?NYrKeLQXj3m1DBsxV5NgwHUiFQuqBEE3XkqM9YTvi+rEwXIGMUzK2ONdn0?=
 =?iso-8859-2?Q?cUpNShi+eEY/rrJtljJj1Vyqofu3o4rS/0Fo7dWjFlyySL1nV7TPdoqtvk?=
 =?iso-8859-2?Q?DXGFwcGcEgDk8wsvtmAFkq7F+Wxu0AHdXjd8Qfo3JfFXRcfD9N5MmXO23X?=
 =?iso-8859-2?Q?KUDX6n8pMS/ApKfoVF3oTsEK5kMOrG9DIVErO7ySJEnrkddUSleJ8tK+y+?=
 =?iso-8859-2?Q?rA1m5geeE/j9lcmS3PVFFd5Xcz30up2Xk0GhUsbFV+fDQXnTDzaMLVAh0t?=
 =?iso-8859-2?Q?7xpYYCuw6CyW/BiQBZs0R4NKeVhtGrWF5GSOYaSOvHZIJt7gmuUK1WuMX7?=
 =?iso-8859-2?Q?Q4JmKqKvcYyVNfAm0EA1kCRe8yaZM9ElUvQeyRjyTZBk5BFpg3fQEVeXwx?=
 =?iso-8859-2?Q?PyhYhZxYso+wpdRgBh+kTTzrhLrTJjHMUCK7FFI3zIx7R327adioGlZ7Ft?=
 =?iso-8859-2?Q?iF7hYCERUL+WKFSidj4upMOugLrEG3/f3fPVjrhQ/qXtUM15jmg2ndbTOp?=
 =?iso-8859-2?Q?nj2qddJ0Um903wn5HpX4SE2YZ6iodH9OAh+7s2mnHKGCHvlY6Kf8GHALnM?=
 =?iso-8859-2?Q?60NwZyjJ0ezUrJinOfrp7BopoSys8MCnsuFzWKTzn33OWIBf/TeRbl3xwM?=
 =?iso-8859-2?Q?rXD3Baukn3IrFVnHUgepvrcgaRPlPuSa9JB2fWegf/Q02bd27CAtGFisDO?=
 =?iso-8859-2?Q?sqgKXOYiW2jCg+rWxAk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e10ac641-9345-49e3-d73b-08db5cbdecf1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:18:19.7988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nYwF4j/Wdvp1Shx8TxsdvmfkzMCDvj4NmUHjfBSNMtxy+Te+iGA2/jze5liZ9aXKw5BC1GfNC6vIHBpAbcoZ6G2rS0+SGxI/mGWACL9QHCGk5OS7dY3egICi6qFD3avp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: IUHIPQ556W73FMHTRPW2JF3UKKQGDPYN
X-Message-ID-Hash: IUHIPQ556W73FMHTRPW2JF3UKKQGDPYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUHIPQ556W73FMHTRPW2JF3UKKQGDPYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture, and then, we can use playback/capture_only flag (X)(Y).

(A)     static int soc_get_playback_capture(...)
	{
		...
(X)		if (dai_link->playback_only) {
(*)			*playback =3D 1;
			*capture =3D 0;
		}

(Y)		if (dai_link->capture_only) {
			*playback =3D 0;
(*)			*capture =3D 1;
		}
		...
	}

But this flag should not have effect to opposite side stream (*).
This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b3d569e7ba61..159670612de3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2807,15 +2807,11 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 		}
 	}
=20
-	if (dai_link->playback_only) {
-		has_playback =3D 1;
+	if (dai_link->playback_only)
 		has_capture =3D 0;
-	}
=20
-	if (dai_link->capture_only) {
+	if (dai_link->capture_only)
 		has_playback =3D 0;
-		has_capture =3D 1;
-	}
=20
 	if (!has_playback && !has_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
--=20
2.25.1

