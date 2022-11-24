Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0D637897
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 13:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23F91701;
	Thu, 24 Nov 2022 13:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23F91701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669291713;
	bh=HIaL84M5ErzwbzTZdwogLQKYc1w+38AYJSM/yYfwVMY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYy7+imJ2roI8K0rRBqqMdmaZs892boy2CwsTKU879DRWG67GHXCh7G/x5+HLJXDZ
	 wMwL2kK53QH0HrmMs3lmOKpK7osPTbm2ksx/zt806vrYqhJgqDzjvqNXrsVw+CyZ0U
	 cUM3me/Vg4mFPYy2e2NQZ0uSgS0M9I1K/Etu5shY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79869F80245;
	Thu, 24 Nov 2022 13:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CD30F80431; Thu, 24 Nov 2022 13:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21E9EF80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 13:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E9EF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.com header.i=@nuvoton.com
 header.b="QX1s2yfF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lz8js/f3l5HFuN62h0LHB2ODlETmR96mtS+r0klD2bDlXoIOzuRjgMBJeYVrL0JMmK/AkASc1MybXctE6mFwBfG47ZwRAoGiOtqRXGZuEx7d2RetYHyf5IG4iYOERkv4ziQ0aQYiQAW8otOr7of4pXub9QCVLEdjyGtbqrVGZYk7ntuzp6Djyo+YYXFMOPIlkZR/NRaNzuIlH6/f1vO++l37lg+HkcWpU39FCcFscU8pMgvybjSClyVMCnacKSxF+MlVQLM7EYJZdV9X4z7iU9M3kuzZmgJZdWYAtAVpfRl6dg1XV32doNx+s+uZbk5aAFWReaUlDwRTTd1zOj31fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIaL84M5ErzwbzTZdwogLQKYc1w+38AYJSM/yYfwVMY=;
 b=AnC/t9qhO8PnuILwGrJzaKtHTjPzT82HSyk+otFUujHrHmxaw8QnTUnzZbO1t5Wbtjp8BRbYbVy08GA0CKXE+ovayo5O36vTuaJleP9EoEq4NfRCC3I9YYsAcaZ0BdgPNrgzS+vK5d7yJwlfIL8MxWaEPeLkhRRatE99GOuft/yzTk5v3TP9LzmDHvZ0A91uwxnKgEvh9QpS5lLSKDd7qE4amdvc/yMn5+tsYMbrjPXkfYmbT1KpsLzQ+ER99MWJYpK/m3ZX3KA7c0vAoLfoLb7lOUHuwMGqvuuSJk6Twr1/eXHAibCgD0+PH+T687sArodNoEVPSI4SP4P0G60uBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIaL84M5ErzwbzTZdwogLQKYc1w+38AYJSM/yYfwVMY=;
 b=QX1s2yfFPaHCPJplXfxI/ouBnxCI55lGpqyiCwN6xhGfh8OxwFskDQFoGgT3nzx6FpCd5rE3PbIh8xq+INepcP/0iijYu4R2g2RxMaUT+KcWvrSpt9MSiEpNeZiurt148KKDuwjv+zHmLuczmJj8IQ4AhXmbnNVxLozasWK7m2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by SI2PR03MB6520.apcprd03.prod.outlook.com (2603:1096:4:1bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Thu, 24 Nov
 2022 12:07:22 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::7680:1f11:61e0:3b75]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::7680:1f11:61e0:3b75%6]) with mapi id 15.20.5857.017; Thu, 24 Nov 2022
 12:07:22 +0000
Message-ID: <662aae01-e039-9e28-e366-57bb886803de@nuvoton.com>
Date: Thu, 24 Nov 2022 20:07:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add compatible string for NAU8318
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221124055658.53828-1-CTLIN0@nuvoton.com>
 <20221124055658.53828-2-CTLIN0@nuvoton.com> <Y39Y7yqhgtGa1Rt2@sirena.org.uk>
 <63b619b3-e784-ba9e-d745-cd614a398017@nuvoton.com>
 <Y39ctE9nErS1WUXQ@sirena.org.uk>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <Y39ctE9nErS1WUXQ@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYAPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:404:28::31) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|SI2PR03MB6520:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e40879-9625-4e2c-0336-08dace14717d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRGG6ucNcKJgZjl3ji0vrs6bZcRKXOO4pzyKU5lNRfPihv2S5lB/tiSvjBune3zvJBedHwWq5pNbKxTBYSHVBG7LicuMiPl62grQ/kYu8h7PiMLaG6Jg/GaImXkRm95j5FPWnGWzqq14pMBdygPfCNhufq/h1V9ZH1uJ9KFcw7EKf+Nv6f6rcvY9WNe6NImFEsZX7IxKtSVOkxr0Z2mFiQossjfMltHqb4/2k0OVW6XB2VlFofBF5jSxUyF/S2Pjrkw2GsA5htzia9yZvB/yCbrc4InLJmwqQm0SIY0NKqSG0snlYrlJCAkXVloCN7aQuNS9QuQ/+MElT5TByj0eKlw6J8XrajGijAjtIZpD694jVcNqy4rPaNCZSfFnAauECK8MFanwlGEDeN8I18UjWPqDKjIV0ruSF9iL9v7KLN7JSqf9BCG/mCqjcUblWIMTFuMBKceuyp5tCZ6uMYdipZ54ocMdhSLbRBrLUkFhOQwfkReCLpE3hrIbHJlZm++Ve7/zljIi536A9lV5UvQmsLVazoOMnMVaTmF8HrhESfgMg7R0T/s65OXO/nKmImCrglN3d6zXQMliqg3hnfEcKOYBwNNl9Z90QXTvmSwt3cb3Gg2DOTjP9Da1UmDosNX+ymcjsZegNnMHBW7lkqxsxruTh/DcxqkXXs4dadP6CFtFXtGzPpFMdm0zoVlH4V/B/EuYF9hv7Z+x9w+DnS7tzWPUfYQ5LAllxvQhZ3wwCBIbJW+fhqLqgrzemCMt00xPu/YqBB7pNS6e7qGE+a6nHStfS4glVFKAsZxLsahjIKsRbjqd/ZELst0ta6LK5ldp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6732.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199015)(4326008)(26005)(52116002)(6512007)(6506007)(31686004)(6666004)(41300700001)(86362001)(478600001)(6916009)(316002)(66946007)(2906002)(8936002)(31696002)(6486002)(66476007)(8676002)(66556008)(83380400001)(186003)(2616005)(36756003)(5660300002)(38100700002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1FrYWpncENZbTlzem1FbkR3WXdzR1RJZnFwS2VUbU5nbHRIVmtYOHQyUGlu?=
 =?utf-8?B?ZHZYaXQ2NGhqUFNPRkNCU0tGRFYwdGNENytYUDFqZXdLTjNBY3N0MDB3QUJB?=
 =?utf-8?B?aW1BUTYzNmdjYjQ3Qis2d2FoZVh3dnJ0RTJUNGtKOTNSY3cxbTgxRi8rRnpn?=
 =?utf-8?B?WnlMV1JmejdsTjdIL3J5cE5nWmk5elhvUmV5NWV6Y3hzdWJXSGVEcjl1U0xj?=
 =?utf-8?B?MW9zTHFiY2FONUV3dDgwK1g0MUJjOGliWEdpMHlCM1FXNUkrVThQVU5qUkc5?=
 =?utf-8?B?WmxMcWl3SndUa0tuMEtSeXJlSi9yaEJlY2RpVnNFaG5lMVZTNE9zdGZkU2Z1?=
 =?utf-8?B?Q3BTRXp0b3Fnd0x4cnpFNmQ2dm0wN3Q2NXlSZENPeFZDUVUyWURGYVBpVjJo?=
 =?utf-8?B?OHFCLzBobnFJeUVSRVh3V2w5dEwvbFR5WmRlUW5BVDkyMmN3NXZpWHN1VzBi?=
 =?utf-8?B?bjRRMVdBYm1aQmgwNEpYNlkzWnFIVWVYN283SzVGTE5wbWNodGc5R0RGOENK?=
 =?utf-8?B?V2F1b2ZBR0NtQkJaODQ0ZS9lUytRN0pybU1QM1E4aXNVVFNidUZoUms2QU0y?=
 =?utf-8?B?MEVDODB3UFdZc1c5SC9wZ3A3SlkrTWFBR2RHLzhyQm1Ba0RSTUNIeVA0WEVG?=
 =?utf-8?B?L0VwQUxTNEFFREdLeVBiVEh1R2xnRmVYWEtmdzlaamZCam1sbm9vMGRJMHhz?=
 =?utf-8?B?d1FuYk5YVzJFbS9KTUJxdEhldzJhaWJwUnUwT2U4RWdRb2N5d1VUazBFS3lK?=
 =?utf-8?B?eUFYMnY1dmJ6dWhsRy9iY0lRdTRmMnRxSDNXS2YxS1hSVGxITVVwQkp2UFU4?=
 =?utf-8?B?c1ByelNYUnNMMmJWcUhnekZoN3ZieWlaSG1IdVNwQ0d6empXOC9BdEJDNW8w?=
 =?utf-8?B?ZWUxNGpzd05TbzhvSjdmQ05BR0p4bFFETlpBa1duTXFYblJyYXJCaStTek5i?=
 =?utf-8?B?Q3pSTUhETmJJKzBtaWFkbDBaRUJ3Ynl6aGdJZlo3cStOM1g2U1pjWTUvc0F4?=
 =?utf-8?B?L3RqT3NMZFFLQnRhN0JURFhMMDhRdmIzNnk4dkZ6QkFpRkpnR2pPeDAyZXpU?=
 =?utf-8?B?MUlqNEZ4VzBqRkdjQ3F4T1VvVmNEL0hMQ2hGbmZmWEdZM3FoajZ3Zmw4bnN3?=
 =?utf-8?B?Ry9RRi9lNXdTbHY1WWk5RDJJUmdCR29za25qVUMrNEtRYXpPek1ZRHBna0NT?=
 =?utf-8?B?amt5YnV3UU85YiszVGZVbjJMZElCcDIybDdKVE1MYzdETDd6WC9JS3ZuNUIy?=
 =?utf-8?B?SFJXS21VWHZPL0FBR0RtWGNjWU5UcmtvVmpReTVsYW56Sk5JVEgvdnRXemRP?=
 =?utf-8?B?ZEpiR1R1K2hmaWtsVDNCaUhLN000MkhDL21RQXc5cUxZSmJYa1BOOW9oeGk1?=
 =?utf-8?B?ZlZhRVR0d0MzbzlYVVlPd1R4KzQ2eU9uSDlxSGdXcFozRFJBOVRwbkRoNjdC?=
 =?utf-8?B?bVVoMitWN1ZzQU1KTVI1dkhYN3dSSXRUNFVzWnJvaWdwSFJHay9wTC96NEM4?=
 =?utf-8?B?NlAvZitSL3lTSlNtV1N3aUp0ODczOVBGNnBhMjV1T2RQazdRWnUyN0NlOUlM?=
 =?utf-8?B?dVJucUF4cFU2ZkJkdnFsUW5ESVJ1QzNVdmdDSzVoNHo2T1IwTVZGS2tkaDNk?=
 =?utf-8?B?NDltU0NHZUZWWGE4cERBbFNaZHltdG82RFAvTk1kVkt4aGljak0yTndRRmw4?=
 =?utf-8?B?NTRwY3YwdGpPWW5GWCt0Q1QzdGZ4NytpbnkwYjAxdzRiT2pIaEEzYTNmVW1a?=
 =?utf-8?B?TVBEd2VrUG1KU1RWL3ZjVzBqQmhwTkhjQWJJRWZqMTZZLzYyckVESHBoVlhx?=
 =?utf-8?B?am5aUzBxaWh1UVVHZERFV3M5WUYrNVNiQkszRFRqaG1WdXgzOUIxUXZzbkhr?=
 =?utf-8?B?ZnRhVVhGL3RZMHVrVGpXOWJiY0x6bDMxb1VnLzN0bnpCM29panlNTU5nOHNx?=
 =?utf-8?B?dFIwSTNsTTVic3dnUlQ3S0JrZnc1cWVDclA0RGx3bDZIaUZYM0JRdkhvaThW?=
 =?utf-8?B?dVY3YmhUYUYvVUhZdG40QTRieUlBbXArSlAzTzM3bmFlVUFWbGxFdWgxaTVH?=
 =?utf-8?B?akdGZWlxY2dmekM2eFJuTXRrbzh0UzdwSGRhbFphQTR5bGo2QkZWaEZDZEpl?=
 =?utf-8?Q?bgGdcgOGE2Oa9a5CCGwl8NxE9?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e40879-9625-4e2c-0336-08dace14717d
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 12:07:22.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfLHjk1YBvU5h/IBBGZ6yNTGB11EfTT6fMaPI/dSW1FjkHJQs8a8wd2oH7VaQxwiGq9xMZmrOGdDweaHDLY11g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6520
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

On 2022/11/24 =E4=B8=8B=E5=8D=88 07:59, Mark Brown wrote:
> On Thu, Nov 24, 2022 at 07:56:03PM +0800, AS50 CTLin0 wrote:
>
>> OK. I will follow the order patch 1/2 is binding document and patch 2/2
>> is new compatible.
>> I will resend the patches again.
> No need, it's fine - just try to remember for future changes.

Sorry. I had resend due to I am online for the working.

I will keep in mind about your guide.

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
