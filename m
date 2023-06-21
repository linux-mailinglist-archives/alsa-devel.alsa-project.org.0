Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23177737906
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C33C852;
	Wed, 21 Jun 2023 04:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C33C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314034;
	bh=8PTbWBm/OK0CVS10aKIjid/zX1Arg2imtjVDR9bvePI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y2gvFWaHNdCpx+xUoNeIBYguXVHa4+AC1shA/kV9O325O4CeFwhSDMCEti+n6/8L9
	 TRGlbqLqKudmezQECbuBaC6OByYZaM514uFZ4coBYoOEZKqRpeEV2gGuszNmvg0Rps
	 ScnEFXFqY/0nMjZFBo2Zrzzzq3F4CWLCvQKjmwXI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6126F805A0; Wed, 21 Jun 2023 04:18:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 822EAF8051E;
	Wed, 21 Jun 2023 04:18:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C369EF80587; Wed, 21 Jun 2023 04:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F372CF8051E
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F372CF8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XHdG/GYJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGrBPjmBMRslR0GWcASB//eQamY4Vxxsotc+LXlkf0mz/q6h+t//5kl3qdXuaflmj2oFWeyxP43YNB+1YnA4e6C3uxNfWZb5DyQZEtQ/MSO+7QpfirT7WS6AbNwYZNFoC+wu4GLuPpjsrwogD5qmhkBjtZSRPq/guKhbYGSRnuuKbqoyu/ePfk9TAc0GqPaKyppwOHdwT8VYsvcw/TFCz/X8As7B2UhIVOvklUac5kQXyGco+wZw5ekoarzBZboPsFf0grvx/oRK3MHrARYV+tzXUDJXtxO6WWfqgdUoLcP028Yj1E0hB1i1XQobh8sfWc+bDktyWjivcbzFKLCNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj979P6MSjyxNKkbL4QcTcS4VRF8C9rmkUEg/YupMr0=;
 b=Q4DFziyVNnsY7/Smg/yDj5W92fDZe3sBk+dkAWfutA+uEpV/lB1Ypzo2pXGm96vEXTTZXTCyi2B9VByIU1OW4WZZTTGiv3W5sN7yaVjYr+VTrhOCxmqKIIfKQF1oEwDTWxVi7bgpthblLTj5vTN2DP+mP5vcxBazjmyorMB1dUyLdrKPe7YMkrAE3zKJdZyrli20sAtIfAIBl8pKbRhIpRhnk+Z/DUjZA9qYD7hiElaxIxjxTXqLYB7QMsufE7bcybO4Hl5r8MkD9Vlad+P+KAjLmV2Ve26TaFqYzU2G3Cl3wxjVneZqQX1rYqbUtiMXo6WLTLvMwO+Dtig/mPwiAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aj979P6MSjyxNKkbL4QcTcS4VRF8C9rmkUEg/YupMr0=;
 b=XHdG/GYJ879eqzkqzFBk2yioTzta0exMb+Jrk9DBXw7XWd/tnEGGJjXSmLzdDc76q0m4pF25XxwE/sf6/nUGqCDK6ttfv2POUziqRyQt59eT4haKKyVeF+ykiMfd6iWdKDyyVJcZM0yWkDuH9yakQgSJwmOa809ncZn3SIJCQnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8528.jpnprd01.prod.outlook.com (2603:1096:400:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 02:18:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:18:36 +0000
Message-ID: <87legdbls4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/14] ASoC: soc-core.c: enable multi Component
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:18:36 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: e53fd248-e79e-46d9-6b28-08db71fdd1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	23wx/79WfLBJ+f8P++Jr0dCkHgWfMekbxo40lM2VkBsXYvGvFFGQB3pvsLM8ItcLQ/zsIZIJJWN1bEXo5nO0TrWiVSqJaCO6heZ3UOM87e/eL2kB09U05Zfxqq9zSYxQR67gikR0pUlGb8DpkMzMCXBUbUhiLWSlNEUFlTR/e3EYAfKwNSfvRqQ9bWVK/ciIZA45mqF/Do3/49kh7rElntFA8fdlZ6N7xE0A/LGoEbc6tObd/14p0aGl741RMBhMy7jaPW7BvO5D6byPmH8xG92/0IPzsqfUTBlSGwxtpZiQsKfTH7hBtUbUsVQSZlfkXc7HyJ9mpxEgStNLEqgj8AOhSn7neTdbVUO1qGnkeG6lr+074j/UpeeqE7Rm2zZKIH0evds3G2Tl7xAUx/IbO6G5XWb0q+Io02r+UPFofK0waeZzgdfdECjz890itXT5lpU9mKGcDhhSG1WpcsPRdOgWbiqgJ0bCmKhVo053p9AtNtv6sxpNOphZu+zTrEvpSqZ4E5eYGcOYeTV4qMwkBGpUggpifUUD9tdY/VAa+SOKKTLaBqCQjFPOjaw2CWA7phtmaQPigroTPZfO41CrP3yinJuqN1nT0IS1M1V80PaTBvo9z8duYQAao4uTsW2igfU+5QWGD7p0SBnHgFxNR4ZDVEEdkUt3gtd7ySpdf50=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(66556008)(66476007)(6916009)(6486002)(66946007)(4326008)(966005)(186003)(5660300002)(2906002)(6512007)(36756003)(83380400001)(26005)(30864003)(2616005)(66899021)(316002)(38350700002)(38100700002)(41300700001)(6506007)(52116002)(8676002)(478600001)(8936002)(175924003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?00s2Al9VHvOmbepgjYELVQymRW/oYwDvkOO+kOGeOtYZQNfMzZsv+Z5R8Z+z?=
 =?us-ascii?Q?cgrgYvmWdEiZhqjAJcxkB+6RUtBF1Z5g9qChgF3XhGjtZA805m6yRLRwm7ed?=
 =?us-ascii?Q?PQZz+ERiCdPBLKvFnOCkDdrXM8wk1BXPT3ZW11qlCQhQVjPcS3bmfIcJ8o/b?=
 =?us-ascii?Q?PRNIneNLNhDbHvTThzTrvQdI6puRYVJUTMCQ1U96LcJPEIuIWxpUN+g6ryzY?=
 =?us-ascii?Q?TdNGnpw35fWXRrmfuKOKJLKTT8DN0GspJO+zycbyu96PR2I60U4R0S/uIpHw?=
 =?us-ascii?Q?Gut0gSZUhP2WTXV7KvKp+jinsVDtnhomHgNOhtTkK5QTx95G58pKNxTyvNJf?=
 =?us-ascii?Q?5xgncdXtNbGPaEbNNJ/k+2zFsftRv78WTTSsY5G1KaHiy8IUrDuWn3EWYa0E?=
 =?us-ascii?Q?T64bJ32hj2BjVhUwHRYw3yBVssdD6Lpw49XYALHyOeG26sTBMxg+U5kUWlNo?=
 =?us-ascii?Q?CA6JSUIzin1vu/8mHvuw4PIDc92yOMw0QRIc2XM0CC/qcNXTGJcCa5x14F5p?=
 =?us-ascii?Q?em0xhoCcB+INoqaGR3YkSzS0tOssLF6kFriMKgM9G3trAg0No85X+DEjGfxY?=
 =?us-ascii?Q?mCc1abRQlzix43L1S0XgZPEE6fKU5FV4R7p0n8Q/xg+bF6/y3/TCHbqj05BF?=
 =?us-ascii?Q?jPdMIYSEB/XLSy+/LEXWsnTIJmGsxNU/WPIfvzG7ju4b5xk+9TSKnv6upijb?=
 =?us-ascii?Q?zNeylvlrZFKm1DqvX3hf3D/RvhJ4BERSdHqTBAL7qdZe64RLLR6wdF+0N5bn?=
 =?us-ascii?Q?X2HlPs9SRAT243n2cMld8bi3OaZnm5CJE+HuiCEJ/DCMwPFkpw6ZP5kjKcLs?=
 =?us-ascii?Q?2QPW+i9gFAN/fU1yc4ODzVaSxIGWV0INgqmqNHRCKxG+kHADqdogwTc3lVYi?=
 =?us-ascii?Q?1n7F2GNzqhujvh0TqppJnqLRtSwKrFCTnLdZdT2H/hN4H2+bKww9S17qwReU?=
 =?us-ascii?Q?ddToAd8h2ssNsevOljgVmkCv9TP6IUtb7EXWmxmXcG3Nqo29pJKgT8dVoInH?=
 =?us-ascii?Q?wvm0PQSrg33wpHm2Z3SanxbD914aN40YmlLTcImwqjCvf8J8umqTH3qC/we/?=
 =?us-ascii?Q?SeSnK1g+MD/tY+0tS6jUyz4uReu0hrvd3tNoeVZ7rfBGaLzB78UVLp1d6JMB?=
 =?us-ascii?Q?ekARdY5YpmgcMxGQLJ3UwARAwcCMm9cq0ukWCufXkqXqxshQBg2YFyOXc0vq?=
 =?us-ascii?Q?aLufx5pVdI2XEbNTS05/gSeKx/e3Cwfk3e2f7GLPrHFjUVRg2qunNOEycOPO?=
 =?us-ascii?Q?Sf9H+SAzXHI/zCqlRmcDcUpzoiRCV4GzAy9Wgps3P3kcigkSObU9qT8R4Yqp?=
 =?us-ascii?Q?zM0UOLXkw+JXtRqdmxJZ244cygpY8PL2IgPvsz3Xm9kQ03HcAT4QyIUpzMT4?=
 =?us-ascii?Q?MbpNNXNEB84qRFjuc5XIU5FtpubDgbDUzGzDkwNXOebwP9AjKriGVATXakIP?=
 =?us-ascii?Q?M+H21ON4uHBVrbjuyngnZr6+kpVmn2L/zWYdnRZm78dSgeSs/9t4YsiaDPWc?=
 =?us-ascii?Q?a4IkNuBLoRZ71+Na/M71wVkjb5Dg1OV2rB6H7itP1dp0xTMLWaBuTkmj4zfi?=
 =?us-ascii?Q?4roXploRr/s3AP3lX1gsF+c6zZDSEXoyEuCmrV96ihIwLU6slvHmuh1ir4R4?=
 =?us-ascii?Q?L/aCy2AWzhTuWRPeNSFreTo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e53fd248-e79e-46d9-6b28-08db71fdd1a6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:18:36.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YNFmpO0E0jMO9Ym0MTUu1dIf6fo8smy1pdxyu4hMP+YjIrOuvDSl5oPCW5sNOvSqjYzcheIymkLtBdU6X8ibASm3llmlnZLMXC1eKEC7X+0XzfEdGEBndvhKWYsDdYLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8528
Message-ID-Hash: JMGI2WRPVMT74CARYLV6HH2NZC3GPQSA
X-Message-ID-Hash: JMGI2WRPVMT74CARYLV6HH2NZC3GPQSA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMGI2WRPVMT74CARYLV6HH2NZC3GPQSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC Card is using dlc (snd_soc_dai_link_component) to find
target DAI / Component to be used.
Current dlc has below 3 items to identify DAI / Component

	(a) name	for Component
	(b) of_node	for Component
	(c) dai_name	for DAI

(a) or (b) is used to identify target Component, and (c) is used
to identify DAI.

One of the biggest issue on it today is dlc needs "name matching"
for "dai_name" (c).

It was not a big deal when we were using platform_device, because we
could specify nessesary "dai_name" via its platform_data.

But we need to find DAI name pointer from whole registered datas and/or
each related driver somehow in case of DT, because we can't specify it.
Therefore, Card driver parses DT and assumes the DAI, and find its name
pointer. How to assume is based on each Component and/or Card.

Next biggest issue is Component node (a)/(b).

Basically, Component is registered when CPU/Codec driver was
probed() (X). Here, 1 Component is possible to have some DAIs.

	int xxx_probe(struct platform_device *pdev)
	{
		...
(X)		ret = devm_snd_soc_register_component(pdev->dev,
					&component_driver,
					&dai_driver, dai_driver_num);
		...
	}

The image of each data will be like below.
One note here is "driver" is included for later explanation.

	+-driver------+
	|+-component-+|
	||       dai0||
	||       dai1||
	||        ...||
	|+-----------+|
	+-------------+

The point here is 1 driver has 1 Component, because basically driver
calles snd_soc_register_component() (= X) once.

Here is the very basic CPU/Codec connection image.

	HW image			SW image
	+-- Board ------------+		+-card--------------------------+
	|+-----+      +------+|		|+-driver------+ +-driver------+|
	|| CPU | <--> |CodecA||		||+-component-+| |+-component-+||
	|+-----+      +------+|		|||        dai|<=>|dai        |||
	+---------------------+		||+-----------+| |+-----------+||
					|+-------------+ +-------------+|
					+-------------------------------+

It will be very complex if it has multi DAIs.
Here is intuitive easy to understandable HW / SW example.

	HW image			SW image
	+-- Board ---------------+	+-card--------------------------+
	|+--------+      +------+|	|+-driver------+ +-driver------+|
	|| CPU ch0| <--> |CodecA||	||+-component-+| |+-component-+||
	||        |      +------+|	|||    ch0 dai|<=>|dai        |||
	||        |      +------+|	|||           || |+-----------+||
	||     ch1| <--> |CodecB||	|||           || +-------------+|
	|+--------+      +------+|	|||           || +-driver------+|
	+------------------------+	|||           || |+-component-+||
					|||    ch1 dai|<=>|dai        |||
					||+-----------+| |+-----------+||
					|+-------------+ +-------------+|
					+-------------------------------+

It will be handled as multi interface as "one Card".

	card0,0: CPU-ch0 - CodecA
	card0,1: CPU-ch1 - CodecB
	    ^

But, here is the HW image example which will be more complex

	+-- Basic Board ---------+
	|+--------+      +------+|
	|| CPU ch0| <--> |CodecA||
	||     ch1| <-+  +------+|
	|+--------+   |          |
	+-------------|----------+
	+-- expansion board -----+
	|             |  +------+|
	|             +->|CodecB||
	|                +------+|
	+------------------------+

We intuitively think we want to handle these as "2 Sound Cards".

	card0,0: CPU-ch0 - CodecA
	card1,0: CPU-ch1 - CodecB
	    ^

But below image which we can register today doesn't allow it,
because the same Component will be connected to both Card0/1,
but it will be rejected by (Z).

	 +-driver------+
	 |+-component-+|
	+-card0-------------------------+
	|||           || +-driver------+|
	|||           || |+-component-+||
	|||    ch0 dai|<=>|dai        |||
	|||           || |+-----------+||
	|||           || +-------------+|
	+-------------------------------+
	 ||           ||
	+-card1-------------------------+
	|||           || +-driver------+|
	|||           || |+-component-+||
	|||    ch1 dai|<=>|dai        |||
	|||           || |+-----------+||
	|||           || +-------------+|
	+-------------------------------+
	 |+-----------+|
	 +-------------+

	static int soc_probe_component()
	{
		...
		if (component->card) {
(Z)			if (component->card != card) {
				dev_err(component->dev, ...);
				return -ENODEV;
			}
			return 0;
		}
		...
	}

So, how about to call snd_soc_register_component() (= X) multiple times
on probe() to avoid buplicated component->card limitation, to be like
below ?

	 +-driver------+
	+-card0-------------------------+
	||             | +-driver------+|
	||+-component-+| |+-component-+||
	|||    ch0 dai|<=>|dai        |||
	||+-----------+| |+-----------+||
	||             | +-------------+|
	+-------------------------------+
	 |             |
	+-card1-------------------------+
	||             | +-driver------+|
	||+-component-+| |+-component-+||
	|||    ch1 dai|<=>|dai        |||
	||+-----------+| |+-----------+||
	||             | +-------------+|
	+-------------------------------+
         +-------------+

Yes, looks good. But unfortunately it doesn't help us for now.
Let's see soc_component_to_node() and snd_soc_is_matching_component()

	static struct device_node
	*soc_component_to_node(struct snd_soc_component *component)
	{
		...
(A)		of_node = component->dev->of_node;
		...
	}

	static int snd_soc_is_matching_component(...)
	{
		...
(B)		if (dlc->of_node && component_of_node != dlc->of_node)
		...
	}

dlc checkes "of_node" to identify target component (B),
but this "of_node" came from component->dev (A) which is added
by snd_soc_register_component() (X) on probe().

This means we can have different "component->card", but have same
"component->dev" in this case.

Even though we calls snd_soc_register_component() (= X) multiple times,
all Components have same driver's dev, thus it is impossible to
identified the Component.
And if it was impossible to identify Component, it is impossible to
identify DAI on current implementation.

So, how to handle above complex HW image today is 2 patterns.
One is handles it as "1 big sound card".
The SW image is like below.

SW image
	+-card--------------------------+
	|+-driver------+ +-driver------+|
	||+-component-+| |+-component-+||
	|||    ch0 dai|<=>|dai        |||
	|||           || |+-----------+||
	|||           || +-------------+|
	|||           || +-driver------+|
	|||           || |+-component-+||
	|||    ch1 dai|<->|dai        |||
	||+-----------+| |+-----------+||
	|+-------------+ +-------------+|
	+-------------------------------+

But the problem is not intuitive.
We want to handle it as "2 Cards".

2nd pattern is like below.

SW image
	+-card0-------------------------+
	|+-driver------+ +-driver------+|
	||+-component-+| |+-component-+||
	|||    ch0 dai|<=>|dai        |||
	||+-----------+| |+-----------+||
	|+-------------+ +-------------+|
	+-------------------------------+

	+-card1-------------------------+
	|+-driver------+ +-driver------+|
	||+-component-+| |+-component-+||
	|||    ch1 dai|<=>|dai        |||
	||+-----------+| |+-----------+||
	|+-------------+ +-------------+|
	+-------------------------------+

It handles as "2 Cards", but CPU part needs to be probed as 2 drivers.
It is also not intuitive.

To solve this issue, we need to have multi Component support.

In current implementation, we need to identify Component first
to identify DAI, and it is using name matching to identify DAI.

But how about to be enable to directly identify DAI by unique way
instead of name matching ? In such case, we can directly identify DAI,
then it can identify Component from DAI.

For example Simple-Card / Audio-Graph-Card case, it is specifying DAI
via its node.

Simple-Card

	sound-dai = <&cpu-sound>;

Audio-Graph-Card

	dais = <&cpu-sound>;

If each CPU/Codec driver keeps this property when probing,
we can identify DAI directly from Card.
Being able to identify DAI directly means being able to identify its
Component as well even though Component has same dev (= B).

This patch adds new "dai_node" for it.

To keeping compatibility, it checks "dai_node" first if it has,
otherwise, use existing method (name matching).

Link: https://lore.kernel.org/r/87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |  1 +
 include/sound/soc.h     |  1 +
 sound/soc/soc-core.c    | 32 ++++++++++++++++++++++++++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a4538040e88d..a33d803fe548 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -399,6 +399,7 @@ struct snd_soc_dai_driver {
 	unsigned int id;
 	unsigned int base;
 	struct snd_soc_dobj dobj;
+	struct of_phandle_args *dai_args;
 
 	/* DAI driver callbacks */
 	int (*probe)(struct snd_soc_dai *dai);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index b27f84580c5b..dda731795bd4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -651,6 +651,7 @@ struct snd_soc_dai_link_component {
 	const char *name;
 	struct device_node *of_node;
 	const char *dai_name;
+	struct of_phandle_args *dai_args;
 };
 
 struct snd_soc_dai_link_codec_ch_map {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index bd811d10b792..fc6922ecc3fd 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -238,9 +238,25 @@ static inline void snd_soc_debugfs_exit(void) { }
 
 #endif
 
+static int snd_soc_is_match_dai_args(struct of_phandle_args *args1,
+				     struct of_phandle_args *args2)
+{
+	if (!args1 || !args2)
+		return 0;
+
+	if (args1->np != args2->np)
+		return 0;
+
+	for (int i = 0; i < args1->args_count; i++)
+		if (args1->args[i] != args2->args[i])
+			return 0;
+
+	return 1;
+}
+
 static inline int snd_soc_dlc_component_is_empty(struct snd_soc_dai_link_component *dlc)
 {
-	return !(dlc->name || dlc->of_node);
+	return !(dlc->dai_args || dlc->name || dlc->of_node);
 }
 
 static inline int snd_soc_dlc_component_is_invalid(struct snd_soc_dai_link_component *dlc)
@@ -250,7 +266,7 @@ static inline int snd_soc_dlc_component_is_invalid(struct snd_soc_dai_link_compo
 
 static inline int snd_soc_dlc_dai_is_empty(struct snd_soc_dai_link_component *dlc)
 {
-	return !dlc->dai_name;
+	return !(dlc->dai_args || dlc->dai_name);
 }
 
 static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
@@ -259,6 +275,9 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
 	if (!dlc)
 		return 0;
 
+	if (dlc->dai_args)
+		return snd_soc_is_match_dai_args(dai->driver->dai_args, dlc->dai_args);
+
 	if (!dlc->dai_name)
 		return 1;
 
@@ -799,6 +818,15 @@ static int snd_soc_is_matching_component(
 	if (!dlc)
 		return 0;
 
+	if (dlc->dai_args) {
+		struct snd_soc_dai *dai;
+
+		for_each_component_dais(component, dai)
+			if (snd_soc_is_matching_dai(dlc, dai))
+				return 1;
+		return 0;
+	}
+
 	component_of_node = soc_component_to_node(component);
 
 	if (dlc->of_node && component_of_node != dlc->of_node)
-- 
2.25.1

