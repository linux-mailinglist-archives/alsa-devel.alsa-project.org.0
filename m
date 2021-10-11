Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E206642896E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 11:11:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECA6E1674;
	Mon, 11 Oct 2021 11:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECA6E1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633943476;
	bh=sXOF2NuvT1+LuEk5P3qCpTC5tAb013cwYUTRHf5fVLU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBdysCVQulO0i4XHOGoWyTEwwp4vDKLxachB51IWqs7znDqfuiOj22DHBZGWHDaEi
	 fce0L/+7vKY6vYbtWgU+UpCIKEVWt9KvjOLf8LKGX/MsthNoq5eJJltszTs/vH808g
	 KPQCqgGpE9HRYUNNSzaI/9kQeLGMt0Sr98szCLkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C850F8028D;
	Mon, 11 Oct 2021 11:09:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5553EF80269; Mon, 11 Oct 2021 11:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1370F80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 11:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1370F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="mSKi/UTK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFbzyWCKLnfMBKMCHTYwIv8L5hgBqxGvfeFpcPHHcd0iFu7sPnqQIXTOjiN8DKtsOnYWkKtaMoQw2ncNTdyl+5XXJSxdqjIB8GPOGuWqOfHZBeRlTLK3+zFM1NZ8sO3oQ8VGd4RHy/pbb30+nwpao5R5LWHpCuTtsbkyoElA/2eQl3FX+nrPWhM5HKYVEARDjRaYewDjeTkx4sRn7i2PoxCd7psnEclSNzEBRPuTIl/bFmsNorGol7PaxIPxdKKW5sFqjgOVYArxIlrTGniHkHk3AnbCJaI6SxfP9H/B2JBEJJzeO1Bcy9jJ6ladjZEDBo3qJkDCUph59x0tghRPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+6GKrewbKBNozuGGfT1JcDKka9ucqhQM7XYGFCqKNE=;
 b=JxtJ91F5aK8wd4dfGdz4yrDar5nZ6bVSjn22j51ikdBmeWDahcVdEM5A63w64bH5BRMsz2jPJtEQIH7m3nmAdKKqnYqBFom4WX/xtogcMBCZT2c61qxtpBkWP+mYjfklj1Epnr1sWCKSlSK2Q5Vk+sQNddBFb7icsAkbkf3ONLovTKQk8h0UvJZkqN366KJU62R6/Yljm3S7aLQHY5s/u8pIAOpWL/Ai0lpeE/o2iXUWl0sqRymyDGAu9Gi+W+FAZXEBcI4rlF4mnzr9nLftLmmtD9hr+ZcW9hQnuxnA/kfs+VpjeE94UJX6IcU4ZtKzaG85TknlivypLbxYQHfISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+6GKrewbKBNozuGGfT1JcDKka9ucqhQM7XYGFCqKNE=;
 b=mSKi/UTKcUQYCbbGdfT//dk5hgRCdEj9E9UTK11aSmkawR7iy4SA3oEyVlNDGe3rO1NlGS8W2fAbcVW3r0vnzyD/JyzdZDOVpIWczeoRd+JztrJQcgVy1En8QczOm7nQHJiap3+TES9bIkRbvePIQwF+IvNnHkmtHxu9DnGFF8Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM6PR12MB3146.namprd12.prod.outlook.com (2603:10b6:5:11b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 09:09:49 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3%9]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 09:09:49 +0000
Subject: Re: [PATCH 06/13] ASoC: amd: add acp6x irq handler
To: Joe Perches <joe@perches.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
 <20211011055621.13240-7-Vijendar.Mukunda@amd.com>
 <e71f1db7fecefa1f8eccd29d5a6cad3c126a1753.camel@perches.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <0035a9a6-b018-8b4a-41b8-357c11c8a08c@amd.com>
Date: Mon, 11 Oct 2021 14:58:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e71f1db7fecefa1f8eccd29d5a6cad3c126a1753.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::33) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
Received: from [10.129.9.123] (165.204.159.251) by
 PN2PR01CA0178.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20 via Frontend Transport; Mon, 11 Oct 2021 09:09:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a399f6e-0d63-45db-fdd1-08d98c96e07c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3146A6FB3F4C812E22CCFD2897B59@DM6PR12MB3146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TxW+w5ENuv2G55SX6yJ+T6JrSVfvD0lrNHXOCRAUmdhzs5XhkYllyrsKchcbcYo1VyBN9rvXyM6gSfeAQ70zoPm0UVZQRC0cNgI2D/G7FoNYWfD5p/bCADVTuQjuvjvvXWoGQLWQ0VY7eRgUtdRWHLltkAF6yy4sRw9nwNcwwMJeIVYAw5nDcj9D7RBBjqH+hGPc7zfJWI3BSJIbq5iM2kFXqfcz2KS0VBqzzDXLiqSs2iwXhJ7o1a/rkIKo/ufAUiBwd4f4rTp79stzfB+TeQnf00lY5pXqUYDJrr/CaJhBcuZZ8tfjbCJJdtHmnEWWMe5lTxrRKRwkJZ6J/myVQIrvUuvcn8nCDHyvtOgr/jvpWa0wNuWl52P94E+wvw6T1HeL21MnEg8BrAEidOr+bg1AUFfQmfih3reajISf6fN4N3mluFncys1je7WP46xLeVv8CvLweVm4RL/7Yw+9wP9iC0SxA7dRdqjp7dMUgd/Q3I3GuoV/wyZFhL7mPGqSjLL83uTwgYzq2zuxiR2k/AjK7s6ZvMkFdIAcydk/QwGcSK65fUSd7WNMl5otnuI3CEQiIFQjWydCL6Ii5B0zM6FMl86gRU2gJkacY1LmowO7NvQDMfep68xizgP4LC6bNRBSWI8QLdTSdhG1UgPAd6YUgZb3y4W872I9Oq5rCKtmpj/QzVoIFMjtHHRxQ9l0pqIZO5ofhMxPkjhQ/L5JO6y6/0pDHmnHhLF7NMoz2VcwRt+n5ciZlBvZvhJMw9BIUWXfFvuUz2BRD75r9N6W2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(2616005)(16576012)(2906002)(316002)(31696002)(6666004)(54906003)(5660300002)(38100700002)(4001150100001)(31686004)(8676002)(26005)(86362001)(36756003)(6486002)(508600001)(66946007)(53546011)(4326008)(66476007)(66556008)(8936002)(186003)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFp2TXRCaExLdFF4Q1dOSFAvT0RPbmsxK0ZhV2UwV2pBNWJ0c1VSVnQ3dTA2?=
 =?utf-8?B?clJpcjFVbHVPNzZCWVQ4am5JeXZJbmpjdUdWTEZNM3lsbzdsS3pMcVJnc2NH?=
 =?utf-8?B?K0YrOTlRcVNoRlJHSlVIemdMTmdJcnExS1NQanNaOVdRb296amwyWHc0VGN5?=
 =?utf-8?B?QzN2L2dpck9rcDdDYS94b0JwK0xlR1l3WDFYbndaVnhVVHJibjFhT250elhy?=
 =?utf-8?B?TlhvR2ZwdGVIN0JDQ2F0SEYrUGdhM2xoR042VWVYYkVjdWFMaklqL1cxVE5P?=
 =?utf-8?B?blRJZ2FqOEx0MjJMUXhnSzkrK2lzZ1VrNG5qdWNxbXR1SVdNc1ZqMnY5QUZR?=
 =?utf-8?B?dk9RMDl1Vy80OUthRTY1VSt0SnB1V1FUTkxiMHdLRE5GWW53WVZwR2hiWVRB?=
 =?utf-8?B?SDQxaHppd3lmSFZubnFnMGNIcVl6c3gwVFYrZjlsMHdjS1BJRGtEdFc2aWhL?=
 =?utf-8?B?WXJYUUdoSTVSUk56Umd4MVgyTndDellmMTl4MXFDaEZuZ1ZDY0hBRFZkMm1z?=
 =?utf-8?B?dkVaZ0cvS01VR1hZNUZFdW5mTC85UzJNQTR1dE0wMWRoYkhHR0paRTg0WXdK?=
 =?utf-8?B?dXM3bG56aUc3M3h5Nkh3bE1NZlg0UWFyU2wyakgrNzJGeXpheEVvcjRVVndX?=
 =?utf-8?B?QlE4Nmp6YVhGUnpDQUtxWWRuWGlsc00yQURIbUZ6R25YL1ByNjFaZWV1VGJO?=
 =?utf-8?B?MkpOb2lYZ20zMDJwZFBLLzZFeDRFNStidDg1NGl4QTJURkR3RW5oejRKSzd2?=
 =?utf-8?B?cEhFRUZnVzdGZWxiS0lCYXpmZ0FOQUc0b2VrWHJVSTRVMk05Sy9CSXlZZFlx?=
 =?utf-8?B?THJiQ1g3dmNFRC9GK0NUaUs4SEtrRzQ4NjJQZUk3WkJnYlJBVWNwdk5mdlVi?=
 =?utf-8?B?eXVEeFlJU2FzbnNsYkhkWXpIakhDczV1M0F5NFFvbzdldnJOR2NtK0lwY0Rh?=
 =?utf-8?B?dEVOWEUybGw4RW9jank0R1RSMVRibUd5endsclY4dFNqeGw0K2twNnFvT3d1?=
 =?utf-8?B?cGdZTC9DVThvOGJ2eEowNUszMEQrK3pVZWpIWXdPbmtNV0JnYVVoaHpsaEY1?=
 =?utf-8?B?SVExMjE0UjlvYVRlY3UraUViZXZ4c0FVTjdUZXFMT3l5bmt4VHNjVURONjA5?=
 =?utf-8?B?RWZvNU5INWxVRnNpcTNTZjZRb01ZZFhhR040OXBRVjVKd05DVU42QnpoUFhO?=
 =?utf-8?B?S0l0OEZ0SDhtWDZhbjdhbTV0R082T0RVaGFtZEYxaDRhbW5PWm9nQ0o2NWxt?=
 =?utf-8?B?OXhtdUFXTWZzUDZNdU9jd0NDcG14UjhIZTJ6WW80RmJCMmltMEdJSWlRS01M?=
 =?utf-8?B?VVVXTmRpbzlpME4vZGExYW1Dd0hUYUtxRXBkdW1rU3VVK1VHOGo0Y3NaUW1J?=
 =?utf-8?B?M05FY3RmVnc1aDRRUjM4TzlhS2tzbnVLV2lFRjYxaGxEelZWeEhkbTBTT2ZU?=
 =?utf-8?B?VnZzNU5aR1V1STFvV1ZLYWN2YXNOcTJvSWw5WHJkdUR0S3lEckJVMzE3UkZm?=
 =?utf-8?B?aldHdjliWFZlR09EbUdMTHkxVVdsTFhsSitGbXNFVnVaYlB3c0F0RHVmMXlE?=
 =?utf-8?B?dnB6MGQ3UUF1VHBkV2RaN2pVandtL2QzcFh4VS9vM1hWQ3ZiOXBobmdzc1Ay?=
 =?utf-8?B?UUVyQnpRWUczdXFWR1Y1Y2oyVVN1c0Uxc3A0RDlKSUhNOW5NSlJSZG80QXVP?=
 =?utf-8?B?eEh4eFdhMWpRU1ZrdjEzU3ZkdDF0NnhjME9CMlRBVjZUWkVwbFkxNjVzTVdI?=
 =?utf-8?Q?jR3rG3CKq1Dl0xYzKq2NQcAUh7+1ZusK9g1oWxz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a399f6e-0d63-45db-fdd1-08d98c96e07c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 09:09:49.0639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9TkTZlW2yGXN+L2EdmGa5JF2UdYTsVNwZLPr00IPgzLJhZXobxesMJBpauynODlFXM5mLnkd1mw9dmuDFsxAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3146
Cc: Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Alexander.Deucher@amd.com, open list <linux-kernel@vger.kernel.org>
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

On 10/11/21 2:28 PM, Joe Perches wrote:
> On Mon, 2021-10-11 at 11:26 +0530, Vijendar Mukunda wrote:
>> Add ACP6x irq handler for handling irq events for ACP IP.
>> Add pdm irq events handling.
>> Whenever audio data equal to the PDM watermark level are consumed,
>> interrupt is generated. Acknowledge the interrupt.
> 
>> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
> []
>> @@ -116,6 +118,33 @@ static int acp6x_deinit(void __iomem *acp_base)
>>  	return 0;
>>  }
>>
>> +static irqreturn_t acp6x_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct acp6x_dev_data *adata;
>> +	struct pdm_dev_data *yc_pdm_data;
>> +	u16 irq_flag;
> 
> irq_flag seems unnecessary.
> 
>> +	u32 val;
>> +
>> +	adata = dev_id;
>> +	if (!adata)
>> +		return IRQ_NONE;
>> +
>> +	irq_flag = 0;
>> +	val = acp6x_readl(adata->acp6x_base + ACP_EXTERNAL_INTR_STAT);
>> +	if (val & BIT(PDM_DMA_STAT)) {
>> +		yc_pdm_data = dev_get_drvdata(&adata->pdev[0]->dev);
>> +		acp6x_writel(BIT(PDM_DMA_STAT), adata->acp6x_base + ACP_EXTERNAL_INTR_STAT);
>> +		if (yc_pdm_data->capture_stream)
>> +			snd_pcm_period_elapsed(yc_pdm_data->capture_stream);
>> +		irq_flag = 1;
> 
> Could be:
> 
> 		return IRQ_HANDLED;
  will fix it and post the new version.
> 
>> +	}
>> +
>> +	if (irq_flag)
>> +		return IRQ_HANDLED;
>> +	else
>> +		return IRQ_NONE;
> 
> and
> 	return IRQ_NONE;
> 
>> +}
> 
> 

