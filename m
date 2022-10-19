Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7587A603713
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE235F4B;
	Wed, 19 Oct 2022 02:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE235F4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139019;
	bh=1u/FIN9cx6YQmzq9oZk1L7/nH4qcy11MmXuTvjMP9FY=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dtE9x907GuGV7JphjVBlYkDqbbjkaJq/2mVf9QyUdWdMpC2+wuzTMEEybhZ/HdBrK
	 K4RpuFqzQmHExwVPJV+qiwLNqMyxjyNgvCAR3JsjaHru7feHiEvTMuVOv/h4bgjPlQ
	 85xLXZnjH7Mpq1g11Bx2LH4sYDpSnMW98YCYiJnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6516DF800AA;
	Wed, 19 Oct 2022 02:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 352A7F804BD; Wed, 19 Oct 2022 02:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6280BF800AA
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6280BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="I9scDdVo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOuqvUGJSxHTe6Jqde0AQdWCuxsHsuBOUEtjY6+JiOsjymln6BOXbjdP4RfhmmUnHW4DTQOPTLMJMbpiDV46Rv1nxovkqoIOy9C+VTP37yFvi1/PyZwNx+UYJNLd+655EoP1Ex7sNouQjNC31T7QYDHjtu60yJkSXvD7lpqLIuZ4O0jYoGOF0Dz1Jzfnd5TUB7g/H4NLvoRdbKzh+EGI9kNlxA6TVnmnWxs1nB62B+0ldKXvSo/M5jcSRHogRPvjte6/Wjunna7AAU6TUZnQSkXw3PGZ1Z1os3q00TMz6kIx58y5RH+5PkSh1WEl2FqUiIGH/PW4d5MwhTHGHpljqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wn6BrFpX54k+U8DnMnpvVn7wyaBKW1v4WkhYaZRkHEs=;
 b=Zk+RoXle3s0g9xjYoRDT99CzHlkGRWuxGYGYi8wf62EdWcCuD25uCF0BJyCUzuhPSa3hXfpkyizyWTBKLfnXw7U7FW7DY19cBYfO6cXTXFLleWIgXZOFY6qWpqTJO5rAIbRNoXxtU6gIArzXMNmda6bkKYXiqa6v+BycLEOJVjp3m+V++ES41f69kGSW44noIkBcc3ZUAO0hOPfipTpr9mLmkxB94RoeUHFv1N0diwn4mxvVsOF57oxVmdJ2gfssQErkRzhvMh6aXe+/8yc66rbROMZO1k/xILr07voe9juYSkopTBKAtpNt4+ZF55hOX4cc42QpCQiepeDi9Nj/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wn6BrFpX54k+U8DnMnpvVn7wyaBKW1v4WkhYaZRkHEs=;
 b=I9scDdVouKgE7xJae0nvID1TRLPLsI9/lHBKRwcSzLEDNLGs7YHElSVOxfWB7+d2YfpYGDFq3bQhAoU+TSjX2sNwEuZAcZS3zBNxgpTVijCmvFMw95r6rON7OhLBxvZrSokSxoo2t1aVoSNLJR40xEv/kd4IKN3MOEvYKzkXp8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10251.jpnprd01.prod.outlook.com (2603:1096:604:1e1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 00:22:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:22:28 +0000
Message-ID: <87czaou0fv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/11] ASoC: soc-dapm.c: merge dapm_power_one_widget() and
 dapm_widget_set_power()
In-Reply-To: <Y06g3XzdxHmHnGsU@sirena.org.uk>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
 <87tu42owdd.wl-kuninori.morimoto.gx@renesas.com>
 <9b721915-1428-81ee-1be9-29c2e9d36d5f@linux.intel.com>
 <Y06g3XzdxHmHnGsU@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Oct 2022 00:22:28 +0000
X-ClientProxiedBy: TY1PR01CA0202.jpnprd01.prod.outlook.com (2603:1096:403::32)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10251:EE_
X-MS-Office365-Filtering-Correlation-Id: 48690016-697e-4e76-c40f-08dab1680184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NDLkatOJ7gB/hKhq1V3+GgugZI264NAS/eTE9vv+Lg/VwaLpW5QmN/krI1s5V1aDEsPtIuehoMZebKW++YKTEnSCUau9Q15xyhl7Y8S4L5ULXPTyCUF5rpeFFXe+qMqrr0iPI7Aq0gcDivFA3y72TTzEfIX9aG+lvgq9xuBjtBqwLpE8XYbLecxQsutTfHOcOhJAfCWpjnqpKzUFVgD9IR87qSsSw/asX9coekEUIg/uYsGM+gUQtapKEEvJ549Z2bpVEGSF+49aBNxkwNUcZjsOI5k4fkXSsOf0FSBjA+wcbprPDz7JMom2GxY0DE1lwNlOuXyXM3SqL5t6P4VryAbsm+Ar6QTmauamrnLcDfiD8pJJQ8Epy8t9RQUx8Go17hLebvT98p8eqBfDT/D0ZTlpoWg2cwDeK653QCDkWYbUeLwRTcIPvcjV+14zco6W+g6t8S7XUTW8orGKVsnkngcW/4CXdqrCQqh5y0Y7ppm9V2Zdcy78Z6090AHpu3rrPfi3X6OVqoG5hhWTfcJ9mBV4vlgrVEylPk/y6dEqZIei8+uMLhjp8AujEMXIZASb9BY9PtdEnXcyIBsYzOCoFDx8iCqj5hJzJRUbUZmhPLfbTj4Kh5J/dG3rmrBZ4fP3uZmLf9MyDgRYXqyNYkxp83I60+6SuQu5u+wKaM0mse819zTCy5lH7LRLxMVUszWwZv2VZXxG7E3kVMbDeofcVdhhOst89W2c7x81AsYiiPDo38ir4pgkahgGb9XNg4uJJAGNSsSQ1CWA+KXqbeY1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199015)(26005)(6512007)(2616005)(6506007)(52116002)(478600001)(83380400001)(66574015)(186003)(4744005)(2906002)(5660300002)(6916009)(66946007)(54906003)(316002)(6486002)(8676002)(41300700001)(66476007)(8936002)(66556008)(4326008)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-7?Q?cP4hF7eD7NR+K00GsHS67MyCaNwCxz7o8ZzNNDlthnpFYbnfFmdvZJ6ez/?=
 =?iso-8859-7?Q?gqLjsP/k1Z6am9IP8MVW5snRJ/FdS+4KQVgbotP8N7hzdl2RjC03JKNXh9?=
 =?iso-8859-7?Q?+3YJn2v8Ha+SYMeKc0BssTobWuXWGybNmzgReNdP0OD9+b3t8ZPI0BSGWB?=
 =?iso-8859-7?Q?ZOwCeKhYR1B9Ury8CVHKTARpjWXvwVQAUhav8mye6vM8H0No5GznK96ff3?=
 =?iso-8859-7?Q?rRVQuWSjpq2QLpFzL7/DDwW0S4EoRr8NZrSmU2xonJdGv2EQlO04G7lJM6?=
 =?iso-8859-7?Q?/vXc8PbWaYPm9qIZnpgrgXasBTeX56aZB1xc+7Cx/bU9gFWCJJ3Cy2YSh/?=
 =?iso-8859-7?Q?6vpXM9sVqxBtZVK+XJ8IXrz+lCLoysAj1w1oKOsMTPphV+F0kunCgGhc/H?=
 =?iso-8859-7?Q?sZ9pn2oBqgT1cNhD9mxGiW1ifSNntRl2gSpcbubKjiXJ4KxkCGMVfQGEIj?=
 =?iso-8859-7?Q?d+1QCHgPARk9DMCXZEkMJZdxXdqxPppb4DrUk4mgwwqYyE6Z3qYcspGiuT?=
 =?iso-8859-7?Q?gzeVUx5UFJWSGkGgRwgNEkgNCewdlhxYCA8A6B+WKIjpJoqF1Sc8JnVMbz?=
 =?iso-8859-7?Q?RexmU8e9GuAEmiMLr89bJxUK1QfL7jUWti+JgrzY5oI+5atjGIwdRWg+Hc?=
 =?iso-8859-7?Q?e2PSOs94Ki69qoqHCCWnXaFzWyR6BRDV+qddNWFX40+YlVLnwk+dTkukUe?=
 =?iso-8859-7?Q?0l6pRtAS+xKHW2VOhJ7EqVN8Dmjhy4AtNHmkwucuVR8w27Z43vc0uz8+nH?=
 =?iso-8859-7?Q?IWpaAz3uc9cAL6mIqvJ2qNJxjf/Ll5hYV4rlbKWEsMF7daGG2PiGNLb/xy?=
 =?iso-8859-7?Q?NIapDW0ywvzO/lt5FEFWHu2nz+gq4z0LWIRak002WX9Yas/IVdWA6c41S4?=
 =?iso-8859-7?Q?gcE/9SY3ccAJbtvixNejRfIEzdr5yRQbPdeJ3GhnDgEklPGd8OYWsLxQOE?=
 =?iso-8859-7?Q?qIiJyONTKdGmKPls4fk5N0FDk1ws+tLjmoBN9+p+sR8cI0dLX2tRfX26Dx?=
 =?iso-8859-7?Q?gMD7N6L0rRqgyo0ZO7CGrGA5HnTX0MMUTft7J1aaUz4pbpNIkiraNTOps5?=
 =?iso-8859-7?Q?GCRYECbOXireJrT9og5/9pbEpcx7AV7QSsArgZZc2ohLsfo5B9zSDUWIWn?=
 =?iso-8859-7?Q?llaHLLTlIRNTHaoyaJSBkfN9VtBKckojxO+7h07plC+6+hN66FxDdI/Qt8?=
 =?iso-8859-7?Q?jz/HtPcBDsMqg0ADw7Rm37/PcoXxfTNDsrbN3naqQwPSVjMGL/qqTWYWOE?=
 =?iso-8859-7?Q?eByCCp2uHtgSQckmKgvrPdp8YgV67oHbbzKGGXe+yDjWDOQ0IJrrDXAHDt?=
 =?iso-8859-7?Q?+HNTauLvSuq3+W/W+4ptpuH2DbN6BO2lmoNvLxYUjLAVBbE4vlZtG4qkDl?=
 =?iso-8859-7?Q?pdQ+QI5U9mIbxY+RPGyJ5FG5y3z9CO6y4BYFKuPnAwGhrYT1m+VYTxGOfh?=
 =?iso-8859-7?Q?GE0nWLvycA+4/rFryrsITFYQMAn3bR5RGJhVlRdA6oahbfIhGMj9sYG09Q?=
 =?iso-8859-7?Q?0oJcdDTZ928wDNXXtswvVQS7/I+iiQSYXC0e0nU7hQiCL2aRDc2pk+umwp?=
 =?iso-8859-7?Q?hwvF30iuBj86Tu1mHBZp3Niwj1REGyxzETVaA1du9D7mCdy3OqP6I9iCu9?=
 =?iso-8859-7?Q?on6DawNRtQ0jStb58QNApydvRmgVJ3WbVtP+DBH32WkaD7YJ47PTrh362w?=
 =?iso-8859-7?Q?75DsGawm9BFQZ2nG6iI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48690016-697e-4e76-c40f-08dab1680184
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:22:28.8414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE3g4PsJXhZ5dcVRIT0l/5xRo4ywr5dJK/IR5aEe/qrWpvBsIqc7wn4gFpKWWKY/halleDckcZ7DJwPHm29uXzLD/Ub1cSANEir6NcejERx78F4fv8R8suw2vG+Nyhfo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10251
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
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


Hi Amadeusz, Mark

> > > +	default:
> > > +	}
> >=20
> > This introduces build error when applied:
> >=20
> > sound/soc/soc-dapm.c: In function =A1dapm_power_one_widget=A2:
> > sound/soc/soc-dapm.c:1890:2: error: label at end of compound statement
> >  1890 |  default:
> >       |  ^~~~~~~
> >=20
> > (May be because of CONFIG_WERROR, but still it would be a warning at
> > least...)
>=20
> Probably also depends on toolchain.  In any case a break; is needed
> there.

Thank you for pointing it.
I didn't get such error/warning...
will send v2 patch, soon.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
