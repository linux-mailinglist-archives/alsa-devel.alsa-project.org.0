Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C33CAFB3
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 01:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A091672;
	Fri, 16 Jul 2021 01:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A091672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626392012;
	bh=WwpufltFiavXEIX4oAlptwhUZEHVlir1YBR+WBt0V+s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mxvxTzdD63J5i38yjucZ6EcdIw3mtmbm4Eexhm9yhsOjSEN3EoZFGpM10n7smKZNs
	 GV7666qhzOxjVKeQAbRcTjZnvYfh3LrTnx3tOCQmQQLjNqfUQW8HyTJRYtwmlltpsL
	 AY5wFV2LBizAF/mf93YFq8NDi+Ba3SPq0y8J2vGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C66EF800D3;
	Fri, 16 Jul 2021 01:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D63F80217; Fri, 16 Jul 2021 01:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3128F800D3
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 01:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3128F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="XO47IIFm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK2ulMJcGlAAPpviNulNU/geFFmSVz87SoT+hAKNdmbWG0VViUKdcCITvciZrl4CU6BEqFxsOdVACpoWAh3DhCP3bcq0hQ15qwuSBY8eOl6EQELtugucsIiEEmsvk7rdFsEflmF3XJ6kFjZuV002PXKYhrc1Afer3oOMZ+1Ka+vP9My/cptFdefcCTkAKVFqQqYzu+UhA4OANSOpY3A7HgQuNuVfXHxhJHxTqxkrjXSq7tvquw2XhI/BdbDA7llmYRTL+5BEOpjxpJ7WGW4PRtbm9pAZd+BDhqNWuEWed8qlM5BLpiEYqy+DqD/TF49ZeYTysVDOMGYT0ErN0z3rgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj/fkqth1inUhe9kNBOMZAxCLXkmeoW16RvloIVbq9A=;
 b=kdXle/2UZ9LEaH84rYWUoiDm42E4x4wY1Ot6mbc9fy053TL1CAl5sfSEsQJGj2pNzbxG0SLo8h9Z6/v2wULbAokcUAn0VdF6tHOJ/d2LimmuESTxPCMR6uvRY/w4uHWG35Ymw25IhqLLeTkBp2sI5hJmWzFbj6fly8t1Q66aCVOgLshjzHcWfpJEdNfjm7jTFsb5uFMqEjLcOBXbTDsoQAh2k3wWCPgGeYJcjrnIYW/wkhHoMfq0a925QtyVshBUebFkDnhiYBP8HykdwHrf+9JgM9V7Ockw+07EDmn5VXfXQ9ZiZCni4qRUIYvCAebwApEfRfVgoYKsF18IVHkzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj/fkqth1inUhe9kNBOMZAxCLXkmeoW16RvloIVbq9A=;
 b=XO47IIFmMoEVd075ywp2za+2VcXtHZYdYolpsSkspZL+8LlXbmnTAK3pRqNjlxxMyws2r3gpJsqC+iiIjRA5nxvNX+EZ9U2lHn1gTx3E20cQXLzj307daQEPgVIaerX+ibYs983D3gWA79clPYE61kEl8Q+Bc4CGDWQyVDO/9H4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1582.namprd12.prod.outlook.com
 (2603:10b6:301:10::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 23:31:46 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.022; Thu, 15 Jul
 2021 23:31:46 +0000
Subject: Re: [PATCH 10/12] ASoC: amd: add vangogh pci driver pm ops
To: Mark Brown <broonie@kernel.org>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-11-vijendar.mukunda@amd.com>
 <ce03f4b3-874f-a286-5523-7793722a6ee7@linux.intel.com>
 <b754ef05-065d-ee7b-754f-1498f7c6cff6@amd.com>
 <38def9e9-5161-9441-c88a-43b21edfec43@amd.com>
 <20210714162339.GD4719@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <9f32082a-2f8e-d36c-d409-12bc10e7126f@amd.com>
Date: Fri, 16 Jul 2021 05:19:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714162339.GD4719@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 23:31:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad9bda93-7f35-494c-6a6f-08d947e8b5d5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1582F33A266CA23F66B1504597129@MWHPR12MB1582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cttjECAdpA7Q6TsHH2jkdUqdexxuXbW7h+8+kiDL8odZ3RbKeaEqtg05hC6gAo0KPnuTIqTX3l0ZPzZkQgfN/8rLoVgBv7anImM0aXoPQG971PyKfkvLlEMGY7A/5ikFWZXCpJocLx1+In9pHQcTq4eU8iVsK4wGaoGAZ+tn9jpjT8j/rdX+MB2Mebv6c1O1ufp9ZAXCrAzZ38k5tZshfpd9Fj725ikoWBWV3IxX8os1nhRjNUxkREgCqpg/t71PJK4kqvFkEsgXANXd0ONenspbkM3Igkk1GO9vxoqNsc0TM/t3Zoo/D7MzFIALUNuTCdPxKJJevIkYtibG4s5N4j7ws2bTb4IjSVL933HwmLuKRAPF+oHaoVmOY7Y2Y/QD+0I6d6zQQfMpXOY1WNxnhXoRQR8UWGULM0Nq/uRn8Za5zybBnVlVNhMLu++mCvmd1ve4C145+/95FOdUYNnxQNYiCWxh/QO/HAJgEjpUMN6iaBvnFqv0MuqKKPYiyMU7mw8s/CIkjkU8HgeBV2GdKzwEKW2Z9VTSEjxcXA2QgZR4lVuuy7/LEgwGOfpbkgMkE1AMTVUVS2b4LakpaE5k22GFXRSohXEx9BrOKUz4lSXf0qLUnQw+YWOmr7rMm2qyfIc8Z2H+ShLkHmH1uz4ArmgyZP1AS46LXJIOJ6UQqtn+oW63AZ8VjrmVIAy7S32VwNWPOTEPr+5bF6f4/Hio1dcbUkmZ1T3mOR5rHoF5OVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(4326008)(316002)(5660300002)(54906003)(2616005)(956004)(83380400001)(53546011)(8936002)(26005)(36756003)(186003)(86362001)(16576012)(6486002)(8676002)(38100700002)(478600001)(2906002)(6666004)(66556008)(66946007)(31686004)(6916009)(31696002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?z0X+dYLm6XSNbpi4HFRnoBqgRhpJeliu+9i7OldSg5HlDEuAHiGaOtPm?=
 =?Windows-1252?Q?SUdF2JnxNWH9a4OzniVmVnG8R6si1WZ0lFTWwI4ejimYSbet7kwv+ZgF?=
 =?Windows-1252?Q?j9JyRg8I9T6lUkpBWEhAuj1UQPt2VpHnXuaWaWV7Btw8NHLTvG8IYwb6?=
 =?Windows-1252?Q?4bzRp2UV9BE2YFlF5xe1LL6NnfO4mz5Gsqn9zgWQmqvRQ26dXrgByKTx?=
 =?Windows-1252?Q?UzoNiNXAR4ozpduddgndt5DfkqV6CfdU4C0ZXX0ZF5EvEZe/M7lAD8nI?=
 =?Windows-1252?Q?lTRhBgHsH4jhQvEfnm9/kscSHypm1xoWz/Yhult8JIIszdH6tAphcvi2?=
 =?Windows-1252?Q?dnEpT3GFmhVFONebXQDwxkkxZ7KlxdYzlLnNcXdRS3oH44aM7iZjurrb?=
 =?Windows-1252?Q?iLGvVdlwro3IzocfMDUtiWzyPyMpAEgxrzJfwTJjR6Fn4I0HbtfS4v5t?=
 =?Windows-1252?Q?qHoK1Ncl8qun/qZEzL/hkPcCB2m5hDT93JQ/T6ztmcKxh8rKxB710xvY?=
 =?Windows-1252?Q?m+F7hakfSo+33p3Od/z1dfoaJYE9bqjhmxNcrdBXm20wtst/OwrqzGtW?=
 =?Windows-1252?Q?57uzFBM2wtD78gl403dCNsYLSM97DxToZbPC2hNJYyqDWzxs7seL0UiU?=
 =?Windows-1252?Q?F8pHlKwk52diE8nZZ0ql9TLfL1/x2Grs+vaqjaTDDOFW3V7/pR1RkrRe?=
 =?Windows-1252?Q?7HakMb1SFTO+AoboKA1z/sCegr1sNALZLHQpLMGiuD54GXVHuvTi3nyF?=
 =?Windows-1252?Q?vEdk4/EXKUBccbnsQ23yM1ReOqE+hBchhse/r0bMR8Iwa8QGWi6Y/+No?=
 =?Windows-1252?Q?w+Oj4lZYty9/ETlxJI/8Z/NNIPXS5BhY1qvLS8Ww2E/0nyPX6rw3U2Wv?=
 =?Windows-1252?Q?gME/+0D+uREhaC4bfUj5+wFZMbnBqTkqMumMn12Q8sKQwayQX4s+zrR0?=
 =?Windows-1252?Q?njDknVaWOpNFuvsOeI8Y19utBVP2SEjTf9JEGuCw0atoeJiSk1Tks65t?=
 =?Windows-1252?Q?T4LtokudPDB5XbUMfWsd+rijePDDeDfnA0889kjr04DiLcrbhEApwqDp?=
 =?Windows-1252?Q?/MeS2D3mcZfeXB0IWhzFUMW1Y3x+xdN4zgfz7s4qnTwznYsM5hshuq7G?=
 =?Windows-1252?Q?u5uvlCE6lPX1FAI9jmM8iPa8HCAT6vanmfH6JOHBAVD9B/Dq6yvoCu5c?=
 =?Windows-1252?Q?Rv+4raKXG2R9CzwxRSMHOUHUPrF4JjfhIdTVFDop2aOHvwdnrxSJEr4/?=
 =?Windows-1252?Q?EO0aUrBT2pBkWoGgexliT2zbYm/LdapMj0NJFZTI5X8iLQWpaVZ7hmf1?=
 =?Windows-1252?Q?bqPSxFt+irvS2MDuk6jH6xpxI1M3ngOCGi8iPwsU1nJxlyiHs4MuWnnK?=
 =?Windows-1252?Q?odyfFdhTY+T28WZqWjliwDvYfuVak1dvkPiVCAUTrnKfo6s4UuhiaN3A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9bda93-7f35-494c-6a6f-08d947e8b5d5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 23:31:46.3360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsVyh2n5q1L81KfOx2wt/EF0VQyVYi6d2vWX5+2Nn7ki4uF0baK8HNor/j8fSyB7QyrzyuNMl5pQvIIR3JSENw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1582
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Alexander.Deucher@amd.com
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

On 7/14/21 9:53 PM, Mark Brown wrote:
> On Tue, Jul 13, 2021 at 12:06:38PM +0530, Mukunda,Vijendar wrote:
>> On 7/8/21 5:11 PM, Mukunda,Vijendar wrote:
>>> On 7/7/21 10:04 PM, Pierre-Louis Bossart wrote:
> 
>>>>> +static const struct dev_pm_ops acp5x_pm = {
>>>>> +	.runtime_suspend = snd_acp5x_suspend,
>>>>> +	.runtime_resume =  snd_acp5x_resume,
>>>>> +	.resume =	snd_acp5x_resume,
> 
>>>> use SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS?
> 
>> suspend and resume callbacks implementation is same for runtime pm ops
>> and system level pm ops in ACP PCI driver i.e in suspend callback acp
>> de-init sequence will be invoked and in resume callback acp init
>> sequence will be invoked.
> 
>> As per our understanding if we safeguard code with CONFIG_PM_SLEEP
>> macro, then runtime pm ops won't work.
> 
> That's not what Pierre is suggesting though?
> 
>> Do we need to duplicate the same code as mentioned below?
> 
>> static const struct dev_pm_ops acp5x_pm = {
>>         SET_RUNTIME_PM_OPS(snd_acp5x_runtime_suspend,
>>                            snd_acp5x_runtime_resume, NULL)
>>         SET_SYSTEM_SLEEP_PM_OPS(snd_acp5x_suspend, snd_acp5x_resume)
>> };
> 
> Using the SET_ macros doesn't require that you duplicate the functions,
> it literally just means changing the way the ops are assigned.  
> 
 Will make the changes and post the new version.
