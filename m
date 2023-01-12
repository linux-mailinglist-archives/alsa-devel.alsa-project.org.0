Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7266875B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 23:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78507836D;
	Thu, 12 Jan 2023 23:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78507836D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673564074;
	bh=IgXGNASBtMfcc1JDsG3WMXcI1L/lDS/wCWMQLIV3ieU=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=t9DgxILD8onJ4G6IvY5Zyowa09oWW241n9H5KNwPQNkzh63+iwl4/fg4R4jqdXOnt
	 GnaH4ydZgjNeX5YaJuDsXn/mNCp8GftkVfVzdLn+Hnw4pvndJk4UuQaOwlrvN4StiF
	 S9uRYtmlSxf5lh9uh9JZYmrhaV+qIWWISk+wM05M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBEC0F8016E;
	Thu, 12 Jan 2023 23:53:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 835C1F8019B; Thu, 12 Jan 2023 23:53:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A198F8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 23:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A198F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=J86aqvdJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBkt2yLOH5sYN6dbeutvv5X1tWzRs5EHaelyZhqmesojw5fr4nnk5dDTD9PPime36dNC8D1p0IVLiyJ4A3EuAyNhOxV0dh7ifMLo+2I2oHtTwesuBSev9PqPtaLpZYbN0vsg3N0X5B+V+v7988HP+SRWn9xb5f/Av42N2CulG5vvQxT0bcnigbFPcdVxjQVxE4fTbtCBREyijNHQ8Jrig8PsfgCCpNCs4vZ4gpirwNZ3clR/x498m7SYmEMVorX4zWLYsBEU+B+mTOaujBP8baz7VkoA0flPvRpXL4Ch4oMSvCiXOCVcfj7GQWLUJLSIr/sUskfGwnfXzE3iGLHzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41M+aHf3lKZjV6K0Glyqf1g2QwGyzenQ9HBzDKbsuWA=;
 b=f3FuuyIizw75uP+lYa8Q1kES/jKARM8KoEcXQ3XB/Wsb+LjTg2sH/ms5eutlAPBw9/6seGjlsgpiYT7476tRUGj3zI/sweCZP8o2yADed20AwWxCzNPJgASD2tdn54ntCxWmTepWE1Xi/wE4YBoIMS5fTbytbR22B9TFht5Nlms165WLbJQ5BqKR2itAwaQgAfM0E0w2umU/kHoYJVOE5wXwfEWkFoU2jUlqnDlQeETJMTIrohxL4wL6PIb31VXqEIuMu8T9cKc6gx5i2daZZoAR+A/nCmkmIHettGYF6wBxl5Jwkd/RK2q4Kbj9QhpWiG9deqq5tvnmJRI1kQ64bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41M+aHf3lKZjV6K0Glyqf1g2QwGyzenQ9HBzDKbsuWA=;
 b=J86aqvdJ+qs6c8VzKAv7Pvdho1ZBWkf74gRWCFg2uKHix7JjbglE0IdcsF8sSjIm4FEPiopGi+JzUB6TX3hn4dar+/tjDWbb3FDZLY/+1kJXjAK1gZRKnb9v+UzyO/S8FKFeSxaR3fwo2cjlUZib259t9lZs7dDHpiNjU5DtM4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9750.jpnprd01.prod.outlook.com (2603:1096:400:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 22:53:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 22:53:17 +0000
Message-ID: <87bkn3bc14.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 11/10] ASoC: dt-bindings: renesas, rsnd: tidyup rcar_sound,
 src
In-Reply-To: <167352605035.3051151.10083276065810564823.robh@kernel.org>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
 <878ri84lc6.wl-kuninori.morimoto.gx@renesas.com>
 <167352605035.3051151.10083276065810564823.robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Jan 2023 22:53:16 +0000
X-ClientProxiedBy: TY2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:404:56::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: fa10357b-2e2e-40a2-6138-08daf4efcb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3R/BLockldzl8++ywzR9JwiTE3ycJPTKFSowZ1Dao5N8/14qu/I/3lPbxdAqMXQzOZbihKwTaPc3GeEpBkXYb9idvXumEh8jPkCZHJ5yUTHAnZRXCDTMVvF2uQ/ORLqqzOcGuWRDjzqnqABs3WhYCZOScVHxc1tcRjtTnUmuIyMqp40u5i5DXqE7nV2xZtPaM9PUyVsJ+bOIT5x6Sul9d1xLsLwq8/+rfRgnnhq8cHiHOdEqULxnD/7cCDmZaAUisDZIqgMRNYH1BUaf9tduVKFvB5mCnknJ1fEpp5cX7liEOPwh5JwPwYsvgI5H+nHHGfCKhbmLe2TG4z+VmChblsCvDJXlJos5Eqtuxozj2BPPNct9sY4+X0wmLDtHsDzy3jE6F/Ob+XMpS8Yb95mXg7vG2ZrYMnpbhRtlcg3Oj0kQHvKCxnA6OFnRuTcsi6pmiOlXlSqKMhXlnM6XxGA6/rgqG45MOEcoBAZ++2pX6oHBZCCtgrBxbuvvjNCNCOb7J24mRtBiME2McTLgt/R5KtYfoeLfgk51YIu2bUbqB5X5tovARUDMQKrmtOpaqOKtlQXbgiId5j5COiFUwSyYn5Ifpm+XCyCcL1RXFouOLaCTzB7LfdiM2sUuKz8KxBolNTqAu8RTQHtMSJ5G/sqx/2qQBPjiDAgirBaPBFvUgHNHeaW0As5+Kc9dzb1KzxiWhcR9tgYocF+iaZlwooYEXLps89YH3o9nR7V/dhrLjQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199015)(2906002)(5660300002)(8936002)(26005)(36756003)(41300700001)(186003)(6512007)(66476007)(66946007)(66556008)(86362001)(4326008)(6916009)(8676002)(38350700002)(38100700002)(45080400002)(52116002)(2616005)(478600001)(83380400001)(6486002)(6506007)(966005)(54906003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TUn4leDq71uhj6ef5VW2i+2N5sdnD30/oi4YtGSgnqPkvyyVPdi/W1M1OAw0?=
 =?us-ascii?Q?jWyM+qQzIq1rvRYG0Mj0eUOxOlaI31nabxgD7eW11zp22MfKrlwFwMv9sZiK?=
 =?us-ascii?Q?+M0+nbEm0h8evxq5IX6z672JRPKE9ixa8vJuA9uMiohX2XlxgMCwcpjn1q4h?=
 =?us-ascii?Q?V9oYBdIpIY1SjdsKy6ou7bky7mLlDGTgsS9q3TXnhtoPjSIyZruiK3DLDaUS?=
 =?us-ascii?Q?AN6/w3u1SxzZN5EAp9ttzwRCj+UmvsllfpTy7U8uc3YHJHe2eCewvuAY1HoP?=
 =?us-ascii?Q?hG6BbyazT2Lhc0U6S/D2WGEfPcSUpVlzRQ6NabuhkJyHi/CnNxmqbfOwIO94?=
 =?us-ascii?Q?0KcPm29/chYpYNb1XELb7fwOd2qpAdRW0kd5yD4kfIc8A44mDoZlBUoK3rb2?=
 =?us-ascii?Q?cfH61YQUiAkn63otUj43/BQYsUxWiN97PHTlUIsR4oPcKBqavZi/Y7xcVDxA?=
 =?us-ascii?Q?OfU+yZGnQJmLsYY2JEjc8y37FsJuhSr1nC3ibI96p9TcNAxvQ2MXYgLBLIEA?=
 =?us-ascii?Q?Qs9wLODQRI3JX4MEaMqWARSJcYN3Vy+2GLLO+BAsXHRlkUwIaA7rgA5522j7?=
 =?us-ascii?Q?GZpAAmdwPRVzpe0LXre6n50bS2ZYJzNhdQs9QUr84L9qlDfYHlxfMW6WHbFU?=
 =?us-ascii?Q?wU6ynUqVp9dcNF6se82LQhMsomMbcPFlwqgbzIRRA2sIpXfmr2s82Va6t8xq?=
 =?us-ascii?Q?sK7eUQEEoFnweNL9k5zCbJ94uxTB5fSedZfMbyn+L9ddiC8JLDJPo1CTkwd8?=
 =?us-ascii?Q?gpuwjwE1kls6QTz87hTJEhAEjUJ77x2IuSj6DER4pEFQWyAK/IFQZxdHF24w?=
 =?us-ascii?Q?vFtax7WTEfBSOW+ZI9xgclap2VLWUricWVl0zD4Jy38FyAX60rQy2uddyI5j?=
 =?us-ascii?Q?e93YEFFvgxnHEftWI9mdx6p+uhVHUsh/E7u1aQeKQD2azhAuA4KJBy5cEKdp?=
 =?us-ascii?Q?Hu0juhhRVkudrmATvN9lysHXFEE1kJ/P4Ct0SedePNys6egG1i16a3EEYPu+?=
 =?us-ascii?Q?hPhS8+AFerUX93ufov//aR6WGFoU8x8ppZgkAXKNsl/KyhpKPgePuFmz1TrS?=
 =?us-ascii?Q?Z8MOLopj67paykdQwgqqO6v/OrYY2BmRC1A0IsLmThuksmYAcStnDvNQ+yeU?=
 =?us-ascii?Q?ObfjEPtBv/dPpQQHNgQo3o3+XuXVkDb6sy9x+k+kktbIpFl97pDO78FZpnpE?=
 =?us-ascii?Q?7rlOvfnUlu67SH7Dbv7tHGnQ+TJw/CcDvOOhwS33IM1QJrMdSA/OGcoui2an?=
 =?us-ascii?Q?ZqZijABUUkGjraU2ZRodkHOoXhQyXgjr77vIsIBHgDocHMR9Nr6/xUdhBRSC?=
 =?us-ascii?Q?utAap2Qo9+23WvUi1DISYGbIZaLiXpX9UeRDaT5F2g32MsbPzRpJClbBHP2N?=
 =?us-ascii?Q?obafPptjs8Qmi3HTdxxLPTL1Uq9O43gcpQ5DYkJoSayRsSkAgzGBAA220k+N?=
 =?us-ascii?Q?dJmCTCLabLUaeTz2v/AWILwF9/LuiQ6yd/1ldVJK3zITENVLMr4CJUAOxgKd?=
 =?us-ascii?Q?TC5pA9RHnZGZeON3id5ZtZA8S6owfXGk3nWH3O9FCEExJBSSuY3TMSELnXq1?=
 =?us-ascii?Q?8cvePkxRwSw1l1coAQKS6loGfiDqBMbN72nRg9xaLTMHpQmKT/gMoQtaLzih?=
 =?us-ascii?Q?E+z9js+0EwsWglONX6pjX/c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa10357b-2e2e-40a2-6138-08daf4efcb1a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 22:53:16.9461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tTO2KHd4eMHrWLtp6cGJJo0Aqa4pAHyo/OkQa2LEdproBhJgLQL+UZHf/jJNKLOe0GgCHhsXiHiotho3SyqApsVxAEV9uPr9DIr+DYggjrlWBnsFCIRPotRKLEiquWp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9750
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark, Rob

> > Some SRC is not implemented on some SoC, thus
> > interrupts/dmas/dma-names are not mandatory.
> > This patch solve it. Without this patch we will get below error
> > when 'make DT_CHECKER_FLAGS=-m dt_binding_check'.
> > 
> > dtschema/dtc warnings/errors:
> > ${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: \
> >  sound@ec500000: Unevaluated properties are not allowed ('rcar_sound,src' was unexpected)
> > 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > 
> > Link: https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F167344317928.394453.14105689826645262807.robh%40kernel.org&data=05%7C01%7Ckuninori.morimoto.gx%40renesas.com%7C134cb1f3436642e9441508daf497aa25%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C1%7C638091229473457624%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=0z6yVah04cE%2BdpCxMMPdL4mJhICUA3HjecWVxM3V2fY%3D&reserved=0
> > Reported-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: sound@ec500000: Unevaluated properties are not allowed ('port' was unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

Current upstream has 2 errors on renesas,rsnd.yaml,
and my posted patches solve these one-by-one.
All errors should be gone if you added all patches.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
