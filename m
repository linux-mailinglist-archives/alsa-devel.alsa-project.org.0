Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118163C6A65
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 08:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7573C16C9;
	Tue, 13 Jul 2021 08:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7573C16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626157198;
	bh=7HoRlMV73iU23aJ32O2ErNrRY/e6aCJBYptiQKZiitI=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QzHMUXCaG3PwZ/2VXxrrvMRIVTctAYZcdggdULST1V7+W8bsW8xnl4pRAJhFrepyK
	 WACjjGi3jfv4WYThmBZ4PSuMOGJsaaNELGHC9yUHVggAUIU5HLXkKrwb1+7pz891Zz
	 n21T1YGJsf3JqhysbIHc1pNkums4aIqtF8K+aylk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D8DEF80240;
	Tue, 13 Jul 2021 08:19:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44015F80229; Tue, 13 Jul 2021 08:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS, MSGID_FROM_MTA_HEADER, NICE_REPLY_A, PRX_BODY_30,
 SPF_HELO_NONE, SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63A89F800D3
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 08:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63A89F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="AnF6SF8e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/vnGM5aBzXI60qna2naGYo5g6WPjz7B7Vb0SjvyL4k4xBE7FF1QuYfP1sUEYzVlxEeAep1iYnBWkJnat4KpphTIoGonXrGu5yMIameseuqMzmn00/X5t/TZj0WtCUGPTiFahaMQgQzHsm0PO4mNpA383t48hlPqapa2VFk1fszm9o+QGURsmf6aSFe1iOJOTEk6kZeR4EqNK2M3rcRtAc7WUkeYMcwOnE1m32aSVayLSvBqkARKelU6/RGzWYGnP4d5AvZkiqnTBr4W6lcp8k8VJziyn2vOV+/vfUv4HYhPmuiy3mvdFCckjjK+R8ELt6ySQqdoWBpr6sITxr9YfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQi+819a9cNHGO7FNSWIaP2uSBPyWHer/AW8ZyRdyNs=;
 b=nXRdEjCWDG8K272sYHQO1dNi/fv8HZsNYH3WFu91Hs2Kd8SrMxSvvAhhxxWmQwo7KmGQqcPQ2b2a9p4YsroYzn5bM5V1r4nAIrlYSKq9geFX+ea4Agb53TdFrEkgxbgP4dhz1rSTDkcfZR56/9Z2NY9A8UNkDpqOpjoYL5691qq2czpBL4I87gHyMe5onHWO03AJTHoA1ksVdrTMke9GXuQv8VaVPuRFX64+fDsba1j5tXctEA5WfHg/ANFMC5In6UxwYwvNyLrY76hTxKx7esugrEu40u9wb+wsXkjGpdQD41hONfp4kQcILIjXfsKfCFh5c3IDlsvFJjbcOba19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQi+819a9cNHGO7FNSWIaP2uSBPyWHer/AW8ZyRdyNs=;
 b=AnF6SF8e0r9szk33Q5iU4Z8tLwN8QMF/241/z91f+onjrZWZnTg9piNdzdqr0yP9sbTi6bzeekwm8f9IFve68Eki4ZxNlRPvLBZ8AJ2VDV5+kYRhoeqn0SLEdNJ4Ag/FqYIp+EmBrYvLHXMHZkE3N1OgShmA5zwyy8/kRXaZ7Ac=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB2559.namprd12.prod.outlook.com
 (2603:10b6:300:e0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 06:18:57 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4308.027; Tue, 13 Jul
 2021 06:18:57 +0000
Subject: Re: [PATCH 10/12] ASoC: amd: add vangogh pci driver pm ops
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-11-vijendar.mukunda@amd.com>
 <ce03f4b3-874f-a286-5523-7793722a6ee7@linux.intel.com>
 <b754ef05-065d-ee7b-754f-1498f7c6cff6@amd.com>
Message-ID: <38def9e9-5161-9441-c88a-43b21edfec43@amd.com>
Date: Tue, 13 Jul 2021 12:06:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b754ef05-065d-ee7b-754f-1498f7c6cff6@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.129.29] (165.204.140.250) by
 SG2PR03CA0112.apcprd03.prod.outlook.com (2603:1096:4:91::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 06:18:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0837efd-a144-4324-a4e0-08d945c61879
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2559CF38F27D476DF2772F2F97149@MWHPR1201MB2559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rh+Rpo01ndArtDpJXT3KPIyaVbHm3o9xshULJIuHZ32qkqwYB1cI7ENzEE+3wtpBJ+VzIEbswllIgmdjWJBwsDv7tXVYKbLicuJSaHAiD/Ism50EKo35+u2xBYO4yOARbD5voc7J/QH+NO9IV1JvpAiePWr9LnqN+KaYxnULybMYLmVwXk3wsG1RVYRSq7Zyu0JlYr+Plwk7O4giFWsWWAYQTbWnToViTtzkL4CRkAYKUdF9JlT99h/oa+hfDW86qPPEWMWsqY9CEMkkoH4MDH+Mg1+KX/YnnKB8idVuAt7PNUzlswB+y3I06esLTpTqdnKncTOOfXqTtNJ1waiY0G4koDw/H28rmGR2B55eIW8h34vRvCA0LAJOr3kgwUKPB6Il9wzgiPGwp+kR422DTey5kwJTlKc+NsMMtOvxDAMz0Ur7QOCHN2sEMmxS7Pjnmf5ZOnrv82V4aBLdE2Z3AXFoS+gC1AduE9Oc6Q8hqhKHWKwKIVSnHBL8upDajfG1j3JbXCCRzrRCh/r6t4PR6SYBTUC0EdYG6CNxyxsv/nESCfRqwGb5H03dioU6aSK3QzFqF9F0K9N5E7ArlOA2iwUrbs1dzrAlBg5OMlsOgFtGIxUzfppPSpCICJ8IdAwFi7pCHh4MeltpnuNBnLuxlQElkd07iwLejVZkPLhcz2UAsIolYMkkrAHYrikbeSZAqz4LB/yvUpRN35EPuhl1hdTWi768Xy/d81LZrKO3BlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(31686004)(83380400001)(86362001)(186003)(66476007)(66946007)(54906003)(66556008)(4326008)(6666004)(31696002)(38100700002)(5660300002)(26005)(36756003)(316002)(478600001)(16576012)(53546011)(8936002)(6486002)(2616005)(8676002)(956004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdUZmhwaFFiTkJTWThvMzcyOXF3K2czR1dCVHFUUFFWNHpGdmNoanBnUnVJ?=
 =?utf-8?B?ZjExOWwwb1BIcmM0ZTh1L21TOUU2dGVnMkxzVVBaaXpzaDdqUlB6SXhMUy8z?=
 =?utf-8?B?SXhLcjZzM2laYVNQRVZ0RXpFbEVaVVRsaThjWDVZM3puZHdmYzM3WWdxK2lR?=
 =?utf-8?B?enR1c0IxRktjY3FiVHM5SUc5dDJObkwvajdUS0dobzMvQzRzT2FabElYQkxB?=
 =?utf-8?B?YndaWFBWVHlsdlRvbTJLbytwamZ1cEFZR2F0MEltRXU3WHN4d2RreFNuaDFK?=
 =?utf-8?B?SjNOWi9xcGJWSGE0QytZcG9vTjFLbVNBNDF1Q1RKbllmS3U5bllhR3V4VWVW?=
 =?utf-8?B?SlVURW5jRlZCamdKb0ZMWkwzSVpQbVU1YlBlUFdGU1lTRW54MTVZOE5BdGlC?=
 =?utf-8?B?L0UvdHF6NVRLVndIMy91ay9PTjhEQ1A3bCtLMUVOVU5RNkNuYzc4ZVFybTlR?=
 =?utf-8?B?cHk1cXJrV1NCektDQUlkNzRHMisxRXZWQ3JYWHlMUmgxREJ2MDdYbVpQd2ZL?=
 =?utf-8?B?VFFtcHJuWlFtSVNBbUwzd0xlODhtNVBldEUwN0diSk1ZbUtQL0dxU21aNzc3?=
 =?utf-8?B?a29LYnVlNjRLTUxTTTdUaXNWUDNyS3RJR1QwSThDc3kyR2tMMXk5VWtTQ3FF?=
 =?utf-8?B?WHJ6MUFoRVEvR21KM1k1UWhYbjhCY05weG5PUUJOZFVFajlzRWlVa3I5c1lM?=
 =?utf-8?B?NmRpam93bUEvMzRNRGN5aGtFSkYrYkxkQndCRUQwRW50S1dxNDAxYWl0em9S?=
 =?utf-8?B?Vlh0cWtTUW5sUUdoWkhIR0Vub3RBNzlHNy9pTExQcFFvK2Q0TFhQY0xMYWZt?=
 =?utf-8?B?YXVhSlFLekd5SHdrNGNNRjcrdjhidE1PL3FkSldsVURVMzVOK25NWFBHYkhu?=
 =?utf-8?B?bE5sc3MyeCtQcFFHTm5YRmovV1IxZ3ZjaTdpbmdMU0t3OVR5aGM1T2JNU0ds?=
 =?utf-8?B?L2UwR3BLRldFZk01ZUdBTmFlSTVQWm4xSWw4TDR1V2QxUFFwYnRZQTE2dXZZ?=
 =?utf-8?B?RkdOc1pUQVViYUJlVjdPeTdSbjZLdWdTUjRtMWtPTTJoaFZIdmNOTHJCNEEz?=
 =?utf-8?B?dHJCb0NwTUZZL3U4S1NaMWZERWc4SWdBcXVqMEc1cjVwcnNTcGRUZStyM3M1?=
 =?utf-8?B?YVFSSzZ3OW81enNkekdicjBYazhsMEFvTktKQnUrRUJtUmFNVlRmOGIwSXRy?=
 =?utf-8?B?Z1VOUlJ5Uk8zUTNMVEE2cTFmSm5xNjNEODhIcC8wRDNOSlljWEFGOWpidWJ2?=
 =?utf-8?B?dTV4MGt3WUR2ZHJ2MjdHV1BxTDZKS3NHZlRiQnBXZ0EyTGtwZGlrWWJ5Ujc3?=
 =?utf-8?B?QnB3QlltUktqb0l5bnlHSkNsNDdmZ1NXSWhJeVBZemd3M04yb25jL1FkRlJX?=
 =?utf-8?B?RFlWVzRRQ3U5T3o3MzNjM1F0anNKZS8yOVFsVW9VZGJ4bGFITUdnRWFnVWpi?=
 =?utf-8?B?ZDdLdE1YemxCajc0UkVyb0JnbTc5bmtTNlpiVys4OVFoblltY0JacG80N3h5?=
 =?utf-8?B?NWRvc1g1eWVEWUwrL0ZiQ2JkbWk3b0E0M3h5aElJRmg0ZWZncE1OcysvdEZJ?=
 =?utf-8?B?NENaTXVWMlh5Ty8vc2ZXU29CU0FjUTVmRUZYSk9tb01teVJLeTEyRXpEUzY2?=
 =?utf-8?B?M2wyNmRBU1ZSalFwa2dhSDYrVkdNWWFXWWR2VTA4ekQyU3BBV25HbHJRY0Qy?=
 =?utf-8?B?MG1CRjJtUk9JWXpjSXdkQjBvbWV2Qy9GRWM5NkdCUC83UDZ5ZVRodENsM0VL?=
 =?utf-8?Q?rrF1+HcRpJnkAtXooLW8ysRrqMHlbeWg3GTRlOc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0837efd-a144-4324-a4e0-08d945c61879
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:18:56.9530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5U80zAXyr5UL/fNGnjSciasjJQB5j++Sg6I2kdKi5OSw0R0oGJsx41rr0/58sqh2PZ4fIOUHZXaTqCWbpxoE4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2559
Cc: Alexander.Deucher@amd.com, Takashi Iwai <tiwai@suse.com>,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 7/8/21 5:11 PM, Mukunda,Vijendar wrote:
> On 7/7/21 10:04 PM, Pierre-Louis Bossart wrote:
>>
>>> +static int snd_acp5x_suspend(struct device *dev)
>>> +{
>>> +	int ret;
>>> +	struct acp5x_dev_data *adata;
>>> +
>>> +	adata = dev_get_drvdata(dev);
>>> +	ret = acp5x_deinit(adata->acp5x_base);
>>> +	if (ret)
>>> +		dev_err(dev, "ACP de-init failed\n");
>>> +	else
>>> +		dev_dbg(dev, "ACP de-initialized\n");
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int snd_acp5x_resume(struct device *dev)
>>> +{
>>> +	int ret;
>>> +	struct acp5x_dev_data *adata;
>>> +
>>> +	adata = dev_get_drvdata(dev);
>>> +	ret = acp5x_init(adata->acp5x_base);
>>> +	if (ret) {
>>> +		dev_err(dev, "ACP init failed\n");
>>> +		return ret;
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct dev_pm_ops acp5x_pm = {
>>> +	.runtime_suspend = snd_acp5x_suspend,
>>> +	.runtime_resume =  snd_acp5x_resume,
>>> +	.resume =	snd_acp5x_resume,
>>
>> use SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS?
> 
suspend and resume callbacks implementation is same for runtime pm ops
and system level pm ops in ACP PCI driver i.e in suspend callback acp
de-init sequence will be invoked and in resume callback acp init
sequence will be invoked.
As per our understanding if we safeguard code with CONFIG_PM_SLEEP
macro, then runtime pm ops won't work.

Do we need to duplicate the same code as mentioned below?

static const struct dev_pm_ops acp5x_pm = {
        SET_RUNTIME_PM_OPS(snd_acp5x_runtime_suspend,
                           snd_acp5x_runtime_resume, NULL)
        SET_SYSTEM_SLEEP_PM_OPS(snd_acp5x_suspend, snd_acp5x_resume)
};

where snd_acp5x_runtime_suspend() & snd_acp5x_suspend() API
implementation is same. Similarly snd_acp5x_runtime_resume() &
snd_acp5x_resume() implementation is same.
>  We will modify the code.
>>
>> also not clear why you don't have a .suspend here
> It was a miss. we will add .suspend callback which invokes same callback
> "snd_acp5x_suspend".
>>
>> And to avoid warnings use __maybe_unused for those callbacks when PM is disabled?
>>
> Agreed. We will modify the code and post the new version.
>>
> 


