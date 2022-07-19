Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89A57AA31
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 01:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22FF1699;
	Wed, 20 Jul 2022 01:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22FF1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658271795;
	bh=yVBBZxIBqHNGb7XYwEHawPwgcuqCxs22xXErqKfLq5k=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nk9S23WNv56GQrfLxADIoXkxgKUss2Uzae0Nj2x7wYRsD0EFKyMXyKMcbe5hhoSas
	 ZdMjlgTcRaa+nygYxC+iP+qXUFsLHLZfafTBtX9zySn0Btvk1UrTIj6nZ4yE98krq5
	 lofL054RWxVEzPJL5WMgAK7P77fEPMizcEXbgknU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E430F80224;
	Wed, 20 Jul 2022 01:02:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 369DEF801EC; Wed, 20 Jul 2022 01:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61018F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 01:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61018F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="ZwY5Rw8X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cI6rIyuGk/zRWK17WLyorbvq4cQE8qx7NzHMs3MphwDRE44Xjgv8FeJKrfaQcVd0xSnPolJZMzTRCXQttcCLOFBSiHMHAbHt2tqLBpvx/Ss4tPXr+FhiNdlWT3w7JRsTJk/g44Vb8E2EesV0nFXvZraL+jH/aVyOWUy/ACKJJNcdrrZXzOgV/j6ylZZiK9WaNA+IsQfVMKATeCYzAUz8QvaTSopSbYYIjKrEF91RXZn/W6taX29aF3WUwMAmeYr/bAqdajeiVh5EOtHBtdFJcB+0Mt+7Y9pqvjW3TaoMR/AqpNWsbTpihNAfWXKEb5Yu4jwsndII1RuvIdDEINHssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kqsSkTZ+HlsWky19j31iVT+jVOxORpCEg7SnLr6a3Y=;
 b=Xsoxn0yHTex+jmcTVa2u0pa1g4nMAqdaDzWmdGozyX80gPUIm7+rWmkWJf8gEgUE3VkPyR3jdeefd1Zb5SWiAWf1PofkhQBwXJEcigNqJH8i6ntBCVk5KS51tkGF0rUg2rI6t0vy4BSJxHVa2VPso1MNVboe9ORSVPL9yKRdacwA3NB/fZG3/BxzGCiNfbHb4Qia/oX+4t3XL1a8iBC3duh6LkhsVjDUofjVd/3NXRAKowAM/ulAGNpCbWATZG2qvy2SSBLg01Skg0km8pCVwxBCxs/6W/whNxWmcHSGgIqKYw6UBG76HmJREt9jY18lN5fm7t1I/tYslhlxkALGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kqsSkTZ+HlsWky19j31iVT+jVOxORpCEg7SnLr6a3Y=;
 b=ZwY5Rw8Xtxpquy2d+SZF9RTwyp0vMyyHq7mSqrxP9G/KimZxukLrGJ4JkIZXCHHX5/Lvv0gd9CrKOXQsVcojSkjmdAzLdGAzlRqSLuizRa3qfFPghsCBY3T8tBQ+DatTtUCDyiGKWBjuBUhMpfvzR2vkPWV4TreVptR8nq6v0DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB7142.jpnprd01.prod.outlook.com (2603:1096:604:129::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Tue, 19 Jul
 2022 23:02:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%6]) with mapi id 15.20.5458.018; Tue, 19 Jul 2022
 23:02:02 +0000
Message-ID: <87pmi03dw6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: ASoC: Is this bug ? DAPM source vs sink
In-Reply-To: <20220719155440.GC92394@ediswmail.ad.cirrus.com>
References: <87o7xloca2.wl-kuninori.morimoto.gx@renesas.com>
 <d7307c80-47e1-ef4b-42a9-dcbb8f555789@metafoo.de>
 <20220719155440.GC92394@ediswmail.ad.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Jul 2022 23:02:01 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e8fdc4f-951e-4fae-becd-08da69dab0f6
X-MS-TrafficTypeDiagnostic: OS3PR01MB7142:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DXdQYLmMkPisu0Hqc2henY521k8d6799tvLHasl3nB443nYSc7Hz24Exj8trtidI/yVcen83SW8Ti3cjfl9kfIc7DKZmFQ+u0v7UIPt1MHDc3VrQCdtDfbXI+wUobvZox/98GmLFrwYW1EIZ3iALPzZcAzXVDKlYAkG8LC+CmugWoP83udpRbNcEU2Gt1KJ3z3aOEeFqZ36m7kqY+46CFDpjQYbhum2j9jpKhALo+uesbQE7If+IeQbjQ5Z4pJ8ORoBYwoLDCzTNkt6vhUKNBBNv0l9Ah9tG99lkSzV461yBkAIUqUsFXW6j/lY9640QPGpwwazbwdaGRHzWJ63Bed3TXtk0ERUFfTrcaIZqLnsV1MTeUVVRduRKJVZ4X+CnsZUXpKZy9nOMS5oY9TvbSqrMkzuB0Bb6HkMW/Drua5x6qF8q7/GhHcAMcWM+TqGZxlswAua/ykG8Ql+Yfa0S2tEaketCGCTItDKOAC9UiEJ9tgaB5HD8gh0NmyNWXl3wVfK6ci0K8X+kApZlCcE0FqDLSLvWGDLMzyEkZWfOdoB5we1sHJRBeBznLlAlmnosRd0+vs13KGQx9O6Jx3lxstNd3LtohCG9auSq+9ANUSJta9IzNp9qywAThnW/G9NsnuKmtc3GyrFoIGbspUum4Je7U/mKf38L2guIZiIFl26Yb0z/3yhCuHGG94D5qVQpDRhZ1MY/mUi9rKBpWcPJpposboIsPH7NqIo4JglbdTibw5UesWrzKCeweN0yHldA32vd+iFKsX0sVLm745E6LGHmaZXT85wyewYgfYkfnrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(8676002)(66476007)(4326008)(66946007)(86362001)(38100700002)(38350700002)(186003)(5660300002)(52116002)(66556008)(8936002)(2616005)(478600001)(41300700001)(54906003)(6916009)(4744005)(316002)(6512007)(6506007)(36756003)(26005)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?29VApVklyO66mqr2lLawzYiGULFum46tEu84QA+VQRd4VRZ6GC2/WVnlQsfj?=
 =?us-ascii?Q?x6s++EO8mNmGHWs+RJSf34kV2nrmtn4AT7KqfgfdNrpE903DQhn6o1PwhzoO?=
 =?us-ascii?Q?Rh2sUpC0tfxwz++yE2HZb5YK/NwdN4OAxZbZagfInqoOGIoxwdCzIBhd8XY5?=
 =?us-ascii?Q?wh6l1yaV1Qcv1qdiSpTzT5nVXV2KqNelsRI0qhSwVtu8z07NbjvDbILxUZY7?=
 =?us-ascii?Q?ty9l2Ag/WXwa6D4WcwPeFQB0zaoDrGzrQXpybUy2Sa5RUNemrVoG11QebnF5?=
 =?us-ascii?Q?bwaZcxYGVeENH/qzzgK1XjLndn7JZlqDkipq57EThin+8GYWSPli6LKsRdlX?=
 =?us-ascii?Q?dSW9g3ScX2ICs9femfgmvTHc7LU71rbB8x0TBwtt21RQ/km01J7Vrzgfhhbv?=
 =?us-ascii?Q?iXLNQNeBMHemqfqpKC8IzAXZlS5jYuQiaVvavoAQAphq149lWsk/Qy6ZEkgB?=
 =?us-ascii?Q?X5aAt+cUmwWEqzflZAYoosuZkkhPeYfdJM2peRu5NXM9pFLRP08gTXBTumVF?=
 =?us-ascii?Q?gN+zb585f45cNYhvJpALDdGQZHtjwPYjhpXDzMIKpd5QqEMQppzbnzBmJqSi?=
 =?us-ascii?Q?xFknnt+nTmgZvvN0GfjubghMJ2wB2H5J46n/B3nsSdt1KCV364BpQQrAxKff?=
 =?us-ascii?Q?F/dNNuwCazJRfDnhrlaOaBX2eSm0tcRXaBPz0QizJPi+42YnFd6n0PUJ6FDL?=
 =?us-ascii?Q?PHE2BYiUW00kjhYz4Va0H+S0jtbzv6gy0cyIHeTpRlX+oJIPMCSePWMxWoFt?=
 =?us-ascii?Q?QANR8BBfsXuyjgiIczMWPTcSwHhB8ZI31azi3O8uO86ErMWXGvTKJSGrGb62?=
 =?us-ascii?Q?fc+4AVdqztTjcgLwK7Xt2Fy6WSzS1svG4IJ2tIBucJsMOyhrsLClwxTie/jq?=
 =?us-ascii?Q?tetbd/RE9vVU3VpPrRv/kGe0N2DE6tPkd0+AOf8s8/eeXQN4XDJCDZPnXZSC?=
 =?us-ascii?Q?aRBOgTQedapt+MpRY45qtc3vWisnvtF0o9W3aiAZOYl9CZJY1tA8RmMjgG01?=
 =?us-ascii?Q?rIwwf9aOrkOuU4DtCHs1p7HHaLvByRartK2dhIEQYOi952NZBxMtUzGzBhzd?=
 =?us-ascii?Q?zoD6J5Udx0L+vqgw8B+ElDE12R0hEALGiDxVuHIIBleMq6VOpdhC6JoI6cG1?=
 =?us-ascii?Q?D64C7XEeUoZ2tegflFhnQSJl03YPY9taPAICAgN79otSobdqSBcW6NAw8a6u?=
 =?us-ascii?Q?s2SrYLm3MeSOrThQRmq2BwxkKAraPTGVGuk4ciVBknowkSaYiFxQn9SiJohe?=
 =?us-ascii?Q?Kjfw7QegPwYCrJ36oB01vXfaLlYbJmMV9U9DEbMJN05Z1xzRRR5qIFjw3EDu?=
 =?us-ascii?Q?2K1ZUg6Fqcf+hu/LjCaEAFMTKsZfnro8Tw4mneTgH5SMp8vgWo6y3xqZ7NeS?=
 =?us-ascii?Q?jP3aL/hTUY2YRNpONIWHXvsGn2fKMN9WcKhUKrHa673OynSkyDbudnqOkHxT?=
 =?us-ascii?Q?qn2lM5ErbJa8QysknxIrMR6kkKhNGPkGbPELbTrPJ5Cy/p8iM4QEU+Lr2/+e?=
 =?us-ascii?Q?vEFo33fM24qqntYaJ6+YOI+fc37lGQCkkVoCdc9gdU2jBFQk9qzIsFWYRclV?=
 =?us-ascii?Q?YlvJfdMVeXyGAZKW6vMeyruxMgNUnqxNAZKwJafa6Ce981JZfu3Ijt2aPuws?=
 =?us-ascii?Q?DrjQHHrqW0ZlCTLIY8o2Gdw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8fdc4f-951e-4fae-becd-08da69dab0f6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 23:02:02.0187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0EVcY5geRP5nXWtoAIgKlBOJpRbf3zXukEZCxItsQaRAWnT9Zc8qpsQENw4EhhuMWBBSVjIQ6KbwrNQXW+QG13xknP9yy6uGr5WAlgFejYrWzxQmeo8Q9t6w5a6xAaW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7142
Cc: Mark Brown <broonie@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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


Hi Lars-Peter, Charles

Thank you for your feedback

> > I don't think DAPM would work if this was wrong. If you look at that
> > patch it consistently converted
> > 
> > `sources` to `edges[SND_SOC_DAPM_DIR_OUT]` and `sinks` to
> > `edges[SND_SOC_DAPM_DIR_IN]`
> 
> I think this is just one of those perspective things, OUT ->
> audio comes out of the node ie. is a source. IN -> audio goes into
> the node, ie. is a sink.

Thank you for your explanation, and sorry for my noise.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
