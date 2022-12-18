Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0A6505CC
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 00:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063B02A14;
	Mon, 19 Dec 2022 00:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063B02A14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671407970;
	bh=Z4iqp1gqKiaqWa3Z8laOxCI+ounYQXtTZoKNBJ7imdI=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YiMqwaTNJFLB5rSi77+vk01s3Glug5fLl3MqolyIx0yj+GgieMdjt8fqu1hg2HKXF
	 xSdbiGi8eb0xhPIhLJZxVHjmO9yMDH5iHGDE9riegWyruhCb0iiUTF5pawiGNQcvWs
	 YjqmebwizQmST0GxeHbVJRENU6yZZ9sw4Kztjrcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3CBFF8025E;
	Mon, 19 Dec 2022 00:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC6DF80496; Mon, 19 Dec 2022 00:58:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2127.outbound.protection.outlook.com [40.107.114.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0090BF8032B
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 00:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0090BF8032B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BmIuKX3v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjFHRVQpEBya/cJ5xD49Y3nx1f/mqWMlZcdhjsVkc50W5+d8eJx2AyXPh/SD6O+Lp0QZRsR/AuX7FgRtMVPFOmqVqU8OeeefOB3xIkTYx3SvaF64PPCPo2rFBP29w7BdtPOhcxXEpfbMK5tVqYukDFBjPGjjIBsOodyP3dL057R4NO0zkqqjPsd2N28a5VvJH8EXGDdiCWOxiNhWFORkruxNU4wqhKq1JojSRpVP4SX+20ItfLom8YPDqxtBweQbPvpavJgPQZy3L4gewpCP60ON3MmmxPa1R9SCuZYJ9UDAzig3KVflYYjyv3NbJL2gPE7nLUw7alDIzwXib7K7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzm5+B2fFw+kz89kzqrn2NYVl9rhnBpLzzOqpqpiv3s=;
 b=Vo52Zq3QHWivZ8utkclnUd1k9QLW51XxGePIbyTpQIwOvEYSE72mwFGu+BGJm570G9HlcYWkIyilNcK+EqZuSkXVWYKYRpEV9suh31pymmrRo7yNEYR4ALXFhUfS+ba8gqBePE+TWejRA9uzlsVJfh0UqsDmDKdNMZiTJy88e1bJDjGBdQaWHhM3MtseK8SdP98QwS2N1XglSSCPeUGtVEaCYHHwIEHZ/T1SUqvziVLalQTEIH0CtdT2d0ofB0yj3S46eJ3w/SU+3ibK7qFzkvBfI/gXov82rOIPqobzY58Lye/uQR3Z7A6c0Thix9kKH/a5XsOERfmR/Ez+z6kybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzm5+B2fFw+kz89kzqrn2NYVl9rhnBpLzzOqpqpiv3s=;
 b=BmIuKX3v9mSObWkmvWuwHk6jYOwz+UIGgKedSajxFStuTZXJFYwKXdzOTi37f1/sc6HwroZsqJQSS506AJm1oqTJApkwogRYs9lHMdNhw7IBM8fZR5Oah3GOOCSs/Ie0oVZru4A/gj1G3xk143FSdrIIYlekGLS70IKvx6nrcgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8557.jpnprd01.prod.outlook.com (2603:1096:400:172::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sun, 18 Dec
 2022 23:58:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.5924.016; Sun, 18 Dec 2022
 23:58:20 +0000
Message-ID: <87v8m8gt7o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/11] ASoC: dt-bindings: audio-graph-port: add
 definitions/ports
In-Reply-To: <20221216163334.GB2839409-robh@kernel.org>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87sfhipynv.wl-kuninori.morimoto.gx@renesas.com>
 <20221216163334.GB2839409-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 18 Dec 2022 23:58:20 +0000
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d11b0f-f019-40e8-7318-08dae153bd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1NVQkGVLgVDOrCbOFawl0mJNrS6701vOaxHE+kf3NaK8JYjcyfIQfNwBpdqFL8yx4X1/hs4fmdlQFAo87QjOznX/eofEB8nt8JOS2JVMBJmzptBwtUvL3Bd981MnEO+JGQ1ynnl0rBWMmQI1f9LzU1bkDc3XFt2BYMybWMyZQReVt7gneg5I5KrQKkENV7+hLAwZIaJxsY5MLknXW0rpTEN1wqpV5fX3mvxjaYiNnqML9jgfspXzbyCEDs4ixXIGY+mzxLtOaRVltKrhFCAlTzm/RRSOVqPcX32KsvjnxZCb7e8Zffliw2W12yeS3yPEnVTtx5GTQhmI25zR9Dh9pVM8tePPSnJAK/v/O/dj87MX0wlUpxR7aFfyBWKI8If80JMA/v85Sj2eNCtkaLy2AzSrgYQTpghQ2qEr4EsUCzqPdjUlQiRLz8b6QFotunJ5WQahN26Y60Ld1tRHx86671AGQif2zW4PvqsqBuIPrzePbwniQIVvUqNXtIG4cVw/NWw9lhmEoV+D/L3CfoL/+GirVsPRfkxEQkMrx1dhqyQtJ7JDRT/J402+B/4Obdnm+T48hfZCrND4cBGsHYNGhQbcv9yt0V/GVj/svEWWPgb5vyJ16W4zJQG4hGASMensK0deKu64uJ7zSn1X9KBLyXZYgYbEXfOR124SjaVC6IOoPZW6ageX5wS7kgMx3P1b9IYpAknB/DtbBStpMucAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(36756003)(86362001)(54906003)(478600001)(316002)(6916009)(52116002)(6486002)(41300700001)(4744005)(8676002)(5660300002)(2906002)(4326008)(66476007)(66556008)(7416002)(66946007)(8936002)(38350700002)(186003)(26005)(38100700002)(6506007)(6512007)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?drzGsoiH+s/HA2C+KmYaU0pqll2ExLiXGA+neYEBvr+56+3Bx8HrJRVt4Uj7?=
 =?us-ascii?Q?hOdCCI8VtSNhk5/zVWf8R8o7vtnfDIkHR3PxGimGoTnlyKxAuRbe/Ms3jDea?=
 =?us-ascii?Q?Rv83ctPYJhAJEWjDJGSGI13VQeAJL1iTDMJBpVKHk2y+44ZwppKTRcjl+SIw?=
 =?us-ascii?Q?SWV+sy4vlEb2KjNxpRH1P/YH7fzoap6mIiw+6L56UgRbLkmck2/lWBZvfZnP?=
 =?us-ascii?Q?gBgicIhRAfdUFVn+NM86qNzGbbKcGK9rJ/AR8Drotc/3AOPlflcmVEqJyYyl?=
 =?us-ascii?Q?qDc27cEe+YqsksI24rOzeMRRv2ZlD8tXaKcG4O6mLJqh+c14Umju8fUH0tbQ?=
 =?us-ascii?Q?GoS3OB4ANI9QUE/bX1145gA4zdVb19S/Cb2lU/cmHLRtsIkwt+CrUjQzKSI1?=
 =?us-ascii?Q?Z4o7MIKnCw8RE8kIHgcW5KlKSBKNpuxkprwt/pL6n72InORXFq0xvV6FcBtQ?=
 =?us-ascii?Q?TmWfUlWk4kM9ttp2xBaEgn4MSRP1L5HWDmTZPabaTVckH3ArpargLyYhCPRN?=
 =?us-ascii?Q?/4/iLt4YBibLha7yThN0SPCvIR6anf7rsCctsC8RCDdelDuOFlVGQjK340wE?=
 =?us-ascii?Q?Hi91IDPRvqH01iaFw+EhruGXQ/i6tPr3QSyGAKFcR0OnUG1R8m0DYRhExE8t?=
 =?us-ascii?Q?TY1Y7aDktrMA9+E003JPwxnvTwIUAJQy9ONmyAJKNjlBY3kqW7zLw17b2CwT?=
 =?us-ascii?Q?fhsS/O6UMsInrUO7ozb/8YMrX+6IR3gqKzVpEi3idDqD6O9T4Rs+5ZmJjJhV?=
 =?us-ascii?Q?G1/+vVq6qf42c3vta3zimcgoWj/2TeW3NfiYx6//b7abIaZ4tmPaAU3CKpsb?=
 =?us-ascii?Q?34GVU3RisGuO3vKKY5c/9oesJJBUVlmYnmxU9FgbTITSscju8b0a72Q2xiyg?=
 =?us-ascii?Q?XbkroVgNZ6d1xo8pZIYAc1c5xjT0Xne2TcCQoorGNBqKpAV68W2Vgb2a+UWm?=
 =?us-ascii?Q?Br24wpyjRPax+fXhYpnhKWsLAgpgDW5NEcf9BsTM0sE8G9gZPytMNXhRsuib?=
 =?us-ascii?Q?ohdKdoPzNSfsXOCCB3oyTpts0Dnw0ejf4IpPSQ5tRqT5EB0nawXgeYmR+3xm?=
 =?us-ascii?Q?Jauz5RM6/GWtf7Al+8Twuy0vkvF6YTSS8gaY4mL2bJUrZKXKLDINGTywaSF6?=
 =?us-ascii?Q?ADM3TbceJ78Og6Xyhroain3CsvWoPPLwZI2hO+Gthstiv7UJV8jXZNYBOejD?=
 =?us-ascii?Q?HXW9uiD2zw7Xt8mbQU4Sl7b9yV9JsFVF0A69DJT7gmb6poVs0hoetlMH3dwH?=
 =?us-ascii?Q?uVRpiafTqZRbsmRAQeGvyJwJ39g8fIUdt9HOM/aU7f5m3t3bc2VVp291DMpv?=
 =?us-ascii?Q?6Fi+DZAccG/RNACxwvvRk8BJVS+0d2R8dHWGfo/WRmYKVgDwIO5I8WEauYBF?=
 =?us-ascii?Q?YYA5ZA/LHE17v5pVQjBnBGbM5q0wAWfVkcD5sgbjA1eCghl3DKF5JH6/0+3l?=
 =?us-ascii?Q?SavdHzGRzBmD053XiO2q8Cp76elYTJ4k1qsyPXzZ7lgrVlc1OYRBzitvy17L?=
 =?us-ascii?Q?EPzoO8xb9SFE9lxoptZBvFhKDgzDPaP01Ynypy6IkWVfGdc0GaboW7DMNQHH?=
 =?us-ascii?Q?ld5uQKsxaTMDC6uSlxCEbfPkJGcfZkbUElzcg/MDJZN5xcCrefqFmDvXNLGB?=
 =?us-ascii?Q?FqQyBZl/ddyYyjgHbCZszDg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d11b0f-f019-40e8-7318-08dae153bd7a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2022 23:58:20.5050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcO2EGF0zii/YHEmUmYKCabRPczSRs3eBRTHr1M/ZZSY8HZAh0CsL/P0DiEVu40JBzYIUSs0qALgJ+OO1+VY9ap8f7CcMGMjPQm9NoVOOAWz6b3Fdw8SsNAeynwK3qNM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8557
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

> > +  ports:
> > +    $ref: "#/definitions/port-base"
> > +    unevaluatedProperties: false
> > +    patternProperties:
> > +      "^port(@[0-9a-f]+)?$":
> > +        $ref: "#/definitions/port-base"
> > +        unevaluatedProperties: false
> > +        patternProperties:
> > +          "^endpoint(@[0-9a-f]+)?":
> > +            $ref: "#/definitions/endpoint-base"
> > +            unevaluatedProperties: false
> > +
> 
> This won't work because any user that uses 'ports' here cannot add any 
> properties to port or endpoint nodes which I thought was the point of 
> this series.

Now, we have port-base/endpoint-base on definitions.
The user who want to have own properties can reuse it
and redefine.

The user who don't use own properties can use
above "ports" which is implemented under "definitions".
It is for very standard "ports".

By having standard "ports" under "definitions",
we can avoid duplicate "ports" IMO.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
