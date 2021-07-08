Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90C3C140D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 15:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6F71670;
	Thu,  8 Jul 2021 15:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6F71670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625750091;
	bh=CP88/O1AZ5aZOyL97Ei2FgxvgOsm/nzbkQUIeBCFKoU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qfCVxKulNpJQaAs2iXFptMZJ+QayiJP8vy8gVU74zfiqWZ29A1xRuP6disdt2hqRu
	 MFESgoTgest61etOYnqYB5yn8wi8CrMGga3e9s5Mi/GnBZw9nsXchZ/ij2s2VGUleQ
	 AJYAEDWt4ddNGWCC/2H/JyH8O1XPFiE43qc3m0M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3AD6F802BE;
	Thu,  8 Jul 2021 15:14:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 402F4F8028D; Thu,  8 Jul 2021 15:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20110F80259
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 15:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20110F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Np05IS2O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmvUByTWe0dOJ1uN+G/iNuidq5lLMnpmFP6PhlyCR1KLhG99Sdcj3bCFfvfnfbIq7nAtdgamUT9rr9W6A4m3DEKwwEkOmZ6y6LE3/Ee1YTty+Zyaq0EYGkSpUqATDn8uNgLQGok5rwSrgKT9yrGz61dnUUXFt5RSieJEPz36aJLBHpSFLKuKUHFv4u+OJWl+B5wge7xFosq5LQZ5inY8Ihy1xqZ/I0XTqa4B+B1oxql0T9IIGZeR0UTY9no3k8j5DJ71zAd5h7s3VF4CXj1UQ2A7IoVcP87txRcHNoM1YYIPbOReKfND/YgzVI/3xtdxHzimVFR7YdVDskkhYXDjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL9Fuuk6pmTue8RsHoq1h77TBN/0BsCmgwsPcMK4Ip0=;
 b=Yti1xgcNpIwsomY20QBDQZumwyIekag/E+Cefqr3gvJf14qJe3URg7KQ/YeWS6EvXDsGk27Ap7YlaGJR/bFcBOl85qUYGZiAPP/DIwlMrAbTzZk5Sn7D4+rKLJuXHvF9iTCRe3ywCD6iF780R09qAcP2OfDtFADkWGelk8dOUsd/o02WiQ3ERfytMtM9JFTIrI1xjVRTbSGSDOZ3NFLAwubjrS0EdPCWDcJ2FWC+hZ8WPVK+WH1W1q/fgJFQSJ3PaaaQ6VbnEDE+sFxtPNc0dYIyKM1Y0kPbwEM3fn4Hk0BO38k2TTSSn96tGQvb/b8feEyJn9scJkYWG4d9sa/ekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL9Fuuk6pmTue8RsHoq1h77TBN/0BsCmgwsPcMK4Ip0=;
 b=Np05IS2Oxhs7Gti+gkVXUAXlnxBrNykBZ1RdZjBWfNz788rgNro89KestremjQiJatEZit/us1PvbSdb8ERuvN5kMVELzGIr6PZlzuG/eaNdddr4S9i4rJkg7i4GtZ5vRUrKL+qHvwG/neSO9wd5BLb/5Jt0Mbap6qcaCknECjc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13) by CY4PR1201MB0039.namprd12.prod.outlook.com
 (2603:10b6:910:1e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Thu, 8 Jul
 2021 13:13:47 +0000
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb]) by CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb%7]) with mapi id 15.20.4287.033; Thu, 8 Jul 2021
 13:13:47 +0000
Subject: Re: [PATCH 05/12] ASoC: amd: add ACP5x PCM platform driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-6-vijendar.mukunda@amd.com>
 <2cac4b49-62f1-83a8-84c1-08add69535d3@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <3718065c-e6c1-e25d-5eb2-0d978d56bf3d@amd.com>
Date: Thu, 8 Jul 2021 19:01:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2cac4b49-62f1-83a8-84c1-08add69535d3@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 13:13:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9429799b-7404-4738-1d5d-08d942123883
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB003954B77F13EA68C7ED48E197199@CY4PR1201MB0039.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LRl7DhCYUJVk0hRpoc362cKVdvpe9pmRpFUMWPEqSwD16tAmivdQ28zXe2rHfDRy4W8uuQtp2ESqO2JaqTQJENBzwF81i9JD41isUB5fX4dJgJRiT5tOlt/FsGh3jChAV8+Et38uEBl81uWt961i8K2Yc+U073TWczmllNkfa7LWpt+R2cX/iRtPFqKzoHEkES8uC56PRW/nYZKU5bbzVNw9zpdE0Grq87+5HmgRrKIMhrP9IPI0o6rdn6fzQsn+fql1OPMfsiCmEUVJZdiKRUHhBTuRlGOziX3o2lrPIqn7grMwl7qhG748ymwP3+L8ilqeSpyksFf2EsakgAyUFvXpqBy1OJaF3LU+HNrxMOY0lIsAL/+WWYlYmEiViaCl7LeysZUem4EFUAyiJjv1ZJOauSxNvCiipe6+Bo1uULcmh1tMoKFXiVP+DyK9XNRnpmdHpKFm535dfEcEY5VPOlbAbLCUakjJj0Yra3FpKQXixA0eMQR27AYcD0PVbyx2hXajlTbDfdHlOO3A/yuQd1NXOgNvZShSC4fpaHzLe/SPrqOQwxvQYVhpgNMDblBNhtdbxJoQfE869TyDue3+WlxSYOb7ZNvTm+HP4Uu0DjXJvU7m8wgA7xDFzuawcM4dznMxivSyKxxXt5OE9tUHi+RbilnMrG1HNOAxKpQRIq8+98OgvO9F2b43c2kOrHPybkF3FDf2FuJySKhEynvzB1ZwJffSXJGeovFrhBDZRaV7vW31eXRccpetEpdxmlzSTHRy7uCv0zlZVjCCL0kWpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB2550.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(2906002)(38100700002)(186003)(66476007)(66946007)(66556008)(478600001)(6666004)(31686004)(8676002)(956004)(6486002)(26005)(5660300002)(31696002)(86362001)(2616005)(36756003)(54906003)(316002)(16576012)(53546011)(4326008)(4744005)(8936002)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGZRNG5UNkJwcWdwUVh2WENQMGtXU25KUWhodTJ1VXhCd0tnVWhuN29NZExO?=
 =?utf-8?B?OWhMMElObW53ZU9kS0RucllSdTFrUXBYMDFReXBLOC9wcFpsanVxREE0dmlw?=
 =?utf-8?B?MHNySk5YRExKZkdxMmNuS0pNMXBYTXlVTEJKdE9zU25iWEZ4SDlYU1lEODMx?=
 =?utf-8?B?aGFvNHc3Y2kyY2lKYkxndHlkdzBDM0xLdXFhSnZzQm5ubUsrc3BGbkxrUWRX?=
 =?utf-8?B?aUhDMmpMRFVEYndZRmRMTzA4Q1AzcVRaR213Z3ZiVk1IMTk3TEYzOE1sTTZh?=
 =?utf-8?B?WlBGbkQ3NnZMOUwwbmNTZm1kc1B2WFpRNjhkM0pORC9HbHpxQWxXZERhUWxK?=
 =?utf-8?B?RGh1elpKUlBpdTZBUFcvWE1OQjBmaDV6bjNVUkpWR2Z6RlA2bDNIOUFzQnVB?=
 =?utf-8?B?M0xlTTh4SURkM3ZRajV1TkhJNXY1eERnZWs3TVYzRTRpd3RKZ2dNaFZBL0JR?=
 =?utf-8?B?V0pWNnlYUmVKd255c3FodDY0Z1RZaDVoa2Z6RUZJUCt6SjRjMFJtc284TTFQ?=
 =?utf-8?B?VzgrY2tKbVd2TXBONjBRQjRkaUJoZkFHUWIwc1dWWklKbTUydGpUdTFTUldD?=
 =?utf-8?B?clM5WmlVS2NiU21Wajg0ZUFvOG1tL25nRVI0Z3FaUkdNbnlRUzRJWUtEZTdr?=
 =?utf-8?B?Y3h4T1FFb0hTWVpaOXlod2d0blJVb1YzZTRyUjNqdjYxTDNNcGtMWUJubmNU?=
 =?utf-8?B?WmpaSFhrckJleUhWcE1oakxKdEFucXpiSGpkeC9PaXoxRi9hcFRCY0ttRVJk?=
 =?utf-8?B?bmxiWVlxM0VEZUR0OVBBUzBnRUJCNDJ1NnVReG5TcU5Yb2ptdFlud2h5cjdW?=
 =?utf-8?B?a0x4TUlZeHFEblArbkhaR1dVSUVoanplZjE5QS9hUExLaGlSaVg3dmRkSHYy?=
 =?utf-8?B?WTNveXArZVZJRENsdi9FbmdRVUN2eHZkV0ZCc3pnbEpuSnlUcEpLVmx2SjFT?=
 =?utf-8?B?cU5jelc1UjBiY3d0eG56R1ltWEtLQXJIWnYxTHg4UFV6dTRqWjU5WFlZQzNW?=
 =?utf-8?B?a0dkK3Nlc1MrMjlrSWZUSVZ4MDBLdE4vdUhHTHQ5emNodm56am93RUprMFZM?=
 =?utf-8?B?bFNBN0RJUUpPSDdISEgyOGlMUWdtUUNOd0hWdncrbG82SmJ3a0xxcCt4Y1dt?=
 =?utf-8?B?cDgzWVBRRm1uckl4a1VCd3pYZzJLZWIzWmNkZjJ5amR3ZlJHemRVOHlGRXZm?=
 =?utf-8?B?TndLcFFmaUIvd3pFREN4WGMwVHNtb3JDeFRxRjBBaHFuV0l2dWlBaVRQYlFx?=
 =?utf-8?B?RjFGOUxjMVAxaS8zTVMydnVGN1d2RitDSGJpOW42SXRnVWNTWUxqbVVCbkZp?=
 =?utf-8?B?dmlMZ1FGTHZxdjRVWnNSN1VFeVIwcEdZZGJ2b2RuUlg5UkQ0eHRBRmhjOEQy?=
 =?utf-8?B?bmdCQWcraVlsdTBnTDRjNU1hNmIzSkQ5dG5xbExUakk0UmxaTHhibURqYzdB?=
 =?utf-8?B?THk4aTIxUUorbWFvWldzSk1PMmRtY1p0VVVzV1lIeUxoaVgxbGRXMzhPTDlV?=
 =?utf-8?B?WmpodzNqQUZKOVBqU25BS2hkd25hOUtQcnNoLytLQkNJZVZ0cmYyTEdRaEx1?=
 =?utf-8?B?RjJvK1FLWllBL2pXVnpDTlFYdnlvK0hXN25jcmhFeWxjcHVoMzRkSCthUDJL?=
 =?utf-8?B?TUExWUhNV3djbUhadVdvK2tLbDB3T1c1OGxKa3BuTFhHUGI1SzdFdEMzS0ly?=
 =?utf-8?B?U0pBcVZjZWlJR0hsSEliRWJnYUpVTzhKbUNnejhwY3ovRjUrQTZFOUlKbzFX?=
 =?utf-8?Q?RIMQHna7Od3xN8VO4twHgZ7cz+xV4aerZYlfaLv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9429799b-7404-4738-1d5d-08d942123883
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB2550.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:13:47.7705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZraxZpX9mkUKsB3H1HUgHn+PJ/ZXTn2XXsNng0AD52OzORQfrmHj+OQ6dW6mIWwy5zhtt8/r7zgJunufv6ujg==
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

On 7/7/21 9:47 PM, Pierre-Louis Bossart wrote:
> 
>> +static int acp5x_audio_remove(struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
> 
> can this be removed here and...

will remove it.
>> +
>> +static struct platform_driver acp5x_dma_driver = {
>> +	.probe = acp5x_audio_probe,
>> +	.remove = acp5x_audio_remove,
> 
> ... here?
> 
will fix it and post the new version.
>> +	.driver = {
>> +		.name = "acp5x_i2s_dma",
>> +	},
>> +};

