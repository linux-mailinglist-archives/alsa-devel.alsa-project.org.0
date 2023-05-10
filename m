Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA616FD86B
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:43:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C07103F;
	Wed, 10 May 2023 09:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C07103F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683704596;
	bh=TmwAKqwB1BtCfkam1lqjMWa9QID8jNoLLe3k18QdveA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EZcFLlGB3Fb/kAOGswunXisP/ItnnaoJmsFQi5jotqqRy8Q++3dGMBo4Ura3xC8m2
	 ot6tpyHAwG0TwU33mT5yOwj2gUmtQ74/lGbOHAbYMAo7GMoI6xv6A3qWUa5dpA8t/X
	 yEVLrRNxQMBvFd8rGiloQM5+ZMOhqoaECD+zm1w4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60488F80310;
	Wed, 10 May 2023 09:42:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A13C1F8032D; Wed, 10 May 2023 09:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0954F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0954F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=c64Jpqvc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqWiLGc+WrJghjE6DsaJXnrm2Mphxn60KC6ipwFWxRlFvYLjbpflBe0O51faHIAiLaCwz1rz5K/DRPUDF/rqAROQonPS2rnxzSslAxOqV7E463Rnw/HoTPZvkt4Ij7tXrUyPJD8ELvLOSvDoWAxm/4dpgK0y2m/AyjtYAhXdBV5+He2QT9qmYsIEmlmpuPK4n4ilxb6r6ZWxUMH2KfLyGtJSiWx6lwgpe9JHquhlpl71lXhjX4zzzLZHNXnyclPa3Agg00/1LSlA+ypPKKtCB6CWYXuru2zlnxO3rrmPs8/LhpnK2Hs5/p7Gj7g8De3VYCrv8oqev61qjv23WNlhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HYK05WY9AhjERXRXAJEtzAQ0PPMPGTvMK2/qVtXNFQ=;
 b=dMOgAUk8ALSrXaHJFlF2yb47H91ZAVaW5sjbO6lOEsZ3ubC1+AnJtMfIRbfjtW9us2jL+e4vC47M8SD4hd7OuybvWwqY9/CgIrFh6VE2VUwRwbVQrA75QeNxOL1IrcNP2XuJzVYMDC5x3jhUYI94Qm6MqtSxafk/C4ZgMT6NbT2jre3iPOUTkoLcc9p6FgOhPatSH7QQhCxGxO2YEMPT/7+LjsoDhQ1ltbUQ6LGTce30UY8BnbtSGxyzw5rRlyD+kybRTx4c2CT4jljI6BZpm/WHLyO6OC8IMmALxCw/zWHtFptvYlN7vKMf6Tt7L40YjUl796HqqoTInl715o0MFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HYK05WY9AhjERXRXAJEtzAQ0PPMPGTvMK2/qVtXNFQ=;
 b=c64Jpqvc3yHJDTQPRv7K4ZKPSji+Zq9Xi8fqnFVReQDLlBhyq7JOW5NOc+twCVZS+yhe3dw7XnOqVWhb2UxVgE2biNvVjqV9U2AoWA2P3msYpmmHh7G6H5FhEZJTqJYerwXTzizTBxDJMHOSeGl4ovifx8y5M02IZGTEgD841ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by PSAPR03MB5528.apcprd03.prod.outlook.com (2603:1096:301:4f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 07:42:04 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%4]) with mapi id 15.20.6363.031; Wed, 10 May 2023
 07:42:04 +0000
Message-ID: <36061fee-5491-e829-2c49-27ab81f0aa57@nuvoton.com>
Date: Wed, 10 May 2023 15:42:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
References: <20230510034409.585800-1-CTLIN0@nuvoton.com>
 <39afb004-5f28-2633-a8be-412cb5e74404@linaro.org>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <39afb004-5f28-2633-a8be-412cb5e74404@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|PSAPR03MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad4a542-2853-4bb3-5f85-08db512a0c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QCoj8uzpx0AcL3OoukEzBLekIcJVS351ChBYIzFfK27Jw8y2XWyAfGXuvJHK37LO8rDzCdF0e5VbyY0wKctRIJetKxaVNu2qXhNCkfrm5ILgvXBy4yb+D3mmb6es33NVrw7uVATeAbEMJ80WoEfiIjOHItQxdcJHyydqUtVbK7iqj6mD4a7efsduCG+mQx6nKHRxJizGrIYTTbGibGLhAmwqDMEGkkJ0M2fD483SVsDNd/MpsTwyks6+oB5WbzQ9811fbgrh2106EXiGmpM9Rj5K3Kqs7r5BIAGRr14CzQlYBALrpiKsA979Yyoxwg4zyq+SzpR67Rcn01i78G1qFSa+ZWPt7aHbIZ2W0MFbPoD160zFic6bMVnsLsoBfUrimFuItITgMjOCrtyYSZL7vT1cPxY6QASJdIKQ0EYykW6uRZAVz+kME7dn3vl3IB3L7YZfBsWBY9aImsrTKDW8BEuN23PGYzQepw3purvDH+qOccVnbZXzIhpqMNctzPof55azhG+gdN1KZHOnv1wD/Dc3duxVaU8J8QSTCbg0anaKehSI/eVRcKkY6RNpM243KVo0ZRt5jpqlJN1eT3wlhWcOGRl+Bcxy8pz2XkcCASEABsNLkPAb8xovDFFIVaRBheihpV8TDedThQg0RDolJqJ7c8gWpoiyoOSTvIiw1f77kOtyqJUq6wxWisgu0zjl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(5660300002)(478600001)(31686004)(6486002)(8936002)(6666004)(41300700001)(316002)(8676002)(53546011)(6512007)(6506007)(26005)(66476007)(66556008)(66946007)(4326008)(2906002)(2616005)(83380400001)(186003)(86362001)(31696002)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlFDTFI2cFprOTFGd1hxVzN5R2ZLQ3NQdE5Qb3BxckRkQytlUW1VbFQ1M0Fu?=
 =?utf-8?B?SUJWNTdwa05CbnB3OW9ZQldnYTdTZGhEWHBZUVVSTHZ5bHhOcEZCRnhMWlJq?=
 =?utf-8?B?MGhDNlVBMkQ5c3krQWwrMTY0aXJ6ODZWOHJoQ28zbGpKUjJmUEtjM2kvZkE4?=
 =?utf-8?B?Nk4wdEdPckhsaE1BeWRpeGRqQlIyUDRHK2tnU2RtUDNuaTVqUW00YTJRenR1?=
 =?utf-8?B?TmJXdCtCU3licEEzaWxGWUUwaEdvYXh6Z0tvb1NjMURjUnU5Y2t5S056bEdC?=
 =?utf-8?B?UWhlZTRYVWdmY3AzRlN4bkwxZnFqMFBwaHNMcG53R1N1SkYxRkh4SEVqKzc4?=
 =?utf-8?B?UWVmSlJPclYxWmxoald4aWRoeE1ROHJTTzZSaGNHWkZtRE5KelQ4eFA5bk5a?=
 =?utf-8?B?UkVXQXpHRlVzL3h2WVhPcjIzWWpsMEdHdDB6SkdkajNOV01rVHpRNEtsU0dy?=
 =?utf-8?B?bFR1MzBWUk92b1RSL0lLdEhKZ1d4bDhNZkFCSW5POWhCWlF3VmhQTER3R3Qz?=
 =?utf-8?B?anJmcFFmdmxLYW5pclRnWUlTTm0rQXk3OTlhVis5Z0VxT2U1MVVFRmZIYUFE?=
 =?utf-8?B?eDVpMVZFeGNrTkljWXFWak9kRG9xSEdyQ24xL2huOFRvVkp0QWp5STlUOUlN?=
 =?utf-8?B?b3RTNUF0YlA4OCtTcm0wSHlSdUZ6RXoxRHlUekFLRHdPS2VlampqcVU4aXpU?=
 =?utf-8?B?c2o2Vm13clFwdTFvcjFjczIxNWFESGwra3pxSExWaEZMYXlUdjR6SGdXdTBp?=
 =?utf-8?B?NFpvUG5mL1d5bVhsdHBBYW4wM0k5RDlId3NiTVBqRWVFNkw5dVQvVGdoUDcv?=
 =?utf-8?B?cVAzclV3U3dlV09xanE3MmZFR0YvODJFK2tYdjkrYVdYRWMzckIvOTVvdlJh?=
 =?utf-8?B?TGpYTlMvWHNFYm5ucTJLdHVvWDRkYkFQWTZZZ2g3WVJVK1RiaExNYnpLRDYx?=
 =?utf-8?B?VVVjV20xcTdIWmtaRXM0b2JWQlgzaDVTak8xcHdSR2w2aFJ3WnJUdENBVFRT?=
 =?utf-8?B?dXdYUy9xdHNSbmNMVTRPYldkeTB4ZC9jcUFvK2UweDB3RXUyQktwdTliOEgv?=
 =?utf-8?B?UkpWNTV6QUdrN0VqNUlyRUpuVXY0V1RJMklaRnBxOEZaNzM1MTBUWUpCRnc3?=
 =?utf-8?B?L2w2K3IwN1VSYWhCa0NPaStJMnhBT1BRbVlLWldqTkkwNzIyL2VIU2g1dVBi?=
 =?utf-8?B?MVdlbVFnV2hqZWVCRDRLdU1rbG04WE11NCs0cHRCUUt1Yk91RlBuRy8yVUhW?=
 =?utf-8?B?dUVUWkt5LzZCVGFTbDFjODYvd01OeE5uWThxSHZuMDlhYXMxbjRBSHB3ejhn?=
 =?utf-8?B?QmRUTUF5V21xRnhnUmxUZFZzbkpxNHdIRGNXcjFHN1JDNTFvNlZHd2RvakNX?=
 =?utf-8?B?M0dUZUlzb3Bhd3JXUjlRU2VLVVZIY0xFWGVWZnFtaXJVRDFVRTZSQkJhWmFo?=
 =?utf-8?B?SWV0NnFCanhRY1NXODVIWXdpM2lIVEw4WGFlMS9iNEVxU3BzVGQwTXMwNzds?=
 =?utf-8?B?L1FyUDdmLzU3cjR4T0s2cWQraVVnVllwQXlvSlJHOHBLVmkwallDYVFXcGJz?=
 =?utf-8?B?US9yWFArblcwbC9VZjNVYm5CTllheG9MSmFYcnpoT0tNZGdhWWIxTEk5dENY?=
 =?utf-8?B?VTI1MmJYc3lpc1JjcmFEYjVPQjlGUWx0eDJ2cWNtY0FVQmVndHV1TmF4MXR0?=
 =?utf-8?B?WEVmRnhQK1EwN1dOZ2J6dk1xeWJUQ2kwT0ZDTDl0aVRhRFN4SW5IYjFNeEFn?=
 =?utf-8?B?d1cza0ZXVG9aYWswSWVXQWlTMmFnR2h2ZHRhRzl6cjkxenEwYzVBQ3RXM3Rs?=
 =?utf-8?B?MExzUCtsOFBpT1BZNjhaZWdWeEJvQUkxSlNvTndrKzFVbE1ibnJUYjZmdEdX?=
 =?utf-8?B?eGxYd3E5SjhIVFFYV1dhUTRlQlJWekVWdWZ1bW1mOHl1TU4rbStXWW9VaWRr?=
 =?utf-8?B?YVVkbFdPQXhKQUFmOHAwTFM2Rkh6Sk4rTzNQcG8wTXUvMXU2MlZXazEvNkpR?=
 =?utf-8?B?RlBiaHg3bXJiTUtLQURSQkx5R1ErcHM2VXpQM1BIQ1BUNGl3NUJLdld2QlZG?=
 =?utf-8?B?Q28wZmhHTWFQTXM3VkNSREt6QVd4M3UzRnh4YU5pUUJtNlhieVNxcDIvdU1k?=
 =?utf-8?Q?55BnzjjUZriaV0rCnIkdpgqEx?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ad4a542-2853-4bb3-5f85-08db512a0c5d
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 07:42:04.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HQNm/G9ocpLZbtdHwgLSn28BicK+s2mzyvwDKtNObJlEVnchsduCPAqgn6Z5EshkFF/hWJG4OOLk13ylFjHpiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5528
Message-ID-Hash: ECY2ACLMGRCXSP4YNX7OQG5O2IXQD3VL
X-Message-ID-Hash: ECY2ACLMGRCXSP4YNX7OQG5O2IXQD3VL
X-MailFrom: CTLIN0@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECY2ACLMGRCXSP4YNX7OQG5O2IXQD3VL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/10/2023 3:19 PM, Krzysztof Kozlowski wrote:
> On 10/05/2023 05:44, David Lin wrote:
>> Convert the NAU8825 audio CODEC bindings to DT schema.
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> ---
> Version your patches and provide changelog after ---.
>
> If you just send the same with the same mistakes, that's a NAK.

I know your meanings is to show change log from v1 to v2, but I see
previous patch have other missing items.

Therefore, I revise it and included your comments. Anyway, I can back to
previous patch and re-send v2 patch with changelog.

>
>>   .../devicetree/bindings/sound/nau8825.txt     | 111 --------
>>   .../bindings/sound/nuvoton,nau8825.yaml       | 242 ++++++++++++++++++
>>   2 files changed, 242 insertions(+), 111 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau=
8825.yaml
>>
>
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    i2c {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +        nau8825@1a {
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
> Thank you.
>
> Best regards,
> Krzysztof

About node item, maybe I misunderstand your meanings.

When I change from headset: nau8825@1a to audio-codec: nau8825@1a, it
will have compiler error.

So I use nau8825@1a to submit.However, when I see your latest comment, I
seems to understand your point for node name.

The final result will be codec@1a or audio-codec@1a, right?

>
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
