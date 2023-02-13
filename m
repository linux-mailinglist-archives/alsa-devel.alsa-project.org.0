Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3E693B58
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 01:31:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863F7204;
	Mon, 13 Feb 2023 01:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863F7204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676248279;
	bh=JOgBrI811bfnqw8QnZ2nULwqAE0Ya+An8qbUrDU1bdo=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=skIiz9ldJUQUNl6hMLzzGRI6fOfwBVoI9/x2ti7WUnSuljKprS8EvgtOScE6OLIgn
	 t1Ns9WZwADO1qpIwSsjaFXgweHEkW8cLhE7RYFoSUqlyCsMheM4lAnuicLIv9KqHTI
	 R5lveZQNQZhSbTEiDT/iMtjORyl0zu/zPXZnHiSs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B14A6F8012A;
	Mon, 13 Feb 2023 01:30:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C24FF804B0; Mon, 13 Feb 2023 01:30:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45338F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 01:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45338F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PFNsTWZc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TofXLwKBhoh0oROY6eds+5S3UmO5eG/3Q6Mr5uayhz9a0JqoOXgtg2TA1mSvD8kBkiCpNbS/9cKLe1+SJD0w3az1ujyKlC4nAmj+qG7utA+g0OIFlcoy9AzWfbJXw5pOZnE5SJQPp2VoHdk66DLiYG2thywE+whsKWnaBt9d1gGrjMtfoSovyMw8EEKLs4wsRLAp/YRR2QlBF8N24CIttcXqiCUo5x3yaXEgQG60WNLNzAGyHfl2AmpeMswmWRfo/moqMoEhyFu2xcOA7yl/jjOotsn1ypCNlzuzEamPL8o0HEqULxUVGC+aKFz1AuXA/SJ7YzuhxYPwqx76tDEdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsLkWk0TIJ4xJ6QIqczP/AULl0K2gPgK6YbqnmMsIdU=;
 b=fOhYGMhNVOpC2m02qU8oAvDMPe4NXNVZ7ae93pDkTtZyx0NOiSm1TOGh+UO0B2hC1fMOxVcxUDedfsST68OAwHu1R2LLefvim6JcP4Wf6iv+MP9cwvDLNsyjXZRJBxTEG6Qilomk/4Gha4B5+3tBcKeKhSjlZItThkO2PuJqkY/6lPCga4l5GO4bCXNF+AZ9rREXJl8gBj3f9L+uAiwS7UQx2bl8FZVJi425miRT8aETGqjHXPT34rmAbTyOeEDU5edTUjPZqtYsD2+Uwo9inpHQMfthwmgO0Vsd7x9GDcuiR4XDan/Pg1koV0EUmCzskHdYPDKPRbLjPrh8gLDZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsLkWk0TIJ4xJ6QIqczP/AULl0K2gPgK6YbqnmMsIdU=;
 b=PFNsTWZcgvfBgXrA/O+UTFJQDzGsiWaRWXR9jTBDPC6nhlQZq8ArykY/AkPEmrVJ3GdawdX9nlR98tlG59ezMZx5gvaNLmb+H3w2dRv8TZS7IqYH/MCLy6+kubH8V8zx+drHxn653DXnr9krT8CIssRc5kKxb6DZAxwdpEEmeOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11281.jpnprd01.prod.outlook.com (2603:1096:400:3d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 00:30:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%2]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 00:30:04 +0000
Message-ID: <87fsbapfuc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
In-Reply-To: 
 <CAMuHMdVOgnxSkAyy_3MGYeQyRcsr5aM00qSfhrXTMBLy1aa7yA@mail.gmail.com>
References: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
	<87v8kbbpl4.wl-kuninori.morimoto.gx@renesas.com>
	<072724aa-2bf3-32a6-dee8-e74c74b01019@linaro.org>
	<87fsbe1i9e.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdVOgnxSkAyy_3MGYeQyRcsr5aM00qSfhrXTMBLy1aa7yA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Feb 2023 00:30:04 +0000
X-ClientProxiedBy: TYAPR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11281:EE_
X-MS-Office365-Filtering-Correlation-Id: 850c1a66-f9bf-4e31-b582-08db0d59736f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xZKJ3Aw6EKzGZnsDs4zW/HRkRLShSkzjdOGndwCWm/5JRKv0E5ka35Ij8N5H9gE4jluJdpc3p1HaVfSK6dTetj8JWfcHa9rNptu/4zAfLFRoOUom5kwen3VNpLvCIhsN6PUerdJi1kzfkUGqKNjLvleqEn8iIR0iUAdlxAli55PHLM5EGANW+8QXPwKXdwIKmPIle//ChoG/g2CdhHfZ38nT4nGolPStANB8uUuYS2H9kBOVGBS68YK5neqnK2ZtoVUY68QRZICjSaAMcHkv4A9NPqFj9WggSPxnqXR7lSeX2hE3OLI8RRIVNzcfK9AoXcfRHPOInKk2W8ON3UKeG0PWAFnJ74pRi048a1G5qfljHfo5hbxG5+pn8rs/k6F56XSuPws1PB6SYXeOAi9xxLDqH0RrGZJw5xQYZvfpsuzRPB9/uSxVd1sQzTnkLKqh1IHZfs/ADiaYDqFnayDMDvAXa1OUuMVhc0l3PzuIvXOyB4q9uSq0IzhNvSqwXYsWrKB+nIfvpXeU509Rso4dWL5pg4RhPEJMspIMccqJ23+5KZf45o9l9NheUWAyQ9Uw1VgxuGiUiNlvCTPKtnPAT4apNzR179NuRcrrGEgt14pxla6ml8oBB1LBfGk3kskzA+XooNwxXf7G1/Wv8XfJjJufRV9XOifuCl7QoksSnzLYeTvx9pLx81zQfJPIGuyJ2R1L1pejSven7FQtXKvjKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(26005)(186003)(2906002)(6512007)(38350700002)(478600001)(86362001)(38100700002)(6506007)(2616005)(5660300002)(4744005)(8936002)(41300700001)(316002)(6486002)(52116002)(36756003)(6916009)(66946007)(8676002)(66476007)(66556008)(4326008)(83380400001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vMhrtCq8Etc88spWc4mldPn3py1G8UNYpYVDOiXhBmzV8AAghQMcXkn9jAkA?=
 =?us-ascii?Q?aCzLItmYSEnwQew3Spr/q+6uMIzsB/l/4paw9wSwUxr+S7YHa1EWz8FbhrWb?=
 =?us-ascii?Q?Clp/QB7PBz3g5+7VhwazGHO7rqGg8smEadffaOdOM0MUzQL3jgFAG1hnq+9s?=
 =?us-ascii?Q?SMxRmBVW6OWftilv65/+4l8y2SIXgJbSypdGRjBLI5189AYh4wy6nz+gwdqU?=
 =?us-ascii?Q?XQxA3xBsUP67zTvqCkCDHmm7VlSy5JhvXon/NbiCTJGERn6zaIu3emCzraTD?=
 =?us-ascii?Q?pV1u7k+yAgzubp+2zjfnv6Cdy8l+4oQ7O8wPDJCEB21UVc/utweIJ7gxadgc?=
 =?us-ascii?Q?oGye7/XGV+PPz11dzZBNB2JxzzRbtVFQjYkQFb88lMAQE1CvauQ67R3GDSLW?=
 =?us-ascii?Q?fwkufc41rmNDntG9kc0ZfLHDaT0IEF14H2q64VHrdVdBFMxHtKS0UO0qA/7V?=
 =?us-ascii?Q?03o1Zb4aIrBhnOA07uKJlJLfDMhYyTxoYfKgrJFRp8XKEIKk7Fc8XfSoGSGR?=
 =?us-ascii?Q?zk8HDy585Zoh4vJgcG4FJSBrX5IjPggL9g0Mj6IeP9GVWsOhzNh5ynPXPfB6?=
 =?us-ascii?Q?82nzHaViJG0B+U4Xzkz0sQbROqfh+MaCbzVHUkHDcI/lTychk31lOCLIbEMw?=
 =?us-ascii?Q?fYO8BXrOvHaUVS8fjiwVaN7YICByc5I1OcrHH1zZ0DPXkO5IJ6TuJiCyluRh?=
 =?us-ascii?Q?KWa89ZomTM5v+3Uug8TLmnF1ZoMQRA65NfZKXY8x6GwO7WsWLyzpUqbXJEfT?=
 =?us-ascii?Q?CdxAJMTZvhTICdiCmvlMxDJGsVXXWxNaLbbFNIhjSLQcorSF4BIP1X+htyY/?=
 =?us-ascii?Q?OacHhdmZ4myubfdpORS3JJPSmPTWXddBNM2DTlO1JzflNdrV7BCfJjapDbZw?=
 =?us-ascii?Q?johDo8eTFYGDgsPPazT/9eObvvhNAmKdS74BiWTmCHKfF8+k+mn+V6Yr8GJv?=
 =?us-ascii?Q?LGQwaZ4pFFW5xA7Y8oQ4N/VpgkAbOlJjH6pzd3YNfFLNdvHQraiDJUxJY7S7?=
 =?us-ascii?Q?PQ3/8D2tUL+2Lv4C7yEK1PhdZKSEha43vmrqPP8OJVaFNSuMI5mYSTeuM6/2?=
 =?us-ascii?Q?jclDx+oaM9zgzDqjUOZ9+bW/akxYHYh+Ct3uRPBevDO41RdqjIC+WSb3FR66?=
 =?us-ascii?Q?S51y5J4bjEj5sDzZx6n149ILGKwhOXqs9xf5KOV2T5yaeQNalusKvdsjAstW?=
 =?us-ascii?Q?8kRwqc5h4Niqw1U7byE96tIj3fwJj8/gFu8dOVzjc/yIw2q90ho3BGS4XAnc?=
 =?us-ascii?Q?hy9HVwzgSYx1teC+/RbR6ZfGPUPdEU5ImtqVdOHKBV5NlEumMH9D7DlGcKBx?=
 =?us-ascii?Q?sfMERNSjEBmR25U/FQDribcgU3e3SQn+zyC8XzUCjIGNhkZtlacLVx8iGpCY?=
 =?us-ascii?Q?oNXTRM7oKet5zhDNYdrzj9AOajzvWNy6wj1Nzb6YBS0/0asr99Y1wKuynfE4?=
 =?us-ascii?Q?db+77AQ/TT4YgkicfG3N+DbypzQY/OUpY6oBGPN4mpc9SchNM/K6LDXDTjpX?=
 =?us-ascii?Q?iuh9DJHPNo/rZV1Bd1kF6YhzUQYIqra+vr9Yl6V+o7cpurcA78OVhsvCNotB?=
 =?us-ascii?Q?Uql2c1UAojSV51FwoZU6Nyra22U93gf1ftK0ofQPSlVNFKgmE+z8KwmrBjB5?=
 =?us-ascii?Q?wILUSZgZpZzhHXzVPmRvfn0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 850c1a66-f9bf-4e31-b582-08db0d59736f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 00:30:04.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MOhy5oU4NS9A0RZwvEynUTh5AiiJ3aWJn6X2hVlUVnBttDz7r+pdlft6pn3asCzWPQKy9BhwRp5qQK68ms1brwjvvXw4Hz3tRyyX+ooUTtvXPSiQOtPU0OBkrSYWpg3U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11281
Message-ID-Hash: HSTLHVPGPU6DVHTKIPLGDQPTH5WZHTIW
X-Message-ID-Hash: HSTLHVPGPU6DVHTKIPLGDQPTH5WZHTIW
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSTLHVPGPU6DVHTKIPLGDQPTH5WZHTIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Geert

> > "move", not "remove".
> 
> The point is that you did remove the common
> 
>       clock-names:
>         description: List of necessary clock names.
> 
> from the top level, and added two copies of it under if/then/else.
> 
> Please keep common stuff as high up in the hierarchy as possible,
> to avoid the need for duplication.
> In this case, that means:
>   - Keep the description at the top level,
>   - Put only {min,max}Items and items under if/then/else.
> 
> I hope my explanation helps.

OK, I understand the point.
I will post v3 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
