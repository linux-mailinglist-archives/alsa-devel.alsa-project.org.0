Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F9544054
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 02:09:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7FC1F5B;
	Thu,  9 Jun 2022 02:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7FC1F5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654733339;
	bh=/tmw3SgVTiwGV5kfvi5L/fHwVvbyc6JhT3Lum09/8CE=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i36HtSM0kjoTqnJHDRXFXRJLFs5ImVgyRmJamb77huXFM3Pg5P4nxDWWB2o8s1wSe
	 JWzzB0SR/+W9C2j/vVOrUbm8fRG5IZR9xaRyUybusaVrYPc8cacRKQFlDDGW0vaC8r
	 P1UAXnNH417LnMfgDCdIyvEADzQPip+GBQWsJwls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC158F8026A;
	Thu,  9 Jun 2022 02:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E5AF8024C; Thu,  9 Jun 2022 02:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21286F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 02:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21286F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="W8oXlsUc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKhFBf4gbFxCPW67rzIvsi06E08h2C6w5sKpQI5ZlPuPLKJGhj7yAOif8VY4NleN9GFfhFNRS4CzhK64cAqv78nZp+M/lhRJgNfpPq2Lwb98yGqh/lH6S68KOlMS8Debu2ZHV5ZjWaJZf2mYDttvJUDu1WvHODHYRfvQDyThBj0dxtMCSlKrzfelENdKl6gD91dnvqZ26YvGG7i60qkwzaQX3bLFB44ledG7TAknquFvUJuj3wvmvcla66OOaXt3kU1uZ6Ti1nBR3sG8+IsF24/j/Usm+HxWNacl/36EaB9+uUp9lcj/9/u1Bt46pUTi/cDioNRyjrp4eCwyDSU3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrvsEvSbyuGi54gj9cm+2/6Rz+sdx7k29HZYN+kkZdU=;
 b=efUBdWNJg0QlT2/0paplZAS5QSIQqwciN+DXly8iqhXPCb6KNWfJSd9pHcZRYPPF76OKOZd+T5u01QVGlEGo6bte5AKHZqxKuGzguuNMUzUVUiurvn2WctB6uUGy4U2IzwyF2b03uj11UKGpVq/u6EKEUG6YjrCdIMxV5xUVxv9il2SyuJq2a1PDOCSNG5mUAKzHyVNnKQQFBlrkX5ALuTmfgF13jZYl4BgztOHbphYDwiazzgwfh9mwgD2LaxT87hhAZpDmn/7GPW2C9QHMlkV1YWJ65ZmF7PqsPmjYSzpab7DwwilIU2bRVBEUjaqWZcMp0Lh2+djnUeoOtU1ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrvsEvSbyuGi54gj9cm+2/6Rz+sdx7k29HZYN+kkZdU=;
 b=W8oXlsUc+XxkgtLVASFD+/rGW+fhAyA2mSzUGIhlr8JWEyFWnwvkJPYLwgT60HECS5p5/rhR875CbmgVCRwD5myaczZV1GJICNcuLEJaINs5PEjdbt4Fmdy4gLQaOywd0/5e++ZviZBaSck0zRSiNKec9cIAySSW/RRHFi89sno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8171.jpnprd01.prod.outlook.com (2603:1096:604:1a6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 00:07:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 00:07:45 +0000
Message-ID: <87edzyr96d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: About Cleanup ASoC
In-Reply-To: <554ad23c-1113-cd91-235c-268a198b12c2@intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
 <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
 <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
 <ddad78a2-685a-b0f1-ec7f-ba1c9647c243@intel.com>
 <87pmjq4o0o.wl-kuninori.morimoto.gx@renesas.com>
 <554ad23c-1113-cd91-235c-268a198b12c2@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Jun 2022 00:07:44 +0000
X-ClientProxiedBy: TYAPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36e7cf9d-fae6-4112-b8ae-08da49ac140a
X-MS-TrafficTypeDiagnostic: OSZPR01MB8171:EE_
X-Microsoft-Antispam-PRVS: <OSZPR01MB8171E15709794DE1922C3129D4A79@OSZPR01MB8171.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PJu6yvCE87WvCS7n6SPMxZ0sYhESb6GgP0UNJaOWONWeby1yoQ4StOY5147iZVkjXm1kq53WVgBbX4Svo1BO8J9fol+wfIy+vjKjG90/cMdwBM8B38rRl7kb9LFNQaTwoiyIOdyEvBcREfMG1nhjznDCh0Rm+b7DVsJoBM51lDpxOMECex4CAh8vZJhzarRh1Eg8c9EuCqFqc8Hv8cKGexVIU5R8IDkg67Sa6MEEF6TKRy+xgguy6fz72sSP2mIfDK+6K99ZcCmg1SHVP2pQ+poZcXX7MgymzsJqmbKBvqDsIWVTaSgVN/gr64C8bmKHBG3EF3uWieYwFpMOiprJ6g6KKKQ2vihPjo65t0MZVlR3UJTs4Hi9i1Yw9m0vBuc0meb2rdVjLAnSsL0VbPS52nep2aQNBxmbpwhShYXtVsRGV+dYYnfJBzolzLgjCsBy5UhCJihu8KPIXOAVGS5sePZfuWWxGPjGKkRRyA2TRR/fOjs4p4zpvCAet9vyE1m3eflo644oNuB7HWzFAToRSfVZEP5fL6KpO6eaTSIIH6XjMMjUp4TXDnx22Td1Ft6Cf8plWp8cKQflBX0fFTGeRTMUYrIfcY9sS5v7BYDsRSaogP3c+D7ADzDhMFxxKzEA0OUEjqnFQMS3M3qdrRQHo/JjtKTScfS/+al0i3FTnW9MysppdoDyLETFgtOEPlxW1AuSOoeMyKgrEzpurL3wGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7116003)(4326008)(66946007)(8676002)(6512007)(66476007)(52116002)(66556008)(26005)(38100700002)(38350700002)(86362001)(8936002)(6486002)(508600001)(5660300002)(6506007)(2906002)(36756003)(6916009)(186003)(2616005)(3480700007)(54906003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fI1/hrMmpLBtz0w59hKpupEL4dpmDzfUTpRuaR0TjhDxgbcev1YfVS1otJNb?=
 =?us-ascii?Q?6cHUjiJdSm556fObvZcl0emL2O8DQhD93lA7iELyrqDO4ed9CyQyp2fC55sS?=
 =?us-ascii?Q?dEhKR17wIdQOA/wKyGUBeYnHDvRE0NAKLvOvSf/ZESL1ahDLSfkRh3IgCQ9j?=
 =?us-ascii?Q?8VhJTvsaG/Br19hHqnLrRHZFedBoAb9Jwbl6/5c3LI9xKGL3eDS56kVfSM1V?=
 =?us-ascii?Q?BCy3WH9E3OvrxLuLkZUmzH0h+XP96YfLMxxCH7I6pxNcvsMbn6iAnUZyf5m/?=
 =?us-ascii?Q?1uK19zqUuGPo5Vh2mbJ2V/G1ztV9/3ia4ccHP/CPwjuHCb3ITO5SbG42r1oa?=
 =?us-ascii?Q?pPuuyo9IbHJllOH8ByqDFEQLLtA/sSIkR8lSjrltmfysA99kwNtF2iQjwUGf?=
 =?us-ascii?Q?piEJkYFgMN+iZiY5XVpCwerZnDjOJeI5DhBRvE8MtsbB9CmWM5hMYa/dBCFF?=
 =?us-ascii?Q?W32WWWqSQIA7JoCLuSXfJAuU0K+Td4wZfsso8IB+ckW5RVeJm7AzuSkkDvlk?=
 =?us-ascii?Q?qz4zxDOL5TSPXJpEzeBNfTvgC3JBUxPRSP1j2qiSFeZbefzEuHrriHEqedY1?=
 =?us-ascii?Q?yn1tpyH3QmOoAglvBjZuGbz40ATjeb93xSl4Xt26/fxN9YBseuTkFYKF06B/?=
 =?us-ascii?Q?ljXWWPgFTwBWwxh6lGE+u4CkEylW6oqzsrUzCbEFHLkoKjNVK3Mp9sB8lIpr?=
 =?us-ascii?Q?puinpunndrfD36rAAaohuDUpIjg8nblnRIs4I4HUpxeqOs5hIW6w/3QYXn6C?=
 =?us-ascii?Q?tmFSKwmM7CQRlT+5ZzjwJZR9BxaAl+rExnaC6ienGDSPoL13dgvxMLcG5xSc?=
 =?us-ascii?Q?r1jkJrDzddxeK4qvOp1Q0+8PoIvz0jaPHhWIdBIhusXLaX1I03HQXtYM2Gw8?=
 =?us-ascii?Q?HksjFB3V5eVFu1jkdntvSpJfIhJPL89pZKtDqn2R++3XEbMC6O+G+zT9gTAu?=
 =?us-ascii?Q?emEMpTnT7a/myJUwhS8xzNwmZfqFczUKjp51AbRsZO8OhRU+IYbFqk7/BLxR?=
 =?us-ascii?Q?O8Vjh5CtOM4S+l8UMrpsC1jbQhcVZYuofLZOtl7EJdX57gScfjyjDXVbHJIG?=
 =?us-ascii?Q?ghosQvgLsRp/f5/fjSVKS5PhkX33OJU/SCThGIinsqCrR8iy1sbt4MPSHK+b?=
 =?us-ascii?Q?7lUt9612ANdi8XoSy94WGOjVUfR/C21mORlU7j7h7vniAarzKop6NjUWvbW8?=
 =?us-ascii?Q?sKuumk7dzuFc/m83fNEb3bemwCHVHhD5pRUS4B5BA8kuGZnFovt/+mz4cVPU?=
 =?us-ascii?Q?4ze3045tKPwHYygjW8NiF92r1+viDy8v6IP3FcP51hgvK3RNmnBUbrVpDNAb?=
 =?us-ascii?Q?YfGnN7h+UTu9JKlbJ7mo7ptDq2dmTzoIagUkNiNcKNZxXZd13u5W1fVRvtfX?=
 =?us-ascii?Q?LQcOj60JzULzHcvbSKPFW3KSqDHclTdl2jNK4gXXhq3J3qd5JVrJIKeXwgh8?=
 =?us-ascii?Q?mAz+0F1UDnU5Dgsr7ouju0XUcj4RilVWOud8Mqq+Yfa/6RmKd92fUBhnkakA?=
 =?us-ascii?Q?O8U3hSRX/yyjuH2R8R/K51ahyOl6aYojFH0hGptLQS0PBV/WTEb8YaXvL/Mx?=
 =?us-ascii?Q?Ro3V0J8jmITNYNcGWGa0KK/oXh2O61mhAjwwM7zO/GMRvYA/K6bcpZp5VNoG?=
 =?us-ascii?Q?0kwFr8EOVl5Gtzvhuawxh+LBAhZDNa4LpjrHyMFIXlotcFBampLiGU48lXnf?=
 =?us-ascii?Q?lFRkYror7r9fjoifMeSFgwG/x2XSSYYbG+5S1Dbf++jblTp9BziZpNt07IiG?=
 =?us-ascii?Q?dnvdv+w/wVrHeupj9vQ2VT0E5JkErBo9gZqz3NAuVgLFG0DmRotw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e7cf9d-fae6-4112-b8ae-08da49ac140a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:07:45.6144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dW1Jlw3Y5BfUvVn2NfoE7sPR5TZiec71rb8htyNFsJKI9R4ALsn0MAdbBDK3QadTRLSTgomQZ9omx7uNLlOqH0POeVFn3JCLF5KAKArSaT3/B+a/7MaGGopmg0+yTo+a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8171
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Cezary

Thank you for your feedback

> > 	+-- DeviceA --+
> > 	|+-----------+|
> > 	||Component  ||
> > 	||         [DAI]
> > 	||         [DAI]
> > 	...
> > 	||         [DAI]
> > 	||         [DAI]
> > 	|+-----------+|
> > 	+-------------+
(snip)
> 	+-- basic board --------+
> 	|+--------+             |
> 	|| CPU ch0| <--> CodecA |
> 	||     ch1| <-+         |
> 	|+--------+   |         |
> 	+-------------|---------+
> 
> 	+-- expansion board ----+
> 	|             |         |
> 	|             +-> CodecB|
> 	+-----------------------+
> 
> with suggestion to solve it with 1xComponent:NxCard relation which is 
> not supported by ASoC. However, we believe ASoC already presents 
> solutions to such problem, either through 1) compound card or less 
> commonly, by 2) splitting one big CPU-Card pair into several smaller pairs.
(snip)
> Perhaps there is something I'm missing but considering that ASoC does 
> have solutions to the raised problem, I do not see why either 1) or 2) 
> cannot be made use of to deal with the problem. I and Amadeo can 
> definitely help with 2) should you select it :)

Yes.

If my topic was "how to use expansion sound board",
case 1) and/or case 2) can solve the issue.
And Renesas is already using case 1) for a longer time.

But my topic is "it looks strange" in rough saying.

"Basic board sound" and "Expansion board sound" are
different sound card, in *intuitive*.
Case 1) handles it as "big one card". It works, but not intuitive.
For example, developer can understand it because he know the background,
but user will confuse, because they don't know the background.

My indicated image was very simple, but in reality,
it can be like this

	+-- basic board -------------------+
	|+-------------------+             |
	|| CPU <DAI0> --- ch0| <--> CodecA |
	||     <DAI1> --- ch1| <--> CodecB |
	||     <DAI2> --- ch2| <--+        |
 	||     <DAI3> --- ch3| <-+|        |
 	|+-------------------+   ||        |
	+------------------------||--------+

	+------ expansion board -||--------+
	|                        ||        |
	|                        |+> CodecC| (*)
	|                        +-> CodecD|
	+----------------------------------+

In intuitive, CodecC (*) is "first Codec of 2nd Sound Card",
but it is "3rd Codec of 1st Sound Card" in case 1) solution.
And thus, user need to know how many DAIs exist on basic board.

In addition, in my system case, it can use "MIXer" everywhere
which uses many DAIs (special DT is needed in this case).
<DAI0> and <DAI1> is using it in below sample.
In this case, interface number of CodecC (*) will be more
confusable for user who is thinking that it is
"first Codec of 2nd Sound Card".

	+-- basic board -------------------+
	|+-------------------+             |
	|| CPU <DAI0> --- ch0| <--> CodecA |
	||     <DAI1> -/     |             |
	||     <DAI2> --- ch1| <--> CodecB |
	||     <DAI3> --- ch2| <--+        |
 	||     <DAI4> --- ch3| <-+|        |
 	|+-------------------+   ||        |
	+------------------------||--------+

	+------ expansion board -||--------+
	|                        ||        |
	|                        |+> CodecC| (*)
	|                        +-> CodecD|
	+----------------------------------+


And case 2) need to have many Components.
Indeed this case can have "2 cards" in my system.
If we focus to "working system", I think this is good choice.

But, it is not good match to "Component" concept, in my opinion.
I can agree if some DAIs can be semantically grouped.
Your system is this case, if my understanding was correct.
But in my case, all DAIs/channel are same.
Having many "1xComponent:1xDAI" is strange, and not good match
the "Component concept", IMO.

Both case 1) and case 2) can handle my
"basic board sound" + "expansion board sound" system anyway.
But both are "stopgap solution", not "generic solution" for me for now.

I wanted to tell was we can expand ASoC with keeping "Component concept"
and keeping "intuitive usage", if we can have "1xComponent:NxCard" style.

I hope this mail tells my concern correctly.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
