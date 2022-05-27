Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 725505359A8
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 08:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA43216D9;
	Fri, 27 May 2022 08:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA43216D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653634309;
	bh=7nfRfYLnH2slW788hDLtRn/0NSTwRoHuwNZ+Gr5bQt0=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=va56di48qGtCU4BqG4pXuqzIkzBbyVuKPxK3myQ9uWFhN8YRztYcgsXx/97NgG+z3
	 BeU6KXAdGyoJv6FeW62IlHM/4DilQZiQtsN55LOuwyUHRDFc+nlNJo0AgU3xUesvhx
	 GSe0WBa3CLwwl+Ax8t+SWE6HbPFycJ2C9RY2LYfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33BF1F80310;
	Fri, 27 May 2022 08:50:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9A6FF80100; Fri, 27 May 2022 08:50:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::717])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC578F80100
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 08:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC578F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="kHbdtKJO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBScljm1hgL6mGUh3I514bgZvW2NDg7adFQbZagqqypNh3903yoJkWYD7XS6mqyyTBvaIbGuDniTdDcDU1m5/UhDB/rKtzfZd9AhZ9yJs5S1RmA8/tetw1BmKemUn8PnbJ3Y6FwXwjTJ/w53BTnbFxeU2Yh7lECGxdmZGm45kHQz9t8ZCXY56prWVfnMnju5A0Y8Yqlox1q1igMy664/+aasUkkL4I/5ydTtIG9zodgof6Y3uQ7KRJbUT6r7XXTA8EELU2uyAjuel09Uh82wdtGpcD1cBZIAqL1K/1ZPobB4QxBgoMIuY3ZIfXi9bcN1OadebY+/5cdMnGMOJ+uy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK23ur4lljsVIjp7bx3xzalJwN7qtjnefJHNiCx/MFg=;
 b=H2UKHcw2PcMb7FUso26SjgNkSnE3lPJrbGEXd3D0lg7k0ChmKnFzMngb09HhFpIt7rz++rXv+oCGvriJqQgjfJri/gsV3grzr0BIm3p8uWRJ18G7AnU9KXJ+0ZELeq8C47NgkylQjCnf5lGjp/ZogeJcxwi6tjDP4Ich0ev7ywUyCp3zGtiqnGym4m2+zJmyoNfOcQvYPorEhLWPNBeYeGx4dHQjV3aQRDoo0WY633hNh2xZdouMu4vfLfs/qLa3fPU+c4IykFnnQzOhqyDB886LOVO4eAMGsOO8q4V2wi/RMO++jWqc/CTp0wl2f6d9U5jnjGaSZD4OhhEYfUkAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK23ur4lljsVIjp7bx3xzalJwN7qtjnefJHNiCx/MFg=;
 b=kHbdtKJOwQ3QfAFUzQ/b/sRqwOLggr6Oy99SF9Xa5qG7YMNj6cpNZJtgw5wJGtwD2+KFtp7nXeG7ydcQJ+2xz6p4/hm5tST2Z2JKncKznBnyuAzpfw7qM5WasPo2yPwOxq1TMfPHuCREdgEGCwjN5Bk6pz4YKIXAb9EfRBinQ0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB1918.jpnprd01.prod.outlook.com (2603:1096:404:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 06:50:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 06:50:34 +0000
Message-ID: <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: About Cleanup ASoC
In-Reply-To: <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>	<db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>	<a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>	<87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>	<349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>	<87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>	<021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>	<2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>	<498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>	<3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 May 2022 06:50:34 +0000
X-ClientProxiedBy: TY2PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:404:a::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f5ccf5c-81b3-4707-4ca2-08da3fad3328
X-MS-TrafficTypeDiagnostic: TYAPR01MB1918:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB1918892B8BAEE93799558709D4D89@TYAPR01MB1918.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGTJG09Fcguv2WlA324iG1/85F3hlWMbH8wK07FRJ5mR0V2AlJT2udSvVuNQDJmUMUIOuZxOKVs7L6ah57mRhDqds3VEJoQ6Aw2GR09v/wIyhAlUwqugjZiHbODHPsrC2SID/nqV5VLrUze0kp8C3PN0LRVPvr3TpFU0txDCg9APB1siMv8RqF20PcLw4jfvll4WUXoPfn1DslKWrz+Bb5V7hMuE+Pm/vbSOeMQkoDTFIc4TiDktKq64w8+qpwM4fJB3Cx1yPLOFMOoZeh+XamnWGSbk0xZgSS1J3Bz4ivuu5G1Ijm2fRmPlLzQ4f1aI+AMkFNE0sckZXxgeD/YtONUnEpcF6G6cLeRakun7wRMHrwVAxRGJYee4XSUi6wgUkyDMp5ydZNdPxuygg9TSKJZtk3GQyvsAPN+hfqleAz/SDB72pBoEv54aQfQdPCLO7ga4gy3l9Cm0kyOOM0J7bktXzwpH7cFahleIwYnl8Q85pZapXXDJJaSUk8OeQhJsTEtnWoB5GH2ozxnuy3cGB/SRpEAEYuFXfiSkGmOrvswcOqcjOXq0HBuPV8JzJ6LGnqGqSgXO+0/DNetJxdTu4VopunjyR0SHJG1dHgZo3yQM2MF7wY/UWQQ0VPem8UhXDBWLFbYOf7v2LMN/sbrtYKGZPnPdJhwwZF6EX0LAza/QvAYYUuMFdfxobmmujOHaeE4PI9xbA8wUItWrcaRP1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(36756003)(6916009)(3480700007)(8936002)(54906003)(316002)(186003)(52116002)(66556008)(66476007)(66946007)(6506007)(26005)(38100700002)(6512007)(4326008)(38350700002)(8676002)(86362001)(2906002)(7116003)(508600001)(5660300002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wuy4JAuML4L0g/QYBYA/i0HRWhEGUhI61A9IB1eTraU+JmcBvAWyAgEg4zGs?=
 =?us-ascii?Q?zIpH+ZrhQV+Q1tfO7s0Fc/fB5lr7q+FwTxlCTQh5HKsSuyc4P5yh54k1jZKh?=
 =?us-ascii?Q?xEKOWQ5S94uaudGWNJhIZKvkOIlEh5yJNvEpRF9Bgt5mUte5fpBQ3bdiCXE/?=
 =?us-ascii?Q?aroVePJSpLPXCeMS2d8jSVGdl4lfsmwum6aaslxqr7WN3MshGSYG6dH63yx+?=
 =?us-ascii?Q?/ytlEjnVwJc1qigLZ3UL5VYKrMJ1P59XpqUJSArgrBmFnM4hNpi7lVgXNlWa?=
 =?us-ascii?Q?CJlDWWaknNszAU4w28e67cmoi1SFHJN6z/TiHT594akU/nqlrzOyGBKJiVDr?=
 =?us-ascii?Q?a5uGkMIuPd4G6S1DPixcvxDzzQavoEjuZxCQp+KHDGaI0nYn3hVI0NemlSmb?=
 =?us-ascii?Q?laHYzRJr/lmJyHV3XQIvCsqpYLhr7yIf6fjKXCZzfG63h4Yhbz9tXvNxmrnQ?=
 =?us-ascii?Q?kZ/z3KkBif7MOVfXCwOk0nluyua9YwavHgHp427RLs3BkZg4SSHifYCCemDq?=
 =?us-ascii?Q?s67zhJKOuQlt3cqgzT5/UETcE7b9CV/2G2fjKR1BO4cUb1zaQVszJavcInQ5?=
 =?us-ascii?Q?ufY2pmwQa2+2AyR69IDEItKP4eyDG6+K5lor0uDdUW/bPJo5ii7zB3vcC84v?=
 =?us-ascii?Q?yJBWmyVkRvvjMgGtUJSIFPD9CkdlISBvd3WqoAkZG0UwgXDH/bpNpRvjCcVy?=
 =?us-ascii?Q?lce+wtYY6nxjlhpFiWc43mF4HKnMqhBJTzSMPBo0OSxOY1icW+ng6W+n7D4S?=
 =?us-ascii?Q?F6clFyKIwpHmRkFyzJuD9Wq0t536Ln3P36Efnrzd35VUuo3UuEINwyVsPL2S?=
 =?us-ascii?Q?c7XS9oSPJw/q1UxGjKlCmgKHT7AuNrmSOuk+0hEVqZwl0V9zPki5DxBzreZf?=
 =?us-ascii?Q?gJy3Scgn664AaJuFlpJr5CdJZT4gmWAjO/je1qacocFLiLQzSPEPLMdbM/6i?=
 =?us-ascii?Q?zJiRlRw5LH31csREOT/1lUyvu6pnuWX7NCCwPs0MH7SVaV27gUqm3KoMBU7u?=
 =?us-ascii?Q?M31zJL+5iaNAt0lQ5yFpfvWOHYTPQlkbNnsk3HmxavZ7LsNY3KT2MiDy2Ggq?=
 =?us-ascii?Q?TM6VueRHquMmQF7bx/XN026lYcueeebdNlrXeXVu6USe9l3oqXEmCXF20rug?=
 =?us-ascii?Q?Mn3d/BXIBICxlVgfXFVhb54LVM0RoFZ7p0W5tNxIcw5RiV1/hTQfdnmC1DN0?=
 =?us-ascii?Q?RGsCrVUDPoujEYtfORICFnTxJUEbJrT7MSw3PIZtWZMp9uFK8Zlp+jiHRLfV?=
 =?us-ascii?Q?B29rw4IAqg6YRmj7TKVHaVxNN/IkD5mRGWj1oQjI8mdYRvtEbn1+A9IBAj1+?=
 =?us-ascii?Q?UNxWZ+1v2Tktz+9gKqExDnvDs7s33KgyCbfBsnV3ep3Juhq88DB+KGqAuY5C?=
 =?us-ascii?Q?zw4TPJUmznMC81JuZM3CO9gd/2q9gH9UNFkg8H2D1wTkjcPtp7jxym4j4j1w?=
 =?us-ascii?Q?1X64zKVTelOxqZ1/BcNU5fQ3ifkwvqZqzTGi9njYbVf90MFtwVCtWILkhvSs?=
 =?us-ascii?Q?nsI02kEvj8fNVtOZ5l8LO3LcYH6zv4yAdalKfHexsHnc2Qqv59b8mEVRA1tZ?=
 =?us-ascii?Q?E7hADQrasCOEJUw+2VN1aIMH/+455+Lk4euNbLzGZQ+aZDWuKVv0W4kUWT30?=
 =?us-ascii?Q?cuVt8M7dkyMNFkbuPlEu63xL44WeS+fMAxBpTgpUooJ+m9YOSdDD+HkM+C5w?=
 =?us-ascii?Q?ogKUUpbkLmdK/hQcFfrgr8qruzhPpj0nliIXYrfdCbC81YrjLzkVjFHELZ1T?=
 =?us-ascii?Q?yQtVjQMw8qiNfaEi8PjZF6PZBVM0NegkroGNO+mlyboObQqr8KKw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5ccf5c-81b3-4707-4ca2-08da3fad3328
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 06:50:34.7611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rByjhSqxcGjTIuVdDkQzRrx7bLYg2do1iKjdFc2U6qU+VJ3kmNjPF50QdYppRKJqlLKr9ScOf+CQ3IzvEFHOO6VQl5LV4CMNGYSmeyaEjJxmBZMg+Cd+aF8Zrfgs5YWr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1918
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


Hi

> >> It works for ACPI because the platform driver can check if specific
> >> _HIDs are present or not, and decide to create different platform
> >> devices for different cards, with resources split in different
> >> components. In other words, there is no strict boundary between platform
> >> and machine driver, the platform has all the information needed.
(snip)
> Because there will be at some point an ACPI device for the machine
> driver. I can't give more details on a public mailing list just yet, but
> the approach based on the PCI driver creating a platform device is NOT
> future-proof.

I'm sorry but I'm not well understanding what does "machine device"
is meaning here.
But anyway, if my understanding is correct, AVS solution was like this ?

	+-- DeviceA --+       +-- DeviceB -+
	|+-----------+|       |+----------+|
	||ComponentA1||       ||ComponentB||
	||         [DAI] <-> [DAI]        ||  Card-1
	|+-----------+|       |+----------+|
	|             |       +------------+
	|             |
	|             |       +-- DeviceC -+
	|+-----------+|       |+----------+|
	||ComponentA2||       ||ComponentC||
	||         [DAI] <-> [DAI]        ||  Card-2
	|+-----------+|       |+----------+|
	+-------------+       +------------+

If [DeviceA] could separate feature into [ComponentA1] and [ComponentA2],
it can use multi Cards on current ASoC, but it is not a generic solution,
as Pierre-Louis explained. I can agree about it if my understanding was
correct. At least my Sound can't use this style.

My indicated was like this

	+-- DeviceA --+       +- DeviceB --+
	|+-----------+|       |+----------+|
	||ComponentA ||       ||ComponentB||
	||        [DAI] <-> [DAI]         ||  Card-1
	||           ||       |+----------+|
	||           ||       +------------+
	||           ||
	||           ||       +- DeviceC --+
	||           ||       |+----------+|
	||           ||       ||ComponentC||
	||         [DAI] <-> [DAI]        ||  Card-2
	|+-----------+|       |+----------+|
	+-------------+       +------------+

[DeviceA]/[ComponentA] is using more generic style,
but we can't use this on current ASoC because of Component vs Card.

If [DeviceA] doesn't need complex DAPM/clocks control,
my indicated style can be one of the solution for it (?).
But in such case, *general* DAPM/clock solution is difficult.
One note is we can still use AVS style on this style.

Am I understanding well ?

Current ASoC basic style was created very long time ago,
and thus, some of them are becoming unnecessary restrictions or
mismatch to current system or not intuitively today, I think.

My opinion is I don't think we can create perfect solution
from the beginning and/or by one patch. 
What we can do is small update with many deep test to go to
correct direction.

If my indicated (remove Component vs Card restriction
as fist step) was correct direction, and if we can agree about that,
I'm very happy to work for it (not including DAPM/clock
*generic* solution for now though ;).


Thank you for your help !!

Best regards
---
Kuninori Morimoto
