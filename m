Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D3666F64
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 11:18:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2609388BD;
	Thu, 12 Jan 2023 11:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2609388BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673518739;
	bh=K+vH6D8m3w+Rrxd5Sa7hlqa5WZvy/shbNTsohUB2vHM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mqNBqxhQGZ8NEJSGUxwGMcar75vrXw1Q8TLZnw/SxEzkaxYtBF1iwmW6PitRPaUf0
	 /U6URzTIGGp6dZCsu8g7GQXrduK8cv9zruPoBQAP+NPfEvF+uVnX6N+RZWf1nYkLic
	 8eGntX3aSuAMYKjiwTukNy0IaIiluvEi4kfFBYaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A65DFF8013D;
	Thu, 12 Jan 2023 11:18:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FACDF804C1; Thu, 12 Jan 2023 11:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC7F6F8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 11:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC7F6F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XUlgelq6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V64ZO49BQ5qaAG5dqjqbY0KN1zP3wI1RnXVIZ0ubFMnIibngeVpxVIauKWDQs+82d5rdI9ZWeHhDIWFb12XLTZk1zEJWct45P2J2rxzktD7v9NOGZzGdLOQZ80W6SLTygu30ID+19AC1OrWS/Zx+26ag/JEmUB8cpIHFzIDbLlg3PtefhwIeJDDtBgh/YRKi23I8YrfG3cZvxqkDHTpHlyOPKuyX1Suhg9hzSTGe/CKVZwkyRm+ZXDEY59YgKUMrySR20vFuwok7q02TI3I0LD8Glu1V8tp37DGwsnXfbcVBI0IqPgCPpQ2CVSyQQgUW457MoZtu49Qmt+NXH5h4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxfrOpULrXMzw5Mmzl+M+ueYVwItVb2NdUzarr6DRZc=;
 b=gZwYmtjofe4j5G804cnuIG7NZatv6l4wujxNio+73sJfWSqqg3zdS2bzKtHZSrrhEch3+tU/OSbEg8nHJq1aPuKLsfpb5tr73diVhDMIfFWL1G5dx1UiWVjaWYwRku9+aaMawPyJfxnkOd7kKVVMLhe/nTye4/Lp0FpTHMDWXrSBC04z8MnQ9enbXDEtj1lFe5Gxlxz9AKV0ucjLxjlnZ7QrG0FzuTUWyKaDVXdfCM+AaluCgzBZiorwC9P8sXNBoK/j/Ia5Io7TW5KewWL3nAHgAVXVQJl/8QL4KE1Me3e8ME5Ph8vlkSkRq1p6Srf+ByAEtVGI1P0b1BtGU/98qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxfrOpULrXMzw5Mmzl+M+ueYVwItVb2NdUzarr6DRZc=;
 b=XUlgelq6dkV1XPVwZpKWzX1SFLu0bj6AvgOVYHeDgQWvQPLJGizQlrbuWuIoW1eiTaDI8896xB8CyllnOyNTMNwCZmT0jLB/scd8HxIDNsRZz6mTpaZLBOa226+m6F4sbtUku4Q0YsnsyMtU7rnOd3CFrxKK7De02/qFDn1a+/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 10:17:50 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::fc88:7080:445e:6866%5]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 10:17:50 +0000
Message-ID: <374d0e3f-3575-329e-359c-3f900241d642@amd.com>
Date: Thu, 12 Jan 2023 15:51:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 16/19] soundwire: amd: handle wake enable interrupt
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-17-Vijendar.Mukunda@amd.com>
 <612c78ea-335e-a196-247c-9e8f3442c3e5@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <612c78ea-335e-a196-247c-9e8f3442c3e5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::20) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 4426eb74-bbbe-4026-7855-08daf486428f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2XSF4Y3DMX+vrTPM1xmXOX3bi70mt4MTXoj07J9IAepeHobnTD5Ff3sxut42l1F+2e+uBHW5UPfcssq2QMcJ6LdUTj6QOrj15YLfZAEiXORuJ14YeQUwOJD3+yCQYq5b75Kca0nC7m+spTDckCAxOUtOEE1im7ZDai2uUGP0oPpvanNBk8j1CSZETGFoltdJOuiV20GJDnBx+Mi3bNH1lOVmQVK6r3nfU0Je8VbxhYPHbhQWhU23GkWajr1ZoG+fNIRirqLSrbUj47juQUQ/7QXz8DYhEePgMyDdimAyFKCl733h3sw+jnnTlBt7L6zmjEQhVI5tVF/ToZXuG6shbB4wM48Zsbq+tPJ+R7aXNE2Lqh2GQjnD3PTwndbzwtrwbpV2emB72UPGLX7IVx8SvXBdRGJXNHhq5t7f8g2wuFlNEVkQhCU12NNVRXOtR1HRUEofOC7miLo6vw7ozJkKYfbqgW4EYqoGsvsvTMqLX02H20s5UHdbfiIjz5wANmcSJgLBpnRB4aG4B5UF5x9KQkbSUhdXdyNIOBlqbrpmbsd+rQKmXvdiN+PGe6KwynuSkIBXbrEgAny1IdZjq55irg2WsJEf79O8S65emVXuvb2YP0ba8YiE+rOlIg/FJycEnIY+3cSrKkP4dYYEejX4o8dWJHr3TNPJD0aHDKxUsdN25MHpSZKJaDNE5b7WYvtb+Lapjt42pMUC9s5FMVn4luCKDLliDg/FcX0tFpf2IVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(41300700001)(66899015)(4326008)(66556008)(54906003)(66476007)(2616005)(316002)(36756003)(8676002)(66946007)(31696002)(86362001)(38100700002)(5660300002)(8936002)(83380400001)(6506007)(2906002)(53546011)(31686004)(6486002)(6512007)(6666004)(26005)(186003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05LL2t6L0xrbzdCemswWnhCcDZ0TVhEajBjMWs3dU0vTHVWSzhkSVloOTJj?=
 =?utf-8?B?bCtHNWJCaUo5YjB1Vncwak8zRjNtRXJuamJIY0ZxZ1NKRGd2a01uelFxWEt3?=
 =?utf-8?B?MlBySkROWUJtWWRKYzI1Zlpoajg0RDlEbytpMjNjUVI0N21QeUxrNzZtMzNP?=
 =?utf-8?B?eTEyVTluNGlLMWJ1dkxsM1lZdERrRWU2aGxtQVFibFlhNmVYYmlRUjl4eVRU?=
 =?utf-8?B?MVJnTUFZSFFta3ZmcEhoSGUwa21la2F5NTQrUHhTSVFLa3R0RjJEQ3FiQXJR?=
 =?utf-8?B?Z2xjM3ZJeGU5emQ1Q202NzUzNFEwdC9RTFh6MEJETFgrZXloU3VqbngvdWla?=
 =?utf-8?B?dngxMkMrUmxoeUVvVll0dTNCSkRXTGxUMUJuRFlLMThMZHFEU3dBdmlONlJG?=
 =?utf-8?B?bUJuSUZDYm5FblFwOUNqZUJ2eG9RV010Q0tZeVJUOWY1aExqZEZ6VXpNU0ll?=
 =?utf-8?B?WUVKeTljN2hPZkJBbDlxTUpkNmlRRmdzUnBza0NTTlNoUmJjQy8xaTE4Vnlr?=
 =?utf-8?B?T0FKK01veFpWMVZ0Nmc3SVBLdHVKanVnOTlOVUhzbnJ0TkN0V2NZRGRNU3Yz?=
 =?utf-8?B?Qlp2NE5pZVdKRnBGTE5aQkJiSk9wNjJ1bm5UNG9sYzQ5ZU1sWVIwMVgwNmFT?=
 =?utf-8?B?TnlSUkkzeTZ6VUk1Q1NDQ3RvV1lSTHZiY0VrS0l6MW1rT0RjY2R1UkxzVTlI?=
 =?utf-8?B?UC96Z1BmWnpoWUpjTWFtNmE1eWV1YWV1SW9Sem0xa25MNFBSWTNhaCtEdWxX?=
 =?utf-8?B?TFdtMi9HWElMZFlNZWhGOG1MdEpLV0lCakZ4UDYrenRrOENqV2phUnplQnIw?=
 =?utf-8?B?dUtSaURvYnIxZ2dsTHpTcFlFOHdFN2c5OXN6RWRVWGpXTHJkeWRqRnIrckhB?=
 =?utf-8?B?MkREK00rWFF3UXNXd3FzN2ZHd0NwcmEyZEtsRC94SW9MVDloeEI5cXdWVGhx?=
 =?utf-8?B?cm9HcE5KOEZjbTV1dHJvTFE3RTZzZ3JYNXZ2WWZwc2x2UXFaWWc5SkhrbHlk?=
 =?utf-8?B?a3JBRFdrbkFWS2F2V3U3dklUak9rYTE4SnEzcGFrTHJNbUp3Mmdnc2NSclR0?=
 =?utf-8?B?YlBnRHpxV2hIem9udjAwZTBQRVFUdkx3dmNQd0orZGNmTk5xMlZVdHlqZXZM?=
 =?utf-8?B?TXpjTlhZdCtCeVlleGZUVVNLeTF1Qk5ZM2hsS3NUcmJzejBGbkFXa3RNazhk?=
 =?utf-8?B?Sk9ncUpoYkFacUFWbnBSeElDY1VYeVA0TGM3cU5MTklLUVZFR1l4L05vNDFI?=
 =?utf-8?B?alVnWDUrWGJuMGFwQmxRQSs5NDdJeDJiWUdhSjIwcklzUXZXRFJUeFkrempD?=
 =?utf-8?B?SHR2RnpWZkJEV2crWlN5Y09vL0crbVRnd1R6TGdZY1FpUW81cXVJaXNWdXNW?=
 =?utf-8?B?U1h6cXRvOTZmVTUxQW5kOGp1TXNOVnNFd3AzTFlHQkFPWUpQL0k1Y2xZcCtq?=
 =?utf-8?B?SXorL3NObDAyQjdzdWtjQXYzdVpYdFNsY3IwaFphbmhIbGVuU0lMUTZtRDE1?=
 =?utf-8?B?MmxiVTZ1SDlEay9GZzZpY3VxMUJQY3BMcHVYY2x1WVpEOWpIeHlnMGtxRkNw?=
 =?utf-8?B?bE04OEw3VmJ6TmhiOFF1NVplOWNpY1l1dmhLU2Zkd3IyaEZFNVhzVW1naklG?=
 =?utf-8?B?d1lmOGoxSUZFaWFWdURyNnhCSUhpUnRnL2laTUVvZk9wdzdNcFdXek53SlJu?=
 =?utf-8?B?R3ZmWnBrL1JpMUZyNys5Ukk5SG82aTFRd0JHSTVyai91VGd4UjFnb2VybTQw?=
 =?utf-8?B?QzVyRGdOb2JUamlhL0kzdmxFTXU0ektad25sQ3VPQ1NuQjI2MFdOUEU0OEd1?=
 =?utf-8?B?TVJjdGlkbk5DMXF3NzhuYlFna2RoR3EwcHlRVCtqZVZnajM5WDNiRzZROFpo?=
 =?utf-8?B?ekJPVS94bXVjL0NXNWFPMU5kTWpVeVlFUUxPdjZ5T0J3ZFl6MS9taURES0w2?=
 =?utf-8?B?MXR3YS9RRldSN3BjYUpLNmRpSUdJZUxWOWUrVjFueGYvY1FFU3VITHRGZEl1?=
 =?utf-8?B?cGFXK0dhMkU1M3JGeEIyTytxTmt1QzhPZjRLcUVQMmdjWnZNM2dqcjVaM1Fp?=
 =?utf-8?B?M0VXS0Y3N1FibTFJSnZrZ3JHTmd3bGZ1aWRmVWdhUlg4ZG9hejNwS0FXYUpT?=
 =?utf-8?Q?6F8ECej1PSHzkin413myfkSfy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4426eb74-bbbe-4026-7855-08daf486428f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 10:17:50.6934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Wte0VGriYzipz+MMyI7qZ7cNKtdDvPTSDxXAfLH7myCoJkuznVAZHbLFgEjCD46g3Jwcddgd2odhfbE4iGLrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/01/23 21:24, Pierre-Louis Bossart wrote:
>
> On 1/11/23 03:02, Vijendar Mukunda wrote:
>> Add wake enable interrupt support for both the soundwire controller
> SoundWire.
>
>> instances.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
>> ---
>>  drivers/soundwire/amd_master.c    | 9 +++++++++
>>  drivers/soundwire/amd_master.h    | 1 +
>>  include/linux/soundwire/sdw_amd.h | 1 +
>>  3 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/soundwire/amd_master.c b/drivers/soundwire/amd_master.c
>> index 290c59ab7760..2fd77a673c22 100644
>> --- a/drivers/soundwire/amd_master.c
>> +++ b/drivers/soundwire/amd_master.c
>> @@ -1219,6 +1219,13 @@ static void amd_sdwc_update_slave_status_work(struct work_struct *work)
>>  	u32 sw_status_change_mask_0to7_reg;
>>  	u32 sw_status_change_mask_8to11_reg;
>>  
>> +	if (ctrl->wake_event) {
>> +		pm_runtime_resume(ctrl->dev);
>> +		acp_reg_writel(0x00, ctrl->mmio + ACP_SW_WAKE_EN);
>> +		ctrl->wake_event = false;
>> +		return;







>> +	}
> this is surprising.
>
> A wake event typically happens when the bus is in clock-stop mode.
> You cannot deal with wake events while dealing with the peripheral
> status update, because you can only get that status when the manager is
> up-and-running. There's a conceptual miss here, no?
>
> If the wake comes from the PCI side, then it's the same comment: why
> would the wake be handled while updating the peripheral status.
>
> What am I missing?
>
It's a miss. This should be moved out of slave_status_work() even
though when wake enable irq is received we are just returning
from API.
will move wake interrupt handling in to a separate helper function.
