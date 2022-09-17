Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805885BB883
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Sep 2022 15:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1BAB16AB;
	Sat, 17 Sep 2022 15:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1BAB16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663421466;
	bh=3PW03WdbLPu141q2Lc0k+2opI8dWAc/odW85gVs9zGA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyX7b5F1meFOBxUhrQQpuoPV7xPCjgg50JPFeiBCS2ojFiFhjuUCRM/u2c2C11mn/
	 alFYT2BIN1SYiU0mnMJIHqFNtSib2xwDqPxE3cXUD+L9HHxydHUwtOzbSU8l9ndnsa
	 JYgbNRpnHt5DvHodO82B0Cs02TxNgTPdMRm4S0KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20533F80423;
	Sat, 17 Sep 2022 15:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71703F8028D; Sat, 17 Sep 2022 15:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4736EF800E5
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 15:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4736EF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="qhoneChx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EViuyHVeONZVRu8lGFm0lzRoxhzu6VUrsT0Ap6FPlYNKd/CS9hCFAZvI44gZFjtrKGontbG5uh2aMyoUCPZuKYm8GHKlXrL8QBDQc5ajxzAhHHazwImfYk2tANS6HTamyyGaVHzadIvpPw/zLSvTEO8oYBbO/iEn1V578JUFAe0uY50LB6yOyuq4APHCIAicnwfVJ/AJiUkzXf91g5dm5FVs1xnzB2S3sJYHImVDcZqRYkowlUn17vf+OogL9ER6EFIBIW9ZvEb3AG68JbpuVzwU7eNKo9zRsX6iXR8IppAHS+Gjy8bHwoThFoF7NrE8/GT5dNzjmzaDKHjAYMVIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9KLJD6DvGVYZ0mggGgCdy3zP6lT0aa9gV3+d/S6jBE=;
 b=UjjEOLU8x+ykfuX54y0cj9yObZ6J+LmzMMXThdpqxlh8Jp8TFxS5VkaGeLMRBtJkxvFyhCzRuMzklyG7W9QFjDPkCrSU5Lr3nCrS/hKgfdBXnQHUigkUxcfjYWMAwjGGiTZgzzc+zEPevylPwV290NctGhw9NauueK2E/gGl/PQ98BXCJQidfN619/2m4rKwEWMGf5eRacYGQyeoyeYcys1JRWoNGApXZcyQaGyM/spQEMPOLNjbStGiB9YC/rbgMn1xH8ig3o4ETt/Tq4+fE7bxwTBRX/vheIYGnjsvPyqifD2mwXoYjKxrwqC2+01PTis252fxVI7p8kaAu4clxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9KLJD6DvGVYZ0mggGgCdy3zP6lT0aa9gV3+d/S6jBE=;
 b=qhoneChxMYx9Rc+og1h8NXgWe2Gv9WeZlDHj3j+cBZNbxSFXjEG8D1RlHfeOMNDBjGAcY9R4Bj+HT3nLhJRQOEOz+/iCHnXACV/H4cEkpMTS5KDLRP6RSeGSqHedHFoXTELO/sFvNAvpTVZzl0rA9X4Z0fv7phmCdF57rE3h9Fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4861.namprd12.prod.outlook.com (2603:10b6:5:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Sat, 17 Sep
 2022 13:29:57 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3%7]) with mapi id 15.20.5632.017; Sat, 17 Sep 2022
 13:29:57 +0000
Message-ID: <c6b17f0c-36b3-c61f-1134-ec9077b15748@amd.com>
Date: Sat, 17 Sep 2022 08:29:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: amd: yc: Add ASUS UM5302TA into DMI table
Content-Language: en-US
To: Xiaoyan Li <lxy.lixiaoyan@gmail.com>, alsa-devel@alsa-project.org,
 "Saba Kareem, Syed" <Syed.SabaKareem@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>
References: <20220917070847.14346-1-lxy.lixiaoyan@gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20220917070847.14346-1-lxy.lixiaoyan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:806:a7::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 482cd870-a97d-417b-36af-08da98b0b66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M6QLPm+5aOyw6xJ9dFtmg/vuevdKSUj+OndEQW3ElJD+5hGDjTeTzjcVcYkbXApCDexIGj0x93Gk9zKRU9innhVtrFvclLmIo4uW+acxEVGCibc9TSLN140l9/LoWMHhF/BAO8zWo5woBdVvZShgkOTt9I8Tf8KD6EeYZy0cpNKreAQmbpvrs4s+zTMyl0ybx04HogfF5RRaCUnPVoHzI3tBYn1UFIv5yXGaXHhDWYdq8TTqy0fMM6lgogs3b/x1u0mBSVE+dfMMtIbHYqsr0u5oA2Aww7m8N6HjeWgQHiH5g4QXt/T91jJyCY19SgqfiQoT69TyDgKOBL26L2b6RwZbnMgxiDYc1DS+BLbruFB1GRdrfWCsDdps7tEl5cWgr6qzYtxkAXiYYI8PE79CENF4YauXYrTR65qRvVf0XW8CA3mUiPGNcs4jKmC+//dVN62ONWiJEJ0QnneWv9eGThHbJ7lGROYWTmHYMx7RWWzThAb/jf0oLMVyUmc2NgsGEhancp0T/ctjbD/KmTpl85uSSKWwIUumEKFc2SopxoZ3XgRmPyLYkmK1Qo5dDIEI0EwMm4hFiFUeeM3So4Bdz3esYlem0gU0p1lAOs/OtVUgi32fBkmjpHzJxJH2f5Wkky3bNovL+8mDYUUCoc1sFYWxaPKH4Iw3DKRBRW7twwi54UIzKtwCGw6A16ZnfjMdwwEey7LF8s4OVLMjwHFCq+Sncf9B3eKv25IPMDnOHXspz8yCKoTfFk+xbFvNQ0CeLqTcfwf3AW9vwK541sAx1E0JCFK7i+8RVgvmcyvv9PWfHuqzy1VnJ8RYqID1qXFdv/b3iYtbFZnrxuAF9aNVcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(110136005)(6506007)(6666004)(478600001)(53546011)(6486002)(41300700001)(966005)(6512007)(26005)(186003)(2616005)(5660300002)(4744005)(2906002)(44832011)(66476007)(316002)(8676002)(66556008)(6636002)(8936002)(66946007)(38100700002)(31686004)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clNvc0xHV2RUZC80c1N1MGtJQXpOV09tZWI1RW0rc20zRVEvbXQrUm1FNHgv?=
 =?utf-8?B?V1lWdXdkMm1FcUhIeEpza3Y0VElPeHJxMUxBL1NZRVlLK2ZsZVZnMnk1Q0x1?=
 =?utf-8?B?QW0zOE03QVQ2aFlsc2hDNlBRZkpERDFmc2RkSzhrUUZmYTZPekplcHNBQXd3?=
 =?utf-8?B?TFVhUG5RMTB5OHNBSGE3ZDQxQlZtNE1GQlIwQkc5SUR1Z015MUlYYkF3K0Z6?=
 =?utf-8?B?Ukc0UGNvOVJ6Um5ub1l4L1gxaEFFSDUyWXIyMVRFTVU2d0V3dmExdmt6eFBM?=
 =?utf-8?B?RHRXUjNQclZweTN4RElZMVVZa0JqYndHS3lWN25rbEZWVXpST3BaMDRQYytt?=
 =?utf-8?B?RTRmVHBmZGtlclRJY2pDeXI0M04wcDlWOFpnWkMwQ3FpRENHYmJETkI0bTdV?=
 =?utf-8?B?bTBZcHdMcE5Scm5rOE03Y04vWGJQa2tKWFh6ZnFtSnc5Z0tuR203SlNiSDlp?=
 =?utf-8?B?NFJCN2E2L1BsUmwxT2RQZjNydHRaQm9vS3VCVDh6Q1dXcTFvQktCeDVhUCtR?=
 =?utf-8?B?SWgwbll1QWNKSlM5N21VSzJlamd1S0lWTWM5OXV0QjU5ekNXSkp2Z2Z3WSs3?=
 =?utf-8?B?ejc2K25pcWdyQmdOM0Ryd05HYzJ2MVFaUC9xU2xrSTFmUTIxRkRRQy9GbEJT?=
 =?utf-8?B?K2hmdzh6R0tsc3c1R0FqdXdDeXpKT3JHNGNlT3o1MGhYeGRHWXBabktKWkVN?=
 =?utf-8?B?dnAybk5sMnAvMUpMakJqcGhxcVIrTGNMVkhDbHNqM05ldlc0bFh1RkFwSFh1?=
 =?utf-8?B?bHhySzlUMXdTSERYM1J6N2d5a2JRakJIbG1vbWRCYUEwbW0wckNzd3pjR1dG?=
 =?utf-8?B?am8wV0NBdDNiUU1oYmd6ZmE2T2xLRUdGQXBYbHFUVk4vWk45d1RxTmdQdFA0?=
 =?utf-8?B?dUlDS2hwNDRpbkRuTFQvYlJiM3lHR2NWS29sTXNoRFB0b25vUzR0d0lFcit6?=
 =?utf-8?B?ZThWNzhkVENXa3RreWlLT0t0L3dPQkNDZTRhdCtOazh6a0tiY2Z3N3kyeVR4?=
 =?utf-8?B?NWlmVWcxcWpWSWtoUElkMUt6Wko4cXpPVGtJSjNYSks4ZHUzNFYyL2ZJNWZK?=
 =?utf-8?B?blVEOXhTRzVhT0o0UVlCMzVoam9tOFlHc0RyTUFQUnltTEJmV3pUd1dVazY5?=
 =?utf-8?B?Uy96YjlqMjJqcVRtaHdYYjRVdG00dkk0RlVzVGp5Ymt6Sk8zQUtvWkt1djc3?=
 =?utf-8?B?TW82aFh4Y3hkaW9aSUhyWnhySTRzakIxSkg5QzVjOWsycDJTeThEU3FsZ3N5?=
 =?utf-8?B?Z2UrSTdiQlNXbWt6bFBtRzVxTXQzeEk1WEVmOWppS2lEZGhzU0NGS3BXdWpo?=
 =?utf-8?B?VjU0MkY3YXlDT3ArVzhDbWI2QVlJRCtoTFVMTmlPZFduR05vSStaekVvaGFh?=
 =?utf-8?B?OTJDcTBxS0UwcWZYQkhJTktkOUtiaEM0THZycTVGTXpRTUVPZHZiNzhZK00z?=
 =?utf-8?B?WFVObGgyd3R6eDRiQ1pIWHljY2lMYWMwaUgraTFSejFDbnVGWFVlL0hiQ3BR?=
 =?utf-8?B?cFpnUTRoR0JTcmpTVldhbVd1UTFZRDNWc1RzMWV0Z3dwTExadTJGSU5ESHFL?=
 =?utf-8?B?dEc4bS9sVUoycktsbVlCS0I5Z0lJaDlQSkttVUloWWRGTTA5OERpSWZFandU?=
 =?utf-8?B?TC9zd1Q0OXlhMzBrTXVLdmVsdVJZc0tXbjBLL29tSjV6bExnTGlMWU5hM1N4?=
 =?utf-8?B?UzE2VjZhQkV3ald3SCs0Rm1mMlI0MFMzN2k3NzlkejhYNDluVE5DdDRObThq?=
 =?utf-8?B?TE16dDIwMGRjdDU3cktPOUtOM1JFeCt6SHNXSzAwMVE4Y0h1WWlUVnJFQlVD?=
 =?utf-8?B?MWtQbTIwVlQwbG91MldJSnVBL2dXQWovcGdSczUycHpjeDVFckFVZ1h1STUv?=
 =?utf-8?B?NzZGOW5ERzRuMWR6eFYwdnJaU3llVkl2NEZlSEV6WU1tdjVyd1ZRQVAvS3hO?=
 =?utf-8?B?NWsvR3ZJSGxUazYyYnN2a01yYjdzaDc1QWk1aUp6Y2UyNzFQb3hPbko2M3lz?=
 =?utf-8?B?amdjcG1PZnZLc3N0TGhSQWVKbmNWTkM2Tm41SklEL0JZWjFRQWFUb1U3TWd6?=
 =?utf-8?B?UEFQTmM4REJWWWpBcU0yUU1oMlV4MmJHV0wzNGNSTC9RellEK280RThqcjNk?=
 =?utf-8?Q?LV0kfRzotwAgwKqFP5b3gIYXT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482cd870-a97d-417b-36af-08da98b0b66b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2022 13:29:57.0054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BADnKORPbpHzcuSnVbYrZKDgxMWPW3Hk4ecV5NczM9IR2hRNDRR0Z/COJT3vmBmK5i96E/UbOL/AJNNJlCpYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4861
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

On 9/17/22 02:08, Xiaoyan Li wrote:
> ASUS Zenbook S 13 OLED (UM5302TA) needs this quirk to get the built-in
> microphone working properly.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216270
> Signed-off-by: Xiaoyan Li <lxy.lixiaoyan@gmail.com>

Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index e0b24e1daef3..5eab3baf3573 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
>   		}
>   	},
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
> +		}
> +	},
>   	{}
>   };
>   

