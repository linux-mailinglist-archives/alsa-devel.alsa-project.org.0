Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A86BDC9C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 00:03:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E46B91045;
	Fri, 17 Mar 2023 00:02:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E46B91045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679007800;
	bh=60DNuNNeYHpXmHaxOKK855OMrEADs2Z2zxbbuG3xJvA=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fL0VQVY5PtPj3Qq1GJYXQXZCJj1kHPWM0u8P7NwInBBYMLRR+2YsjT+13LbWHnBUF
	 XD/UzYO2duBs8VQg14suEdrEhOAicOv/JDBNBoR/swlJEwIdnQ/ARSitWd/pd/qhG+
	 XEp8O/PCw8Yd1Y/4meNx9f1PO9wxnQsiqS9KEJPU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8658FF8032D;
	Fri, 17 Mar 2023 00:02:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92297F80423; Fri, 17 Mar 2023 00:02:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C99FF80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 00:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C99FF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nw/m42qH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF1rGHxjMKUA6MK2lYF9XnGN+ZxN3Hye3nOYqKR1DMDjMno259JtFuQL9qV1SoHaP4jJN8qL3mwhJW/ANwNG4qdpzT1tEfjrHSDWnbJIyurmCDarfLK7dciWJPM/rqNwnOelmVVscdHI7iRlycENz1Gk1bD5Q/JqctyUL4T+wPgtVCgwRwSNyqsh4KsAJxuEswsOO/DfYWz5BS95YejY3YiqevxkGjhQvDU2X53o3DcLgWwSzhAsF1jSKLS+RXSu6KyqLnOgg5gFmoVSTzLaDV/sEnG/REgl3Ry4XO4HMiKGcQxk67ms2+KaGPYIWZgI+XUcDE4PpRKbMBCS5CzEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60DNuNNeYHpXmHaxOKK855OMrEADs2Z2zxbbuG3xJvA=;
 b=AYNfCQ0n99NLCNeOsvM1StnNbFwO+bqArTp/kE+YC6H0qnD607/jS82gWTzAAKImY8KMD6zCj5n13qakoc+NU1ldTQ7vdx+cUw7jWNDZw6PrSr8NTo8/PWV0Ib7EjAmkzqt0gpxAOdaVzr5WlFGsLLzbOLT14nGHLjcKj+jRyxprWKmUIXyiWdZL77HDHqmYpwY3clN1RGsTgS3fPv27LzYwLJ35bm9ys7bApnhWwgIwflKgtOcJY1YtifQ0ZGRN7oC4Y2pb3onIakSAhKqsauL4fQvcNGgXjOYURCWZwPRNlbImTvFAEpDNAqtGC58FiNXfz6eoPU8pdFJiqwOpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60DNuNNeYHpXmHaxOKK855OMrEADs2Z2zxbbuG3xJvA=;
 b=nw/m42qHylmTBrcOTUl1itCcEYeE3ceI0IcX9CaZ4SxfNtYGIV17J+uDQZ7GrBD7hJQF9AT/dhTwBqq+x8nYx8yu2vuXQH/bZ+g3STlZiLDVqzKPx6uubv+df7OzL2MTRW+95juzbJ0jTTSQHcSVoMpDZtm1igXb3W7aLktlK9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB6141.jpnprd01.prod.outlook.com (2603:1096:400:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 23:02:13 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291%4]) with mapi id 15.20.6178.035; Thu, 16 Mar 2023
 23:02:13 +0000
Message-ID: <87bkks711m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 130/173] ASoC: sh: fsi: Convert to platform remove
 callback returning void
In-Reply-To: <20230315150745.67084-131-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
	<20230315150745.67084-131-u.kleine-koenig@pengutronix.de>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 23:02:13 +0000
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: c670d70e-3387-4c9c-a00f-08db26727b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jgwShy8N8CPnQlfFcUpK6QnaaO6SiqL3Rc4Mn/IiNokBphy9nENnOvAKPph5U6DvUEu/iTl/NxX9jFNQFtzQMZ6pzdvWoN1KBzRZ7w63TH644iFPqNeTWwyoFDLRpcqvich3NX/BBEC5iD2XMMhCAm3x04sLMBqoAmqpnXDN4FGlJzz/Lt5+VUYjrHf0gXOGwIgnbHLUw8rrc6XBe4xMVgjsx3B/UAxmL2LpUqEBCSg8oIM2tCEbOULMMrVqAPejR+uESeFhNl3jZiEUUmkd2QVW/tSAA2gqyJgVzuNJACQJAKa1ShNcvK6eo4ZNEEsIUDi7vpRp9BAPuiHE7HHsG/KgcvvWMOvvVVfAFNCSJxl8ulIO+qHDWuR5V89EPAAYpUqxj5stL7X0uNehPXaeITxaivmA6BXcmmrV2pE4WD4dtzU8NbomPxsX72VMWFr9yr0DouBIfur11a3OG6LrUVtIR1XeVs7Skavd9omFdSVqBqQiFbS/23g2v4doa0kqxT2t3ot30zSnGkgV87XavXr8NG66UXjY2x+UziiScF9k7sa9Qs/AREi5GhdRvPdSVgyoLWewGUn2aC0klM1mGTE10qkNqqYRuBGYBjEh0eVDRBvCsqRIEOuQA8oM+8dHN2cRc+SxVJojiw6Dr6lm4QkI/sEvF04ATAVqSehhnfNEIionDq35M9VDO2ApVy3jo5Xqnsm5wgI9csary+QyBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199018)(54906003)(2616005)(2906002)(186003)(26005)(478600001)(6506007)(6512007)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(38100700002)(316002)(41300700001)(4744005)(38350700002)(8936002)(6486002)(52116002)(86362001)(36756003)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?fIRB/iEb3l2yH00fCzHGogHS9QQEE28vEXlBADm3cGBKLhB5myfas4Jkru?=
 =?iso-8859-1?Q?CQ+MR5SKosTEx1XO/DlGO+fySjO9hVQtTBfPUVc2/To4DqrZ5Gzg87oxrm?=
 =?iso-8859-1?Q?fy/JworM5jylA7hzIUdjhtdSVVuAxTwW7yP7CSgK8EQ9+iD3tddhqRK8iS?=
 =?iso-8859-1?Q?DM0lumO3gb5zBMyB3RafLO7sXT+laX7lylHG8hiGQpVy9JewBeBWDhfmBo?=
 =?iso-8859-1?Q?R1H0oHgTPk++jNySo305nX2p36o+3esuhlqy9DKg9XiCEOb3UaODL/sfAf?=
 =?iso-8859-1?Q?3mavGYun6MFZMW/CJI9d9jae6vbUnZcmRx+pk6z+Bai3rXEgTQ+k+0hgwf?=
 =?iso-8859-1?Q?zOQcOYwZxvQla3oIBmqHY0xUB3q2+BTl4SnxrJu3G1Ia+58gSJ6XskJLtZ?=
 =?iso-8859-1?Q?aC9c0zwvIx4wWIgXrr81NHKinZnRyF+BKHFAID5lMEEIQT4955sGv8hbS9?=
 =?iso-8859-1?Q?05YM0SpGzXB0ygAaryvPl3JW3a5ccB5rF41+FgNfJUZVW/Cbtt94DZGJw+?=
 =?iso-8859-1?Q?qQScmECUcb4z9Kr6Llm/Z8SedJk57nIWXV2C5/YrpnUV9quyIcd0oXGhdE?=
 =?iso-8859-1?Q?WU2ospPbNQuYbnIP0BUaKJUSNQFkpJOaL552KYFI3VoHZ5uc66R+A/hGTb?=
 =?iso-8859-1?Q?NGrLq+wAF4GXVXZYcFYcHgFmp+h6zHOLUWA1ltk+nUBUzh8uNu1vlaPXeF?=
 =?iso-8859-1?Q?61a3E74nCEk0B80Hrt/8a5+k0hNGRDt5dYYizzNLu1tRKonDV/xnm4nj9v?=
 =?iso-8859-1?Q?lJYMxujWoyDJjwMrQK509XHSg/F9/dcej3MRW3htYmYXa6yg5/lQ/NV40U?=
 =?iso-8859-1?Q?LQHS6BC4qxCMSnIPSLgxGOcP0K1oATt/xQ2Bc6IWXDDSwWV34ewiN5lR8C?=
 =?iso-8859-1?Q?hZ9HED267z+g2ffHYTdsGsiIZJAR1xU4BKMJMrkCEquW1wm0SE9hjrPPw7?=
 =?iso-8859-1?Q?6p5rRrHlpAjPJeQCXyuiCWQT/+OsX1trLrCWAKeZWcgEhLVG//tLmz1FMC?=
 =?iso-8859-1?Q?ayK+g6jR3SEqbU4cX63I7TpEk4aj82rtbGwC7taYBbgG7X4FrSRPO6iTZz?=
 =?iso-8859-1?Q?NTAzbHc3VO9ZKWuAto6zGHg0zMcxXtIpT8LprGiVnevGm8j6rabbCYzw/3?=
 =?iso-8859-1?Q?BFSl/rY9MA5o0nuTwzlSyu8l1ZkqtwUNz/1LF3SSNq+OUw/gEgMpmE4Qwy?=
 =?iso-8859-1?Q?kpAGjAyBoPagFQ8Z2VcTSyAW1ZMxRB7IXgBR+BOLo/fe7idn5OP3nVSsfw?=
 =?iso-8859-1?Q?lxo0IVSNT1iFZzpc7sYcuByTGo8d9vMm89O1BYRuBcPQb/hbwiO8KFPEu6?=
 =?iso-8859-1?Q?zWGMwmxjyRK8dlwBhBLZF3V4RJofdPJAK0GcOvXbvB2+P0dZCaodnpSPGv?=
 =?iso-8859-1?Q?/ZRp8IkTx9w0J4J8EsNBLeVMlVa9cpdxonbHkZSHdO2QqATjN24X0z9UBP?=
 =?iso-8859-1?Q?Kq4QZNvdQWlgP6DJCkUsiPmq1RkOle42x8Jhxw4F4ft7DiqlYrxEd9Vndn?=
 =?iso-8859-1?Q?wNGMMwLFKwmWvPo+cIHJeKY1xVD9UjM6lzZ+szyeahRHN+fWvoaHq+i4Ms?=
 =?iso-8859-1?Q?/8y46hP0R8QXH+FEjx97333WRsUejImghf7jFKTzBgUTKkzoY0GnyR3xwt?=
 =?iso-8859-1?Q?fDoR1k/5OIsn73jpzS1vEjoivuquZfW0Fk+KzChOHbcrhRm1/FO6oatuX5?=
 =?iso-8859-1?Q?WbfOc+bPmP3beVh/Kq8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c670d70e-3387-4c9c-a00f-08db26727b1a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 23:02:13.7307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2DrKWCOkz68JRj/1g8CbUDJ2tve7ln6++tloMhwsEiwPIp8lm8+5jiEPeWuZMKA1NIwOENBIgFKV7kym1XrJb3JFmzipq/8ItRg/yYjLrhHtUmkUFz9WkEk1Gsak8v/S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6141
Message-ID-Hash: AIQPYMVXVN6IRXUGFTJDAX6HGNYLDDWJ
X-Message-ID-Hash: AIQPYMVXVN6IRXUGFTJDAX6HGNYLDDWJ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIQPYMVXVN6IRXUGFTJDAX6HGNYLDDWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
