Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A36FF04B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 12:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA71823;
	Thu, 11 May 2023 12:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA71823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683802725;
	bh=3DCuPig/iedVMxvcoBzB+3zLMw930g+sJ79lrVIUmKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pt8EFcuB7npRN6CUIeYvm09Jbd4erFo3PjCW5O3kRPMue/iFMiRmhvRtnDajSVVGj
	 bm6GPR/d0q7ZxObNCGkH3xYOPZnIso5JHLLHs/AXmIAdVi9PQdMc61Cx6eZpuy1n6n
	 5VaTguitMHTqNXTyvRkf0wpVCHaEuYQnk61B/EEE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BF2F80310;
	Thu, 11 May 2023 12:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D6BF8032D; Thu, 11 May 2023 12:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2266F80217
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 12:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2266F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=f9hEWUqp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gi+s0xK9+kE699UwQG/+TdgYRYFje7cAqrSQx5qh1PDurSIjlh7lS2BYlZywytgPjHpNfpKUCo4nCt/OVAnKEyaDZPTjMWjgdcxqdZh5NgLCPoN7+Wc+/ve+XtRy6jQlm+Hcwwiwzkugaj8tj/qQcDGX4CxL61X5i41qXCRSlojeXDTpysU2x1Z1XmE6MMuG/LnXoqZb5oima92kcYa+oVXdS/uEJhOgVdrblj6nKcKnNxJ9M5pCIoee8E4zpNVnrR9AUj/8hEybEj5cRnf3NCPSGnbWm4uGXfGiz2friIXEI1QEUDb70AXGHLgyjx67UQNqQgdWV6Sm+xuWkvAjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhqoBhZcamiBqQRmfA5tRgAsyiu8/aJnZI8Jlv7TGjY=;
 b=dH5Eg/V/+2+NuIicMEVbpIr2Zp3lTtqd5c52mXLNjvjMbgDGIJjmVnpJ7sUW71ySuYW3/WFVAZFbBdxyCA1rUb4IeUDmVY5nCMkpbbodKWLsWNheNpd5vSRLVeKIyGkQ8jZHEQQvbRN8+j0nMPk+JjXWsaS+KMAvjIXIhpxIf99CndzZglUFLkB13xyw2VrC3fIKAPptayRsGsLWvAJxSS+HwA0ceHwb4XtLc9qJbV7KAAcHni6ljblYY70wR/B2APuhO9hCA3LG5C+sJakOr2HsW45AEdK2uue4NLSH3YEc/6A9Aejrjdqqh80fsxp80wdFlLZfPBMunx5sBs37ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhqoBhZcamiBqQRmfA5tRgAsyiu8/aJnZI8Jlv7TGjY=;
 b=f9hEWUqpPbblUDbL52E018afBvHnvypyCm1bVIULYSMjJnRiykRSznqRjZhuvHsFJ5oBxEzxyhhItrzmgxk3RjT5uWwJtI0fAoT6trOCrOjrdSwi6IkffAbsk0yiQjpZrMK81wHy8LM6y9xHawKz9+5yHEqxhShw5s2ut0PnDzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by KL1PR03MB7851.apcprd03.prod.outlook.com (2603:1096:820:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 10:57:21 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%4]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 10:57:20 +0000
Message-ID: <90099c41-dd51-1f15-362c-6c28a8672263@nuvoton.com>
Date: Thu, 11 May 2023 18:57:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3] ASoC: dt-bindings: nau8825: Convert to dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230510091914.590752-1-CTLIN0@nuvoton.com>
 <d826ded8-69a0-013a-5bcb-256048d62702@linaro.org>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <d826ded8-69a0-013a-5bcb-256048d62702@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|KL1PR03MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 1206b30d-8c48-4750-f22c-08db520e7e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SSgc66MoFWpdezzmySW+qN3UxM+XN8biFkY2RlaKlMW9oyLjqSD2OHSxUMs0hg0B0EKb1T447r10RVnCYZwE4PCHsXZrcjzMzeWaWAuj+4vyI4sLFl7Jtc/Gini/Uxn7RSdwpW44At51bz/AqTqxKlSSh+K3hsJdf9ih5OAlLW/XEhPiaoF9gG21gZYUkA1o/e4vmiR4SLGgLIXE0SJDDmNI53JlduTKXYP+8aM34a+Ekddgk8OTnmxUVAsOyGKIbHEU+6JWA9MO1Z0u3i1OKCJCfM9bphWjQsYJL5lZS8lFkoCGsKQIOKzhkKmjje7wad6iL8wEhEviN5K3Ur//SF9rUIYwR5PO3vdts69+eaRJzWdNn6IDoPzVSCja1l/qjMVbfvJGs+M2+0x+tFoDbsQ+wAcmHB08tRrNj6OClhPPZX38jWZwEHPAxDUfyEkJyna225UiMVZC1kpKfutYqtw/5vUj5hS3j4x+FmPQUaTp1hTP+pllmHdmpvp0x0f4/ZNLBoj32yyaAJbOslyQMa/Fhdop3i5ymq//8z6+ygSclf8+5w+TrXZRyQALxayen9l1cRPmaLsdN6nQIIufFrHWtSIIxM5zlW+fS8jg/whxl67Lc5WIyEDm3XKU3ly4Fio1IZV5Ee0vaezyMkClcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(2616005)(83380400001)(31686004)(186003)(66946007)(66476007)(41300700001)(66556008)(8676002)(2906002)(8936002)(5660300002)(53546011)(6506007)(316002)(6512007)(4326008)(478600001)(36756003)(86362001)(26005)(31696002)(38100700002)(6486002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmVsQ2Vuck1xcW11L2lBalJ2R2ppTk1zbHZDaWNqdWtmQ2VLRXFYY0FQdUF5?=
 =?utf-8?B?ei84R1NOc0hzYjJGLzA2UGJKalJxODZDWW9QTFVXVzA4c253dm9DaUVkYTZL?=
 =?utf-8?B?VkRPWGRvUlVoUk1xa1k0ZXdoNjRDV2g0TUQzZmtnMXRuQ3pFV1QyWC9JY1hi?=
 =?utf-8?B?bVRVaHRiOGM0M2hmZEZISEZ1NkZhRU83aFRDUWRYU3Njb25YbFlaLzQ0RWV4?=
 =?utf-8?B?dy8ybFZwQ2lPaWRBQ0lYS0RQbXo0TzA5aU9KQXpKeStHM3RkZzVWeVU0Vi83?=
 =?utf-8?B?VUd0RUdodzFMbEdDWXVVTWZkUVdYWnNRU2NUSEhDMTc2VmM4aDVtTlFEbzVH?=
 =?utf-8?B?aXpUTEFkR3c3WG1UN0JMYTJ1Z0ZnK2VYNjZBMGNDNmo2RWMzUFQ3ZkFINnRY?=
 =?utf-8?B?MHE2OWlNR3JyZDZrWjFsT2huSVNyUE50VmpqbXR5RGZxaWRPd3FRS210STN4?=
 =?utf-8?B?b2hoeHZxdDR5ZnVjUFBxRXdpVGRMbDR4VXFNUTVXOXFVYTdlRVpQV0JlRFNL?=
 =?utf-8?B?emJWcVpmTjcyUVZ3KzQvZk82S3lVdFBMUE1vRnNDU00zbnRHR0EyaUdhSHhK?=
 =?utf-8?B?N2kybjVBZ25SRk93RVdxbldzNi95UWsxUWJseHpscVVoODZ1RDByeFk2Q0JK?=
 =?utf-8?B?OHovNUw3TitPU1lPTkdHRG50ZVRvZ2dnREd3dTVEbE0yQnJ6bTE0aERSQ3F1?=
 =?utf-8?B?SHFoKzgyd010V2hsZndMOEF2bjF3MlQ2ajA2MnlLV2dhb2hQZFZBelZ4Z1pI?=
 =?utf-8?B?dGx6dE01R01VZWRQVWVIK2hqY29CblRmYm9TejR4NGRVcyt1NUt1SDVsMVlz?=
 =?utf-8?B?QWFuV2lTNHZ2TjB2VUxJQzRDQ0puZHRMc242L21PY2xBZUwvdURHeU85YVp3?=
 =?utf-8?B?NTRPOWZyT25jMDRweENVVVRXdUxxVmJDS2NjcTNWZnFDbDZDSWlINzd3UHFM?=
 =?utf-8?B?RFNsTTlxaWZnUGhra3MxYnhUd0NxSmlBUU9aWXJCRk0yR0tnRHBhYkU5VDUr?=
 =?utf-8?B?M2EwYnpJZkF6cUIyTTljWExhcEdNNVpBM2NOcTlNeVZUSDlHa1BQNnlKVGpw?=
 =?utf-8?B?SDkzb2lCTnArNWZKZ3l5T1JmQ3pqdks2Zmo0RjdDUGhlbzErZU9JMy9PVkYx?=
 =?utf-8?B?aE9CczRvNTdKK3NQdUFkamcxZy8xekpiYTNZcUQ0MmdFRFZQU3REWnBjWS8y?=
 =?utf-8?B?VHBuNVJaczVFWTVYVlJReXFqaTV2cGxrV09IcHJxeHV6OGJtbUpLdnViTk13?=
 =?utf-8?B?N1lreTNFTStPWFA5azdkSG1vNE1xeTNDWGRIby92UzZ3a29sTTU2TUJhTC9B?=
 =?utf-8?B?cnpqejhKU3RMT0w2SzY2empVSkZuODgwQkVCbWltUEdnbXVBYTlPaXVkVkhq?=
 =?utf-8?B?V1U4a3R1c1RqSVErYVV3YzZuSVdTRE5Hd2ZraVJYQldBSkd6WkxaZVNKVDlj?=
 =?utf-8?B?OW8zNEVKdmRHKzh1azBJSTNYUlpmczN2a0dwVXp6OGVwSERMdlFhMFNEdlVO?=
 =?utf-8?B?MmgwKytFYXVTTEhQS25jclZEMWoyd3JGMkNrL2tWM05FRWtLZHhGaFY1bEM3?=
 =?utf-8?B?TkJYbGk2b1BMT1lZeExRYTltaWp4SXZTTVFlOFZlZVFDZEFZeCtzYk9UQm81?=
 =?utf-8?B?Q2Nzc0ZoUE9aRVV5ZjNyYjRsTWxubmRHbTdwSUNDSFZuVU9nZngzU0JEazgv?=
 =?utf-8?B?SzdLNGQ5allUY1MvQktpZTIwVk13eklJeWdMY1ZRanNucDBOd2FiK1BXenNN?=
 =?utf-8?B?WmFLWHpFVVdwYVhDcXhPeWhZOTU3REJYVHdvc0JacHErQUpuNTNLRXdQUTZk?=
 =?utf-8?B?ejZXSFhKdytqbFdKc05XQnBzZEpBZlJWQmN2OVFINmtiZkhjd2pEL0M5RUoz?=
 =?utf-8?B?VWIrNmpvSWpQQzVqYS8zNkx3emhNZGNtVTVXYlE0bzJ3blVxMmpuWnNxdnlJ?=
 =?utf-8?B?R003ejV5Rkk1RDZESlVqcXk2emRscUZaK29QVElwZ3lJMlpIWExrUHN5aWlh?=
 =?utf-8?B?N3hYOW5wbjZRb25Cb0RDcG9VbjdjaTA0eGh6YlpqUFNXd0t3WWxESENpd3hN?=
 =?utf-8?B?Smt4Mnh3OFlGYXpNdUNhOVlDTVZpVEhYMmprSWh0TmVwaHVqRlN3bDE0bFpX?=
 =?utf-8?Q?Uf7aajx4RNd8SK/YQ36GwyJGv?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1206b30d-8c48-4750-f22c-08db520e7e52
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 10:57:20.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3mU6qi+ZZvdWfZcw/pOm8AMmmlVKcK9w5DwJvqcOw3DrGgS0qTezyuhdsiNleVSUVUteFYoDMuFs+lIRaCWRcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7851
Message-ID-Hash: Y3DO5SUGMRDF5B2A6X7WSYQKYZ2YBNDD
X-Message-ID-Hash: Y3DO5SUGMRDF5B2A6X7WSYQKYZ2YBNDD
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3DO5SUGMRDF5B2A6X7WSYQKYZ2YBNDD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/11/2023 6:10 PM, Krzysztof Kozlowski wrote:
> On 10/05/2023 11:19, David Lin wrote:
>> Convert the NAU8825 audio CODEC bindings to DT schema.
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>>
>> Changes:
>> V2 -> V3:
>>    - refine node name from "nau8825" to "codec" for generic purpose
>>
>> V1 -> V2:
>>    - add interrupts properties
>>    - add maximum to nuvoton,jack-insert-debounce and nuvoton,jack-eject-=
debounce properites
>>    - add a enum item for nuvoton,short-key-debounce properites
>>    - add default value for most properites
>>    - add maxItems to clocks properites and mclk entries to clock-names p=
roperites
>>    - refine wrong indentation from clocks and clock-names
>>    - refine dts example for interrupts and clocks
>>    - remove headset label from dts example
> Thanks.
>
> Still few nits.
>
>
> ...
>
>> +
>> +title: NAU8825 audio CODEC
>> +
>> +maintainers:
>> +  - John Hsu <KCHSU0@nuvoton.com>
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,nau8825
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      The CODEC's interrupt output.
> Drop description.
OK.
>> +
>> +  nuvoton,jkdet-enable:
>> +    description:
>> +      Enable jack detection via JKDET pin.
>> +    type: boolean
>> +
>> +  nuvoton,jkdet-pull-enable:
>> +    description:
>> +      Enable JKDET pin pull.
>> +      If set - pin pull enabled, otherwise pin in high impedance state.
>> +    type: boolean
>> +
>> +  nuvoton,jkdet-pull-up:
>> +    description:
>> +      Pull-up JKDET pin.
>> +      If set then JKDET pin is pull up, otherwise pull down.
>> +    type: boolean
>> +
>> +  nuvoton,jkdet-polarity:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      JKDET pin polarity.
>> +    enum:
>> +      - 0 # active high
>> +      - 1 # active low
>> +    default: 1
>> +
>> +  nuvoton,vref-impedance:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      VREF Impedance selection.
>> +    enum:
>> +      - 0 # Open
>> +      - 1 # 25 kOhm
>> +      - 2 # 125 kOhm
>> +      - 3 # 2.5 kOhm
>> +    default: 2
>> +
>> +  nuvoton,micbias-voltage:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Micbias voltage level.
>> +    enum:
>> +      - 0 # VDDA
>> +      - 1 # VDDA
>> +      - 2 # VDDA * 1.1
>> +      - 3 # VDDA * 1.2
>> +      - 4 # VDDA * 1.3
>> +      - 5 # VDDA * 1.4
>> +      - 6 # VDDA * 1.53
>> +      - 7 # VDDA * 1.53
>> +    default: 6
>> +
>> +  nuvoton,sar-threshold-num:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Number of buttons supported.
>> +    minimum: 1
>> +    maximum: 4
>> +    default: 4
>> +
>> +  nuvoton,sar-threshold:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      Impedance threshold for each button. Array that contains up to 8 =
buttons
>> +      configuration. SAR value is calculated as
>> +      SAR =3D 255 * MICBIAS / SAR_VOLTAGE * R / (2000 + R) where MICBIA=
S is
>> +      configured by 'nuvoton,micbias-voltage', SAR_VOLTAGE is configure=
d by
>> +      'nuvoton,sar-voltage', R - button impedance.
>> +      Refer datasheet section 10.2 for more information about threshold
>> +      calculation.
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      minimum: 0
>> +      maximum: 255
>> +
>> +  nuvoton,sar-hysteresis:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Button impedance measurement hysteresis.
>> +    default: 0
>> +
>> +  nuvoton,sar-voltage:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Reference voltage for button impedance measurement.
>> +    enum:
>> +      - 0 # VDDA
>> +      - 1 # VDDA
>> +      - 2 # VDDA * 1.1
>> +      - 3 # VDDA * 1.2
>> +      - 4 # VDDA * 1.3
>> +      - 5 # VDDA * 1.4
>> +      - 6 # VDDA * 1.53
>> +      - 7 # VDDA * 1.53
>> +    default: 6
>> +
>> +  nuvoton,sar-compare-time:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      SAR compare time.
>> +    enum:
>> +      - 0 # 500 ns
>> +      - 1 # 1 us
>> +      - 2 # 2 us
>> +      - 3 # 4 us
>> +    default: 1
>> +
>> +  nuvoton,sar-sampling-time:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      SAR sampling time.
>> +    enum:
>> +      - 0 # 2 us
>> +      - 1 # 4 us
>> +      - 2 # 8 us
>> +      - 3 # 16 us
>> +    default: 1
>> +
>> +  nuvoton,short-key-debounce:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Button short key press debounce time.
>> +    enum:
>> +      - 0 # 30 ms
>> +      - 1 # 50 ms
>> +      - 2 # 100 ms
>> +      - 3 # 30 ms
>> +    default: 3
>> +
>> +  nuvoton,jack-insert-debounce:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms.
>> +    maximum: 7
>> +    default: 7
>> +
>> +  nuvoton,jack-eject-debounce:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms
>> +    maximum: 7
>> +    default: 0
>> +
>> +  nuvoton,crosstalk-enable:
>> +    description:
>> +      make crosstalk function enable if set.
>> +    type: boolean
>> +
>> +  nuvoton,adcout-drive-strong:
>> +    description:
>> +      make the drive strength of ADCOUT IO PIN strong if set.
>> +      Otherwise, the drive keeps normal strength.
>> +    type: boolean
>> +
>> +  nuvoton,adc-delay-ms:
>> +    description:
>> +      Delay (in ms) to make input path stable and avoid pop noise.
>> +      The default value is 125 and range between 125 to 500 ms.
>> +    minimum: 125
>> +    maximum: 500
>> +    default: 125
>> +
>> +  clocks:
>> +    description:
>> +      list of phandle and clock specifier pairs according to common clo=
ck
>> +      bindings for the clocks described in clock-names.
> Drop desription.
OK.
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    description:
>> +      should include "mclk" for the MCLK master clock.
> Drop description.
OK.
>
>> +    items:
>> +      - const: mclk
> You probably want also sound-dai-cells.
I will add '#sound-dai-cells' property and also update dts example.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
> Best regards,
> Krzysztof
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
