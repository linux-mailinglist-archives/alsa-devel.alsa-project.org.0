Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2BF533591
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 05:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E916C1669;
	Wed, 25 May 2022 05:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E916C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653447851;
	bh=YzBXzP6q7Z6v6+xtbDR+JBlrCLLudmA0dOouHICzjb4=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AYg2pkvCMdWy6r9bfIQwdxBJhVRvoww9KVwf4KAml0ot7EbU70YNRlUHndzZvkcbq
	 bj/grmhqQ48dErd7wyJ2FV7m58IkIQDdeAlCpmMmFie6E3PXDIWZmJSHCyFIM+bLSF
	 Er3jPr78r2PjGvkH9tEVKAKQol1AebomTGxv8xCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AD40F80169;
	Wed, 25 May 2022 05:03:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5EB1F8016D; Wed, 25 May 2022 05:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B0E6F80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 05:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B0E6F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="nGVwfF5g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdT+If89gAGKlmxrYTCmneqvCCDtTmmcrlDlY378s20HNaF8UOHHd2xAoLg5CJPkNsK+vLafsEEFpAHOrmpxmQdO4P3GkukRebvgjMmxf/fK2T/baawZ29oDOB0LVGx+Cl6xCU477ABQMBFfvcS2T8gcOwGSp57LmhbI+DB4jHNeAKjrJgRNmyapcKTG1RGAP8HDlDED+bS64lly6BOjNX+bdY1j2nzouubgZO0hGK4lUwNRfK6C1zOj2mXpRpbfW4IitfiJQDpkP4G8BU73XrEk0QZ7S/9GNm0hpTfWWCeWSHeJ0MyZcecBrI3iy1rSY1TR6jvjJAl4cEsVu86noA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1QLKvHILWFQfHModAmcdGghubl4WnpLIy70wBT3JuU=;
 b=FpkY13SNGQFlf8Z1Qu+h0vrT0JOAZNJ3ohf7uRm2WDY2OTpfZYAEXjcEkCTjU1eSA3qE0DCWg5uufC37x4s799neS+P6ax6l7iFFU+YZlNcexYZV/DiL4mApaAt1kwflaJSuPgubLcufw627Z0+f3D1Oaj3S0Ab8fusPGerh6FJd2Jd62xuDxQrOefwITeEvMcGIwOukbURB3HoaMSTQ0r5dMYhFwk2bqvngOW3mbELnSxlykkI0TeArpGb1WgqzAPLdp86tmc3fo7pe5KHwp+VTyujxgrzQvy7WBmcfMK4F/O10Otx3iHWFEVr8aUPZhalxI7XbNmck7z7RhGjrXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1QLKvHILWFQfHModAmcdGghubl4WnpLIy70wBT3JuU=;
 b=nGVwfF5gdM4QsAAHvqR+NMpt5ZOC1bLHrqGa/dFMeGQHZDAo1OZZetIyGfijuxu5UgrgbJqoV/r3mZBg2KJARMP/60kXQM+awzp20pQ2IuTpHQC2MniQN2JB+4HjJYiRKZupJ0lTPPQ+uF+CMZwzQKca7Ti+PDxX+U0agQtBj9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB4381.jpnprd01.prod.outlook.com (2603:1096:404:12b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 03:02:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 03:02:52 +0000
Message-ID: <878rqqco0z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: About Cleanup ASoC
In-Reply-To: <5a6e4f90-7b61-376e-8f50-35f2a7dcf8c5@linux.intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <YozcfjgvFfQa/HxS@sirena.org.uk>
 <41033b5b-5bde-10a2-70e8-aa7482992235@intel.com>
 <5a6e4f90-7b61-376e-8f50-35f2a7dcf8c5@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 May 2022 03:02:52 +0000
X-ClientProxiedBy: TYAPR01CA0117.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635edafd-7856-46be-38bf-08da3dfb0f0b
X-MS-TrafficTypeDiagnostic: TYAPR01MB4381:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB4381999475BEBDC6123F4F53D4D69@TYAPR01MB4381.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPOwXRlujbOaqkjzW48oqAAsJ/6V4ge5HNT0rejdYE0yzvYZhklWotyzBD6j3ib5tW2BnrqkZofu6NGuvCL2jA3O834h/zPhGjIHkdUJB67ODX74V/oeh1mcpkPddD3jlho7OIdX1RbwMN7BySRILTrJyd/9VjsZQa3R0MtE0aKSHT2Zk0LCH3CYG71B8icY4B9b26Xe2cLngcHu2sLSRzJdvwas7T261aepcbDlF4xwQTyp2r8sL7mzm5gNyEcVR+PeMNvyNekermunDLqUw4V7/Y8bQX3XGvfMfAHOLkTWqfArKuLQ9kWppBPndPQni2d9LxnC48EJ0B+sUEyVudmhDdk3d4dsLtIbh/+u0z7MlHEAfyXPNoMgeNNxTSKuYl4h/ivPX4S6cLTx/z///Ry+HaQjtEayfxmSwmfLnRnLhrBG1yvO7t3c5XLpcDn4QLaVKMh5qfTP/awKSaUvNq3XWPNMTnDc/6QvvjoQSqjNyRD0tAAyVrmFNYg4vjxnwGXPxo/vyfMl8JPlNgTg+pNw3ZF3NY1yWU6WohXDPCINQdVwCy0VKN9W+19VbaxkSJ5yq7x93c1f/qvpjpHRYED7+ZrM7sLx9ANTvnyYKZS7c13zoYDuv3xQ+qundB94jYLhjv6Y+akUG4oMBTQM3iB+5SuEOV7D3m3QRFowJg1CTLxcszSaBasaTMf0F46FIs4PhqdxjoM8TCyROuHstA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66946007)(8676002)(66476007)(4326008)(83380400001)(36756003)(7116003)(2906002)(26005)(6512007)(186003)(86362001)(52116002)(6506007)(6486002)(508600001)(2616005)(8936002)(5660300002)(54906003)(3480700007)(316002)(38350700002)(38100700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KR2L0IUmfSCYKIk8BmSSF+1557yjgaMXTrAaNzKR8ntK8cHcOKqb4BWGo5gX?=
 =?us-ascii?Q?wADrut2/URf4CcO4ZqIo1KUjOgGTw6jWyDoCapmj3Umzz/NtvPGxn+JdU377?=
 =?us-ascii?Q?IcXRmnDIvlONC4K68vOoHYtvH2MmtIdM8U/Zb+YFGzeBWnX2DtJHdc+f0ntK?=
 =?us-ascii?Q?PLp6hrXOrx7JUrT/v3YTwjta/fKADtcQGiHW5TTfL9LEHdusbbAQcccvhHxh?=
 =?us-ascii?Q?eTMzQ75GoXejuMbgqjU6O4XsH2U6RoRmS7zedBtKDqxCKyzACIiTIlL0zm51?=
 =?us-ascii?Q?294B0psGXZWWkv9U+S0L9Zcsxbp7Uq3aMlVXaOYSGomtXJqW31hPNdE7VLC7?=
 =?us-ascii?Q?dEGOo2AcfU7Fuzw8NbmkyaulIQAnJCQbYYXjHgBXehPQpyTed/Y+lykKSU7k?=
 =?us-ascii?Q?36BO4SFIhobg8oigIe17zjWbxlh8R5BOzopOxUFAqKctnMvvtjMBAVVkoIWZ?=
 =?us-ascii?Q?tux/7L9bM7UmxEgSRem04hWZvqp2ZH4GmvH0TcsiE/aHZ+gcPPP15TqFKcDn?=
 =?us-ascii?Q?WyXdU3iD/Mxeg94V78QTPoIpPS2c12ilBp/SmTLhq+t2ne3NlIvAiQcvFTA9?=
 =?us-ascii?Q?bAv9GHlD9A/ydOYe/qxEMz6pIfEoJD+bssLrcp6fAW+PVZ+U+iB5Z4l4nVIC?=
 =?us-ascii?Q?yXlAEl0rcsBD/vcvRafYa1JfgVJxZxf3VqSdnUrTEQXZqXvdfMwMY88wKa9J?=
 =?us-ascii?Q?l2EjddyRurze/YFTu3Z6EOlGNdyMPFeJ7jI7iSeJOCPODpP7NLUuz6jd3INT?=
 =?us-ascii?Q?Az0es47MQRI0rklFnhW7OFLjAQlV8+ke8gOuImZrM6z5RQNfSvaeqmDMLmFQ?=
 =?us-ascii?Q?gtgHpV+QC6EHlN/47WRVZPnSU82Gj66Bso6xAtXokO3fWCkewdmreIN//xxA?=
 =?us-ascii?Q?niF17m9CcEqH0smEZSKPOUMgUWG3nUIu4Zy/H5f/WCaEq4qZf91XHJRmlxGc?=
 =?us-ascii?Q?CDJiI+Y4Uz4fa9Ms8LET3OYM5rw1b+lOPQ8zc+HrrRnLA/4D2sK5lfiEcOr9?=
 =?us-ascii?Q?5IsLtTeaIekdel8f0ps/E7wZcgjWrVgwbKAgaoBUnwfAIbV/3Rtj6siMpMkT?=
 =?us-ascii?Q?hR70We31nGiRCvGn9loeXCAPjB6KRkdyaTJ7Eo5iw1wkYdt1lPabY2T3p1OG?=
 =?us-ascii?Q?FUhhJwadB2LNy0TdsZSqOuIwjI2utKdt+mXMwX+EP1pq0o3yR/Ku97I98NOa?=
 =?us-ascii?Q?qf2/iUfmTRvXUfX5RuLr4eFDWS6IW5z45wIuScOKccKPb+mjnR9MRpYfSuu8?=
 =?us-ascii?Q?OwEJQgGEhbJNVUzermPQFK6XXJnsHFald0wedlMaI6ub/4DrRJ1kkP6vh39L?=
 =?us-ascii?Q?MBmHLb0ze9bXe5ITekWmOUU0QpRQrc1MdY2pVMyv1KV+vnAzjenqeJeaBZzi?=
 =?us-ascii?Q?ClQIGzA3RXpmQf3bhkgHeVAdy6mdJXN0TTdkXJQBVyIbBwtq74E3CA2/oosr?=
 =?us-ascii?Q?2H87T4Eui1AaKu4tFdn5smlx7YGVj+Azh1f51kjKewkMBUHhVMslfmly5YsI?=
 =?us-ascii?Q?BbBVhWs/6//Fx02zAHnntouidbCDJsaeVWJM6qzR1zw8Mc0aefx7v3+Pdn6/?=
 =?us-ascii?Q?sqWqNoX4JbqVFuAm9SjsK3r9SZw2AUh+tWdHPBA6UPK51NRlEvMb2e3GeDEZ?=
 =?us-ascii?Q?IZvlbvN8Z+cd67AxPb4iznvuypy0eU4uwHaOkUFhTY1v7ocsy0OLmuWJLvDZ?=
 =?us-ascii?Q?VKCJc0pNTxFDFxToKvY4AwDxR1O+kjzwGtgG+FDrXq9ihjdIPuBFkL4eVZ6c?=
 =?us-ascii?Q?fr+ML2KpbAJ/6cLEaw5K7Z43qItAklwnlE/I8g1JXFluoL4eEo1z?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635edafd-7856-46be-38bf-08da3dfb0f0b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 03:02:52.9369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbWIsWnNC2fQUsQN+NUhN2fysqnTbCd6nJehHoXJ9zn35BuQki+9StZjO+6w6I270kEcJTyRPtdb7zImFlwO5tBdxYe/svrkmpgV6fpP9cGyiCsnK8pYYpKcxL7NzmLt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4381
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi Mark, Cezary, Pierre-Louis.

Thank you for your feedbacks.

> > It seems explanation of design of the avs-driver had some shortcomings.
> > The AVS people (like me) are to blame for this :S
> > 
> > The exact opposite is true - we do not want 1:N component:card relation.

OK, thanks, nice to know.
Sorry to my misunderstanding, my brain was biased.

> If you have any data connection or loopbacks between cards, or shared
> clocks, then you have DAPM events that are interesting to propagate.
> Power management is not 'simple' or even 'simpler' to me.

Yes, I agree about this.

> I am not saying having multiple cards is a bad idea, just that there are
> a number of technical opens with strong implications on the
> implementation and scaling.

Thanks.

My basic idea is step-by-step small refactoring can remove limitation
and/or add expansion.
I don't want to have big change of course,
and I'm not thinking that we can create "perfect solution"
at the beginning.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
