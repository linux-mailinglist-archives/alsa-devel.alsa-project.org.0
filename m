Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4A745D44
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 251071E0;
	Mon,  3 Jul 2023 15:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 251071E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688390913;
	bh=32Rfy/kLAR8uioNx91phv6Yus5kCLln7cZiUXGzxvJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DERoQPmUlvL1McwxwOiuW8JHbOS2o0+NgC2kJTV4akUN9U8LYKshjoveuwNBD0S/3
	 5ljPZFMd6efrdJXfnqrxM+c9uOssYlEHDK7nxPnfhDg47vjvZ51LifXADiN7esTVFg
	 KcOilNRCRKPDoDSTNAHS5JzQcyPDrihRrlyaMQHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B59F8025F; Mon,  3 Jul 2023 15:27:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BBCBF80104;
	Mon,  3 Jul 2023 15:27:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F59EF80124; Mon,  3 Jul 2023 15:27:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75818F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75818F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VOOuvv1i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9NEkcvwxo9rlNeB4evSpEeMaJOnTMo5Uxwqco2gHUMJn6xeRgAq/C8h44oNMvHOd0e7VsCJsIzIkw3N4kn8WlAVnER23mEl1gOk2fj2FZEblhlztWol0hgzoCmqboHbpEDtnHIpWG/l/7eRfuvZ3I5MaOclUk4EtO8zYfW2lJr3e/IvCNEprrc6fKwhbm/TmdPpb0LlezrKd/Fhq70+YU3T6xylcq0bJYs2vbTOa5ZHl4mr2KPby4/mte1J2+C1DkC1Cza05XPxC5fxRuOvbo/JzwbQxHHbvY8oK3J4YM8VPg/1gkgfBh70MiBf7Uwu5CYlTxulYCkzbJ0RcQ7hrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onnPJShB7vv00Sc6pr110G1fpRSCVo7N0zHP1nDf9Gs=;
 b=WG2AU75bMBcAF3WMHVQabZ+eUUzZKYd2+/Gaz+BX2ykINgxTbeRF8thQ52TZl7OA8wdWhEEJntJ0Qk2uGVwd7cExvEIttlGAfmLT2i1crJSQDk8yf65cZuPCOOGFkG5IIvP2p2f7DiIId6gWTwHzVU1K3+PGv7WINfxXYy6bDsB+qcRFJ5e00Uzxtt3wHV2elP+M/r5L9xSIa9y4ofEU/JyzFKqjbZ9mm2S7A5jw+XzqxT2T6mqlRSl9aSuBuDwa9FRIKDDU/PrrTV0vsA8tXAnyUiF4Id4FdN1UAmIHyuue82SwrmjyeYJFUNgjVA+MM0Cm+Aw53Y9D1wiz4aExUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onnPJShB7vv00Sc6pr110G1fpRSCVo7N0zHP1nDf9Gs=;
 b=VOOuvv1iCUhFWHm53rFOvK0RvRAVkMtF4mLbnDYqjcJzZg9gRc2QWrmknyfbHBoTKTb96gh8/vmcfXprk/Yd0fFYzeR1ihef/81eS4tkDzCyFAo5uBdet2u0M85IP5rlt2uTcIkP25tM8Ey1KTq2AfsvJtVzcgkeAvwusU/KuhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 13:27:28 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 13:27:28 +0000
Message-ID: <489e8631-b773-1916-40a7-3fd73af54c19@amd.com>
Date: Mon, 3 Jul 2023 19:01:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
 <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
 <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::12) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: 9135e34d-40f6-40c9-39ce-08db7bc93f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0DyEwZsX2WSf9PuHQ5fClhhd1ervHjNVWRqSNnwpz1s8ubLQDnMfFaoZrtkSBkV04b1YTKrrIt28B5UI5P7GGcWsDbAoWM6T59FiX5bOQ8a5QeFa9Y9P+vssyHW2W18AMVd9kpuuBK+IViC+ywTGpXf34sbPf99zkyE/L3r1q6KHvjTF1xqgnGNOKZDWQEbI1OoaqTHF2/vhQHfHri82JAivM7mwiDebhU/K1ejsUu+abtT5JWLB525ZI/Pn+UpYF4uV0ubgbPVOdbWSi4L133cJL60uMnTvhjqRGITLUfSD/xcuxjYoJNRvupt9Lw/yZvDpp6m2S2BC/qYIDewfbRD//WziocVZRgso94j8ZSG5ju7G15wR5RniQPvQUt6ghikG/Km2XLLJVdkkpBKF3z/fUwu8QtGERJBPiMdo1HelsqEgLdl8rRiXVRmdXnmlxmvLzoWgroUpKpa4xEhMzx65lOj8pvscjRBXTx9OI/abKALqwwM5e1v2SWMrmJSEMWhNmYk216aiEpk9z7axElv+Ujt0WBniRL1CnQV7L4u+/UEhyzFrn0YFgWXawZc7KGRexJVikT+NPtVZDx9Ke4qUowNCtCNkFL9Vcw2MwHmtxuE6pyGTfc8BPkFHxfqOTMhVeHAfFFH6OKjZmGcC8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(53546011)(6512007)(6506007)(316002)(66556008)(66476007)(4326008)(38100700002)(66946007)(2616005)(83380400001)(186003)(26005)(478600001)(8936002)(54906003)(110136005)(8676002)(31686004)(2906002)(6486002)(31696002)(5660300002)(7416002)(41300700001)(86362001)(6666004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjZ0WDdmRjRBaVRYTXJzeWRjYTFjSXo1alJtSS9SMDRHYXlWTFVBSDluRXJn?=
 =?utf-8?B?NHdjWGU0citrZ1I3VjM4aEpNWFRMZi9paCtxYTBod0NxdnVtRThCS0ttTWJw?=
 =?utf-8?B?QjV4bk5VSTBNaEc3bzNDa0dqL0Q4RTVDclp1cDljOHVBcjRYNEZrbTVsOFNv?=
 =?utf-8?B?K08yazFmK1ZkOExBMDNhNVIzdUhlRWxKZE5MaEZFWDh5RktTaDdoOFBWS1ZU?=
 =?utf-8?B?V2tEUi9hcVlzR2F3MStEZWRiSkgvQ29ZdExGZCtWaUtNbFA0YVVnWjZETzVY?=
 =?utf-8?B?dTUzcjlvMk9Vei9jaUQvRW90cEpwc2hmTFlaYVRlNGJqaEVhcTVLM01aNjVR?=
 =?utf-8?B?M1BIMWdVMndOUlFHUmJmbytYakR5OFpKVFc1MFU2dnRocmVKNFlsd0o4YTNR?=
 =?utf-8?B?eHlPWitHS0ZVM2JQQjBtd3lMdW0walJpc0NFS0tmQ21adUpFM2lyQUZkVXR6?=
 =?utf-8?B?VTVKZG5kMGQ5SEhOcXYyYlRmUFE1QU0yZ3VpUGJDMGEyOFZlS0VMWnFSN3ZR?=
 =?utf-8?B?LzlxOEVJbjZyQkZaVllRR3RFODVHeWhTNFp4b1VPQmJlZEQ1Y2RkQktOenh0?=
 =?utf-8?B?ZXMyTjlJbFNOZkdMSHdkY0NUVE5SeDVWdGR4Q1FGMlA1MXQvMHdSTUM1czFt?=
 =?utf-8?B?bkovL29DaWkxVUJtRnRKaHVyWXNpUFV5NlVEU1NEUUEyRG9rZjZISEd5VnBH?=
 =?utf-8?B?UktvaXZXNER1VGZLRGovK1MraWxhemp6aG1nS01nN2VMeW5pdnBRa2pnSi9y?=
 =?utf-8?B?Z2VTbWtKQkVOcHY2TkxCNFFLb3FTcVlQbS9KMWIyQkwrc0xoZlY2T3JrMHNM?=
 =?utf-8?B?UFduTlM5bEtUaDJkZ1M0YW5JWFJOdnRzU0hIMTlUY1JPdjRlR1VLeFpiSnFP?=
 =?utf-8?B?S2tiN0ljbUFkS0lrbGhqZVpZSWZRU3N0MzRrRDVSbkd5dWwvNmh4aUdzYS9v?=
 =?utf-8?B?VGgxQWNwUndrdEFCNXBiWllyelAvL25rVUhKWVhZOVNIdEp2WnNuMVZxYm1T?=
 =?utf-8?B?dlNIamkvb1FtZndvOFAwTlJoWWlXaE5ZRzVheTd0WitGcllyc01yZEFVcHZG?=
 =?utf-8?B?SGJORS9palRPWmZQWnNpS0JaYWFFYmoxNVVVM0p1WDQ5Ym5BTHA4ODlQeHlU?=
 =?utf-8?B?N1MvMzA0ZU5INVRncEZKbVgvekdYWnZIbTdaTCtnam5xaW80cndIOXhMS0x2?=
 =?utf-8?B?L29DUy9XNWVNYVRjcE9SeDRzY3ViV0dOQzNUNVVpVlNnUk1ZbVBiSTB6cE5W?=
 =?utf-8?B?dG1mbDlPblBJbjRtSk93WUVBaTdWNmg3SVY2ZmdjMlUrMDlVQkdScmFlSXV6?=
 =?utf-8?B?K0JjWXU2NFlMdG80OVo3akxRb293NC90SHVkK05QRkdqSmFFV2d5aHlWWklS?=
 =?utf-8?B?SmoydHdZL2tMcitTR25UVEp2K0FPdk85cEF5Y2VUdmpCTEdIZ0V3RCtFbjNX?=
 =?utf-8?B?SzRPSXlTaGlwNkZLdkZQbGJ5amV5M0tCd2IwblgrWFd6WWdoZUM0MDJLWTZC?=
 =?utf-8?B?MEFhbDRYWDVKYVpQMmZEb3BrWjd1azdRNkQ3REhSdnVndUd0TE1XNHdqUWdj?=
 =?utf-8?B?ODArRjVkVldKa2t2QUJQMnlDbWxxNHFaVDNUYmRxcWxpR2p2bFUrNHFQWEJm?=
 =?utf-8?B?cU5QMDlDaEN3RHZxd3VrNExTUEV5OVhwaWJwRGV4eWM0NzZ2djRHOVZ6NEt0?=
 =?utf-8?B?THJZWmlFdTM1WUUrakNwak5YakdoQm9qbHJ2YmJaWmdCUlZMM3RhV2kyT0pI?=
 =?utf-8?B?RzVOa0FkelEzblBCNXp0a003MW9kYU9ZMFFlVnZNZmR2YWcyWWNTeDBDcGZl?=
 =?utf-8?B?emZ3MVZzUVUvTDVnRXFCbm5DZWNzQ0FLU1RaZnZRQk95WmQrTjgzcWtHV2xM?=
 =?utf-8?B?d1JDTXdTOEMzd242TkwzQW5xSnFOcldPRVFhK1J6bVZkWDE1QWovSFR2Qy9E?=
 =?utf-8?B?YUs3cFlrcVZ1bEowd01kVXc4RjhJNWQ5bmdjSllRM0Y0ZnRnWmxoaEJnZkFU?=
 =?utf-8?B?YVJXL0l4NHdaM1NNNTZhZC94Zjg3REdpeHRTVG85MlN4NU1aUzJMQ0o5SFA2?=
 =?utf-8?B?cU53WVJxbXltdThHc3l1bEhVOUR5TXRqUm9lM21nelpQMmQ5cXBIZ3ErZkx5?=
 =?utf-8?Q?83aAdYbxtbIfkQPDVdWU3ZZpu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9135e34d-40f6-40c9-39ce-08db7bc93f11
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 13:27:28.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AavFa8UmEOtmhVG/Rbec8aBwLqpkMX5qNp1rH51liatsoOxKI56gVZM1fphNgmfvoFDjStmBBQ1hRL0cTPuT+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587
Message-ID-Hash: UVV3DVSKI3P26CUHJBGFIGD4HGI7TTR3
X-Message-ID-Hash: UVV3DVSKI3P26CUHJBGFIGD4HGI7TTR3
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVV3DVSKI3P26CUHJBGFIGD4HGI7TTR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>> I can see that the interrupts are disabled in
>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>> is used... I don't think this commit message is correct.
>>>>
>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>> disabled at all during any clock stop mode, and it shouldn't
>>>> otherwise that would break the jack detection.
>>> You are right. The commit message is wrong and not clear.
>>> The situation is that the manager driver uses the clock stop mode0 to do
>> system suspension.
>>
>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>> that will create lots of issues, that's why we perform a full pm_runtime resume
>> in the .prepare stage.
> OK, I got your point. Thanks. However, this issue reported by AMD. 
> The AMD platform validated system level pm and runtime pm ops with the different modes.
>
> Hi Vijendar,
> Do you have any comments?
On AMD platforms, we are supporting two power modes.
1) Bus reset mode
2) Clock Stop Mode

In Bus reset mode, bus will re-enumerate the peripheral devices
whereas in ClockStop Mode, applying ClockStop Mode0
in both pm ops (runtime pm ops and system level pm ops).

Currently, SDCA interrupts are disabled on peripheral side, when system level
suspend is invoked.
For ClockStop mode SDW manager is not receiving any jack alert when
SoundWire manager device is in D3 state.

Our expectation is when ClockStop Mode is selected, Only ClockStopMode0
should be applied for system level suspend as well.
We are not expecting bus reset.

We have validated these changes on our platform with Clock stop mode.
It's working fine.

>>> The SdW device will not be re-attached when the system resume.
>> it will re-attach, and in addition it will lose context because the manager
>> performs a complete reset of the bus.
>>
>> So what's needed is to enable the interrupt, no matter what happened in the
>> suspend transition.
>>
>>
>> ------Please consider the environment before printing this e-mail.

