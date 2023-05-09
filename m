Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B56FC089
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 09:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E8E113A;
	Tue,  9 May 2023 09:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E8E113A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683617765;
	bh=jMFA7+snXAppYQrKTg+j2WV92R9v9Vxtf2z+BV/z8Do=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HAO0ReB/0xT4jsaYWYwcdka456KOGa/Caw+73Wh0hiFK6mFElCRRsGp5F40auS3u5
	 +G8ExdQtZGF58BSnLRNBYwdN9pY934HILywf/+vUK/IKZTpsouzhOXEzw9TST8ElHB
	 Z/wIsgJenH0CCbt219exvRmu9MyZdGuavmk8y2cU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4940BF80310;
	Tue,  9 May 2023 09:35:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 747B0F8032D; Tue,  9 May 2023 09:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5437FF80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 09:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5437FF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=M47qLf5P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJyPF42CvQ8O08JspO6pddpu2qQE/EnoAqVi0vV89/Y/Hp36mXxwU3LpUd4zTllGfJk99Nua416XetskztMJzo/gEGcSEsFgao1kgyJcbvQtipnrH9NsNS8PncI9vFSYXGw0UJxOqito4r4cMjN3MKKQlC68vRjRra8OMofZKqG2G3Rmk2f2RalRMCeeLv2Z1HtCzEy0nLK20synNKhCFakRI+Bv9ZXkjBJQUZw4fSo7tUtkuCeSOb2jLsmsSDpuXzLnZ+xqNa2b6ioM26kRg+3AUMB/BIdZ9BncaVEczccfLVqyK4vBVXamU7H9TSgZHRU52hiamtI3WFzcEwvkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CsX2b7Vi4NGUesB5rDDv1KmlnD1sshJgj8XFygKxgU=;
 b=DvEZvGHFSHIVIPidflWtqNcDWEnqGz8MaB89+zfFc/Qao3Qc3vPbA2Oxlqr4ioxWdzKklvWa/iG+CTyYmDiNoqe+0Ps1GqyA4AuvHxt4MQL3ME/GntU/+vCjz/YHP45SwR7MA5s0TNIXhoKCBUZNbUMcMc4fIH7vGBE+JOwqhmkipcUvA920bchF2U5hJ1bQz4qeNfEKobcTJqHUdNb+O1ecpwVRnsQ5h7kFXQeLQ/TALWgsi9awYR5p80j4xKlgdlvZ5xu0ovOpPkNP5A5z0DKiHk8S/AVxuGf70PZvQqqMjyM1VZArWNLk2dozwkd5lDHh0Pkly8wRbPPfBjw89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CsX2b7Vi4NGUesB5rDDv1KmlnD1sshJgj8XFygKxgU=;
 b=M47qLf5PETBX9ZWccvKZsHH4PJGa8Aq/6BpT/t4Gh1MgTbuIQN9PlK5Ztj2UVYyDjN0If+usb/ujLxZgS96t0E6XHhhETB+k/9ctEaXPgPE//nuPA/2J3vLfkLV1eP3xIWNdt2Ta/MQCqIALSRgJuxM2P6UXQ6c8HwpVp8dTB60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by TYZPR03MB7792.apcprd03.prod.outlook.com (2603:1096:400:45f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 07:34:49 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%4]) with mapi id 15.20.6363.031; Tue, 9 May 2023
 07:34:49 +0000
Message-ID: <5b758fcc-5e2e-3a79-db3e-bdcefd94b021@nuvoton.com>
Date: Tue, 9 May 2023 15:34:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
References: <20230509051054.480412-1-CTLIN0@nuvoton.com>
 <16770b43-9ac2-d261-62fd-bba463b49f6d@linaro.org>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <16770b43-9ac2-d261-62fd-bba463b49f6d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|TYZPR03MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: e3036c77-e398-4f1b-3117-08db505fde88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kI2OdTdTGzdtjgtUX6HUC99Jf3SSSJFug+RicSBRpaL0adDU+sN+VojGAyaT9fzpXstyvcNsNv8XGRr2D1SCevIH6oEm95tDg87nwqb+XR18ayq7lL86e0eeNsEB2+EwEATi3EDw13rkQJP4inwMGuTmY9bkQHq/vQb2p40HlP78SF3VZzQh/7pW26uf7yad3p7SK/phQk+VByHyAoGmqsIGc7bSxPV+THU3zRFrKsXKfT/fBlCagx4Bj1DDZDFW5MXNnipG73Cb+MLvgdE7HnONppkssUM5XdEIJiwn8yLzeFvUqLB9VHSHgXxVg48Gl/6UHrG6BntPpsesxuXeNkVG4O8SImE54A0kb7yfnHRdXTTfjTg9BaiUPTIrkWrZ1KtL2e/SC9nHqUDvKBl1cJ9LvL97WorkSC9fUq1RiuCXg/TKvlqeTXLpBPH6W/KhlSFiIzzbuPmKgISZdGE36lkuNb3HiwAfUqXXvvIz/5r7XZasrZyLvwjga9q8pLY6G/EUpIz7iAPpXV4G52us6SMJsCIB0U3R+dRgfDvA3Rtxiu9GMXq7/17INnqr+NdWATxQbJLxXdRw+kTV/oWy8ImJEPUFzLFSg0UWnFaYgtI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199021)(6506007)(53546011)(6512007)(26005)(66946007)(186003)(478600001)(45080400002)(6666004)(966005)(8676002)(5660300002)(8936002)(36756003)(6486002)(4326008)(31696002)(2906002)(316002)(86362001)(66556008)(38100700002)(41300700001)(66476007)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bE1XVVNQY0VyNEVuWEZGV09majFBK2xDalM3eGUyL0V5dWpHdVNIOXRhcmJq?=
 =?utf-8?B?Z0pwRXh1TTFBVlYrVE1WN0RPcEhwWDQwM0FZS3o0VTM5elZpd0NsNE9tU3Ny?=
 =?utf-8?B?NTUrNjJwNTZ4UFpWV2FzN282b0pFRDJkZmtXL1E3aUxITkh1U1h6MzF6N3J4?=
 =?utf-8?B?WW1zWHBML3dKVUFPMy9KeWZRekh4ODRWeExMYktuclFMcGJTbmVRTm9qNS91?=
 =?utf-8?B?dldORmw0M2tBTnRSWS9yVlNaTWtBdW1BVHp1WjVqWC9FbUVEanhrVFdVVmNw?=
 =?utf-8?B?TXdmMXNCL0pJeVdGSWdBRDJzT2dsZlBXTVg3RUY5MzlnZ0VkcEpMWUN2SE5q?=
 =?utf-8?B?aUsxOGZ2dnVqMHJob2t0ZnNFNm8yeXV2Y2pIL3ZlRlJqdUlIT3FlYzJHbzJM?=
 =?utf-8?B?NzI1ZHhBMnFya3lxd0FHeWtjRFhHcVBkejUwTFJpTksvWGNVcjhoRThydUs5?=
 =?utf-8?B?WllhQ29wN2o4aVYvMmMzQTlEZzdHeGEyYkR6MEtsSENmMjNZVk9iMDQvMm9X?=
 =?utf-8?B?cE41bWVqeUJTYnN6N0ZrOUQ0Um9Ydkg2eFBjd3pKK3JiSVpzN3ZzQmkveUVN?=
 =?utf-8?B?Mm1SY2JlMzVRaUxRWVNXdU9nQ0orcllyWmZnK2c5aFVJUW9SZXRtN3JGVjlB?=
 =?utf-8?B?U3RZZ2xJcTRzenY3ZzR6Nm9WNDZzODNQVlM0alprSmZRWEtDZXZyeHUwdjZ3?=
 =?utf-8?B?bEovZXNSUWRKemdhMFFKYm5BanFBYW1XNUQvSWVjRkxHZXdhYjFjZE1pQzVh?=
 =?utf-8?B?bHFsTUF3eTFRbkhsMXZHRkVCeDBUdlR1Rmo4Uzg1Z0k5Q2F4QWNjRElwZ1lo?=
 =?utf-8?B?b2ZpRzJKQUZXRDFZTjRkV0pRdHFCU204RnhHekszTEdGUFBhT2dsRWdMdXlv?=
 =?utf-8?B?YW9GNE01cGxHaENlajR5L3FCNlpSdENNN3R0UU5lRVdRRVJBajVCYUJXK09O?=
 =?utf-8?B?R3k0NWhuMTFSOVI3T1JWWGpGNm5ZbTV4WEcrVmRtN0RBcnNKS0ZJeno2c09k?=
 =?utf-8?B?OVowc2cxa3FFYlFIV1dpR2tEZEdGekNmcnc2U0VjMStDYVZrbTdkc2JJNzRk?=
 =?utf-8?B?Wjg0dldndVg3eUtVaHZ2bzkwQzQvMDYzd3dKM1Z2QlhxemVEeS9POUNzVXNy?=
 =?utf-8?B?aVRqcUt5RlBIbGl5RjRYWmlSZUFpUjVzYUpyZEc2UlhxWXUxdUx4Uy9wWEtK?=
 =?utf-8?B?ZVp4ZkZ3MGcxSEJXZEtZS1BleTBwaUhVRnpKbzJJY1l3Qmh1V05kRjhhZzl2?=
 =?utf-8?B?N0N5b1BydUNlN282Yi96YVFEd2Y1cUdUbTBETkNCMldsVzlEU0hBUjBxM0FJ?=
 =?utf-8?B?QkM5NXB6VktiNHkvZzZmSmhpMXJNeGQ4TmNITi83bXRSR3JKYk5rbFdnUW16?=
 =?utf-8?B?MkF4R3JoTUw1bDR4RnZCS3VYa3IxS3ZUL3NOUFJUWGJYaE0wTTRLa2FRejVP?=
 =?utf-8?B?eTMwL01kZDU5VU1lU25UblEyZ3AyaEpZWkVobGlrbkI5YWdBZG82QUl5bk9S?=
 =?utf-8?B?Q1p3bGVKaGlJMGFMS0JBb3haRVRsUytKNDZERURGZERMRVN0RHhaL1EyU2Yz?=
 =?utf-8?B?M1dyeUI0dDBwRm1ISTN0clBTVWp4OFU0YVpGMVFHV0NzRE5PTytxYml5THUr?=
 =?utf-8?B?UXpSRzdodUpORTRIMVM5TmNoL04xOWNGZXpHSkF1TXRDV0dwK3BpaStMT1lB?=
 =?utf-8?B?SUVreVNDWGFUQ2NlMmRHcEdkMXdteGMzdmw3bEFnZ3hrWlJIZHJ5NEN6dWFK?=
 =?utf-8?B?THR2MWRrSVpvandpRFNzUWt1OE1QTjVoZEZsTWVPc1hKN2U3cUg4TkV0dWdN?=
 =?utf-8?B?eE04RU5CWExncS9TVlQrbk44THNzdGU1VVY4WTVoalRBVUFHMGwyVGtUa0ll?=
 =?utf-8?B?dmc2Y2xYT1ZvdnZtYzVrMksxT3hyNW9GWFYvNmc3bTViVlBTU3Y4MHRYZFRh?=
 =?utf-8?B?Um5LSHhHTlE0TXRFeGUyc2tnUk1Zd1JpbFpENjU2Ky9WNWFIZm9zT1BLRXJ2?=
 =?utf-8?B?RGh5R05jcnl5ellGMk5mOHlIOEZOVU5idFR0VkdJa1p4NWJmdncwVnpQSVE5?=
 =?utf-8?B?VkpnUGFFMjVWU095bXBxZ2xLbWdNSjhHTDcvbThXZXo4YXZRcXFKR3djL1Bh?=
 =?utf-8?Q?1YBMs/fQ3Ldit/jnq7XkHObuU?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3036c77-e398-4f1b-3117-08db505fde88
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 07:34:49.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xk6dAd8etkVCZmS6Thmyy09lqWErlabPt/w68HmjPcdh3RX4zj0jVqHk+vE1ZVWDVUAiG8TUXGd93CEpDZ8EDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7792
Message-ID-Hash: 6CH7PQXVNPYMETWXPGCFKAQ676KUEKBH
X-Message-ID-Hash: 6CH7PQXVNPYMETWXPGCFKAQ676KUEKBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CH7PQXVNPYMETWXPGCFKAQ676KUEKBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/9/2023 2:22 PM, Krzysztof Kozlowski wrote:
> On 09/05/2023 07:10, David Lin wrote:
>> Convert the NAU8825 audio CODEC bindings to DT schema.
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> ---
>>   .../devicetree/bindings/sound/nau8825.txt     | 111 ---------
>>   .../bindings/sound/nuvoton,nau8825.yaml       | 220 ++++++++++++++++++
>>   2 files changed, 220 insertions(+), 111 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau=
8825.yaml
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

No, I had ever run 'make dt_binding_check', the result is no errors.

However, regarding your bot found the warnings, I check my environment
is not the latest dtschema and without yamllint.

>> diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Docum=
entation/devicetree/bindings/sound/nau8825.txt
>> deleted file mode 100644
>> index a9c34526f4cb..000000000000
>> --- a/Documentation/devicetree/bindings/sound/nau8825.txt
>> +++ /dev/null
>> @@ -1,111 +0,0 @@
>> -Nuvoton NAU8825 audio codec
> (...)
>
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
> Since this is optional:
> default: ?
>
> Same in other places.
OK~I will add default value to these optional properties.
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
>> +
>> +  nuvoton,sar-threshold-num:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Number of buttons supported.
>> +    minimum: 1
>> +    maximum: 4
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
>> +
>> +  nuvoton,sar-compare-time:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      SAR compare time.
>> +    enum:
>> +      - 0 # 500ns
>> +      - 1 # 1us
>> +      - 2 # 2us
>> +      - 3 # 4us
>> +
>> +  nuvoton,sar-sampling-time:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      SAR sampling time.
>> +    enum:
>> +      - 0 # 2us
>> +      - 1 # 4us
>> +      - 2 # 8us
>> +      - 3 # 16us
>> +
>> +  nuvoton,short-key-debounce:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Button short key press debounce time.
>> +    enum:
>> +      - 0 # 30 ms
>> +      - 1 # 50 ms
>> +      - 2 # 100 ms
>> +
>> +  nuvoton,jack-insert-debounce:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms.
> maximum: 7
>
>> +
>> +  nuvoton,jack-eject-debounce:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      number from 0 to 7 that sets debounce time to 2^(n+2) ms
> maximum: 7
Regarding the description have limitation for range, so your comment is
great.
>
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
>> +
>> +  clocks:
>> +   description:
>> +     list of phandle and clock specifier pairs according to common cloc=
k
>> +     bindings for the clocks described in clock-names.
> Drop description. maxItems: 1.
OK~I will add  it.
>
>> +
>> +  clock-names:
>> +   description:
>> +     should include "mclk" for the MCLK master clock.
> No, you need to list entries with items.
OK~I will add  it.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/tegra-gpio.h>
>> +    #include <dt-bindings/soc/tegra-pmc.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    i2c {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +        headset: nau8825@1a {
> Node names should be generic, audio-codec for example.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
OK~I can follow it.
>> +            compatible =3D "nuvoton,nau8825";
>> +            reg =3D <0x1a>;
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
