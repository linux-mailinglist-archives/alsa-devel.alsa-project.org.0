Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C0D3CEB38
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 21:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFBF11C;
	Mon, 19 Jul 2021 21:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFBF11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626721432;
	bh=Fg+P53sxKgk/f4sq03BYSFiz77s2e0hpjodT/nEvrRI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwZm9R22kbpvKDckeEARAw7/zdripmCaJa+S1rUKRnbC8gFH1aap6zNYGvA4/6FaZ
	 K/uKtiosBEDWUkMuv2XMf62fx3hvDUE3RkZHXGamWWrhFLrzBC+aXano4ZvnLYvi03
	 Jemw/3ajEx3GEnGTZak69VD/7OoZTuvep+6iVk+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E330F80256;
	Mon, 19 Jul 2021 21:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 979BAF80227; Mon, 19 Jul 2021 21:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59A72F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 21:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59A72F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ams0gc+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm6rCQgfPzWVFn0cHaQzz8HNyMIUWVw95egxcwrmfdm7AVs8Z+vmittc2FgsoFB1utiVl3vMtmQdElDmj0V+8q7PxpzkGVAAb/wUTCYHPYmKFs18bYKWvE/G4UiqLv3z76BUzxGLrdxyE0R15ibPRNnVWj9LMu8prri2AU8HxS1IOTD0QmYixwt9hB1vK+ZWmu0YmQlEOtFLCi4+8SmhJCJ9er72LkZt4KZuCBoj0VwIrLIw8m75ZgYPnb06kK4LMMUSgKYQsft5ZvdgJ8gzOwmuwPbhtns1/TEByq+SMp9MQeYSThexse6uZ+apKGiKWn8jf7tTJ1kBJMa9eGRAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+/ReJTzad0e3Z/3adB8u4nFRWeE5eaPCk/KXEy4L9c=;
 b=atulbTYphVOSsA8UCabuTC4OT2MGzZtN8aemsFyhWFKhGoyhyXN6h7HI8wgmwboebiHw1A5L34xgnoaOGuAHVGK4pAU1bAtlHZls8lsbdxBIL57S4mgYKM65SWGf5aAFr73ZslUk6csIgBx7BtZlYYUpTxhRBdgCYjd1QYK1ZbWHNNl7ctt14wQ/fg7av3Fbl83/UxciF0qIrhX7kIAACLG5e+ip1VH9eXXKkCh/YLoqzm6knX0QnoK6BAPPActVx5QM5nL52sXwtPGo9O36rVykWE5040A2BZQwyCIILDUwPp0/Xa8q737+3in0phhEvcCgLPY6t5euWn0noIhkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+/ReJTzad0e3Z/3adB8u4nFRWeE5eaPCk/KXEy4L9c=;
 b=ams0gc+tJNhIHlYe8Vs6rMK7RluqSuogXSnRJ3wpIPY9Vo81InqxhhjK0kU41/6Kx3vSS1GBvEnoJozxz0b4Nwjcq2idCwmm/87A/VKxkwUnIvEi6z26+oaEErgy9VJsdLX4j3w8Sda+JprLzbX0ELGEuUoXHbFaudgVq8csI4Q=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB0014.namprd12.prod.outlook.com
 (2603:10b6:300:e7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 19:02:12 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.033; Mon, 19 Jul
 2021 19:02:12 +0000
Subject: Re: [PATCH V3 11/12] ASoC: amd: add vangogh i2s dma driver pm ops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210719165140.16143-1-vijendar.mukunda@amd.com>
 <20210719165140.16143-12-vijendar.mukunda@amd.com>
 <0bb947ff-9822-a83e-081e-b5456f05d8a9@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <bc29a2a3-e8b6-7adc-e0a9-af21eb2bb6c9@amd.com>
Date: Tue, 20 Jul 2021 00:49:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bb947ff-9822-a83e-081e-b5456f05d8a9@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::11) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.160] (49.206.46.65) by
 MAXPR0101CA0025.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend
 Transport; Mon, 19 Jul 2021 19:02:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9c60741-e53d-4140-2709-08d94ae7b731
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00149405EEDA847766A1BD6197E19@MWHPR1201MB0014.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLCiRQqt0nlsRbynNyUo9926r07I5bakhcv128HMVDwWX18tqF5HW0vR1daG3xnQi5sMYIf+2d2Iq7nrlwv2uI3ERN9zqTYCVr/vcH53RyNh7RlMU6yqlhSvQpAXvEGoscw6BOitsIpsafqUOF4R5MFJ1INU9C/n4oHl3wlAamC+sWGeJhe/IIg9A/rhQj1alOZH0pUDCCYZ1FFBQiWDfNp2Wj6dhVzUY7zSV3xim5XyDXza+xY9AUmLhGlYjwNSVSOLjBBsFtpjfnWsVcE2HkARH67pEpoJ3z6Bwzl3yMJwsAGDLEaper8ewJygI4IBicdXcd+ebYFlpTsN4E1AFnDJ3nQpyvvXIqhT9QSbAS+EAvKvRJT1M7S3YXw1vTEXO7eS6eRKFTWphVjVSNwwI/RvPGUk8VHPE9pKq3d5/Y6ut4DREciBAjzrCPskYaKCdl5g7ZklE76JaVar68E/Mq3Vi/SGxrcyh35GOus/5/IYZ5jdkHqu5egHXvOxES0DRjOzUAHcX3pNn5PNW21PuleqWKxzSPxDvpiTAcmI/GUcj6fZMId+UQjmbyzDcGAM04pyJl+IbL3HRP+H/jmpk9iKLM545he+XNc3XbKn8G0HG6Sg9D+ZB5hcTlw2kQffmHyLHdkHjwnMq4yTrTz6/eLrgVpZxCeGuurBsBxI6fgYC7/Gn60Htk0ts0Gh/nGXpiRvD9+B97kL9sgql4ATxRrXgOJmqSUJ60nrrr22oUIucQdvE3Re8JQk7HhXr8Ez
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(2616005)(83380400001)(186003)(5660300002)(316002)(6486002)(16576012)(956004)(54906003)(66476007)(66556008)(2906002)(26005)(53546011)(1006002)(6666004)(478600001)(4326008)(8936002)(36756003)(55236004)(31686004)(66946007)(86362001)(8676002)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3YzNGxveHNiZ3k2ak5OSktyUTVjRTZVd2cvKzFQZklwSU9mcFNtUS9GbDlv?=
 =?utf-8?B?OXhaQWdNVFBQUTZoWlVCL3dEWC9qZGc4TmNwRUNwTlJDSlQ1TzZJN2krdVQ2?=
 =?utf-8?B?MGI4dnN6UjRIQitNM3hjc3RaNTJ6VVVZcUZrbm5acnpMNU5MTEJjN2Rlczht?=
 =?utf-8?B?UGtSLzRTSWg1OTNPYm8xYm84c1VsN25wUU5nREdoRUxWQjArUW1JT0hhbGZo?=
 =?utf-8?B?TDlIQkpCbXFSVER0eXFwZW5wVGlFQnJ1SUV1UHVxdDMrbFNLWlhhR2Z2dnNB?=
 =?utf-8?B?MDdUSGFYYnRSRWJmN3U5MCs5ZXZTT2hmK0VRNG16K3JuUVJuQnpzcE9rWDV2?=
 =?utf-8?B?VkVIS1pUZzBaZkFrODBJVmg1eXVLTnlQcGRrYWhuNGhsWFpnSUVwVlVvdU5P?=
 =?utf-8?B?ekRJYm9UV09jTFN1a3BLSWpUcnZlSStMTWpNS0QveWN0cEtpT3ZVMis0YUxz?=
 =?utf-8?B?UzMrU3VLTVlRVHByOUJQWVF3QVExSksyRUdwdVJlNktFR3ZGSG1NZGRCZ3Mw?=
 =?utf-8?B?ZnNjYy8xck5pUEs2QXFEU0piWmFxUUhmRVdyZ1ZnOGxwVU5UU3FRSWhnOHcz?=
 =?utf-8?B?ZEY2M1MvU2tPRXFKenlCdjN1MzhsK2tEL0VPalc2S0tTcW1jOEhVdHFvcDFy?=
 =?utf-8?B?Q0xYZ0JoQitMdGxMZWFJcGYxQU5nODBZajZndFNaRlB4eUdwcGlwMFpnbkNh?=
 =?utf-8?B?ejF1czBmVG9DeDczTXFpTXYveHBnaCtxZlRHaUcwN3hrWmpUMnZlSStGemQ0?=
 =?utf-8?B?L3lXb25Ga0tVbkl0aVNhOE5ER2JzMFBFMEhvaVVSb0tsL3NoYzVBOWhMcDNk?=
 =?utf-8?B?ZnZkaTF0ZHVJMkw0MTdZNUFNaWt6ZlpyOExycjB2QzRXbGJuR281d2oyYXJ6?=
 =?utf-8?B?TjJacHFDRDQ2WHFOZWF1RzBXUEJiT1UxMGpTbEV3QUdwTUFVSzA3NmJRRDZR?=
 =?utf-8?B?SkpCeU52UkVpT1JNVHJ2TmQwMHFTMndnU3h4VnViZ0dSeHhoQmV3R2oyeHhh?=
 =?utf-8?B?UFR6YXdVanB6bmZTRjF3cXhqMWRKbVFPRlZQSUtqdlB2TGxuY2VkTUtBQXVy?=
 =?utf-8?B?UVEwcVF0YnowbzBWSUZXT0hQcnVkUUNpNCtmdlBob1R1eUdyRStCZThkazd3?=
 =?utf-8?B?VTF6bnErN2JwZjc0VmxFTFQ2MHp5WDJVeVg3dVVOSktDZmlJMWRJbkUycjY1?=
 =?utf-8?B?bEdSNVRVRTdObEJQZFkzVTVueUFlVXVDaENvYldSTThLRnpiMGNVeFlxTWJt?=
 =?utf-8?B?TE1LdGZrOGcvZlVTdjQxVDRJRjYvdnp1K0tzNXA5QzFNK1FNVG9vQUJaSU9Y?=
 =?utf-8?B?VGM1Q004eTRvQlF0aHdRakJnK3cyS2lUZGxmc0pWWE9JckZjWENLeDIyWmov?=
 =?utf-8?B?SFJzSTZ1c0oyWHViM2xiS0tvVlluLzFjdEpVNXo5WHNPVUFEZmlCZTRHY1lF?=
 =?utf-8?B?V3RFNVUwQWUzdmM2U2U2eDZYWkVnbHNYcEVxanFWS0ppMlRrbUhOS2J2L210?=
 =?utf-8?B?dXNyRHJzT1RRck1qdGNpYlVLdG01c1BzdzR0L1M4ajc4ZEkxOUZoNjJ1NHBa?=
 =?utf-8?B?UldxOTBWUDBqS2hKdCtpVXA5L1NXR1lsZ1dxM1VleDB1YkpJT2JHVHNDUnFY?=
 =?utf-8?B?RXE0WXNhbFNXWmZEOFdzaTVURlIwVXh2cFdiRWdZbHgxcWtVZ3k3K00za1pw?=
 =?utf-8?B?eDc5ZG1vaStyUzJISVVMLzNUb2RqNG8yZnYxT01TWGpQbWFiSUR3RFRnWDlY?=
 =?utf-8?Q?/a4DKXHP/rh6nT9GpUz++iwgJs7BOoU8Vv7qqO5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c60741-e53d-4140-2709-08d94ae7b731
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 19:02:12.2327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cpvi3zbU3bPk27VPuzmzonYPLPH8m2WQSJ9qdlO4j8hOP7rg6ebKO6+lWANKEPrzMOI1Ma93SuxCAc5kQ6x5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0014
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

On 7/19/21 11:43 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/19/21 11:51 AM, Vijendar Mukunda wrote:
>> Add Vangogh i2s dma driver pm ops
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  sound/soc/amd/vangogh/acp5x-pcm-dma.c | 90 +++++++++++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>
>> diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> index a2bd53dc86b9..260b6ae0fb2f 100644
>> --- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> +++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/module.h>
>>  #include <linux/err.h>
>>  #include <linux/io.h>
>> +#include <linux/pm_runtime.h>
>>  #include <sound/pcm.h>
>>  #include <sound/pcm_params.h>
>>  #include <sound/soc.h>
>> @@ -417,13 +418,102 @@ static int acp5x_audio_probe(struct platform_device *pdev)
>>  		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
>>  		return -ENODEV;
>>  	}
>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>> +	pm_runtime_use_autosuspend(&pdev->dev);
>> +	pm_runtime_enable(&pdev->dev);
>> +	pm_runtime_allow(&pdev->dev);
>>  	return 0;
>>  }
>>  
>> +static int acp5x_audio_remove(struct platform_device *pdev)
>> +{
>> +	pm_runtime_disable(&pdev->dev);
>> +	return 0;
>> +}
>> +
>> +static int acp5x_pcm_resume(struct device *dev)
>> +{
>> +	struct i2s_dev_data *adata;
>> +	u32 val, reg_val, frmt_val;
>> +
>> +	reg_val = 0;
>> +	frmt_val = 0;
>> +	adata = dev_get_drvdata(dev);
>> +
>> +	if (adata->play_stream && adata->play_stream->runtime) {
>> +		struct i2s_stream_instance *rtd =
>> +			adata->play_stream->runtime->private_data;
>> +		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
>> +		switch (rtd->i2s_instance) {
>> +		case I2S_HS_INSTANCE:
>> +			reg_val = ACP_HSTDM_ITER;
>> +			frmt_val = ACP_HSTDM_TXFRMT;
>> +			break;
>> +		case I2S_SP_INSTANCE:
>> +		default:
>> +			reg_val = ACP_I2STDM_ITER;
>> +			frmt_val = ACP_I2STDM_TXFRMT;
>> +		}
>> +		acp_writel((rtd->xfer_resolution  << 3),
>> +			   rtd->acp5x_base + reg_val);
>> +	}
>> +
>> +	if (adata->capture_stream && adata->capture_stream->runtime) {
>> +		struct i2s_stream_instance *rtd =
>> +			adata->capture_stream->runtime->private_data;
>> +		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
>> +		switch (rtd->i2s_instance) {
>> +		case I2S_HS_INSTANCE:
>> +			reg_val = ACP_HSTDM_IRER;
>> +			frmt_val = ACP_HSTDM_RXFRMT;
>> +			break;
>> +		case I2S_SP_INSTANCE:
>> +		default:
>> +			reg_val = ACP_I2STDM_IRER;
>> +			frmt_val = ACP_I2STDM_RXFRMT;
>> +		}
>> +		acp_writel((rtd->xfer_resolution  << 3),
>> +			   rtd->acp5x_base + reg_val);
>> +	}
>> +	if (adata->tdm_mode == TDM_ENABLE) {
>> +		acp_writel(adata->tdm_fmt, adata->acp5x_base + frmt_val);
>> +		val = acp_readl(adata->acp5x_base + reg_val);
>> +		acp_writel(val | 0x2, adata->acp5x_base + reg_val);
>> +	}
>> +	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
>> +	return 0;
>> +}
>> +
>> +static int acp5x_pcm_suspend(struct device *dev)
>> +{
>> +	struct i2s_dev_data *adata;
>> +
>> +	adata = dev_get_drvdata(dev);
>> +	acp_writel(0, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
>> +	return 0;
>> +}
>> +
>> +static int acp5x_pcm_runtime_resume(struct device *dev)
>> +{
>> +	struct i2s_dev_data *adata;
>> +
>> +	adata = dev_get_drvdata(dev);
>> +	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
>> +	return 0;
>> +}
> 
> 
> add __maybe_unused for all the suspend/resume functions, in case power management is not enabled
Will fix it and post the new version.
> 
>> +static const struct dev_pm_ops acp5x_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(acp5x_pcm_suspend,
>> +			   acp5x_pcm_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(acp5x_pcm_suspend, acp5x_pcm_resume)
>> +};
>> +
>>  static struct platform_driver acp5x_dma_driver = {
>>  	.probe = acp5x_audio_probe,
>> +	.remove = acp5x_audio_remove,
>>  	.driver = {
>>  		.name = "acp5x_i2s_dma",
>> +		.pm = &acp5x_pm_ops,
>>  	},
>>  };
>>  
>>

