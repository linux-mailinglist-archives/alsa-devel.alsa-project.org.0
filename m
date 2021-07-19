Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F33CEB1D
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 20:49:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 983E311C;
	Mon, 19 Jul 2021 20:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 983E311C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626720594;
	bh=oG9c0PF3GDZruLRdbp9URCYo6kiUqInFFznzkiYnGtM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xa/5OtWDH2HIWFrECdQi1CQeHgDdQ1SmONMn6pJe6sDCblUbmnbNM4kfDfr2QQrn5
	 TYtta5NQliwB9Yk/YCRtsEmwHQWEKr0VOmUYEE+hMw28JHpXMvMUH3MSIpygefGekp
	 O0/i6Nai7RE7C+zDngCJdwrxUP9H2fbZgfpumotM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F6AEF80169;
	Mon, 19 Jul 2021 20:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F93F80227; Mon, 19 Jul 2021 20:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49501F800DA
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 20:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49501F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="emZzQvVc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP8QQxS9+Dbb+Gq+js2vTWvn6UDgjFL8PhOc8oWhSpvIX6ek5MuEF331c9kKX7A6DQvR3OruYI80Dne751zgZEObCqGVNIg0dmmdLLADp77iOnsL2mZJV9uGdm5IZfWhwivF6p/va5LftKYjpRkckvldijsd0drKmroacQwBLbh0RLONYUvbdo3vkoqMayzD30aAjOKpAolFyapR0dcVK3KbZYNTi/QJj+4x7fmgJkldftrrsx/XxlsddF4LELIrGEasao4WHcdqPPoMHGtzJom5yR3MsBXOYqr2IjVB1qvPFqkPakSBPpEZD9/d87mvLD6p+0BN2xI9N4hc3N/F4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVVb9NE0ANB8ayAz6BMHe37UYlasYy1tgApcX9LV10E=;
 b=eisRvhIe4rTtOD6yZVOzddGdsjCJHnKPrqZt/3VqCepm00ZuY5tBLc9So0xzNqvBPR/1Xs6jNls0Cff3u7yYZ6vLMGNb5DqNk6f8MwUdERa7SbeW1CdVmPiSFFsW29IRjpkB+NaYBGBZOchYpw/rgzmctAVDafKu4O/xJOKMDUhYawrSElAWHtC6ffVJ0qfawvdl9OkfjUXDdswBpY2Y0tnB/90MoMvpsDNm7LRrJ73CdrVB3DjskOPQZiDK10T+7AOIo/7LRpXVRwA/h6TomeReB6os+vrW74xqXWdE3LAW/kcqrPQPJiJQ6PICkPvlwChPv1BCAqjCLd3Xp8G9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVVb9NE0ANB8ayAz6BMHe37UYlasYy1tgApcX9LV10E=;
 b=emZzQvVcQFwWq1Z76Ro8Yr7mHiVr0btJDuZCSjRLJkQKuAc8OmaILoer8yDyA6GkFyEE9g86fvTrpn21+FdDLvgrJ2/95tPTSLUNMjrEgxrbnVReuIOH0He3m1ZOKCgiG6N8gY69UGNZyYD2hiLU8QbyOspt/kBgJ7Z8uAKXSV4=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1261.namprd12.prod.outlook.com
 (2603:10b6:300:10::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 18:48:14 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.033; Mon, 19 Jul
 2021 18:48:14 +0000
Subject: Re: [PATCH V3 05/12] ASoC: amd: add ACP5x PCM platform driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210719165140.16143-1-vijendar.mukunda@amd.com>
 <20210719165140.16143-6-vijendar.mukunda@amd.com>
 <f476dc4a-8185-77fd-d469-728aebdc6f65@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <6c27b2bd-cd7b-ef0f-a89f-106d3d936580@amd.com>
Date: Tue, 20 Jul 2021 00:35:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f476dc4a-8185-77fd-d469-728aebdc6f65@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::15) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.160] (49.206.46.65) by
 MAXPR0101CA0053.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Mon, 19 Jul 2021 18:48:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3706cf3d-8a52-435c-c3bb-08d94ae5c39d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB12617E99CCD6A46C753D523697E19@MWHPR12MB1261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oh7Yjx9lkUYzcVKKkMzHIw5YvL94zAhFpEhZfTfQHU+mSaBzTli4mxPrKu4du4/u+n57FkaMBHAfZE2oQEx6GdWz6F6GOeZslYQnIDbyPoIcWgT8fIV2r6qjA35fmPnzSrltbZrQSHKbMRWT739H5lMAZDk+HuQZ3P3ifWXHSC0tS+KImaG+QHDmIzrfJLsOw4d3UBf4buIppMwwaRzWRsdzGLZTwIIbuzZlD5ljtwVVSlN8/luxXBsMcJTH0Gp7it3WP8M7q9KQLW6JnzDArEthpxxRMmmkfINZgIDlGD8zK5tp3hf17CCJiu491nkCHIpvLIG7+FEtIw/QKiR/rSLI3dx6nDUR13RjwOHQiRx9MBpgJOFuzPLswrwzi3zGcwNYNpn3gB/2iiZcz5HZxGWyczXvn7jJoBikMEpV+1RmUwZJjMdb2kQxg4alk2UBJD/tnGrMs8aW4Nkt3c3xVIPSOUfnhYiWnQPs9qpju6Ea7ziUpjghagzpc8YMckdbUa/e7tDcg4PSFupkJN17yne3cfcf+YVg+56HucmOf8OcarXddKUY6XGXyd6WXIIdeWkGiZI+Q/tcJFf0tY9WNFBPNac8Ma0k0r1iGZ82VS9fDXzb0DxB9V5ZWe8FanKlI8BoeIVbbvcV1EJJY/d2Im42YeFhniTjtyCk7+zSXNKta3sCLmJU3Bg9yjOD0OrGsfvrpNYUL5WDg85Lg0roJVV2GI3snO9ePxdSJyiOXHLvHHvZ10IiJ2SDbc85/1W9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(54906003)(55236004)(53546011)(2906002)(1006002)(6666004)(956004)(26005)(4326008)(2616005)(186003)(16576012)(316002)(38100700002)(86362001)(6486002)(31696002)(5660300002)(478600001)(8936002)(66476007)(66556008)(8676002)(31686004)(36756003)(66946007)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEFmS1V6cThWTk55T2VvMU9WVHljaFdFZU10akd5ZXBQbmoxZWNVUjNISUUv?=
 =?utf-8?B?Y0VUMExGVi9QSWhEMnZOV09YRDJNMlJKQmRWd283MzdUcjlHVWZIR0xWZXlw?=
 =?utf-8?B?eDJNN1hDUElvdXVBdm1NN1FDc1FXSGU5YTY2Yk5XRGFhWFU2S01sTGZZc3lo?=
 =?utf-8?B?WTBocmlVY083dWdaR2N3TGVGenFYSFhjWW1GalFoaS9aSjV3WDZEZGI2L3E1?=
 =?utf-8?B?NW9QalFKY2tLbVZ4d2xkbGt4TkdlS0hvNi8zQktrWXNhUzg5dXQ4dFBBOVZm?=
 =?utf-8?B?VTl2TWJyR3dyWEFYaWlDVjFuWmhWQlBuV3A0VDNRQ0YvYnBHa2h3MDNCME1V?=
 =?utf-8?B?WEErVStzTHJUN2tvTWM2TVZhdGFpYjBERDZJSWk3U21xbG1lSmVVWS9qWlk1?=
 =?utf-8?B?OCtKakJ2VjhNbXg2K1hDaDNWWFVocmxEOWsyTXNjUi96N2U0Q2pRKzN5OHRZ?=
 =?utf-8?B?am44TmJSbGszeS9yMWRLdTRvV1FzWnpNLzB4bkdwNjlSdFlrSnN6YXE4YWZ1?=
 =?utf-8?B?WkRFaEpPbmFzS0diZVhUNEdmN0FaRzM4dUR6a1dYUGNPUzFlbWw5K1FoUHQv?=
 =?utf-8?B?bDZHdGNUblBET2taZFllZCtwck1JNXc0S3I5bUZ4NEJ6MmpaejJhZUFxcGxo?=
 =?utf-8?B?UDU0Yk5hdWpjYjVHLzZqaWVyTS9jQ3hCS2trVmlaK2w0dDZubElSTm82QVAx?=
 =?utf-8?B?NDZVeDdCVWN0UzN6L1NMelJxSW52eGtVVjQzUTRtZnhpdWp0UDhFMWdkZGo3?=
 =?utf-8?B?QU80SG9lREtzVXlrV3Yvdk44RGlTSkp1aW5haGJHRHI3RHRSaVc2dmk1bDFT?=
 =?utf-8?B?UjhkczlmekgzaVdhTGphdXNLWkF2S2hPSzJkNUNMSU1US1NSSElsZ080U1h6?=
 =?utf-8?B?N29yZWlmbVp6UnhIYm1uZjBsYzFVMys5c3NwNkg3bFc4MTV0SnNxYVZmdmlU?=
 =?utf-8?B?NGM5SExyUG1qd1VadkxFdDlIWm9IeFovU045Y2ZoMFdKQ1ZTSTB2T0hyT3R2?=
 =?utf-8?B?N2laWHkvVmhKQy9EYVJEY2Fwd1R0NEFORzg5NWNEZlplMjVNM0lHM3FPckZ1?=
 =?utf-8?B?dHZRVjVrc3p3TDBqRTd2cWxBRldFYXN3MUVTOXEvVlhzUWFEcnRDekNnaWty?=
 =?utf-8?B?dllaT1hja2h1ZVRzbnFYbU1zTVNWT0Q5SWREcnU2MjBTWDNwZGYxOWxrdHZ6?=
 =?utf-8?B?WndSMGZRbWFIRHUyRFVOSzZtb2RHLzY0UDBGbkRoVkpVVkNQYXgrUkU0VC9J?=
 =?utf-8?B?a1JmSzRuZnZNNkIrME9ZdE5peElrUGtGNUZXVjh2Qkw3a0ZOSGFhSEtqM1Rw?=
 =?utf-8?B?Ujhqc3RuZHlNcW9YQTRiVFZsVHd0T0dqZk5udkp4czdtUjRaMTlMcWN1OUhC?=
 =?utf-8?B?SHlHVnJjYkRJdDBEK3RBZEtteHpwVW1FTUc3QmFpYXhoRjdMNU8yV2ptZFpi?=
 =?utf-8?B?NGQ4WFloV1FROWJCSEVrZnljeTNzWDZWYkFZWEs4MS90OEZhRG14Vlljb0l1?=
 =?utf-8?B?a05aRjVJWGdwVk9MeDZGMnRYd0tCeUoySjdETzRuak5ldGE4Q2hWdmlTVGlq?=
 =?utf-8?B?clJJcEVGbEIwSTBIM1QyallYNlUxVG5jKzhSM2xOS2pqUjQ5ZTY5S1Uvd3pl?=
 =?utf-8?B?UVlnM0tNQ2tkaTFYaC82SWZML1h4Vkt0VEN2SnJjV0pta1UwdEhLTG5NVXVM?=
 =?utf-8?B?b3Zrc1dyMkJRUWtpekxWdTRpYXR5U0U1Z1pmanRuZW9wZ1dHTUZGN1FSWEsx?=
 =?utf-8?Q?+33FYbCjPgD3HsPy1zH6QA0JDKPZQs4GPMlPmCZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3706cf3d-8a52-435c-c3bb-08d94ae5c39d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 18:48:14.1667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqz+P0eOE/8ZxkttIqBhd82wg54rdU4hmc7nf6dU6N7o7NUEoFXsw4ZHibeGkYCshPPPl0OoFmoEhIROSkW7Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1261
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

On 7/19/21 11:39 PM, Pierre-Louis Bossart wrote:
> 
>> +static int acp5x_audio_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	struct i2s_dev_data *adata;
>> +	int status;
>> +
>> +	if (!pdev->dev.platform_data) {
>> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
>> +		return -ENODEV;
>> +	}
>> +	irqflags = *((unsigned int *)(pdev->dev.platform_data));
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res) {
>> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
>> +			return -ENODEV;
>> +	}
>> +
>> +	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
>> +	if (!adata)
>> +		return -ENOMEM;
>> +
>> +	adata->acp5x_base = devm_ioremap(&pdev->dev, res->start,
>> +					 resource_size(res));
>> +	if (!adata->acp5x_base)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(&pdev->dev, adata);
>> +	status = devm_snd_soc_register_component(&pdev->dev,
>> +						 &acp5x_i2s_component,
>> +						 NULL, 0);
>> +	if (status) {
>> +		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
>> +		return -ENODEV;
> 
> Unclear why you need to change the error code explicitly to -ENODEV?
> 
> return status?

yes, we can return status rather than forcing error as -ENODEV.
Will fix it and post the new version.
> 
> 
>> +	}
>> +	return 0;
>> +}
>> +

