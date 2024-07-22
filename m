Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A419386C8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 02:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E33852;
	Mon, 22 Jul 2024 02:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E33852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721606788;
	bh=sKYa51m03YXCx52foGteVG19zQWFyw3uUMqM11xDHw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pgLVvPYrNarTYDy4S7hXoCo0jrfiMmN8uzXm0BdM5Ck5Hlc18xdDrlFkVX6zxY5Id
	 si5Kdng4rStAp2G1uMxovNk5HnP0/uEBh+o4CTHygOaLUmHjbZa2KJttgFIAV4mKCE
	 eJWA88disJMPQFlrZslIjBNMwt3ShdGeHfvjZer8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 356A2F805C1; Mon, 22 Jul 2024 02:05:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76AA9F805D7;
	Mon, 22 Jul 2024 02:05:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D57F8026D; Mon, 22 Jul 2024 02:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A29FF800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 02:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A29FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jZRyoY4o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCR4dbpI6sbP/OLwTs6HS3iw5ti2ETmYNEdGq+tnfnZlp/k4h2k4WGLP6RjMnVHJS4I6YM/h9tUXGt7l2K5R27plMiRWjyrc0QW6fBiar8kUu7AMhVfiWx2j3hxMUi5WCCQwgG7AFltPvYftK//jNxbafEYvzps/zk+USJpA5D2+a+uUmc6hv90mlTwyEJJKp5UxOR+eSMmSVQKhDpwoPP0XfvyAKLvdoLj5iy3EVgxgCEmwajLxDzw5vttpiQT4airTXmoO6LPBech8C6f7GV3qCC3QKf7xKhTnptGqSmH88NIzG29bCHeEHs+lcxZdOlO4lDduXBqi3d9Nn/kngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+abGf22xq41RtwbtcRU7P7O5WvuJEGK9k0pswqKfdc=;
 b=MwJ4w4YEwZ7G4rpmSv7Y7taYeAwWRoUu0pt0YTufynL85jyYZ/H+2mrqcCEwZkfP9Ex4jXm2geKLXK0AcjukpI00p5wmUOi8LBiqFTg0BMCfP8AkFKwSCB62XHJHNue9wKTohSv/244nPREaoSb2eAApWNV9it82iELRjoAkENwvXovRTpcPimXItdLXUUpVKvYtk9GTipp57jFRoRoDwV64KZ71k6SZqhO8khHaYUcu/V7IitRbQd3CYX2/05ktVnYz3+HlCQQiGc6qyaFnFcK13HCJtvOOX7ZfKEeK96/vlacpQ9E7nd+Nlno6t30iPj9phnhf3biCqcLjty+y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+abGf22xq41RtwbtcRU7P7O5WvuJEGK9k0pswqKfdc=;
 b=jZRyoY4otCJkNtzG20OHwKlTaUbtDjjEUdIZP8qatrNC8b3zhfDb7EVzSmHOyOX0pxhH34kq91BBShi2Lr5JKN+UPBflE44tvBtpc0uoVCbozIL6oxD2lo32eQIYwF2T703JXNaBiaVhfjk9myRXdZm7ifK88odgrD/Tu3PafgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10230.jpnprd01.prod.outlook.com
 (2603:1096:400:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 00:02:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 00:02:38 +0000
Message-ID: <878qxub8f6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 00/xx] ALSA: ALSA: add snd_stream_is_playback/capture()
In-Reply-To: <87r0bpu8jz.wl-tiwai@suse.de>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
	<87r0bpu8jz.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Jul 2024 00:02:38 +0000
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc6f188-5bce-4894-2344-08dca9e19914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fEjuwV6plqG1vHl8s1z9F1koXMeJcwc45bf03q2JDsNp5ZPfB6r1h6QHwM15?=
 =?us-ascii?Q?+nwZyfdxegEMKf68/tTvKRrlMjWvpUcdAvrCmBiBF6aFkbi4kAjzLJ9cCT3r?=
 =?us-ascii?Q?TwDcTImWNKK6e2GqWBU7m1S7L8Gx1X5VSULF7jPWoaL5GbKAold+jZNS4Otm?=
 =?us-ascii?Q?grQfJnK1CPlqPso0MTQTWt69X7IiHndjqnSWuKmwARXmzrGCYk/5fBvH1kut?=
 =?us-ascii?Q?+uV4oe0GOKq7/zUsuKX3UpXC7rxM8V3ivW+AeJSkfFJnMHSIif0kvUj3w/Nx?=
 =?us-ascii?Q?3IyL6iZiEinHYSa4X+NE27Utr1c4MtvZqrAQnZ84/1+Z/KveCSWvC7l9i9eU?=
 =?us-ascii?Q?1eaHlzJBHyGHrBrKOulbr9KP73aOs1nzN8EbxzcTg9XeGr5PE0ZUJCZsC9H8?=
 =?us-ascii?Q?Xq4IFyqk3ydau42ierjyaaazgAunSMhdhpc1SB13rZBY6BytI2h/378u6wyN?=
 =?us-ascii?Q?hCe+8EXnzArWtNeVDkc74bl57qbTS3dPQlrPp6ERrnMla0jjFtzcBFQkH7cl?=
 =?us-ascii?Q?7Fc/vKjPg4M17Em52de/Gs9hM6sLmaaUNUGjqURSGEelJ9K4KYpqgWKA903q?=
 =?us-ascii?Q?BiKoM+/hGlxTPDKriQ2bf4ipXA2JbNORMWNQfJSF2PsLkHcfDJTwfAB3Y4Ki?=
 =?us-ascii?Q?9evyZyfj1SoFsMepn5MvEcyPZK6O2Of24pm0iVuGteUqVFhPQMbONBlYytKs?=
 =?us-ascii?Q?13PydupSV2N6cTGrIO8ofHumLNVDm6IE93xqUFdVoGtmTAFD2nY51NvWijQY?=
 =?us-ascii?Q?6h4XmS3zx7KCZ2bvWKSi6s86ozdEq9yafVBYJbi/JYcMnogmqq+bqpNjNg73?=
 =?us-ascii?Q?pCFROYvxVw1qK3JU3sF0+5tTRQJPk29Xh7XuvYYN18Pjr8KdpIuWbY6Lmj5x?=
 =?us-ascii?Q?ldcVTxQdB1uVsUOhD0+Cih1HmfLG898Zi5RKZz4g02O3QsRGkw0lc/LeBR60?=
 =?us-ascii?Q?S5PVTMp7A2glt87ngqmc8jEL5C0sfSlmoj0Zt89ds4mFiF8AqoxxRHiiqeG7?=
 =?us-ascii?Q?hycSpPmekSf8WAk5xV5Yd5WmtgmqOkedgNQUm4m4o00OYz970QhEmwYWC8ru?=
 =?us-ascii?Q?+HaV9xRIOY1qaIszcg04a1Ffc9GnTGeZoM8iqp6UBa6V2FJq4e65z5buZLhq?=
 =?us-ascii?Q?r+Y0R8cSVLSaDyaJwbOCaXR8mXnKNfwQCkr8Tt/eXQKrgxSa/F2xRlwwjy8M?=
 =?us-ascii?Q?YES/zFKYB0gi9utNd4iLPcQqSVjON9wSRuAE59o61MOT070fq/Grf8fyDcJh?=
 =?us-ascii?Q?oEC3KKotx4liXMNLdGwTbt22/vviyAOnsrSc+ck6VvdtTxgXJIN1UsMnsDYM?=
 =?us-ascii?Q?Eq1CBjQaQs2P9H2Vha08H1NzQQryOia4+kLn29zc/BpkvN+VLCC2rovpnI51?=
 =?us-ascii?Q?ud3ErnN94q62tOQ8YMCQ7f1aB18DsRUlv9LAGvDntHMyE54g0w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p1yf3yIJbfBMKuAadHOE4i0j8s/cZJQNQJZdsS5jpiKnAQtS767a02kv2I+z?=
 =?us-ascii?Q?5m/DR8j4dAqZCUBuXLUxsRg4NZQU0XIn4FwOQc7fYKCaAA5m85v0xLyCi8n8?=
 =?us-ascii?Q?LlBi4OcNxWcV5eaYccmUlCMPxNzAcg5NW1s+uT5q5lydCyJxq7CNDK+Fwd98?=
 =?us-ascii?Q?TyMOXsdIRA717p8Q/Qxw8eGVnIMUgFGvecPiLLaCKDSJArtpR5G4sXez6OzX?=
 =?us-ascii?Q?UoQUOLOPY3oPT6yI4yQtzL1EeEuDp+3PhRkDYMVFy16F7/g0BCuUn7a8NdYh?=
 =?us-ascii?Q?08GGsudikSilh0ySy83KYg3D/kqZO5JESnSQ3O0Aiu3iUFyxjBkVDzHt4aWq?=
 =?us-ascii?Q?4hiiPgu8KL0gann5QQbFu/dEqgrcs61Ld4RuedV115crRqnecZgHQ88wcUtn?=
 =?us-ascii?Q?PFD0Ea1ZWPLk6bnjDRaJDoV+linFkQ2EbmGzkEvxfDgHvAykciLepekOAwnG?=
 =?us-ascii?Q?i10xZM37TYeIpEYk4WZKavg0CH1DZuUwEAZag9QiaFju9+d+b5B2e8TwOMCg?=
 =?us-ascii?Q?r1/lvcSuZsTfAXo32PMNONZ1WPFZKJXfEwUWBknzeZbcEi3muu84Mi7K/oqp?=
 =?us-ascii?Q?v3kl3CJbWBwxulInMRkcjqVGtF5VJETQvatx6rPOPFcEkACKKRFjYHQhfFpL?=
 =?us-ascii?Q?y+lYjK0fUGDVA3MVmu6/dp5jcSJIy6lYBth66v79WixPRq8mEjQ6XGnalwx8?=
 =?us-ascii?Q?th6KPHE08qsJnpicSA15Sb5z5s8kv71B62wvLHYZFbfBule1otEfeYEQSryQ?=
 =?us-ascii?Q?uEF18STn+nXjLL1tEcCjjr2QZMRlkda64jmRXOkBCtx0HIYU+DyuMntLnnrR?=
 =?us-ascii?Q?Nirg9ctn3EzxSCxVbKC0Kilrc/yckHqho4cieaTh4wROCA0LMg2zcQsCLlOK?=
 =?us-ascii?Q?bN5Yfc0+D5jHiACYM96j5K5emlpDhN9nBI95KHxpU9m+8BNvR2D3fMEDmo1M?=
 =?us-ascii?Q?SrZ1CHmXLvrDhSalMPnsaSPNAbH+4bVbwtT4NJX9Gv55yIMGCBCIdDmTJXnR?=
 =?us-ascii?Q?rLREsJTa56JOGZ8377tTVyAVy/kgOHE3XgQgmFmb65UM1iyFaIMBE85ecQpX?=
 =?us-ascii?Q?umG89m0E8RsDH+temMCJ0jI96dbomLJpmV9IceK6LExac6ZosTYOmsYMYWAR?=
 =?us-ascii?Q?0xSRn/1FqhrNyOoVHZxALu5n8qz+dGKog9TqRvGpz6mK0XUYE24h1tEIsX6P?=
 =?us-ascii?Q?ADGMIX4SZndORRiXD+ba3DWptHg2VY7w9FiXO2dU1zBdmUHDP9kZAj1Tay3x?=
 =?us-ascii?Q?fvecYteiwoG3Ds4yhfml88yL5gZbfqV3Y0qOqErRYB6gbqHWUE/5PXyiL7So?=
 =?us-ascii?Q?fBaSpo01kZVVzuDoF6qWpt2lYz5Uugj+5P7FM9P5cWmje6X6I5DVUez/KQcf?=
 =?us-ascii?Q?aT77cjrmQTmQ/FvNRiRBS1A5mzWzxasZySXYFZkV26G7EJ7i9xQn+fAnP3/E?=
 =?us-ascii?Q?P1cy5XIevU7oW2ejRGno05a/7aiH/IZrRvF01WwBVy0MCEzz7HeXKJPCoGzu?=
 =?us-ascii?Q?dkF+6U7oFvX8+juIGJ6mA2x/x7fXTdq3MCfUgorO1OuE3L//b1LOM7FKy6SF?=
 =?us-ascii?Q?Jab60jFFJTFECUPv0cC/WXSitG78BX7ksA8xP2ROGdSvOj6gdrbR1p5LZvaG?=
 =?us-ascii?Q?fRLHy1CUeWH/rO8Dr34WJ6s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9fc6f188-5bce-4894-2344-08dca9e19914
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 00:02:38.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m11cSaOLm9fbjs3KszMQuT78UIoKo1PRFrebxaj/U//6PEZWZrQL8WL3Qc9xYxegwir/q1GaTtxXxTd2AcNGQct6Je4puT/HZDB3ukEBtZNOpEXiITcGCENq0ccB6O5Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10230
Message-ID-Hash: QVXSRPA22RFYAE6THT46SP7TXA3VOHHD
X-Message-ID-Hash: QVXSRPA22RFYAE6THT46SP7TXA3VOHHD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVXSRPA22RFYAE6THT46SP7TXA3VOHHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Takashi

Thank you for your reply

> Is the conversion just for readability / consistency reason?
> Or would it bring other benefit like code safety?
> Honestly speaking, I see no big advantage of conversion, if it's only
> about the readability.

Yes, it is just for readability, and I can agree that it is not so big
benefit. It is the reason why asked it before posting the patch-bomb.

> A generic macro like Amadeusz suggested would be an interesting idea,
> and that can be seen as a cleanup.  But the straightforward conversion
> for the mass, I don't know whether it's worth...

It can be adjusted to generic macro. I will post [RFC v2] patch.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
