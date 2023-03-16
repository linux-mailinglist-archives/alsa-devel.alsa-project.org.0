Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD576BDD1E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 00:45:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FBF11042;
	Fri, 17 Mar 2023 00:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FBF11042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679010313;
	bh=K/Cq/PYnZUxyFYZlEdWctxDkv0iWePU1IncasvgNuAs=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dsSXMtkii5z9Pj6rgRpUvVqAg4ZrJAWNMKM7YZbfJ65X4QeCuCYti+CtFALWAF96U
	 qnclbGqNQAsCMUT/mAzjQmLLf+8iJmMSul7X0x2Dv5lmK2S4sYObpqHUZLoE4/QGQG
	 2/LbUXC1q78GQB42/OrZ5s+MWE9irsIXLsV/UCq0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B25F8032D;
	Fri, 17 Mar 2023 00:44:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BD93F80423; Fri, 17 Mar 2023 00:44:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 401BDF80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 00:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 401BDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lRwV/vdv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jc073woibVsYDJ6PsJWleJ+pdjlvD4lDbIao49LHIkPGnUPfSLEbua7pV15wPvA/pXz8TOt6R1P1O/Uor6Er7juu4uz9MNxkUrHk6ioaUKcXGnURfQN29eIJL2HmggYJ17BLIhN55q+XChhEz2C+ILFpN7UKKc/cf7WanGr+a8wcS56Dlwl0KscivcfWE/nVWIC9oDf82kvw/WtlRftwnnXaFjmhW3Vv2ZjpGU4MsAMsyYaWEMXNTLhynTMfpcL68Xx6jQ4WzsPRl4qQDBbJ/x2M6Zrz6dfyI0QQbqb0fFPoMHtJngBs0Lp1ZuVSGQxJJ1/w3tIaRvIXDblXCsHqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i54KQRMredqQM2sAUXn+J25MYPOrQ0gZqHymtnnWoFY=;
 b=hoSKGYDX8w/AuWjF1vPxxSRUFJ8qjhG3rKpqtoXJ4gvQAY/xU+UmUblBiUOnG2NVKxmBGJtf3WaqJGZ8u9TWmU3XYjDLn9o4EMNx+9k2PLKppLi8Vf6RXH2Nco4W/7ghuqJnzR7+1A3gUu7r9eSt2e3sulWP93vdxW3lYbEYHdZmIkOf5JGDBkWZEEFN8WFnsRt2cgPtW/bUI0O1Q+sT018CtOS895GWABmejo5fZInCMBdC38E0errp7HaFZBnJkF3iklKjeyPhdKacSfAdFvsAYQo+GSfUqg/6JT+nVIHZFGGwQhFsxhDM+frQK9vQIbPeSylxXPvzPTSmPpELFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i54KQRMredqQM2sAUXn+J25MYPOrQ0gZqHymtnnWoFY=;
 b=lRwV/vdv5sRcbZkpmqQYyWBlPrV/9Yxa+TxScCdUPE+b8Xm3EbMXmYRQ7jCzG9QcgW0lQ7I0hraKvtQ/JzMoNVXvGS7Wwb93BveTx4LDv+MOLiaHont5Ok1OvSVIHfmsfhH4qcF+nQPQhHkIaKyNmDdRs0/zZuDjE52wES+7Ybk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Thu, 16 Mar
 2023 23:44:04 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291%4]) with mapi id 15.20.6178.035; Thu, 16 Mar 2023
 23:44:04 +0000
Message-ID: <87a60c6z3w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
In-Reply-To: <b2810924-169d-0bad-8f20-6ec2e683d170@gmail.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
	<87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
	<b2810924-169d-0bad-8f20-6ec2e683d170@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 23:44:03 +0000
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 00606bac-1056-4d76-5bbd-08db26785350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pQP/VveHpMWP3LfImGXDLgZa2kIWZv80S8sX+M+Bgzkir0l5OWzOREdGKxZg70GZ63rxLg+3FI1ufvMxcN5AU2GQofGaqWdudtSrXxEhowLGdUiXBCT62vrQL+e41cjqQw0AtQVn5OLHIBj6aUkmrZYuhPAN55AnAygIrxtfuMaQ7v0Ur01JkghLsH9nF/mY0rhfBmQTHn7IAFU4DohtBDFSf4RQC9pmWkJ626Y9HV+WGMI/bWqqMK2Oh70crW1hx4oOeOFJgZ6vliPct7D6Vfpa/w+b75ER/7zF2HRPHft4393Ev6Ki63ihD+gzZv3NfjM473rFPLbRjG/7qjgGDePi1SBA7o+D0fdLHc0PHfL3F16N0sNcVtiMCIMFnnEXMx8RusyOiF9oYo1tEh+OgXoAS/DI6ksjMQCqo78WM36exed1vDIiUDpL37muBXhON9CaQXKUhvZ1EQcsjRzHjQZgXqOFcoVSyVhPnW1royezAjt0mEfo3tzM7nd+6JB4mPaL78tT7aKKtRKrEpkLzIbsNTcixLK7NxUAFMzF2AQGTOzeI0/oo46qQHcJSVVmt+yZLYgCUrR4eIIl9lFkLwlUSBfucqR4CjBFg4CBCX6Hcd1lUyY3rE0hjMzfbcfSMyhQXqd99CzmAdAW/MCmAKnwDtKf0FcBCooYqFoR/c+fAmVQGMZLCR9m31gWO3idpUyfneDprQ+w3w0PjIHtjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(5660300002)(8936002)(4744005)(41300700001)(38100700002)(38350700002)(86362001)(36756003)(2906002)(316002)(54906003)(186003)(26005)(6486002)(52116002)(6512007)(478600001)(6506007)(2616005)(6916009)(4326008)(8676002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?Nqk0VEVMvzPM5nJF4dDqqm6jLGPlgl/LD79xoCJQ/TKutcw05T7n9Oq9qQ?=
 =?iso-8859-2?Q?SDXq/lmWGVL54NZ95eCUtM0EfEUZab12AEf/lBtXlpdjv2ZgsqiT4DrFBc?=
 =?iso-8859-2?Q?3OgNWS9l+rP3ASvHeOzSGY9MRblTqrbothBMelAIl1omWNI1djEtp9oQGh?=
 =?iso-8859-2?Q?eDoWeJ3BvPXTh7UzofDyYeHh7En7AUa5PTH6ZC95C9XDPlRNZ5GOPR9lbo?=
 =?iso-8859-2?Q?FC67K6vipBkA/X3wHftwMyeuEDNDnM1mfrO1PsyuSu4dq3PNuH5mYacWO8?=
 =?iso-8859-2?Q?Ws/d7JaGo3et1mTgPKnyYiEqdpBOzGVh8GLq/kfwyHKzuJqYgALjNgl1Gb?=
 =?iso-8859-2?Q?ZGX+48vDXq9A0Mb3Sur26X9fw/xRB5pYd/tIlQdsvjyfA+z/tn1DjdUp+v?=
 =?iso-8859-2?Q?YQG6unK8GD0jv4leAIpzdrakyW5DSow5y0QlNxgwlmXpChpL6RRtgAjrK2?=
 =?iso-8859-2?Q?8Aitum3LIpVvrSwcCpE0sLS6ZiVkrRGUI5FC1hhEMB+XZ5wmtPITTQnUnp?=
 =?iso-8859-2?Q?H4FKN7nV2J9pz0mU14YkPFHnLbcWAAa73PhrMbbu8FPsggCGhV/2tTMcNZ?=
 =?iso-8859-2?Q?raAXkqBZhYY3Y8ba3lM7ha8cGiLHdWg+sjKQBhkJ1TuryOsWlSbvb3Vbsl?=
 =?iso-8859-2?Q?sJLmGKj2IDpoBmWG68tjAo0i89WRmQgvLQj6MnKGb6ubbITYErVyzB40Av?=
 =?iso-8859-2?Q?XpzF9u1tZYdZTDnQisNoqZjrnXdnKQRC88r6SRQeRxu5xCSKrOnoggrzRz?=
 =?iso-8859-2?Q?Gn6YBIC23ckc9AqAY/X5iPT/MJrwgjkY/W9NW13OSuwJFjW3UAyUAb7sGa?=
 =?iso-8859-2?Q?1Q5/5WjJ6ZSOYpeO86HK1WuagXtusj9J5Kow5PsuiX4JkYw6wpOb8bj4CK?=
 =?iso-8859-2?Q?eH6v2EKUW0PhM68BKW5dVExFGB49DMyf4Bmk83LnEFrg7SBU8t6JbPBFgH?=
 =?iso-8859-2?Q?jczGbJcwbp2KogLwv3/PSjAL7rIVMHihPV4AxmpxrLO2BRaBz8P4Grm9lM?=
 =?iso-8859-2?Q?ZyGDmqhz/3YgoB8hQewDyKbLtVICrSeI1etiH4LbqI72FHLSzMd8ZUXpWK?=
 =?iso-8859-2?Q?VT7n/sAwZ/0/mlpQYXG8Wdl3t2voP+lBkUuv+4Woyaeq4b7qAHGfjFRbRK?=
 =?iso-8859-2?Q?ler8MYI4p+rtJveNeNlRuLvAKTQVsFP3GdCeRHjgBoT3MkBBRJX7m29zEl?=
 =?iso-8859-2?Q?5KqRtfzuwOb7PdU4q5wFJwEbQakgaUUisy8eYoLisqpGFW579wedOAmzQR?=
 =?iso-8859-2?Q?II7+0icJl/Kd6cXLyTgLSvqdVGRupZSVpCMFFsrWkSyzccOXEEDj3O9ysG?=
 =?iso-8859-2?Q?yya+YJuHRDjp/q9fb7pF54/EzX8Z9LFfuIAIkETSA0BeFrLCV4L2iQwYx1?=
 =?iso-8859-2?Q?HetBOZnqRVIGn/b0HB38BbPUhszX+Gb/snlvQL/5EHwWCflTGEA4//rEZq?=
 =?iso-8859-2?Q?1F4czl5pGPg5o0uRhhIF+DWbI4wobZiX5+2jUakeYo4fNEVUE1w7EvTBH+?=
 =?iso-8859-2?Q?wdEXhaLN2kCXgu6EChILmMI9GtNP9rB0OD7mMx5IkkXxXCmJEuNBvRqY6Q?=
 =?iso-8859-2?Q?o6nNU3iNhcH8RMNIrO9F1l4yUWi0iPBUznd752NEfLzxrkqUP13qlZgjmy?=
 =?iso-8859-2?Q?Il9j8wvBNUtxRRYjWqQbuSmq4csmrTWZUM+Y5mvJmnntcbw7U7vJA7RDAa?=
 =?iso-8859-2?Q?5wYPB6x7lrhghTSeRm4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 00606bac-1056-4d76-5bbd-08db26785350
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 23:44:04.1106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ng4HnxZrIuLsXvTVbmvwpPJT99R4g55eFxqqMKAEVNxoZXCONfHD16IhDqXMvaK6dJY1crQiBzqTYOipAXDExX8RExl9Y1wBdNx9jRqlkAIzuikzSp01b7lkAPa8Gw0E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: 3332LONCKUAU5VBRBGCABQBY4NBMYTDQ
X-Message-ID-Hash: 3332LONCKUAU5VBRBGCABQBY4NBMYTDQ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3332LONCKUAU5VBRBGCABQBY4NBMYTDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Rafa=B3

> Hi, this patch seems to add errors for me. Are my tools outdated or is
> it a real issue? See below.
(snip)
> > +  #--------------------
> > +  # reg/reg-names
> > +  #--------------------
> > +  # for Gen1
>=20
> This seems to cause:
>=20
> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:282:4: [error=
] missing starting space in comment (comments)
> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:284:4: [error=
] missing starting space in comment (comments)
> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:339:4: [error=
] missing starting space in comment (comments)
> ./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:341:4: [error=
] missing starting space in comment (comments)

Hmm... I couldn't reproduce this


Thank you for your help !!

Best regards
---
Kuninori Morimoto
