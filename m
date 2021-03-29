Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4034D5F1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 19:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D3E166F;
	Mon, 29 Mar 2021 19:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D3E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617038516;
	bh=Is5/nXbs5JS65EEFoQsqAjaGCZyj/RuBwCX8Pb0jnWY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8NieqZ7M4pzB44nZtQQ6J9vSvh8w0QRv8oQPg6682eOBuwzgGSml6XnRfJm6VXmr
	 op5U4O242Q8dw+55MZnpU1r1iJm99aDWvoEjPGAiAaDI0jbTf9BuboA6odyf8GVYQJ
	 +ASTdets05Kwj4FpTDn1WuQD0UlmB8dj7qIJaPv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF0AEF800DD;
	Mon, 29 Mar 2021 19:20:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1C36F8015A; Mon, 29 Mar 2021 19:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53399F80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 19:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53399F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="fC2i4dC5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcMH/7ce4wJUkPs6jhFBxAOByn78z3nzqvy+aEQYnRTZmrPlG93rz+HMELkJU/lJEr/p8wO+m6LQiJZVtfxzxgWUcmFJ59sw2xPZgWVCcKIYHBjV8kYmgQXACybpSMvP9Cm9nWFHha3OnUmcjRDWkmqaeDng99BiVl6Z9snWOoKF3MM9qGFNGr3xbW7kxNK/sLZchaCPRRg0ADtdqqPyPNJ9e4uZbLc6pc/xV9HuZI9W9DYBsxCfLLZEGXc0VhS+YeiDK7mUBUlxTbCKkvw/5j6lT7mcDOg8JIZvKZgTAt3+j8qnI+C2+hL7cSij7pC4Qf1Ay42vqnfP9dgroY1B3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3oYCvRI1U1lt6Fp+MPg7ZfDYPwVNaJBWsLNNJ3gGxU=;
 b=VTtnTXXYfLji8+wOuq7WQG1DSP5qgF/IIOgGNNglR3+jE2X7OnWN+F2890ZZ1Sgmwlpm8ZxncA4wObkqOGO9eXzvY3lIHfTnBn5TsBan6GIqkAe+Idy3eHhLd/oGF3je30pzSmpkxsPhfqbe0CbN46Fg/s8G7wRWe/gmUNkdRgIrm6xCvzRaDwQrnsuvDB76BO2UWoen51WyifM0lJ7tmhDjrWPq9fboAwKup27Kn4o6uF7vFMoWPs5ilHHv9xtsOfs7/oMKpD3WJ3CcOYnPqn16D/4wShCUJ/DgAJCDixpgcKlANAZwCO+RMZ9ZTlUunLl4/7UZVzSUeQLmOXVENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3oYCvRI1U1lt6Fp+MPg7ZfDYPwVNaJBWsLNNJ3gGxU=;
 b=fC2i4dC5AFn8i6QWNdOoI2BUd5IpTLIvnlbsF2m7l7KHDGvXjHc3KUM/2A3U3Jh73FM/PTLMnKlWkUT3wGFiKvqQFdDFCEMxL3jNbC+QBP9q3XwJEIWVp2XUSXHPeTgA63Q5LO8XWOt+wFX4JVinzTWoA2CoBwE1PLWjHY8CDXU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1261.namprd12.prod.outlook.com
 (2603:10b6:300:10::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Mon, 29 Mar
 2021 17:19:58 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::c977:4e9:66b8:a7e%11]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 17:19:58 +0000
Subject: Re: [PATCH -next] ASoC: amd: acp-da7219-max98357a: Fix
 -Wunused-variable warning
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20210329145037.23756-1-yuehaibing@huawei.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <56a58143-863b-b5e4-4498-1190bda3e6bb@amd.com>
Date: Mon, 29 Mar 2021 23:07:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210329145037.23756-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::9) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 17:19:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6254b93-7587-49e6-f680-08d8f2d6e069
X-MS-TrafficTypeDiagnostic: MWHPR12MB1261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB12610CEF054C494318F790A7977E9@MWHPR12MB1261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHkekZ7XFi7/8TVcVlFqrOLTMYRixiXh/N/LgD2PN4wsfp8LiIWs6yUIP9Ai++/DeMTtr/bjOGaGx9U6i03E7CgkE3CxlaOb7sPfdexpHzANXnJ5t0S5VgZtKUr5hIj67VlMNhPv1/BvYoGZeIu3YNXR0braOUveI7dTg/XUzyhGs3zosUOl+bpQ1YwpBZnqKYH8LB9TD6bSij3v8UgDIBC03ixnz60/HTUXpeRpmZG027gHC7o5j/t4Emq03VjdQze24MFS9fhEtEifGRQINSW9YSptMxjUISE2uHt0aBXOlmw/oz0ls0sJgnTi008MuhXFFM4yZ+OJXYary6oxR7xApHOZoiQWzM+hcppF4xRaNWzouZFo00C++GYkevmh8266BZgOPFlbpWa4/WuVM2fHgjruzESLgtlu3ZtVDOASqk1+BMitlBJv+vDXJcJ3x5BfRs+rGQtnl61xKRqr/oSXzOCBcc+DbTAv5RMw5T2PDEJaM01IHbmw4la+bdawiM5F1Sxgxt3V2hI8wVqwelgtr4fTz7WQ104nwgizY3a5VHbytsoCxZ6PVJ/IadhDmMfBqmLO4H5IirT73ZhTF7F+fFIWv7lb95A3TTtPUZsIdLvE2SR2oRzNm087kh6zQXo4mJ/w2RApTJtyylqfPBJKt5BjLMsUO/aenMZd2aDOyKk86x4G7g0HUrjEacHlfgRDfRJzefzs9RIR3YDrVPHQDm4YZ1YMapkP8uY43pQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(86362001)(83380400001)(6666004)(53546011)(316002)(478600001)(5660300002)(31696002)(38100700001)(4326008)(2906002)(66556008)(16526019)(26005)(186003)(66946007)(52116002)(6486002)(8676002)(956004)(2616005)(31686004)(16576012)(36756003)(66476007)(7416002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3RmaGp6Uk5Ea21SZzdHWDh0UGJrU1d6SlIveGdEN3dMMTZmSDMwWjJVQS83?=
 =?utf-8?B?c05JN2JITk00d2crTitlM1k4MkhPa2h3MXdtUmMrUnFXSWJlYjY2clVzU2Nu?=
 =?utf-8?B?azg5Y2pQSnE0YVFBRWJVcW1ocVNhT2dHemdsMThUUE5rd0JBVytDQ3ArbDlF?=
 =?utf-8?B?azk4WCtSZ1pIcDY5OHAwNS9uSUE0VmxFU0pwcnEzTGh3TUVVbkZuVmVFd3dv?=
 =?utf-8?B?U1NxVy9Pc3poNkwwS0ZBSlRZM2VicXNxdlBSaHlSQWJ2SXh0VlZlTllWYkpT?=
 =?utf-8?B?VWdjSjkwd2djNmp3K3A3b2pVQkp2ZTV6U0pKM1VrazdQbkQxRUdXNlpLSEFn?=
 =?utf-8?B?dy9ScFZlOXBsaksvOWQrWDdaQ1UrR0lObFhHc3lBbWlQdFFkMDh2c0RqNUlZ?=
 =?utf-8?B?K01lREpYVlR4VlU2TkRmU0FBYVBlQm43MjFla3NvR2JLNHYrcnc5QURlRmJv?=
 =?utf-8?B?OTFEZkVoM21pZS9rcHNqUEo3UzlEL2l0SjFscUowWngzRTBGM3dMUGZjRFhG?=
 =?utf-8?B?OEpiY2ljWGRoQWwrekZ5Z2V0M0hoc3dLdTBHbThaTy9KTnlxL2R5S3lDQlJm?=
 =?utf-8?B?ZlhhMDdZUjNlWTBNY2E0Y0YwZFhNT09hc05ZTndhR0VhZ2YydXBOZ2hmL2ZZ?=
 =?utf-8?B?OWdYcDVOU1MzenRkdkl3UHpyaDlrZFpiQVZCUlFzd3JjUHdKc3VVam1KbjBU?=
 =?utf-8?B?b3NLdG5tZVI5dG9RNERMbW5kcllZckR4Z0JKZ09hY3V4aVVYRkk5NlhLWDR5?=
 =?utf-8?B?ajhQazB4dXZVenpuWVBteWtkUkNQclVTbG1qRWlaQVQrM1l2SG9Xa0ZPUjBN?=
 =?utf-8?B?Y2MwL1FuaDR1YUtadUhJK0syVU9YMk5yNGVGWVlDUkhSRmR1b09yK2lpOEF2?=
 =?utf-8?B?NHdicXBXaDNJSXJYUVdoUU5HN2RQSTg0VHZEcGRyY2lEMGpTWjJRak93M2Fj?=
 =?utf-8?B?NXFZZnovYm9HdGpFN0hkSjMrU2FuYmlacTh2aWFvaDV0VUtqUUNOSmlxOVNo?=
 =?utf-8?B?VC9rNmpVYzQyZkhPUHRHSEdJaDhBSWs0NGwrbzlkOFptb2xEbHRwejFIOEtJ?=
 =?utf-8?B?WlhiM0t1aTVmMlhSNUlEWE9CcUdxN3F6M3ZqYTM5RjVET2Y1NjY1ZTJKbkdU?=
 =?utf-8?B?dkRJZzZONmVwTkxLZTJJdjJqNm02K2RHSzg0OTB3ZHZJWHZaK1NKWEVyc25o?=
 =?utf-8?B?UzRvWlp6VlJpU3l1am1uOG13c1FJWUNKaWsvajJMSjFzazBnbk9qbTdiYmZy?=
 =?utf-8?B?N3RiVjEyUW9ybTU1aW9LRE9talEwZFdQMHZObVZna2ViTFZrV0dTK0NRUlBC?=
 =?utf-8?B?WFM3UmM4WVdSUHpjcEFWN3hxekdrN0wwV015c2ZaYnlPdzhQM01Za25GVHA4?=
 =?utf-8?B?TUFLbVU2U3RFTFhRd2RXSXFEYmVybWlTQlVRN0haRlVpNE1ZYWdIdlVMZ0Ft?=
 =?utf-8?B?QVpCMWtrZWZYRHplM1JFbU9TRkMzTGZKbzVJRzdCd1RrVDZQbEsraU1UeEQ2?=
 =?utf-8?B?bkhPZFIwalZDSUdUWDZNbzRBSHFDR01GUS84dVJiWjVpRHN0NE14aUZMbHZX?=
 =?utf-8?B?TlNCL0Nod0NGcE9DZVA0UDFDVTVmODRKMUxmLzlzeW5razJWejY2MDRCeGlR?=
 =?utf-8?B?Zllxb2FySkZoK29IUmNjc0tEUVpOamZEREdsM1c0WjIwemViUlovUTJxWXA0?=
 =?utf-8?B?UEF3TlFmUWFHU05QWGtYM1B1QWZFdlI1bmhFbnVibW01ZlhNYkh5cDJVam90?=
 =?utf-8?Q?2FoKJ3KglZItIOlqRS5nvqoVKNEI5zYpMtlUEQj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6254b93-7587-49e6-f680-08d8f2d6e069
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 17:19:57.9537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTrWP6nG8tt6kbedxjV7cBMy/oIVHAdkmUtFvIaKKqhoOP/JSmGhi0rJ+8hzvj6K0JqqqfnH2Uvt88sxY6RmnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1261
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, arnd@arndb.de,
 basavaraj.hiregoudar@amd.com, linux-kernel@vger.kernel.org,
 Alexander.Deucher@amd.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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



On 3/29/21 8:20 PM, YueHaibing wrote:
> While ACPI is not set, make W=1 warns:
> 
> sound/soc/amd/acp-da7219-max98357a.c:684:28: warning: ‘cz_rt5682_card’ defined but not used [-Wunused-variable]
>   static struct snd_soc_card cz_rt5682_card = {
>                              ^~~~~~~~~~~~~~
> sound/soc/amd/acp-da7219-max98357a.c:671:28: warning: ‘cz_card’ defined but not used [-Wunused-variable]
>   static struct snd_soc_card cz_card = {
> 
> Use #ifdef block to guard this.

For similar kernel warnings, i have previously pushed patch adding ACPI 
dependency.

But I got below review comment for my patch "[PATCH 2/2] ASoC: amd: fix 
acpi dependency kernel warning" from Arnd

I would suggest simply dropping the unnecessary #ifdef and
ACPI_PTR() guard.

It might be helpful to hide the Kconfig submenu under
'depends on X86 || COMPILE_TEST'.

-
Vijendar

> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   sound/soc/amd/acp-da7219-max98357a.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
> index e65e007fc604..1bf0458e22a8 100644
> --- a/sound/soc/amd/acp-da7219-max98357a.c
> +++ b/sound/soc/amd/acp-da7219-max98357a.c
> @@ -47,13 +47,15 @@
>   #define DUAL_CHANNEL		2
>   #define RT5682_PLL_FREQ (48000 * 512)
>   
> +extern bool bt_uart_enable;
> +void *acp_soc_is_rltk_max(struct device *dev);
> +
> +#ifdef CONFIG_ACPI
>   static struct snd_soc_jack cz_jack;
>   static struct clk *da7219_dai_wclk;
>   static struct clk *da7219_dai_bclk;
>   static struct clk *rt5682_dai_wclk;
>   static struct clk *rt5682_dai_bclk;
> -extern bool bt_uart_enable;
> -void *acp_soc_is_rltk_max(struct device *dev);
>   
>   static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
>   {
> @@ -692,6 +694,7 @@ static struct snd_soc_card cz_rt5682_card = {
>   	.controls = cz_mc_controls,
>   	.num_controls = ARRAY_SIZE(cz_mc_controls),
>   };
> +#endif
>   
>   void *acp_soc_is_rltk_max(struct device *dev)
>   {
> 
