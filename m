Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C333247C43A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 17:54:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5721F17A0;
	Tue, 21 Dec 2021 17:53:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5721F17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640105652;
	bh=WHf6I+Rnsj2hWS2D1GE/C8OdhTn4aVwyeESzCyuNWJE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zr33Wztzwk3CoGhXnYothH2Aj2n4S3guGd2BwYzT8gj5VRMJ5B7tjxzYJFmKFnwYd
	 E2cLd6ajNPvrZDMAetB7G3kMg2msy3oFzBgr/lSVtoVdtVkw1vVeqsYaF7T4rFOJIL
	 Ps9VDnDGpTCzG17tQ6735fckfb2cLhP7W+87athg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81C6EF800B5;
	Tue, 21 Dec 2021 17:53:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F171F80118; Tue, 21 Dec 2021 17:52:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8A7CF80084;
 Tue, 21 Dec 2021 17:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8A7CF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ivXtxqgX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0GdLjjBPxkb+ejpn0K+NUVMCNaIVqwnfABoDOAR4CzxzRrAAvarWOES+JBOOYnJll0WrJCpfqWOrVN0Ehn9VODpiKSo7vsJEc4SrRbnoRS8X8uAp6XO6ypXTHVsoB4/6lrCRGOJ8GwmXhM2mX7J87Qgkf2myhVaLKxNDpHwsoIkzMAb1yoBlyH1Jcm8hQiv0p7O9cNL/ot9/bu7N4KMz63Z+GInwZ4Eg0LtMjOmNbuqhgmX12cZJmWSB+DXH1/gEDUeDfaEqFjJ3+QS7+bgjEEJjWm40T3sbdVwUCTCJfVSLzQZYu2v5LctsAZuAbqmQiM+1YOqZYJJGQVLVKgwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rajJPUJqnoF7B65yjgtjFQ/+S6HH3A0Pc8vWd66U74Y=;
 b=RWUSeArNPqHN3psPOnKSgwDnLVRUxDGaPXvVPPH3e//29blI/xPPqvOFDVO7AnfMq1fg/m5NhkITXDVF0/V9EHSNy5jBnHw2N7+orMq2nyu4mCweWu3r0/WmG7L9Pm/u5TSYjQlGP+yXyfHFX93QlN/GuZYZq1wJ5y5h5tUl1J5PV1qvXbUlFPWkTIOhOTtMjsW6sdkrW68aS82zoLeJc0J3mjSgI2upd6Ez4N8PF8cr5bPV0ltDXGfpizuJbWHBcj5alWSsCFP9DeHdWyO/diG+Rq6FbW4d3axVxALVo3HPH4i9NHLX3Al1G3YodO5igRqeflkjJnGuA4P27Ng8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rajJPUJqnoF7B65yjgtjFQ/+S6HH3A0Pc8vWd66U74Y=;
 b=ivXtxqgX1w0HDNz+K7IVdxhY7/sw16+axrmJYhBQcUWQ6MFiCy5M1iYyXTMhbNQcRzH4eZtK6ojYScfVyPbwiZIU5/dWriHVlfCD+tnLoD3HwzJf+AlD9qGUnzD/WTv2vTWOx+ae8aonKNVoxjZDroO/PnJV2wjOOSwHIPV2c7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 DM6PR12MB3546.namprd12.prod.outlook.com (2603:10b6:5:18d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.15; Tue, 21 Dec 2021 16:52:49 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::2437:1c64:765e:2fb6]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::2437:1c64:765e:2fb6%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 16:52:49 +0000
Message-ID: <21dd57db-ae28-cf13-7886-abe3fe66ce37@amd.com>
Date: Tue, 21 Dec 2021 22:22:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] ASoC: SOF: AMD: simplify return status handling
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
 <YcICwuOpBjuDNipC@sirena.org.uk>
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <YcICwuOpBjuDNipC@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::27) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add1e405-24b7-446d-928c-08d9c4a251e1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3546:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3546B514CF31C96A1F2A5C9D827C9@DM6PR12MB3546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BRcE977tZcRrr5982ZNBG1W28a0gQ/er5M7UxdDk73+xZmTZA5DYv/WOgn7dwJERb1sGcTJJOOyNMJUSzJW9zmP5VNqOcNyFueQDRk18A39Rdq36Wgf+/62JzBygC6znDmSOv1Uri4fTbcNqNXeRCzL7BiBS349DzRDhu2R5cN3C68eVbjM+ORo1H5jiia5VNZu9/GFORY7rXZnu4Mby33xa4I00257IvFwiVXnZjGtrDxxmAirFkB5iTnwsoiDW7CAsQF5ZHk3xCD5bmfHEXX++mkYyQFRNO/rQ3CaNo1qIqhBpfpVe49yuyMYHY2rAzVdPCatrODxF9nx66xPDIbzAzab/1n43QBIBAmko6WTW/ISD/8CzX+vik3wGbHduh8dsqKnPJp5tcC5aZ98gtqhF+wCVDs/tBRMUp6nlwrdkc9zHinBzidEKymPCVoCIiZjgvk38KI4SqUX3zNUFLT/IZvLgvVySs53ccTHhpcu2XmRsV7kLwDGFxmWv/YLeKwGZJ7CS7S5pBYpZ18mDonSwy4BIa0S3Mxc0lvV8ONgAOuFelpEJPw/KwK83yPHl68p71IPSLJZzH6y9/QiRurDXImIAZhOzvPMPeuBoRJAqgl2WbleqNOzgit21hv+9EhylG1XDJN/e4vg8tBAWWebt4OSt/u3xa5ML8d5krHKtVV7noNzfIuMUOgRk9Q8/0dkG/s3H2RdkSRlCJQ+eMw2sipKxLpQ58KFP4iaP6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3627.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(54906003)(8936002)(508600001)(86362001)(38100700002)(6512007)(186003)(6666004)(2616005)(4326008)(316002)(2906002)(26005)(31696002)(31686004)(7416002)(66556008)(66476007)(5660300002)(6916009)(53546011)(6506007)(4744005)(66946007)(36756003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjM2MW5sTE5HUUNQdTRxaE1oK3FDQjdqSkxmY2F2OTUvSldRcG80VGxJaGxK?=
 =?utf-8?B?a0lCUkY3TXRHY2F0UVJDZjZQL3M2L3BlOTg0RmxCQTZpb3UyemNFOGFJeDJv?=
 =?utf-8?B?NlNycUZNNVpCYWpHaVV2N0ozTUlxVUdneS9yOUY2K0JERkt3RllwcXV4S2pY?=
 =?utf-8?B?UEo1Q2w3aTYrYzVqcmI0bDBrdWVFK3QwcXJjdzFjaGlubWJmK0xSL25GZis4?=
 =?utf-8?B?RitaTEJwZEVtOEoyRlZjR2JaV1YxeCtGYkxrdnZPeExrRkhwUGc4RGZQVFZp?=
 =?utf-8?B?NXRpdnplZnp4ZmxqYk05SnFUeUw0TFZHNENUMWtCNDdyZlg0MGI0YXlBSEVT?=
 =?utf-8?B?c1hKWmRaRkhpTWw0Y1R5SVFhY2lYdnUzRm1Rb0EyRGhYWjZLZGtDOVNOUjVm?=
 =?utf-8?B?dnk1MTlyM3VOeTRZS2h0VCtUdlY0cjc4MkYwekdkUE1OZW0zRWoxOURvMXRU?=
 =?utf-8?B?TldHdWpjZzFsUDlKYlYxbDRSMnZVZ0ZRR0c5bzFUTkdQL1M4QklnNmQvNE85?=
 =?utf-8?B?VEROMXIwVHFaQzdJSDhvUm13dG5aZDRhSlZ6R1JVNXNLb29rMXNoSEVhYWJo?=
 =?utf-8?B?clJqNEU5U1ljUGNWbVlOQ0NJSkJCL2VaS3hRUHl4UHBZS3p2QkVoUXV4VDBl?=
 =?utf-8?B?UkNOc2dVT1ZDTWVSaUkvY1BFUTZZaCtjbzUzQ3h2YlBWdlVZbkZvUW9YcWJp?=
 =?utf-8?B?L3M2T2VPSG9FWkFWUTVrK00wMXVnb3ExeTlLV01HK0p3Z2ViVDNBaUNTc3BF?=
 =?utf-8?B?UnNpNTUyZWFFZEFrc3lTbG5SQjA1SjIvVEpYZmF1a2YvR2V0cm1TQkJrTTI5?=
 =?utf-8?B?OTB3MnpFOXY2by9RcUs2bmdEemJLK2NpSEp3ZWk4dDI1T1FKeWtEL1NGMzds?=
 =?utf-8?B?WnVLWTdNQWtYN2FIMWl6OG1UZzVYb1A1TzVhL1BTaXkrNk4za1Z4TitiUGNt?=
 =?utf-8?B?MVZGM0U4TzJBZk9mNmFZNEoxUEliNk9iUWM2ZUpQTThzVW5tT0xLUXRDZjN3?=
 =?utf-8?B?S0VMZ2RWTjAzMndseWlFd3lQWlAzeDJEK0Y4cDkrMktIK1EyeFFDdXZCU1ly?=
 =?utf-8?B?bWNnQStwVlhGSklSait5MW81UHoxNXVyTzlCczlJbENURHlMYVFhYnlZTjha?=
 =?utf-8?B?NkdjTXFZTUpMdndUaERkQ1M4N0FlT2Y0aVNuczQzZW05Wkt6YkpOclI0TTQy?=
 =?utf-8?B?OU9qNVpTSlJsaGI1Rko4UCt3NzF4cmhBbkF0NVFEb3ZqaHNac3BqdUllc0VO?=
 =?utf-8?B?cnFJS2JUL2o5UE1wWEFvRkdUQjU3dkhwcTQrMFVLd1o1OFQvdnlqMzQxZmdp?=
 =?utf-8?B?REVHWmZMS3VaRjRUWWg4SjRUWnlOU2gvQSt3TmVBSnVWMm5FSEJXWnlwdlRl?=
 =?utf-8?B?aTRDeXdmN1VQcG84c1RQbnJCeERvSHl0YXg5TlFncTNvNFZRZWdrbkFRS2pQ?=
 =?utf-8?B?MC8xZW1Iazd1Z1JpeVpObnAvcFFPMXh5T3ZYdFpJYkN2Qmg0RVdQc2hFUWZ0?=
 =?utf-8?B?U1NNK3VVL2ZWcEtQdVc2UTEvdEFrRkxabUpxMzlRck5JNlRnRDdQTDBNRCsw?=
 =?utf-8?B?VXZwMmwxYTY4ZHcwOFJrN3p4OVh0elFlWVpDOWlZN2lNWUFhSUlCdi9FWVFE?=
 =?utf-8?B?TXcxYjg4UExhdFpWM0ovZys3UThqcVY2MS9ORWpJVEJCNTlBUFFpQnJjdWJi?=
 =?utf-8?B?QWlRRFI4bWxKTitEZldiUitwUWNtM2EzYzE4aWlvOEN2UlRWNjQvVG9lbFph?=
 =?utf-8?B?TURFQkNzOURsV3psV2p1aXd5QXRRSW9iMDFSd0RFL0Z1bkQzVldzZHVyOXUr?=
 =?utf-8?B?VDhDUUdSb0JQbmFqYlNXaG9FNFkvRHVMTE12S202SkdyK05lcW8xbzMwb1Z0?=
 =?utf-8?B?WDI0ZDc4U2U1cE90bm9jNFJCMDRraUxzK2FScWtyaWwvY3JySHFvc2tuYU5x?=
 =?utf-8?B?T2xaVDBtajR5clBKR1AxYVkwMG84RmtIQmdjaWxEaUNwY3RKSG1tbmJWcHZs?=
 =?utf-8?B?SFpJcklPVG1vVlN3VUI0MFlBWDJNMmtwSDl6OUVxWmZNQThhK09Fa3VtT3Az?=
 =?utf-8?B?c1Vsa2txMEJVR0dMNHlhUjFuenNUQVdrNGtNTmtudm4rOW14OWV6ZUtLZ1Z3?=
 =?utf-8?B?NHpxVm5jM3Ezc2gvN2JIcEFwaXFEaFFPL2RmWi82YVZNSkxyWHZFN3FpRkdY?=
 =?utf-8?Q?Bw4CtUefCiCk/XkcGAiwG2E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add1e405-24b7-446d-928c-08d9c4a251e1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 16:52:49.4914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+8IhtKg3zd5jveaOu/1kM+PoETjXYONiPqh/w8IOPttCfrOysTs3Kx+Vn4gwAmlbLnbtESS1OI9ndOq7BGt6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3546
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Basavaraj.Hiregoudar@amd.com,
 Ranjani Sridharan <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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



On 12/21/2021 10:07 PM, Mark Brown wrote:
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Apologies, didn't realized that this patch in the chain missing my 
signed off .. will resubmit the chain again adding my signed-off in this
