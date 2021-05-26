Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 458993943F0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA7116CF;
	Fri, 28 May 2021 16:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA7116CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622211371;
	bh=e5x2tBqowK1kTOTrRQpK1bIDtoxRWd+6LYx/yC0zH5M=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QaUE9hpqEypGwir8Gb8aFGDTAiuhyezOpAgP9NTa1G8K0JDXZTfKKvxjNzzYPypMy
	 u774S8o6C2mmuSOr6kbMW0A0M+aCfxrdln0FtNDGMhFvvqdCPuJZIYki64AxIn7Iga
	 n9T8v2PsWyJxluBYGVSCfP9C6NuUHhQ3tDNTFrlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A1B0F804B1;
	Fri, 28 May 2021 16:14:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A99C6F80264; Wed, 26 May 2021 23:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30094.outbound.protection.outlook.com [40.107.3.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73764F80212
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 23:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73764F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=unibo.it header.i=@unibo.it
 header.b="ehwM+1jV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoJTBIH1PlJpz2j9zsPgP24uAoO6XvscTJzmpR1IyxvVTI9WynxhvSUHpA5z8h6ANrgf/1FHhXmPR9in1XzcAhk6PZXUSYPfhQxQ4XyhK9TNjOxHRwOh2poGPV5Sryn8VJDGM1Y6KWWWooHOJ8VDFxgPNbXREeNO/J6Gg2efztXRKtMu0eMH5nL+NzqP85GJCFhgOOFCPAKS6Pqchuzgw2Ng0HX8JDlpT3n+7EYCipztSr0X1MHZ6lZTmOAqfF7WE+9POhGoaUOM1KnuNmBnblishKyUVlhp0gYaPwRxdYdHlC7YxbrgCojRyx+L2vjtkR9ATnIA6GXJRIiglSTGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XykVyTFzeC9WcJ5cQ1fL4Xe8VJQYhZkBRiIHB+rENHs=;
 b=bTwTQSiuVZgliGbpK6aZ0ihh4grg6/5itkUt8TZh8yFx+I5Ar/KHcSL4EYoHlk9FhgLlCzRgf2a+QqvxkJRk2cCMya2bB/8jyM/rozIbey6y+nYBWFHSFVqCLKKvXpY2kyLRO5U84IT52IFLNVgRQ6pAtrKiO+hinkJwdq0X7PZnHjITmmCerxPMem/WDaaa3z6VGIGMrD91AhxxDiyrF1Nd7mGDvh/xaJYVbRv9bH5fLhHPCL5TLpxAVnvbqyuhKLRzZrCc2xTbOG+C/OA9F8H6HlnZXpgvkUqdWohzKa/GSsSl3n/g7aSa1pN+3havvp01d5koDaazufb8BvOuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unibo.it; dmarc=pass action=none header.from=unibo.it;
 dkim=pass header.d=unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unibo.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XykVyTFzeC9WcJ5cQ1fL4Xe8VJQYhZkBRiIHB+rENHs=;
 b=ehwM+1jV14R9xgCw0iGBFL0Z3Ym3PqoRx8onV6b6wXidPvP/LMLXFaxgavwheIDknrSmHsgaWzKC8rHFOoQoh9f12von7zHrqPthm8JKKIT13wRw2QLb17gwyYUlJc4gENPzJr7EhL3KAKl8z+oJw9HDLL/mHfSVF2Umq4olZHc=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none header.from=unibo.it;
Received: from VI1PR0101MB2286.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:23::21) by VE1PR01MB5661.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 21:17:04 +0000
Received: from VI1PR0101MB2286.eurprd01.prod.exchangelabs.com
 ([fe80::c408:8670:b5d4:c38d]) by
 VI1PR0101MB2286.eurprd01.prod.exchangelabs.com
 ([fe80::c408:8670:b5d4:c38d%8]) with mapi id 15.20.4150.029; Wed, 26 May 2021
 21:17:04 +0000
To: alsa-devel@alsa-project.org
From: Sergio Callegari <sergio.callegari@unibo.it>
Subject: Working to make ALSA work on a gemini lake tablet
Message-ID: <0e650023-226a-b4bc-eb7a-1fdca4799302@unibo.it>
Date: Wed, 26 May 2021 23:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [176.206.43.96]
X-ClientProxiedBy: ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::20) To VI1PR0101MB2286.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:23::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.116] (176.206.43.96) by
 ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 21:17:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26e1ddb5-08fe-41f8-e068-08d9208b9bc8
X-MS-TrafficTypeDiagnostic: VE1PR01MB5661:
X-Microsoft-Antispam-PRVS: <VE1PR01MB5661740338E50117C05E8E13E7249@VE1PR01MB5661.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fly/CypSh5cx+Y66acF1V3gnRvRPmOVeAZTc2t0oKAHPr6zeTk+lsSVWnphGz/aHijjuCF0bxeIriC9fvBLugoe9irHzZYIpwk3rjdaUwkubwh7BUeb/Mhrgiy9/Vq9K3hTIwsBJAlpdFX4lwD2d0Cju69CFc5bwV1lqgoA3Hpz1K7b1ZLMMz4dOunPQt6lnQBzErtFlz6vR4XWfbwMIY26IBAqG/re+/rJ9O4cmerGpLMzEkQYA8SuhvNsIHkpod+zVenuIVL6l2JKl3KWfSBExCMjsHEZBSvcaTSo97NAqFTw/g3Atdkgwdqi7uYbynFtBR5gAszhLz31cuuiAjM0JLPw7H8zc3/4E4q2qhM7CJPblqDsqEQojIkMm6it8GdEgU6KK1wK20NrC5n9a28PJrM12v2hRLhzFmGlRMNVcbtNUTc+Q4NnXgE2V8zci/quVAZdrRunbU13Sdhgvsol2RmX21HAB9QqHKwXp11NWEsmzWI/SW5mqqwzfM3uMhtRSSWpok4z8ZJ1Q3Pnh7jwU2ENIRelkVJObiScdKObsnZppu/NzOYcNfLe9u6CKpfGmKzxLmn6fj0npgtOHNK210z2E3Ey/34n3pjX948IqQ3Adlax9ZWYknVtl96T46yofGahszEkH4Je+nRgk472+aD9YnvZNP2un7E1xr68CtedoSXv4WbdEbil2re/jBsdQ7JW1xgwJBIraZeAJ61gTck7V0YRo3dDe5nG9g3E6+TIaXk/sPPHosMDDOTMkMIqHzMRERSqMjC5X8/raC9wOFzLLVYSd2BOKrc0HwfQNBJFXBFHtJ9LPYjqtU574fdjiJ1MBN9qE/xiq48M9dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0101MB2286.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(786003)(16576012)(316002)(36756003)(44832011)(186003)(8936002)(956004)(38350700002)(5660300002)(38100700002)(16526019)(86362001)(2616005)(478600001)(31696002)(83380400001)(6486002)(8676002)(66556008)(66476007)(31686004)(52116002)(966005)(26005)(2906002)(6916009)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmFxeVkwN1FkeGZjamY1SE02RUh2SHMwNWRxOGVOV1R3VCtVbHZXNUUzZXJ0?=
 =?utf-8?B?K1RQYUNVRVNKNWlKaytlZDVWK0VMWVE5WlBSak5sajBRNFNiMXJwNVQ0SVhL?=
 =?utf-8?B?MlJBTnM3c0VCQ3Yxd0pIaS9USEN5d1d6NS83TXlZK1NtZTNIY2pOb2JGMDNu?=
 =?utf-8?B?eGQzbURMRkhUcmZWZ0pJWk9OQngzQ083L1hENGJ6Y3dSZHRnanhjY0hYaWhJ?=
 =?utf-8?B?R09meXpMZkRBT0RFM3RybnFMWmlsUFNJajZDMFZXdU9LUG5uTzlBTFBRUWJ3?=
 =?utf-8?B?bWhETkVJaDNWM0FFUUJMSEszbjIvQjJCWGU2RGRwbHV4MkZjYm5DQUlRMmN5?=
 =?utf-8?B?R1loU0V4TC8vNks5TnVBWDdHYnMyY3k0bEU0NFBQbXlrSHpubld4c3UxK3J6?=
 =?utf-8?B?azBLalpwQ0JOa3EvL2NrSHJuK3YySWNybnd3b0V2c3dsVXppQURmVURxYkhO?=
 =?utf-8?B?WlhhMGZWWEVsTTBBMkNCTTZsQnJ5MW54eXRNbnMyZ0cvTm50QWh4cEt3SWZE?=
 =?utf-8?B?Y0kwdHRlMGM3ZkJ2bVR0QmhMMllzUUFyQkl3MXJrZUtrdWw0OFUxbk5kVnVD?=
 =?utf-8?B?VE8zYVF4K0dhN2d2MDZTNlp4T2Ryc3F5Nkh1dXF2MDNCbk5SZGpYMjF5V2ts?=
 =?utf-8?B?d1hUMjgycVdZN0daOTk0N0grRGtsSWY0eXRCaDcvMGQ3SExlTlRsZ0taT25i?=
 =?utf-8?B?QWxhc1ZPYzR2Y2hGQkZnNk02VFRMMDNZZEk0b0oxNENaSnZCTkFVSDNWaExM?=
 =?utf-8?B?YUZ2NlZLaG1TcEk4QlhQRVFSZGlyUEdicGFPRnMxZU90bmtMM1puaFNVWFBH?=
 =?utf-8?B?NTJvK1hQOUVGc0FSZ1c5MHhRQzZMa1BEWUpzWTVvajBqQXhvL0FSSU1XempC?=
 =?utf-8?B?dEx1a2NTcFlZdVdPT0UxZVl5Y0NUR2RSMFlrQ0FEeUdPNFlmcmZtNjliRHNm?=
 =?utf-8?B?YnN0NDJyc1YyVmhKWU5VU05uZGxSYkRWR252QUhyUXRTeUtSMDc2KzFGYlNj?=
 =?utf-8?B?c2cwd1J0czVGZDFWNHFZMkUwdFlUZWFIL2VOa1R5YWVOd2g0ZklZUUhJMVds?=
 =?utf-8?B?eVcrRzJVOTY3aHBhZUNPQ1RSY2J1Vk95OWRwdVU0eHRsM1BwTU9TWGpHQkdG?=
 =?utf-8?B?QjRqYnVXWlFTOGpIMk91T0NxVlB3NlZjRUdWd1RDclpvTnN5eFc2MWRrSk4y?=
 =?utf-8?B?ODFIRTBaUGJvRmY5UUhZVnQ2MmRmMmRpQXlZenNJT3dvZCs5NFJuQXdZQjB4?=
 =?utf-8?B?S2pNVnl2U3djeGlhenRCTWdyckQ2cTFXNFR5UmtKTTVHOWx3clpGd3R4aFl0?=
 =?utf-8?B?cUtMRjRJQU84N3E1b3ZKNERKNkJTTnhxUmJzQWNXc1VNak5Sc0N0SmczbEFD?=
 =?utf-8?B?QkVUMmFhUTJBQXAxdG14RThZQTBkZUdleTJoZE1uVmNkUHZzNU8rQ0tEWlU1?=
 =?utf-8?B?QlV4NU9RMzhRSjNLYXJoeVhQR2ZpeEhTaGxVajdpaVhZUXlMNW1MY3ZwbDgx?=
 =?utf-8?B?MHJHS25Qd2hOSTdzZnhaa1IvZWdWcFJhSVJYYWkvajFRWGV4SytNYkxkSk5J?=
 =?utf-8?B?SGtmRldHVlkwb2hVL0VtWTlVUTNjZ3VKbzVlMXJYRldZdi9pK2NxYVFmRU84?=
 =?utf-8?B?QWZaNWo1YnFaTG1waDR5WkRnbG43L2o5T1hOeG5KMjJoTEpyQ1JLeWNUejRT?=
 =?utf-8?B?dzRDcmZEd0JHV0l2NGhKYTgwL1FSanRCZEZsUElxa3MwODVGc2hqNnUwTmVu?=
 =?utf-8?Q?W1lSgGPhEY+ksmWuogAksO2+M5XEdWChWcI7BxK?=
X-OriginatorOrg: unibo.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e1ddb5-08fe-41f8-e068-08d9208b9bc8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0101MB2286.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 21:17:03.7131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iokuVo5vkdxgjhhsuuqCF8uNRO+HDPTis+Bj7+azwqRwN+wmG4cMjVUcXnKMnG2yGWJomjU2NA/wnxn5I/FbwB1MSpuLxd34T3Jh+34V3EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR01MB5661
X-Mailman-Approved-At: Fri, 28 May 2021 16:14:26 +0200
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

Hi,

I am trying to understand the issues that ALSA has on a recent gemini 
lake tablet (the CHUWI HI 10 X) for which otherwise linux support is in 
rather good shape.  In case I am successful, I'd be glad to try to set 
up a guide for users encountering the same or a similar setup.

On this machine, even on very recent kernels, it is impossible to have 
the soundcard recognized (only HDMI audio outputs are shown for aplay -l).

The tablet advertises Intel SST and to the best of my understanding that 
implies that in addition to the basic Intel HDA support there should be 
some codec chip that needs support too (this used to be the bytcrrt5651 
in a previous version of the tablet not based on gemini lake). I also 
see that in many similar pieces of hardware, regular (non HDMI) audio 
support can only be activated by setting some GPIO outputs (e.g., 
https://github.com/danielotero/linux-on-hi10/issues/8).

My biggest element of concern at this point is that I am not able to 
identify the CODEC part, nor to understand if some specific UCM file or 
firmware file is needed.

I wonder if anybody could point me to some hints at how to properly 
identify the hardware and the issue. I have windows pre-installed on the 
system but even from there I have so far been unable to identify the 
audio chipset properly.

Thanks for the attention and even more thanks for any help,

Best,

Sergio

