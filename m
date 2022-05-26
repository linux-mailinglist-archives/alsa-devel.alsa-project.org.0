Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F40525348A8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 04:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9384B9F6;
	Thu, 26 May 2022 04:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9384B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653531294;
	bh=sV/KaVTNEf52YZ7Ojb61iUqqL2CIMmKtxPeErpBQ9BE=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=auo0ZudXbxHEey16QHV7inRdufTQmPCDUjZCEyDATe6GWSUe6Kh6qPlpfQ5L2rkfg
	 /tBmTitE3owaBBpaBoFMFJXyx89MqgeEw/aMQvHSxOMxeE3g531qtdzcR94G2aBayf
	 QnO1xfX6h9YnDHvAwKilXsVOf/U+Su4F/oFFkesQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8A9F80171;
	Thu, 26 May 2022 04:13:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 213E1F8014B; Thu, 26 May 2022 04:13:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 666A4F8007E
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 04:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666A4F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="MOMpYy9R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V38pT1RGpAqL8jbXlYdAluh0eDXRuRXAbvKx6MzQcwj6iaeWmBYJQPZw+GwzmQq9H/uupQXRJB0WF32EzQ4PnRs9Q1rTpSb2HyzQcLkaGezdVL+MS0UxO9Rj4osjGyNu2NL0/CMKnbqtVSpxw8L4EqeaQiv2HrQrT12yyLGCuQXBo965IxXoN/QwoKS7iLDwGkxY8xB75WZQvAWEZ+UeqdmofW1Tjn7037ieSAKHBlpRYCiUAhZnTCRKWqhmhfvbhJUiS11CA2m8/qOL8kkfVUxULVif+bDdBVUtEI+VrvcoGbnQW9E7RztnfUueiXqY5lnMjbyTGcFt5dHup88w2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7Y4W/9kQDQi4ZnNMqKWkllQ3pUb5qr5rUVN7MEVsxY=;
 b=EDYEKUvQYSe6Yblp7JS6+MBRBozRmMebOFvZvi3VdFlIB3caflG7z23daK/7RETiiSUr6EqyVP6KCub1tocEP70IX9mJNd87AiQtvY0R6c1PJpEvNHgbuXk8T3QURNc+DY/5JCSHVofU5XY7hzKXCK+sFa7QlpR5Ou3jJvAVwqVTuxruSl8Is87jxhv15qappkNKAp3rGDKsT3k94qWFcBvKuksquicQDP4B1+vWWU4SRVMFxWuhtil+lIJUFDlANamNhABtPfza3wZjRr7hRlWRzV2hLRsnLMuAJ7xn18fx2dsYWA8sp/ebl/GG8bv2emq0z/moMlNeAAsTyEmHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7Y4W/9kQDQi4ZnNMqKWkllQ3pUb5qr5rUVN7MEVsxY=;
 b=MOMpYy9RHrUKoqu+KahDpUVzKgK/82D487kx31kYY16IppcFENkSueEksk8t3P1RI3A4pv1nHR7h2DydLvMVr/Uxfh2xzVDRCPP2h+ubkf61F6wbxH44oqGLlkxiMT7FReqEgDa8zPsTkR1Vqqf9EKs3lLmyqPqA2BEYNJZFbyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB4847.jpnprd01.prod.outlook.com (2603:1096:404:128::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 02:13:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 02:13:38 +0000
Message-ID: <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: About Cleanup ASoC
In-Reply-To: <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>	<db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>	<a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>	<87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>	<349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 May 2022 02:13:38 +0000
X-ClientProxiedBy: TYAPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58498146-f4a0-47e1-a73d-08da3ebd58c0
X-MS-TrafficTypeDiagnostic: TYAPR01MB4847:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB4847A4828824173BAEE1BE51D4D99@TYAPR01MB4847.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6n1k/WpW05SOutwX1BZyN1gqLmsfjZ4bYdb8Tb9JY1soADTAl/7UUgeugQA+S4JRDv9OX/mdEmcXFb9tRIXq7ipyiSWo/1h8quJguZ1et51/94LE+C+cEQauK9KVizWUzRWia/emksiPPT1C37zNESse8F94ozRDLT0TEaYIxTe1MP1kIclMt9lPim37bsJvUFC2qRyp3Dgof6q0QjMQcLF1dcB2PMZ/TCiLtfVyNioFfYzHe2n47o4p0Sk6Rj9zvFCA5V25hjLU8a09ReBpAKyOI3fB+L7lYkQp2J2nrrTJslgb9Kb8LCm6cR/pg8Qt1CL37lwqXVM99jy39Tt4kRQI9gSb46Lew/fe0WC6jpP4DcxIXdz/Q/U3eVL3xZV4l7LSdztBmrKbLlMSGue1Tu9tyxmYen1bRABCClG5jwTXMTMAR1xQONWtfGtDXJvZUc/v2MeXC+ljUmOQyHkzzood9DysbiqJ8eH1x4TLTObyHVVvKpWrBgrrP9grrJ2HiLDLUAMyQ9E0foeUiS9CpA616QKTdn9yPEz7Pz+3JmS3s0K0z/0tckRf82RQF/IOV8HNoL7ASzuoRTNuZkNCftCizn+bTvva7tZV6Q3msazBsw01jegsDri8JeFuQXWIKfZHhZa574+rNyCF030yPFR7/S+rYwehTxK8SMXdNUr5ifRZe4CWaZgltTk+rLem8BTnydQ3ynS84tWtebhrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6486002)(2906002)(508600001)(52116002)(38100700002)(6506007)(86362001)(38350700002)(5660300002)(2616005)(26005)(4744005)(6512007)(8936002)(36756003)(316002)(3480700007)(66476007)(66556008)(66946007)(8676002)(4326008)(6916009)(54906003)(7116003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r7LPq+TZArdHqStlEYKfSckokDSntlOhDivs03fXh4YFPPqZuVvWK6927RdY?=
 =?us-ascii?Q?miUY5CNbK9PZTvrYSaf5TO95i8oVHst9Spg48QQO7m7O40h/9E+H+GmYKCxa?=
 =?us-ascii?Q?q/vftowgXhqLgt9gZDMj9W8LVtBbZ0VQyeuR6+e24Glo0F8VXgm4jJjbDvsR?=
 =?us-ascii?Q?BU8l7jbe/yc9uSlzVD3B/yqwgCWC1djvSopYpdfmv/x5ealZsZyN35x0k0Zv?=
 =?us-ascii?Q?U6sEXPlgO7a7Jk8qUrD4oNQMENm8ANw045nRbFb8OAhp52G3a+ritGs/Mqcn?=
 =?us-ascii?Q?p+ThfFvA1uEP+NBOabYWq9F/450CMjv8WF4G5zA4cilj6+w5tOYBSwlOIsSv?=
 =?us-ascii?Q?6ZxX4KoFb8nSV980uNO0q8zM7vY3zwCso0i4d/AyszrwcVOhfie1Bpzx05IM?=
 =?us-ascii?Q?COvlp1mxwjGXkrNhGcjXRvgnkZYz9+tpSeTojongFlrUpfgYG4xcvOcj0XY8?=
 =?us-ascii?Q?QFXwGvrCqKyIN1+P17Au1INkNfWv4qliTI5keNxg7NiJe6ShHwLMXVUdh1V0?=
 =?us-ascii?Q?XPsqYR4vk3kCkXO6ItEJO2nkV0jrXlU6ETVTqXU82jnAna6GEOjUPJIwMCZh?=
 =?us-ascii?Q?vmFDGTvTS4fXb7EU6JeiJeIfYPJHuOShYPqjx2kratL6tKDDc3fvhT0BciFU?=
 =?us-ascii?Q?cVF7wtWP2aAKEO1sm1JZiy/lSjmZaKRWZY8pkWlYV36esnPSz6YLjDTZm/q7?=
 =?us-ascii?Q?zTvXdwCl7lDU5I7PyvLg01YH9mykbInkgPYtRhhOPaTSjhilHOyubaE+dLia?=
 =?us-ascii?Q?B56ODPcJgqnm5YeMKxr0gtJtnsiIaCYtSZ0lQAyvT/I6hLIlg97A3I3ZR2Io?=
 =?us-ascii?Q?g7BhCB3IzxGpfC9E0qYfANYkCu8h8rOZU0rOg30QXA8x34KoYaUpno1chTUk?=
 =?us-ascii?Q?WYRw5RLKtlASDkr2Yk4mTFLgh/H0c6l94t4+m7MflNiTRkvMExTTCl/EuP7b?=
 =?us-ascii?Q?kw/PgwQY8euHgKU4Fw1dD7IJVLnuTN0dJLJwXGmereabwdH+I3tk6u5Mli+r?=
 =?us-ascii?Q?AEh8C8opFGEEW11xyYYRODgKL4SaE3bdaneDhqN4LLDGlTygZyTqqn4F05fO?=
 =?us-ascii?Q?6hu/v5oCugnb4Eao4FUoGNQiptH2uDrdFUlSPm9rNIk9uSRAPQzZo90e8qNG?=
 =?us-ascii?Q?fgFJtoIk/RyHWt/brgEC7CLiCpGA7c/XjTppPu6FG817i7ui9m9Ljp4yD5OW?=
 =?us-ascii?Q?bP588YaeNT/S2mODgQxizFxlITAOyb+Jrqhz3l/GqSuhbf3mqTKODI/if9mm?=
 =?us-ascii?Q?tUoUDM8HxDY+9lVD2WkRoAZvvnrOgqERNC/JI2EOmKfH7/NriibF5r/9P9qq?=
 =?us-ascii?Q?ibk+nqmkR0g2acb4F2MvZHc03NYWojczRK+ZcO9scYM8oRUopkBZw5OyNqVg?=
 =?us-ascii?Q?bei2itlHze7hDwLTpgavb/ZcwrmdeujcvVW3rNFy5m0LcGiX6SdoYFwPFj/N?=
 =?us-ascii?Q?96YK9ILRT8rR503O36cx7YdRubCKXC0CHdrn8TelcOlK5SZyP7XAh74bohTL?=
 =?us-ascii?Q?DmKX8DId0Ow71eL6TuUCvc7N/ploXVynQh2CVU4jYGpWu5lAoHUFRzAtZPvG?=
 =?us-ascii?Q?9SFBpGikylzkh6ewg2P0wDkbvIFutY+iMYT5J/l4KYEQZypI7vbhmt8pH0P6?=
 =?us-ascii?Q?lllMYNYz1PpnN6eMjmCiJsvekiOFwcat0ikeAo6T2WLuQhFbKr6LWnFZi45a?=
 =?us-ascii?Q?9ifElgqJrqeaNtyuiKxBTFH8xvDQmuC8CW6iQ85tQoQZWw7/DuS9fsh0XHA0?=
 =?us-ascii?Q?AkcAzGTZLpvgXWgIqmyk9dKCBtN+TRrOyn7FKELFbVIX0GRydqTu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58498146-f4a0-47e1-a73d-08da3ebd58c0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 02:13:38.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps+X+9hDxOhfwefAbk+6CCYDXsA493Gr7Ut/kB4Pl2opIasKj/1hU9hCTbWWjxZPLchFtdNE1U7hiaQQPSXttS0rVqbt5pcmUtD+0aC4KW4qvRLlyu40vyLwT2GWtnoQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4847
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
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


Hi Pierre-Louis

Thank you for your feedback

> > 	+-- basic board --------+
> > 	|+--------+             |
> > 	|| CPU ch0| <--> CodecA |
> > 	||     ch1| <-+         |
> > 	|+--------+   |         |
> > 	+-------------|---------+
> > 
> > 	+-- expansion board ----+
> > 	|             |         |
> > 	|             +-> CodecB|
> > 	+-----------------------+
(snip)
> > I'm not sure how to count the Card, but
> > "basic     board sound" is 1st card,
> > "expansion board sound" is 2nd card for us in intuitively.
(snip)
> did you mean 'channels' or 'streams'?
(snip)
> If however the 'ch0' and 'ch1' can be independent content then this
> configuration would make sense indeed, and it would be quite similar to
> the ideas on the Intel side.

These are independent sounds.
It is working for us if we merge these into one Cards, but...
I'm OK and will do nothing if no one want to have multi Card connection.
but I'm happy to work for it if someone needs it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
