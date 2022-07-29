Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC3584ED1
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 12:33:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 352181663;
	Fri, 29 Jul 2022 12:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 352181663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659090780;
	bh=PX4kvjcJLP1MXsWvmuhOKl4O78SvlJfr0Y8VBIO0G8w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJq6e+XMXHrUqnMwiNyICl3gx7J08jxuM/5P1YZzTxXVCWxrAkevVW5TCVIHb5kDK
	 6Vu9PFnmJv/YIwdYQPFbHZqkgxx9RG6mj4h6QUyQhERS+iFMXvQ9F4yQKL4pROkXGu
	 HeFfFY4MFoQ/7BvTXAaVWUsN9uCf4XiNtk9u2hCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972EBF800BD;
	Fri, 29 Jul 2022 12:32:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B91BBF8049C; Fri, 29 Jul 2022 12:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43EDEF800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 12:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43EDEF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="tWd8iIy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/qfwR7877idRfOLFUd9Qw3l2dlUuLq/vKC3RlF1NCysKMR683zWm4Fg1x4rRDZpUTL730tDozSZ5pxNSAT3lp0ueelOMufuj4q1aIQTrC0jm7K4BKiQJiausa7vKmwHTAhfRElRCZ4D1FkaLwQWUsRixv1U5zLh+R5yYhhSKzORyR8EE8LP1UduCYw2xCnZsmsIenjHxfV0RgChUB+fzGKt3krQRogmKzP1oFDtkJJD+UD/3gPEJJJqmW2NJmUEWEKlqnuBZ5paAN7D2+RGww6CX+xZlFCJVAJ7T8DeVMUoueI+Qpccrm+1tAmvtVPWTeqP8uR46mCj3E4IWSKbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPznjIHq7iUp67ACDo8SjBwwrEzwTt3QDevd7On+C1I=;
 b=Ar7ubd2Ij4HWEi6o5sAdLpyZFRa/iVzN1akRMHX1s5HLn1fiqeuKKLalLdRWTiESNN2rrlci4ByZHeYhEkxEUeE/4PzYCXBF1V1aUY69/aaYJb0dlMUY7WwwfWa+O52l6OMrtDv8oNrBJt02FsXRQNpi5Sj+lOBR0Qj4KBPxNvzfv9u3Ze7lxRm4AkSkqrWIeChuh6DKCaNGFvcjfMHj2J9PCc1at4sYkZUZg04FoJKauAlF9Jb+2xBjoWkJ/+UhjF/BDbzb0HM2JG4+sH4vYcAgit+a9+DhT+UNu2Xtw5KkaImSQePZdk+lnj+KRm9U2dZYdEk7LLuFKmUxjQIOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPznjIHq7iUp67ACDo8SjBwwrEzwTt3QDevd7On+C1I=;
 b=tWd8iIy74V/rkPaD2h+fCx84YPkfzb4umLd+hpL4o12GW2lp7eh1Wkz+kviczIaWSMEK79NQJb/Tw/poMuUDw0ZsYS6xZnbF+10B7i91uReIgbzf3ehppzXyfNfUekOntt0GjoBQFfFCA2NDuGPknr2nm43IpdU1klJmR5rBl94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by MN2PR12MB4848.namprd12.prod.outlook.com (2603:10b6:208:1be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 29 Jul
 2022 10:31:46 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f%7]) with mapi id 15.20.5458.020; Fri, 29 Jul 2022
 10:31:46 +0000
Message-ID: <3d351235-c11a-234d-7722-447b4f0442e7@amd.com>
Date: Fri, 29 Jul 2022 16:04:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220728124057.54259-1-venkataprasad.potturu@amd.com>
 <YuKF4l68sLKkjcmQ@sirena.org.uk>
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <YuKF4l68sLKkjcmQ@sirena.org.uk>
X-ClientProxiedBy: PN2PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::31) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf177429-d9da-46f0-32c5-08da714d8971
X-MS-TrafficTypeDiagnostic: MN2PR12MB4848:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEm5zlW805RONM9uIa3xvesIsRaFKWi0WpOLixglUchEnQ8lG2eBlTV9my041wmUNPvQ18btQc4WiSaXrtVSuRlKJyGHhaFY7J3RxTqmCiO5Oqig4W+6jHvOGHS6VusDXfYXbvHop0zCKa5wMySNhsfYxhocGJzXqLgugLQPyAdN32OyXVWD2CNeT3usS7jlMhuLJO9IEkbXX7ugCPF5+AKi1KO3ggOuEs2Ij0ibsq5ZD0zYf9C0D52oyBzjtAU6rVvwHgVEgzxbIPgOPsNA1FmRfdxfGCke8lTQ6VyLJjwRTdNb8daMYy3MvDRXpLhwL++gb8iimDPWSshKCwa/DiS3/2Qxso5X+YTIjUhLtlUhTmKMXJc8lCzm6cawezCnTCbj8ETWJvqhc9crtTfxPhDPxo1rJcVRfndoN4tAWiowFjXmWVVhNG7YdSnzjorHJBJoa01heGheHZRHdumWxF/K3EaXhZQT6uVkszxGkSry64Bc+pACNkgFjamSD9uV8RDSklExG3Tyvk28mH5wNLiBLVYOiQa2N878sBgeRu9t8xuPlO/zfHjFxTmDTMGvewxydLulJuHUUdVr8+V0vlIgjVhjpHAthUsIN38UO06nX/qHqsbnxabxDZrBdr5yaCfXTP0e8TRPRIdLLzzHr9TuMextRVF6jqWNdkj8IChMJMVnHKSVa34fmxS2NM2ERAH68MP+NINl6CtvClv3l7qidbC3ll5KhRp5S3F1nSmPkS3KaDB5Nuy9ey+ewFOLeKmedImNJygAslbolFndDBU990pyliciE1OS+Stxz8RJZkbA1TQBqodxfbThh+ZBrJ9pvcf4Zq3Q3diylqCb4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(38100700002)(4326008)(31686004)(6916009)(66476007)(66946007)(66556008)(6666004)(8676002)(54906003)(86362001)(31696002)(2616005)(316002)(5660300002)(36756003)(8936002)(2906002)(53546011)(41300700001)(186003)(83380400001)(6506007)(478600001)(26005)(6486002)(6512007)(33964004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkNmZk40NStSQzNRdnhyc2RpV0NKT3BmOXY0RDFvZ1FNVlMxYlJrTnp3SDdt?=
 =?utf-8?B?WE9tL1NSeGQwNnNwc0lBMDJHRzAzd0lGcU1yYjN4RFVFSDlyYmFCMXFLNyt2?=
 =?utf-8?B?YXpvTFUzY0ZvLzFHNDA5anVPbXRpUkNpVytIN21HTGdXVVV6d2Fvbk1TUjhl?=
 =?utf-8?B?aTFRRkdWWElRRXc0cGZaa2FaYkJGUk5wMFNIOEhRM2gzWkticUJVYUpuemha?=
 =?utf-8?B?SVJsV3NCV0JaeEdiRjVEbkpob0c4TysrVmM4RWU3SEQyYlRDaVNQWU52YmZv?=
 =?utf-8?B?N0sySjlPbmQ4QnJPOGVqZ1hEMkpDODZBUXBpR1FaTDNsVG5VM3ZVbmhteHpU?=
 =?utf-8?B?UE84RmFWSnVWRWZPZmJJelV2L1huNzByYzZzeFNpZVE4cksrSXRwWjUrdCtW?=
 =?utf-8?B?UXZoajA3bFpZMUI5MDZYS0ZPQkhaRy9YWGZnME5aMkVDdWRIY2VtT2FuTFND?=
 =?utf-8?B?aUp0ak9pajFFUlJ6anBsRW1zZXMyUUNQMGl1UWg2ZXkzK2NDRHA4bGFsSVEz?=
 =?utf-8?B?VXNkeHRDVVN4c3ArcldQdnNidVczZDZJbGRvd1FiOUQ4RGZxcGdzVTVVdXp1?=
 =?utf-8?B?eDdqK21EYTd6TnpUeHF2SGpKMXdZY0h5UFI1ZURkUFV3TDBEK1IrelprWjNH?=
 =?utf-8?B?dVFCSFdCUCs2OWtoT1RYRnZYNklwMUdkd3pSMUJCaVhpdG4razFzQjJwRU9Z?=
 =?utf-8?B?RzlkWFB0c2IzdWo5cGJTWUdZUy9KM0E5NW1GcExoaHZhUkRNR3cxVVN2WEJS?=
 =?utf-8?B?S3ZzQThMTUgvanRSZXFMeEpIRlpCenVhQVVOYWpjZHBGRENIa21mYk43NmpT?=
 =?utf-8?B?NnMwTmxRWTBtVVBWUGNLSHcrd0FhdFZmNWpBbUZaUzVadW9LTUhCSlhlK1pE?=
 =?utf-8?B?YjZ1cFRaZE9SR0FadnMxcUdiMzQvdUZrOC9BNDRhdXFrMFg3d28vZklROUhK?=
 =?utf-8?B?Zk9aQldsLzVkRGhJQm5XcWlZR2JaQzVDRk5Nc3NTOFd1TUtCL1hqWWZwdDI1?=
 =?utf-8?B?Tkh2dXlXRU1QRWRsYlRQOUx0REZpVDgzN0pFOG1WWFZwMldMWTVMZFF6cldu?=
 =?utf-8?B?a1lXWUVRRk5qcmlsREJ0eUJaVnRmRlM1U2tVN2ExdVZSNk01aFpCQS9VdEhp?=
 =?utf-8?B?QTBsYmRsMGJIZ2FCQ3lvakFKcHlKcEFDdGVVKzRiZXRTZ3BRcDJhaTFXaTlE?=
 =?utf-8?B?ajNoYVZZMyt1RHpFQkRPZWJuV1dGV2dFQ1JISGk3OFZ4dmZtYWxVLzVKc1hO?=
 =?utf-8?B?N0pBS3UzMGx1Z3lIOVNnSEpOZlNkMWlBbVE5VTNRTTJIREFRbHJzMHpOUmI0?=
 =?utf-8?B?eVFPMk5LVktoc25zcGlkU1IxRWk4aHJLVlJEb1hIdjBPM1ZNbzdZcGxta1BK?=
 =?utf-8?B?c2I4UXdGZDVSNTVCSzRCUDN1UmFvR1Y5TWFrTWk2T3l3MjExRHVkT1RrRk5n?=
 =?utf-8?B?Y0haMWM1THRabGtQVzlFL3FDb1RlZmZJVlpUUkpNOEtZWVVmcm1wanpENFp1?=
 =?utf-8?B?TGQwYVp6UjFVQWs4OHVhbnk1QVZxNlhEUHRueEdoY2l0dUpRQTZUbFNUZjlQ?=
 =?utf-8?B?dGwxU1pmT3c4ZWM1NmdmNTdGYldGd2tUWlp2UDJHNXVSdEFyMC9zQnNnK1R3?=
 =?utf-8?B?RE5VOWlLQTVSeUNET25kamgyUjAyV2ppdGpJdmdDNXhUcFNGbzlQWTdaWW1H?=
 =?utf-8?B?NWFub1QvM3crdlZ2VnZNWGhYWFdXRjdNQ3NZTzhLNk14Vmd4cm1QNGlhMHdt?=
 =?utf-8?B?TmdXZTAvSkY0M25NeE1VUXljam8rY1JFdWNJekVFeWJPRTVKakE4RVFraXdT?=
 =?utf-8?B?WitGakQ3bkJUaEEwK0F4QUpRT1h4aW15ZzVIQ2d0elZ6WUpUWGk1cDRjQzBx?=
 =?utf-8?B?bStoRHJ6UlU3b0dFaHk1d1RWY1VDWGZZWmZjOEdtMnFVMEppK2xkcjlNMDFu?=
 =?utf-8?B?RjBVajBjeUhWQkJBSlNjK1hxZ3V1OTdua3ZnTmVCcHFHQlA2NERRTkJIZGto?=
 =?utf-8?B?a01DNWM5THczK3Erbm0vSjBMcUdxYlp2OVI5Yzczc0FCcFcybkRDK21kZjlp?=
 =?utf-8?B?TWpGY2FIN2VkbDlDanVHcmlXUFgvbGc5SkhONzluYzl2ZFAzM0xIY2EvY3Z2?=
 =?utf-8?Q?6Ns/BLsHcxK1YSMy4JX3fpDO6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf177429-d9da-46f0-32c5-08da714d8971
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 10:31:46.7412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHTWauSXUgcEGx9n9EbbMTD+Dm7YLiYBq4vD92nayvNDQ3iVtgfAypp4ZIi6A7ZOmTXUn8Gs+3wtfVlHeEg4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4848
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com
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


On 7/28/22 18:19, Mark Brown wrote:
Thanks for your time.
>
> On Thu, Jul 28, 2022 at 06:10:50PM +0530, Venkata Prasad Potturu wrote:
>
>> @@ -104,14 +105,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
>>   
>>   	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
>>   
>> -	for (i = 0; i < ACP_MAX_STREAM; i++) {
>> -		stream = adata->stream[i];
>> +	spin_lock_irqsave(&adata->acp_lock, flags);
>> +	list_for_each_entry(stream, &adata->stream_list, list) {
> If we're already in an interrupt handler here (presumably not a threaded
> one) why are we using irqsave?

Yes, your statement make sense, I have followed below statement in 
kernel document. so used irqsave in interrupt context as well.

We will change it to spin_lock() and send it in the next version.

*statement:- *spin_lock_irqsave() will turn off interrupts if they are 
on, otherwise does nothing (if we are already in an interrupt handler), 
hence these functions are safe to call from any context.
