Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C709807DD2
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 02:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8549F6;
	Thu,  7 Dec 2023 02:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8549F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701912141;
	bh=4rpNM1qoPSVFaxgzkYk3HC5hCLhf8X7NPF3+pSgnW3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CHffhQI6IfJhX6ZfBe9K/bJ/84hdN7Tly5ZHcnLjt2GnTWzWzOWXKo8wCHwYLjRfo
	 99bAKdTVOsBVZL/1q+XW+v6HeRkyhJ8n98tBy7TnTgFKS91uKfdUqLJLvkDWqxsE6C
	 WbPxRuk83zPYDMXvTO7SfOuviWOLAQFOWCaazqcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE98F8056F; Thu,  7 Dec 2023 02:21:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E301BF80571;
	Thu,  7 Dec 2023 02:21:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66874F8024E; Thu,  7 Dec 2023 02:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09BCDF800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 02:21:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09BCDF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MjZ2QL/5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dR2WsOUZp6Vn3s3BHF1wbBk2dHWNIucnriGbdnXnS9ITtp/6+b6b3DZbn+PnsAAxw/1Qh7W4bEU5xIn2SQ6rsaEoTO7YLK5Vtu5Ckq6Vb5S55rJi4aGh7vUf/nNWSgQevs15oWrE1wK/67kU1qhYbQZvd8vnVAqorLvhyg4DobknpzeySIwJvQPjtN/LDh7g7HPfG0ysO15xoBIa1Vtgue4BxuMbMhuEH1WQQJDd3O2FNYbddASHFGJQ8bhhCWwXt81RWAuSR43taA1T2hBbEa3EDUWOfwJJEvha9HBgUVUg8icF4Xdw6s2w99eexddVEh1hCaVBvIAwtg66DToHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dm57pxbR2LlG5Vio9xUh/7cYR7KKI4LbtZmc/4d0hbg=;
 b=Jgp4CiWJG94nzMgQnKXXiiVZk7ae+Z9jEsFUXfjYn+KmeEBNklYxyRRhSHiBnGEw/RDZVWfDkb5xMoT2CoRgabIbn4/sXvXEFRtLcgI+q0mZwAaZJDyEo69YQ3L8qjK1QkCxOem9a1NWoSQgjgNXvKGld0Inddj5XGK/JVunxGUQohpN1hF8wnwUsMWpd5DZi/mWH+tvUM/Ub4pwFt63lg47WqwvIvjrr21gFLrzo9PGGXH6PJnjDme8kjYmWv76maUOUEp0Gv65NyqZ3P9R9IEGCZaUlFlaQi0jPiQwxjgPHN4BMIVgtcoNAmQnEociRgdQOvh8laRvu1nTjegjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm57pxbR2LlG5Vio9xUh/7cYR7KKI4LbtZmc/4d0hbg=;
 b=MjZ2QL/52zmYy2a8b9yYVOatOMWtokE55f+JrOYbMsh9cIzfboNCytw5O7KxB8mqAEprQh7R6uz0FrjurWLrqRiRp5QizbMo1FqHra9yZAQTedCaIr85j4C4Bk9Ofv0O/3m8pbmjWGIpGTDoR+NMM3NH5yV52SYrk3okVMf43cM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7753.jpnprd01.prod.outlook.com
 (2603:1096:604:17c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 01:21:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7091.010; Thu, 7 Dec 2023
 01:21:25 +0000
Date: Thu, 07 Dec 2023 10:21:25 +0900
Message-ID: <87h6kuolii.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 5/5] ASoC: soc.h: don't create dummy Component via
 COMP_DUMMY()
In-Reply-To: <053ec252-e4df-4ccb-80fd-a802dd212b15@linux.intel.com>
References: <053ec252-e4df-4ccb-80fd-a802dd212b15@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TY2PR06CA0038.apcprd06.prod.outlook.com
 (2603:1096:404:2e::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8e6906-eba9-4bb2-67d9-08dbf6c2d4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZFnpiNJoCpQnmGW4kQdIQH8n5Jw9FijyWJ/uRAZzBHdVkx00JvwOoCpwisljJyI4ATmTpgEHuqsixgx96PiWiOVe0nQ3C5A346aBTzs5RlviibnYglB4oJrf5gY+sQMH6xFmtHYjVQv4spjcDmQjMQ85bunb0uLSErPtKyG7XZSxrj3CrkDdHOYdXq4AQ8vYVGk/Xh2DL5DUuyzG5Z+/O9EuLcDQDA3G31T98z4hZhofnAn5KAhtM8258aNW1shWcqBfv1Ust8FQlOlAeLd1OgH/HSSBJmggfYdp4TxT3A/d2j8bv0cy2vbQzxdGtBw4HCIeo1VL5/rMUPYZ7mpNpMRgwf8ZktaN1GanpSKbpT0Hk+YVL1mWtwR2B6zwSNG3IHtU2aN1t05uPSOR25rMqQQkXDehZtnjuOudJ7Jsl5APaMV9FRaEhuM8hZlGwBtnxJx2/r4KjbMcYIG/E3dyA92vq1CP2yP33I5pbSI30dERXx7Ooif8Km3bvFqzWjY+4ubcwhbyhKDsY1erYFyLbTWTSchUaCk1sP2ZRgG6xd7dXCAk50AQz59TXiiHQhqlSSwDnez3TkXlLklj28Dx/Zk+oOR/kJIQ754qFh5iuTpxk1NLDVNvKzfbTd7On7wU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6512007)(2616005)(6506007)(26005)(52116002)(478600001)(38100700002)(36756003)(6486002)(316002)(66946007)(66556008)(66476007)(54906003)(6916009)(4326008)(8936002)(8676002)(86362001)(2906002)(41300700001)(38350700005)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oRIUn0Kir90EoNWmuqJJlXoqyVxufKPPZdJpOO6l7FEZ+0DM4HP5q1IUi3hM?=
 =?us-ascii?Q?GkBrj2uNKnjraHgMYpNfPoJ3/K0jrdvbGzFWixUOS/emDjBNAezO1NJDCp86?=
 =?us-ascii?Q?ncycVK1o0ILRhrUVGC4+YJ4wUY4GKAWg71NIC1d4jzTmnMeMogfTtQmV8CSX?=
 =?us-ascii?Q?r3wu3y0/Pc55IkukPjnQqOIvRg+Rzdf1GYuCGoKan1QEt9O+KzO+XwY/L4Dn?=
 =?us-ascii?Q?c5lSV7k27y0UUN/VCejaboZYTXIdy3EmBqsZJMxjX0h7OSYNTrMvmbIUvBW1?=
 =?us-ascii?Q?tLXOqwdIiQTa2V4PN7MEe2nSUenmYpfTWHa3im9/6i2xbM/OBMQWEvSvT0nQ?=
 =?us-ascii?Q?HIsDqbsrUGhUf/dFjZ4BASq6JyZbYZThsFm/Qo12H3aw2/c5Gq2uiU0KZqo5?=
 =?us-ascii?Q?I7/6UmKH8NGciTrcC2Bt/XKhmz26OuVstM0PhY4Iaa6fq7zSOcFDeLnrKd0L?=
 =?us-ascii?Q?lXbN9g3uEhAb8c3ozJp1wR2myeQkH4S9XTZpJIb1oJkuQMBMGIWDaHAXaTU1?=
 =?us-ascii?Q?iQTImpmqyJhJs3JNEbENFfeHmSFSaAnjHfCKakwj6/BhXdCbKFliKCzyOatZ?=
 =?us-ascii?Q?NHMLvOr84Vo4M5r9ybE9mdhwiSDCNclwQp5ETbkR/MMfImSIzQ4J2ZOY3AGr?=
 =?us-ascii?Q?eVhEoWrB3V6gEBN/GYbkGXtYKA968IuxVjKkqcVF67YiX2RVLAZGcBPD4tiu?=
 =?us-ascii?Q?wmUsn59d8JZy5CCVnaLfmx8BkGo8zQQzldYj9GuI3NlTfX7HiSYNLJh2jc1P?=
 =?us-ascii?Q?jMKQ+IZroocj37Rd67XGiwU9HB0KT7mbpQxo0Z8InN2SpDzp5nwhezR00Avu?=
 =?us-ascii?Q?ry6zsrEdaVfpydX9MDmtNBDa9PksOcPNO9iNCl0vsJqwTxnzXe/0KXH+cDAo?=
 =?us-ascii?Q?cgZyCbOiBsV1l1UlzvsmwSzyH82viVxr6EPBpQyr8CHxiDaWK8fYK1o/slD1?=
 =?us-ascii?Q?Qs7eV36c7yoe8oKhi9NhSuGkDlJQ5L4dqU1H1zP0aEMGrG0wW3K6HmgY/Tz3?=
 =?us-ascii?Q?eTnHpBT3I4dxEgKRhosGJ1aZRH37ov1JbQsN0nWS4Y/nVVvz7mUl546n74R7?=
 =?us-ascii?Q?AI4qvzTPzd37SR+ewIq6Ayue/PjAg9fKtXw/fCZuE3ukqLKaknLVZv2BcHQB?=
 =?us-ascii?Q?T1BugMotRcrUaBeWq2PEbjUobiNMTBxfw0IBpWvtTxhMiYdD/4pXoeTgmUeK?=
 =?us-ascii?Q?jFef5aZE5qqLGqhtXu1gEdgKUpbG2WFAoPHKR25kowJX/rSgNtKsJJmz6Akx?=
 =?us-ascii?Q?zF5Q1njT8BsyXytfzc3AV9+aFhL9qQhLQ+c/wJzUuPULUvdID9D8pC3T9BJY?=
 =?us-ascii?Q?Vx5H6bI4EcLfXGmK2Yqnf9KgU8AjbK9QgQ/ejwy5FLMaQiWLlWR2hfxp35RT?=
 =?us-ascii?Q?qUNGSvYAY1bB4jxNKuOtOyYshb81spNuY6RpI/+S5q0/4SzhGVC8y/w9WSdK?=
 =?us-ascii?Q?oqZF9P+LxqklskIcxqN7LGO7z4eaQIklKJmWvsHLXo0oReJa2pqfmTewb9To?=
 =?us-ascii?Q?VoBc/3plDHi0P1lUCuwTb4LTmBSAnh/xHunAUWLhiaMvp9Bp+ew4cLhfwlO4?=
 =?us-ascii?Q?1ITZbE6bRNvQiTkmmpJkrzO9d8DaL8l/wvcdSiD1DTVEWcZ5nAM6QQxXu3mS?=
 =?us-ascii?Q?4Gd545jr5JjXsOP9xyHUIj4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab8e6906-eba9-4bb2-67d9-08dbf6c2d4d4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 01:21:25.8830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e8kOIGkwjXYU9ibReqkhLS+vvYVUMfp8fdpAdso7npYUelLUuVgsVe7o4Ppl4bnYD9hAHM1lXyLDek3IAWeAv/FWPRrutFtQlREyoOpHL2h0/ChNXj25YuRQN3D3EbOz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7753
Message-ID-Hash: J734B46KTZYB7GE6Y2GRXWF326I6PTYF
X-Message-ID-Hash: J734B46KTZYB7GE6Y2GRXWF326I6PTYF
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J734B46KTZYB7GE6Y2GRXWF326I6PTYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

Thank you for your feedback

> > --- a/include/sound/soc.h
> > +++ b/include/sound/soc.h
> > @@ -938,7 +938,7 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
> >   #define COMP_PLATFORM(_name)		{ .name = _name }
> >   #define COMP_AUX(_name)			{ .name = _name }
> >   #define COMP_CODEC_CONF(_name)		{ .name = _name }
> > -#define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
> > +#define COMP_DUMMY()			/* see snd_soc_fill_dummy_dai() */
> 
> Isn't it effectively making COMP_DUMMY same as COMP_EMPTY, or am I not 
> seeing something? I guess next step could be to just remove all 
> COMP_DUMMY and replace them with COMP_EMPTY to avoid two definitions 
> which are same thing?

It is a little bit macro magic

COMP_EMPTY()
	static struct snd_soc_dai_link_component name[]	= {{ }},
	                                                   ^^^
COMP_DUMMY()
	static struct snd_soc_dai_link_component name[]	= {   },
	                                                   ^^^
EMPTY case will be 1 element array, DUMMY case will be 0 element array.
So, EMPTY case has empty element, and is not a special/strange array.
But DUMMY case, it has pointer but 0 size array, very special/strange.
This patch making this special/strange array on purpose, and convert it
to asoc_dummy_dlc() on soc-core.c
Is this good answer for you ?

> > +		if (dai_link->num_platforms == 0 && dai_link->platforms) {
> > +			dev_warn(card->dev, "platform don't need dummy Component/DAI\n");
> 
> I would just replace above print with code comment, no need to spam dmesg.

OK, will fix in v2


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
