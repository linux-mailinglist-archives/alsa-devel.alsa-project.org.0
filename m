Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2865B714177
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8A12851;
	Mon, 29 May 2023 03:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8A12851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322324;
	bh=eXkDvqezi7ERAGj77f83+BFDRaBmKx1vpn1imIQSQqc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HlIPcWRcARc/04OdRA4JkC0ePOP51S4MjrlIezO9r0Bp/09fjOjN4YLb4wAefYOcW
	 09TcbtgF7QsGg5WBil2aZIMdRI5Kkoh3X72iRLjwXPk8pCkDMShBK8eNbm5G7a291N
	 tZ3ICrmAvR19nzzBlRVhVp8mfVnKrsEoxwstUjuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04AB4F805C2; Mon, 29 May 2023 03:03:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7671BF805BA;
	Mon, 29 May 2023 03:03:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DACEF805AF; Mon, 29 May 2023 03:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A85FF805AC
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A85FF805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P/KZqW+N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZVYB+LD8FogeG051oPyGJoTwRoiQwED2YDOIiAiAVgIKolZK3FpYN4SQsvVGTqEa0/k0uQCHi1m8D29bbuvOkj66DkqFi8/WSGLfOKR/Mb/XYdp9cJFvYc2P8LQ7eP7hzA/hC9TDKbBMYaxDcz1H7rYlwNk1IML8C7X2BPcdEE4LB83wWX/qth/8pnFCK019t3c22Z8P81+1FVm5arjSMgWZr3Zmb3XNrTzB9PSPlxW6+bvM/mAiGa8CvzhIQI6EhDnuZJ1Wwc9RwPDaLbonOrfwmm2wtc8BvnQiri3/QogDq/eayDa3Lksvu6OikC6wC1sE2YjulSXDZVvoMT5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URYLGPDTAxi+1oEIac+j4tw5WMwXWhid+7elBPBpCKA=;
 b=W/S6GX7RLBgT/Uea01q0xxXOb/IEGA3/1i6Yk5+1qP6s972aWoyMRkgEQJA6In90UwWv0/n6ONPxdR7zxTJ0hgBVlMPUpGC0y5nsZvCSOLGTK6j2uADPFWRuYjP36y7Xs7yzBFk9F8my5IG+N/Ul/zpX41nlkoj5eSlTGl3sZ+OLEThWDDVXT3olBxT5mr4FZ/4RuaRjc+zntqbHRdzO422WKGyzUWqu1abIJV29O4RKjfIPV+fS7k2kylM9uQLER3NqJR4V/D9BwvMgV1imTYuxoL2wrbgtPjFgjJ73o+hFDJ2sEBHefmmMmQMW0drm/TchJOp+KN7ONHV8HWAUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URYLGPDTAxi+1oEIac+j4tw5WMwXWhid+7elBPBpCKA=;
 b=P/KZqW+NoYzsbzGh+XeteRZkqhtRr2RIWRNRHc4y/6pKHSQhghLpsfO6W2g8erPgYBtgUb3FoA22wofDd1CyOZcpYBy2gaLX8HyYYlWqXTnSgsdw2ZoZGi/woVYLJHWrzDubx8qyLumrm5k6hFCUWmhYH0f3XohsINOqXLY3JPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8658.jpnprd01.prod.outlook.com (2603:1096:400:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:03:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:03:20 +0000
Message-ID: <87h6rwlzjc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/21] ASoC: soc-pcm.c: tidyup playback/capture_only at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:03:20 +0000
X-ClientProxiedBy: TY2PR0101CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b0aec7-13d7-4cb9-974f-08db5fe07e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rlHbQuhHKyda6O2YG5Cs+GKdmNRtSfKmJOroFjs76Ajm3JXCofqfKCtJ33BQPpZ2ArWnAzAiFF8Ls6MWSTjw+7BZLmmrj+SeBrIbKeHvdQX3eSgndOecLwloVfHKk+yNjCk68EuWXuhvYNU1DAKUNqD+lr7PEybYn1qIqJVHIc0VccBgixlGoIrhJsIl3meNnSmLqf2HMYm+bLFzfCQnnfxRINMYoQ89GzPtzM2YEcHAYutjc3gziQ6No9drJ89z1/aJdMqLd+1mYgwgoOcVSlgOjXzNDluCPzbkV36rwyjwa7pnynVwvsIR5hNF0BSELXIVm2DxNO33sQs4E2CA7NbZC11GCNHUHx6ZWxKyQ/NwQ+1EQRk+0gohEt1WhH/Rq77eB/GdEyf3WAr9p0qlyryuXCvNI52eG8ez+ueT18AdEovRFzA0IW65LjW8UIEoAUIAnzzLEzsNx98mXA4AztTLDhOxhPkp/tDCP33uSunNEVnF2FM2Nb7B8yFnsbasyjK6scFUNrcRNC75YmdMjb1AVEPAOTuP3l2jUbd/yiGPb3wkiYl+Ap3J/j8lqV67ltmOdqMX6aLvCQ03EjZObAgFr3e27AwsWPYX8tvZbxgTqTAEwF14pdJjvNQHaew9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(26005)(38350700002)(38100700002)(41300700001)(52116002)(6486002)(83380400001)(186003)(6512007)(6506007)(2616005)(478600001)(110136005)(66946007)(66556008)(66476007)(4326008)(316002)(2906002)(5660300002)(8676002)(8936002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?2mbrNZw/Te31FBZkisVmHnxPD3zIBKNGp+RNRx4CudipefSDYwfajl2Pag?=
 =?iso-8859-2?Q?QjhctGrkIDMKPOhHeU3cA11ntWhr4GcvE3Rk86Kz1J0kU7BR52cVlYJjsd?=
 =?iso-8859-2?Q?pG7GLjp73coQIRLnsq1O+s+1WCHliqtYylfrFjG9YlN5RhQlHvErD7Wq9V?=
 =?iso-8859-2?Q?SiXEXQZz1dwEhg72c3S3rAlnQvya838CzGA+AEKiasq+Xwjzz3/Vo44i4V?=
 =?iso-8859-2?Q?VkAV6ZAlCmXTL1JUa2ZQN8RVazCz1bgIRojnt46hcOtArHFWxTNL/e0djt?=
 =?iso-8859-2?Q?KWYw2A4EdcA8jTYzyYSJrj8pQOBSQGT5RX5XmdbmXFai2/qzk1J8XRfGbt?=
 =?iso-8859-2?Q?/Ynq2q+PQuuswmquqTDzxhGm8EtPNW/MlInR/AXCFOvsO/drbuMy1R0T5G?=
 =?iso-8859-2?Q?J6ekPRsOPblLVqjhbNB4m/eZ54o2Rn1+w/32mEMFZ3hN3Pbbbcerd4PRzH?=
 =?iso-8859-2?Q?gVvoI351th8wW+YCucOBTnJqsf7LmyXiAar0czDVECpWjsFg4iITCyUxJB?=
 =?iso-8859-2?Q?zqx401HlATFwjjd3pQK4eePo6wuK4owtsiTOXz0IYJHYFtnpZCUgQfRzKr?=
 =?iso-8859-2?Q?LPmEq4XlhFlVGuW1VT/+lra+rPdZUJipIur1c43dISo0hVYqOoXJU6TKCW?=
 =?iso-8859-2?Q?YEP86aizE4/gY8929c5vtFrqA9HEEaRphRQpDPgyTSZQdxHV5HHJOsvuQU?=
 =?iso-8859-2?Q?diHw/1sIdzwdeivo6F75NAVZmdkWEeh5eohgNEYy2kId8Z02FHQHkpDJ/U?=
 =?iso-8859-2?Q?uEc+IUtFR1Yh0Gqw8ry3FmTPfXPstO7NvtQ6MksQCgQ04H13SnRoJhhHg2?=
 =?iso-8859-2?Q?d5v6BD+OcBTfZLpbsjla4kMeoBSHuSrSlzTV2TTp6BL3B7ZUKOatAg9z4O?=
 =?iso-8859-2?Q?Oz48rlniGHiStqmN+hins5dBTr8pk5VIMeEEWKNaJbPdpjTLuwLCnQZJiF?=
 =?iso-8859-2?Q?T7hEnl1shPrQVktMt/t2qGAxJOrElX0wfQzqbYhUCvKqL/rmjnDohSpaft?=
 =?iso-8859-2?Q?6G4Ea//SsQ+j4k0OskDtEj19D1LKfkfQ8jsIVAQa9RXBp/EbizFPUk/ChO?=
 =?iso-8859-2?Q?oqR4V6QsGnTdcbLPwHg+p9MPO5lhBk/Egb4bl0WniJgZMXaazKvAd6YB4J?=
 =?iso-8859-2?Q?aOx0z8l1atBkiF40SjeykoPqGz/wbDB2sfp3cQev/JUYKDV2EvpDkJ3goJ?=
 =?iso-8859-2?Q?+jxtDdFf+dHdJHBDzgxYR+X4+m8Qku8bIF+H7+kDWD+jGI6oYOpmCcyb0m?=
 =?iso-8859-2?Q?FS2Jxrv0Dh+JfPX3r9HjMXlX7SRG8Oh78/0KKHHkhl3Z2QtuFmnN02mKjR?=
 =?iso-8859-2?Q?0V71Q2Mp9v/HTzHFA33w7ec0A5bCwnDWmvXDW5TGGwQh8XPxWFQxMS6Zzr?=
 =?iso-8859-2?Q?1by531tE94rvuZaRA8x9UQjNcizRa2SyOTESNlo2DQ0DwNEVFcqBUTzYcC?=
 =?iso-8859-2?Q?XnXuXgxcKwn36o/EhfSTbcPnKKE0sJLp7zW4VRu1esNd31ANsYRmBuntdB?=
 =?iso-8859-2?Q?+fWxl387tX2jpik/NQWX0n5ryrBcRunAP+RJYSXPGRahdNugho9nl6THCG?=
 =?iso-8859-2?Q?jXtxAQUBwrrn0WU5e8xwCFRNvXFGl9iOwCnlFVC9rdYuAbBzgD+pUIMFA+?=
 =?iso-8859-2?Q?D8VVqvLSsygbj78dRr3LDwH2jFWYWrllt3tv1hzwZe5PfTWTW2KiW0zEJl?=
 =?iso-8859-2?Q?Vh5aocsYJ1vScrX7E2k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5b0aec7-13d7-4cb9-974f-08db5fe07e8e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:03:20.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ryCOhfug59GI5B3rwKssUCvPNn1aQBj9KdO0Lmc7J3jofE6Er3bip8l9cYxf2pZeOpyrdyJaLDuYTxdV6Tgj2UETebPdBvFYumw/Btuik8mh1uCsjbvTZAHMEpeJESwq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8658
Message-ID-Hash: ZQYJBJANFHDNRRMH3BTCMYRT2N7NEVQ4
X-Message-ID-Hash: ZQYJBJANFHDNRRMH3BTCMYRT2N7NEVQ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQYJBJANFHDNRRMH3BTCMYRT2N7NEVQ4/>
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

