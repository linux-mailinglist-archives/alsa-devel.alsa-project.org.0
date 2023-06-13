Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4372DF5D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 12:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAE11836;
	Tue, 13 Jun 2023 12:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAE11836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686652005;
	bh=u2hMOQSC2EXaNmrvIPUlb/A+WfsIgdh1AyBjP2ou/Uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iJM/pJVU1ip1BEgA+F/8f1Tk7E7LVrHzUY9doFPGRAqRsoTHntbewVxlPA1sNfELz
	 vV5pSMKmG0YyxH+HT6JImr2a63IaKi3GW5l5lLKU/Az0/E0cI6nZYEZLDut8SB8sxH
	 qqOSgFkIgun9THLdfz0z2flJl89Waxe/T3QnKX50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 844AFF80533; Tue, 13 Jun 2023 12:25:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E79F80132;
	Tue, 13 Jun 2023 12:25:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9F69F80149; Tue, 13 Jun 2023 12:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ED2AF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 12:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED2AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=dU4uRutc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqHKdRN6evS77WfIUzGVdd6Mj9ItoIGpKYT9Ub0LfP94pnosNKtIbuCNZ9wXcTH1iHaowSfC6a3ZnP7xyVoDJq6Dgs2vuh4SLI9jVSPDqzev9H072Ro4CRdC1AJdmQQa/HO2xKzVjo5bPSFquIrdUor53Ft9ZyeGvAPuWOgCBAkNcJmeMqYrFIqAo+lrvGuZPMiOFI/R9ncVJeyGV//xp3dyfJwEX7isV1ElVdu3Fa/H/wXFKFLhEQRicg3jf1X6jNXtIWuScvgaKNfKuKm2dgXTs684Gnr59UDfxI0bASXrEVnqcopmsgKhx1aGe2Q5/TGQss1QC5qKEVR7blQuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXItUbGHOYbtEXG3QKFutproUdd1WiDp9PFhezJswH8=;
 b=JY1cdrkPQrE1vmeUxPbSOFPRdj7U+6HMKnvABcYUX+YQO3bMadvImh2JJhwOZnL30mk3mY+Q2QVp0WyLaG4C6m2sBmvrUTUQ6TO/HUkKzZC2ZUwl+Rlkmh/8FjOTHfwTOyc9sMAJUS8ylgI29eVNx+5SI2gSMbgn89vPgZQjfzYyJdGbCcwmDj7wNiUiFU2WZJ+ijLmebMeCRmAFENhcgh12dKa0sWKH/k7VmyoQ6jpstIsvV/ndS85FXNafxzL9GJ9t5nGJhFWe6UWMeC5H7xf1acTmrUcqmimitE/QOo7HTPOeA3Ip9KbIil+ugOrR74mDN2Hj4vk9fvCzwbIayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXItUbGHOYbtEXG3QKFutproUdd1WiDp9PFhezJswH8=;
 b=dU4uRutcGNvXVfLRkwReuHiF9H5+GSo5Jb6oK6T6Jtn+SqbbnVKSGnJ9If98NebtXfXN1+JAc0DcxAQdcDzAHc5XB6GrlUkpeb/4I6e1M0mTjySDOvoNTXUnYSxwEFWzpbfunbpszUAf/pBq0ddtEaLdR/j12YMgzmO0jv/8VVmyefjsRpsYGVeQLNZos04IJ+ybJBMTI14BNlYOpLj6vAbGNs/JLpqog7nbit5XceGUDcgtj09/BXbc4o0mHUbqki3KCUoNLITFVtFsmBtkygE7PE++dOanm8QV+FzUdaKsZCOfeVVtX+/BkomuHLd0MAdxIvJvbc5XbPTV0dETHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.29; Tue, 13 Jun 2023 10:25:19 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 10:25:19 +0000
Message-ID: <10c32da4-133f-9e07-d040-82c218900c7d@nvidia.com>
Date: Tue, 13 Jun 2023 11:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: tegra: Fix Master Volume Control
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230613093453.13927-1-jonathanh@nvidia.com>
 <87mt13elff.wl-tiwai@suse.de> <87legnelbv.wl-tiwai@suse.de>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <87legnelbv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 23880877-dc34-4922-5e8f-08db6bf87c82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5wLkex/Vj4AY/jpPNe/0A9rIqggxKyMwIQCKhFrM7W/Siy4fKfHhp21mOqKe+gJwydRZ1Ppp5FPC61to7PxCxV9u6jOuigOOdXutuUQ8GLR/LKl9UhkHzzI2fRgqoJ6IAi9SrbiAj2iOCQeWl4tLqP2EXnkP8wtnaEDesdnCGIVrCPYm3LrGYmUsQ0fyBd10/VN8u3TKVDStUeuJTXiD9z/Qn26ts681tTZmlYMdO/b4ZuNyLE5wjkeGk/jxykl3OfuU4Zbjwga+SNDTKx4QLHC7U8P7bY5DHiYdabRXmLPVYI3mvKbCNj/nVO8jCpienTyUi9CsxFw+6seeN9Lpa7BMOsd/vpkr4dgxD3thg/FbWK1LBrAG5NvENRT4OPoPfJV7QHzWUcwRLzrdp5kzthDP+pzp++XUj9lHeYqFHt3cBqqDMrNU+vk/wBt/y5IE7A+x1ShIvQhLt8XdlrhXVr0iZz9dr2PwdoN99GLkioaZHwbFLny6R+VBU2fH4T1PDTZii/HlHT3Ov6GyukLTMV1R5cDjWktOvzz0hgoGzI3zmejMPOyx7pBWAcIErk3tWeUYg6zF9zADp4kpsqQs0bmpolZRzSgDiROZrVUdpzN9iduPs4+RSDvoK4ISkD/IToHZMjtANrx3hRAB5enjyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199021)(2616005)(83380400001)(86362001)(36756003)(31696002)(38100700002)(478600001)(54906003)(4326008)(6666004)(6486002)(8936002)(8676002)(2906002)(5660300002)(66946007)(66476007)(66556008)(31686004)(41300700001)(6916009)(316002)(53546011)(55236004)(186003)(6512007)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWRxcTM5VmZWb0xUdFJhUUVBTm1UeGF1NE1pdWZ2YjFBSWdvc1BSNmtLY2tM?=
 =?utf-8?B?dW5qODNTVjB0NWh3TG5OU1RRWVN0WDFRclgwaEMvcVBLbDBVdUlzUVFBeTJ4?=
 =?utf-8?B?Nm1hWjVCUkY3Rit6UlhOcUFMY2ZtS0V2UFJma25XbEVOdVF0WXA2MC84VjNJ?=
 =?utf-8?B?N2JJNnQwZjBpcUM4bUxrcjdsTm5vNEd3clZTekp0ek44dkVJcXhnWUZWRHpH?=
 =?utf-8?B?NWFxWEJ5Vm1udEg3VitKTWNzeXE3dEZLNm1OWFpRT0VYWTl6VE5JL2lzOUV1?=
 =?utf-8?B?NlI5VUt2WUJueTM4SHl2anJoL3hYMW81RnNMdFFIeXNOMHJuZU43L29qeEFz?=
 =?utf-8?B?RmZySllRSStFNFA0RmFpanZJaVQ0Zk9EQ0lkeER4dFBrQ2tGYmpiNEhqaFRn?=
 =?utf-8?B?MTdzVnBObm9SY2VNMDd6ZlBaVzhyRnVmcy9NQ1UwMW15ZC94SDBHSEpjcXE5?=
 =?utf-8?B?bldwMXZCaEF0TTM0VHF3aUx2RFUzQ004SHcxWWZtZGFQazZ4d2NvMW41YXlu?=
 =?utf-8?B?U05tWEJCK1dmUy9UWHJEVjZMUExxUncwZ0VadEFlcTN0SjJCYlM5M21aaUZC?=
 =?utf-8?B?TzhudkZpMlpDRFZYYXphZEUyblhyemZqYXovR0E0K3IzZEdyalZZT2VPZmUy?=
 =?utf-8?B?NERsMVJPbzVYeTVSR0J6Q2lsb00zUXFYMElSaDgyeWo1OXE3QkRTKytZNUVv?=
 =?utf-8?B?aDRvS3hHdmxUNFNLYnZtMWRGRWtUOUJ2T3o5RHZRK0dnVTRvSnRFWkhQRWR4?=
 =?utf-8?B?VWZ2OHpPano1VjRPZUp4eVZpTnZsdHhubTlQM1JHLzllbFJ0MnlOZDN3Mytz?=
 =?utf-8?B?dHBpWUNDSHZudzU0TWlZVys3NSt1Tnpkcmhycy82SGV3czVVT1pyS0JlOVkv?=
 =?utf-8?B?WUJIY3NPU3VjRm1Cb2JSM0FyeDFBRXdNeTQ2TmpuZWZpNTdtcFVZajRYa1Nh?=
 =?utf-8?B?YUlPZzdraVJubTd4a01MalhtZWN5amhwRUNvZ0hUczFWYlk5dTR6YmFMaGtX?=
 =?utf-8?B?dWJmU3hXMUExOGVyVmprRW80UFRpUjF6ODNsMDVnV3NDaTRhcTFkaE8za3Vq?=
 =?utf-8?B?RjBPMlBxcEVJeUtQWXhxcTlnV2s2MVJrbXdQb0FNd2ZoemhTbEZ6U2pUY2Vn?=
 =?utf-8?B?Rk9OUHJpUlJHbXlFUkdRU1RTU2pYOTZEb0tzNEV5UEM1VXBoaUMyVWVxRG1Z?=
 =?utf-8?B?d2g1VEp1T1kza1hVRzJqZ1J4RmhoZFJ2RVBMR0VkM3ZIN2hOcjhWb0l5UEtB?=
 =?utf-8?B?WWVpTE1rV3I5dXpkTW9DVnlmMzNxZEErODZ2c0lvcGNYODlOSTdXUUNlY3Q2?=
 =?utf-8?B?YXRreG9ScGh3VW52Uy9IeWIxWkJrbXViaTNJZks5bnJJaEtQUFRyaWt5d0VO?=
 =?utf-8?B?R2M3VmVrQ2t5SWxVKzZ5ODJUVDNIZEM3VW9YM3V1Y3pjelNKNFNVUGZmK0FR?=
 =?utf-8?B?dG00TW9nWVRjd0pzRktmN2JCMlVpbmhZMFpqaW4xSFBvcjRzMlk2ZGU1OUR0?=
 =?utf-8?B?YzQ0dXZna1hrd3MyYTFHckxCczZCSHdESHB0UnI0a3cvWGRWUDM5WGRiaWlP?=
 =?utf-8?B?K0h0aHEvcitNZ3kxRzNuYnQ2QXhYbzd4RDhQekpVNFpJYUowRVloaXNONy8y?=
 =?utf-8?B?TFplajc2N1oxUHEzVnFFemtjK3BNR3JYak9KUFFOR05QQXBiSmJFR09NKzZQ?=
 =?utf-8?B?MStzOVlNNkQ3ODQ3M1Z2MFJjSWdaWUVYSW4zeFM3bUt1UEJFdUJVWTl0U3p3?=
 =?utf-8?B?QzFQZVA4d3djaDBnUDQvUUw4Y0xkTDU3ZFR2T1h4bVhUeGtoSDRZd0F2M3VG?=
 =?utf-8?B?NnQwVjhaaEZXdTVpa2NIQkRLUHFHZlVaY2hxNXRSS21oc05DNzkxeG1ZYkRO?=
 =?utf-8?B?T1VkOExCU1EvemJhZ0Njb2RpVXpud1k0eGJZVytjSlVCSGhyRU9CZzBzcTdi?=
 =?utf-8?B?eGI5a1F1OENHMVpXTzBqejNoU1gzNWNmUlJmaUk0Vy9iamVucTZvZEtXcWg0?=
 =?utf-8?B?K1BqbWZ5cnRBYklla2ZhVlB5WlRXQ0svUjJyYmN6L05oak50ZGloVDV0Nisy?=
 =?utf-8?B?UUFwY2dkdEYwTTE0eG1kNGNRN05aeWgrdXhFaWRJK01TYWwzeEFFcStwcElk?=
 =?utf-8?B?TVUzUThZTHlOMUw2YVgzaXJ6OEF2SVhLRGZJMHJraUVCMTZOaGdnb3Q2SVRE?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 23880877-dc34-4922-5e8f-08db6bf87c82
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:25:19.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6Rn5N9ThHhsx85SM+8wBU0i/rTbuCjJgSdLyyIAV5aipRX7YHJZg/UoPJtRbXJsAe3lNJy4DyleJmTqpm83e4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296
Message-ID-Hash: FICMTTVDRWWQHQYL3XL5ANRI3QSJKPAZ
X-Message-ID-Hash: FICMTTVDRWWQHQYL3XL5ANRI3QSJKPAZ
X-MailFrom: jonathanh@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FICMTTVDRWWQHQYL3XL5ANRI3QSJKPAZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 13/06/2023 10:57, Takashi Iwai wrote:
> On Tue, 13 Jun 2023 11:55:16 +0200,
> Takashi Iwai wrote:
>>
>> On Tue, 13 Jun 2023 11:34:53 +0200,
>> Jon Hunter wrote:
>>>
>>> Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
>>> the PCM wait_time calculations and in doing so reduced the calculated
>>> wait_time. This exposed an issue with the Tegra Master Volume Control
>>> (MVC) device where the reduced wait_time caused the MVC to fail. For now
>>> fix this by setting the default wait_time for Tegra to be 500ms.
>>>
>>> Fixes: 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations")
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>
>> Hm, it's still not clear why it fails.  The commit above changes the
>> timeout of wait_for_avail() to the full-buffer + 10% margin.  In
>> thoery, the loop should abort after the full buffer read, and that
>> must be enough.  If there were a large FIFO behind, it might be
>> overflow, but the fifo_size of Tegra driver seems 4, so it's
>> negligible.
>>
>> If extending the timeout "fixes" the problem, it might indicate that
>> the period update IRQ is triggered too late.  Could you measure the
>> timing of each snd_pcm_period_elapsed() and wait_for_avail() call?
> 
> OTOH, it's already at a pretty late stage for 6.4, and we need an
> urgent regression fix.  So it's better to paper over it now, while
> hunting further for the real culprit.


I have filed a bug report internally to investigate this, but yes for 
now was hoping to get something in place for v6.4 to avoid any regressions.

Thanks
Jon

-- 
nvpublic
