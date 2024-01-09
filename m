Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8758282857A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 12:50:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E96A7E97;
	Tue,  9 Jan 2024 12:50:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E96A7E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704801028;
	bh=1kGq2GWJyq3H02d+tiLb8cLxpJOfKBJAzqILXrp5VOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o5b4oy3a9weE5mQQxROd8ES9I9YXkRFXM+HFy/FSA/YXamztOgJCBgyZMuyKNDgAw
	 ZqBkmvSq77JNd77W1glPm7hSTyEKVhUXVqRKxe3lzjjaaUzzKA0nvM+IMqXH7X7nzC
	 8DfdjjQjb9Nv4XwN54iqzM0wv8koLIx3sjexw+bY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85D2BF8057E; Tue,  9 Jan 2024 12:49:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0310F8057A;
	Tue,  9 Jan 2024 12:49:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90657F80254; Tue,  9 Jan 2024 12:49:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46E82F800F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 12:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E82F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=LN+W09Jv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOdXnE6isYbvF+8MKcDi+8wi5CMdtPBofrzj94f7hayqNVa9uMf4pzqYeH6Qss6+Z53zZmHYQesrboAhKhI2qg/ifokcQzdFtJRHLAFrb4y4m0jXEBRTIZGUoTjA4yY3Mz/XUN3PcEpeUYVsiJ0b7Ix7friwdgIpAYPkvHdkbq0v8+dp0k+NRQA2ve9nekWjORPKgZcMVnuCNVOGVCJwS4vgF/Bw+mow1Kl4F3VR1Nj3jdQtiB3slp54KmiOdCONnJSCFZdciIvNmkZBT7EBSi8kNvo8oguIKotABB525GO34+rtxHHTTIfGQOiQvqEcJyIUxUSykzmeg+0DsUUPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtfsRGNfU1dz8GF+gwJ3ZH1Msp2dXS8yK012uFb91tc=;
 b=MLFI7OSQVUgf07KtFlJLD4eKOEcftgQGzvg0f3z+eOHn9aFN1EMQBcrkezlbNbiyacFoQQXXr+vLM/tZITt6LP3rl7TMD5Oxpwi5a2exF3DT9RlZwHuO7WQmCPK2ID08OXySJ5qGb9A3Jq1MnXhQ2tC5EIidLCJmQ41/CttQtbkirMynW4y7NrsYmXr3KA2AZrl2gcK2vyeB8fkBbVp6zc1lrkGh0VAeaWfXqP6ZD5Vom4fzedt9E5KX2RNyz6GVwuQI9CtUhyXpUxToiOYEb2F537A0TS+vnhpG0ebCjeZ2AOkd47ymnOAEHt3z5QwueI67brCKKLGavVWBQHJ1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtfsRGNfU1dz8GF+gwJ3ZH1Msp2dXS8yK012uFb91tc=;
 b=LN+W09JvVu0ETlgUDv51AURTVy2wz0Cs443PBVfeWgyM/Z3V2V+fooKqULWngX0691H9C/eazOlijuBYgX+rqQHunaVEb17SbwrMVnZDa/EhIS/CLiCKK/E64EQ822ckBgGsb+q3C5rWAQYX7OLQ/3rtm9WOTzcAtBOGJAeNxGlQVKSdXb5wDutCpCMauza88cXk+dQkKk3xuRGINR1hQyf5UmGkbM3ESmbMzZwUaLYEARD9QkY1WyPkdjmjErGN2jl95Vg3Aji+5l+ol3f4Afz1fobXpvRxCQNsvukZjmAmvRLQ8mOEdBx4he3RJROdTA/L2X6h5opxBImk03r61g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 11:49:44 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:49:44 +0000
Message-ID: <e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
Date: Tue, 9 Jan 2024 17:19:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
 <ZZe5sTNz005Tt4jk@orome.fritz.box>
 <8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
 <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::14) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: ce23e258-8454-4d76-659e-08dc11091251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dQsrrIwlJmcA9nOyOyqOnys0NYnq+iWSBEoOfgnh2UUCGLFrTIuN9C7+HAjBxfhx3m1mkhEaqcNFkFAqhwTMEhvMahuUCAOXpUEIvjCnne1O07EnPEQjaF9t8lVeK8tGzDgoVESYzCOcygCtl2qfOGqQ60Fq2k2GqspBUEw+uQVkM1vyLN7OmtOE8lZFgm5xM8C5dQhVyjuOwd2ABOQpSgirCIUxEJg7tz2E6AIxFMMgTmh0c08Sru1LKx7AGro3r9uxMLTfzovQbGtMOEgVpoDmsMXhxG6LEPkoRH0sWUDZWnoRudiWKHKea+LLbBAVcXdKjWcfqzNY5Ntr2vo/vGUjotr49PLeNbMeY3oLV+edTsFW0N9jwyiPGS/EDHjqQvgHRFKrZoO0JBAC6aIAWkSFHq8o6D/+I8pypZkhT5BsXXehUHYF6ADYcvaqXYmm0DoL0ar1BHYHYAh7KAOuJ/vuDyQETDjlq+vzGh7RgeNcqwXnMSi7smPQsYm6G0unZffvpBZDea/oNCWYEEcaeaOs5ZDTns6mqYZBNLYUEHv0lK9RncBn78PM4B2kBY24DWA0jotXv+8JXNv+M8y/YDjVIZHuqfBM6i/uEkg5DmfXtU3MrKlD4/vR/pDfvuVB2vjGCl2Ez7fCGDqrSJeib1eqVlwUDziZm7upU4WNiaWaV9ucH33Uwmw944tMhxEb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(478600001)(6486002)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(2616005)(6916009)(54906003)(26005)(53546011)(6666004)(6506007)(316002)(6512007)(2906002)(5660300002)(41300700001)(36756003)(2013699003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHB1WUFEMENPcWROZW10S1cvcXk5dE85V2dnc2VXR3BhMXdGaFdiM3A1N1pP?=
 =?utf-8?B?MVRpd2VWUWd1WStISWg5TTI2bzhpdTFNUkVRVW4zcUJ3OXgyVjN0SDI4NVZI?=
 =?utf-8?B?dDRpOEdNWCtnSXVhdithMUNTQXpBOUp4VkpTT3I1RUV2VWVQQWlYWmJrMFkz?=
 =?utf-8?B?bEIwQUFqVkFPTld4Tit1YXA1YVcyamxOMWh3WWdIVTBMb2kzREovcFdzZFRk?=
 =?utf-8?B?THBrN0JwdVFSTXoxRVR4SkZpVy81KzJ0dGgwZjM0K1pvNHJ2L1hMZUUzNkNs?=
 =?utf-8?B?d2UvbVVnR1FKZjJTYjRLai9wNWJHVlBORGhsb3kvU1NFVTkwWklXaUlmZTJK?=
 =?utf-8?B?bmFNaExxendnS0E3Nzk0eHRlOEpiZmZmenEySC9uUlFjMDhRT3dIcHZ5Sjg1?=
 =?utf-8?B?Ly9yWmJ4QlI5U09yZlR0VjFiQ3Q4dlhVM0RZbS9oaFU3UDl0eWU4eWJURUt5?=
 =?utf-8?B?dC9EYkQ0RVVNOWhldDRkMi9nYkROSGFWRm1KOW94K3V5QlcxNUtocTd3Zk1u?=
 =?utf-8?B?ZnpNYU1manFsQlU5VWx2NjAwb0ErMXVTWHV0NG81dTBJcjRLTWkrWm1QSmp2?=
 =?utf-8?B?Q29iRHEwZ2YrelZQd0tRZ0lmd1F3dlh1R2dlNjMvVGszSkJmS01DTEFJOUZC?=
 =?utf-8?B?UzlWQVQ3SjBOUUJWVHlHeUt2cnNXbGZVNk02R2o4U3VGN0x1Q2IyVm0ycmJy?=
 =?utf-8?B?WHNUb1dYLzc3RWt6SFAybjl0ZmxkUEhHbEt5SmIxK2R0YWJnc2VseEg5bm8w?=
 =?utf-8?B?Qmd5VWtSbWpocVRxSEFuRjE0SnFqanlsNFhMTDZjZXB4cDNQWWhNUUROQkhW?=
 =?utf-8?B?NkV6REdCMDNnSjZLSHJLYTE3TG1wWEwzZ20zaG9CUjhMYzc5cHZlWG03TEZv?=
 =?utf-8?B?cFh2RHFHdjRRdHJLUDh0TG85akJoTkR0UGFkYU1hRDIrdGkvMWNHcCswYy91?=
 =?utf-8?B?blFPbCtLQ2RsMWtkWCs5eU9OTzJzcnhLUFhiZk5URlVCbHozQzhwRHdxczdS?=
 =?utf-8?B?Q09NZjhZZzVGRjhmWjllSEw5S0c5VXcveUtNbWdxVjJPRCsyVDZiUEJoT3JW?=
 =?utf-8?B?UXlhN3hkOG52Q0h3L1lzSlMzd0IyZWh4MzJEKzBJU1Z6YkUrMGRFU2lBNjk3?=
 =?utf-8?B?ZWlYdVBHZ0kybCtTU0tIYXMrSTAzWE9aRVVPR1VQMFpvTnk0RGFIMndTRXRj?=
 =?utf-8?B?eXhuVi9MbXpDdmpkNnNmdER3TnM3WmROVFFScGduSmVQTXNINjYyK05FdWJP?=
 =?utf-8?B?ajQwbGt0Mmk2SkRoM3I4ZFlYK3NGUzJET1lqVlgrMVk1QXVaZXZ0MHhJaHZy?=
 =?utf-8?B?ZW1ad0dWNTNSVGNJN0hMRlFxMDBHdDJ2K2NTQzFOcFhCVDI4ME5EdjEvM3NL?=
 =?utf-8?B?NXh1WTRxQTZuMW9VdmtJb2JHcWgxOTBzbzNSVlFTYXUvNUpyUDZQdHdMaXAz?=
 =?utf-8?B?b2FMWU5FYnkvSndCOUtvRWNSc0d6THA1aEVPRFk3amNjYTJXS1Vld25yS2dN?=
 =?utf-8?B?eis5VFlJeGRzNVlXUlBjeWRXVGdjSS9uS1BMYzQ2QjZPSVBGdWU4UGYva1d1?=
 =?utf-8?B?ejVOYjVacVQxN0FZenU3Q011ZTFzbDVxT0pBc3N1NG1ldEFpOUxJK1JJSk5F?=
 =?utf-8?B?Z0ZRUnRSR1d6MXdDUTUzbnF4VE43YWxVQ1I5QkRkb1FQeHY4R0FUV3Z0K2lp?=
 =?utf-8?B?bzRsY1RNbTVyQm9KZ1crZ0ZrYUZFVHU1MVc4MTAveVZRNTZpa0Y5OEpnc204?=
 =?utf-8?B?TEVmenJxbGxmZDNqSTdJT1JaN09xOWozVTZSMCtJSnZwdnQxaE81bXBxQXJx?=
 =?utf-8?B?bk83Nm4ydllwUmt0NHZYZE0rVlVsbVN1S1pJcVpKSHRTd1JmMk5vZ3NqclMy?=
 =?utf-8?B?eWduUWllZW1TSVEzZ3o2U3N3MDdPQzJpdE8wNm1wbEdxTkRmd3B5WXM1b3V5?=
 =?utf-8?B?dkJKS0RuN3ZpQ3pPNzhhKzZ6Z29mRzJHQiszYVk2QnE1TmhPSTJFRUNEYVho?=
 =?utf-8?B?QUVaTWRPK2EvUCtFVjg5eW1HU21ma0hFTjgxRHd6dGVPN21CSmxlOXNLWm1K?=
 =?utf-8?B?WXNoZWI2MFZoM0RPbzY5RmY1amtnamRCOXl5UFNGUkpzMDM4N0piNEhibG1u?=
 =?utf-8?Q?5EYqRLVfdM1otPVP50W/djrvf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce23e258-8454-4d76-659e-08dc11091251
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:49:44.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 H9iqRJ03RBjM3yYGQTxk3UMKbfZhdN/B2EX+PNACKbzkaF8m/ySW2JpxxgVnMtyLPY1DsTVLNumXpRA4Y4OwVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782
Message-ID-Hash: QJ2SYSUCTQROFBXT6TBAT7GF4HO7VJ2F
X-Message-ID-Hash: QJ2SYSUCTQROFBXT6TBAT7GF4HO7VJ2F
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJ2SYSUCTQROFBXT6TBAT7GF4HO7VJ2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09-01-2024 07:47, Kuninori Morimoto wrote:
>>                /-----> codec1 endpoint
>>               /
>> CPU endpoint \
>>                \-----> codec2 endpoint
> It sounds "Single CPU - Mult Codec" connection, and if my understanding
> was correct, current ASoC is not supporting it so far.

Yes, this is a typical TDM use case.
__soc_pcm_hw_params() call in soc-pcm.c loops over all CODECs for a 
given rtd. So is there something else you are referring to which makes 
ASoC core doesn't support it?

> But dummy CPU with Multi-CPU/Codec connection helps you ?
> I'm not 100% sure though...
> See
>          ${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
>
> DT looks like
>
>          [Multi-CPU/Codec]
>                           +-+             +-+
>                  cpu   <--| |<-@--------->| |-> codec1
>                  dummy <--| |             | |-> codec2
>                           +-+             +-+
>
> Use Multi-CPU/Codec connection with dummy.
>
>          audio-graph-card2 {
>                  compatible = "audio-graph-card2";
>                  links = <&mcpu>;
>
>                  multi {
>                          ports@0 {
>                          /* [Multi-CPU] */
>                          mcpu:   port@0 { mcpu0_ep: endpoint { remote-endpoint = <&mcodec0_ep>; }; };
>                                  port@1 { mcpu1_ep: endpoint { remote-endpoint = <&cpu_ep>;     }; };
>                                  port@2 { mcpu2_ep: endpoint { remote-endpoint = <&dummy_ep>;   }; };
>                          };
>
>                          /* [Multi-Codec] */
>                          ports@1 {
>                                  port@0 { mcodec0_ep: endpoint { remote-endpoint = <&mcpu0_ep>;  }; };
>                                  port@1 { mcodec1_ep: endpoint { remote-endpoint = <&codec1_ep>; }; };
>                                  port@2 { mcodec2_ep: endpoint { remote-endpoint = <&codec2_ep>; }; };
>                          };
>                  };
>          };
>
>          test_cpu {
>                  compatible = "test-cpu";
>                  port { dummy_ep: endpoint { remote-endpoint = <&mcpu2_ep>; }; };
>          };

I looked at the 1:N (Semi-Multi) example in the references you shared. 
Seems like this is broken into multiple 1:1 links. Is this correct 
understanding?

Also the binding properties of "audio-graph-card2" seem to be different 
from "audio-graph-card". I am looking at a simpler extension of existing 
bindings for Tegra audio without having to re-write the whole bindings. 
If "remote-endpoint" can take phandle array it would be simpler from DT 
point of view.
