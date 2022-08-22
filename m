Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B3C59B9B2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 08:43:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF49B163C;
	Mon, 22 Aug 2022 08:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF49B163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661150594;
	bh=z6wLxUsg6LParPN9hu4kS9pJGOytliwnlKahtneR22U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KGTuLNWtTWjp7Q1VV8sqkg/Fys0LJ/+e94z4MsZDqVcid/DHxKbiccQqXzqZZtLIZ
	 8SN6WJQ5rJtQ/PHtH2gNv9T1SbuoUHEkBJrTDjniVuzg536/YLxfB7/2vpdQXQ/Pze
	 4VNNJmRmhAVJTQgeN8gzZZ3pNQnrXPT4Zpn5NYMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5166BF8026D;
	Mon, 22 Aug 2022 08:42:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C34F7F8026A; Mon, 22 Aug 2022 08:42:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5886F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 08:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5886F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="C4kkL7gd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=To4/sGuuTSxeScTTrNF0CDYG8yxMzWXbZSwp3a5VkquahUqPA3plfSh4VuQxetyjPiukOTG3DB+1LHdulDMUKVt5RBjiahLz2uVdRc7rDMAdI0ciRsebbgkfdjMIsZKfyyT6QaTLq7nknYWHIFut45NcnhrLQvWxFDo2CGkCYk/xSRWHN7MljMvMtJdvAS91lAhbNA3jA7Cd3dJPYN8PhwkwbzOq19MPjM/IJpZ/3krnFM2QK95ndIHnt7xv2X7ev13y4hNGtfhpMEA8TjoA2c/O+A+uJs8M0g0w7pp/iMiWMzqLvCYMaJp0QoZe5Tex9cP1UgaP++zzc4FEoPaaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/j9ir300nSNE3OnHZBksjGYmVECUBtfOzElKlHkUEU=;
 b=RV2NbVB69qwH9UxABnWlaKZ4LU5+WlBdwj4E8HeIOoAtQO8wBlJHPHbmFqQESFOEgQv537W/vpNWzkSm3ketPfap+b4YaAwflmc//WgBC8v3JaouopN5sgIwMg7EIHdJo7LaVM3cqD6MQq+dRhHMkOVw2UR5iNjNrJ5RY6iimG/LSWthUK5riDMqZtUCy4oOb8Z+XGLx1FxsLw9s69a4u36PvpXBeBNp2fmyVZTzt91iTPCeZOFrtgepy0rU2DWRi8h85fCxUGRdfqDmZAYxV5RWML5EEophJdooBpEx+R3BMo3pgY2w3//zrL0NjMz/Z3TrdaTmJxtbzrhGjO5P+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/j9ir300nSNE3OnHZBksjGYmVECUBtfOzElKlHkUEU=;
 b=C4kkL7gdzLJbPUy1+gYOiyNftVwd2jk3LzTJkZxyR1VE1COPxYGuNuy0jQdOeCEp340rrSXU2akT4qS0QadJDX/C4Rpm3IffP/cEXkcslGvl0wExeLAGetcbzuKEcn1HfWfH98RhZtDKFiUl/shXl9wjlAfd9N2JGJUHidlS9OU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB3591.jpnprd01.prod.outlook.com (2603:1096:604:2f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 06:42:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 06:42:00 +0000
Message-ID: <877d30hj9j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Do we need to check state for hw_free ?
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Aug 2022 06:42:00 +0000
X-ClientProxiedBy: TYAPR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 583c2e49-faf4-43ec-c960-08da84096acc
X-MS-TrafficTypeDiagnostic: OSBPR01MB3591:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TH1xieDDQJAnR07KD6hYvi+84ZIzJEhTarUUbauTLAl7DaDrPZfpepIVxiXL4fRGpv596arGHV6KkGmcfi45IrSKIGs9hfU3tzlrIltDHm5W7cZrFPLYc9ebYUZj83U35gJPjM6NDVXoa2FpwxfGVw+uOJDl7M7CZjdG4+1S32A1XBsJLi1bXp8yKk/naq6hB1/eFqiCx3dVjniE4JvdEs1jNVzFpW6PyYmirTewI9p0OOcoJQ6tglZdAtG3du6e+ybxC+vaxVLlok3PovntCVtBO31sRNZFYi5YcZ4aN6QdxFZ95OnCj8260rztc6905aKXXqPfZgAIGX+E38vRoPXzKKmx+RyvkOe9D8u9/Kzb/G1ebb6paUwGElgd308im1cfJHVHpZPM0tEXvXdSQkBZEAnW/fGLqfVc2cgJ4CEuyMVgIGGmIe5VNqaxPZhhLo8ui9xEPC604TIAHg6kdLOyMdY+3LxI/h06DwYlDsoiBkprGK/Fx+cj6wwht9P7J0wK5iEeWrmJCdFrv5FWmW/hE7fh6Nv8fdax7Xz7FzyY80upIyS0TQFjb7axARrAw6y0aawSKsrl3ntJsmegitV8fuWS9eYun2s4JZajeucgReh5DppKXaYMQvgHpDo9z5GDSNZLfwY+0Ue/jsOEwcC4rNzgD7+DyaeRdog+PsoSoKv6EBhnMkCFGCumKNLW/VCa1VEjXBO6kyqo2aDRvIftQhFSRYtrLy2qrNS8UPgH8LczEdQlFf+k6n3koWfwXbtNTIaEywNZyANKMO/gqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(41300700001)(5660300002)(4744005)(8936002)(316002)(66476007)(66946007)(478600001)(6486002)(66556008)(6512007)(8676002)(26005)(186003)(2616005)(86362001)(4326008)(83380400001)(6506007)(52116002)(2906002)(38100700002)(38350700002)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJvUEECZ6/3vncTncmmulpKt3VtEQOZZ0Zq/HJKMo0pVYxnSskz15AfG2l0O?=
 =?us-ascii?Q?P+GIpt78X34T49YMwaPXV+Y+rZ1DqZHpZrYVXo3XdC5tqFd+exhbwNFNA+AL?=
 =?us-ascii?Q?98xJNcS1NjpzLoPJD0oGFg4DLGB7KYxJLSQwUlBNCyPeMlQDe2lbliU3jTLl?=
 =?us-ascii?Q?7HZYMWAcvJiyEIJgmxWeXH625s3CC2fKl/c8eQR94p/WJTvMFKo2f3EAJr4W?=
 =?us-ascii?Q?U9bgNO4gYdQiONFyr5DlcGDrHGcpizRrDVQ5gM5nkyNr/NHvixi+OYfvtFYw?=
 =?us-ascii?Q?Qu8Ty7TYMXFuwg452lQZKJ/yD4DCM9v5lf4418h5YJEeRffKLPdU4aeh1k5I?=
 =?us-ascii?Q?exx+LNmBnXFFxrXCQrsGU/ZgsKiRFTndcMVqFSz/LHJZ3jhWwlcKYUvhep/3?=
 =?us-ascii?Q?DdKtSL9tggCKcScm0dZ+jUDJgTXxONXiV2du2YHeCc7HqDx88hZvhI6eEdD8?=
 =?us-ascii?Q?XHDdiGQx1h+pnAMmMR1cixXGzgnI3a+6lFYrHkaPYsRV7XHbDKHbbzlGuPIs?=
 =?us-ascii?Q?1HElMVe+3e7KEqlTeNR8SMINDFWtvl/+mQiTy+stHJTCU5gLwSyqCd+xyCFD?=
 =?us-ascii?Q?L2Aw5I3b5ywl/PUPv98TtLC03P6NucoMZMZHAd5y/YLMb8R9WRJymbXc3liy?=
 =?us-ascii?Q?6A6sLc4PtagJ/2f/qMbaf4myuep3AM9cLACi709Z9JdtoCEv5xrjsZG8CH9f?=
 =?us-ascii?Q?X47J1iDSge4PiVcbXqTorFlXXuxGciZnSxRTNklf+L3JH/+EL5ZKZ79KqR7I?=
 =?us-ascii?Q?ebEHz2RODr/2S0KYage2/eetvMXmmZ6ZaBbfGD2UQQS5iRYScRUwKAoLxUCn?=
 =?us-ascii?Q?J5noTtx3FeAEFhnHWCAr3rHij1jq1bJsMgeBuSpt/9zEgH8MlphOvM0wo0A3?=
 =?us-ascii?Q?Y/yTd+T4/M2eOM5fSOnIcAR8uNPKtmedWV8KSRDsu5QMhfoZHgDl1okio1ut?=
 =?us-ascii?Q?QLBWtFgO7SqaLu9dZJg0hVWQdKS81RD4WLXjeQ5CNmxRkFx5c5qW4XjLNpil?=
 =?us-ascii?Q?uzYJMvdqhODCf5poPkPgL3nqvkQ3FRrjvgxxtB865wYJRE3YJj41erQhNd6B?=
 =?us-ascii?Q?331y23zO2jZ8A2t7JEvZDrz2zT0mcLAJcfLnSwiYKz1/LvoXTkQFAes3dpSX?=
 =?us-ascii?Q?xyek6pFIonxDDaKmeKbv+EnP3ro97Vff5luwPvMJM5hovfDdX/cz0YotOdhW?=
 =?us-ascii?Q?JUdudATVDw/JPTAq/Yn6G5BGzAwXkwQy9BoeGixL1YeKM/7nfxd/b/6mUnoe?=
 =?us-ascii?Q?rps2HUFIESmvwg2SVDlhAliw55ixrjeNzVGryyU62887Qs3BspWkjsBRUtbb?=
 =?us-ascii?Q?vX9E4zCJB72Dx5M+mN051xYRW8tWQVsjma/rk8UuD2FOM8Bq+NX13mCCioKR?=
 =?us-ascii?Q?5g96UHeHiiCDRJjHDvpySsoWtDnVtDtGPOztX3qxUHhuCQLBzSxfUKLAbU5D?=
 =?us-ascii?Q?MvI3Xw9KYxYUG9VWqbgFG/XGou9tvhU0/5VSG3nQI64tHWO3ZS2XIsvFCkuN?=
 =?us-ascii?Q?k0JltNSYljvtyWBb/0qXw7rVOk1S+ZhNh5l4IH+w3q1chgSv+NtCz0BOxaPh?=
 =?us-ascii?Q?38h0Ybd/U4Q02exT/feef24QFNwzYCr4slKVG4vP8fKIA6iJD3iSU/jz4mYX?=
 =?us-ascii?Q?TlEU67qx6liRNKm+NaByF0I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583c2e49-faf4-43ec-c960-08da84096acc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 06:42:00.8661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/m1Dv512Q+YSVoVz+WyVQGDqQxBb5D9sDcT1joufBoFvRuUf8z3mahJQuWZoJPBOYTkS1jGOHxT4DtxLoI4TdZUVvO7hoZqh4JIwZ57ieMplib0DOFRhvYkdlWv6oO0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3591
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi ALSA ML

I wonder do we need to check state (A) during dpcm_be_dai_hw_free() ?
I think users count check (B) is very enough...

	void dpcm_be_dai_hw_free()
	{
		...
(B)		if (be->dpcm[stream].users > 1)
			continue;

 ^		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
 |		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
 |		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE) &&
(A)		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED) &&
 |		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
 |		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND))
 v			continue;

		...

		__soc_pcm_hw_free(be, be_substream);

	}




Thank you for your help !!

Best regards
---
Kuninori Morimoto
