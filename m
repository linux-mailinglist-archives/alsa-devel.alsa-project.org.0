Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4743D72C3DB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 589CA6C1;
	Mon, 12 Jun 2023 14:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 589CA6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686572365;
	bh=kxK5aQalsMqMvhHYzf9E4waClU362w608SV6eIS35wk=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P4CgSCxe6rvREdN/ePm3KEddFvBD+Hthx6OAro2bJ5oQ2/qd2AlrFg4i6Ac/aq9tW
	 GUszSpZD0DwmJxTUn/8S04B1riwPMJHHy1HOJm/v0yqff7eubSjC7Z0y/WZnM9zKsE
	 z2TNInGYtQYb3qXfK68N9Dcd63U01tcbyh1Q73tM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9162BF80149; Mon, 12 Jun 2023 14:18:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D741DF80132;
	Mon, 12 Jun 2023 14:18:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C27C6F80149; Mon, 12 Jun 2023 14:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14E12F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E12F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=jZuJgN69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTlUpOzQ9YIyQpMdIjH9rErx1UCLclzKEZiUB+TD2UMSgNUdXag2/fjhHFVARAZNXN4s/twgWTLJ+1h3sH2UDctiG8qjDwrSdLTcHMKYsJg1yQYvSunEmOTKX7Ori5yz/T1tTi8eoprHKW8mduDLTENAvNTlX89Q/NVAtGgxukeBeLGqFMemdjESECnFOdhJq6JPNGLcpAkWmlfEhyH1IaU+K+MUxd2hGwhDhe8VAlAGxwjxv3ZFpfGHY5467dUBnR4ivaVkF6aTSu9gQPupFMkt6RiIR1sHsndd60SOVV/+UrgUTN5oEQ3L/ZV5CKUCc+CLDUMHfbzBPgH5BQGMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BdkiGdyH+Au3Jr4vr0VNkZqIR7Kmu+FJ2AfX/jeZfY=;
 b=UvGdKggOlDWdc1i80/Yu0qEz8VnVqMLwQ3tw4i1cUUo8DN26A1CiONyZkHXfixtiYt3mlHCK4ArwmOChxUZZDD+qM9qLCOVKwSJWcJQDfKgqjHMZgaVkAgciulX+sdasCbbPLJ1qib8lAdi3en6bSk2V5jSpESy3jK8r2LrmCQfR16KkVD2KRg/f4TlzeyckNgPSfFGNuHOOFjDMwIKbKcrnqQu4eeOESoI7HaluMrk1gIMFrfO/8+UXo+SVFAtSZhPfFqSFAcF/phwDNxABWzbWp624DFP9oL0di5S5Iv+16rio1tGUTz61LRttKJ6ceMHjfNJ4GQ/nuA7GTnw3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BdkiGdyH+Au3Jr4vr0VNkZqIR7Kmu+FJ2AfX/jeZfY=;
 b=jZuJgN69HJN0mBizwEybuASup/tbOmJTylBvCX+rjgrf7RtU5zTx1u6De/mu2WyFkLIPNBSKuhLsOXCuGP6RMohNgPejugdsUtkJs6Dk3L3BGvfRjeTei2t8v9VVtaxB3FgxSTXC9Z4bvaPwkx5S3P1dVvD0zfJh2Jh81z1y+eqhGhU+mq37HxLFKrYciXbeUOcL4pNjaSs7kNv0B2TACOowDjDcVqT76QvSANuIr0QQev3EYZ0aFdU/LqvzX/bEolHp2KCCwjkBlcse2lYyR5uZo9Y6M0rZYbmFVxDIO4Ul3y94UBeMbNYI6vaNG+0iOBCdflxtjoQrlwOTqdwVdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.46; Mon, 12 Jun 2023 12:18:08 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.043; Mon, 12 Jun 2023
 12:18:07 +0000
Message-ID: <b57c46a6-4446-3418-fc4a-8bef1e28868c@nvidia.com>
Date: Mon, 12 Jun 2023 13:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ALSA: pcm: fix wait_time calculations
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>
References: <20230405201219.2197774-1-oswald.buddenhagen@gmx.de>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230405201219.2197774-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: cf20ee5a-07b3-4fa7-c61c-08db6b3f14b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a9stbZifN9rYrc/dYYe6afsl8mkh5aagvz+bM6t67fh25cjjniBMRXIlRlaWPk7qHYC7PrjVaRHIF4lM63CmvqVkxwq+StlCbbwc/btYEq8g94VG3n+6x3CCiMcdmEmq0a8szoX49UU9s5zBs+7gY20fGVDzVrXOoAhg8FWvijCnkcxAQsEjsDhnA7OdB+coAPgBBMQLtpjiyw4M0qgOAt9wXS/BR+UML/bqwBD+IdEoAysicF7AtuFAC/RBjnxm3L/cs6XEZEVXwYPOHEfv9hban/FJqkdIJmXQoqz6CXG7bYV6iXFmZH9Rr2kFaCD6Lg0yyzCl9Pc2aZcVPFQ3AV6l2vVjsGhAEiaEECRqV0aMUqvGK3kplLkEKUcsHjT8CRLuQR8nwMlgP4zMol7WY+5fKgWY4mn6UcFWQfRh8NdPs9uMs/3fLdBdQ4jDbTH8byKAVnZyaY84c8JA8SVLY47HZWXtmO/OHS2YxaXdmah1P/3YM56Xg+VK6ehV3eeDSrKDE6F6MuqYaP0jHBBZMQdLb92iPEsmj4Y5uEawyl/y8EywI5KNeSC/NWyQS3Fk7A0s/7ZhpeTp8Ph0xVASsSbYWHq9OPiqxH3qoNDWd4vJFb8V/3TiTzvbCfFeLWA+IW42pug/fdMudRqHKLCBnLwzR06FsWj3qgoL6mFdbbYLiEaoWjlhn6xCRveB2pgn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(2616005)(83380400001)(38100700002)(86362001)(31696002)(36756003)(478600001)(110136005)(4326008)(6486002)(6666004)(8936002)(8676002)(2906002)(5660300002)(66556008)(66946007)(66476007)(31686004)(6636002)(41300700001)(316002)(53546011)(186003)(6506007)(6512007)(43740500002)(45980500001)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2Z2cDJtQjhJRld0UWh6TUhTd3BOQXQ2emFxcUFuS2hqSHkxU0p5OGlpa1Jn?=
 =?utf-8?B?NnVvSnZVUDNrdmk0eTVDbmtFRU9FNmo2c05xMzFvdHB3c0tRY0J1MHRJYit5?=
 =?utf-8?B?WHVXR01lS2VKT3Y1azBxVmxRVmJxT3ovUkV1U2JaWjB5U1JPOHlxbzVjWFpw?=
 =?utf-8?B?dklIZHVsMmY3Z2FLZElXcGxYSmRNK1J4WWtubDd2dHBueHVHejhCM2c5dlEz?=
 =?utf-8?B?aFpBTThtNVdlMTM4UnZsS3lxSkRIeExISkdTS0doRXNMbmp4cWYybHpWbWVh?=
 =?utf-8?B?di9QcldxMEp0RWFPMTN4eVlsSEJHUDBYWHZKd0xrTll4QzVBZU4xYXZKOWVW?=
 =?utf-8?B?ckpDUGpsK25sekRmbFNpNDIvV3N0QUdrc2h0UGhXRUNhL0RyZTk1THNlYjFT?=
 =?utf-8?B?ckljdFg4Y0g1VlVKSU0wRnc1aXphYUF5QXFUYmh0UXE3YWNwZUdmWHI4bHRm?=
 =?utf-8?B?djQ5dndVTmZqYXlaRk5aWjdNL2M4RFRodDBnNjl2YVVGb2ZnREYwVEo1Z3NR?=
 =?utf-8?B?TkFRdDdmRW5RYnh1bUFUUmFpRTEwclN1cjEzUjh2TnFLTGRlTjVGTlJZeFRj?=
 =?utf-8?B?RDl0Ny91MUJvbFdLU1c5ckEvYWFXczRaaHFHVUJjUUNudElYdHpVbGJGanJk?=
 =?utf-8?B?RW1oTm55d0ZwaFlvVWNPdnhiRHVHMGNvK2R3MjZCWkJFNTlvZnRZbEZUK0Jy?=
 =?utf-8?B?NEUvVSttVHNvTFcrMlpvYzZrTXNaNDA3Z3Nja3RQK2JWR0dKbEtjWDlMbm1W?=
 =?utf-8?B?eEM0RjRFV3laa0plRHZ4ems5YitEWmR0OGlhZklPWlAvT0NiREV2a2k3MkZU?=
 =?utf-8?B?U1pSN29YOEZoNDZ4U2lHRkxjMkIzVWQ5Yk1Jckt2V1FQOUk4cEVMekZwT1RH?=
 =?utf-8?B?R2REbkJoZ0FORnRSSVN6dUhVQitzcHQ5SVVIazIyd01kOWpWd2NPLzZkSjgv?=
 =?utf-8?B?dHFNdFlRQ1R0ejNJVW1ZR3UvZXRDeng2by9Rc05rZGJmR2ZMRzVoeGhZNSt2?=
 =?utf-8?B?QlFqN2puVzRsNHkvcGpGOXRJUWNlTXF2aHZ4QzUrbFhPaDZ5N3NjVU5QSFVR?=
 =?utf-8?B?RHhEVEhUZ2ZVcCtoZmRKMTVHMzZEai9ISlZzclJvbFYvNlNWcitWeHgyRlVZ?=
 =?utf-8?B?UmlWeDIwaWlGckVlT3BaZkYvK0tkZ0J2c0NxcldLOHg1SDhGUFdBdVhCc0xW?=
 =?utf-8?B?Yi9COFJTeGxSTSthc3FOejMyejA3SEZ0YldrT3c3U1NuS2ZreEs0dU94am1Q?=
 =?utf-8?B?cTU4SVdNWlE3ckxlUmdMV1VaSUVka2E3ZjlsRnQwQW9ldFZOS2NSd1greVBn?=
 =?utf-8?B?alFacjJDM1JtcDE3UlJHTU80VzhabE9YTkc4MHYyeWd0OFZmSk1TcVlqREhB?=
 =?utf-8?B?SGwyU3V3UWM1Q0wwb1l6bjFNZi8xRzNkYnFEYzRxYVZlQnVZY1l6b05nc1M1?=
 =?utf-8?B?V2pLNC9acnFBc0FuY3hLMHdDa3Fpa1dnNmtzVjR2UEJKT3gveXZGSFdOYkw3?=
 =?utf-8?B?RloyaHQrSmd3ZlY4bHlRVzF2R3hxcklDcFFNeUVKdkxYY3NBd29uWGI2alZq?=
 =?utf-8?B?SGQyaHc1eHdFaVNhVm81WDhSVTY3Sk95VGJFRXRMYVBoWk55VUFyMzBuTGxl?=
 =?utf-8?B?S2dmcy9ibTB2aTRyak1VNSt1WlhBbXp5VGIzemVCWHlvbEltSGVYekM0QTRE?=
 =?utf-8?B?dGFDa0hPUmVLc2I2M200MS85TE5BbWMvOVFmTnJNcnVuS1M5ZHdLaFgyL094?=
 =?utf-8?B?QnBadWVaZFV2amIwVTlNK2Mvd2t2Q1JJQmIxUTJ3OTFua1laMC9CTTFScWFE?=
 =?utf-8?B?RENuWExvSnU3M3dHYU1CbVRuVXRBSWIzVnJUWnBxMFcvdSsrQ2xXcFEvdWJo?=
 =?utf-8?B?TkV1eUNaZEJ1SWZwM0g0TXVCWFJkWi84MmlxK3UyVnZwSHpjLy9XT2MrdTE0?=
 =?utf-8?B?Y0NyeERWSEJvb1lJOE0xaHhSVUJaTlVTY3FRSFJyN0VQMmxIUkhLUU9EbldD?=
 =?utf-8?B?eG1TQWMxazFoZENESXNad2w1UEFHNnl2QmRGYUY5UE52blNhSDBreE9SYXZi?=
 =?utf-8?B?NGVNT1pLTkYrc1JOMmJvMUx2cWVzdWNmNExzODc4MVk5NzhDUVJWdk8xb2Z4?=
 =?utf-8?B?L2IrTWt3Vms0TU1jdTlWejFZRnZnWnB3aUNkZmVjNjBzS2diRDB6ZlBIR3py?=
 =?utf-8?Q?+5cZ9CxzYeDTp1CN5TABPDrwZIImBef27bhISNwlhp7G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf20ee5a-07b3-4fa7-c61c-08db6b3f14b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 12:18:07.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gcqzu71WUP7/SYSAu4ll73UVVSSWQNF8ijoX7REdaZsJ1ZXokXnpOmQqGw3b749mr9MkVsYEpLGTz44dAEPqqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929
Message-ID-Hash: Z6ZWO7CLWTSY5O7UIQAS3RNHCCU52DGT
X-Message-ID-Hash: Z6ZWO7CLWTSY5O7UIQAS3RNHCCU52DGT
X-MailFrom: jonathanh@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6ZWO7CLWTSY5O7UIQAS3RNHCCU52DGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Oswald,

On 05/04/2023 21:12, Oswald Buddenhagen wrote:
> ... in wait_for_avail() and snd_pcm_drain().
> 
> t was calculated in seconds, so it would be pretty much always zero, to
> be subsequently de-facto ignored due to being max(t, 10)'d. And then it
> (i.e., 10) would be treated as secs, which doesn't seem right.
> 
> However, fixing it to properly calculate msecs would potentially cause
> timeouts when using twice the period size for the default timeout (which
> seems reasonable to me), so instead use the buffer size plus 10 percent
> to be on the safe side ... but that still seems insufficient, presumably
> because the hardware typically needs a moment to fire up. To compensate
> for this, we up the minimal timeout to 100ms, which is still two orders
> of magnitude less than the bogus minimum.
> 
> substream->wait_time was also misinterpreted as jiffies, despite being
> documented as being in msecs. Only the soc/sof driver sets it - to 500,
> which looks very much like msecs were intended.
> 
> Speaking of which, shouldn't snd_pcm_drain() also use substream->
> wait_time?
> 
> As a drive-by, make the debug messages on timeout less confusing.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> ---
>   sound/core/pcm_lib.c    | 11 +++++------
>   sound/core/pcm_native.c |  8 ++++----
>   2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 02fd65993e7e..af1eb136feb0 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -1878,15 +1878,14 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
>   		if (substream->wait_time) {
>   			wait_time = substream->wait_time;
>   		} else {
> -			wait_time = 10;
> +			wait_time = 100;
>   
>   			if (runtime->rate) {
> -				long t = runtime->period_size * 2 /
> -					 runtime->rate;
> +				long t = runtime->buffer_size * 1100 / runtime->rate;
>   				wait_time = max(t, wait_time);
>   			}
> -			wait_time = msecs_to_jiffies(wait_time * 1000);
>   		}
> +		wait_time = msecs_to_jiffies(wait_time);
>   	}
>   
>   	for (;;) {
> @@ -1934,8 +1933,8 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
>   		}
>   		if (!tout) {
>   			pcm_dbg(substream->pcm,
> -				"%s write error (DMA or IRQ trouble?)\n",
> -				is_playback ? "playback" : "capture");
> +				"%s timeout (DMA or IRQ trouble?)\n",
> +				is_playback ? "playback write" : "capture read");
>   			err = -EIO;
>   			break;
>   		}
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 331380c2438b..94185267a7b9 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2159,12 +2159,12 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
>   		if (runtime->no_period_wakeup)
>   			tout = MAX_SCHEDULE_TIMEOUT;
>   		else {
> -			tout = 10;
> +			tout = 100;
>   			if (runtime->rate) {
> -				long t = runtime->period_size * 2 / runtime->rate;
> +				long t = runtime->buffer_size * 1100 / runtime->rate;
>   				tout = max(t, tout);
>   			}
> -			tout = msecs_to_jiffies(tout * 1000);
> +			tout = msecs_to_jiffies(tout);
>   		}
>   		tout = schedule_timeout(tout);
>   
> @@ -2187,7 +2187,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
>   				result = -ESTRPIPE;
>   			else {
>   				dev_dbg(substream->pcm->card->dev,
> -					"playback drain error (DMA or IRQ trouble?)\n");
> +					"playback drain timeout (DMA or IRQ trouble?)\n");
>   				snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
>   				result = -EIO;
>   			}


Sorry for not catching this sooner, but I have just noticed that one of 
our audio tests for Tegra is failing on v6.4-rc and bisect is pointing 
to this commit. Reverting this on top of the current mainline fixes it.

Sameer, any thoughts on why this change would break the volume control 
test for Tegra194? After this patch is applied the test fails on the 2nd 
test for MVC1 ...

[ 1314 ms] Starting mvc_run...
[ 3616 ms] Starting mvc_check_configs...
[ 3921 ms] Starting mvc_check_sha1sum...
[ 4379 ms] Test with gain of 40 for Linear [ 4404 ms] curve type with 32 
bits 2 channels using MVC1 ... PASSED!
[ 4437 ms] Starting mvc_run...
[ 6720 ms] Starting mvc_check_configs...
[ 7029 ms] Starting mvc_check_sha1sum...
[ 7463 ms] Test with gain of 40 for Linear [ 7490 ms] curve type with 32 
bits 2 channels using MVC2 ... PASSED!
[ 7541 ms] Starting mvc_run...
[ 9899 ms] Starting mvc_check_configs...
[ 10255 ms] Starting mvc_check_sha1sum...
[ 10384 ms] Error: Sha1sum check FAILED!
[ 10590 ms] Error: Incorrect output gain dB against [ 10613 ms] expected 
gain -122dB for channel 1
[ 10701 ms] Test with gain of -119 for Linear [ 10730 ms] curve type 
with 32 bits 2 channels using MVC1 ... FAILED!

Jon

-- 
nvpublic
