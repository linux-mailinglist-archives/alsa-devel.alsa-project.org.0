Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B603C1408
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 15:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E901658;
	Thu,  8 Jul 2021 15:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E901658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625750058;
	bh=eRTAnFFQ/457D+AWQN9ajZ+bJXC32TBIRDigH8cVbns=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhFh+U8wSz/7oZS3M+6qxKgfKV2v60pMuBONadMWxEWLv3GzufYtlknoz8tUllzZz
	 pdvQRIN08L3dV/oEbrfP2eEzo5HmOLPHhw7JEcKuysTsomBqShAK9oX7XEvYel9MyY
	 VzBiL+xaTFpnrU7QnKJMM1prv0H5162Z6XXF8yxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B2EF80143;
	Thu,  8 Jul 2021 15:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEE87F80249; Thu,  8 Jul 2021 15:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51831F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 15:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51831F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yiopQmVO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpHY1Hi3mqdZfZXEBwb4sCUHvCJw5cs79+qmUeYO5/sAQQAY2KoMgfXemAa6vsg7EdmVmmEvRq3C9j3whndMrr25ufoTn41+rTdGQDmsEVRpWcXzOsK6LOnaptq6pOUkfZm4aIkPr3IJMFqDGYZ28vsrwZIqR7sQoX6t/ie/fPRFDmRGTThNc7b8Ompxmr24C1d2TC7HOd6vs5LJVoj95kFi3xhbvlCzqMut6urEWZ3Z90ozOgkMeAWZ8cPmjIHt6ZoW7SfEWhkM5DOiWjXTWnR3ox7a3UYrXaRZZZjqB2Jv4dBKQsTDPa+qG3tsVlL7g/rIKY9UYdd18gIqKCSKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRL7mMfyiAG5UTFIswThSbgSf74iagxkWffxo7mB1s0=;
 b=WokzltP9N0k8vLPIV+62RWdeMBm/y/FKCjvaACFN1EKx2mkticPVnsPHWatqQgDLZRGrn7Di8yhDZi4UOBMX/oYKzjVxJggPWBmuLjYJvoAjt+LOL2WPM/1a2hQgsKasuvIo1N37jT/LF1MdvZC2th8BcTbiTd+SwyvdsEJ4S/tTxILiyMovXo9TLsJ3MNI00CVGSPauYYNbzhBUsihEzjw+qUokjpwQAfFGlj3VKXn89Hao6DsMkBBMiGA/6UAFBDVyYZKzhTtJvSnbTMBcbUNQwkAhgSKCf4ZfQ0VX1tbpWSN+gfA1hZGjAWc6rIRzSkAyzats8lqjXHK9Fu1P/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRL7mMfyiAG5UTFIswThSbgSf74iagxkWffxo7mB1s0=;
 b=yiopQmVOwgt/J0PAfW8rIDNQTDlXD/Kr2fJDL7z2stsmHoeSefLs1Opt2Dx7UuX/jtQxAXHmk27HZUn7FuS/vBCLndoKQD8GuM8pkZnBU1mkW8e6UMY0R6709I0LfaP4s+PTfwbc9ROKDvWX/fYVc/auJhjalp0ayUpUKvHjf8I=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13) by CY4PR1201MB0039.namprd12.prod.outlook.com
 (2603:10b6:910:1e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Thu, 8 Jul
 2021 13:12:31 +0000
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb]) by CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb%7]) with mapi id 15.20.4287.033; Thu, 8 Jul 2021
 13:12:31 +0000
Subject: Re: [PATCH 03/12] add acp5x init/de-init functions
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-4-vijendar.mukunda@amd.com>
 <dca2f367-59a3-6ea6-7abc-c9817442eb86@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <654d311a-b625-f7f9-76f6-326653f324a9@amd.com>
Date: Thu, 8 Jul 2021 19:00:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dca2f367-59a3-6ea6-7abc-c9817442eb86@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 13:12:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0b8cfe9-5aec-4647-2fe6-08d942120ac3
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0039F1D42251DA86DC47FC0797199@CY4PR1201MB0039.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fr0LObpvBG1Im/XXFT7xpOaR/ik3+6p/muVJFl+qmvAd0ZS8HHTNmmgMCM38jWLcYNIn3OQ8g7JnP3lSuGGPZpAVXJLKZzFs9OC/Gmv+c/7keudERuj7wUgdhG6KsXKY8DDqn/9OEyaTGQ09hLPYO9VpJijfdx2MI2zCtlv55N3o56hGjDbKDx8eFNN23SDYxLSN766yaOvk65wWpnVo+Aka/ETMPlyOqKvEjbcLHcAQfYHtGm3vOFpdDYd7BPcV7Srhxi112S+me4F1aGboQfXNLWniXb0qsE4EtkHiWfap+6SZ47JhqsPD0rw5dl+fLg5e/nu6XJSk8+cUPUefFaylmEuU48uGLN/SZ5aLNr2/x/YEmNbqg7cIg9YsiBS7vUU0jrbIsQf1wn3u6E9Vk2H3425DOMz61VKwKij/BxXuCJvsxYOWsIHNsrLhQSh0SHNSKJk2fURxz4uFpjBj1r9d/VgI/ZepIeRHV/f/lSIjRwm1D+I2vdN6w6JcIlmrVTh8lEPIMU7bvOD1a8gXIyvhpwJzjNUVJpER4posAb+sU2it/0nzwpDrMlMMcLn1EJP4Q55wtOl+36gKWrv1h2drhTHQqD7V0qH65VTDsx99c6qtKs5LUqhml5VWESbhmsRrPgPgrOg0U3ZbX3ZAqMGR0VIDhZKO8mF3C8q4bLE/1r7u1ZsUeE7Debd5PsmNmfkFuF49nS3BB9DQrXlTCwYyL0CCMaoUlgLHYD46IVLZnvL7pKAgAjO0BhNsL6vsNwkQ79QMGT8dd3dpW3Gol/t9pfvXjnS5FZVnAzAM/XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB2550.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(2906002)(38100700002)(186003)(66476007)(66946007)(66556008)(478600001)(6666004)(31686004)(8676002)(956004)(6486002)(26005)(5660300002)(31696002)(86362001)(2616005)(36756003)(54906003)(316002)(16576012)(53546011)(4326008)(83380400001)(8936002)(42413003)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUFNR01iakZ5bUE1MmZ4SUx1Vy9QbStRZVR6QWQxTk5iVVJEa28raHl6QlN5?=
 =?utf-8?B?VzEwVkFGRG5ZU2thUkxZdzhYV1dWdERESjBJV3oyMkJVQi91V25QQUd5MHpJ?=
 =?utf-8?B?c3JXRE1iN0ZDZ2tQbC9xaFk1dGhuM1FCSERCWlNEVjdJRGV3a0NmTGdDTlFK?=
 =?utf-8?B?amxadUF0S3VhVGJUZzh2cDNqQmRVU2lXYXUwMVcrNTRzSHVDeG9Zb3RrbDZQ?=
 =?utf-8?B?OExTS2lQT0paR2pBdHc4T04zd2c0ZENLaW1LMGswVzNmNlIzbVBtYjBCRTZL?=
 =?utf-8?B?SWVJSm9qVXRncVN5aGxQaEhpQ092RVBiV3h4UFo2RlZ4NkwwRHRkM2NvQU1i?=
 =?utf-8?B?MVBGeG80aFBENGFqblZDTEYrYVdtai9RM00vbWZkcGNmc08wMGpzcXlJMXpU?=
 =?utf-8?B?R3ArQUJOUnRDSUw4QWNXbW15bnR4ZDdlMjJ5aHZEZGtibzFrV0xnQjRORE4w?=
 =?utf-8?B?MjV1U1p3YnB6MGJmQVUzSDJVS3Jnd1h0OGcwMng1cWJ0SDNIWWd1VTBlSFMw?=
 =?utf-8?B?cllKdTgvMmhiZDM1QTBHdjhYdVJtUnhaZ2NQbkFVNjEzQmtkcHpzUVlMT1VS?=
 =?utf-8?B?MHZ1WUc4elkwWnRuNEdRdHNReDFMYXVlUExCRGFVWFZqMmVtTmpFTW5vS0o5?=
 =?utf-8?B?aDUvNnp3RmpjYmk4Q25rWDczZ0NJODNVRkJmNThXanFzbDVwdi9jUW15c3lD?=
 =?utf-8?B?bk1hQ09LQjlEYlVYYjFxU0l0YTJ0ajhVdXYwWTdieDFWMVNlVnVRbHhRLzBw?=
 =?utf-8?B?bjZKYm9hOE9DanNvSGtWNTd5b05CZTdqMDdYUTRIQ25Ta3h4Zlh3ZmFIYWRL?=
 =?utf-8?B?VmxNVjVNV1JoV2JET1htWldSa3VONkh1RVMzWmZmQXpxNkh1WUQra250SFlO?=
 =?utf-8?B?OEJhVnUxVjB2YmRIdU9aVUJ2OHFQei9MN3hBOC9DZkFhZ1RBVW53MVZTZ21z?=
 =?utf-8?B?czhnNGZDc1FVR2VhTEJKYm9HUVIxWE1sblhhZVVySzdYcDkyb25qSitTaHZk?=
 =?utf-8?B?di9QUE85a28wYzJDRDI1dmY5aHg2MWt4RmVBMHZmY1UrelluNjArWTZ5cUVk?=
 =?utf-8?B?YzJxSWJnTDRwanNiR1FTUFA1cVp1NlQ1VythSjUzNlNjV2FJdlBMVGJES2JP?=
 =?utf-8?B?bEJUZG5oblppbGJ3UFozSTB0em8reXBLSHdZcGI2TFkvVHAwbFNVaDRtNzNF?=
 =?utf-8?B?THcwNFY4WHcvTVFUMG00RXBOa29NZm1CVlJmbW41akFjZVp4ZTlvWW5KZEc2?=
 =?utf-8?B?K01wMVNpQm1QMjBsWW12U3R3dURDWHk5QXRvcHVuekIrRnZCeGtTOEx5NFFF?=
 =?utf-8?B?OE9pY2ozaDNlbjVFd0lnN3Q0aUtQbDQ4bTlTelNjNElJbS8rdlNYdXlySzRJ?=
 =?utf-8?B?VXBZRjI3dEU1TDhyZnM0ZE5NcGNtTEJQWHM1TEJWZHczckNjWUJMRGdLaCsy?=
 =?utf-8?B?YnNycUFZaDNDelVPaEFYYi9RYXZwbU5SU3NNcEs0MmtSMkpsemhpcHFsSlI4?=
 =?utf-8?B?enU1U3U3M29lRXdFdHNBSS9oT3NES0VFMzNyN1dIaWlzRkpnY1lpNmpFdjZD?=
 =?utf-8?B?UGEwREdOYjZNZEtUN1M2WDVYSmVvbkNLV0hOaW9jMkNNM3BBbVFFSk1RZTNo?=
 =?utf-8?B?UlhYQUlPK1ZJMjllcHJNM1hPUE9JdGVkOE4raDl0WHA0ZTlBK25UUGtFNHlh?=
 =?utf-8?B?OVh5ZzErNXNibnBKNEVSLzdJWDdoVzl4UkMyLzNvOGRIMWhPWDFGdUxwOEZF?=
 =?utf-8?Q?rw3xS8qDD6wIy6EgAKMpiJhAXtYxgkneLzgC4Qz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b8cfe9-5aec-4647-2fe6-08d942120ac3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB2550.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:12:31.0472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1PIWmzFpV2pcGjYXqPqkOun30ORDCZBZmzTR5SH9cw0afklTvY0utxOQno/AY5O9y542VK2dwXHGywrT4zaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0039
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

On 7/7/21 9:45 PM, Pierre-Louis Bossart wrote:
> Missing 'ASoC: amd' prefix in commit subject?
Will add prefix.
> 
> 
>> +static int acp5x_power_on(void __iomem *acp5x_base)
>> +{
>> +	u32 val;
>> +	int timeout;
>> +
>> +	val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
>> +
>> +	if (val == 0)
>> +		return val;
>> +
>> +	if ((val & ACP_PGFSM_STATUS_MASK) !=
>> +				ACP_POWER_ON_IN_PROGRESS)
>> +		acp_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
>> +			   acp5x_base + ACP_PGFSM_CONTROL);
>> +	timeout = 0;
>> +	while (++timeout < 500) {
>> +		val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
>> +		if (!val)
> 
> Shouldn't you use something like 
> if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_ON)
> for symmetry with the power-off case?
Yes we can do that. will fix it.
> 
>> +			return 0;
>> +		udelay(1);
>> +	}
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int acp5x_power_off(void __iomem *acp5x_base)
>> +{
>> +	u32 val;
>> +	int timeout;
>> +
>> +	acp_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
>> +		   acp5x_base + ACP_PGFSM_CONTROL);
>> +	timeout = 0;
>> +	while (++timeout < 500) {
>> +		val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
>> +		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
>> +			return 0;
>> +		udelay(1);
>> +	}
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static int acp5x_reset(void __iomem *acp5x_base)
>> +{
>> +	u32 val;
>> +	int timeout;
>> +
>> +	acp_writel(1, acp5x_base + ACP_SOFT_RESET);
>> +	timeout = 0;
>> +	while (++timeout < 500) {
>> +		val = acp_readl(acp5x_base + ACP_SOFT_RESET);
>> +		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
>> +			break;
>> +		cpu_relax();
>> +	}
>> +	acp_writel(0, acp5x_base + ACP_SOFT_RESET);
>> +	timeout = 0;
>> +	while (++timeout < 500) {
>> +		val = acp_readl(acp5x_base + ACP_SOFT_RESET);
>> +		if (!val)
>> +			return 0;
>> +		cpu_relax();
>> +	}
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static void acp5x_enable_interrupts(void __iomem *acp5x_base)
>> +{
>> +	acp_writel(0x01, acp5x_base + ACP_EXTERNAL_INTR_ENB);
>> +}
>> +
>> +static void acp5x_disable_interrupts(void __iomem *acp5x_base)
>> +{
>> +	acp_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp5x_base +
>> +		   ACP_EXTERNAL_INTR_STAT);
>> +	acp_writel(0x00, acp5x_base + ACP_EXTERNAL_INTR_CNTL);
>> +	acp_writel(0x00, acp5x_base + ACP_EXTERNAL_INTR_ENB);
>> +}
>> +
>> +static int acp5x_init(void __iomem *acp5x_base)
>> +{
>> +	int ret;
>> +
>> +	/* power on */
>> +	ret = acp5x_power_on(acp5x_base);
>> +	if (ret) {
>> +		pr_err("ACP5x power on failed\n");
>> +		return ret;
>> +	}
>> +	/* Reset */
>> +	ret = acp5x_reset(acp5x_base);
>> +	if (ret) {
>> +		pr_err("ACP5x reset failed\n");
>> +		return ret;
>> +	}
>> +	acp5x_enable_interrupts(acp5x_base);
>> +	return 0;
>> +}
>> +
>> +static int acp5x_deinit(void __iomem *acp5x_base)
>> +{
>> +	int ret;
>> +
>> +	acp5x_disable_interrupts(acp5x_base);
>> +	/* Reset */
>> +	ret = acp5x_reset(acp5x_base);
>> +	if (ret) {
>> +		pr_err("ACP5x reset failed\n");
>> +		return ret;
>> +	}
>> +	/* power off */
>> +	if (acp_power_gating) {
>> +		ret = acp5x_power_off(acp5x_base);
>> +		if (ret) {
>> +			pr_err("ACP5x power off failed\n");
>> +			return ret;
>> +		}
>> +	}
>> +	return 0;
> 
> shouldn't you have a sequence for shutdown that ignores the acp_power_gating parameter?
>
BIOS will apply ACP Power gating(which is part of ACP power off
sequence) when ACP enters D3 state. i.e BIOS will control ACP Power gating.

acp5x_power_off() API is no longer required.This was implemented to
verify ACP Power gating during initial driver bring up.

We will drop acp5x_power_off() API, will remove acp_power_gating
parameter and post the new version.









