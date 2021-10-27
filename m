Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD043C01A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F1116E5;
	Wed, 27 Oct 2021 04:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F1116E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635302335;
	bh=bVbKR9lQlWkv2AMnGee9F3LCNunhbSya7thyIwxbjcM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lpQ58p7NUY0bMdkW7JnrAuRu4sMBp3/4/9efWZ1s6gru45QCzjS1g2uxSDEAKqnVt
	 lMrSvQCrfF1rYeZ71wwKLHr0HsKVlMrRQBtJhncogfTBZYYGW0VmveNw/zseXI48sO
	 XJgwbXiMjeyJ9aCfqb0dUjdiHJmUs0Tbumj7P18I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2EABF8025E;
	Wed, 27 Oct 2021 04:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C64C4F8025A; Wed, 27 Oct 2021 04:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 993A8F800D1
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 993A8F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="P/RW91VY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgBW69EJPK7gysadT9HOMWLxGyfvWwnPxkcj6ldfiAejEj2B91RsmkqDolwYRu2JEOp0+ssGUbpOSDKLqYTyNkgm/eRMdg8cBhAo6hn5gBXhFNB8AkDO29RBYkMGNzgLFP3KleB+KBx/eeMOtUo2FFAcHmdK6YVReAcn/ETxDKyaLLdGsiPFE6g7o2KKzSVI3RiD2l9hwf9nrlpFMpAiDZbhLPMxRuAohGS9vadxTIZHBNYaor+J0mXedAQGpvYnUM6IxTX+qkZW1YXdO9iwcBRYslFSE31nQisTI0CAkRl7PlJfl2bHnjKT7UsiUsVLsyXNfayUjD3cHiqCSuDgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vscAw/DTIqsXKwYjO2qgozlF6bRpQU8Mk1gkUQJYik=;
 b=d1MXUNf8kHXZQZH93S/k8vEjWzxCaAdDPGmX0wYpdTNA+PZ+KPltjrLwrTkjODWbofBYkZLmGX31HMOeazFeZQpEeaDImgw0t4q96FnnWGLMvzQ9taD4tcBiIRIf3qUPvETG6qwccHgI1/zAmHfWIKv8HPLUEvISbEHv4cz+wduIxYY/XQgcXJ2ar0Ny5IRAtCFEDk1jAX8fhLc7DrRh14dfHzoIc55tzPCa5bgDFSA6vS0eeLpJ7NlQJAfl20B6XI8CBwfZ31p/pC8m9cszbwall4I63XBcYJYx5rZEHiGP+4VgdGPGT2OY5DRgUYuoGNLUt+1XQjxaY8V6tTislQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vscAw/DTIqsXKwYjO2qgozlF6bRpQU8Mk1gkUQJYik=;
 b=P/RW91VYwn8ZgfN84Oh4z7+DydAf81W/0BZ6xTJK8QheopARJUY8T+5Z33VRGNJDDhMDOzV0ZMS4AZMsC8XE9hK9mpXBbG4pnY182ew4KOv/UJ5x/XS3yuy4uwqDViIzbGO7yEZ04IMkorSPDl41mW0LBKP2jsy2QjQ8a2selQU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK0PR03MB5108.apcprd03.prod.outlook.com (2603:1096:203:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.10; Wed, 27 Oct
 2021 02:37:18 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6%3]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 02:37:18 +0000
Message-ID: <1ee9a595-d06d-224d-cd6d-b3e4ddd27103@nuvoton.com>
Date: Wed, 27 Oct 2021 10:37:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] ASoC: nau8825: add set_jack coponment support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
 <20211026093828.4188145-2-CTLIN0@nuvoton.com>
 <55937591-e1f1-9f1e-2355-e7680026f05d@linux.intel.com>
 <YXhBt0rEYSVP9CNR@sirena.org.uk>
 <71293267-0b7f-00bd-1c1a-10386db7132e@linux.intel.com>
 <YXhRa5C8rRrslAkB@sirena.org.uk>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <YXhRa5C8rRrslAkB@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
Received: from [10.11.60.137] (60.250.207.217) by
 HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.2 via Frontend Transport; Wed, 27 Oct 2021 02:37:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b25c287-64cb-46b2-3180-08d998f2b1a2
X-MS-TrafficTypeDiagnostic: HK0PR03MB5108:
X-Microsoft-Antispam-PRVS: <HK0PR03MB5108AFAA92870FD52E3264CC8E859@HK0PR03MB5108.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SB8bhYbhLABXJkth+9D8zt+Gpp5IqKWpNiIU8cCXzRRd0CXB012E75QO8Vl70xEvYtDMr5H3ytrDXK7SF5XaS5e4+EL6jm1E99z2Hxs1YLkYAc6CUMqsnWy2dt8IqyQlWW9MqtE11ougLQVsSNATaaEcgWiPUhi+aX8cxLdUYUFHig+aGeTZfwIUq4e92hs161JkELU2NK1/DV0+9YvIzYy4+kLdolhjRBu05t7U1fwuk7YcMTTIs1v/1GL9o7IU8DNNLFc4gcxWKjxC42vK8t9WX+v8B9cjGwoMzFCzmHzVR8fxYZ+k748t/guyW2eNc1WPhH8AUGiaqiJSh45TaVqAujAE4761o3w+rk6yMvC6oZtCE3adEZNpT0jXs0VZHQ6WTYCjbYqbIyuGAyprcJ46cUKIlxxvVDNRIgcz1nMUlE2OE2tbOe6+Zftqu3FkT0hW8f2XipyoUZZ2UC/gic5GZv6VrCUBNG5yTVKkc89J+fUPtrT6puKr2DcEvtjpWWQfMDCuh10Gmhr59eCQVTSeLPmgLgRrN2uLpo88gjntyqsZ1mOZxi5fGiirGSjVTbHSvIYR44BXBsXcDo5R788DxuLEkKHx9XLd9wALtkS5oDFVi0GTfIRmXC5EcgnEIkCcJ9/iBflumij0qKv129WtBgNdrV7/GiuoF/VnZuswN3wU8CtHp9YYFOy3bzOdRvx8PtxdstSuOYCjVsrFMZkR8kjlSu2qrBOvzcHoxF+TRcFMHF85lxC80GPAxyU0IFgVuLdxVnptAKG10n9mVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(316002)(36756003)(31696002)(16576012)(26005)(5660300002)(508600001)(186003)(110136005)(52116002)(31686004)(66476007)(6486002)(66556008)(8676002)(6666004)(8936002)(38350700002)(38100700002)(83380400001)(66946007)(956004)(4326008)(2616005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTFvcnovVlJIclZ2UWlvcitzUlMvVXhSbmgwUDR3bHhCUjVrWUJIQ3AwVWt0?=
 =?utf-8?B?a0FLN3JzNkNUV0JkbTF5YjRwbGlqNVJOVzVLRXBPZ0FHSVpBNk1NZlo5Tkk2?=
 =?utf-8?B?N0VTVTlTNWl1ZXk3MWh0WlBablVya1hObXpIQXlSc0dDMzFRa3NCNVBIUXVk?=
 =?utf-8?B?cDNqaDFCaW9OLzVYem5HSlY2b21jall2ckhKVTJSWDJKVWxvckhaQ25hN2J3?=
 =?utf-8?B?WVpuS1BxcXVaMFQyb2FyQytuYjVrWjNpVHZTTXJyY3BUeVE5OHZDcEhKem1C?=
 =?utf-8?B?dTFGMU03dlkzUzFMMDJ1TVQ1T0l2NTdiTTFDWWhHNGpvbEtQQmtPdlBKeUc2?=
 =?utf-8?B?ekZhd3FHTjQwTXd5RTQwTzBTNjFjYzA0WnpPK1QrN25EaGxmSE1QblkvZ21m?=
 =?utf-8?B?YTdwamp1clhHb3poOEQ1YytXdzlTaWtUNTczQXN1R1BmdmtlWmJLK0wvKzRi?=
 =?utf-8?B?cTlSZ0xuY1hibURaSU1WbW0rTUg4OFpBSjNSaExFdC9Edm1YVjk3dHIzMTNQ?=
 =?utf-8?B?M3ZhYk5ZdDRjRnBBdzhOWFN1RWNHSHl1NXo5dWtTbkkyaVNSNnVsR1lGd1dL?=
 =?utf-8?B?VnRoeTBPbnJJTzR2V1c1dG9zV3hJYVlWaXFFR0JRU3RXRnE5NHVKdS83Skdm?=
 =?utf-8?B?aUNDcFRBSEZLQ082VHluS0VOUHZNNzA4bDBxSEJickw4UmdrTnRpcnZQY1Jy?=
 =?utf-8?B?b3ZUd0JsZ0lDR2xQY2JWRk5BVDFITm5JVVVpcy9uWGpLWTNtSmFuaUtHL0tS?=
 =?utf-8?B?U2Vadm1FWmhKK0JrQWJKYWcrRXhwYTFFblJ2Y0FnZHNEQVZOSktqM3IrSnRS?=
 =?utf-8?B?cDRpM0ZaRnlyL2cxd3RsNFdTMmdnZ1pBTHFzYmIzMGJ1Y1RDUmdhRWs3NDdl?=
 =?utf-8?B?a3puaXFTOTJkR2t2MzVRTzQ1NkRpNGJCb2RsYTFhMW1RK0hXTXl5eTRlcTdt?=
 =?utf-8?B?amUrRWV5M1ZWMFlpdzFPek9oSVFJcnhvVXdoakQ1eU91aUpEamVDZG1IMEhF?=
 =?utf-8?B?ZllCRWRJZXBKcGlYU3BZWjlibzQwbXorbkpkM0lYbG9wYVcya2dHcHBOcDJD?=
 =?utf-8?B?UU1pNi9VSzZCTjduR3hXOW9ZcytGOUJVNUV1VWxkQm5pWmIwUjV1V2NWeHF3?=
 =?utf-8?B?ekdwRlUzZFU4eU1TWHh2ZnZPTUEwb1NyNHB3YUtGSkpoTzRWUEtuTTJoYTRR?=
 =?utf-8?B?UkJPTVo3M3ZFMmJOTTZzRXpvRS9NZ092V2pjYWJ5RG9CU0ZzRjFmZjJMMXRx?=
 =?utf-8?B?NlpDZko3TEZXaDBNL1NkQnpwaCtsNGxHL2V0ZmNVU01KeHA4OW1NeTQrOHd6?=
 =?utf-8?B?aklqNnhVYjdzdCs0MlI0ck9mZFdrV0gxSDJ6UlJSS2c0RWVhMXk4Ym9RMnhU?=
 =?utf-8?B?dlB5R001cDY5TmpER3BCUG9sOWVrSitiNkpYbGZ2M2JTdHpHWjV0Z2xUWnIv?=
 =?utf-8?B?NS9zT01UaEcxQTNnMjhzbkZNaG5aZjdVaVhQVStNbGpURFdVTG9YbWNLQWR2?=
 =?utf-8?B?S3RiQytGYzE5ZldFanJiZ3ZaNHY5aExqbGEwQlVJTUdadnJ6NU9Gc2R2VE1U?=
 =?utf-8?B?UzFLUWhtN3gzdUdDVnVaMUhJWkw2RFRuTm1Kbzc0UGtHSkFhWWhaUlB1Ny9Y?=
 =?utf-8?B?TEdpOEFzdEN3TkJMQXRGSE1nckF6NDhwVzFpNlNoRmlYRGx0K3JFVkxMakZJ?=
 =?utf-8?B?cEVTdm5jcVFQYUR5N0FjU3BNMytVNlBnbWUyM3hPOExzdk41UTlGM3djUUZr?=
 =?utf-8?B?TGhvVmZCQnZ0cWt5ZTBEZ3VwVU1OU1V0QVd0SnJsSXpPbVU0OHNSdWZid01E?=
 =?utf-8?B?QmxSeG80ZTN6VXB4Rmd4RTBYV2tBRmp1RlBlSUg3aEwvWms1cHpqbk1PNldo?=
 =?utf-8?B?TDNlQlFQQXcwV1VlSEh5WlFUUnRyeU1yL0dYMHZ6cEM0S0llRHd6c0JXU0Rl?=
 =?utf-8?B?S253VFhIbFJPWXhVV1loQ3BHR0N0Z3BDRWJPSlBuOFR6Ti9XQ0dBeTFneVFs?=
 =?utf-8?B?MFpaZlZGbjEzUTZTbWM2ckw3eEVOR2plaVB2WDFDMmYrTFJXbkNMMFNRZldp?=
 =?utf-8?B?ZE1SL1lva00vMFFHeXIzVWU5SVd1TDJDZGJGcUo5T3IwOUIrdHc3YmRpUEJt?=
 =?utf-8?B?Ry9uSGR6QThpOFBhUXdJRVR4YTdmVmhBNnEzZzludkhHZGsvRGlrWFhsWDdu?=
 =?utf-8?Q?QgKpq3C5NGnLrxRgpd6MmIw=3D?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b25c287-64cb-46b2-3180-08d998f2b1a2
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 02:37:18.0959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXPgs/fME8B8W83rIh238MZVTOpzcj5WLl8XspTTqhsiS3knftWRmZLilUm5LF5iaDCHgDYRhfB1WUXf/kTFpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB5108
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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

On 2021/10/27 =E4=B8=8A=E5=8D=88 03:05, Mark Brown wrote:
> On Tue, Oct 26, 2021 at 01:53:56PM -0500, Pierre-Louis Bossart wrote:
>
>>>>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>>> The signoff is there AFAICT?
>> I meant the Signed-off-by: tag of the first co-developer. The rule is:
>>
>> "
>> Since Co-developed-by: denotes authorship, every Co-developed-by: must
>> be immediately followed by a Signed-off-by: of the associated co-author.
>> "
>> so each patch should be tagged as follows:
>> Co-developed-by: Mac Chiang <mac.chiang@intel.com>
>> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> Oh, that makes the whole thing seem substantially less purposeful than
> I'd though.  David, please update to reflect this.

I appreciate your guide very much. I'll send patch again.


________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
