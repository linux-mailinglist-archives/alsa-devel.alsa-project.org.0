Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A3F727497
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 03:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4226C0;
	Thu,  8 Jun 2023 03:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4226C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686188875;
	bh=VAVedJlfUUAMDchcYYMC2319bmOZAOhSfur7ZBXcHPU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=THpiz55aT6X/Cbm2L9hrSvyJN1Qzh22TYTMfLW7nAT3/etx4C235BtAqw3CfkUCUo
	 BtLzcZ/vOyZG9n/wCBkjf4ITIIj2vLQvFial8GEgJpsdhaai+n3RoBFJZzrVwhTmzy
	 XCTtdeCtQmQhONgZUma2XooMthcSBsQUG8XjlOhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E469BF80290; Thu,  8 Jun 2023 03:47:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75A2EF8016C;
	Thu,  8 Jun 2023 03:47:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92C71F80199; Thu,  8 Jun 2023 03:46:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CD90F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 03:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CD90F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DhwSdyf8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IB21kNjH3K7QdNIbuLTNFF1OTLNk9Iz0wjIUaOz+1E+LgUmLmXWtRPT6ghD9Mw1A6CqVnp5RW3DL0qok4N04fdp15qfbQ29w9KQ2cnpRctRJthieKUIYtsXQgx/S9hWW89OSISod+8L90grcNAfrjdSd0m/kKfFATOKrGkRFEYNV8vqLvLhk48/VD+V2D0ZgID1Ig5gDtkMQpBNTf/qCvT/Gile8auEsOtwEe1IfUNIkLi/8oyG9lY0JUJNnD5NkvURPx/e+BZqKhFepBm4othCMqfwdE1GfPukx4XXcrv/I8DRgqvvoS0h6QEgW2iGRk0+znuW/VmU8yq7MA261gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW7W1WsjSdIOPuWvsUw1fwwcDg+yjakQm4gKMIHLy2w=;
 b=YDuZdEYzfNUHPSR7xZwoy61gnakPlYBAHnIZEZWcy+FfJxXuu9HT+FGu+vFOYMRkB9CXoGaVIwAuzIgk0/QabYzoIiHVK0sg+mRLKvkUNnS486GbqxB0O/JetyF0g8WOsbAkg3flR+piFDmaPon8WgWpt43c7fSgAFcXEBrpaZy4rWtFZHVT0rhu/qnykmE8GNFjBf9dhpojb1sDg2ay2lBbRsGHO33ILoRTJCNuHlWxbVfh7oesTf8DF8cPJlpWPcXvmdgTUh13MW3HlGA6GM+ulkGBCdST14D+uJBGhivfhNuBm2f/La2R20KvwxOXvBhUcluxJ2z1ABz7fVMwOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW7W1WsjSdIOPuWvsUw1fwwcDg+yjakQm4gKMIHLy2w=;
 b=DhwSdyf8ag7G/Hy7ThRYHAb8CBpZ5cI6SYHHMojs7KQaL6LXbnrLlACkaG0qjI8XGcaWUDBu3TBRdcty5DhgdYGkfoIPLblMxe+lpSkdHIrTqrwXffuAw7iYpBUZ7xMHO4mEhEQKKRHzftM12RLPc3K9qcXJ5yNn3zsg3p0cSZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11019.jpnprd01.prod.outlook.com (2603:1096:400:390::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 01:46:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 01:46:42 +0000
Message-ID: <87v8fyg1z3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/4] ASoC: add new trigger ordering method
In-Reply-To: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
References: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jun 2023 01:46:41 +0000
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11019:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4d115c-4699-4af1-f7fa-08db67c23559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fkjAa/Xa2tJDQ++/598mOXFTUOa8FWAnpLOcz1vYDEh/V5ndCHyE9p6a+1s+O7aeIzYp3v2xEdrEiePQrfZnVTIbOZcdelMPay53y/deLaPhibXtPncyR85yBfrQrfT9o6dcUnHIZtHl0gCo/kMdAa4a8LGoBYQkWXo3uVcYAhHwNvxwGGwsC8na8Vpb99hjHrzPgoK5tuzGf8D3RrOi0txpm5wsuCurP/GF0q2CoycWZrEokYIATxT5E8Os6KVYAMAV8teA9VN0a3sK523W7qBSWrUvZMvW/VnEmgzzFHmURwHo4juyjEr+rdxNclftpeGd5Dxbylu+KmY1EM+LHBiL9YkcpOEQRltANN5YpZZW7rhDnvEBL+lTwVX2kaL7Yfsc8D0WZglQ8EtTHmJrEJCistkvGfXUdhWux3X0qRyQTEgp+J9UcfXFDg75ZJBaGh4VS/67KBt8mJWtJFYFjgumdCGJDOj72DKhm9Ra0OvquBaNXMDaoRHWxIcbE0FWMADx8Xf0tzeZQvlZc6p9FalpWsZFa5GZmw11MyjALnzVWIljUl3vLl7Bp3qo7D4f5FhCqkbYMorHiOdkxxbKjZFwqi44zqZ3793kgABE6luwDL3aiCFSAYQsmUvuT0al
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(6512007)(6506007)(41300700001)(38100700002)(2616005)(38350700002)(6486002)(52116002)(26005)(186003)(83380400001)(478600001)(110136005)(86362001)(66556008)(4326008)(66476007)(316002)(66946007)(5660300002)(8676002)(8936002)(2906002)(4744005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mhDJRXcIOdCyy4sEskmeKSldYgI24XP3ApUfFyD5w1ooWXKHk7GMZajMXz8Z?=
 =?us-ascii?Q?8s4BD3EpO5ogCsI0mS13vTqtUn4y1PMYyCfDyewLC2cGfiJGIOiKwZQiHg7p?=
 =?us-ascii?Q?rvrHD/EbdNRROYtD+RaU7SaGV5MLwN3kWcMUZU/cKwQI1/iTcU1XdLg7mjch?=
 =?us-ascii?Q?USxK6JmBqDrMr2gURr4vP6Kl4CPsDDUiObwdxk622shsMAzL0egAYwXb0wqD?=
 =?us-ascii?Q?8mjWY/VSosoawsA0en7P4S+kTC4WyyxvD4NgCqrcHqq+eRVwQvs8OhOwqVGO?=
 =?us-ascii?Q?0GUFaFSDmrRVvPpnqcXIBaKDKFcBHriuX3jwaTfRFH4gXchNWfQSi2/xe9+R?=
 =?us-ascii?Q?cOdpj5TDnV9DP63HPoKvuviLMPDLdh7kjhieDAC6WOIPlRrvOtQTc1vrEFDS?=
 =?us-ascii?Q?IG5/30Stq3v7jskSpEg5TeuNuuGDTOoWCiJBdGM+Dqug330omwx4DZaiYJRB?=
 =?us-ascii?Q?P/4Y1vZQF1bvovCLoJPgyXWzg9kn5cz1yPjGKMFnwui2nm2lB/uP0uC0ozMR?=
 =?us-ascii?Q?vRGo6YeEyDotDmg/prwoAazUNBzY9TpRJ8XIF2OuB/MO7IwlZ/RxWVPX+vbF?=
 =?us-ascii?Q?6eLMfTmny4Ztu2HTaNy+WgWF2baY1/ySI8+T5RyRWZaUPEcacSORCOvNosod?=
 =?us-ascii?Q?HChVni1FWeB1MfqYwbucknszAL0ggbwVNNVmosWLw1X/w8iakr2GizZ0Y+O/?=
 =?us-ascii?Q?BDXzUcxRrUBks4/8crgYXguldjX+CigLna3x2ye0fgt0UqlBkzui5OsR0qQN?=
 =?us-ascii?Q?YmU9Qj7EZKp1Rg8Fp7foa7HsFX7vhYiaxOH3UvfvZepEUcGwyPRhB9PoFSBD?=
 =?us-ascii?Q?z3bhPbx0ymjeP5Fn9eDXMIicXnwMY+tRKbjU/v3MYWkp2uQsj3K7wOmy9L3p?=
 =?us-ascii?Q?27ecHoBlkdbhlA611sfhU9xBngxMhjNSszj2Ax9n4c1j7kv2AstqZOGK4KGP?=
 =?us-ascii?Q?zCwFMUd53eZRm0WiqG6va6cNfMYxEu3UJCVYPfaN6Hs9a+1tdFW7dQzSrupm?=
 =?us-ascii?Q?V7unmSUGZzLI3J2zK5BwJTf5IS6IpCX2l0U4/PAK83tAVT807sEsn/bXoFLR?=
 =?us-ascii?Q?oDIsBrgkFHys4LzUPr58vaEuOS8QbW713+VPv4NlchXPnwWoZFCY6Nvoin9x?=
 =?us-ascii?Q?cDwof+ImsTecmEK1y2gj3nso2EgXeH9JyvRlawNKm+j70bVws16OxnxEoVov?=
 =?us-ascii?Q?EWBOOzC8Bvw+tW4eHIcKzlz83oulGmdIjtwR7YYG1n4nFPJOPmSJMQpgaWmI?=
 =?us-ascii?Q?KnTR1c0losm9z3EBsurt4u/Ihak4E4Kd0og4SdMW4/ouOMcVa8HKg7X2sEOE?=
 =?us-ascii?Q?1AJ9cJe6DMg75h1Bqo1D9REwsYyYn+D0JcXm/zVwFeOekdvHORmzJVNIv7sj?=
 =?us-ascii?Q?zz76r8sWvG0FZNBKhcB1XljCoprceRIYbfUsabkQDaMR+dpeNp9sGqM0xpD0?=
 =?us-ascii?Q?kZu3WhkI0D19LvZ7IzzvifUZFhc7lBhlgHzfxiA7+r4dwrWmH2Q2jlJ4ND5z?=
 =?us-ascii?Q?sESSg7FID2gqeQk8G/45gRYZl5JH2EPLUpFduNxs2fbKctpA29aqUogDJ0Vc?=
 =?us-ascii?Q?oWhaKaDMIt00kuiYKyHNbPUZ7O3Z7YeBGfNG7wGa9Gr5uGghJg9KWYdp3Vo9?=
 =?us-ascii?Q?urtV9DCfTqPL5iEUVc/RvZo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca4d115c-4699-4af1-f7fa-08db67c23559
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 01:46:42.1215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QjwFbjHpQMk6Se1djKfINILfbOjltgVWVUaUbHjkyUAD9iJB88Y7dMECH1kxqti9l2hQk2Plr5JCDWlr7cB3K6MTUyJErghY/uUj3WHGi8cCcd8kzHK31AfP+C60HRg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11019
Message-ID-Hash: GPGM65SEVV7CCP5R6RRUKOYS3OXZDWPV
X-Message-ID-Hash: GPGM65SEVV7CCP5R6RRUKOYS3OXZDWPV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPGM65SEVV7CCP5R6RRUKOYS3OXZDWPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> This patch-set adds new "trigger" starting/stopping method.
> 
> Kuninori Morimoto (4):
>   ASoC: add new trigger ordering method
>   ASoC: amd: use use new trigger ordering method
>   ASoC: atmel: use use new trigger ordering method
>   ASoC: remove old trigger ordering method

kernel test robot found 1 warning,
and I noticed 1 build error on starfive.
I will post v2 patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
