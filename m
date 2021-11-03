Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A414440A0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 12:31:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B36168E;
	Wed,  3 Nov 2021 12:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B36168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635939086;
	bh=mW61UtkNqfKYVvmr9jItrzjwZm/dacylw9wAquofZ2k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UMmVrSNE401rbZK3FqKHKFP5zi1jcNWE51rejSTOIj3Pv45+Z1LnZDdZ652x8jvF/
	 lndWihvPDKy+octcmtF4OiPQd44tckNLfC/wWAaqYpiHjkWrdAPA/IGCdW9ZZIlK+D
	 8C0uWQUQ3bc9xqredBeiqeJfdEr1NfaA0siHekvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C49E4F80279;
	Wed,  3 Nov 2021 12:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34905F8026A; Wed,  3 Nov 2021 12:29:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14E2DF80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 12:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E2DF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="VYv2fDqc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxgccerNysvxGPwQ4ectjthfYK/wjyQzZdSL3l9XtuOPtdu4nZseoC5ci9gty0CvrzuEYuBHaNZxIKFnTh8KQYTt/hEkEacElh79p/XGzr+GuEQRnIf5TpufwXbwuLEJxb5C02zR6VcEf8iYerU7fL7+Zc4TgHy7+61Mt4nKxCFJQhflnVNgkQl/DOLhNhlgGae42trF37dEakWFw0VgOdOihlx8TsTuRUIqPAUet+7SzLSwQAJGIuDo9ATwbUkNuTS1axAS1hYVW1mPybm4zHTihf6yqBsP9lNfyOUJKjvC4SKCTnHVMtQOi0Ar/+iONGZV0JxjVXkdKi8ZQTtsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4kp8KWUwtFv2oHc3DhURiZkdCmTLCIxo7kO4TgIGNQ=;
 b=QUUMiueO+WicWqMP4BUFfmIvQv4Gmizyuw7BuBvX5Zn/rR6BTxuF+/BJWedXDvVR+csP3L+edj+tDvQDVp4jU4qxAkeRgzHFcP4X6RYOPKEI6x8PYIS8f7vHtcWWgAmk7UeqUQziVpc5fLhlcC+2xnS9+PEBDe2YRTWZ2rqFwOwM0ZqTRtj4qgpycmCoWVyIF4U47FptfgTUhJmAqFc6umYPkb9i/Fxr3jWcrx6jFJLsdU7XYe6pChYQAaz99dF3pSqOQ2D8ICd2QmzrZBxPIACtPhhfhpOpu5wO+9clD5ALLlvsyBCPdYxcASdwc4Uo+0YRdeXnHx9tW9hzC93KyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4kp8KWUwtFv2oHc3DhURiZkdCmTLCIxo7kO4TgIGNQ=;
 b=VYv2fDqcfvpQxg+Xsw1Ss8VzhBIHBpgJP80GTiRjrre5aqDR5BMArZ+0fMYcl5ix1gRfBWP0bh1hnlTr0tPZCbvt97dueqw08ACx0GVB8PW/eJRbWGyFYDujuF8bc1jW3WU02vlMr/pIu8AxMAs6oGFn3Qet1kCZQP8Z9QYu2h+YkTj0FF+B3fcecG2fzAwYqlFIfFXiFEU2cKJMbwR+PwSIqtcaoS2WnTW/8O77TuvesSWHlCzLYCI7wICQY4iuqoh22Q4Ntjysx/oiXy95Ub1UB5kUxBvAzTTF+nq7w6nDerGB/zfhcvD2WSvBL9AIbqrU+J8PYzoKI9pYP2w+kw==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=nvidia.com; 
Received: from BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17)
 by BL0PR12MB5507.namprd12.prod.outlook.com (2603:10b6:208:1c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 11:29:21 +0000
Received: from BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878]) by BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878%3]) with mapi id 15.20.4669.010; Wed, 3 Nov 2021
 11:29:21 +0000
Subject: Re: [PATCH 0/4] Fix kcontrol put callback in Tegra drivers
To: Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
References: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
 <8a00ea68-4859-fbcc-6292-909a66b0a188@perex.cz>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <1b63798e-cf3f-5ef8-1950-3111273ad82d@nvidia.com>
Date: Wed, 3 Nov 2021 16:59:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <8a00ea68-4859-fbcc-6292-909a66b0a188@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To BL1PR12MB5317.namprd12.prod.outlook.com
 (2603:10b6:208:31f::17)
MIME-Version: 1.0
Received: from [10.25.98.39] (202.164.25.5) by
 MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 11:29:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3df35c3c-9744-44cc-aed4-08d99ebd2df2
X-MS-TrafficTypeDiagnostic: BL0PR12MB5507:
X-Microsoft-Antispam-PRVS: <BL0PR12MB55074308C2018CEA782B2C81A78C9@BL0PR12MB5507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7wtYFwBnECIDqRaXzobxUJuWd6JIC+lfL85WCLG5k4XCZiyYMsc3sfq47sxJSN9NcNAxpNnmVdgPAJLK7eb0+pXQ6kvwe3z7GpaYicr5KNgWw4SmhzGMmsIfCU9vhYWmjGNrhI8aw+YTuNvbieIsIcDUkrAl1ES2cseTBe4olkBvlpzwsH50FyhM2FnlUa74BFCtIdO/0WvKS69ltmb0kSm8K6qKfzXwi2Yj5efb7UZIegH+hZWlPyHAmh50M7S1KsooMsVetCJnj1QihrTtWEmLtx4P/qj/Y+/xDHNrdhrDSvaB1tFDo/DH7fhy70ryRJvm490Tj27eTovYYNdbQ5zjouoEDCWVKmfiuEN6hGs2OoB5eJMCDA2YLxTRZljpuyKrzHTreedYnG/GlqSr+RDcPFEuqSsuJtQ9ORXwcV7WZr/ca4l4VvpSIu7UrP098k6UKw+F+GjhxxZmDaXD1EI83T9uQnpC+W3uCBWWMDJHg88uLB9+259xIPpk+TBVOWvOrSC/6njVdi7locY1aJLp7fQiD3PlAiHFJekdZMvtwC50HLDILPFajgZyqFojbAEIp/pWHUQ8RzRZSk3NOq6R9ychdwKdkH2xvwaLy8l8QeX/zrIbwhFN8U4NBmyMjflF7VZ3iFlJuX+twli9oZTICATq8KTxkWFP7dUt1Q6Sge8L8VZyGzFdWNoBdgwVafCXn70fD/QrgaSM3eRq5EbsbylAxo1YrSE42BkpWCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5317.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6666004)(8936002)(4326008)(66476007)(66556008)(508600001)(66946007)(4744005)(316002)(6486002)(2616005)(38100700002)(956004)(186003)(36756003)(26005)(31696002)(31686004)(16576012)(5660300002)(2906002)(86362001)(53546011)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejhYKzIyYklTYnNvQ09GV25uUUxGTUREWWdvUloxNWVPK2cxS0JZbU1DSG4w?=
 =?utf-8?B?QUV6MnFRc3RCZUN3cEZlL2h4N3A5cHBPYjFwcTRTb0ZOdWUyUXcyQ2YyVnhM?=
 =?utf-8?B?Uy82WU83SVUyd1BFZys3eWI0NVFUV3BnWHlqNHRheHZMblYxSWZwYnNWS2NY?=
 =?utf-8?B?M09sd0Q1N090dG4yRUNnaTJPd3ZYMEtlSjNmY1pqT1grazNiUlMzT3VtTGZz?=
 =?utf-8?B?bDBkSitmNjk2TkhRWXpkRkdXMVpKM21sUE5zRE11Zk1nWVNCTG5FVlVGSWV2?=
 =?utf-8?B?VGNPOEJVa0RtZ0tmN0pKekpCRnlxV3dVRk44c0YwZUpZc2tKb1VRZkpsWFdx?=
 =?utf-8?B?ZG1JalByd3I4dm5talFka281YzcxOVI1bnFwdkNxSVBEcGxLcWxEVE1qZUFH?=
 =?utf-8?B?ZURIZy94VFNPYWxrNlduQk9kZUM1K3hqbFZNc0RoUDZQRWRXNllxYWYwV205?=
 =?utf-8?B?ZVZ1eXZIT2Q4K2ZsTTNLNkdLZlVQUXVGWGl2WDdhQURKSFZkS0NZVFZaQXBT?=
 =?utf-8?B?bVBQTWtFazg0ZG80L3lFRGducjhRTjZ1RXdWSXh1cE5IT3EwaHJ4STB0QVlq?=
 =?utf-8?B?RW1obkpYbnE3WldYb1Z4eksxS0t1Q1ZwVkNXSys4QTVTNmZjUU4wVHMwQzhi?=
 =?utf-8?B?R3JIUytPa25Hekh3SUZwaVFUampXMWNuY2s1Mk9zVENheFhFYjhnVDJnL1Jq?=
 =?utf-8?B?NmNndVVsa3NTYW1iVXB6cFIrVzJhT0tHZEwxWDMxVHVtallTYlRPaUk4N1JF?=
 =?utf-8?B?Z2pIUlY1dGhlc1FBRXBGZ2ttWkpEcUVSRHRObjFmcGNDRTFKNVhNdXlEQjRs?=
 =?utf-8?B?YlVucGgyNGNPd3I1NWZzNVlDZVMvbW5iSVdKdTB4am1MdnRsekJNZ3FwNUNH?=
 =?utf-8?B?VEduSFdxeUREMjl0bEhrWjNlMmlOYXZURnFVcG90a0lIWGw3elRzR2grUEd2?=
 =?utf-8?B?K3BYS2x0OHczNnRVNnZrNGtlWUlESGxibEVzZkRuUTVzbXlGRXl4RmJDR1hj?=
 =?utf-8?B?UHVHaGQ5Ry9EczhQOWZ1dzdtQU9GdWN3UmlyU2NXQkorSHRZTHBUMGIvM0VS?=
 =?utf-8?B?TW96bkc3dnFaRnZCVWgvS3JSWXIzSzMvWjJRSVYwSmN5dEJUZ0laV1BuMzh5?=
 =?utf-8?B?eEtOUmcyUytoTENQZ09kcWQwVm5hTXlvSGZwczBFUER1cmRScUtRc1ZHak9X?=
 =?utf-8?B?WTUrM3RNeTNBeHJpdUUvNkNhbXFNb1ZOM0FlYnplS0YzSVJLcTEvUGcwYzcw?=
 =?utf-8?B?MEN3ak52anBHcWN0NDdEQlphY2E0Q2tlbFJ3VDFiVFlPdFRNeXViRXNxWEI3?=
 =?utf-8?B?ZWl3ckV0alpaV3F4NE9ldFhqV2xrN0wxRWdqU2tIZmtaUDV5NlJlM0NHdFk0?=
 =?utf-8?B?cjdmcXJ3OW5GWWFuV0xBNE8wa3o4MnhGWjdnOVRsNml0UmRqZVFPUDYxRWtY?=
 =?utf-8?B?RS9CaW80Z2s3em8yQlN4cmRkTVQ5Vk5EaDNlSHJwdjNJdnVKa2c0RXhEREVI?=
 =?utf-8?B?VG5tazVISG5HN1dKMU1DM0RNbGZrd1RhRXdPM003OEZlLzh1TU9FNkoxU1FT?=
 =?utf-8?B?T2V6bVhIV2xiZjRkVHlOOWZFNmN2Y2kzMElhYlFkR2x1OUhUdzgyQi9tRStP?=
 =?utf-8?B?UjZXd21LTktkODdvcWRIRVgwS3RNeDRQaDdqVU0vUElXckZySjl5dFNEWDlM?=
 =?utf-8?B?ZXRuQmo3bUxUKzR2cFFVa1B5ZkoyUDVMeGNRR0F5ZWJjbEtxd1NqSjNocDc5?=
 =?utf-8?B?bTB2cDdRblM5QncrZmJKQk04UUFVZzNHMXlXVWZrSUt0c2dRc2IwS1pLT2NV?=
 =?utf-8?B?NXJPeGFPR2gvME5GbTZ3anlyVXI4Q0psbUZBcU5XMkc0Q3kwb2FjMkhjMTVu?=
 =?utf-8?B?MVprUHJMOGVvc1MwbEpUQ0VrSGwyMWNkMWJBWG94QVhUZC9tejVQUW13d0xp?=
 =?utf-8?B?dTZMLzJoOEtNaGpVZWUyL1BybDdwNjlQRTJqQ0ZSZXIxWGtQRmFodHdBSldU?=
 =?utf-8?B?UEQzenFQL2VzRnRra0dKc2cxcFlBVEczVkRSYlIxQmR2VDBGN1B6NE9jbkt2?=
 =?utf-8?B?VVZSM3dhTEpRYUswRGxkTG9xb01IeTlGd2JZZlR1NExTdjlMUERJenlPeGhr?=
 =?utf-8?B?ZFRUYTV1WnpCNll2VU5ZU0k2dmlmc2ZTU2hLVTBVT3hLTUQvaGtZeCtHNlJG?=
 =?utf-8?Q?pJnTyXhdCyx7OzsuE5PVirs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df35c3c-9744-44cc-aed4-08d99ebd2df2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:29:21.0246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT0IeejwDvE02VYMOFKg90vN91SHQO3hL3vgawG+S9asZQlPPzncaZXs7DGsX7XVMlI5bgdDtynBGTjFdqb/YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5507
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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



On 11/3/2021 2:20 PM, Jaroslav Kysela wrote:
> External email: Use caution opening links or attachments
>
>
> On 03. 11. 21 6:04, Sameer Pujar wrote:
>> This series fixes kcontrol put callback in some of the Tegra drivers
>> which are used on platforms based on Tegra210 and later. The callback
>> is expected to return 1 whenever the HW update is done.
>
> The logic is a little bit another. The 1 means change, so you should 
> compare
> the register / cached value and return 1 only when a different value 
> is set.
> Your implementation invokes the change events for duplicate updates.

Sorry, I did not think the about duplicate updates. Thanks for the 
suggestion.
