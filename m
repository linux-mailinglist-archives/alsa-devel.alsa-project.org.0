Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7870249B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07761826;
	Mon, 15 May 2023 08:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07761826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684131991;
	bh=FP3TgJvdrpin1UpNr9sEW4GMNUWL8FYDiamjEQ8M4wM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YOzN4JT2RDyjX5jnn28ZshWp96RoT2h0ROm1uz8P/8M7tkyxPH0p1vkJ5sbdEuzGa
	 C5OQ+NxIVMZXWTmJBNsxb+Tdji/mcZxXtBdpKvuUTwO88BJ0DH2fNQqC4ImXP3L61A
	 IlObhDLiAAXOiJQZTpo434lTiSKKF6MCbPaVw1/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7172CF80542; Mon, 15 May 2023 08:25:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1093F8025A;
	Mon, 15 May 2023 08:25:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14512F80272; Mon, 15 May 2023 08:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61E8FF8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E8FF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=KMUeIc3s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3Y1ivg8sHleuOBJcQ+kuOi3EoFBoIAWKtTOAPDcnKvXvxhfDEVwwu9m0HRcJ3la5+6l081o4g7U11f40UUp7wkS40Y0igaMFe8Tjp3H0pbhXUcAIJ0vjuoMDB+PUkYLA9AvZfzlB3bQYW844Qbz40sfNX5yYxReq7YntvLXOv8x7N/jyMEvz+GukHmOgkM7MVmj3UfQiyH9cTBwYKccLkq174XDtOrMqJY0D3Rl1bm6qNQnnBd+J1zYNiil82t8sv13QMNpzDXH/iPhnuvSoyZvu7DZtQTBjRl1CkLKGzEv3knGUevS6awJF9BCitAqg9SuwlH0AcAyRjM1UnBydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sPkazWwlRsPGLl4NrkjAIBrZBKji3WxgzMb15bylF4=;
 b=FyLhGxbHAqjZkvG+W6W72ixAPUTgHtOOkbb3ZLmhCArIrsrZ6KB3XoKiQ521aOnf719F0gHiQ57wD+Sg35dv7E6RyRysi5OQf9hxd9MGVKIDsrNkK6NWjGGd5+1ucgQINGB09m/FgezCQxEgiSBXluFMyNbPXjRUZCDoVPo8BIXOXNg523CTrpusn2WhT/9zZNeJNTjJKU5NvWPP3LH9WBdLhu8I1v5yOojTrvBLOVMtuLrKifJ7CBlPHNnfB5dwFw0Tn+GynOcg6+7oisWJnv0N4buseWlSsBbfK40ZbpMhxMJdaC1NRZdPY/yJdKlkWeH74styvZm55vmRTzar9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sPkazWwlRsPGLl4NrkjAIBrZBKji3WxgzMb15bylF4=;
 b=KMUeIc3sRiLD+AAjp+rhotyoKNg+44fkDrqKlIUrIX/zaImhB2ttRibIWgwzkyrtYAY6qnWiRG8Xg9+DKSt9tfYq8AZUlrWE0/QijeuJZyhWk275osJ2HmlZb5vAM2jSK/DIIkrzrDcdEkAdTK5TPsA8fRdpzih9wDArkC/YWjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by JH0PR03MB7512.apcprd03.prod.outlook.com (2603:1096:990:d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 06:25:23 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%4]) with mapi id 15.20.6387.021; Mon, 15 May 2023
 06:25:22 +0000
Message-ID: <60173790-dd54-c0ab-9534-bb08772caccc@nuvoton.com>
Date: Mon, 15 May 2023 14:25:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: dt-bindings: nau8824: Convert to dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230512120146.600128-1-CTLIN0@nuvoton.com>
 <877338f8-d157-0f91-33a3-fdb03566aa57@linaro.org>
 <a1afe69d-2bb1-02d8-3573-dec370cc1a9b@nuvoton.com>
 <21488506-9e91-e7b4-a995-645b70c720bf@linaro.org>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <21488506-9e91-e7b4-a995-645b70c720bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|JH0PR03MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 100a519d-b1bc-444e-9f62-08db550d29b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jv0xdDKAL6uwqeY1am8LW6n0zBP1G5Wa1bFx53YDqphhUsaWi+DQVydhf6vuYAQU0qv868wRowFkWSx6LrDNXzNQaToYxGLdHE+1ELoNLsEisPKMxm8TLW6myEgTkxdlj+pdZDowyqJV78vGHTUTPIRRJgg2jGzmAPCHDKetjdmXxs3ypQ1Cr1x6e81W/beOlHfJmAkGJkc0P6luY6l6r45H5t9Sv5R/kX6Me2fP5VxRinkx1bjThuzQH1sJobLElAyGWGhzw8v5dgb5Dg4TtvnaZMMi9eQc4SB7pR/9MLKq4aSUkHhcxVej8/0+sL9AHJSKq46mqG4Yx8ntbFA7cLnkUcENyTtyNZHtQGZayoy9p22vuRnZZ3wsyKkTybQle34UNSZeg/gzDBoDQA7zNLly3sX1GRGBiZTvG/SlPf2oqM4XxmXqByOebkYB0xCyYQKWTpFP3QCwlB5H7dqyr1BayDuhnMcyG1JSJiVw7hFSgjj7HFbed/VAgvHm2OqZpU44RRfxxwdj4bUh9tU1GR0KCTgiT885X5bNrwqlpDBSPPBN83p/7kbFmmpXyLEcCWoo3m/ZY9iefMC8JY6bou114CqQtVkUNZZZlNSo1b0qjssmYmLbgh6yHMx9hoCUZxYSpJAC/t5ZlYnn8EZu7x3p24RtWOF2dhTyvbjWncNAFZ+5i4c49kM9etQ7C46b
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199021)(4326008)(316002)(5660300002)(31686004)(8936002)(8676002)(2906002)(66946007)(66556008)(66476007)(41300700001)(86362001)(478600001)(2616005)(36756003)(6666004)(6486002)(186003)(26005)(6512007)(6506007)(53546011)(31696002)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjUySy9GcWxxWFExSEltbVFYZ3Jqdjk0ZmZNaDJPZFVoRkptV29lVVphK3VW?=
 =?utf-8?B?VERWZUFlUUVpWEpmWkRWZVAxb2JZVG9GUUpEbnJmQ3FjdHNucGpFa2M3NXJ1?=
 =?utf-8?B?YS9PcGFibElEV1Ezblg3VkVKSlkxanZTZy9vekNYZkplU1BVZXRrNW1ldUVE?=
 =?utf-8?B?emYybVMyNzBCYlRMeTVQQkRpd24waE5sNThad3NYelo3WngyN2taZWp3dlJW?=
 =?utf-8?B?MDBSdkxMUVhTYnlPTWJpaEtjUUx5VUZoMEEvYUx3eWRkMk1kWEZlMTB6M21I?=
 =?utf-8?B?dUNmWVVOZmNkbDNXQWVlTTUxbWdBa1REdlczR2pvdVp2RWhTUU5sbFg4ZWxT?=
 =?utf-8?B?dU90UnYxK3NoRnk0R0l0SzBDdWNrdGxTNEQ2U3pPQjlDTlhSNk9YV2FPbjVF?=
 =?utf-8?B?QSswWWlMdUZTNHVHcDRBaGlsMGo5cVB0ZHdyL3dMSTk2V3UrT05zMWQ4M0JZ?=
 =?utf-8?B?UmZPZGF2MHVGWllCWXdxQlVpc3J1VU0xd01ONmdaNUd4encwY1JSU21kcHJk?=
 =?utf-8?B?NjBKUnRiSTFxMXkzWWRDOFhoWERyNWdKM01aRGNQck9oZGNMYWFIbXpBZ2pk?=
 =?utf-8?B?aDZWclZyMHlUeXpmSWFrUUdsMHpIS3VTaVRqaE8vaG9TLzNOR0ZKM1U4Z3RX?=
 =?utf-8?B?Y3hHVFVIcVgwQ3lWanJjWHp0TTRud3pqNnA3NVhWRmpQT3V1aGNjcUJzOG5G?=
 =?utf-8?B?N1c2Y01MY09iQ25SV1BZcU13ZWdSVGdzMnlLUHkvcVNOM2xVODF6alR0Qktp?=
 =?utf-8?B?Smp0eHVOTUJrOFNMVEdQTkkvZEM5YXdpQmdueXh5RlBKUmE0MGRvWGZ0YUNN?=
 =?utf-8?B?dS9jZXRKRWRKU3EvQ3NidS9UR3Nmb0sxVDVSMWJaWXhZN2doRUgyRnBmeWlD?=
 =?utf-8?B?eXA3OWx0UGdseGdORnEyQVMwNlhmN1RUMVBhYkxvK1NNM3ZTQWI1aE8zN0w1?=
 =?utf-8?B?VENrUGpDOFI3bFAxU0doaHY2NnFNeFZ2RVlNMEgwTzI4VFAybkczSSsvYmVF?=
 =?utf-8?B?MWVrNXVyVzZ5MGY1MGpIcDZRSnNQRENWbkcrSVo1YUY0c2tJM3JNUVhlWGI1?=
 =?utf-8?B?TytETWk5TFZtemViRS9SMDNCN2I0Sjk4TzI0M2VaUVBCd2psa08yNlFMbG94?=
 =?utf-8?B?ZUlzc3ZKckxmdjZDcGxIaDBNNkVORUhJQk9ZUTQ2NUFNenJFV3JEeFBkcHND?=
 =?utf-8?B?MEpBN0tYZ3lKb0paRW5HRlF2NExzYk1sUHBET3VRL1N1eEw3eDVjN00yTFFk?=
 =?utf-8?B?cGcvd20zSGJ0S3I0ejZHb0JCcWVUK2FSMUxtaENWeUtXRlh2QWNuMjI0bUJk?=
 =?utf-8?B?eDQ0NysyaDJJZHNOajc2dThsZTZ0czM3bWltK3czeVlGelN1SXdKM0RaRUoz?=
 =?utf-8?B?a04rZFpBVEw0dmxuSlliSDNwMEZVVzNBd0ZUcS9tK3pzVUw5amNuTFYzWHdm?=
 =?utf-8?B?bTFhMUJhamZuWlBGdzNZN2YzUnRPcjVpWU1FMVZlTkNqV1BQbzdxWDZ0b05Y?=
 =?utf-8?B?VEZMVm51bmo5UTBFNVRKSzNPVG50cnhobGh1MjF2dkVaWjRTVmtNaUZ2Zitv?=
 =?utf-8?B?RUFTUmpKMXlxbkMxYXZCT1ZweDlyZjAxSkpnRUw3bDB3RXFBcFdidUdvK2Y0?=
 =?utf-8?B?TlJIQ3gramZ1M0EvaHFpcEFBV3ZOZ2tOWW96VUpxNnA5STlRTFVVNUkvdDNt?=
 =?utf-8?B?NEFTRWZldVVGN0Z1RnM3bThQZXp0VzAzNysrVmc2eklUaUdUaEdHN0lTS1Zh?=
 =?utf-8?B?Y2ZoQTBtTmhrRkljekpxdkFyMzRkQks5dkdqbytZU0JHQVMzQUswTHM1TmFT?=
 =?utf-8?B?VFlrT1pXSXcvZEdyMFB4cHo5NUpDU0gzRlBTVGYyNTRlcUxYRW5peDlJR25l?=
 =?utf-8?B?elVmK1FKM29peVYwZUFCNnZ1enRZSzRTcUFoZlBiTTJxOUtYbGY0SVRQY0Fi?=
 =?utf-8?B?Rmg2SGVBQVplbUdja3JrNXJqcmM0dTV6Mmo3WWluUkgwb1JFcGdEUEVLSGJI?=
 =?utf-8?B?T1RPcXdjTGwwLzZlOFNoTVdwWmRnbHNXNE93U0hZQ0dqZ2E4TWhEdm1hTlFQ?=
 =?utf-8?B?WllORWh2ZWZ1SlIvUzl1ZytNYmlKdWJQNC9QZ044bkpJUnV6YXZSVENQMkt0?=
 =?utf-8?Q?7bEna0+jVD3Jcn+If7p0QzCeO?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 100a519d-b1bc-444e-9f62-08db550d29b2
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 06:25:22.7701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sB5ZH8zPkXQ1T7SA/12PqDWc/fdXdoBA4r7E7qlHEuU76krFUEfeRgF4ipA6nBN9/dZ7oefosMzw+qMek030cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7512
Message-ID-Hash: TFURGKI6XJC4G6M5UHP4D4GERZOCBT3W
X-Message-ID-Hash: TFURGKI6XJC4G6M5UHP4D4GERZOCBT3W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFURGKI6XJC4G6M5UHP4D4GERZOCBT3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 5/15/2023 2:20 PM, Krzysztof Kozlowski wrote:
> On 15/05/2023 04:47, AS50 CTLin0 wrote:
>> On 5/14/2023 2:38 AM, Krzysztof Kozlowski wrote:
>>> On 12/05/2023 14:01, David Lin wrote:
>>>> Convert the NAU8824 audio CODEC bindings to DT schema.
>>>>
>>>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>>>> ---
>>> Thank you for your patch. There is something to discuss/improve.
>>>
>>>> +
>>>> +  nuvoton,sar-threshold-num:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      Number of buttons supported.
>>>> +    minimum: 1
>>>> +    maximum: 4
>>>> +    default: 4
>>>> +
>>>> +  nuvoton,sar-threshold:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    description:
>>>> +      Impedance threshold for each button. Array that contains up to =
8 buttons
>>>> +      configuration. SAR value is calculated as
>>>> +      SAR =3D 255 * MICBIAS / SAR_VOLTAGE * R / (2000 + R) where MICB=
IAS is
>>>> +      configured by 'nuvoton,micbias-voltage', SAR_VOLTAGE is configu=
red by
>>>> +      'nuvoton,sar-voltage', R - button impedance.
>>>> +      Refer datasheet section 10.2 for more information about thresho=
ld
>>>> +      calculation.
>>>> +    minItems: 1
>>>> +    maxItems: 4
>>> Your description mentions 8 buttons, so maybe it should be 8 here? Or
>>> description needs a fix?
>> Driver just handle maxima 4 buttons for general application, but the the
>> above description is truly hardware capability with 8 buttons support.
> Then it should be 8.
>
> Best regards,
> Krzysztof
Thanks. I will revise it in v2 patch.
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
