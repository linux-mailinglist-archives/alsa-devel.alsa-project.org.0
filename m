Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41241705E1C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 05:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45645F0;
	Wed, 17 May 2023 05:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45645F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684294213;
	bh=XEUrDqRobRKH27kYS3pRPMYU1E+8quaEZQGCvRfRE2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QrNtyO/qWN52foMVjJ+HTZ1m1nb+A0gMtGNCYxr38P7WFJ1ZAqFWoQG3v7ssD7Vae
	 Kcioj3+bsjI+6gxP8RiND0qc+h+J6hxJAr2sOgkqamauR7T7GQq9X9W8NR41RRoG/3
	 Tk4ny//PlEd+WAH+HCb5NV+xSqbKKSLJ6vZrtNO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B88B2F8016A; Wed, 17 May 2023 05:29:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4836F8016A;
	Wed, 17 May 2023 05:29:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAF6EF80272; Wed, 17 May 2023 05:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18F91F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 05:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F91F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=b8ApqQjq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gt2saZv8SGdDOt1FYjQjsM73Ysk2Z4n2qU1+2+YZmL0HijONLy1Wc6VgcrCnWOcYoJPehPRV6VrigIBPQ+xsHqhZPp/9UfAjMqTatH3/9D2gj/WW4Yeu1zGjBpfy36HgytuyBwW9hfYKApFWt7dRgn2EM32qC/6oqCd1etb15MeN2/FTHAanXlg+lOwpetoxGs4m6s7uSKgykDKftIlWvhJ13c1R/PaqPfqIkhR4UZW+kXYzkTdamfWFuY2y3+Q04LM3JHKiGswivv6sOJBh6F+dJVtHvmwFniST1G4igqSGb7qR6dPbLpKE7fX5Q9ir7GfFgzyjJl40BRIueK98jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41JTsLhSbf5Thwj9rsUAzEjM2ocT8ESeIS6GPsUUNzo=;
 b=A/Z83/9ocNPgrkKOrBhGnIJhiDefJ3S8Kua/ZsAKlHp0SK+rS2fWFPh/E8XiqztQPeCObq8s/1xi6njLW9h3OxBNN71q6JWYWEYy3aS4hLslfJejgAf/Aq68s95j7gLxZkcGSBtSTdTmNs7cMO+O+IRimAJdzZaCZfB6ogAImpQqfb9w3705hZSsTReKoemdmEjoGTnm8gubFZVlDm2X7UtSx47uVPJJeEHO1SLGZsOiUuB1WuQgPuXtVCiYZJbKElmXZ//YHTV0SNkHGcZRjPM6NYAGLvs96Ss2FMAJhq+76/gsF4UtmTYvbj50CVPnAYU5DiU1E6dqiEBNWO4iyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41JTsLhSbf5Thwj9rsUAzEjM2ocT8ESeIS6GPsUUNzo=;
 b=b8ApqQjqnW5FOAPnuqZDYf+/0a3DVbg6l3PuZp0SKkMKAn1uWbFQHno63DFs/6SryH2EHpIca6Whgi55zk7qWaN7cOq0BIyYgF0YXNrYObXeLIV2q08eLBeHTXATqm1vaQIJbMmOzerT7QN8ui2PKFkSAlZjM6scq6ng2JKMFCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by SI2PR03MB5857.apcprd03.prod.outlook.com (2603:1096:4:141::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 03:28:50 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::3dcc:2a50:b1d4:b953%4]) with mapi id 15.20.6387.034; Wed, 17 May 2023
 03:28:50 +0000
Message-ID: <cbeabc50-35f7-70ee-5165-8a785513b1fc@nuvoton.com>
Date: Wed, 17 May 2023 11:28:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: dt-bindings: nau8315: Convert to dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230516054944.1081808-1-CTLIN0@nuvoton.com>
 <e2819075-c41f-716b-023f-fb1ad13a3466@linaro.org>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <e2819075-c41f-716b-023f-fb1ad13a3466@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|SI2PR03MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ee1a6c-f8eb-44e8-9bfe-08db5686d4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9bYZifS03h8mXCkYRow40LVQjeMdJ29x5LH3kS2Epke8pUBFtnN+ziyjkVbZf+hNVbXknH7krHYa0Tit4rc5OD6n4d4GgGnpAN2Evslgxb3PG1aAWAjKuDX2dyCIUYRpIgs8/yNtwSdxPylY3QPUHSw1uad3bi9h1MzwfAGWMtL/L59jpj+t9z1/nA9kkIHJsYG7A+G1MCtb+tzZX51i4RLTcT83FriIqCrRygwvNsiHN6X4zJymuYGvV+J8PTUo5cJDpDL4DBbWwTC9r3yOBRrBuvUHIr8NpmQydALU+aMrsInGsuWwmkoVQLldaf6AMkWGhZRxWd4m9B5GdyTMhwDeAdtqLr68gTjB0/C1Jy6rpJrJmjyBLqFZR0ILRgi8BpSAeidJigELHyN5tAcCvUEMw0YoD1ZJ+yIyhQLclH/p8tOrTeFWBaHf/26PIDqKv/smZxzfw6uOF6rz5oCW0vLY2VjU+KxCktlp0LOyEw8ByAZPd0PNBpJAST8zFolFYlnelVwNCJKxRoH3PffYdKhoDD1LTPYpO7rlMluG7CnjS75vGk2YJBwalRw0UZjCY26GVkLW8LPELUOwB1FbD17Ozx39c0iaQicwIQqmZQtBDF4DwaA7hq3KboX8NLBBQSnAb4pEU/bFoegKAtPE4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6732.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(38100700002)(6512007)(6506007)(26005)(186003)(53546011)(83380400001)(2616005)(5660300002)(6486002)(6666004)(478600001)(8936002)(8676002)(31686004)(66556008)(66476007)(66946007)(86362001)(316002)(4326008)(36756003)(41300700001)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dEk5R2hGMGJwWFF3Mk9HcUdkNmRaQklPUGVTSlJOWEE1SzZLZVR2UWU4enEr?=
 =?utf-8?B?MU92RUdZZmx0V2o4UlFrY0lFTzM0Rlp4V2pueHhEUkVIYlNkdUNVRGgwK1Nk?=
 =?utf-8?B?Sld6WW1hdmdveWxJTDFxNjRIcmM5cHFIZmVzMjhLVmwxcEpYckIrTE9uY2Fn?=
 =?utf-8?B?bFFpdU1HR3pFSXU3TEJDRVY4cXNhRmhNbDFDMmJieFNka3JwQ0ZQOWZqdXMw?=
 =?utf-8?B?NmxiNngzNUJuZUQ2N1VYdFhIK3duYkNkZ2pzQlc5NHd3d243ejcvcmg4cWtn?=
 =?utf-8?B?N3NOVnRmQ2VHOGpwTzhSaTd5ZTBucE9nN3R6bmFaRWFjZ3FuUDhaOGxtZlRS?=
 =?utf-8?B?WnR0TkZIakRjdzBua2NmTUtNMWtWZWxDdGNtcTdwd3ZQOGJIWFlqZnNIS3h2?=
 =?utf-8?B?OVRsNlVFeG5TZDg4THVnZE8wQndzWUthL0JUT0l4bnRFOGRLekNXVVpjeVpj?=
 =?utf-8?B?c0VvZnhUdmY3TlhLSWcra3dRWjJXTjRqcVRtbVFIVkdRQ05WZXJvRXNPUTlL?=
 =?utf-8?B?RjYwSXFvSzhEaTc4QmZrakZUZnpmU0dSMktiYjdINnROQ2hCdGZTSHU0ZlBa?=
 =?utf-8?B?MDI4MHJ6c3pkWWVaY1IrVklBeHNiTjJtM2pWNzNYNVlWblI1eitpSW50WkFV?=
 =?utf-8?B?NGtVdTBZY0s3WE1WMm1RQXkycGZabmd3V21tMlRKZzk3MzN0cTFjTjZnalJj?=
 =?utf-8?B?YWpOYzNrdERVTlpBS0lOYkhGTEcrTDdlUm9qTlk4ZG4yK2JKbCt0OGFsQUFy?=
 =?utf-8?B?UkVWb3R3UGdPak1weHZiZkpHb1RmaWNEcHhGZzVDMzY0OEJtbyt2T2ZkSndj?=
 =?utf-8?B?UUVzVlNJUVNKdXd2N0Y5UnF0RUhWaitiTUQ0QkNyTThIK1g5Z1VaNGxlYUI4?=
 =?utf-8?B?dEFFOXNuaHM3blJJS29QeEpaN1NPK3YyZTdsYTNqbEk0Yjc1bmJWbHRVZ01y?=
 =?utf-8?B?a3JjODZ6YWJ2U2preGRGczl3ODBEcndNQjBiOUthN3RiMGhhb3B6WG0vWEgr?=
 =?utf-8?B?ekhDYjVOeFNZWW00T2lCSXNzdHk0Q0FpNUVXQkVWVll6OUtDOWNxUkRSMElo?=
 =?utf-8?B?ekRaL3kzaEovSDJzdlEwU0xJbjUyVXdaRjY2MFdQVmVUdVRmNXZIMVVsbWIw?=
 =?utf-8?B?ZHl2RGhHZmhodGxlcUt4QTgrZ0llVnI0TXJ0ZzJyVjRabTA0a0UvWnlFUWk0?=
 =?utf-8?B?OU1uMHdXY0JidDdLR04wWlRWZGx2UUJvMlhxYVdJamdEeHhndS9XZVpjK2tY?=
 =?utf-8?B?SStFNzNmR0pZamhUMkNSR1UvQTNCN1Y2UnpLTm9LYUVoSWlDTE9VVHhYM3kr?=
 =?utf-8?B?YlFJbm1RZE9XUDdmSjJ1TllDWlNyQ044VGlsaDJsdHRvSzdJUm9aemUrT0Zy?=
 =?utf-8?B?eitxMjdHZE5CbXUyZUV6UnNYdzUrc29aT0d3QmZ5YzlNSFZzMEthakxnRFNj?=
 =?utf-8?B?VWZjWkRtWkJIdFpLWVF5RWlBb0F3YU5EbkJxSjZuOFJQOEV2eENKZU5XRlBi?=
 =?utf-8?B?MER4ZWdnUnlucU13VHZqenN5UERJdVhLaFhKaHZac3ludVJpa0M4SjN0QkdJ?=
 =?utf-8?B?MnY4RTVQaGpqcy91MzhsUnhuUURKTjBhcGJSQjRidk55V2V4Sy9qYVU3RUxI?=
 =?utf-8?B?L0ZseXFmb1d6dTNCdDRiZUpPR3J6Wjl6cnU4d2x5bWY1V2hudDNqS2N0UDdK?=
 =?utf-8?B?RjcrQlB6STNlSnRRVDlRS01tWnJhdFpNZ0gxUGRwL0JxcGtYM3J2eFdxUkRq?=
 =?utf-8?B?Z1FzZ3VjVFFCZ3F0eVlod09XTzFROEJyOXVBbldXbitXOHlGWVZMdk9xL2JG?=
 =?utf-8?B?cncxL05NZUhDRXVOcUJodUhRQjRocnNpTDBUY05GaXBhc0htZytKUHdzQVRm?=
 =?utf-8?B?RkNJWWh1bm45M3gzb1hjU1BweEhrc3ZPZVlRMk1QNW0yVll2RHZWRysvNmx2?=
 =?utf-8?B?d05MTStsaG1Td0RDTncxa2o2QlBnQ20xbEVhMFRQR3MzNjdYSmY3LzNwL3cz?=
 =?utf-8?B?OFZ4LzJBL3o4dkozT3pKeElWVU1oWDN3YllTT0VFR2FFckd3RjFwWWRJQ2NS?=
 =?utf-8?B?UmtrbEROK2xjbkFVTlV1VjZOdzVsMi9INENMRTB0NWVqWHUzK3o4SkNCYWZt?=
 =?utf-8?Q?PISBtvK0Xutcy/+w97QLg0LHf?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51ee1a6c-f8eb-44e8-9bfe-08db5686d4cf
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 03:28:50.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ByIpwmr6j4+uoamxbPsfZdkWl+145GkKsEBWpRQpiCyRZJiXRTMmhXQ0/zDkyaMqeEOLSj5v5ZtKvX6C+wy1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5857
Message-ID-Hash: QIZTPVH626VLXUWXK6Z5P65NAWR6D4LE
X-Message-ID-Hash: QIZTPVH626VLXUWXK6Z5P65NAWR6D4LE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QIZTPVH626VLXUWXK6Z5P65NAWR6D4LE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/17/2023 12:10 AM, Krzysztof Kozlowski wrote:
> On 16/05/2023 07:49, David Lin wrote:
>> Convert the NAU8315 audio CODEC bindings to DT schema.
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> ---
>
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,nau8315
>> +      - nuvoton,nau8318
>> +
>> +  '#sound-dai-cells':
>> +    const: 0
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO specifier for the chip's device enable input(EN) pin.
>> +      If this option is not specified then driver does not manage
>> +      the pin state (e.g. chip is always on).
> The only thing driver is doing is to toggle this pin. If it is missing
> the entire driver is noop, thus above comment is a bit funny. It
> probably should be mandatory pin. But I see it was there since beginning
> so ok.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof


For "the chip is always on" might be make EN pin is always pull high in
the schematic.

so driver didn't need to manage it. Of course, this driver will just
have software switch.

Generally, the schematic will design an extra gpio for control.

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
