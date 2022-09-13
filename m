Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE935B6C7A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 13:43:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC991703;
	Tue, 13 Sep 2022 13:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC991703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663069416;
	bh=/mm4E23WeeebAgycXBGsy9G0wpxRhrb7zTJVuVzycDQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GOG1fBOnDYqBtDRdGu73jiUQgJhhAslhilfFLUIp3CY8CeF/z6P23u8sPN4phNQrZ
	 +IWEtoaQjvMCUMfDVIJH5FXeIX8UarI6USqzD7ziiaysXLJ6w90GtleEw3RilSuIEb
	 w0doFWasWd/YvVTwxkoGy7IGY6JGtARX4wze0kHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11BBEF8025D;
	Tue, 13 Sep 2022 13:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E50C3F80224; Tue, 13 Sep 2022 13:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FORGED_SPF_HELO, NICE_REPLY_A, PRX_BODY_78, SPF_HELO_PASS,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2080.outbound.protection.outlook.com [40.107.117.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A121F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 13:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A121F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.com header.i=@nuvoton.com
 header.b="PZn1cV7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcSAVpu7wOlZDiyQi4PXGjd9O1U7Z6DWp9qxNBRL593UBtZ49HvH4Fu7G6gLcbdwCUe66ZKcBXzniGh6e7TZ7Z5ErOrQowyHKuKdOYjTlUogBzl56ird+KIGlSt7FflybeIJsJ1oXf9OcYLUlha1NuB3GF0XTpObpru3gM/oAcllu7TJGlC7U+5rKVKZ/md0m4SY9uM3dRUPgXvnPTHSj1ZJb9019RyOLQ6knSNthhaORjPWNzew2c4HUh1NsPKtgzahIFMfn6EaHIbkMEqPivbz9mMexLom7mQwqnN+blvri1rgGnaHzsS6NVwmcGjCXxNBwqn2D3vGueVVq2d2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+wcH+R44CVazfqxmwYC3Lh0fXwQzI9hRgUAeThcJuE=;
 b=QycCKP/GGxKkRGs790HISxlDZNOWAj1Z6VoyoIw7XweX4XbdnUJwh58Lv88dKVDYg+aJCDbNI5L9u97npTNdkGr5OD2WSn+yEJ4bJ5bFl1KDL1h6xIlEUHjUIwE0GO6EXy9/3sgnvkjllmOMzvN0impY0K1nnGeCeiBOm5/n86v6ts0ibo1Sp6ATE0UivFXw8f6cGj4UOXq3JGFfJe7yFWRxn3tY/f/6P8EhoaF34pCRt7eyciEkYUN0j6wYG0h07KdLt8mOUHIG4JvHWseJdrtGMi2fH7tgZ0sEzFkTBoJqpwFsnkfsP1QPSTVhcIncpJSSWBYvrVjtn3PYzqOUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+wcH+R44CVazfqxmwYC3Lh0fXwQzI9hRgUAeThcJuE=;
 b=PZn1cV7sEYpaIDudI3BtfaGu102F1rAoM/1ydalQQqb9hz95IyXN31lczdLRYs97FjgBJc4WoYTeE/a0o9GRebahvtHdvOfHB12qoaqUhw41rO2fw3ZPVGnFKZlUOlqQX/O6TA7x7DE1dAvGd3/mThyzvMZsbFCGh3byL6TXM4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from TY0PR03MB6982.apcprd03.prod.outlook.com (2603:1096:400:276::10)
 by SEYPR03MB6625.apcprd03.prod.outlook.com (2603:1096:101:84::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.12; Tue, 13 Sep
 2022 11:42:23 +0000
Received: from TY0PR03MB6982.apcprd03.prod.outlook.com
 ([fe80::e553:966f:5c1b:a79c]) by TY0PR03MB6982.apcprd03.prod.outlook.com
 ([fe80::e553:966f:5c1b:a79c%6]) with mapi id 15.20.5632.012; Tue, 13 Sep 2022
 11:42:23 +0000
Message-ID: <8a9086df-7dea-da96-f87c-4f47473fc34c@nuvoton.com>
Date: Tue, 13 Sep 2022 19:42:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: nau8825: Add ADCOUT IO drive
 strength control
To: Mark Brown <broonie@kernel.org>
References: <20220912115427.710417-1-CTLIN0@nuvoton.com>
 <20220912115427.710417-2-CTLIN0@nuvoton.com> <Yx8gm2iIsr04r5Fm@sirena.org.uk>
 <764fb482-743d-ade9-ea8d-8a05be297cf3@nuvoton.com>
 <YyBih2PfrNbHpRag@sirena.org.uk>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <YyBih2PfrNbHpRag@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To TY0PR03MB6982.apcprd03.prod.outlook.com
 (2603:1096:400:276::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB6982:EE_|SEYPR03MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4a9110-e1b8-427e-a177-08da957d0630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuHaMRNw44+QHOXNX9Swmc+UxMQ/Sdi09m11kCKJvBNdVHShbInaAMDbjKNWM/fsQfujmTUjC5koGL14jem5mvuKCpBsYbxlN0zSy49LzyPsxWOne1SFVHfbz1lhHA8gmrLqzcPbyM19iF0UeiWLcDc1pLbrnoriPPCDAHN7oyUNQqyPK4F6nK9GHQOcW2SG6s1+ZzslEzfTYSAt50iFH0jdSip2acKXH+yUbRW93lN+IzLA0qknRv6RxYfIO2Pp8Q5zozXuk892E14FfqJE/eruPKxKfTQrNmmo/r+ohzH0SdWbvZh9kpapaKXtbUhBAVpu22Ij9xlGXC9RZiRTJZeBT+wl45Opc9lX8387Ezo0MltNqwiDBlNdCrZt6zwm5LfwcUcxKpngtlJWjJ/5x8xIgEQOmo4mHFTrClki0W30m5AoBwreW4e2qrUSAcGwfUfWZ178cA6Kj/iQfGM4Z9jD/Z3kxuI1ecQT+ZQlUKoj/pyqatkNIO5ApHtCqyLkTMP0b1scgbDOzkNMpfsBtkZ2x/lpACh7PCLajHDdA7QyfGowoz04lXWiY7HWw8xQVpP8YTtl2JICLvXoGu5oOHG7xbyqvtFrDx65PE9z4C56Ni988saYSSS+dOEYBZ28iB7/GsyBJNPczu//ZqwIBxRvzraNsCE2xBwlS5zgcgBha2wSE3JBGGUuBDICpQC6gzYAO50TaT5z5eotY2jr5TqcSTTUhD7Gw1xm2D6H4xoRwSmdkIT10OsAXyBLAdmJcUD5Nu8/pGqos30SSqpQOFtOSzjLGvbywlReGV03u7UFvz4N05x6iwKTq5tQWdEMn8Ao3Z9pfLsRUAQcm2Fy5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6982.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(31686004)(2906002)(66946007)(4326008)(8676002)(66556008)(66476007)(8936002)(5660300002)(316002)(6916009)(6666004)(38100700002)(31696002)(86362001)(38350700002)(186003)(26005)(36756003)(2616005)(6512007)(41300700001)(52116002)(478600001)(6506007)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVN0c0p0elFBTFN3aEJtTDBibGtyTnZLLzIyaW9uakZVbGtpclYvdGQycGFM?=
 =?utf-8?B?b2pISWl4ajlHMmpOQ0VKOVdOd2NGL05TL1lXL1RWU1haU29sN2xIUSs5eDk1?=
 =?utf-8?B?M0hmYnR6OHkzVmh2SkJRa3lYaUFVTnZJdnByTXBpVUhiSUxjR1l4NXBOZjVE?=
 =?utf-8?B?Y290V0JkejVjbjRKQi9ibWI3TTJpTitkRnhzTUpEME9xbWZxL0swT1hHeTU3?=
 =?utf-8?B?dEt1VUdTeCtiRjI2dDIwRjdxVEtWbjFORHVQd01OYjdtZUU5eDdZaUwveVho?=
 =?utf-8?B?VXhKejNPSGk4RmUvV0dJTzRJRTI5bitrQ2RONFBOYzBuUWl1b2VPZ3A3RlpV?=
 =?utf-8?B?eWd4UmhvNXBaelVPZ29VNVlOWCtiM0doZEtSZE55Sm5HajRiQVQ2OE80Q1dk?=
 =?utf-8?B?dHdRQ0JobVN2YjhSZGliaEJHWExZaWc3K2IzM25uL1ArVTZlZ0hiQi9OWHRD?=
 =?utf-8?B?SlF1VFJmNFk0R1NMQTVuQjBVb25oQzhTYmE5SGd6T0kzTmJhZGprNzM2NTM5?=
 =?utf-8?B?WWQvZjkrZWRJMEdDV2JXRVM0TlNTK3FZeWRnWGl3NzBRamdmUDJacDB6ZEpZ?=
 =?utf-8?B?ZlJQQnYyS0pZNXhtTlNneUhycE9JajNVZE5pVzZYR1NkMXd1Q0IvWFYwOWdr?=
 =?utf-8?B?SUZuRkRielVvU0pOSWFSakp6S2dEc1hhQ1NUTDdTeHhKeFcwREdZVDhZVXFt?=
 =?utf-8?B?N1pHWlRSYmpjWlVZdkRUTk1xQXBzU0kyckt4N2R0cEJYNXFheTNiNWVEVmd3?=
 =?utf-8?B?dHZIZzhPeWpaTSt3M1dIY2FwdC9UamkxWWI3Tmc0bEtvWFp2eUVnQUtDVzFV?=
 =?utf-8?B?ZTkvUTNYempEZnE1MHdoRGpGNzZadkVQQm8wYTN0Z284b0hDZXY2VWoxZDVk?=
 =?utf-8?B?bTNZd0JEbVhHQjFsQlpQWE4waUdEbTZnbzVzWVRTVEZZVVFmNmlUUmxKY0xT?=
 =?utf-8?B?RSt5OUNMUWZDcEJNbzRVZWZOTDRsZU9VaTEvT3RrK3lJTEgzK1d5K1prVW5r?=
 =?utf-8?B?V3d0dWNLMk53ZjV0aHZOcWh4dE1iRkJmZm4yY0hwVWh5eVpuVElaWE9Fcm9M?=
 =?utf-8?B?TEJEaUtDTW9EZHRmNHM5bUdYYmlxTlo0YVJqU3RtWTBLNmt6V2tub2lmOUF1?=
 =?utf-8?B?bjF6QnFuR0s5MzlObGl0eEF1ZUU3eHJZV2hWSXN0NUxmTUNrMzNSZzlpZ25p?=
 =?utf-8?B?c3ZvVVhMZmQ5NnBwYVd6NXcxeUtXTFY5RElSTzJVMGtjbjgxS0NvT2Y4dFBP?=
 =?utf-8?B?emZhdG16bk5ZbzFRM0I0U0doSlhITmRHWnQ2bmx5R1d6dFpEbFV2ZElHWEVx?=
 =?utf-8?B?aTdnNTZEQ21iQW5OTmM4d2ZhNHZuRytaQnh2bHovaitnaTR2NXErVEVjU0tO?=
 =?utf-8?B?SnNrUVdiY2xyR3lRZWZ4ZGxPd2NzZ1p2cHZ2b3Y4L0ZRVEF6c3RHN0tyTHNT?=
 =?utf-8?B?dkJNQlU0ekFaa0VTckhJcXg5aGdPL2d4U3FxT1d1ckZTQ1FURkxZMW5ONFli?=
 =?utf-8?B?ZVFWUTI1WExnNHR6NVZJdWQwTzY1akQzNkoyVzBGZWRyWEw1NmQ0ekJlaWZM?=
 =?utf-8?B?Q3RrZU5zbTlsUHZnbGtNRjhCVko5M2RTQTRFU2VBVGJ1MUE2L0pDU0ptNEZT?=
 =?utf-8?B?eUNjZ2tYS0p6UG1hRml4TkFTbE9NcW5EZDJLMWVnTzFDVXlLZyt1RDBSQnhl?=
 =?utf-8?B?YVZTT2hPZ1U2N1NGZ0dPdWFKL3U1S2VoemwybERUKytlRmxUeHpHalNJUWVo?=
 =?utf-8?B?aU5jbWJzelJTZFdVTzlkc01kMTB6MGFyOWZmYkRrVTJ0aDZQVzhjZ2JaT2RI?=
 =?utf-8?B?QXJFSmtQUVo0bkFJUGNCV202aUp1MDhoSFVBVVRqUThRRHVtRjdadnZQQUZR?=
 =?utf-8?B?OFBhbURzems2TDAvaHNUT09aWGtrQWxTUEFLQnhrbndkYlV5dCtrUEZueVJL?=
 =?utf-8?B?QWptRzdGWXUyblk3aloyeG5nOTVJL0lFd29pWU9Tc0l5VVhabjFwak94RmIv?=
 =?utf-8?B?NzFGdTVuMG5yOGpOenA4bkRISVoySjE1MSsyNzRmTWR4SW5DVDVDUjdWY21p?=
 =?utf-8?B?RDdBY3NKZjUrUlVONEhQYUh5dEI2OWFaSE16clhxSXRLZ2F2Mm9sWDU2d2lU?=
 =?utf-8?Q?HmhlXdqkbqC12vp1NybObNTfa?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6625
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

On 2022/9/13 =E4=B8=8B=E5=8D=88 06:59, Mark Brown wrote:
> On Tue, Sep 13, 2022 at 03:25:39PM +0800, AS50 CTLin0 wrote:
>
>> OK, maybe I should change property name to "adcout-drive-strong" and the
>> description to "make the drive strength of ADCOUT IO PIN strong if set.
>> Otherwise, the drive keeps normal strength.".
> That sounds good.
>
>>> Perhaps adding something like "strong" would be good - with the
>>> name I'd expected the property to be a numerical strength rather
>>> than a boolean.
>>  From our design, the register just have one bit for this feature, so
>> the strength just have normal or stronger. Therefore, I use boolean
>> property for it.
> Using a boolean property is fine, it just feels weird that it
> doesn't say specifically what "stronger" means here.  I was just
> thinking adding a note in the description but either way it's not
> essential.

Thanks for your review. It will make the patch more clearly.

I will refine it and send new patches for review.

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
