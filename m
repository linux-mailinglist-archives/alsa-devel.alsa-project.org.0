Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB087021D7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 04:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E62361EF;
	Mon, 15 May 2023 04:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E62361EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684118947;
	bh=8cgdWET11laNiwhxN0Llf3JhGeVtpQERFE5kScMRz7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1ub9WirM0d/fwh3o3GAs8qkGm2cr7qmw13PhLTGJYRobwAvELib8wIumD2DNQiVx
	 QA3ruohntjYNvrI46Uo2sPiFLcQhuhWuxVvibJM2APDG9wTba3kG6OuJTwpUsks2yQ
	 2nYvEw/MIHNfWTWSwIWCMA/V2NAEGiKutSnnxut0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9714CF8053D; Mon, 15 May 2023 04:48:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D73A4F80272;
	Mon, 15 May 2023 04:48:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25FA4F80272; Mon, 15 May 2023 04:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0A9AF8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 04:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A9AF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=Q069PX7G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6+Ei9GpxnJigewZM0NjRZR2NRg7EoYGt/rFDS9WqFtW9nXM0qE7bpQXt4nQyeMx+H0JAADRTHOCIfJfTpJKOaorxqzlfwwJDlQz6ETMG1E76FbEH0siR5yLMJadqsdoYTzRPnJWy1evpTCs7e7/NEcbRgK08FO+//Tjcxdg2rEqYv6ASmeGc6+n28o4lOtMJFBwg0uT3j90Z3Vf22RWLs5tMrJxFnoiGb0x8QlGz5byjzB5UmResS4y/OOMeMehZW2We5IQBzPMlX8NaJ2JIeA7iZ7bqLCy7DQmHm/QV0EB1PPOTkGc8UvXK5LicI3GpjvL4maGhH7BHHMgCChTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYVP7JVZhxTWStdwTcAuDlM5Tz+KQSzqDRDuUqOf4Y8=;
 b=W5s6gpLGgkl/ZPLGgk+LgLE+u7zp/ht4CWIy16N/k/Ioj6ySCgoEy3k2eJvNvRmhoW3WCYeiAHkDz1v83BpCkbOnBnGzCMN2RnFT+HivVsjJBLmGwXUyyQ8mgBVQpnDoMPxMyiwGNBZpz2oUQjbQj18rQNcMmiQYr7CSbf/S6sxAonHKsTd9XPOSuqot2oKW9ommA/xxvBYX5QNPrhVH2waB+zZLd7kV7dqwXu4zTM3Ni7HIXsBKSeMbFGPbegQnukyeC2mgZIOQ4Gn7Wy34n8AdydfFJanraQ0z6JEPukK+++PPrf8Is3xejtDyL7sG20PdqWLLKxRijCv9lsmhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYVP7JVZhxTWStdwTcAuDlM5Tz+KQSzqDRDuUqOf4Y8=;
 b=Q069PX7GlOhoWYl645wjztPdFFraFpVCKkUyT5e4mxY4YRB7SzYPciEnrSInydJo3TlfY9P3uT0KgGHcwJ7Wsni4q59kzRRXggJxPGxgMp0vIFkl0MaHsyspudvZgsvmen8h/ep4P6cFMD+XoF9nm8xl//tx2EC6vDfeatc5pSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by SEYPR03MB6793.apcprd03.prod.outlook.com (2603:1096:101:8f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 02:47:45 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%4]) with mapi id 15.20.6387.021; Mon, 15 May 2023
 02:47:45 +0000
Message-ID: <a1afe69d-2bb1-02d8-3573-dec370cc1a9b@nuvoton.com>
Date: Mon, 15 May 2023 10:47:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: dt-bindings: nau8824: Convert to dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230512120146.600128-1-CTLIN0@nuvoton.com>
 <877338f8-d157-0f91-33a3-fdb03566aa57@linaro.org>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <877338f8-d157-0f91-33a3-fdb03566aa57@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|SEYPR03MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d40f09-d33d-49cf-f197-08db54eec2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lJeBXD2YPk9T/f/dRy969wtWfqCafiLe6TXPdIuGalH1v96k5JbYjtRbdN4fLR9sMADnL8wnzoUPCff1PWoE6cDfDlr8LPOXMT50R+/u90PTRy2NO55I6UPCVG/L4QsG7sPkAq/pWXgzsnfyf4B+Z+g+ZYz922M4ytey9J0tM0op6uXyz4c0UYu1VjaisC63E3uDh+NFixJsA/RpBfmcAH9Rjh2qwFVV1jij/m57LUrr3ZIXEN8dY4m+LRpKfOXBMRZ0AwEQLyJf1eoHNSlHHkdfe8bBfqChxZPVWgaecltWbMnpGkrcwJ6neMdCLaGaybdsNElaq12I84vHJ2byOroQkJPF6EW+geBgQMdQ8XHJNrW1bmuDj9z/faAOeasBop5u/4vZPv9X4Z+3+oGbZLyQADbSBB7ibHpa52mYfkz0f6i+GZoUKvo2+CqGQ24IixjNWEHQ2zEG4FGDdDZ4HqBatHBS/cH3BcOeqmFLBumYl1VEB6jz4POnnW2K4/VFJ1+TpZ35nFPlwM2IJF4QLAyICkNUOPSzxm/uBh/GO9QbRrjxImaLH2Y2aZg0nkUFXTbk5I0q+vKgq8uCANW8/k5uM+H7bRls118mijoV9DhH/lb8IbnRTBOzyWQMwy7Xgja7qunCUO7VHMS8IBd++Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(478600001)(66556008)(66476007)(4326008)(66946007)(6666004)(6486002)(316002)(2906002)(8936002)(8676002)(41300700001)(5660300002)(26005)(31696002)(86362001)(36756003)(38100700002)(2616005)(83380400001)(186003)(53546011)(6512007)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXBnL05icVI0UUNlY255b3MrWWYvMk9KVHVqczVxYlEwZnp3U3BqaWRzYUxi?=
 =?utf-8?B?YmR2eTgzdDlwUTdzTlNtV2FqQllRamFhT1pMZ3dBUW81YmVDODBYTVNUT1Qz?=
 =?utf-8?B?U3pNVE5KcjNTVEZDTDRqcC9VSG9rWUkzL1M1OVlnRkxCWUZQWWhBdXZ4M2Uz?=
 =?utf-8?B?UjJhZDh0d2ZpV3dVY2MwSG5FOHBTR01ZVnBSY3FKem5lWnkzMU9jSy9GU0s4?=
 =?utf-8?B?OWJqR1YrVzJtbDdPeElKK2x4NzhSUExMMGhGQzV5SzZGODduNHYwWlZ3ZDZq?=
 =?utf-8?B?ZGE0VXlpNEVsek9FcXVEa1pwNWF3OGRMajRGNmNpZkFBVEp2ZGFmc2J6QzBQ?=
 =?utf-8?B?SThGYVNib3h2TXRNYkp1NmpCSXJiNGZtTERDMzNRdHF3SXNRT1E4VkZDTXhZ?=
 =?utf-8?B?STJRVnlwakJaOXBoU1lRZWJQb0pMa014S2dKV3NIZzNaNGV6QTNnVEhjVXFh?=
 =?utf-8?B?amcxTmNLVWxiRU15Y1M3bzErWFg2cXhGbGx4cjJVTmpHOUhvU2dxcHdJMlNF?=
 =?utf-8?B?S1Z3Vm5YYW0wZnJrd2lxSVFHZ25XZmtuV2RkSVNzcXo0dDc5V0dWeng4VkZm?=
 =?utf-8?B?aEd4bUgzVkMrVEFMNHpweE5oVEdZQ1FISWdPZzM3R1hwU1ExQXlqRm1GZG9p?=
 =?utf-8?B?UExRQzhDd1Q3aTgrUzdyK3AwOVh6eEtXL0tuTG5udW5lM2xJdVVESWhiaSt5?=
 =?utf-8?B?MUFrRUFkUnlBeHNpVEhFMlhUTW9QNVo0MXprZE80VStEdmhMd3Y3OUozUkN0?=
 =?utf-8?B?UDNPek9tNDhDc1BOeHdjelUydk41aGtLS2ZGUXBROFBIa0VMY1EwMU95T09t?=
 =?utf-8?B?UVRUL0lHZkI4cXpSTkxXSkZYTlIvdm5SL1ZreVlzMzNHOS9xOE5mdTJxMXJP?=
 =?utf-8?B?UE5HT1R2NWlJcXlJbHZEWE9Fd3RPZFpVcUQ4bnpGeVp1OTlHVFpzY0lPMUhs?=
 =?utf-8?B?MXpIeHFqNm5LSDVDT0MzaGpDVEtvL3hKZEtITFhaUmJGVkFkdmUrL2ZKRk1s?=
 =?utf-8?B?ZUkrWFNYNTFmWE1VU0c3NGZTZll2dCtlU2lsRU9vcnAyNXJ2c0kwNHY5dGV1?=
 =?utf-8?B?Mm1UYndvR0IydzZxNS9nUVJGaWxXUld6NmZ3SjhuTyt3N2dYVXQwbm9OMlJF?=
 =?utf-8?B?dTVMQlFjZWJpODdNTHZ3WTlWcFZXZ3ZEcFkwVUF6aEVFMVZ5WDlvMnQ4R0Fj?=
 =?utf-8?B?VWxOWXA1K0NQU2NpeVJTMGJhUmp3QVRCODA2M1hrL2t3SzJad1krK1Y0bTZ5?=
 =?utf-8?B?dzI3MmwyTGJDY1hPbys0TWN2OGRjV2w0T0F0ajUvc01lbElqUmJSbGs2YjJy?=
 =?utf-8?B?NldGMDhvaEx4QU5EU0JKV3lYTTRiY0dTTjRQZ3RUcEJIcjhjZ3NGWVFja1Zt?=
 =?utf-8?B?eWlWbVRiQVh2ak9JVklKbVRUNFdsZHMwRTJkdXd5Y250Mzd3VStDOHdpeThl?=
 =?utf-8?B?bGV0ZEF5NWlkbk9lOXFscEl3NW1ZejJxdFQyclQwMUlqQlg3ZEk0ZFFrMndx?=
 =?utf-8?B?a1ZEa1hXWFh3UUswNmtBVEpEWWlzRHZZZHpCWXF4REVjeXlsaHdUTWZjMWpX?=
 =?utf-8?B?V2szd3BadU1tUkdBUWQybU04Yi9FRk1Vbkd5UWF6RHFaOHg3YzNxQUIrUzVz?=
 =?utf-8?B?TUV6YkhJNmk2Tk1HT3lYWHd1akxuemRKWGc5VGZUL252bjVQWEpsTmpDbFVP?=
 =?utf-8?B?RlhQUGNuSnZqUzZ1S2hUeDN2SmlKbHJMN2xaeGEwWm1OMDBHKzZvUjFqcm9k?=
 =?utf-8?B?UTJFU0lwMlhHUXprSGxtOXZ1Y3F1a2QzRnRDS0FCdy9aS2w4RUxieFhhcTZ0?=
 =?utf-8?B?UG83MFhWNENpRm5XT0E0cms0dVVyVituRFV4d08wMGM5UjJMeERaYkpER1VZ?=
 =?utf-8?B?c2I0cmowV21mZ1FUOXlwamhTY1REUXdVVmxqdFF3Rm1mVXRROXFXSWhKM2hD?=
 =?utf-8?B?V2xNTkVSZzE1QkljcEN5S2c3cmZ3eG4zdWJCS04rK2VFQWo4WTdON2crTjZE?=
 =?utf-8?B?eGZNV0ZwZmxCdlZSMjFpaDc1RFVIZldML08xdVFHRE1LQVNyY1pzR2MwL2ll?=
 =?utf-8?B?YlhnNG4vVXgwNnNjcFBzKzZVZ2UwbkRoTGdGZHpEV2pqaCtueGtaNjdTM3RQ?=
 =?utf-8?Q?VBoGbJ/fmMFdS7BB6LfjrDxkK?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 62d40f09-d33d-49cf-f197-08db54eec2f7
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 02:47:45.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1fw526Qne1SS0/k7SgwxSnbIbU/pOIym4RBnJ916ZqYSrpSedTNKDOnkLHJnNulJ4J0j2zdpiYggjPQ1/OFdtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6793
Message-ID-Hash: VX65XTBTU2VGXO7EUOAQDZUVONOTJYZN
X-Message-ID-Hash: VX65XTBTU2VGXO7EUOAQDZUVONOTJYZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VX65XTBTU2VGXO7EUOAQDZUVONOTJYZN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/14/2023 2:38 AM, Krzysztof Kozlowski wrote:
> On 12/05/2023 14:01, David Lin wrote:
>> Convert the NAU8824 audio CODEC bindings to DT schema.
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> ---
> Thank you for your patch. There is something to discuss/improve.
>
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
> Your description mentions 8 buttons, so maybe it should be 8 here? Or
> description needs a fix?
Driver just handle maxima 4 buttons for general application, but the the
above description is truly hardware capability with 8 buttons support.
>> +    items:
>> +      minimum: 0
>> +      maximum: 255
>> +
>> +  nuvoton,sar-hysteresis:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Button impedance measurement hysteresis.
>> +    default: 0
>
>
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
