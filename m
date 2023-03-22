Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 221056C3EFC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 01:14:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45BE6207;
	Wed, 22 Mar 2023 01:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45BE6207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679444055;
	bh=ygpvyPM42hXCAu46ro0HP3fQi8NoXQbwnoQ2rTaqLko=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L6Dai1emy6ehTnsV9Io9qZMGDmD9vJGpQxty9zqbYKOLe2TuszJa6HL2VUvDSbBFM
	 Vdun9TQJ+pAyZdvGC2CwlgKm/SXK4Lw6oOAtMD/FG96uhYcIYffOPlz83GmwRfqHGB
	 ErBLLCqYU+qNAru1I9nYo11Nuurz8GOF3MPd29pQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 216ADF80093;
	Wed, 22 Mar 2023 01:13:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90BB4F8027B; Wed, 22 Mar 2023 01:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B545F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 01:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B545F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ei405Czc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFHd39CRDMFBgy375G69cVwTdJrmndZdJPKvbPYs4rHoiq9yCr9UqDDjnpG4TMQp5zFq56Iyz/elqg4Ve1lW3fjEdsRGoHy79lBjedyPJgX9kjy4JELkT+BBWpZLq1f1crO3d56TWHvIyQVdsnOTFV85bvk1AxMfo4trAa1gUyMkX67O4Voki0wd3B7qzPqbUslVIlAlGKPdVoa0pxY5RXXjMnkXck8/ddQqUBhVD3OUga9zXPize0KatsZGRK9+dd23u1YB0+NesMlpJgSQPuycDQY0xhzyoEzQWWxIZw6fCZbku9fAza9yUWKA9QQtbfriw5bEcTSVZ8Xs2nveqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QMpUl6+E21z7MukUUzkfoFDtnPs54FfooVG0VuSQvQ=;
 b=Qhzgmh8JWZtuQqwzVmBgLlggvx0x0DZouWQfOE0n6qXQMtrPiRnph1s2I7UWeTTtJzrhxMUk/XVXz79q0xb5Pxa9zC6tHGtr/HuYLDSVYv+q/GG9ZQ8B1sgufwClS7XVo/Lxjo+6K/QayUCNA11bu680dIYZ7QYm2k0c6o6GdXrz4x+muhUZuP4gNyvXFPkkgTLGJCnI4w2Hd/otkht7vEjRRsjL2SFB3ssJL8KqVUpeSOum7tZyJgmkFf8dUd2BqW3X4zUcdJrCJ3SoWPNl16fLtdZr7AmMakAHBgobmgZH97fJhKavgL4vjWLdeojhW1O+LQ2Oq4cHzXf9IThQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QMpUl6+E21z7MukUUzkfoFDtnPs54FfooVG0VuSQvQ=;
 b=ei405CzcaLh9a8QK0kLWfJZNzHVwGDQCzwj+tUmSn2fACh630u0HdYCMMlKxMxoevb1OsMm132s/C18WodWIfGh+s5lWLXoIsCIPIyyfcra+4G6fBZn/pHybBElQPzDRCebBrUK/dN+Pyf2UwHVAxw/hs61igxYfG8PJzz1mjAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9555.jpnprd01.prod.outlook.com (2603:1096:400:194::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 00:13:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 00:13:01 +0000
Message-ID: <87a605tzhw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 5/6] ASoC: simple-card-utils.c: remove unnecessary
 dai_link->platform
In-Reply-To: <93c65e14-8898-4e9a-987d-19954e62ae0f@sirena.org.uk>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
	<871qlqjz17.wl-kuninori.morimoto.gx@renesas.com>
	<93c65e14-8898-4e9a-987d-19954e62ae0f@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Mar 2023 00:13:00 +0000
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c64d25e-7343-4b8e-668d-08db2a6a329e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qdjQ0F66cfNiZoIukW+9A7VKPQRiiCJ6QLsc5Mp/Mj1K7x7VuPQ0dGzCP2Cg+A4iYUwyRHjK7VOgDRjYpysq8hu0YEr2rUvCLf8x+1SNzMFto02+1G6tYIjRfXTB/9TLtmvRG1uz6CRTYMtzfx0Jt8c//a+EhibSg7k6TI+mB0cVHB+7yfB7DItUaBVUNcx939/TGn3PoO3lRSg+L1c/c0JuotzQGah7MglswuJiA2knTbBfkG8DZ2FjxBxglZ/de+YVvrmfpl4Nu7k1XkAhkGliteoLmF25nPtwdb8AffFCd35sF9efupUhH62T9lEhrxmVtQN4UhJe/bcwMNlYDW3R4HfBEUYK8cuT8QlNJ+avfSp3F2+bJKbqJBM+oK3WhMM5yGcOAKwMZYEKY1xtzPZR5FKCKrE9Q+KWTfq55zMLOdZieyn8TwR+GUjVKojCiKMdvSlN5nCfzIq7rnPS/5cDkI26bXF65j4aFVVbVO5zQeGiWXIi19iX9Y3Mqwf0xUtZWD5rOZTMG6CT+cYRrhdcB717yfAuJig07F322FaLg0ElMYXq6YoAnSwBEtCE4m90rmngc+S+fBCi8XAaG2ogcBV1pULylBfcOITV5GGpp3d1v5bTnU3iEitncQC5zEzifNrrRmPMtNTiPmzYNDz0zmiFgXDvtbaBC0PXK917/mnfk+WXlDWh7sjVk1C3nX7zaNvmhG55d/4E/hXcFU9l20gY/fQjJaZoBNM0mdo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199018)(2616005)(478600001)(38100700002)(86362001)(66946007)(38350700002)(66476007)(36756003)(8936002)(41300700001)(5660300002)(2906002)(6916009)(8676002)(66556008)(4326008)(26005)(6506007)(52116002)(316002)(6486002)(186003)(6512007)(19627235002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n6dpnorWIqYgtHiqPgcxut8gWm4hXCV9THLQDFFatXzKXQRBD0mZsyAnRUBe?=
 =?us-ascii?Q?X90X9AKQZkEDwppCJNux6YkIzYlB1suaKQhoFmZVEq86GEKjPQLmDirlJiuV?=
 =?us-ascii?Q?n3MBiIVn3tLofF02LsQEb6jn+Bn+bYRGQHdVIOPggWRDM+jeJj21SBMOBV60?=
 =?us-ascii?Q?3N0sYM+dsganLNSWMpZOftd/zXreW8uIaatQWl5s0SV5jrGD2HK9yBLvBGeH?=
 =?us-ascii?Q?S2BkBj8WTLztHP1RR9X+YEmgicFDxUUeRGDPzqfCHMRTUxmVUx5KW/xtAFVT?=
 =?us-ascii?Q?vhBz+lyX2coxF9bK3VxvUu6iYai2gn7/BQeR/yJv2VtWAXV/SC/0IfscQ9c5?=
 =?us-ascii?Q?FrBzxVL7XaI/XHZ4mfAV6He2HJSg2MBjPHVktJrk7QZcaNR9vAXXbUsSxaWD?=
 =?us-ascii?Q?kxd2A3+2MG+r9WhAS0vytjfrphDFgNIAjF8yoD/x6aN1FE4JfCRQdwY0h+X7?=
 =?us-ascii?Q?Pzz6y1UVnacbyv2ZceUf6IjxqKW3f/UKS7MlbOrDPLEDeuVWznQd+VkGSQ4t?=
 =?us-ascii?Q?Ql77V4ldjYs85qXk9ert694ZmBSyJvQayUH6ynwUQCcal0fF0rPN02x/TETI?=
 =?us-ascii?Q?DPDOP8QQmFPat1YmnTycy6HzCGpaiUpPMVdZ1sXQkWZGJoBNrclWzhc+12B8?=
 =?us-ascii?Q?NK4CUKb53f2JqM6sF9yDZJtaMz9JWAyogFhXcGB68FHN4D/KR15/yIeXwZXd?=
 =?us-ascii?Q?y1Tkz73fcUQ5+/NX76xtN7WrQUmq9AT6pCnlMA0FyzJsN5McxrGEjHA9llBZ?=
 =?us-ascii?Q?VgH6ULibeFzBlMLMhbYcXxtIQV9Tgr5GiHcn3+5a0GcSBSdDp2tja2aPwOei?=
 =?us-ascii?Q?6AfAMB3Mc+TOp4zJJrZjRgNK5lT4Aw67CGrSpD+5kfGMVDINrLyNTx5kL2js?=
 =?us-ascii?Q?Yy2VlgG7Y/086zfIPO4tE1UiTNSm8attfOnYm3sn1zcn1PrgR1ZxcYwEKlwa?=
 =?us-ascii?Q?jw7bD4lRDB3eJ7sIxe4icT9rXrMuQRp2e/XkGREIVw6w6mYOhWIZfgvFjCBq?=
 =?us-ascii?Q?E57FNol7Vatow6f87dwHXzt3IujT1g5DS8FASzmNIJjhDbRtnKz2hX6HCRBw?=
 =?us-ascii?Q?e2chJVH/ezmmi5JReNMml+GA4+RWoxtrxYRB+PKpnkDZpyYZAukrdojb1raM?=
 =?us-ascii?Q?9ViCCQLkP2fPtgE+oE5/b+EyNx7LMOwsO6m18G5Ha+G9CLBvMWsK6FTadl74?=
 =?us-ascii?Q?pj6HuPQOA3CCI197xpNvfuFS8J1zMQ5SftDTvskAWuoseSnV8sRZv9Jp+zk/?=
 =?us-ascii?Q?hmIwr1j01Q/UEDFGNuIMJd85e5jbSvcJ6jeAkTzQc/scH1QEnJ8LmAeStghW?=
 =?us-ascii?Q?cP9Icu8A2Z4qxPUEVMOYlCIunWBG1PKrYPbZwEMIHyw1K/gTXdBklkVgf/h0?=
 =?us-ascii?Q?Ek15ellXe1Kl/f299ePREW15ZOHtggJ3GiseIyzor/lxrlN2G3uWB9wrXmK/?=
 =?us-ascii?Q?79wlLvUAAuw0KK3SZF0zJz1Uhaxk3X5SoSGgoXPSTQUBHYbx91oSyIxghTfI?=
 =?us-ascii?Q?pZA1PHgEESzn5vAt7AgOwX52sz2VVqIHNo8jMhEy0RnmO5FW23HOa705cYbs?=
 =?us-ascii?Q?3sohjdf2ZtGmTJWS2azSVhTKNW6lQD/J0Hdap44kEaVs/1C6T1k0986hLljZ?=
 =?us-ascii?Q?a/WabSuCdG1+fVdVSpAuylE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c64d25e-7343-4b8e-668d-08db2a6a329e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 00:13:00.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tEt/Y/D+nyF4lua6sYvh0uASw2We24K48PbOPxK4cHhgwjIi5uR/ugaBEJ4WYe7TaHKHI1dF2cPdJVwDKF3jfh9FCTvlMKTwABkxhVDrwkbWMbRRTUzBEDe2E9r+OmYx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9555
Message-ID-Hash: 7FBGMQXJZMKBXDC2XNZYSRXG4O442ARH
X-Message-ID-Hash: 7FBGMQXJZMKBXDC2XNZYSRXG4O442ARH
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FBGMQXJZMKBXDC2XNZYSRXG4O442ARH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Thank you for your test

> > dai_link->platform is no longer needed if CPU and Platform are
> > same Component. This patch removes unnecessary dai_link->platform.
> > 
> > Simple-Card (Normal) is supporting platform, but
> > Simple-Cadd (DPCM), Audio-Graph-Card/Card2 (Normal/DPCM) are not
> > for now.
> 
> A bisect tells me that this patch rather than the TI one is responsible
> for the issues I'm seeing on BeagleBone Black.

I see. I don't have BeagleBone thus this is my guess.
I think BeagleBone is using soc-generic-dmaengine-pcm.c.
This means, CPU and Platform are different Component,
but are using same dev (= component->dev).

In this case, this patch assumes BeagleBone need to have "plat = <&xxx>"
on DT (but it doesn't).
And Simple Card have been covered it automatically (It assumes Platform == CPU
if no Platform was selected).

Hmm... I recalled similar things happen before.
OK, please drop this patch. We want to keep existing DT as-is.

But instead, I want to post other patch which add comment to Simple-Card that
indicates Simple-Card is caring soc-generic-dmaengine-pcm automatically.
Otherwise I will forget it again, and will repost same/similar patch again :)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
