Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4631D6505C1
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 00:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD2A72A1F;
	Mon, 19 Dec 2022 00:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD2A72A1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671407316;
	bh=iSbMWdzXlJmVtIjkchkmLr/MEykhEy7Efh9iC5LhSkc=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=n5t8xUFEsHPwT9pwnFcPrCJ5qoxpKamqOja8eVrZ/hERrCxfeGNgAgCtCE0wg9H0O
	 mhsXxDv9By8svk4nGCNFlcACjIOiFQLyr157xn6lTFi9hmtTcMN1YsYb483SeS0TuN
	 Enoh131quCrqHcRRQvqzfGov/WmJ66TYwSQY1nx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4920F804AD;
	Mon, 19 Dec 2022 00:47:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5896F80496; Mon, 19 Dec 2022 00:47:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0647AF8025E
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 00:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0647AF8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SvsyuXsi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEtUwnKvCjgaJOvJBNlJf61Lq9mi98/7wwhJ1zugaqIdAkj3CsgPAsfxEQFprL9WefkSTXt20kCTjvW5DL/oXi4LdasWJY80rSdIOL1NSXq9vYqq/y5kVBQYTdRdDvVDfSKn+0UEa/jYnCUxQerML96LE6vIlsZugj6CUs7AnuK9w6SOVoRgveJ0k2+/VTIXYcKSPKmClkPreFDka8xB0srgbqviS5r/jgsBukX2IaHbrsjtMn9UBABLIAexiF29Siq4poHMR5ZRuG8Nci7a5p3MqqQI//L2pCNJ1SXQ6uA4UPcILDcISk4RSVtMP/cR1+FdJWqkLwRdtstogwekXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+DkKg22zV69BsN7srCv0H2ZBbpBhrqTJLvCWtokjaw=;
 b=RhuFD4HrgjgAU1xVJA1nXdk0kTU+camle5JB64UUVF/ltaEvW6eRBekLRCFurQmRgY1jJ8sBz3rOCRxxSDv1ZW6s7CzeK/b1h4/LboKYcm1FsydtOR27+KcnQn+5NXm83zF9XWkzQ0CtMhfXcvp49ncexgfkWEuClZz4tymV4RACo6YMvadxlUA5rBWWc+D0FcGQXA6BoRN5ifdOBSHv7WYBJR1bf0C0+65d8stJWbDg8ynxMMlU71GLM44Qhsl2OYa6BRoRlv2Ihu4NKF50Hrp/oKAiklyN9ukYWvEXYdhJknjnqV1jEIunDdocrRDwPnaalM2A1nH6PsX8bXnyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+DkKg22zV69BsN7srCv0H2ZBbpBhrqTJLvCWtokjaw=;
 b=SvsyuXsi/M6C535J4FY1YH63WIVNHhvnG1QJ0OXmywHKK9TA4wu/ne9T3azIZ/4D+jEmAZ0t1azR3Mxy6hF8ByVA96Jo9Fc2mPrQHCd5s5bxOfu16ls6FhZMSpI2Eibl/zAZnSCIXJMYivGqih6q4C1nPZy7Nl8ctycR/gz3it4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8176.jpnprd01.prod.outlook.com (2603:1096:400:105::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sun, 18 Dec
 2022 23:47:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.5924.016; Sun, 18 Dec 2022
 23:47:31 +0000
Message-ID: <87wn6ogtpp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/11] ASoC: dt-bindings: audio-graph-port: add clocks on
 endpoint
In-Reply-To: <20221216162014.GA2839409-robh@kernel.org>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87pmcmpyml.wl-kuninori.morimoto.gx@renesas.com>
 <20221216162014.GA2839409-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 18 Dec 2022 23:47:31 +0000
X-ClientProxiedBy: TYCPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:405::32)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 7605ad0d-ea93-41e1-c3df-08dae1523ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4Sj5MVgvLcW+nbhV+Sga3y5Ic6i65VFAmiGomgNvTp++xct8owzS7sQMLbxGZNQWzlI+0FDzj+bK01GjMiZ66ArYnXyXSzwqhBk3h10MIFqAgYn2UkZ0fhKbpUxWILqMiR2Fn0Q9aCjBWWcnrvLMFPpTXUUkarBTm7UpT0wlLBMgrHLazK5sdo2uKyncGn5Vc1YRae5CHPc/QF54tPT8Ru5C/EN8qgUvVUmZPaGwgvkDdckLbSxeCCNHCYeEtxgpvg/2vQ2+Z8632zNeFufBts4I95+iDSuPZED7Eu7gkr1t3CPf5SLqMGfm+dQjIIxLtk4Lf3JoqEORsJ8KVWNSwSqMYcfZxwInr60sZyoy9zz9fUqFcb5DM8xA/zw8oB5vvQBoSrT4u9gHDt1nGXKwR4J5wnN1hsdUiEyCtCBVcuVi+mco8sXsJlpr9dH/Bz0ZyQY1lrYC6mYyxrGx4LkYabyFE9V39OI6BAGBlzchinqxCK/xMdTsRJwkfZPzMLqREcIE3yV2yoJ/kts9PCbl/T0KH+zKlp45NyfOEZNcGR+S/lN9Q1RBB1z/577KUp6rAgw89Rj0Dnmb82Ish1HQwtvhOZ56yJJdDIo0bMMLLjFq60uGPEfscnJwNvRN3mxY+pCqdd+y6ha8MSr/fuqwbcotrT5NyYjDunb79duM7mWU9GmAqAUMAm0M6gBzwFq/Bj3vvQZ9bsDix6XihACqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199015)(8936002)(41300700001)(186003)(6512007)(54906003)(6916009)(316002)(19627235002)(2616005)(36756003)(66946007)(66556008)(66476007)(8676002)(4326008)(86362001)(38100700002)(38350700002)(83380400001)(7416002)(5660300002)(2906002)(6486002)(478600001)(6506007)(52116002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7umtazvPaU6PCPZplKZLsGu5W08m5XVsEUCjwSpbogwdlzBcnvuqIBBq47p?=
 =?us-ascii?Q?wqxwBgN2yh8XY1nLIVcgigTD/zttWEEkQbnP8uJV9PnWWFfOCVRQ/wsW07aX?=
 =?us-ascii?Q?P+KMzD7AtconHn6n4JfrJ7xNOUCshcQwW4NbzU27xPvGfwVPHXyEm13ZfNZX?=
 =?us-ascii?Q?F/jM1AUkeuwH5QSrjSn3u/J5kUnztHBBO85BpqL30m7CR+RZl2+2Dv06AT0j?=
 =?us-ascii?Q?+bomCaDD2M/Ajv/7AoMZn1PFWPIheA4P2J7h643VY9xPu//Ng1Bjdg90hgFz?=
 =?us-ascii?Q?PSxEKthnKaMBXAkfpazfSEXSZjz5aAyoOT+gd0CklYyk/rtCnYkZFF0oPxmD?=
 =?us-ascii?Q?rwU/wLWePOGiZIQrZ6KX9Vruziq5FUr5i7m5cDxVnqxSE7WWkagx2GnvC413?=
 =?us-ascii?Q?h13nmrETYTtCUlZVB4N7jL3T1FvC4USCmk9DsziZiB5U0jMFcnRrQW5hDCWU?=
 =?us-ascii?Q?p0NNZSPgcuV6Qcag9gilgLfqwSd8XwGP/t98VPkM1BxUJq5AOK52xPVbEkrj?=
 =?us-ascii?Q?3gAiG2cINp8yCd/YAmNKjn/QDwfnXIpxem8YjrG7StK7pIlgIvcZ/3XWY0D5?=
 =?us-ascii?Q?gOPNPaioUJYlZyR0F1iXYL2NhPFAWY23A+BpHKjubK/l6wE1MXG1z1Qdfrwx?=
 =?us-ascii?Q?tb1YiI+fvJOaQtX9FwfWfkwDMkLv/2s5t96oiVmglnPAxqhEME3Nd6xcZ4sL?=
 =?us-ascii?Q?EAryDpvw/eYX3XC6w3XmsrUIaQp8gUNjLF8izpEmQ0JEuC4YGwB5yZ8Ig4DG?=
 =?us-ascii?Q?/K2KWjkJoIasNWgtslK4VCFmtvajjh6UzerS5gDrBEzHL67Sl8V20+AYz4t/?=
 =?us-ascii?Q?t66uMPSGEADKCVpydvLG0FwmAXLGGxPHdiHH74r7/ph506bvTK+9LuW76Dbr?=
 =?us-ascii?Q?0fblG79n16tnPGRugqLpWSARFXe004QNfHnWy94WFXhktNYTn7l+yRTOtrgw?=
 =?us-ascii?Q?Em1aHO/0FPfkg7A8X8iCm61hEnyvZ2eUQpjIN73fmTeyAzaBauH9zz9ykAZj?=
 =?us-ascii?Q?VKn5tbZ5oFUldEU3wubWls46moS0eF+5TDFD5FuH2gzTYOutyFiF0XEPQg3O?=
 =?us-ascii?Q?EY1aOqk6eheleW1F0y8H1rkBxIgB1UH5REISwt0jMT9xua+IKWXDrol+aATz?=
 =?us-ascii?Q?GDJ4MtVcHhU01ZgbP3BKfP9X7BV/PPLoSWwImzwYVlX/slWJyXCuwwb7vUnO?=
 =?us-ascii?Q?8/z4BGRS2Rzk/95Vj5/ZUKUEl31UiPLYuZMGEDQh1psAOqupEbcZ2J8SdDTY?=
 =?us-ascii?Q?n2RJjYNHIOqAIs4EaRTCK/ey51Bn04HXyIhzCCO0zrnPzD0S69qx0LEsJ3Wh?=
 =?us-ascii?Q?pU5GOTR6k+ZHbr+Zuszc+/hkkWOduGxnAKInKUBWGymwyvhudp8qP/wazbLs?=
 =?us-ascii?Q?PjXNKT3ZVgBMh7b1xBgXSSQ6K2HCoVt5BypJoXw0EgGJgXWRQO8awRAyyjJq?=
 =?us-ascii?Q?VuLn/C9FPasZ3ed0pS1h54AcABSXLi5xHoauG+EIbduh4T+5DG/JJlU36GMN?=
 =?us-ascii?Q?B03UWMsGp3cO9oepvJKQQQXZzB+SOckr8h+mHSMfpsuPqMpxjVSAxKmpZolx?=
 =?us-ascii?Q?Q9g3uJkvzS0tye9vr95vgW8tSN7iAIPnDZcogU+oJt8tF2D7vQ0I4t35z3Tf?=
 =?us-ascii?Q?mqvTRAJud4bEibHA526oHvY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7605ad0d-ea93-41e1-c3df-08dae1523ac1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2022 23:47:31.6628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeAPtzBJU4eSOzI69K6iSz+yKZuVVUSZxur06dlj1BPPgSryyXM5JgNrKRwHH7RUGHscpBySg0zLrmsDamxFzC+fgNNZHHNuCkZAEyzOclJNtp/4t6G2ozN7Ag3mA0cA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8176
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Rob

Thank you for your feedback

> > +      clocks:
> > +        description: Indicates system clock
> > +        $ref: /schemas/types.yaml#/definitions/phandle
>
> Is this the standard 'clocks' or you defined your own. Because 'clocks' 
> is not a 'phandle'. It's a phandle+args.

Thanks. I will fix it.

> I don't think we should have 'clocks' in endpoint nodes. Or at least we 
> don't want to endorse more cases of it. The graph describes data 
> connections. The only properties on endpoints are properties of that 
> connection. An endpoint can't really consume a clock.

Hmmm.. but, it is already implemented.

> > +      system-clock-frequency:
> > +        $ref: "simple-card.yaml#/definitions/system-clock-frequency"
> > +      system-clock-direction-out:
> > +        $ref: "simple-card.yaml#/definitions/system-clock-direction-out"
> > +      system-clock-fixed:
> > +        $ref: "simple-card.yaml#/definitions/system-clock-fixed"
(snip)
> We have standard clock bindings. Whatever you need here should use that 
> instead.

Audio-Graph-Card and Simple-Audio-Card/Card2 are sharing the code.
So, simple-card.yaml is using "definitions" to sharing it.
We can avoid duplicate definition ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto
