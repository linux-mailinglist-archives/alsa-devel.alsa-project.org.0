Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C82710523
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C0C0DF6;
	Thu, 25 May 2023 07:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C0C0DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684991038;
	bh=6xB7EQYzattNpDgPEkkaA5Rf27rpG9qFS5ykOi1y318=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tj0c2IHTdzNReLHRIEBWyCkD1SC5kfn2tmDFCrHOy8qfb3WxfNPEkqqCBUit8NxH4
	 Bl3G9inQl0OGBCJ11r6W6dmUh8SxOdI2392ZUSkEjKLbPjtbffasK0wddpn0GF9QWQ
	 02/7jVXUW5hTiaBbqZvpPJhQKhTdd92nRHRLERzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A50DAF806D7; Thu, 25 May 2023 03:22:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CADFAF806D0;
	Thu, 25 May 2023 03:22:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FFE6F806D4; Thu, 25 May 2023 03:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24D77F806CE
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24D77F806CE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HOBBI0FV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSxTeE2DszA9R2AwoQXiQtZ+OsB+meO3jiEVOVCGUlhAgqIPn7NJq4pjupmxkESCvw5L/R20XeiOI0h79PG8NGlWE+lvfXttygxUV0ldBb2oUTIB1utSJ1l9TqHrpvjuAc/MnIqyAx1qelB+ceraJ9mypS8jgDmiNPhf+3rfJ1/v/LFOZ1CrVf/B+3v1Q7sSZPBk7Xj2+VJUgBErwfK33breun3/967TE23pWHAxX/6Ivaao8ZBNi5EcPQdrAI8qDNlTyzuyd3VaTpO+eAUjX04uEDDf0PwvPnNRQ3netMAwLcyhddF/y/jXHg6F9cR6Z2tnXBWMAva06WmKeHV4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEa9MSp/pEhMaa4tNifWlD+mJo+k1OHTpkFn9Br8cNM=;
 b=a/VULgEK/v9RK4Z0JyFqWKdz7EKQKvaa2CCqQYjE8z+AYtCvo1lv7mrQMTl+ekBOiOOPSuK2UwyFe8zMvPGnytabhf0S0lRLmZbcP6+v0zwotx0p7twij8RPLKJTLSIgY43OJidCRiPUngk8wWJlVwiO4wwQGGoI6O57qKD3x215FFj2y+iN3D9pbKNYl0aq/CvB3xDQ6T4tF15WN8gwb2EeoLGVeCPxh+KWXtS8KuuPiTP9UjtNrM1FsZbTp8iA4+Ai0UDemX2gANwfrPLj6bJMGFG4kspTP/G+jLlwOjUAlBPexGf1msFj/lZsY//hNIdMXCHKBGq2Thv+2cRHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEa9MSp/pEhMaa4tNifWlD+mJo+k1OHTpkFn9Br8cNM=;
 b=HOBBI0FVXk/LkJIUIdx4J8NFHkV6t4zd3ieEdyVFnlWARo6SSxNT3mVhEifNtEvFi3xJSDhHob1mpwh6T15PspEcd9x3rncrTH/wtzVe8gGfgPb2Cj0r4gpalKBreCh+gFQHm1xwvXG1/1Po7MxF7AQIOz2/+JS1uMigh6EpyT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB9477.jpnprd01.prod.outlook.com (2603:1096:400:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 01:21:56 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:21:56 +0000
Message-ID: <871qj5gq8c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 20/21] ASoC: soc-compress.c: replace dpcm_playback/capture
 to playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:21:55 +0000
X-ClientProxiedBy: TYWP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::10) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bdce48-0bfa-47a1-7498-08db5cbe6dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vL5Fm9CzMITDKTqV/wHdbq0ZTrjqw/PHb8MTJABpUGB3MfYGktd9R9g46pAumcfdgxnIUt6YrCQXTM7ijkF/h/hpEoDgCqh1yUp84/uNSZriWOD8SIwyTyu7VANJscpD93xd0nvrE4xOAozSS8vUs6OAMihN/j80UU42tIIFc1+46+Zw1iuLQkb5eRJBa9+xGTe3rxG1twIzwHs3Vb9nRtSihKxKYvBOhVbmJ1+m4XC/Z9Q669WfpZhbtGNIisgppA4u8tECDzIvmxum5GyvFI5vSDSfLVPg0XYPtfY30XIeqXny9vRs4DscNPjjEIqjOa/laKCO4QYqiMJGXT5v8tS+rmf2UdQYPAyrYRQFicdxaaX8lEqyizoYQySwX4dh6c/JMr3HZSpGsQG3ikhyPrAFgmlJORSusyIzLaBcrOzvglqeuO7M0bEPDvSPeNk6PWVLj1Re6YXxZQfOMal3B0LVE7YhtweYsqcmvX7cbGzViHzn/GqsSiCrjJwyjKnLLsHNR42MmdMZAuJp562bUxDF6IrIu/6tbkD8VLNuUD66p2Lw0R3kscFYUWAlom3hJ3nDUWKWU0lG4VCTxA0XtAToKzLgtj21x2uWu/TRoI+NNIH3cF5F5ISkYyEQpvil
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(38100700002)(38350700002)(6486002)(2906002)(66946007)(66476007)(4326008)(8936002)(8676002)(41300700001)(66556008)(316002)(36756003)(5660300002)(478600001)(2616005)(52116002)(110136005)(186003)(6512007)(83380400001)(86362001)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?uP5oI4IpvRzD5UAm1P4HqOGWsCIWq0TWj5xrAKX4MJko+erAVC1Gyj5tIY?=
 =?iso-8859-2?Q?Rlp05euLG9mgMyMf3hBJN6KcC2XBrhPdBCWvzPYWfJOU09j/qL6jHLqIRe?=
 =?iso-8859-2?Q?p2pl4NuwBHJj7/xt1clD06CWtv8Doctruva+TXt3BgwVbPbWPezOf9/6Qm?=
 =?iso-8859-2?Q?qZmQ/AYoS3GcN9l6otLcaaEj8faBPrCJB3qSLBvb6lvreStlLS9i+AE6Iz?=
 =?iso-8859-2?Q?4a8ZxIpESdzD4Zn26ADjlBm8L4swjsqIxCwTN7ZE3vZh1w6LiTtAIAzRII?=
 =?iso-8859-2?Q?4RSVYxEeSM3y5e8rgXkoVzy0LgWZR5jo5Fdi7dHCCcGiieQUxhiSb+slrD?=
 =?iso-8859-2?Q?O23AHb15cLq9UvrwyEHPWiVyOb1gzP67s4EDcYOfv9Yy9B6hO12HL0NBgY?=
 =?iso-8859-2?Q?tO7w+xGECdJ9GsCGglromKqc+AgFUYbNVanDF4h9gMxmp8Op1pc56n4zNs?=
 =?iso-8859-2?Q?JZfu1Sri8E/3g9hl7ZWl9sZBMRFmmBzcm4UdlzUi5C5RX3c35YmNGRzuRU?=
 =?iso-8859-2?Q?tM2usY2BBVw6K0mFviLRQw2UtXEccszbY6a3PYVqBdpqWEAL8DxcRne2rp?=
 =?iso-8859-2?Q?QydQV9XTzkkJ+27eHm4GiFyaDqs8r44pGOtXEk4NNWFTfoBNNHzfTI69yG?=
 =?iso-8859-2?Q?jNe9bo/bonuTFTc89fTjaR81J376tHaskmR2o5pZK6RIo2ZsFfRCMWrVWW?=
 =?iso-8859-2?Q?BlLKKuciMbKbqUsBKP2d623wvWQZS0cSdtYQKwiwLYFdjaQNhAXTxegqeB?=
 =?iso-8859-2?Q?MTYVOH7JWQmseS88K0pbou1ZKv+vL4Rf5AwXZ0P/Lv3H1cQnpI9BplT7aN?=
 =?iso-8859-2?Q?F8MeNY+wxDOc397tpbjgMUiMGSsq0vruKz+l4pZxnILXXvYel9pnpFl0Ml?=
 =?iso-8859-2?Q?Ogerb/sgN4dKZpk0IjVpOxacpHDRPRsd7oLOIbX68z3gJ0VbiTBE5rxUcL?=
 =?iso-8859-2?Q?pm1LrOmCxP+7lrA/aXJjQm5SyY9KdV42W1EhsjXhYFVxIo2lJtZjuGD1pw?=
 =?iso-8859-2?Q?uJ+ZblS3fQrj8k8qMEBSnFukdbip+4KoSVv3fRlnZW6BYCQ8diICr6i2Dd?=
 =?iso-8859-2?Q?F2E2Xrrc+uz0SwsQlL92AYhLPbgHDWI6iVfT7/8tJsB1tMyiq1xr5yNJtV?=
 =?iso-8859-2?Q?fiKsW3k/HHpQ92JnQEnySb1xxRH5ewZf0fADfCcwnUoNfE3PgcxBkqj+eN?=
 =?iso-8859-2?Q?rT+8p36glwUhPBBUhMG1q6xKT1fyN/s/lYYjABUjDOsVNJoQlv2WJRjGjn?=
 =?iso-8859-2?Q?87VqxL0WVnoQ6kinnUIiWw+8GU9N4yalQugdA3EX8CP74e7vGdAKLeqmYK?=
 =?iso-8859-2?Q?JpQ88nOZ2NGiifdmTpkipX2F1IQglTN3s7+AeEh6iT2emnAjwNzA6fRfBd?=
 =?iso-8859-2?Q?bU0wArC6fZdE5iqdpd2kJZb9nsxGq+ybL6Pf7sAf5uP/dqMtkNZx/e4/lj?=
 =?iso-8859-2?Q?AVldgge0Hk5OL/oU/AstZ24GZxJB5HkblvQUw5ouulI4JNrs5jGobkBULX?=
 =?iso-8859-2?Q?ctxZQbdqN3F01fjawBXnNkkjhhghOfkZ1mtZnTi3WhxYtzVV7h/fTYhN0l?=
 =?iso-8859-2?Q?GG9S/6zvfbOSrczllooBb9nAP+5e5dJsbE0Y7k11q4jtbqvrWexr3PVGBh?=
 =?iso-8859-2?Q?m74lvhWXGui2AxLjWwJIU0CEU47Ak7ICUmxAaRI48mMdBqKqN3611+uqw0?=
 =?iso-8859-2?Q?HbbL4xWakLTsx3rDDSs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8bdce48-0bfa-47a1-7498-08db5cbe6dd3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:21:56.3017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XQJRV0BJIuHZ6Cf/79hHbIKDveKk7Sy9FHJPPnxm+rPXApAoPny0S/oxdh/diE52Yqr8cQN8whXf/2WolBhop/jE+1jW/4nb7CSM6GpZdi6iFGTz2BZoAMM4CyxrdxVu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9477
Message-ID-Hash: B6TRXKDD2WYK4M7HH4JANM3PNZTGCCTA
X-Message-ID-Hash: B6TRXKDD2WYK4M7HH4JANM3PNZTGCCTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6TRXKDD2WYK4M7HH4JANM3PNZTGCCTA/>
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
 sound/soc/soc-compress.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index d8715db5e415..cf3cab7a648f 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -602,12 +602,15 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *=
rtd, int num)
 		return -ENOMEM;
=20
 	if (rtd->dai_link->dynamic) {
+		int playback =3D !rtd->dai_link->capture_only;
+		int capture  =3D !rtd->dai_link->playback_only;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
=20
+
 		ret =3D snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -620,9 +623,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rt=
d, int num)
=20
 		rtd->pcm =3D be_pcm;
 		rtd->fe_compr =3D 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data =3D =
rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data =3D r=
td;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
--=20
2.25.1

