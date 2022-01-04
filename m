Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A5483ACF
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 04:07:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2DEB16FB;
	Tue,  4 Jan 2022 04:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2DEB16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641265642;
	bh=ObKkwLmtYSd3dhlcuyFvxQG8uwv0l3KVol/lq5Ru7sc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzWlQUN2Bj/mVXOxzlMDvpZ9k9Bul5WhFdqfdJMhrcVBYLAE/VvdYZecDojfMthlo
	 NGdtAV3h4JdUOmkz4J92T9gh/eijHHbllfys5h2zXmjbcEzC91C/wEFrFPJ00TVcq8
	 yE7JFsGe2XMQf/02pQrcOzUPYhY7pUwPSX05zMJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 024E7F8032B;
	Tue,  4 Jan 2022 04:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF1FDF80310; Tue,  4 Jan 2022 04:06:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_78,SPF_NONE autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2086.outbound.protection.outlook.com [40.107.215.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DFA8F80089
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 04:06:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFA8F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="LaAnQJQ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+uFd1AkeLSHDpAYCv/PTp8rl/V0ckNpNMdrDa8LgB2UB8R8CN1u8Pwl7njVCQi+P79LjhYr3q+bVkN9SnJX6OAPbJvrGp23js/TGLl1yLwxBXB8gRy2QoMSVEPJiqtuIkEyy6WDNOdVnRc9G17kDP3dzP5IHCxaxGjzWMMY/TpyuaKxQ2pKngYipPVRnKWNh6SqGQuFzQtAytVEhT0NJuc0AvFVhuNzkWuDHhy5rYtGejMSf2PpTrAiAkbQ8UHrwR4oZERZuIm7i4ZftgLZOK53zA80lG4ETY3OKz4MflEmby7K7Rls722iwQzhWa0FL8jLTx05JHq8Tzk+Bt9MXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObKkwLmtYSd3dhlcuyFvxQG8uwv0l3KVol/lq5Ru7sc=;
 b=ds2FwmAmQe6wkkp1EQOXVNuXh5pLRWumDqnjpRxGQ1wrmPkn+A3UmOjHwqbIxHXP43K6gOpYKC7TUCqGloPtBogeebfcd1wwN/x/GmDogy7+Ykmsj+IbmZOEb1i+VWkTqQ9aAQmAz5PebnC09huj7pIu7svXd7vtobchsJz7BEL186jor5ep8/zNIuU+a21NiIrPmBC1AsXfB37wPy/6n5nrXCo2lvO/nLoMN7SfR6zLnfl+XXSGR7Ssao0+h9hRNvixj8Hl9c1jG4j9PtGeOHQHAvm8tcffV2k//g8codesgtqj5LCJ05+5SUZ6qrHsE5YVdaAuPXCK5swihXgNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObKkwLmtYSd3dhlcuyFvxQG8uwv0l3KVol/lq5Ru7sc=;
 b=LaAnQJQ6xIaGcHl+RbU0ftGW3PBLJ+LqxEQx7vuUGAu/kZqSneaC1ULNXOl9byU7DSUNS6x++BbJkCgwb91XXTb0kC+Iu/dlV3EmEkyJpVYQ5s79i/BF02C4oENCBxsKVx5gDsINjBh/TwgzctXxvhC2q44C0xBdfB3pfP3v9rM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from HK2PR03MB4337.apcprd03.prod.outlook.com (2603:1096:202:23::13)
 by TYZPR03MB6108.apcprd03.prod.outlook.com (2603:1096:400:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.6; Tue, 4 Jan
 2022 03:06:02 +0000
Received: from HK2PR03MB4337.apcprd03.prod.outlook.com
 ([fe80::28a5:ecc7:6c9c:1fc6]) by HK2PR03MB4337.apcprd03.prod.outlook.com
 ([fe80::28a5:ecc7:6c9c:1fc6%6]) with mapi id 15.20.4867.006; Tue, 4 Jan 2022
 03:06:02 +0000
Message-ID: <b38d3788-689a-70ee-c808-4919b2b7a01d@nuvoton.com>
Date: Tue, 4 Jan 2022 11:05:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] ASoC: nau8821: Add DMIC selections.
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211228035101.2973294-1-wtli@nuvoton.com>
 <YcxYZqZ6aVh1zfY3@sirena.org.uk>
From: SevenLee <wtli@nuvoton.com>
In-Reply-To: <YcxYZqZ6aVh1zfY3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HK2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:202:16::17) To HK2PR03MB4337.apcprd03.prod.outlook.com
 (2603:1096:202:23::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3835473f-7486-4fc3-c95e-08d9cf2f23d1
X-MS-TrafficTypeDiagnostic: TYZPR03MB6108:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB6108B218186C29A5EB86E280C44A9@TYZPR03MB6108.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6f0ZMuIwTlP3oGcyOGq0Roa84lqheYKeDEH/whTcxlb1BpK4mJmz474Ubimq6FMvxGeKWHtuIAfkwKV5HDwXRJm1JDrdoBPhjeQ8JBjSJ3ap7BNWZpTzA4HSURko79T8Qe57DAwQ/BjJ31piYeoWK3ZYxeUNkx6zeGl4rJb1Esj2MC06vEPgV+usBMxFWqCi9qS65/bgUtBWI7+zVZ1JE6mepidQrW/PMhufXqnClSy18PpcmYFqlV+Xjg097LPFZbN1fmoUaZuUMnBVgQYgwotpEs90uD2mtVnta99MpvoOP/5aJfHTmwt8GZE0otjAVG186AJpxUMk/nRNehmwXC9AdtY713vs1lde3P7mMZZDUtQoAQI24Cg6lPDe7igbHcG16+coYvee4a4MqHiQTKOK+J8cVjM4QUPXZ5za/xAvfKA1i56tSbeHR3nDbSQRt1GijMDaJwNTrFpFQPlHgBnq8+nbR9hFzkd+J7n5Dg24fvjDWR5Ljs/YrJHWoZOdFTwFgC0APaWknEQM22RK5gzrqsYYOxQ6hlgV061Vgjrn9bv9A5/wc6K4TdFX3/eLVEEOFC9IAxKRveMXUnj53kuKOXbRWXTmjjZejEDu4rPfEJ2Jo6OHnXeDVDIpBAoWPnIcIDefnpFGiYM/ce8ux8IVVP9NZAkCqnZop4X8wDwIZveGEvqKH5gLtQKutpw1AsfPHk59zzVa/BWosvUoLZf9/a7PM7HGNDTvjw8SEIq2pQRgE3f+zaDGghOPTxwPKB7Y24Qvw4X1i78GR1P7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4337.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(38100700002)(2616005)(52116002)(508600001)(66556008)(66946007)(31686004)(66476007)(4326008)(8936002)(8676002)(6666004)(6512007)(36756003)(5660300002)(6506007)(86362001)(31696002)(6916009)(316002)(2906002)(6486002)(83380400001)(26005)(186003)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDJrd2VsRkMwS2lKczBrY1ZpeFFYdjVVUzk4Y0xiR1RwV0F3QSt4Yy96UkJi?=
 =?utf-8?B?QjEzTHJVdndmaDh2ZjF0Y2RUUG83dVJlbUdKT2RpQ3BWNEk3ckNhU3NBTHIx?=
 =?utf-8?B?RUF1M1plZmw1ODFoQnFYVGJjR1EyRGVFZDRGd0Q0OWlBRm96UlJEZXJRVnNj?=
 =?utf-8?B?SitHeWJ3VGpnRjlyNDl6VEkrKzdwZTZyVjJRc3pOd1I4R25uN0g3UTlDMUFX?=
 =?utf-8?B?U093aU52UUJxN3RpMy9pbkIwVVZDZHBmMjhiMVdncmE2RnhVYytxLzhxaWtF?=
 =?utf-8?B?cUJHUDJnUGwrSVZyRE1WMDBucnMrQXdralRrRDdYRFpudVJaQnh5VTZoQlJu?=
 =?utf-8?B?Vk9PQ3Iyd21Xd1BnNW5hbU41STJ1SzZlcHRtc3hneFovL0FkNkxUaHRRN0xB?=
 =?utf-8?B?QTF6aVdaWmxEK1JFY1o1OEtMV3RFcUtaRDIrOTJIWm9TLzBpMnlvTjJZSm1J?=
 =?utf-8?B?Y1lVS1pjcXI4NzFqY0RrbnZ6Q3ROdWhjTDU4dkdGTk51ZlZoK1ZhQVlaR2dx?=
 =?utf-8?B?U1NvQURIdHc4cGlsekI4dGpkSHRmbXVuOUlKb0ZuSGdNMTdKZ3V5M05xRVZa?=
 =?utf-8?B?RXBDRkFiYU8xenRuZk8wQmwvTHRBeVdmb1dEajU3VU1tY0NBTEhMem11YVh2?=
 =?utf-8?B?RUlhbnRZbkhrcFNOM3lmSzZETkNEL0loa2JEdnVPdzZtNUJPL2pzcHBHbFgz?=
 =?utf-8?B?NHpFNnJYd0h1ZVo5R0xtUFhFWUYvOHFHdnMyRmVxUUkzRGN1c0NlaktxZm9X?=
 =?utf-8?B?ZEFMazhUV0d6cVNaRG1Ea2dya25ld1RPazR4TGUzSHYrMUMwbk9UaFc2ak50?=
 =?utf-8?B?NkNlY0x3SE95WXdvNytqTnJsV3hHZUZ1VkJEWkRiYmF5TjFDTFdJdWoxaVc3?=
 =?utf-8?B?ZXEzem9ocndOY0x5Y1FKVW4xRjdaVUVFUFBVeEtWckhxMXNRQlRvT0JKaEFp?=
 =?utf-8?B?Z2xXa21iQ2VhWWZrMGg5WXhjUmRQOU1weVNpcWw5aTdWbjZaNk1pblBWZWN0?=
 =?utf-8?B?QnpoQ3pMQkhSYnBrRjlBb24yYm9TWDErUTBpRHA0YWRTZUNXY21XdUtjUGJJ?=
 =?utf-8?B?cXJHNFJxTm52c1NPOXJuOEdHS2ttTWxob3pmaUE1dEFMUHpoZTk1bzh4NUcy?=
 =?utf-8?B?UFFCV2s3anZUcTl4L2pwLytOOHpQNm1hQVE3ZUtlWEY0d25FYWVqbmoxdEN0?=
 =?utf-8?B?ZWh2S1YrNGhraWpRNHNlUGx0bDV5L05FdjFqbWg3bVcrbFl1Q3ZHVEorelRa?=
 =?utf-8?B?ckRNOENVYTd0bFlJa3ZnemwxSUQvRFhOWlppWTNmT204UzZaMjdLbVZGYm1N?=
 =?utf-8?B?akJKTnZSeG5YQnNaU3ppaE1md2QxWlEzNmh1dlVqQXQyeENncStjajFKUy9N?=
 =?utf-8?B?dkJZQWlpc2RFSFJxM3VlNE9IRmtVaU91OFJveEVxaVkyc2JzOWpsWWN6eUJk?=
 =?utf-8?B?TUc2UXhNWUZ3enUrUnRDNzV6V1JwUTlxTnBwQi9NbTJUNUdQaGMzaTZla3VO?=
 =?utf-8?B?VlVYQ2tnNHZONnJlR0o5NXpVUDdUQW5MTnNROTE3cVV3bnhOa3RHSUUydTYx?=
 =?utf-8?B?eXJpK2dOekkyTytqSVNQMU1aYWhhMnZCaTNONTdsZDRVWFIvZzhTT003SlIw?=
 =?utf-8?B?T2MrTzByZ21PSlY3SzFTM1FVMGdqdHYxN3lHWjhhUWZIZElycmRLNHRnbmYv?=
 =?utf-8?B?RGZ6L2NXaEJ5UFBVdXE5cm5MRm5Ubng3Mk1vdi9iN1MzL1VCZSt3VXVyNkY5?=
 =?utf-8?B?ME9jN1JtbXozN2cwak1qdlYzcU9Bam9jbktlZVJ5SDAvYXNPUUsydjdMd0s4?=
 =?utf-8?B?dmgwM3h2OWw5dVErV1RJa1MrcDQrYU9JMHAvMnh0NDFJOTBSMEZJWWN1b1o0?=
 =?utf-8?B?SjFVVzVDdWpJWDBLUm9jRVNlOWlRRkh2OGo2SGZrKy94YUlXOXV4U0h4MEdo?=
 =?utf-8?B?VkhLOWIwcE84QXE1VUtLZ1MveHMvUlFuTE9JeWlpNWZDb0IzS2MyM2lQUWpE?=
 =?utf-8?B?U2tXVDJvWkZSMTR3Um1SSVFXTlU5ZTF6cXB6bWFtazlTSTQwdDZ2TXBqYWVM?=
 =?utf-8?B?YkcxZUJhM2dyQ3V2dFg1dzNuZ3R2c0FueEd2OSs1dUFaYi9hbXpab042L0Zk?=
 =?utf-8?B?NHVqc0ovUmtzankvUzIveVFFSjYyRzVqQTFPRHNjQlVua2tqQjduK3VKUlJm?=
 =?utf-8?Q?SUGvsuWCSAlPsdXKX767EHU=3D?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3835473f-7486-4fc3-c95e-08d9cf2f23d1
X-MS-Exchange-CrossTenant-AuthSource: HK2PR03MB4337.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 03:06:02.3811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32ohN0rswutbpo/KM+CcE5AQ72AEqALYkgdQ+v2GAjMPoKTXGqW6QGwKKj/NbsTgiHDRwlHWiJSGuy81DENP7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6108
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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


Mark Brown =E6=96=BC 2021/12/29 =E4=B8=8B=E5=8D=88 08:45 =E5=AF=AB=E9=81=93=
:
> On Tue, Dec 28, 2021 at 11:51:01AM +0800, Seven Lee wrote:
>> Add the following two control options:
>> 1. DMIC pin slew rate selection.
>> 2. DMIC clock speed selection.
> The clock speed seems sensible enough to control from userspace since
> it's going to be a power/performance tradeoff but why also expose the
> slew rate to userspace - that seems more like something that would come
> from the board design?

Because customers need to adjust different DMIC materials by themselves.
Adjust which slope is the most suitable according to the conditions of
use, and
improve electromagnetic interference by setting the slew rate so that
customers
can try the best solution.

________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
