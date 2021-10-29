Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2143FF23
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 17:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F15716FB;
	Fri, 29 Oct 2021 17:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F15716FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635520240;
	bh=3bqspuN7yBm3VKY00ZtFaNCs0qxjx4z+afUvglnRKDo=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAvLULe1qv3yueqbw9hnGQkPBgPSzW6Y+lRyUk0A273Y5wqQ67LJ11qoH07Lrzp14
	 FLrWw1R2MQHWToK+UnHnJWhntcJ8fW0gzlipSuzl0TmC/a/2Wk0mKVGV6HowzGnyeP
	 HWdzpWiCqLjknnshcMAefzuAMrM9cTNWnY1DT26Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC4F9F800D1;
	Fri, 29 Oct 2021 17:09:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB16F8025A; Fri, 29 Oct 2021 17:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85B35F800D1
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 17:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B35F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="uhUmrMlP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bltUDkRzaQKVUYNJ8umUVoYbGdZZD+VHcfrlNINpNu9GwaLNhx+HcfO3sY4afJuR8NFfD66DKQOrWn3hJRTjk4FcUNd8gzMuGgX9f5Zzb0rAe8ia9hBiCxg9cyywOdQX4AxPHbaHw3Zw6e+t/sXVSs1IGODLzmMJufNu9VJV6MENQTGID5E6K4O5ON5OE1EYadaGYknyViTZ+ZS9LFant7emJM8nbgfDxWD0Lf4IU+5ziFYz5aK712Xq7FExJ8kbDPFnybT0EiUmPqn8Dv4GG7g8hEF/n+aXf0tXq/o8saVn7z56kPdGSe0AqMkFOj73Hfr/w001uyYq5uoebXWJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJWs6OCmlOj86c4fh3Pt2gRIgjzUsSRQQlf2Q0sqKtk=;
 b=YFMc9bqgkEphu8mQPn5GCEvuf/B9dFi1sX9WCcgWRXJto+/T1o+7jAhNwzHiqlSkCVujXUc9L++btnIykFimFOpVzosOoC3m493vWC+HhLhP9aQ32OCwIOzDntm0WB1I9M7Zb7nH8vlyZsKM0hjS+3qua+aOx3nhfTC38gwyUpCO4chURuz2ZbxLZOh4i0QxwvR5rSvI/LUYzaxOt+cAyNMRKdX6fo0+0G/iTIL8hPDUSHgGr29p2ys+fTCYDCSC2wFY8bD7jPYkDg0m9v+ounBzrcO2vNzC2eGGAvrg1cXUwHIZd9COvfhxdiTQB8mNEhGY+/LuxH30GybhYgnzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJWs6OCmlOj86c4fh3Pt2gRIgjzUsSRQQlf2Q0sqKtk=;
 b=uhUmrMlP0hvnZbw0Y2250ztgRp3NsauSOXi3QFo2ipfcEdqi5kcn4xzQTUPTMDwafHL82Q+HV+3CTHGwzYP7zeQnSoiaY44GgwMkUp0ZQBEP58pXyTCcqPtMjfVfOL/ujmxxHNiaZfclSZwOc2K35A2/2Odjx9qkqS0JTXBBJYVWl7LINPZdE52dfXe4wfOF8wRER2MMvvGBeVwQba1l8w7RetZSxTsYS1UZ5ISTdttE66LpttpOngceZs+aKEDt8Yv6w6loIq38U3nwoSHinF74ZtEYn7C7a0vPckZ6ruuhWElMx5cMKAs8vCltakzWk35bgAJ4EszuOXM1Z+2wPQ==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=nvidia.com; 
Received: from BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17)
 by BL1PR12MB5380.namprd12.prod.outlook.com (2603:10b6:208:314::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 15:09:08 +0000
Received: from BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878]) by BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878%3]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 15:09:08 +0000
Subject: Re: [PATCH] ASoC: tegra: Add master volume/mute control support
From: Sameer Pujar <spujar@nvidia.com>
To: Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
References: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
 <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
 <8cb777f9-b73b-136c-f560-de4c31af931e@nvidia.com>
Message-ID: <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
Date: Fri, 29 Oct 2021 20:38:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <8cb777f9-b73b-136c-f560-de4c31af931e@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MA1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::25) To BL1PR12MB5317.namprd12.prod.outlook.com
 (2603:10b6:208:31f::17)
MIME-Version: 1.0
Received: from [10.25.98.39] (202.164.25.5) by
 MA1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 15:09:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb12dd0-bcae-4bc7-2d45-08d99aee0e4d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5380:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53806CB311A94E4304E5FB45A7879@BL1PR12MB5380.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sRxGbkN+8n9Uc03C3/itROhGmT6DALzzZ+A+z6wxOfhu9Llz6QFxinZbsn1oiwei25oZFgNoZeiL4iWUXU7hwh4ofUv23YC0Lj7UyGwqm3fWw0lv5srr5BXan7JTvNilK2qNTB/7MfoHZK06/20LLyFqnURuGsOEuWvL6dZRkzT71i0P+vlANk+KB4JC6gcDD+9Ua+qW4w5vHrNzmX4iaHgRUM3NK282+C1YO+8BJRjtspXGZgj2rmwVDsdXkMLEzryIB4ilcNB7+nu1lnimJBb8QES27osD/nq+fWmn3lA6Ww/yIgCiQqHeQRGt64yFjZt8SWLcMV6Sn5jqWCimT4O77hvfClRPk+qiahikCTRY3uXFxEQ2f7AOIHb9gJ6CsyYLJggRvXUJZ0aI1fP2GDQQZVP3FwMsue/e5Jmg3amciWKfDLyav6u4YOlNKNPneYegbc315/5G02SMHr2cunHR09QZVoX5JoC0leAlFmpN+Eg/draE3CK/Y9lR8F3DyEJr/SM+QFJOyn1KCYlEppnoPY7mSfJAyA8OpIMr28NLgpManmNpox2uTMJn7zkj7l7FCk30rOrIQl/WUhXPMnc7dE9Sz7allvtDV6juduU9iC3X2tuRZX99lobPlQ4Z9dOJcUypVvYO3SbnFMUv5lZfBslxRe2LDMW42WmYVZSQ8c5hHnoLzhwUg83yidY9MIknwDOHAf8ByiXjGkOoUYPML9iLezT0gsBWM2sUsI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5317.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(316002)(4326008)(86362001)(36756003)(83380400001)(2906002)(6666004)(2616005)(956004)(508600001)(66556008)(66946007)(66476007)(53546011)(8676002)(38100700002)(26005)(5660300002)(31696002)(6486002)(186003)(31686004)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0NmS2NTdEdMSGFjRUZ5cDNHUlFBa1luZ3UxTzJMUnFnL2hBRzFjeW92aTBR?=
 =?utf-8?B?eWN4Y3Z5TUpESkFVM0RMZGpJS3lxNFhpdHF6ZE1sZWRDc1B0QTFYT3QvREV5?=
 =?utf-8?B?NHhPR1NZV0JHNjZaZTJSeTdIT1pUNmdsZEFUaU51cTQ4VU9VQVRyUmdONDhy?=
 =?utf-8?B?RmRyZCsxY3JIeWE1V1RVbERGaTJoRHdmUzdDaVBYcHJtUWVmWGZ0enZuVER4?=
 =?utf-8?B?amg1R1Z6SXZHRnBKME1FMW1lbFpTZXJTdHAvZ3k2M1F6MnRnV2NJWjZ2Qzda?=
 =?utf-8?B?MFNxVEVPajYvOW9pQktsVjFPVVlFWHJnNzFmM3EyS21BMU1aaVBISFFCOTF2?=
 =?utf-8?B?c2FuM0t0MWovcjlYdk9ob3hmbTFNWGtjaXg5Wmp4aWFGSFp6UU9pOVZLT3Js?=
 =?utf-8?B?a245UkxlaHJiSnlpQUJsY3g4bGFiSk5wY29XSU5JK1phaDZwTXl5cS92VmJ6?=
 =?utf-8?B?OWczMDN1SlgwOEpKMDdYWUo3NER4Y3RFZ3JoU2dIcmYxb1VaTEQ0ZlFyZndw?=
 =?utf-8?B?M0RFZ3dRb1RqbkdHWXdtNVJzYkM2cFY4Zmh2bEJZdWlhY1JFWlYvNW01ampR?=
 =?utf-8?B?bUFCOHBNVDZiditQa0dJYWRpUkN3YXhBRk42Y2Z2RHN5ZElhdXgwSDhnenhT?=
 =?utf-8?B?KzJRRGRVcTVib1NSL3YrKzNGYmFtOE54U0xqa3RLQUlXbmhoVC9wQUpEZUQz?=
 =?utf-8?B?dnBFU3RwakNPTGp3bGdRLytEa2MzRnpPUWtQV2xDZW8xcmdEcDJVV0EyMWpH?=
 =?utf-8?B?eStMRVkyT1RjRHZ4eXZwTkdrSmdNTDBaMUsweUR3eWNRSXNqbXhaaWVtSzFP?=
 =?utf-8?B?dWtOcC9kbFJIZkpWTHRZYnJ2WkJrb0JYb1hDRVhwT1Y3SmdUbHlrT21iRXFF?=
 =?utf-8?B?SnBSZHZCajdrSDlTVzY1eWJDaUM0aUtUR2lOdjVoWFVBWlQzRk9OZm1uVjAz?=
 =?utf-8?B?dEdlSVpjUXhZNXQ2dGJiL1VldDI3MWZYTmxhNlBUV1ZFWU5SRVhyeHZiNXFp?=
 =?utf-8?B?ejhnVnMvY3YrWHd2a1VnSW5YT2FzZDdhbm45NStaU2dldERGcDI0R1JBQ0hK?=
 =?utf-8?B?ZWgraTRVYXZtMTFYQll2T09tL0t0T2xWMVMzdkxKanpPNWJlQkVLQjJldElj?=
 =?utf-8?B?NjlJVFZuc1A1bUZuOGJjaVlpZUFDTFVLallUTHRZeWxUemtBOUhvRFRXZ0Vz?=
 =?utf-8?B?NU1kN1hDdi9yQkV0a2hNNUlrQ1pWbkNNTG5HVDliOG9jYlpJSWhwSTFJMlZ2?=
 =?utf-8?B?dTNRdll6Sy9PR2NxTjdqZUsrY0xPMTBBbE40L0JPZWc4eDhEQlRSblcyMDFU?=
 =?utf-8?B?WTROTEY3MU5RT0taVXFQYUpkZjgva1d2WEFDY3lCSXE4L0tGcDZ6TjJOL1Zk?=
 =?utf-8?B?SUVkcG9LZk1ONVJ3d0lnQi8zcGVZczhSa2wxWTkwRnNWWlJkbHh5VnFUTVIw?=
 =?utf-8?B?TjBkbnVQSUV0TU5GdkpjbTNFRnVGMFlYcnNGUmttbEdKU2V1TjBqT0ZCc1BH?=
 =?utf-8?B?Y3c0WmxybGdVVlVxWU9rUG1adUVEVERUYWR4NVBaYm1VcTRaZWovTlREY0da?=
 =?utf-8?B?SHBEWFlUTFk4NFZURXkwaG5rWVovMUszVEhlMXp3M09kV0xJM28yNndHT2J6?=
 =?utf-8?B?ZURaUHpkRmQra2ptTEV1T3lFR3AxeFl2cDM1Rkt3bGg3MVpMQlJxTzczbElI?=
 =?utf-8?B?RXVNVHNOdllzMGpPaHJINER6NHpsRGsvSWVBMTdnc29sKzF6blY1SGExQ08r?=
 =?utf-8?B?dDRnT0lGVE5OelJIMUhtMjU3RXBZLzFTRVBwV3VNTnEwdGtDQjY4RjYrY3VT?=
 =?utf-8?B?WEw1a2dTTGd1NiszMHhVNHFPM3BldFlJS250REVyOUlGaHFPQk54ZlBTUnRE?=
 =?utf-8?B?dmppR2RVMVd6MkZlM2FMVjNPeE00T0QwQ1VGR3d4TDc5cDZpczJpaTVIdlli?=
 =?utf-8?B?NkRydUJYWENHYnU2YzlDdDhSZGR0dkRQZnhzNTlzZFovbHV5c0QrdUNGSlZh?=
 =?utf-8?B?eExLWGltWUJwYnRvTXQxV25JTzdobkxYL3dXam5hVGZYa1ViUEdFRmg1YUJw?=
 =?utf-8?B?TzVYdkl4SE53NzVsWXo2U2FWOWw5RjlvSmpsbFU5c3V1aXhteStmLzBUNi83?=
 =?utf-8?B?ME1JT0N3aTdTYlROTTBXSVBFU0RqZzlNYXhRWUluUE83RGJkUXJ6b2VMNEhK?=
 =?utf-8?Q?AP+RSYLTMPO0bGZemgXMdwU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb12dd0-bcae-4bc7-2d45-08d99aee0e4d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 15:09:08.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Zy9kkwHH3CUN+DMra9o6ydgT9U59A8Oyd2ZCksY/lMCcnmgp3nGewdj6rIa4NeicsIm+I28slZunOTcotWL0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5380
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



On 10/26/2021 11:53 AM, Sameer Pujar wrote:
>
>
> On 10/25/2021 6:28 PM, Jaroslav Kysela wrote:
>> On 25. 10. 21 13:06, Sameer Pujar wrote:
>>
>>> @@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct 
>>> snd_kcontrol *kcontrol,
>>
>> ...
>>>
>>>       return 1;
>>
>> It's a bit unrelated comment to this change, but it may be worth to 
>> verify all
>> kcontrol put callbacks in the tegra code. Ensure that value 1 is 
>> returned only
>> when something was really changed in hardware.

There are cases when the mixer control update is not immediately written 
to HW, instead the update is ACKed (stored in variable) and writen to HW 
at a later point of time. Do these cases qualify for "return 1" as well?

>>
>> The tegra210_i2s_put_control() has opposite problem for example - 
>> returns
>> always 0 which means that the change notifications are not send to 
>> subscribed
>> applications.
>>
>
> Thanks Jaroslav for review. I will keep a note to review put() calls 
> in Tegra drivers and send fixes accordingly.

