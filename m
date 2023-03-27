Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1716CB219
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 01:06:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1202A20B;
	Tue, 28 Mar 2023 01:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1202A20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679958398;
	bh=I4IFkVcfFkHkEvLfaEHG1ycWPJfyzCMxM2VjOLNp9Uw=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HweSRZgdTQKik8eps0TEsGXJkqXx1dU7jpy/EImSCPkxuK4kh18X+eytOe8nXVuZq
	 ICi/TomYU1VqqsAHAWX8HN7eYx1NQY9Wi74cXuckZVnS87+xaFnXqzwYMMA5kVtjRP
	 00iPANbUEdshHYfWqHOJef4YezqMt5l1cFYxynKM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C7A0F8024E;
	Tue, 28 Mar 2023 01:05:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B3D4F80272; Tue, 28 Mar 2023 01:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FA4CF80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 01:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FA4CF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XXZBk7c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccgivWV1GI4wKF1UTK/cLZI70JaM3IfRNge1HZ2ktRMl/3TRaSVC2L0NyhEA2xtzcYnNE7LKbF8TTAmvlAZlu4QcVJcxssWs+ROxPVxhXmdtKeBnGNnKxyw2u5ei/LHu5xEf6s8g9sxiLRQKAupXe1gkHQDy7QU9SNd2w1m1Tn4HTPchTnL6n/R4J4DfXSAEYZZPkGa3gVIAwbKVOMUyoH4a09ctF9saSXdeWevriv6uQIgxpSUeK1LcSOeFWFHDUEEAoJHHOuUVbl0FL8fWmZnPXvW2CfmKGkZSuCyGz1uacwo400KL7EpGWHk4iVLB91F6qsvU8hkZ/Kln19uJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZaWM9/rUDGhNOpReg0ARqTpO6e+ssoKXCDGKBkVjR8=;
 b=Kg1V7x8fG8jMLD5MJC6ClSnXqATx5dUIG5qyxy6Xu/ebSk3zTyuvG+LzBNqroos9bOXrZ8puukeEPdsMJekFr8VcuzpT1EMfb+4v1Icwt3bwXSlhvdRRnyhOZ0FIWtWnYpioZ9z9X9feg9ZqFwpfro3YE5VALt1UQJjEPa4p2IdfApqcoXMuCa2TapJznSYP605da8W+asnxjtcu8OeDoqBdAoh79avcgX8+db2X0FOOeyh8BMEFB1yin6EJtxx9iLqVfI5VvFfE9g0TDPzmu4WoNCGHUZISypEINa5HxAgR/3sHkQlHekhEOlFWP6SAV9FDzDQmZGlVuqBDSVNmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZaWM9/rUDGhNOpReg0ARqTpO6e+ssoKXCDGKBkVjR8=;
 b=XXZBk7c5oerBNMaimDkhvsbhM3SXhjzlYMOLRzoIzSXdYvODex5+xY10KqDlN3zqLn4uFy3V5DwpmqET6uwFeErq+8xj0SMLdTcDoGp1rwTB6RAV1Q+pqU+8kna6IR0vq+Sk2saOplFxbLNnLjeOgjisISeLxcps6/M897syFak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8813.jpnprd01.prod.outlook.com (2603:1096:604:15c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Mon, 27 Mar
 2023 23:05:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6222.033; Mon, 27 Mar 2023
 23:05:24 +0000
Message-ID: <87sfdpg5hu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
In-Reply-To: <ZCHDYq2GTwQ8Db8y@sirena.org.uk>
References: <87ilen6ni4.wl-kuninori.morimoto.gx@renesas.com>
	<5a284544-bc08-a7e3-7be3-48641762ba44@linux.intel.com>
	<ZCHDYq2GTwQ8Db8y@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 23:05:24 +0000
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f8985c-9827-4b38-6e42-08db2f17bf5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eXoJtqzWCm7ENoVX+aV0s6WFqEC4H/Fa5N+k+bbQ7WjNyvyA/AfbPzf9bZoL2JaRtI6OE3z7zg+PA4dOvrUccgmmTyUws4dNFDTBD2FwOMSdzz19IoE/ZEtDEw+uYRh7gaglRfcyyRQqrKo8WQlIel6lX5SO1UkCIblolN92KJHESy08izxg5KWNir0cszP3Y1yody8/TCRIbGFeEUUkUNtyRV2fzRzxzXBWZ/Sk+xeSbxGPAxXPPRMTqzUIALUmljyzVcoZYxRMuw4PZKpzeEgMhPvau7o0vo8Llqd/d9o9Z7TU7KCMVZf/vkrqfxheJC7pQ7UQ+8V/ntmIsjMUiW++xoK2U2S9S2WbUM+vayGwNGa8lQsGPBFCbhR/LlptZ2+P/LKFVpfX/SwTF0GSWhiyNR6/7WcR7LIykNJln4SzZezW1axq1q6E4oAjV5DUXOOTzRI/C/1izlfiMqc3HpFcHHFnywSiBKrSlvjcLXuHHPcT+bXrP3TcN7a4BYHKLUGcM2zMnCyzG5QUGivr7Flyeh6VJwYO1ZGRCCsxKbA26O7I+Oi0RpXHNnRADmRtvgEbELO4M9XDqvB+FjtE9KN3Fynj9FcenNkWI0671Ruur6y00d6MUoOVI69Bpv3U
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(2906002)(52116002)(4744005)(38100700002)(38350700002)(86362001)(6486002)(478600001)(316002)(54906003)(5660300002)(8936002)(8676002)(4326008)(66476007)(66556008)(6916009)(66946007)(41300700001)(186003)(36756003)(26005)(6506007)(6512007)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fVvOp9AvvR1bWN5LOreQQ6enuGk5b7vvv6ICXuW3lRnu1EB1ld4biGfmY7R1?=
 =?us-ascii?Q?zDAdpw+7AmTe2pDEbrkKYcZH4kzO8lJk4CODGo4BgsffSXHvSIYwY8ZeviFV?=
 =?us-ascii?Q?wxvw6yw82MwSAPwytaNd/mPH6+okfc3mtTgens04BjTf5BwSURKg/kwHdZt4?=
 =?us-ascii?Q?uikndYsME4F7ghxmOaEmae8Mf1DrlKOMW+45E3Dh6R2natyEcb9ru6Pjo35B?=
 =?us-ascii?Q?oJqjN3CNaPMY5wTOJ+K+eFADsgUzdf5ht4j6o8i8sWBtnvg1Xr3ptx8iCvI4?=
 =?us-ascii?Q?WiZU25ZsIzeaWh5cNoakrVUSwVlYLIbzoZrQS/JM0x5EitV2PXk54h/GaRQr?=
 =?us-ascii?Q?RJf72W0iQf8RFfxwY0Tz49PMPKB7t2Ibkz0g9c2oa7QDSrd3mXX7unThSr5N?=
 =?us-ascii?Q?ROvdeb5bc2NFfWJby9Ld/2snfR3GOc9i2j+zcAipkiezDk4tlV3nkNzGGkMK?=
 =?us-ascii?Q?EAKBfF5juAKWG9FpgwKWFJFyOL5O8WGOgm9U9Brr8nUh3o9uUrRg8j4GScgE?=
 =?us-ascii?Q?EXClLhBBYAVa4orE5qJb3SpWfrI0+E6GYJYi5SBigJ52kG7y2O1xsAyIguPo?=
 =?us-ascii?Q?CNcUbytN50PE0JagZl0eovCyvBmyjfQEwRuDg1ZMcEX5onByT5GaW3hHOyj7?=
 =?us-ascii?Q?JTu7lCQXpZbG1HqxFLZqfrGXJp1a9Od5IT8GRIs1xy6S+vWicmsZDfiUOAMW?=
 =?us-ascii?Q?rNrr8f6N7vbKv/Ob1McMx8Tn68vqQ48b3n6uYoG36pavw8jcXZL+SIx70M3p?=
 =?us-ascii?Q?njdbi0+GFhxdEJ129DlePAuy0kWqZILMdbRdfHxAToY8LAVYV/9KyQrLQcH2?=
 =?us-ascii?Q?twEu6RjitbDgSAp+NSgplIyGXbGc6ZijShR2brFKKkt1SDNdqGv3ZBARxZii?=
 =?us-ascii?Q?d/JIm8jl8kYVFYp86dKO9p82O1ieqfQ+sGJk7wPnv0m6IDGZB6sY7wC9guKr?=
 =?us-ascii?Q?T/TCgHYuhcJ3AZS0m0zk7V7fjuJyc3agnikxRtaAqXQuYOXLJXCgh5eXnJ8T?=
 =?us-ascii?Q?vw1imqlwxeyU09e/4bo0yU+nDrK82zr5YEIzOyTsyjakwRDVltOALzpGt2Kw?=
 =?us-ascii?Q?05g1LFFHWs0wCvFlltzYRTWTXqqIPjH+wbDT7d3ZZZiF7PHEhXcHXZzHq3UD?=
 =?us-ascii?Q?9GRVr5AF44sI58Y3nRU5cNOXTmaeT2t93UUm/fzzrnSrOvuvwD1ZachxizZ8?=
 =?us-ascii?Q?Kx+BevAyToyvS+kEAuYpQ5+aeBT4RKeS8ANn6jciTPBlUlKh6MGNKjQblX+j?=
 =?us-ascii?Q?KLvF4w+8E/7uBW4/eoxaJex9trUfSeBTfS2Z+b5E1fmdLS0n1XBbmoMo6VZU?=
 =?us-ascii?Q?Nue4z9qN4fc5HwABYsPE5QLzxjvoR+o8bM/plAp1+MdOucfP+dexzsIMB9vs?=
 =?us-ascii?Q?GCuFC+/QaB+k+UhjUM3uJpfk1Zbh9Fxs3tMZ0TRSsPVsxOEh1vOpKFnImTMu?=
 =?us-ascii?Q?IizB14nHzxUKWLVxox7H8mZY1q+V9E8LPl+drkiJTVnGtVfvYz/xldODs/FH?=
 =?us-ascii?Q?muZrhxnDRdFBDBEtbl5ca+UxNxsAZhVu2igqNenmR/NgppIK5Ki53rJOfJfl?=
 =?us-ascii?Q?zGmXdHn1MXewhcxxqC/CPI7dEYPnl3cKplATJYQ2UdJNFp+yAQxk5HRDIJP/?=
 =?us-ascii?Q?zJn/dO2OjCz7Uuy1K2IC5t8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65f8985c-9827-4b38-6e42-08db2f17bf5b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 23:05:24.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AGrSaW91E1UI9FWYm0VR+nNoYO6IJGKhaP5LkL42x9f7ei13/H8ThieyRqqmo5sIWnx+JcLBXKyAVZZHOCda+ocbsS6u0eMdrDIPD+ePAGhRTYe0tWtWZidVwpNriUXd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8813
Message-ID-Hash: 66YIUQ5RRQR2PQQROJZAUHPRCFIGD3BP
X-Message-ID-Hash: 66YIUQ5RRQR2PQQROJZAUHPRCFIGD3BP
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66YIUQ5RRQR2PQQROJZAUHPRCFIGD3BP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Peter, Mark

> > > +static int convert_stream(int stream)
> > > +{
> > > +	if (stream == SNDRV_PCM_STREAM_CAPTURE)
> 
> > int get_cpu_stream_direction(struct snd_soc_dai_link *dai_link,
> > 			     int stream)
> 
> > Add the comments here and use this to set the stream_cpu?
> 
> > The convert_stream() is an odd choice for the functionality.
> 
> I agree, I think the above is clearer.


Thank you for your feedback.
I see, will do in v2


Thank you for your help !!

Best regards
---
Kuninori Morimoto
