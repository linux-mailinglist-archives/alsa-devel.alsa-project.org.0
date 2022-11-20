Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC3631664
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Nov 2022 21:43:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C604941;
	Sun, 20 Nov 2022 21:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C604941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668977009;
	bh=t3q2m0B54E/1XzC8YSGTWIKKlUeozttchfKQ75hqYDI=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ApZKxomTKc27DE7a+JNnN2vtU9mF+irwbPgkI9TAc60Y9XzZKh2LosnqlDSDXvcbE
	 fm8yAJXwgbiW61/yobql9t/ELKq0VlrK6KuhQ5f2Y5R+rOOjcpzPfN63+wk95Rn3L+
	 J2baPr2/s61OU+zfXtAwPaWhyCVEQvWwoKgYfZ38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E591F80155;
	Sun, 20 Nov 2022 21:42:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D93F8026A; Sun, 20 Nov 2022 21:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::700])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07ADCF800B5
 for <alsa-devel@alsa-project.org>; Sun, 20 Nov 2022 21:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07ADCF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cornelisnetworks.com
 header.i=@cornelisnetworks.com header.b="VpE/XDf3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPwMdpk0+qY+Z9ENMztPzakyoVUtauOMSAd5nYcADaGvRtE3s+OOJe1nyL64GdcJAcggusMCZaXlflVwXyK8ILvSzGB3SVzYfUkcioYk7U1WB+a1Roo7EvU4JJ8UgK0RJsDCeSkLjYL5Y4ATydxuVZXkIWbZA5RXmJGwY3E2yxxWcnGJm7E3WJOXzJVoaHpMlE/C8FRW6R0tmr0SlgCxeBwHfu7fUCStzMTONVRuyVB/pGfY9tYdKArpPOJweM6s7smYcvP3PujuJF3350oJ/BYWfxGx1Kg1XQG6NmlC1+LF/HFbfkx4wOW6mVEB6zG0ArbPzY6ZT9lsRV+k6ajJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQC6RN0gm9/uu3Zvtv08FBRA6QxulIU+aR5HK/4mQvQ=;
 b=aJt7fNAHFmLw3fVNwm7SrDreF1yziVaVxwBPKQSkuVPzohluf7eDXw/oB/VvKykL7k51g4yGNVc+ibV1f6cIld/nY1n/RPt+G9Lngjgl1ynmxdLNViqjMHuKREE4XGKTqTxGl7hzICqx6hHg5MBeIgiXnV/yiFz8T4bh4a11IawdrFA9HTFZ7uDtTm6g31LKKYCxu+fHWwOtXB3T3/hAN6Ns5Bw7ssMIz7MWtGDdWWSnsLVZ8KBsXqpNecQI9FOwYGziG4biGgwskEKBdsJUWi1XEkKFg31TQalVUWYIOJlPEouW6QZdd5dzCVXcbe911rFJVCi8llW+SY9WhR7Vrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQC6RN0gm9/uu3Zvtv08FBRA6QxulIU+aR5HK/4mQvQ=;
 b=VpE/XDf3Doi5JSCZQmcujrdfXMXWSQq2p1nZOnWaNE35tf6nzJWj1TzC4+CqZOAi9rdrD1dt2extD7Ozu/RI3MX8h2Vxq0BQsbyQTqfvDKi4rqFqHWi37uvyDa5+k0hU9XjmDuINDoL3fsQgNcE6ZLw9WMZSiAMUfsI8+qu0Clam4cxCsYepvWFQTzAYtILfF0X0imMGftLH5GNUa2XZ8tRBDzz7ydA9Q3PE15i5t/4j2MiTMwwLy55ZqBS5Tum1oa7h4mY4uKsLIxvixhpU3sqgXRL9e0SXKOMAtUkAh/tISHiDiyYMMYh6lClOivJzR9Qsy9i7E5FYX/U8WNm/kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cornelisnetworks.com;
Received: from BL0PR01MB4131.prod.exchangelabs.com (2603:10b6:208:42::20) by
 DM6PR01MB4937.prod.exchangelabs.com (2603:10b6:5:56::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Sun, 20 Nov 2022 20:42:19 +0000
Received: from BL0PR01MB4131.prod.exchangelabs.com
 ([fe80::619b:37fc:f005:109b]) by BL0PR01MB4131.prod.exchangelabs.com
 ([fe80::619b:37fc:f005:109b%4]) with mapi id 15.20.5834.015; Sun, 20 Nov 2022
 20:42:19 +0000
Message-ID: <b4481009-68fb-19f0-4d75-c4d242ed3b64@cornelisnetworks.com>
Date: Sun, 20 Nov 2022 14:41:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/7] RDMA/hfi1: don't pass bogus GFP_ flags to
 dma_alloc_coherent
From: Dean Luick <dean.luick@cornelisnetworks.com>
To: Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-3-hch@lst.de>
 <c7c6eb30-4b54-01f7-9651-07deac3662bf@cornelisnetworks.com>
 <be8ca3f9-b7f7-5402-0cfc-47b9985e007b@arm.com>
 <20221116154507.GB18491@lst.de>
 <2c60c692-58d7-d06d-826e-ea49bb1eca13@cornelisnetworks.com>
Content-Language: en-US
In-Reply-To: <2c60c692-58d7-d06d-826e-ea49bb1eca13@cornelisnetworks.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CH2PR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:610:5a::31) To BL0PR01MB4131.prod.exchangelabs.com
 (2603:10b6:208:42::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR01MB4131:EE_|DM6PR01MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: b05c214b-90d3-48df-0df5-08dacb37b7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smkvy48+LIwo9YszYUgcxnGKMX9tdI7ppvBq7SKo6NE7qu9s5xQZv4l00BcsphvUOqrVnMJIXsTUwGVtG/0vC8aSlmbIxeoQeiafPreSatUQgwP/TJtD9DENWpMJkbcgjGTRxVgSbz918fbFDHhCM4vP99Byz07ELLipvNFbkJl7+787kpDPDcjkyXs9bUWorZ+0xPWfdIDbxCtmf5PIXl6e6RAB59v5N6x6DB7/8fFXxIbZm8aSqq93BmtH5z7kfx1KkXzTmeDphW7pS7rF0xMKCMlMk/gUk4bcZR9xipDEbioTnYbbJpeQZJVdoXW0sM9JsxOAoZ9Xt/CprANOsobpAWbeHUGv/G2ve6pslDAPTyB+Vo1fAewomHSC4YqdfP2m5NVlhOLBK7IKU79pyJ/X4eokXlztKfjr+Tr93k1Kgvm3d70YAwT5jDKT39iRBD4209SHPF6Gv6aXnPKI3v7VDYbJnYd17bLD0knp3wduAlAFSE+W1CBVWPKGxFgHHy7fg2QTlAmRiS/msoDX7jr7GXZTlYC4dwOwVzSjzs8qwEUySQvU13Mh0on7MrabUdGHzUpy1Aobtf4xfRkRFl++aK6lKBNhuJI6dSXzsrOjkwsco/gks5eShAFjrsHcZaAp3n3oiffIBW2T5JONCBABI3bCn8SymswaTux298iEhb0MkTDBcBIQrCksBIiw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB4131.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(136003)(39830400003)(451199015)(83380400001)(86362001)(31696002)(6512007)(38100700002)(478600001)(53546011)(8676002)(4326008)(6666004)(6506007)(186003)(41300700001)(66476007)(2906002)(66946007)(316002)(66556008)(110136005)(8936002)(54906003)(7416002)(5660300002)(26005)(44832011)(2616005)(6486002)(31686004)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckJUZUJxdklXOElyVGQ5cWo2bWx3TmVRMko5djZ5RWlrRWZRVmtnQUNBTnRO?=
 =?utf-8?B?bHBEcVZMc09sNkFiaXRWSXR2MGt4TndCWlA3ejlKeGpSR1JKSWMvMmxNNHpI?=
 =?utf-8?B?d2VobEptbXNVSnVyVWYwYlNRd1NaMWFNVE50TElFb1NBR0dnMWxHM2IwN3dx?=
 =?utf-8?B?SW5nRityTGt6Uk1PY2JQU0RBV1h1cE5wVGt3NWxMcGErb21HS0x0SVpRNnNM?=
 =?utf-8?B?cHFna3ZqQzhLamVuK2ZkSlIxbmNPWGttQVF2OUFEKy9uSnFJK0ZidlhRQXdv?=
 =?utf-8?B?aElEbnNNLzc2Z0t5VCtiVDByMGZZbGhiVUc2SldvKzNkQWd2cytORzd5VTBs?=
 =?utf-8?B?WXBBS21WejRtMmpQUWorb3plM1NwWWFOT0RLT01RdHJRdm8wU2xGODZHeHNk?=
 =?utf-8?B?Q3lOT3k1S2RuRTJydGh6c3BEaTNQemlRd3lDUnVWQkM3WFIrMmxJZU1RQjVT?=
 =?utf-8?B?OEMyNGl2b0tCemJtbXpvWStOdThOV1FDWUxkWjRxelg1bFgxb3ZnZzRMQUtK?=
 =?utf-8?B?T3h4YWxSVXBlb3kraldZdjdtd0pxZ1JvaXBabE9ULzlPY0VvM2pnTkV6MVJK?=
 =?utf-8?B?cm1zREFRczdGUlRRREJPY2o1U2RBMkkxMWsyV243SzdLaCtUVDJiSGtTdWcx?=
 =?utf-8?B?VUh5SWJxNFBsVlIreFIxTWlpVm9PdTVTU21kL04wUG9JdHMvVFE2emlzR25y?=
 =?utf-8?B?a2VmdVVCL0J3dnNINk9BRXNoUmFRNjZ4dnRkaG82SEJrYy9jQ0JFMXdLb2hJ?=
 =?utf-8?B?UkJjRVlOMktqM3lTS1FkeDRQNVJ3cnF1aCtSQmpSUjRMMThsVXZyN3V5ay9G?=
 =?utf-8?B?aHZyNzFnK3JDMncwZHFIaTArSVBBYTN2Q1dHaW5QMFJJb2JNc0YvSDNQTU1G?=
 =?utf-8?B?NjBYR1ZCMXpFaUpETGlud083OGM1WGF2S214R0lLTC9EQVFQLy9aVU9RRGhu?=
 =?utf-8?B?TFhtYWVGVlBZZndPYkRyZmdobm1mMU10Y21Vb0k0OEVsS1EzU3NUOUthN2k5?=
 =?utf-8?B?LzBsdzYwWDlJYmtqSmkvUGwxMGNsTU9kSEVjaHFlbnhjWVhVbGZMYTY2TEl1?=
 =?utf-8?B?MHhKSWMwejZOUHhMSjFaSjFnRmNRWmh6VUxMaFBJZGNQMFhndHo3S2hkL1BV?=
 =?utf-8?B?QU4zay83TXQyRDNjSk9OU3JiVTBpdmZlczlkYkRiUWpPUGZ3VVNIeVNXa1or?=
 =?utf-8?B?dlA5Nk5OSUhRdmtUWVdyQ09UcDA2WlVBcW4vQ1hON1pmaHc4Ym5jMUZKTnRL?=
 =?utf-8?B?T1pLUE9lZE1vQXFGR3MvYkhUdWEwbk5Vc1NuSEw3aHVvVm1pZzJhcmNnMlNr?=
 =?utf-8?B?ZWdpOHIxdnBvdFMvZzJVZjh2eDc3R1BqUVZQaVpCRWxQZ3orZjh5NlNkRmdX?=
 =?utf-8?B?djdXMU14akRVeGU1aW9TenFPUUtZOUdOTW91cmErRDlTOTNZcnZQdDgxN2pF?=
 =?utf-8?B?Z1V4QkprYjJaMDJuTEFTL0tOTlJRWjZCQ241QXRYNlVaUjhMMEVCMUg3R1pk?=
 =?utf-8?B?RWswZWxoWXU4cXFuSDlSQTFPMTh5aFpEUUljOHA4Yjc5dDJwWW1kV3JtQ2k3?=
 =?utf-8?B?TjZJVmFieEpjcTVNN0VxNlhLbVN0QWYyNTVQaHZNTnVQdktxR21PZXAzZlVq?=
 =?utf-8?B?akw2djRHclpBdXZ4bXArWU1tY0RoZzNhaEIwNXF2dlkvcTZ1ZmpjZHArTTE0?=
 =?utf-8?B?eVlKMmpWakdmRFoycDlzM2pEOUtrSHh6dmczUmJ0T3hmR1pJcDI4aXNGVVhD?=
 =?utf-8?B?OVJCSkhTM3hQRzJVMUpHYjMycVk0andBZmZVekdValkxazFvUlJmR25URUk2?=
 =?utf-8?B?ZXZQbkJVcWlsUU1FM1BoR2FPa0tOWnJuVWpsRENLMVByc003NS93ZzgyUGNF?=
 =?utf-8?B?YklHeXF0d1pnakN3bm5ISWtvTytKZzVzMExXam0zMG5lcVhqQVRGTmNZVHBz?=
 =?utf-8?B?UU12cVgrblJuam5iN3lQN21Zcmtrd0lxNUs3cTVvSnhlODE5SHVJL0MyNG5L?=
 =?utf-8?B?QWFVVjdaVXZTR0loS0x0R3VCeFdqYWVUdWpZbGNiSy8wOUd1Uld6Y1BzcTIv?=
 =?utf-8?B?Q09pd1lIMUZwZS90Q29MM0tXcmU5N3JSQ1B0aFUrZU1LMVo1K0c0SC84Ukts?=
 =?utf-8?B?dmJhUDlIaFRhckQ1MGVnTTFOcHFOWlBzdTJKSGR1Y3Qva0NwVkI1eGNjWENk?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05c214b-90d3-48df-0df5-08dacb37b7ee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB4131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 20:42:19.7692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aW0m+Xq1qYPQdQWJejLgHJCI7HoC5mVu6t2kRW98XoR598oRF32+WANVqtMpjrHkLK683r+PGVD8FKEDKDuN7hWj7IaBwGyi6nzNSfDoy7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4937
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, Alexandra Winter <wintera@linux.ibm.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 iommu@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On 11/16/2022 11:49 AM, Dean Luick wrote:
> On 11/16/2022 9:45 AM, Christoph Hellwig wrote:
>> On Wed, Nov 16, 2022 at 03:15:10PM +0000, Robin Murphy wrote:
>>> Coherent DMA buffers are allocated by a kernel driver or subsystem for =
the
>>> use of a device managed by that driver or subsystem, and thus they
>>> fundamentally belong to the kernel as proxy for the device. Any coheren=
t
>>> DMA buffer may be mapped to userspace with the dma_mmap_*() interfaces,=
 but
>>> they're never a "userspace allocation" in that sense.
>>
>> Exactly.  I could not find a place to map the buffers to userspace,
>> so if it does that without using the proper interfaces we need to fix
>> that as well.  Dean, can you point me to the mmap code?
>
> See hfi1_file_mmap(), cases RCV_HDRQ and RCV_EGRBUF, for the two items yo=
u changed in hfi1.  Both directly use remap_pfn_range(), which is probably =
the original approved call, but now is now buried deep within dma_mmap_*().=
  As you say - these should be updated.  That said, the eager buffer mappin=
g will stitch together multiple eager buffers into a single user map/vma.  =
I don't see how to do that with the dma_mmap_*() interface.

I have tested the proposed hfi1 changes.  They are fine.

Acked-by: Dean Luick <dean.luick@cornelisnetworks.com>
Tested-by: Dean Luick <dean.luick@cornelisnetworks.com>


Using dma_mmap_*() for the changed cases (e.g. rcvhdrq) fails.  They are be=
ing looked at.  I don't think they need to be part of this change.

-Dean

External recipient
