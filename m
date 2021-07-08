Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59983BF8DF
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 13:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604F01669;
	Thu,  8 Jul 2021 13:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604F01669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625743514;
	bh=vRYGbeuydH/Pfn9BIhkbSXV6tb+kpHopoE/SXiTM+dg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AdcIeWNS4A2ypwEwTdBuhUIEJKAeYhdp/JjGrqprUh5+uctzylOATP3yYuTc9X6UL
	 tCmO8vGsr0KhuegQhdIMwK3vVK7UiWse7gGiTwhg58BfBo5YnisfaPM9QhWn4usfRk
	 T7+emzPaxBYl0tLYSBjzorMIYDF7CpWm0Jlkx+DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED0EF80259;
	Thu,  8 Jul 2021 13:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DB88F80249; Thu,  8 Jul 2021 13:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2066.outbound.protection.outlook.com [40.107.96.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07EC9F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 13:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07EC9F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="VvCb7u7Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDff7bFdyHhF25SB266XiXzrCBO9iGYLWlelM/yfOmTwRFQWyCBTeYk75aCuG1XHTBrur194hXuglvSXv8sz3irKdIIKlcCXi4Qpb/JJYQ428IhKHd19ecyo+9c74dZFjuevvXXScS2+Gc6yiG0CzCqS2ixTyUo8A4htVlwrYnZ/YhL4Mw20UdKuEDeAEr62sRI7L2uEcMSpVrnW0CAUqd6D75lwMvvHvH+XLIedZHdNizletBtOjCXkmA5n8xnLRD2oR3bYFS/5RH2+Q/YLoB56sBepzUhO8A4S3G1pq9N6ogFchW4N1UjQtclNXz2NEhkiHPgqd+9dL0mJTQlkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msYkvIjgwDZ+/Q6Me7VpUx4fJI5IhJVsHDf40cYWt7s=;
 b=B5g/6248bI1bCVSCcExNDFcqss0Y/sgybN7OUJkCwuQEVmgE67jQ3X+sN6CxLL+Te9E31gHo8cL5bNSyEAxMxc/lS3Q7YxeGrbXEQuA6hEkMxpE9oylyqYGWd45i1MO46XuYi5HyXO4N9gZk8TqXNdn/sF5ee4Mq3U2vx9/ZN17SUvYBxv1d03A+WHDiw6s/asew/7QbKezT4YZAfzRn0fdju2Gt/lP3uK8dXv9sknaJc/vYhmmBSeZHKZiL3owjHjarH3gY88amobRSi8vwEA1ulLWRPdIQPEFnwptZm8D1R2PLTBqvBLUTswBaSJIQaQmlNysUL8ri0R07Qe4ZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msYkvIjgwDZ+/Q6Me7VpUx4fJI5IhJVsHDf40cYWt7s=;
 b=VvCb7u7QXDLG3qwRhnqNH/4IBj8d6oO5qKJ2rDnfWpc0kDvfLwYh+5P8c6hGKP1neyAy0v04imXhNuLvT8NgfpH7RTlgJau2Gn95b6bH1W22hFEjpIniUiiK7lQAsK7rdrBndKaRX22tVPlK0NmblVVw6J86fvKHlQkAKPxmVtE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1725.namprd12.prod.outlook.com
 (2603:10b6:300:106::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Thu, 8 Jul
 2021 11:23:36 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 11:23:36 +0000
Subject: Re: [PATCH 10/12] ASoC: amd: add vangogh pci driver pm ops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-11-vijendar.mukunda@amd.com>
 <ce03f4b3-874f-a286-5523-7793722a6ee7@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <b754ef05-065d-ee7b-754f-1498f7c6cff6@amd.com>
Date: Thu, 8 Jul 2021 17:11:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ce03f4b3-874f-a286-5523-7793722a6ee7@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::34)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 11:23:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68388359-9e05-4f06-ced8-08d94202d3a4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1725B06E630F69AC7F0B4FEE97199@MWHPR12MB1725.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMnwxg5FL2Bx5WH27D8zlZR+VcpLi/fKcsQ1tZDrKdqu722+1f7g9QFZR9j+KZ6Vlv4lA58dTYLt1ipJ1mQdyf1USJujrwbbILaJ9o4ziVatfnPxUOwvJWBDX7QlFyRsFd3g50H0HORPj7DIxTJmPq41fFzdCEFxGmhibPUCKJN4On2O8Cc86jBMHLokGU4MwT8vHu8ttPMrum3cNkoiSAJP0haSCoNMcxwDGRqnocwZKx4KKiBGXC9Sso8eR2PU34A/kJCB7amE62oDjdl4/tCHtBJ3c//s66se7FD8yHJEXacXOwwZh7K5eiMB2FB/zaG/IODAYd4+L4Z6Qq20bWbYYNZs3dWqYeRwJZtRDvzcmh6t7JWZLAAy24TUgM8zUjB0nXsCt33mJ4ROqLVtZAJWNsxaZB3yNl7GK1n7nV0gsTwUDGo72FQliCaD2+ciO0p5oI8/FBcL+gyi3OvWJy+eKF4M3IPkwpFaNaFSBudn2v9x8etSOa1uK3Xps8CUY4qTpTg2XAScccVznzmh+8S8kvnmRopXy4ln9NLDVO27DmOqZhIhVjALE3LPkxSuQU3fqn1iXXbdds2m7cJFYkUO9B6aeG4E5SlqbCODpJ3qFbE+lutLE28HcYZpnLVTg+W62QKclJSjpodUwKStwOgmQjnI6np9eNCu52tp2uIxqRimuJO9LfXapPRLbvLhtdRTthTBKbzSnhcahJXpeaYnNrrJ5lqMQ+Nu5KdyIrgrpa4CJli3ddtlgriwFr9n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(478600001)(5660300002)(16576012)(2906002)(53546011)(316002)(31696002)(66946007)(8936002)(6486002)(956004)(4326008)(186003)(38100700002)(86362001)(2616005)(26005)(36756003)(83380400001)(66556008)(54906003)(6666004)(31686004)(66476007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0x1RElaNXEvTVRyZDN1VWhyaXptcnkzNlcvUDh6OEY0SkYwK2NlbjltYkNu?=
 =?utf-8?B?MjluQUcweC9SVElXMUNuQkNDWU1SSGluNVJFVUQyRVlkQVJNL2RFbVVoRUFB?=
 =?utf-8?B?NmxWZUxYNFdkb3ZhTUlPVUlwK25kNlpJK0s4YjJqK3l6M2dBWXozYzl1Tm93?=
 =?utf-8?B?M2pJODlmbzBHV0pRMzlpdzNRVGduSk5aSENCQXdRdzE5emJqNE83b2plVXBW?=
 =?utf-8?B?YXJibVZFU09aeWpNTGJnWVYySmhISktUUjNOUk1FRzBqTlVUMVpReS8vV1BS?=
 =?utf-8?B?c21HUS8rRzB3Q1JYcXowNzhsdnZ6b3UyTXlXT1R6UmxvYUNxMXBBTlNJejZW?=
 =?utf-8?B?NDR6OGlyOVhVN0Y2ZFhoNE9rMmV4azJ3MGQvVWQzM1NBdjVmQWQ5aFBUeUpt?=
 =?utf-8?B?bklMSHVyVkVxNzlrUmxVdllDNWV0bktVUEpsaTZwTWJudkNUVnJ2N3FKUk1q?=
 =?utf-8?B?VHhmK2MvS0FHZ1ltRG9zekVSSXBlKy82WVhXbWRqN1haY29UNWxGRjBBUXdv?=
 =?utf-8?B?TmdYM1loR0ZkUGRqcUVkWWFFaHpobERiL0tGdHcyZzI3RyswYklqMmtpU0FS?=
 =?utf-8?B?TVhucVJBY0lkVkZRUk0wUWl1SHpMbG9hK0Q0ei9XR2pNM2pOY3RrZGNFUXQ1?=
 =?utf-8?B?d0ZtSkR5cW8wVFNNUWNPMEZHdFprTHlPUXduWWlwSUJVOWEwU1JibUNFVEZ1?=
 =?utf-8?B?YmEzUGt5T01xaHVYSmZjTWIveitLNjBHczBhUWo4NldqR3ZOTlBjTlQwUjV3?=
 =?utf-8?B?YzNBSHFWRk1RYXRGbk5lRkxyam5NZWJGTm5EYkxzUkNwM1B2WldPdU9QUjhz?=
 =?utf-8?B?aERkdStLYnQ5OHlEZWlDT08vL1VhMEFDZHNUdWx3M2xDeGZQbEhqSWdaRGhm?=
 =?utf-8?B?UlpjTHpSWTJMVDA0Uk16cTlwMTI2NlUyVHF1bkFVM1Y3VjNJTVp0K2ZuaUlD?=
 =?utf-8?B?cHBOL0ptL0dKTXFxMmxORGZJdnhnNDBJN3RuNytUbGNEZWhyd3hjLzVUaGpa?=
 =?utf-8?B?aElmSkZmaXFNampTb01PdHNqZHIvdmJwbHFHUUhmWWkvUnhwNGFITnNzQ0p1?=
 =?utf-8?B?WU9LTW9lTEoxWUQySXFaWjI1c2lKNjhsMzNFb2tmVVM3aWt4emdaZ3R4TGpG?=
 =?utf-8?B?c3NLcjhNRFFSb1plZmhsZFFRcThnRlh6N25NcnM0bGpTaC93UmZYYW1xVXJU?=
 =?utf-8?B?anJqalo1anM3K1UrT1JtYncvNXdvN0UzSmx6UzJhck9ublFOV1ZZU0xId2ln?=
 =?utf-8?B?YjlTQnRqWFNVOVhBa1pRK3VROWJRUk9Gd2ZFSmNTVFRJckNlMGhJVmEwL1NJ?=
 =?utf-8?B?M09CZEk2MHdiUEd4SG5sakhmRnU5bFdJTXdXOU1JYW1namZoUnhRNXl4QXVs?=
 =?utf-8?B?cUhFSUhMMU5HUDNTcHNQRmczMjBXQ3MySncycUY1UkhSVm9BRkpQdjdYZk1M?=
 =?utf-8?B?dkJCZHZabVpnV1YzZmtJVUhxcURFSFpqanlPa3g4dGFHVExzZGZzZ20yQkVQ?=
 =?utf-8?B?akFtTk5VbFpNaEtGMnhGbktJY2ErM1hkS1p4QmZHSmRVVG0yV01UbG9qWnNI?=
 =?utf-8?B?YnJRZ1M0aWt6R1BaaWEwUGl0UzlYZk0xeWlqcDlvYUEwbU9wKzRISUpTUExZ?=
 =?utf-8?B?R2pEQ2NnMlNWei9YSE9pQktKVnRTTVVCOHNVQ016ZzFrVkFlQU9GakRNaSth?=
 =?utf-8?B?NmwxWmg5dEFreFZDSm8vNjJBcm1KZXZscGZDZi9URnBabXlGK2tGcGNjZ2E4?=
 =?utf-8?Q?eM4pAENLIdKqjh0LvfzJtrYUmA/3TbXlvmfMM6B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68388359-9e05-4f06-ced8-08d94202d3a4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:23:36.0695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUtI+21EKk5YAAnigKBt4h5laOw832JLIK1xQJs4TpeeXqWJNbFZYqiWjMz7IwTxGh+zn7Q4FwNfPSggH5YwrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1725
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

On 7/7/21 10:04 PM, Pierre-Louis Bossart wrote:
> 
>> +static int snd_acp5x_suspend(struct device *dev)
>> +{
>> +	int ret;
>> +	struct acp5x_dev_data *adata;
>> +
>> +	adata = dev_get_drvdata(dev);
>> +	ret = acp5x_deinit(adata->acp5x_base);
>> +	if (ret)
>> +		dev_err(dev, "ACP de-init failed\n");
>> +	else
>> +		dev_dbg(dev, "ACP de-initialized\n");
>> +
>> +	return ret;
>> +}
>> +
>> +static int snd_acp5x_resume(struct device *dev)
>> +{
>> +	int ret;
>> +	struct acp5x_dev_data *adata;
>> +
>> +	adata = dev_get_drvdata(dev);
>> +	ret = acp5x_init(adata->acp5x_base);
>> +	if (ret) {
>> +		dev_err(dev, "ACP init failed\n");
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops acp5x_pm = {
>> +	.runtime_suspend = snd_acp5x_suspend,
>> +	.runtime_resume =  snd_acp5x_resume,
>> +	.resume =	snd_acp5x_resume,
> 
> use SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS?

 We will modify the code.
> 
> also not clear why you don't have a .suspend here
It was a miss. we will add .suspend callback which invokes same callback
"snd_acp5x_suspend".
> 
> And to avoid warnings use __maybe_unused for those callbacks when PM is disabled?
> 
Agreed. We will modify the code and post the new version.
> 

