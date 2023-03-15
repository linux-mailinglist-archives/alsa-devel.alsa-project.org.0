Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8A6BB8AD
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:55:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEC49157A;
	Wed, 15 Mar 2023 16:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEC49157A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895733;
	bh=Z7aLfys3e3jMMcvqD9iq03Coj+k0AbZsP6L1jONy7oE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JB88FQaJTHifw77Bo+SW1JhXGsrpDyvrIIaMMl6rcG+cjY5f7pkFcCZjVAadkCHtP
	 Wwf5maS32X4ezWRGph3oO1UnJfLgxiY0+e2n5+YzZJn9yf89SIjoh+tH8zhCKqJXKD
	 e1++9LbH5NmL7yI6rcsI2+Dg4n0Sfvf4QkAGumAE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC75F80423;
	Wed, 15 Mar 2023 16:42:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F296CF80520; Wed, 15 Mar 2023 16:42:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 257CAF804B1
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:42:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 257CAF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=axentia.se header.i=@axentia.se header.a=rsa-sha256
 header.s=selector2 header.b=nRpTMSmE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nw7XB1DD5foR5H9vJXr+HLFzJWVLiVuGO+QtWYuAMYY304ymp2CF/qOK8aEkagwQcJ3IJOHJ4uclILj0Mq1O6fodPRikvCm1mhmYL4xu4o7aBhTkl4nasjxizuAS85mRb+X8bzyoOB8fHp2jSL0/Bh12ZQyBgFtwgZ4Y+0/1kcgJgmCZ4eO4NrirR70ELCEn3tsOEwnLaeaf/Ps6HXbl+KibbTQTKs31RQlXEgVwUU1oTAplt2ZKrdmd7YdRT/OvKkPsWIlGKSBp++6ueTCu2x0UtDOmUCIZFvf5pXGvu6B8MgioI3tXBbNXqUJ8Ot1BbP4L8hmtcIg+CMuZOJX6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBfPzO9DR9iz7StBKtdIm7iPVR684V7TqrohFP8yDiI=;
 b=nQ8p4lR4J7IWwoPxrmy9IaZvHzEfO9lrF2kDHjYfIPeIqpnm9lqrF2I4Lim+0saxTaVvyoif5LROCUwjA+9SBCA7g8XWKB+9hUXg2tl0xGmjGDIkk9ra0w28LcQ8E4dEPhScvK9F6YW1G53NiFD8GT9kfK1P4ixzw3teOZ5bQf09jt1QNj6NfVYN5qCKOdbo2Et544qThkwZy54eRHroDLGFpG7vnow4P5bWK5KRk7S/UQ1N58TxV79GOqXURo0f1sjFQ8k1nXPtOoEUQUm1lFoF/v/6MrwPJKH8QO/QE1Lb/UH9y/Liyq0tRm4C7U26KDzSfuIW6nuiSnwQg8l2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBfPzO9DR9iz7StBKtdIm7iPVR684V7TqrohFP8yDiI=;
 b=nRpTMSmErT+4xiraM9G5cZOnTf3SyzsAyphPuZcs9o3gEphCp02qscuX4jZKexrCNIEQpdI8oZrsEvK/7yHnY24h6iq30B7UTHi+iS3iUEx8Q2My1AxuKTf2Ne4M0r9kDFCTwRfdjIsO/B5gQX6SYJvQBdVOvHNzzTYbom7dKJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAVPR02MB9040.eurprd02.prod.outlook.com (2603:10a6:102:2fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 15:42:38 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::aa42:a057:860b:3808]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::aa42:a057:860b:3808%2]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 15:42:38 +0000
Message-ID: <699df531-0ddc-55ae-32e0-b5b8b1e8e808@axentia.se>
Date: Wed, 15 Mar 2023 16:42:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 033/173] ASoC: atmel: tse850-pcm5142: Convert to platform
 remove callback returning void
Content-Language: sv
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-34-u.kleine-koenig@pengutronix.de>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20230315150745.67084-34-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0029.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::17) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PAVPR02MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e2f6d6-cd8f-45c0-e03e-08db256be7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6fGcxWRF2AlWY5uu4HxYJgL9+bdbmJ7EB30HV9IHCw6fe8fK59JjmZHvwjNIiNXDT7hxEXpRyYR/6XYauQQCYsjXZq68V9Tzo2RPQSLiCaGPo5hnx1AnWrnPX9t865u3iBB+lCAuXtBggeuC0NV4quykYURDG9gb7mqxZP+Fc0Z9/hzCWFGeb9JLcjZE3uQoJYvS8u2p5Hz45UfrLdmlLtwh1w4FMYyGPmLLQhevQPPspyt9M5w5FstlXEtPXhFEAivKFn2GgSS49ZVsty4ZG7UliF14KjeffxW3pKe8rck1XIpXS3bNVLruzM1yUEdh9BeopAaGG0lFGwBN9ezRApJ7lcyBBEeKW0EIj5jd8q2aco7APOelb04Dw+/WKUuW8cxPG+T3mIOkRH5X/yltEhNjR3oR8FZqKgjQ6h9p//1CWAckQcNsujHgM6lYGcrViFr3ZsQnKO19YlAy4QqJyKP0mNmmjTt+J3ZSjmEx7Qy+XGYAusTtaZHq6miq+AsIZx1/7boTjlLrXQ/ZZY9XvD4nOGCQNDNiQ6huwhCyptdfANArggRcJkF+Y0kDeFZgJ+q8JpA1h+kjZZWh3/7Xk2olSJPXRFl85VkJ4BbcFmTbXGGuhN4B40pEVHMWgrfzO0GsYwf0eHN+2UulgNMEI1kSqDLFNmyd/a+yWdK+R/2ZJnGGO7wzvmB/CRer9pCVWKbOXzmMk/mmFxSX74SfsH7nf9fPWW0xkkFWD7RjEPw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(366004)(346002)(39840400004)(451199018)(31696002)(38100700002)(36756003)(66946007)(4326008)(41300700001)(86362001)(8676002)(66556008)(8936002)(110136005)(478600001)(66476007)(6512007)(316002)(7416002)(2906002)(4744005)(2616005)(5660300002)(6486002)(186003)(6506007)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1l4M1NuaHdUN2tYcjR6dS9kVmlkakhZZ21iU2kveU5FYjhGSE1hL3ZtamNC?=
 =?utf-8?B?WHpJWXBLSk8wTjlsS0dlMy9UeWtTVkNuMUgyMzZhRmNrcjNkYi9ESXZEZFRQ?=
 =?utf-8?B?RTZXNHVER0xYNEo5ZnJ2UzVtSi9wUjA4L0VVTXdwVWdSaHpyODU3dlg0WWR6?=
 =?utf-8?B?dTV6M1BnT1hWellNcmhWdjhxNzNTYXRWTWRZYkphY2Y3MFZFTzBiMHk3MDdz?=
 =?utf-8?B?bndDdlNPY202U2lsa1VDSmpJcGRMTmtxZkMwMHo2RXR0T2ExUTZHK28rbm5H?=
 =?utf-8?B?M2o4endVU0pMOXZkNUxYaHgveG9lUk11eDI4MHRGMDhoRlkraTRMNnoxU282?=
 =?utf-8?B?amhmcjg0VFIzekZQY005azlsejVHSDFHcURlc2RkeFFTL2FWc1czc3k5SnVa?=
 =?utf-8?B?S2dtZGZLS24wWDBhUEN1UEd6cnZDRnB3V1lGV2dONHRpVTU0dGNJcWRRZlFL?=
 =?utf-8?B?enF6dGd4VmlmMmdDbGx6eUFaUm9ZeXJMMzNCaVhxUXZkRE84TlpEaWZBNm1j?=
 =?utf-8?B?TU9ITE1aeTJyNytNYVR3OXpIZlQ5TTVSQy9yK0Nvd2ZvVS9YMTAwYnBuRUZY?=
 =?utf-8?B?R0k3ZGVWRFJ3UDZvZytjNWIvWE9aU0hEdVFWT1AzdDZWRWZwaGhzSFpFSGlK?=
 =?utf-8?B?T3VOa01kMDdSbU9Rd010UXZGNDI3THVvMWFETmFQWUtDR2NLbGFTMUgzakJs?=
 =?utf-8?B?ZGFiS282U1BUQ0JzeHhvSklMdkJQN1Ixbm83SnNIbkloL044NFZwVGlCWnJZ?=
 =?utf-8?B?ZHd0alMzUDRENmFTMFRNeUdXNTBPYXdYYlFyZG04MXMzdW05VUl2QmJtMXdu?=
 =?utf-8?B?SmMxTkkzdHBxbDZoaFg0dGxTWXRTVysydzBZVVlzZThLQmxlaHBlQ2xkT01V?=
 =?utf-8?B?U3ZtdzU2WTJ2UlhRSXdyanF3Rll6dUVGSjdLZVkvZm9JS0JUVEdJL0trZi9W?=
 =?utf-8?B?cVlOMCtxL0RVeExYM00rRmxhb25YY3lCU0Qvc09WY3VtYXR2dEFjRWg2M24r?=
 =?utf-8?B?Y0JGeC9XTGV1Q0tYSDlHdkRMcXgwejFyb29qdllwdm1uSGFQMVVieGlCNENp?=
 =?utf-8?B?WnhvQ1FBNnBlU0xyNWxNYWtSU2Y2RFVrcm1UMEtMb08raXZvaWEzYzZvNzFP?=
 =?utf-8?B?aXd4MjllUlUrejB4VEZJbnA1K1lJdFUzRDhxOUxDSjU4OU8vZHRsSlBkUlV3?=
 =?utf-8?B?Qk1rVDdRYjhSa085R2pXdG80YlhUTVZ5VlBIc1BUVlV6dW1idSt6YTFjYXZ3?=
 =?utf-8?B?citGK0RqSVNyakxubHlIMU54RkNqUDhvR2hpOCt0aUtSSHBqZjRwNkY4RzRr?=
 =?utf-8?B?VlM5a0wwUTNBYU9Qbkc2UkNnMmFaUFkyZVpqNHp5dUN1eGhTbDNUNmVzL2d6?=
 =?utf-8?B?M1QvQzFOMkVrdVRLQTV1bktrM3FpQTZPeVJvRS9VSUJrVVgrZ0p2ekx3NWRM?=
 =?utf-8?B?UjN2cmEwUEJIbVZJZEJBZjBOSjlWVDFwUGY0elFGYlRWM1o1RC9UK2crK1Nr?=
 =?utf-8?B?Unk2YnBWUTlkaEZieXY5YjRCUmhiY3hTUTJtcXNkZHczTzl0c3hJWFBzK1NF?=
 =?utf-8?B?alhEV0ZrMkp1dUR5QVhGWG5vS1c3bUcrRmJENlZRU09JVWhzbGZrcE5GSkR6?=
 =?utf-8?B?UC96c3E4QzI3RjkyMzQ2NkthMnpQcW9zYU40cWplMGtYUG50Rzc4Y09MTXBP?=
 =?utf-8?B?M1owTlhOeWw2NEZSWnBva1ZZL2s0VkoxeEJVcWZhSDE5dXlzaGhPMDlna1lQ?=
 =?utf-8?B?OGdwUWhsWkVXa29YT1N0YVlqMFBFUjdRZjNoV3d3ckRsVDByOXpDSmxwd1o5?=
 =?utf-8?B?Um1MYmdVZmNQTmRWYjZPbmE3b3VuUjhnU3lDdEVWTHQ0SW1Sb3lZK0M2Vkkw?=
 =?utf-8?B?RVRoWWpua25PdXY1Z25nb3hwaXJrdXQwV1VNNFcrT3JHT3hiQXNTRjBSd0M4?=
 =?utf-8?B?Rmk3K3EzS3BEbWdSSThTeTIyZHFVVFA5KzZ1TStqamlIV2hwcjA0RkNQcnI1?=
 =?utf-8?B?SlVVY0l3OEpSUFZRb2lLNEhaNU9zRHlYay9yK3lxSGoyWm9wdjJVOHl3WXFw?=
 =?utf-8?B?UjNicHkxd09wTTZKREFyNDZnYUE0TVJnS2U0Y1BNais0WkhmcU55TVlCdTJ1?=
 =?utf-8?Q?DIFObTRehiTA4YWjBJTwPS2vs?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6e2f6d6-cd8f-45c0-e03e-08db256be7da
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 15:42:38.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z1wzo/A0YWMqm66Gemp4GYFcXUz9e8K+bTiiZlLNo9xuNaHBfJVKsDGuVN1KvbSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9040
Message-ID-Hash: ZTAYWBNH3HXXT3BHFFO6DVRDJ4Z2FZZP
X-Message-ID-Hash: ZTAYWBNH3HXXT3BHFFO6DVRDJ4Z2FZZP
X-MailFrom: peda@axentia.se
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTAYWBNH3HXXT3BHFFO6DVRDJ4Z2FZZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


2023-03-15 at 16:05, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
