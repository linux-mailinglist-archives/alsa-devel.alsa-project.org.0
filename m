Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 300DA484E97
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 08:10:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37530171D;
	Wed,  5 Jan 2022 08:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37530171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641366629;
	bh=S/T8/UEZP3jeQ7eJCMC/qCQENGTXoW6hG3JPQnXazeA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLaQI5vPIcUU7rd6TUZgetXcEPR6wr0bVUPMYtLWg3GeHLPag1/5laAhxlFgKZbOM
	 MDB0KpLmL7baizZb0HDmWeEEH6JlSZgicxfpziG23dF68lwe28vdF24r/yJI/0xbBc
	 ydUFgUa2J2be3a8Y9QsE3a5kjM2jWIe0ZWdeWeTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FCEDF8020C;
	Wed,  5 Jan 2022 08:09:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F298F800BB; Wed,  5 Jan 2022 08:09:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 209D1F800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 08:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 209D1F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="lm8Vyh16"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eixQGn1AoSSZuWgnm2uf+7c1THc5kpH9XqRCAM2q0wN2DnVJZt9yVhjIZkwCnltIyy4PXqwRQC0yer3kj8z0hc7uFcvByeHl73VThkFIVCodjoLkD3kwS1g8uIRyDeL47qZpcCN2MGq6BGJcxvD9NFzOk9akAUW42jems2S35BlFO6WrZ/bXA3x4Nd3YuUSdgUwuungRG70B4jayGdfG0utV80w99nzW9Yhp7XQb6gPk/eMXlpZIkxVVY7uJjezERopaYwCdkZ0miYm2256CseR0SERUFsPEezZTXg5jFjVgFBlB2MbikcoJXz6CmyQsfYapZgFHkP9GxSDNxi/AEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUf+ADuOWeGERWWcBxGQD7DHQGxfNqtMlGV0ogNtiLc=;
 b=oB1JqRITOUAFXxjrlHTcuCkSpniTsVDtIE6ve1eKPXgBuSfoYu8wn0zrhc53Iv0X6Lc7BkHxd3xZbpu0sof2MwzYE6yQqXiX/tuMCKGS9JC1BH2cMizX1GIbXLHDy8APfgNj6FLAE7QhC+G0gTHQc/MAmmAUHHPAAWtASw65kQzdZuCuFYS5X2xTWRD+Vcndn8xM7dETi/foaLUO54i03W0BMJyU2PabHcUlO+smOu4QEXKzOc3x9uQPOMWzvz0SjTsnKs3kN4/v+UN7stc0Z8etuwDEL6mMwA0BoMw83Dzbw2vHT+rEtql6TAYgAQswbgFYaxYQNJoyFnHE7fVASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUf+ADuOWeGERWWcBxGQD7DHQGxfNqtMlGV0ogNtiLc=;
 b=lm8Vyh16/ach/B8Oozp+fIUsfDBeVxSA+lcpEANYX/jnVnFlwWqD6h2t/NomcqLZj0HOtkBxOnaPLPtxIiI2f9fxW5Ko8O+0ROxFVo5MPurveFlpUbZoogls/DWy+lXV3TxxGrj9wtPZrtidIovfAM0Jw4f3d54pcwSwHqKd6dU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from HK2PR03MB4337.apcprd03.prod.outlook.com (2603:1096:202:23::13)
 by HK0PR03MB3731.apcprd03.prod.outlook.com (2603:1096:203:7b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.4; Wed, 5 Jan
 2022 07:09:02 +0000
Received: from HK2PR03MB4337.apcprd03.prod.outlook.com
 ([fe80::28a5:ecc7:6c9c:1fc6]) by HK2PR03MB4337.apcprd03.prod.outlook.com
 ([fe80::28a5:ecc7:6c9c:1fc6%6]) with mapi id 15.20.4867.007; Wed, 5 Jan 2022
 07:09:02 +0000
Message-ID: <bcb1938a-ae41-7c82-9c4c-51c1b1f1b937@nuvoton.com>
Date: Wed, 5 Jan 2022 15:08:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] ASoC: nau8821: Add DMIC selections.
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211228035101.2973294-1-wtli@nuvoton.com>
 <YcxYZqZ6aVh1zfY3@sirena.org.uk>
 <b38d3788-689a-70ee-c808-4919b2b7a01d@nuvoton.com>
 <YdRZrLKL8p3u3ZoF@sirena.org.uk>
From: SevenLee <wtli@nuvoton.com>
In-Reply-To: <YdRZrLKL8p3u3ZoF@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To HK2PR03MB4337.apcprd03.prod.outlook.com
 (2603:1096:202:23::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cf3ae69-51c3-41b5-1f75-08d9d01a40be
X-MS-TrafficTypeDiagnostic: HK0PR03MB3731:EE_
X-Microsoft-Antispam-PRVS: <HK0PR03MB37318A44F22A1450EFA80E7AC44B9@HK0PR03MB3731.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rV2Hi2Ns152Pqd3mpswAm2qIzWRc928XNgsj9rKxVa2Nnp8FpufS+mfTFPWtxaTFDKGwVxbkNtNeaDqOG4lHYSdNxPZAKkQUZ8Q5AAkQkAsGZYiGQXzo3wnGI9dXl+JIdc+tEGjUSBu9ny8qsqsBq53B/DDpfgtzTq5voJEACEhz9kxikYhqXCUmiGBr2uF5XzqJdyNhQxOEKhtJ9SSqS57+tPpeIh1u0mV+fXOm9R0fd+FfhhDjWrPb01BwI/oZmycSp1r+dmqY3bnCEL+4KRXNWXerJDUeQdAzknfc6QH+ImDKk6YRNG2urQ1kafQ1WLn6BlwG0enCOV2aoVDA00Vz7lxkdIboXqG4uIt2AT/rx378ZqZcquAkL96Y6Vt8s/U7BTfoiXrV2obCiGXh9cOXHWJ+w9rStpt3M7xwWt/NVqwcIcGht5FRfoMR8A6WwvF8ou8k5qUk8UGPTrpNte/fVQAdTAISe0KFIXb7HVnJIMEM1AuvQ9ffRzhVCDL5EkseJ2PyfgIDtyot74FB/0/ZwzMXeFmlhIk32VfJUoNN9n+xqZRCG385YiGO9hyNW5Ps+LzzM/AtTv1LmfGUWWCH+Uh2R+qYlom3PxeSWL7P8RP7ERYuRv7WdZ47iDcKSAw3iVfHrkJwnZNaxP0HkuAhGRMJBdn4E66dEl1IDy2y1zLHjcJP4XJBxOVDy397WCsTu0uAcHr1c/mMuXy2n97M63Qdj8VVu4fqf7UZ/lRqRpuzxVwqaBtr6ID8VEUkOLivOMqNZw1ClSvh7UiJgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4337.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(2616005)(38100700002)(38350700002)(107886003)(83380400001)(5660300002)(66946007)(66476007)(66556008)(86362001)(6506007)(4326008)(6486002)(31686004)(8936002)(8676002)(6916009)(52116002)(316002)(36756003)(508600001)(53546011)(6666004)(31696002)(6512007)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEFsdTNMRmV5VVJpYnlGK21WcXN6MFNOdi9kS0FLVzhxRUFqOUR4QUhnVXBK?=
 =?utf-8?B?Zm9yblIxOWxtTUhnbVpJTTRNMFVHVXA2T2RMVlJzVGNXVkFvL0M5TFRYSlFp?=
 =?utf-8?B?dFMvZ0pQT2huenhmb2d5NEZNVmhaWWJVRDM4RVNTOHdXVHpsT1ZmTTZnR29m?=
 =?utf-8?B?TmQrLzRkKzdrRlFoZjg0UlR1aVkwWFlPMG1xVnkyVzl2UHI1L3VJYVl5cFU0?=
 =?utf-8?B?QnJncGhMY3hoY2NibWtac2ZKaGJZdmpySE5NR0ZObVo0ZXQ4NExOYytuR1Mw?=
 =?utf-8?B?bTEzOTVxdXNwNndGbTQ3bmNXdmFRODhoNDdRWEVsZ1lKK1JmWWNkc1ozS2JS?=
 =?utf-8?B?Mk5KcVZod3h3dExTMm1BQ3ZadVFKVFg2djhNSWlYWFNreVBDRGhjL0JtREdm?=
 =?utf-8?B?VXNRenhURy9zZFl4R2czN1BmaXUwdzd1blVRZzVwd0pkbGRkZlRXUzhKbXFQ?=
 =?utf-8?B?bkgrL2NiU0VReHpjUTlXeTZkSFcrUllvN1I0Lyt3c3g1SjNLbVRYT3hCRTVw?=
 =?utf-8?B?R0kyQUttOTR4ZE94ZDlPOHZ6ZW9FSDh0N3Y3YThrNmxVQ083aWovUnd4czBZ?=
 =?utf-8?B?MVQrY3dLVFZHZ09wN2hNWmRwV1RzY0wwbUl0c1gyMWxiMDlObHZlVndHajFS?=
 =?utf-8?B?QVgvc0JVVDBqVEJZR3JLUGh3SW1HTk5Pb3UxK3hISHVxYUNaWXV6UTJsdEc5?=
 =?utf-8?B?NzBqaUxDOTAybm51bVJXQUloa0xLZjROVEFZMEtpODkvSXJIZFFHUVZlRXBS?=
 =?utf-8?B?SEt4Uk54QTlPYWZ5OWphQkNkeW9kNW9mOHVRbkRDcHdQdHNyajFqRllyRjBw?=
 =?utf-8?B?ZUYyMXVhMTFKM2xlQ3V4MjdXSmkrbVBpenR3NUNtMWpoVXN6QndNT3JMN1Rr?=
 =?utf-8?B?OU5zZ1VjejRpM1dmVXlzODRiQXJWbUFabFdScUliYi9SZEdYYjQxcWxmcUJS?=
 =?utf-8?B?cjJlNG5WWnZSVUpyRmErd0dwMUlhWEcyNTdpWEtKRVp1aW9mbHhsQ3YrVTNh?=
 =?utf-8?B?YjlGUjdXT2ZUb1VHYXVrWGNzUjIvSVd0QWI4T3h6U3A4RFgrbSt3TEhIL2dy?=
 =?utf-8?B?bmgxdmJIbzk1S1orNjVmTElDNi9jcGc5b1J5TEtpNzk1UXVhUEFTTURMaHF2?=
 =?utf-8?B?bWZGeDhxYmxHclBqblJPbFZxclhLTzUwT0ZVUE9hR0tSSk9Uc2s2YW1BV3pO?=
 =?utf-8?B?cmxUQXpJYlNSbUVjMCtaRGM1SHF3eHI3YnYwVkc5Vlo3SERCNjEwT3pZekxK?=
 =?utf-8?B?VXVtb3p6RURxTnMwTlBMMTBSK1ZCRG9IckhRMzRma2dGNUlVRkpsU0tFWDlF?=
 =?utf-8?B?MGVmeWJ3K05uY0twZ1hUOUJ3UmJHbENiV3A0RVhDSktVV0hVSktLRjEwWVpj?=
 =?utf-8?B?MDZ0elJoTkFLZTEzc0QwdnVsc0hvZXJlaE1rRVQ5bHpvdFl1Y0dORWxUNTZw?=
 =?utf-8?B?d011K1BXRzA3UFNIVlFLL3lxWDdiZ0pJKzNLeUlLTlJYRnlFWjRpV2pSZlFa?=
 =?utf-8?B?NUVhU2syazJsdUx5QyszZ09kcTA5dWFlNkRxMnBIOXJibmpqY1ZVMVJHNlFU?=
 =?utf-8?B?azVvUi9RWWdoQnBGdEtjQnBmNWF2RFpMQXZLOW1MTkk2ZG95QUtlK05XZmdO?=
 =?utf-8?B?VzFnWWNYNXF0QnZiaFpVaGVKR0xTWEN1MlhDMEFCM284V28veUdhYTZzSmdj?=
 =?utf-8?B?eEdTUDdpYy91ZnMyMC9ERVpoeVFhU3J1Nkt0Z0FlOUVEMXhkK01lajFiL0Fi?=
 =?utf-8?B?aXpTVkxvbGJpa3BSbngra29Wa0s3WGJxbHNKTHlpd1pBRlE5ZG03WXFkUWF1?=
 =?utf-8?B?WC9tMWtLL1ZJZ3NZeUlHVHZIWVpTaVcya21mOWVKQ2R5cTdDdnl1bDIrbUh6?=
 =?utf-8?B?ZE9NekRXS2JyVVFwck51eno5TEJNSEVKanVRa0pMTGRndEJMN283NVpPR2lZ?=
 =?utf-8?B?b2FhU2RzTEw0bStLMEJMY3QrZmpIRFBsSk9DY20rMXZ0SGo1VmJxdVFaYUNy?=
 =?utf-8?B?RTdacmlZYXdyU0M4MktCdFVzbDIrZVo2RVRnQm40T0I2YzRpMzlpM3FPMGpp?=
 =?utf-8?B?S05ZTyt5ZEIyTE8rOWhUclJDOXF5WWpnbzF3Y1JiSVU1YmR3cDc0RGx3YmQ3?=
 =?utf-8?B?YkRPL3Bvdk5IY2V1dWQ0VlY4ckJWQ0t2aTErZDdKSzlNWERaVlhGQlZ6MEdM?=
 =?utf-8?Q?qu2HBCkPlUupO55cSDR0kHM=3D?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf3ae69-51c3-41b5-1f75-08d9d01a40be
X-MS-Exchange-CrossTenant-AuthSource: HK2PR03MB4337.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 07:09:02.5752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oj5+qvaseE3lbL7mvJ+qfQJmgNCeB1fpCj/1goKlG1cMtmumYxDItYtVr0Yt9cUKqtzji8y49XG+qPJ8JMZ/RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3731
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, dardar923@gmail.com, supercraig0719@gmail.com
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


On 1/4/2022 10:29 PM, Mark Brown wrote:
> On Tue, Jan 04, 2022 at 11:05:59AM +0800, SevenLee wrote:
>>   On 2021/12/29 08:45 PM, Mark Brown wrote:
>>> The clock speed seems sensible enough to control from userspace since
>>> it's going to be a power/performance tradeoff but why also expose the
>>> slew rate to userspace - that seems more like something that would come
>>> from the board design?
>> Because customers need to adjust different DMIC materials by themselves.
>> Adjust which slope is the most suitable according to the conditions of
>> use, and
>> improve electromagnetic interference by setting the slew rate so that
>> customers
>> can try the best solution.
> Sure, but do they need to do this at runtime?  That sounds like tuning
> that you do once during system design and never touch again so better
> done as a DT property.

They are not to do at run-time. You are right, I will send the new patch
for clock
selection again, and then send the second patch with the slew rate for
the DT
property.

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
