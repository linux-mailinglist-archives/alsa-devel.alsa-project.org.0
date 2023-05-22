Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3B70B423
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 06:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354A81F1;
	Mon, 22 May 2023 06:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354A81F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684730230;
	bh=hbdhqePoW9/NedCa25M7QcTKLJoJbJpUidXj7mzTXeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j26iwPGOnVWrXuGfXQqyDARGrB1d4/BSx0ktbDVaYdNHjZzfP38Z8YW5eidDWAtUa
	 kpOQ05utbVEGaC4zwEGFiKLZij8iJzxl44qUiAptXVMspzBL74P5rqGfvQc+1rGCPi
	 T6lpCyOK4g1T93ay7c9nbVpeLjIck99JBuTL4bKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAEE0F8053D; Mon, 22 May 2023 06:36:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1794F80249;
	Mon, 22 May 2023 06:36:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54CC5F8024E; Mon, 22 May 2023 06:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74F1BF80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 06:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F1BF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bHdA0J3i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2d7T4Zeqz0X+cKDqv2z/sccdeH/3JOxZd5ADha4TUbXIsSAMjaeZUFt0vT8JZRk3qd5N6WCcovQeH8XxElwnpUWvDcv1AlYqKnQss386VoaLQBfBDq+T6CXSE8XLRcmV2UVjPzDdRXwqrmm4dgZzIK4JE2ltAmq70Zz8HrqHkQTi2TEfnY39razKWzRkkZZg+W6qwgIjbe9URU6/dXG95MIHY9z87Aa4yPRBFUStIodtSQcI+1sY9T1lCto1CKXj11WOj3WKG/qWBIlYJjQd3tVC3G3bY7o6N8TYQLj2REgtkDIxOK3gyDSOyLcQsbQghobJoSdzSK5wTc+6mbNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ9qkpciGd5T2gJaneu7mwTzY3R5m7QHEmyf8sA+1zM=;
 b=irs9ZLZML2sYpGOrhnyHnf3gcArrxJh/Ev7masJtDCmG8jndTFIPqIpERpSskm9YZwZDo0ZkblEWbW/WB+o0G3ly/EwsrumITf6hmKJUHb3oa5rFDUvsAlXDObL70Vi0To/RAyDoe27u5lH3RNQjFpspHh9sdP8oDoBjnCSLvxusuHHGd0uvOAI8L1egjrebI/WZ/cYhGHijSH5Gwfqr1hmstv6d3+nV5KG3pLoUNyGTtnpm469q/d9vPNOQDDhg7tzLMUMflasMl9Uh6qZDPteB7d33mO3bVuZ3nP4zqJnUUbz6Lc+m00oAMiTcYQhF6ePpyHXyf3Bb3QrfDrV3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ9qkpciGd5T2gJaneu7mwTzY3R5m7QHEmyf8sA+1zM=;
 b=bHdA0J3ijrGuTp3QQVGT1VSzin5Nxu1WqB1NytX0UzvUkUbLOCvDNGbfwUUUHuc5lMQP6ocQZu85/vTqShU2WcY4jSWL4nwzP1kLc2cc91yGZBjBCaDgiKFE4FChVH6fyi0nRnVmS6PLqzQvaUsQLtNHPgNySXmhD2DGx++ECgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11696.jpnprd01.prod.outlook.com (2603:1096:604:22d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 04:35:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.021; Mon, 22 May 2023
 04:35:45 +0000
Message-ID: <87lehh2db4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: <amadeuszx.slawinski@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
In-Reply-To: <2e84d6f3-902f-d6f3-0084-ddfbd61ffa1f@linux.intel.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
	<87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
	<2e84d6f3-902f-d6f3-0084-ddfbd61ffa1f@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 May 2023 04:35:44 +0000
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11696:EE_
X-MS-Office365-Filtering-Correlation-Id: edece964-1b9e-43b3-f481-08db5a7e019e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QZsv2Ze+dwKUfhqKSV2D6jZh9g70SctonSon2dziz/YgT4142ZKg0BCIpv5beVALi5eRCt7nuEt6wewUIYS7tn3D2oJe6kiB8INkzX7dfB5bcQf0X2xGygoInFkKIoEMWN0MBCptCDqHW+pU/VJiN5CXygdYeYteB79dHy3ohEwSO5u/R/pJ+JJiNfezR9aSy7dn3yWL7UkzelohwYgakgGzVchSQ24VTm07l3KiQvXp5DabPo9Xk/PxWJAw5jQL1gPj74SDUGx27ceVRZVsk/AqfDHOY7Lg90CVwLUxyaTWUvrfQXqCk5+5mwAJFevV+8GwvUFGjSwv5GEPXMdskRMYGxp5ZxUqdvtBJSjv4vPCo+fjjlyMv1EnpZkZm1y6E0r3mxrmfk5Pt+I1QNZC2joBN5it63uavEWXHl4WbGiDExCQFGf7Ll3Y3V7rwZPYb7TYMU8JAJHNtplvnqo8jmOSPi2EP5SBmfmOTtzXqn1CdSG6mgixD8IZ2c6Pt2ptdn417HysL4nvxcCiGCh0k0Ig72AVJikH4rE0ZDRG9hqqXbcrrnGHdysKp/oDHKN1K0z4JsuJYdu3fUIh7Xmqi9d7gjtW0PRq7+4U4PGjbfVAXxnixAyh6E2XG/gOWb3L
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(8936002)(8676002)(5660300002)(83380400001)(186003)(6512007)(6506007)(26005)(2616005)(86362001)(38100700002)(38350700002)(41300700001)(6486002)(52116002)(478600001)(6916009)(66476007)(66556008)(66946007)(4326008)(316002)(36756003)(54906003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RV2CZSQc9kIk4pG/oXAi7L/mGc4QS+wdN+wXQQPTEA4rlvYqDyqXYx/NwHkh?=
 =?us-ascii?Q?wrJ4Fpr2+lb/Qj9NsEXCFwXpJCEYT6serItpOIcCZvzSztfNcgk2y1TOp2Yb?=
 =?us-ascii?Q?/rXW/yC5P4DBaAMlzWRu42F42g22FYqZhGUL+x8sDicuoe/sQUUIfsDR6VKu?=
 =?us-ascii?Q?5ZK5skkj9/OPRTyJuspFwDremXu15UnlRu9UHNF7Gb9KG46a56JhaaGLkDE6?=
 =?us-ascii?Q?VNXilO8RSXuO6HmVD0BA0LPHccTBGWrZ2cQbUvsT5IKSvt0dWEWcZvL2XSJy?=
 =?us-ascii?Q?242jQV1kOpPHhVT055YP4wY6bpmhX528hRiiPJCI8S/W9YGNXn9TTTxHW6hg?=
 =?us-ascii?Q?OwH8G8UFY3ihVpuvrcJp9lGoOZykEQ6Asn6d60xGow9XkI/zODwLRdvUBqAa?=
 =?us-ascii?Q?Wazzfjiv2Uxw6AqBx04sc4DLxRqdTEDp2f1NFeNvMBlViEjksoGMfCSxtlI6?=
 =?us-ascii?Q?LWVkzYeFjxKdIBr3/R2USZV9wrxe6zmBIZmkRYISkLlvCdjbnoxA+WlD0Fa6?=
 =?us-ascii?Q?yOIRHmK5ypRJeNk9MsSvkzD1/m6/1a8il6LbDFtLBZOOwNit0joam8+KZdRw?=
 =?us-ascii?Q?1R/f3kyLf1iHxoV9S6b5hko/XuiCXVDImRoRHDDSL9JZq3MRyBkOt/g9++Ne?=
 =?us-ascii?Q?fKh8vanOk6JMIh7DENxTjQdWaaDULuwNakDxV+pUc35eTl9Xs07+ZTdY5gS1?=
 =?us-ascii?Q?aBaoL4ZkmOk44ielhoTGgkjyOPjXBKk+3NBatxZUVxcSa3HKs/zc6IEHwSzR?=
 =?us-ascii?Q?r0XSUwU6l6hOC4/67McupwUqKsEoXzOeOwzwp+dYWJ59a06NSEbRdWrYrNZq?=
 =?us-ascii?Q?zNaDPDzS9TtARhqf66ZPpEcicrTFJuxuM2qaSRa9J+6WGQPbNaHEn4TxsIue?=
 =?us-ascii?Q?ug+dqXGibUNqrAnwljAZNLT9RRHlNQq3Y+M8v6w4v4RVETIFWooJhcTY9mP8?=
 =?us-ascii?Q?l1fPoLNrvJjBBo0yhZVVPRS5VP7WkOfVMIfDWtlX3jjWrnJGbGgKiNW/ho6+?=
 =?us-ascii?Q?jr1XVgauEX5E5LpMXJpDlY+bAkxWBgBgiu9V4LtEsOKj/whUx1o80X2XP++0?=
 =?us-ascii?Q?3odUmzE8fdrC7/eOp50jTXfwE22kXfuopBSGxiz1H46xIB0WTVZP1mpG4vXR?=
 =?us-ascii?Q?3ZUWnUYpaHCZWRpqD7diEl/fUAp6qS4zs5By4NhqlK3nxZZRfaLtV6U4qclh?=
 =?us-ascii?Q?mcKTo0XdMItvuuKVuu415PtFVGPft/z2dc1RYVB6JdkqVAfwmet+9QDKue0t?=
 =?us-ascii?Q?aqmE0hYehVVBHHqiZBWiNziRCVBaUIzC90Mwahz34cipeLH2+xcvG/dwQQdl?=
 =?us-ascii?Q?lX2GUP+b2qxijEOkqif0IWvDfCOHqjAZGZo0MMkwfz9nMZO1FWntWyc13VKX?=
 =?us-ascii?Q?sLpS8uECof74yQmm/aySbbAJexj8E1vjYjc1+GZONG2vTgbWx9ow9dNc2CoD?=
 =?us-ascii?Q?hYLyN1qwMrI2NhiAR8A/iXFZpAu0tBFMuryA7jgJJz65YxOsFcvTneylsaOj?=
 =?us-ascii?Q?8aH8uCrWQnojNjx4mqEW4LYN0dFL3vskQZ835t7+sEjuZlQcLo0lU5by2aAt?=
 =?us-ascii?Q?hxuumhRg7Zk3HrdvXBnM1ieD9+t6DuqiXb8Cn0T0+4pNLstKrZMB56HfxSzA?=
 =?us-ascii?Q?9qjXtKEjHY8k0nUdM30Mdwc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 edece964-1b9e-43b3-f481-08db5a7e019e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 04:35:45.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KjlfW3qynX5C8zGrzoQ/ksjonqA+tjyyYjqbNufIoTYudmtEMYJWp2WMUikR2X1wBLPjgSwtJHUwPkovqhRs/CPltzxUAZgyGnw2/vwlcIPCSZmVUSMpqElng7Sc2XRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11696
Message-ID-Hash: 4CALSVNCKZNNKGMOIHIA5XIYHJ3VRX5Q
X-Message-ID-Hash: 4CALSVNCKZNNKGMOIHIA5XIYHJ3VRX5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CALSVNCKZNNKGMOIHIA5XIYHJ3VRX5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

Thank you for testing

> I put the patchset to test and it fails to enumerate devices on our 
> platforms.
> 
> Bisect leads me to this patch, here is dmesg fragment:
(snip)
> [   34.617601] avs_hdaudio avs_hdaudio.2: ASoC: Parent card not yet 
> available, widget card binding deferred
(snip)
> [   34.619973]  probing-LINK: substream (null) has no playback, no capture

Hmm..  I tested it on my many type of connections,
but couldn't reproduce the error...

It seems you got [01/20] patch error = no playback, no capture.
This means has_playback/capture both flags are 0.

It seems you are using soc-topology.
Is it topology specific something ?

But hmm.. ?

static int soc_get_playback_capture(...)
{
	...
(A)	if (dai_link->dynamic || dai_link->no_pcm) {
		...
		if (dai_link->dpcm_playback) {
			...
(B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
				...
			}
			...
		}
		if (dai_link->dpcm_capture) {
			...
(B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
				...
			}
		}
		...
	}
}

It checks CPU (B) when no_pcm (A) on original.
But I think "no_pcm - CPU" is dummy DAI -> above check is no meaning.
After the patch, it checks both CPU/Codec.

I wonder is your Codec which is connected to no_pcm DAI valid ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
