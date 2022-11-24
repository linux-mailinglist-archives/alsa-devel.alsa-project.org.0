Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C520637834
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:57:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E956416EF;
	Thu, 24 Nov 2022 12:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E956416EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669291055;
	bh=p6Lmpa6MtlZ413BHT2p4ITIUn9NqPfhdzhDrFIvAMhQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBDN90W6q8s/QDZCDz5BA0YUmxgkKbhQzyGOKgSgY508OD+/aBNjGzNLaDtVKrSEt
	 lxC6YlA0Rcej9Gc7PB4mnyWpzyJe1h86PiNcQg2k3bxr8OyDJ3LQPWRUAk2XalLkX5
	 91XE0ERA8Pu3R76ujQArACAi3l68EQHu35YPEGmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F1DDF80448;
	Thu, 24 Nov 2022 12:56:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD45F80431; Thu, 24 Nov 2022 12:56:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7610DF8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7610DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.com header.i=@nuvoton.com
 header.b="aHHjbIpt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMETqVJFqjJmXpLOw+de6oKwl4EtUooP8INqN/f0FZBBgre2E1WeKjNlaGIylI01LMmYvxr1i6vm6Qp/YDwywP+U5qkA4eFdPwyt05ppvTM7WFpZy4qHijBITpI/qpNmM8z4clA5zd1qNPLtMLmZYOyh67SetgcZgtoyWXxAdm0pNIUHow4qiLll4+MNHBKu8D6T6HKgfy/1f1cVXZQe/MJFgpfJ4Lo+ibHZsGXQSuP5jbQz3bg7Gq3s5X+x4NthsS3EnUGnVvEqEe1N1RBjKq/4M20jJ+kUHHLshbTPMSqD5eGhvdlyYQBYxdNqin7D8uK/+doDjlfezW/1C+0BMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOqkiCFDsFF8HpiXK/Ai184CHdQH42sC1bjJuW3df1g=;
 b=AJy7btWb9zAQ1bD1anf6SCnHy3OoVhofp6nv55wARUL65SZaxUI1Zj5AiJtNnZLES5W0mKDCq3FdILxMC9Xuum0GS18P01XkYMJATtui8eNBY7smUZx6m+j18nVABofdQ6EbuHmzeRKgR11d5WDZR2dGX4j5EtjLondedI9JhBtL/R3fjpxfzyUKxG/qwCzchfFglY+j8LffUewW/BKCy387PboPY5+a+vGzb8KAuz+p1/MLfUpDxXmwfmFFipfF6pQsUc237oIk0N4f0SPWrOHaH0gCE6JEPafoL639Zh2bahR/n7GiU4UGTWD9tdkO3dnUnKvk83ILT+FohiMajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOqkiCFDsFF8HpiXK/Ai184CHdQH42sC1bjJuW3df1g=;
 b=aHHjbIpt4jPhQabz+TwBThR+xxQf+ISF4mbW/a8cVHWD/o6MAE7q8zTjgGOvuCHf0OMgXfEvbwac77/ADj/es+NGQFncZ9E7rqHnXDWMDVAPRObgk0iPHM+ttMiy+p0iPxEL+rEjZB1h+C9/wPEWMOIUqDM2IyVCCwldyM7jaXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by SEYPR03MB6769.apcprd03.prod.outlook.com (2603:1096:101:68::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18; Thu, 24 Nov
 2022 11:56:20 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::7680:1f11:61e0:3b75]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::7680:1f11:61e0:3b75%6]) with mapi id 15.20.5857.017; Thu, 24 Nov 2022
 11:56:20 +0000
Message-ID: <63b619b3-e784-ba9e-d745-cd614a398017@nuvoton.com>
Date: Thu, 24 Nov 2022 19:56:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add compatible string for NAU8318
To: Mark Brown <broonie@kernel.org>
References: <20221124055658.53828-1-CTLIN0@nuvoton.com>
 <20221124055658.53828-2-CTLIN0@nuvoton.com> <Y39Y7yqhgtGa1Rt2@sirena.org.uk>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <Y39Y7yqhgtGa1Rt2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|SEYPR03MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: a5041cdc-86ec-4ce6-86eb-08dace12e68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojdbq0j3ooekTl1gTs0rik5jYg28vP2MOBzw1F5mUBJOpX1vjRPiqJXI/1gyRCqzIBHgdwFpw7puR8vQfxCZQp93tQkEwjXEZbXnIfQGnCVuh1jsC0N2BSFgZTbr1WOv+ef9ibDt/MBxWcNLhjLHTWON6fDohij6gQv2A903r6F1pdKXNjCoCPN9eQ3OyZdZOMBCGrCxnEtV3kKnI3xXLzyTshI35LghoMFGY/qnGgp3CcgDtTWdV1byJ5Wpqo4J4LEOUAqnkqGpqpotb9adFL9hu9lV11KvFlJhzpMHG3gctBkgVKhd93ISUjxa/4DB+Ngkd/yAFdMjDotq8Qso3OTljCqMsyv/uk8tJ9Ntfdy16upWejqrAtHbRZBW+ARhTF+xkhs13VWIgBjnxQxdYWMh/TS7WaCApRRBhrq/9zZXFYaW9bGi2DIwZhTfYkNIND9yggBFLRhqmYtD3HNZhaXJdLvapgQ5QYxx7F9a3n/udI9V59L5hdA5tVUymkqIyk6gixtP5g5U8P6F/E9e+trYEcLzl+VKY1IgW7cuu0glyro/i+NsAkUXMVm/qvPwSr8cO1fcrXyADpoAQDUb4zpfdbUXCaojHkMgAzEwgsSbIcXHphkr01LD6OdGFXOjaUK60AGweQ5Bt4XQs9omeABmzIZNfH3AD8KQwIvpzKLz7fBi3vltBxo9RU4A8ZE4GzouiKSyyNTOzLWXq15DW3EFoT/oEWJ54x7Ea3BAb7AkM1KT9c6eFoOD45ZD29it
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6732.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(31686004)(38100700002)(38350700002)(478600001)(6666004)(66946007)(36756003)(6486002)(26005)(316002)(66476007)(6506007)(4326008)(6916009)(8676002)(66556008)(52116002)(31696002)(86362001)(6512007)(2616005)(41300700001)(2906002)(5660300002)(186003)(83380400001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBCVnVXdHJ1dHZSdk51TFhsREFQRDlpcE5seUNiOTRYT0lZL1k0ei9wb3pK?=
 =?utf-8?B?c3RIVnAvMmlzUWpUVm00RFg3eEtWZDZxZ080L1dRNHFLaUJsSWN1NWJRam5i?=
 =?utf-8?B?QnJXZER5SzRjeEdwbnN2YTV5THkvb3F4YnhHWkl5NGU3YWVZbEZNSktOT211?=
 =?utf-8?B?MzJvZVRpU3RiT0NJREpVTVEycUJKSUhiUSt3cFQxSk5BRjI2TjNJT0NMQWRL?=
 =?utf-8?B?M2cxcDYxSVlINy9KcmhHcEtJMHAvV0lmSGF6YjVWNUN6bHdhNmsrb2FLdkpY?=
 =?utf-8?B?RUlEa3k4NHRsa3VLZGhBa0EydnlacnlULzE5d2czMTNobzRDSGM3MVU2amt1?=
 =?utf-8?B?U21LVmIyWVNQK1ZQemVaVGJRbVg1YlMzbDZ4VDc4UFZFcGxSUkxxZXNZMHA3?=
 =?utf-8?B?TGFOempYbTQxVUZHUm5GZStDWDgzcWFnY3hTOGE3ZlpOc2hhYUZ4WDNiNHJC?=
 =?utf-8?B?N2hPb24zTTR1c2JHdHoxTExsTkNLOElEblhRV1BXSzlEOHdXYmVSRXc3VTNN?=
 =?utf-8?B?a3l3WHNuTklPZU8vdEhVOWp5N0VFalJXQmN5WTFPWlpacFNIL0w0b2dVa3FF?=
 =?utf-8?B?M0RkVHJSR0NzbzYwYy9NcnA5V3BCTWZLODdQL0ZCYnFOcjl6SnRldUVJZkR0?=
 =?utf-8?B?RDZ2SVRhWE1mc0F4T0FTTHkybUpvYXM3U3d0OUV5TXhOeWxtbzJSdEhTSWVy?=
 =?utf-8?B?cWJFWG9PQnEwbnBHMEdTN3lmVG1uYjJEdSs5NGhjUVJtOHR0S3RucG9hcnJE?=
 =?utf-8?B?bXAyTGtjbmlKeURkZlF3b1dZQUw4VmtBTFF4cHZaOXYvd2NoV2NTZTh2aUN3?=
 =?utf-8?B?NFljOVg0dWl6QU13QlEzWXpadER6VTJHaklRNk5ZakprblFxbEhRQ3ViZ1dq?=
 =?utf-8?B?UjIzT24vU0ZING9EeXZ2ZWlBTWl1dVVDdGtoY3k3S00yTUlwbitWZ1hhRkhp?=
 =?utf-8?B?dVYyRW1NaHZhbVAzQzJXRVhUamhDNnNrOENmN0hVbTRoYUFJTDJYaVpHSVRs?=
 =?utf-8?B?ZWJhRmpad2pBeEtiWTcvZHZkZUlUcFRJbGVPbjgxbSsyZTc4dTZ2bnJsUXUz?=
 =?utf-8?B?S0x3QzBqcFdwWTdFWkovcmUrQWxmZFJrcXhZRFFiaXAyc01teUlwQ3ZCRjFO?=
 =?utf-8?B?eFF4SlJPWUtpYkk3ZzhNQzY3U3Vqcm1JV00yNXdHSGtiNzk2YnYzdU0yRnhE?=
 =?utf-8?B?NWJyNXFRcDA3L2Q1Mm5UKzhKYlZTc2piNUZXTzBPS2E1aEl4Z21iN0RxR2U1?=
 =?utf-8?B?K3Y2b2NsY2NCbkJTNXBMWGpuNmpVUHFqRndXdFlkSEdka216RDlWOHF3TnV1?=
 =?utf-8?B?akJWQitlSXVjYVlua3pHNlBTY3dXOWJENjBnbkRwbjhYOVdMYnRNc2ZZdndU?=
 =?utf-8?B?N2drTlo3dFE1VFBKYkh1MW9mZS91azRrRFBXWXNiUkdzVGVlNEVFeFEyU1R5?=
 =?utf-8?B?cmhLQ2ozakM5dmk5bnNhcUVDSUhxanVJUkZwb2tHd1NEMVNLajJPY3pmSXhO?=
 =?utf-8?B?c29jei9xNWJWdlMxbmxoYjhrM1IyVmUwNGZXVTJVaEdWRHNnTy9iWW9YS0JO?=
 =?utf-8?B?ZDA4SmRPdEliTGhLNDQrdDJuSVNBNXJqQVNEL3BGUnhpaEl4Wk1qQ1dwRm45?=
 =?utf-8?B?bWtldG43b2kyR2F4N1hkN3FDdWRvTERBY3p0cjVTS3dIZmdDc2xIYzBIZ3Mr?=
 =?utf-8?B?MEwzT09xQU9ldFpGc3NSbzVQKzBreTZwZnRxbnZVc0NuRWl6blNKaUxaZnNz?=
 =?utf-8?B?aktXWDFwT0p2a1ErMTcyWkIvK1RRUmNRMUJxZCt1NXpUZmlTOHJDc3h3OUcw?=
 =?utf-8?B?c2J1ZkpVQ0cwSTdFRlhrZHAxZlhENm9wS2pEZXF3aCtOZE1GbktVd3NNeEM3?=
 =?utf-8?B?SlJZa0Z6SlB5WC9VTXlyeEJsK2ZYRmY3SG1YZEF6QUltNlJaOUtYVnZEdVdr?=
 =?utf-8?B?UHRGMUV4WUhwWUJqQ25CMjRZY3JhVTg0Qm5BaUg0eGlZL2dpaFExWld5SlpU?=
 =?utf-8?B?N2JkenowaUE5T2tJcDNpb21VelFEbitjTTNTYm1DVkhaYVR0WW9NSS9xaHov?=
 =?utf-8?B?cFljMXFSLzNoamxCQUxaaXpaZGdKODU0ei9SQWNtQTZ5cXZ3YW1KTzJqNXVD?=
 =?utf-8?Q?UmgVV2ias408EB9leTSyBvHtd?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5041cdc-86ec-4ce6-86eb-08dace12e68d
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 11:56:20.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6HyMWcQy9L4tUq6/B/tlAoFqzL3SeT9KruXnK4j3+GV2f4mj8iixx4Jga7iZyUXjYXyUWsaYCgiW3SAuvTFrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6769
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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

On 2022/11/24 =E4=B8=8B=E5=8D=88 07:43, Mark Brown wrote:
> On Thu, Nov 24, 2022 at 01:56:58PM +0800, David Lin wrote:
>> The audio amplifier NAU8318 is almost functionally identical to NAU8315.
>> Adds compatible string "nuvoton,nau8318" for driver reuse.
> Ah, sorry - the update is here.  Normally binding document changes go
> before the correspond to.

OK. I will follow the order patch 1/2 is binding document and patch 2/2
is new compatible.

I will resend the patches again.

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
