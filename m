Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B6686DB75
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 07:30:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBCE1825;
	Fri,  1 Mar 2024 07:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBCE1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709274646;
	bh=LKcuCPJO4qDZOltA+EIo9ZyqcYU6pg9sqojw0w2XKEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r7oNE8qSvou6ML8C+sDTiuwAAT3slSUEh0c0qnS/uYKhvksoH/SV03Y3W+24TKvsN
	 zUPDKdap/ChOmnyz43VFrHUC+CnsGw95xVib4iNsx0E4PWgV9r3lZ7kvwGkn6ZSlK9
	 S5bdqvHFSOiC9TukNyJTaKd1M07mL6gwxig9nDFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 453F3F80579; Fri,  1 Mar 2024 07:30:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B400F805A0;
	Fri,  1 Mar 2024 07:30:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0650F801C0; Fri,  1 Mar 2024 07:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4584F80087
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 07:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4584F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=iwqbutyH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSEVEzecxWjANmbwM0LGyIhq5DjbLCn4OnuK6VfbRwIn4CbPua0k+RWKBlpq8F/uSr42vjLHeizxIddzHUdlq/ybZ9DEOp2ybswP2btlkYVZXyG0KMZasRwKKVAGrimntVXme0tZC9LQNumKKPh8/X9aczXL5Z9Y6M9WpO4KYm+HYFxq+JRpJhgSw7NVhfWIacSxY2TqQ/EQ3YsB+cb4XffURX6A2RhWVlthbkcyFFLma8Cg/s/qqAZ8psvgkcD21lKRltRhNd8jFFwQrkf/Kmy7pAQCPQ3//AFX/6BpF0l340IEThczt5xugSociP0TJ15WEl1z1iVt6nonhxQSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmaSw0oyEIatjbu7ctzrUwpkU+RsIs9q92iF9zS0lcs=;
 b=e40lmc2WEVufvVoA0EvanVYduKYZobuMyU6DHswCjEKJTifTZa+tOpYclW3cCYTF0nCitT76YSFyGNsUs5mTWfNgQMOrrK/rrssR1hKCZQ8fHHMT67QYrY3I0dT83EvPu1iYAf6ALbltl5mhis3gZEOM2rqIjXH8Cd+R1EZ3k08yMFff+tTDp1WwsRBm0PC+BsaGQ9ha8cIlIJZKzXYbxszp+XYg0vSSM66RvrWhsAE14J3HW/WDWdrRHUMnc47mevojDC0F91V4b0lqTzbrgauX3kQgBY9j8cNozrpMVgnOU6oSFfXjFysIwfb0ipTQa/kvbXG7Hwbv0hkoYxyTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmaSw0oyEIatjbu7ctzrUwpkU+RsIs9q92iF9zS0lcs=;
 b=iwqbutyHtTzzYBqO/2+krxfDysOYx2YJfzT2OhFOIqutrS7wj/EngTGjUstlBE7ngB0YecgsIu9SbGDgDliDWsbz9dRniPEoLlK0jMwgwNOPNgQ2dm5kGcwnbSLeLnU4vHPjDLn7SFdPJXP9X0M3IR7ACtJYY9sd5tjfGiD16mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com (2603:1096:100:5c::17)
 by TYZPR03MB8338.apcprd03.prod.outlook.com (2603:1096:405:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Fri, 1 Mar
 2024 06:26:42 +0000
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::8694:77f5:d686:6869]) by SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::8694:77f5:d686:6869%4]) with mapi id 15.20.7316.037; Fri, 1 Mar 2024
 06:26:41 +0000
Message-ID: <b5756bea-c65e-4bdc-b7d2-a2ef3511fc74@nuvoton.com>
Date: Fri, 1 Mar 2024 14:26:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
 supercraig0719@gmail.com, dardar923@gmail.com
References: <20240222083825.190854-1-wtli@nuvoton.com>
 <20240222083825.190854-2-wtli@nuvoton.com>
 <20240222141622.GA2748112-robh@kernel.org>
From: WTLI <wtli@nuvoton.com>
In-Reply-To: <20240222141622.GA2748112-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:3::16) To SL2PR03MB4348.apcprd03.prod.outlook.com
 (2603:1096:100:5c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR03MB4348:EE_|TYZPR03MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 431f4141-add2-4031-2e68-08dc39b88ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5vwriXxINiXXXnSdOMBW3UHmCz9h090l6oqztFqLWdejjZi2oSnAVFzaoVjGIWlJwoG5olA+USLGy+3+k3GYNWyT5KFvM7jmf5N068keaMT5JRIQtyWebW2OgbyS8dyLENzsBYYYDijsysnPd4sMBVhZ8ynrANCrhV/hu/jA+ugVhUvBAak70CzKCJFP0BoJdenMua5+jkxDA2t3wF55MdW+Qe06i/gm4TzM1pPgG9f91aLyD4hddGMUXrP5/6S5TLPu0FspUL0WkYkt+9PSBxb8KHN4GFkf2kT2yxy7kRAYW1JTp6gi+4Bog11XHnUFZP1C8bGOlzmhldfYKHg7lVQLqzDNDRk0iQdTGnHyPPz1mlJRgcF1tIDADcjd0fANBXWzlwaObKVRGnJTPJAbirJc4Tivmy5NZfM5904CjJUjIBeMaCGCl7oWDkMiNa7by4Ka+jyzS5jcctbMa3pHuaYMpS3xsRcuPgpab/USj1f2qq0XHnvTDR+7vQYmX9v5w7cQHJHIuWxlz/M0TGsL+PXpohk+FsofcA3Izx6BRgG6gMm6kX2ITK1uhkHGTSt96tPEM5O478LhTuWvEeUj2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4348.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2lMMEdlRGxjUzB6OEVrQzRUYmtmUzRScnZqenJnbmdwL3M0L0xNak51a29R?=
 =?utf-8?B?WHRIV3E4Ui9LNTY5d2ltb1ZBK3liUG5Qc2dUWDJQc0dnVVFUODVQTjE4TkI5?=
 =?utf-8?B?ZlUxS0Jkdk4xOTJ1cDVZUGxYSGRGRTFFdlJHcXRHeVlxWjVWMEtITTRWUHZI?=
 =?utf-8?B?UGFiQTdKcVV2ZmFaM1BTbWExWVAvNUxjWlM1UG9PQkU5SWRXaVVRUFJmMW5a?=
 =?utf-8?B?UG83M1VBUm54OUhmT0d3NmRGbUthQVgzQzcxRGVpL2lteHVnOGxzdEI2Ly9Q?=
 =?utf-8?B?NTJCTE43NlY5bjJ6a0wxbmZkLzAvdWh6NVBqcTdZZjU3RzN3MmVESGI2Rm9F?=
 =?utf-8?B?eFVxeGxLNjlXUkpRSlA4dFFZei9yYnFTNlJyL05FZDhPTms2algva1RjM2JU?=
 =?utf-8?B?c0hLNVk0aHhudWhURGJTWGZPUHNqWVNaT0xiYi9BYzFKckpTQ0hwUUZIZ0Nx?=
 =?utf-8?B?b2lZZ0R4UGdtTUd6Rk8wM0NsUlc3Tkl0MFQ5YXVBc0c1Zms2alJ0cUVhS29C?=
 =?utf-8?B?UEtKYjBvZEsrRXN5aHVWVllvZzVBQVp5YytWcjRYazYxQXQ4ZVZnd1NZcnBm?=
 =?utf-8?B?Z2lRSDkrWFNwbVhzcEJ5eUE4S0szbitUTEJSTFJ4TTdKL1daVXBNOS8xdDVR?=
 =?utf-8?B?eW1aelMxaWJqNGZmVGpRMHhiemgwSGdVbWxBZkRRaldFMndHSXBZTkVBaGlB?=
 =?utf-8?B?d293dzlnbEthRWN0WEVWRjZqOWRWbFUxQThMVXhjUVpoYkNHdkhHMmFBcDhv?=
 =?utf-8?B?cXQ4c1Y1MVNmSUo0QVFkRm4rRmpmRHJPb1RIS01yR1kwK3VSNnZqUTlTTU8y?=
 =?utf-8?B?aUNzcXFreWE0QXZGMEFieEliWlZBOW5PUVhtZ0ttT0V4RTl2bWRQMmdNb28z?=
 =?utf-8?B?aEc5VndKTHAvZWtud0JUTHZTbkdUTWRoRmZxRWVvdUNTcUgrUzhnOGFJZTIx?=
 =?utf-8?B?SjZ6b2tRc0Y5WEhlR2JDVlJWWlFQbjVWdE45UzNSc3FSMmpPdk9kVEt4VXNz?=
 =?utf-8?B?a0czaWF5a05CQ3pZSHhJQWp6aExSNnBNbHd2em1EY1RsRTJjQy9PWHlEcHhS?=
 =?utf-8?B?YkJCczhJZjlVRmxMRWlHUmRiaWtsdnBWbjF3RWhJRW51bkh0ajhmSGovK0lo?=
 =?utf-8?B?Y1BsZnVvazF5YzdsTzhUcXFmeEswY2NNdU5EVTdwUXFBMXFkTVl3VlhEWVlt?=
 =?utf-8?B?clRZYmVOaUFoaVN1aDZyanNTZmFYeFB4NHduSzM4eHhLVVRoaU81Ynh2VURQ?=
 =?utf-8?B?TG9TU1g0K0RNbll1QTI0Q1hLN0EvNkRHdEVmZm1IamJwNkdEanBXY3BEM2wz?=
 =?utf-8?B?MUV0ejZlTWFtdFBmVkt3L1V6bnZOTGpNY2VZRTBmb3Z4ancrL0xYcncwdHFF?=
 =?utf-8?B?c2J2WFcxSk45ajI0V1VDNTVzeWU4ekdjeHE1VjZGbEY3TEdWejgyZzR1alFS?=
 =?utf-8?B?RWtiL3AwQW5lTDhrbFRqcjh5WkZ6eGVtY2ZDY0VBa2xTU3ZETGYrR1hhQmcv?=
 =?utf-8?B?dVdmNXB4MjV3Q2xubEJReXFiYURuU2FoRFZIdGliS1JHenM4VjZ5bnNrMmVN?=
 =?utf-8?B?NEhITXNwV1NuRStPQXlIOWdvd0R1WmlVZ1VCVkpOZE00L29raHlkditHd3FU?=
 =?utf-8?B?ZER3c1JFRXBSTExMUGp6dmRCQWR3Y2JRRmdjZlVwVHBHczZyY2h6eGl6cS84?=
 =?utf-8?B?Z0NWc2NsYitDZVB3UEhGc3ozdmN3RDhlVjhqcTNvMlBScFZYT3gzS1dMck1U?=
 =?utf-8?B?WThFQVZFcmVZS3JLOXcvTCtQSjcyQWhjbnR4UitMelA3Wjl4ZXhqZ3hqcFJz?=
 =?utf-8?B?RktGcjJ1WlU5dWFkMndMMFU2MXFjRzBBY0J3RjZYeC9CVDFtOFduaWJudUlN?=
 =?utf-8?B?VlJPTTR4WUtLMkFwb3hsSWM2bTJzZ2lWN1BhR3FJRHlwM3NBNUozU1NQM0ZF?=
 =?utf-8?B?Z1hBWXBiNjRObXJDZ0o5aTFZdHcwbW10cC90OUQzTFc1eGwwR3VYUHFBWUh6?=
 =?utf-8?B?TlhNMVlVM1FabCtDUGFhc0RpSFFJWTRtTDRKZHY5c0VlSVNUQlZreVlkWEhV?=
 =?utf-8?B?aEdGYVZWMXd6bUNoWmxMRitDVFZZaXM4OUpLdFVNczRXQVJPQUtnVi9NUUc4?=
 =?utf-8?Q?kt3otFbcP/yDYU0JMOXMuzoT0?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 431f4141-add2-4031-2e68-08dc39b88ee7
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4348.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 06:26:41.6257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 weXCwrOLtTiLZkJLEu1qcUbGV8xzNDVUWgnQbYjTu0vlUxV/hCysOu430vZAWypv3GZhCkyY/1hR9gDeVLuFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8338
Message-ID-Hash: U2FGNXWCIPX6TB3SAOHI5UFCNMTVGDTS
X-Message-ID-Hash: U2FGNXWCIPX6TB3SAOHI5UFCNMTVGDTS
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2FGNXWCIPX6TB3SAOHI5UFCNMTVGDTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Rob Herring =E6=96=BC 2/22/2024 10:16 PM =E5=AF=AB=E9=81=93:
> CAUTION - External Email: Do not click links or open attachments unless y=
ou acknowledge the sender and content.
>
>
> On Thu, Feb 22, 2024 at 04:38:24PM +0800, Seven Lee wrote:
>> Added a DT schema for describing nau8325 audio amplifiers.
> Please test your bindings before sending.

okay, thanks.

>
>> Signed-off-by: Seven Lee <wtli@nuvoton.com>
>> ---
>>   .../bindings/sound/nuvoton,nau8325.yaml       | 82 +++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau=
8325.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yam=
l b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
>> new file mode 100644
>> index 000000000000..fc72baf0bb7a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8325.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NAU8325 audio Amplifier
>> +
>> +maintainers:
>> +  - Seven Lee <WTLI@nuvoton.com>
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,nau8325
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  nuvoton,vref-impedance:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> Use standard unit suffixes.

okay, I will use standard unit suffixes.

>
>> +    description:
>> +      VREF impedance selection.
>> +    enum:
>> +      - 0 # Open
>> +      - 1 # 25kOhm
>> +      - 2 # 125kOhm
>> +      - 3 # 2.5kOhm
>> +    default: 2
>> +
>> +  nuvoton,dac-vref:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> Use standard unit suffixes.

okay, I will use standard unit suffixes.

>
>> +    description:
>> +      DAC Reference Voltage Setting.
>> +    enum:
>> +      - VDDA
> in Volts?

yes, this is Volts.

>
>> +      - VDDA*1.5/1.8V
> Volts/Volts
>
> So 2 different units?

Both units are volts. I will modify the enum definition.

>
>> +      - VDDA*1.6/1.8V
>> +      - VDDA*1.7/1.8V
>> +    default: 2
>> +
>> +  nuvoton,alc-enable:
>> +    description:
>> +      Enable digital automatic level control (ALC) function.
>> +    type: boolean
>> +
>> +  nuvoton,clock-detection-disable:
>> +    description:
>> +      When clock detection is enabled, it will detect whether MCLK
>> +      and FS are within the range. MCLK range is from 2.048MHz to 24.57=
6MHz.
>> +      FS range is from 8kHz to 96kHz.
>> +    type: boolean
>> +
>> +  nuvoton,clock-det-data:
>> +    description:
>> +      Request clock detection to require 2048 non-zero samples before e=
nabling
>> +      the audio paths. If set then non-zero samples is required, otherw=
ise it
>> +      doesn't matter.
>> +    type: boolean
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +        codec@21 {
>> +            compatible =3D "nuvoton,nau8325";
>> +            reg =3D <0x21>;
>> +            nuvoton,vref-impedance =3D <2>;
>> +            nuvoton,dac-vref =3D <2>;
>> +            nuvoton,alc-enable;
>> +            nuvoton,clock-det-data;
>> +        };
>> +    };
>> --
>> 2.25.1
>>
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
