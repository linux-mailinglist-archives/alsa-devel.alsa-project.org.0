Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E7671B35
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 12:48:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DEB87265;
	Wed, 18 Jan 2023 12:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DEB87265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674042513;
	bh=A01Lr0Pj9WMjYV9kyrZVYdJlSx4Nj+XtoA0wOz4+Q/Q=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jizOzb4ThRAP9xGRarLYrfm29oH9FquJ1Cn1xpXJiXFkwRirLOgdVIp0ESv75jJ1M
	 9nkmlcJPaDfUzPHBpDR4UpaNJOnDTfm1sexZ3j6Q1uG6fvpQCFuvxYAfjgU6cD7uL4
	 Jx/g6uUq/v8MtOHsP9ZxamgutvgiIcbSBfOCKvNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F2EF80083;
	Wed, 18 Jan 2023 12:47:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67D87F8026D; Wed, 18 Jan 2023 12:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6194F80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 12:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6194F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DTGEue09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674042451; x=1705578451;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A01Lr0Pj9WMjYV9kyrZVYdJlSx4Nj+XtoA0wOz4+Q/Q=;
 b=DTGEue09fkdWvqPFAkbQVPCDkB6cMiiDO/FEaNIng3Fq6qT82zWmp9aF
 CSEAcVS0EEYqQXxjnFv6sPFhgxCkpPzOMbScM9VGqagCEiVA0mI/ogRaI
 zKRHmu2xkZP1Yqb14lQlJfTog89LMSZBvgPtp9JpiaMzDik8Fj+cYgodB
 cEwkp6cC3pCA4uEOPEfDhe7hG9puP5cpk5CxJQuFRgc2HIbjBBPl8otaz
 xOn90+57Pw4fde6VZGOv9kzzqJ4YvHLVFwOYzfZzL3ftQOrOyFRLEPgYE
 dX0pXOCfDklTUyPLhrZ8/TH5H91Umdc3fmMJH90cJTX/BI0S2pHdhBmYf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="323652880"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="323652880"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="691971267"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="691971267"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 03:47:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 03:47:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 03:47:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 03:47:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 03:47:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odG+SGBgGdj8p02Ir7X9XLW5QRIju6eWvIYdF/igJSV086VSv938C3Nhu5jH9Yth+wz7fYhFPNWCKnrksvtoKigwkOnrJr3GHz/nfzOAOp7TkDwioRlWgRhuz22XRXh1HOvKFW5N7VddqEcN+bSgR2z9rDcXUWwnRjYGcQ5bCT9sLn4zSq2kpJEbKwdRGZhNiLUFcGCKsCZWdSfrc2/dPTrobt1rDUJJr7uQrWXy9q5XeSdhefAlUN92i4PyzKEwUuIpDNylQ8ci2xFL5zTj7avM451t+ahz9Ye9X4WBzcgK1baeo7Cusph9Yj1BDahvIpkqdeAJP09VdXG9fiRGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DB8Jo6xRqjCzf7qHjt3WZ3a7ypHd52wEm8yBwovPpI=;
 b=ba+6BmAVD9OG4WEmWaCJfkPaDYYBpcVrhpMWGq9sjm6B1CcqKNQZaxRPd/zXBepUa7+fwpRi6um91jf8AysgW8l0caBVXF45cfuQsj4//gAv2EkEepMvOR9XDn8JgVB8OXSk6441wetSnofJ9H75VCA40OCqdmeraso5bjYJqgc880133BdLDkiRJR6J+OoriZ7bkAsPfsicEi8OUxeCUh9LZRv3+T+eBuEczpP0NdjhL6P3lDKUBN0AZ7zkNHBNDdrHNuN/65tuQ37QHKOMKMUtDxCjYdkiz5vEx1kdrpO9o+VHuaeGBJHZmolFhUSAYwpS5WuDxUpUEBnwWh+YEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Wed, 18 Jan 2023 11:47:26 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%3]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 11:47:25 +0000
Message-ID: <2bf7c18d-7435-5049-620b-2c30065f7fbd@intel.com>
Date: Wed, 18 Jan 2023 12:47:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20230117154734.950487-1-cezary.rojewski@intel.com>
 <c4c5c2b6-7a73-eea0-e249-73441a6434d7@linux.intel.com>
 <533b79eb-443b-1181-5ef0-8e1c6bc62e02@intel.com>
In-Reply-To: <533b79eb-443b-1181-5ef0-8e1c6bc62e02@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3c9e1e-a87c-46ad-c84c-08daf949c4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4WcogAkwi4weuBO3Is9NEAo1Ob/36leCxjhITctjwWXzfvkdrgb5wcZAfScmQWSEfOWIs9LHESFw8U9EeC6wjNNTyB6ssm+mWrvMLF7Rma+hwXaeqpeSGKnnBn2NW7YKh1cz1aHW83tAUcB7phQYuVsO2TlT0KiubVRxfH5OGaYVG9JYFLzd2S0KOWVgVPnAW/iTpMp3Okh/FaiRoPzR5kHb2clloyPonRcsvUPtcXKMVz3ra8SnyocpBRXrFraOJ4sqQr+PhteMzfm2m0Do9/LsdhbD6h/KSGE1nDNynzM7L1KVhDBr/BlSX1LoLVrUqepCO24+tkh4HPN1k0mLgASMkFoHpsYnru2GvvUfuTHCvwp0RlY3g0RkWzjUCrTjiXmZjpKcXo5TgcP/gggs/3+dRAR2yeleQb0ZL/uMBY2cn5/8uHZk/+AFzqBKowTpwAWyWFS9CRfVUQN82/XddZ6vzC89q/SLBGC/Vj0+BwObAPpEJQdXMQoX8rh5h3aIRHvZXk1paGEKLSkyCyr6wn0PVdYxDNREjoxI5R2snBJItL/CSx8u7GHsH9LLBT7l/6HSy1VlKrviNSfDA7deKqJLBINHRYGu0+BshiAJUtuTJ5V2bnhun9t10DSiBvzmnGEqS0G5T9U1lfZZKDsxt+tI2+ihIzhWzDgyYtqQFyb7bU/aITzqnKYs4BZAf5IX3N2+CXalp5bDHrm/hPUZSpXhHe6fF7SptKULQF6Hnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199015)(2906002)(316002)(86362001)(53546011)(6506007)(6666004)(31696002)(36756003)(6916009)(8936002)(41300700001)(4326008)(8676002)(66556008)(66476007)(6486002)(66946007)(31686004)(83380400001)(82960400001)(478600001)(44832011)(5660300002)(38100700002)(2616005)(26005)(186003)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1ZsSU5SZGNXNHhOUzZ2Mjc0TzhjdHVhOEJCU1AzeG9ZbTNSbi9keEFEd1NR?=
 =?utf-8?B?Wlg5YXYrN1lOaGFMN0NhTWdySk5GWVJ2Y0RNR2diVXJYZUNyREtzczBjY0xp?=
 =?utf-8?B?THZCS2I4dTZKM1c4S2s4N1R1bUlsOFFiZ2RqeFBnNmd2aFpsazYrd05QTExI?=
 =?utf-8?B?YkxpdEdVRjNyWEpFRG9oOTdPMjZpWWk4ZGtnSzZlbndPSitEV0g1L3YwYm13?=
 =?utf-8?B?YS85TEhOT203bXFTNFI5dlJ6R2NkRlk5UUhTMmQwV1htcHdaUWFBWTVDNk4z?=
 =?utf-8?B?RnFPVFFnK29kWE9udWNWbmJabm1GM2dxWXN1a2FBZm12L1l4TEtkYXFDVUlE?=
 =?utf-8?B?K3VOS1BGdFRMUDZKc3NtYUVQRXZiZXg4VE04blNLZC9CSDlQUWhwQStiUzFZ?=
 =?utf-8?B?bHZiVC83dVZBTS9TcEJXbDd4YWdpdFJwdmFyWUJDeSt0aEhCUVVaZFVEOFZX?=
 =?utf-8?B?VzhjVS9vMHk5ejcvemUzbkJSQUVBN240UmVwVVRqcDRWLytwQWtGY0NYL1hJ?=
 =?utf-8?B?MlUrV1pPVG1EQjRuSElPdkxaYnBsYVVkUkZ6TkxqOUFtc3B0QlZic0RmSEdr?=
 =?utf-8?B?dURTY3Bxb1dDYUNzL2RvS05zSGhjUllDSkxybHl1VDdMMnNNNnJYUWdkY09r?=
 =?utf-8?B?S3VpWlpzRHArY3pKOEdYc0ZobVVlcmY4ZWxIcmY0cVBoK1pWWnYwVUljTWNx?=
 =?utf-8?B?OUlOWEQzM0NoZ252MWw2aER0Rm5ieFhiVkJPOVlMVVV2K01rK0M3eTJVUmVN?=
 =?utf-8?B?cUl2YVlHWDlmV0xueGh6RVQvRzBXQWJ3Wm5aSzR4TmpIMFBLK3ljZitQcUpq?=
 =?utf-8?B?TTR1dHpFb011ZEhVaFR5VzFxb2p0SHhzK2l3Y21LeE9MWFFrckM0cXNDQi9i?=
 =?utf-8?B?YlVvTzc3dnFxeW1mS285bnJOa0hsQnJvSVc4SmNiMVFCV0p0S3hOSkhQYVkv?=
 =?utf-8?B?ajN3b2ZHeHFuSE5kbTNLWkNpcEp1dVhXUUQvR0VjaERETDFpeXBzU3liWEZU?=
 =?utf-8?B?OHpoaVhVMitON0FqeWRJaGRRSHovdGtWVExpbng3cVFNQjhZWjlPNGd0b0Rk?=
 =?utf-8?B?dTdNSzU2NXlsRGN4cmNDM1NhamU3ODNNa2hqUXJ4b2YvOWRhVEp2SkdzT0Fj?=
 =?utf-8?B?dE5UaEJZTjFVRzVPNXVkK1Y4YVhzM3NIZzIvVnlSaWtmckJlemZZa2ZMY0RN?=
 =?utf-8?B?KzROaWNnUTB4bGtnT3FtWVNnRVdWZEhyU0lGWC83akd6S0NHMVJSV0l4THVk?=
 =?utf-8?B?WVphSERFZE1PWElELzNMUzA0WEtiKzdrb2F2Yy8vRS9WV1lleWV6MGFMaE1Y?=
 =?utf-8?B?aTZkWVRKNHhjWGtpQndBcnlia2xKVEluUjF4VEJQQzhOQzh0SWJvaEZLYk9O?=
 =?utf-8?B?RVFPVVJzQzJ0RFV3YnFqeEdBcGhRN2pLbisyNmE4ZHRYM1c1czNSaFRMS3Vh?=
 =?utf-8?B?N2Q2aUM1N2NYQUQ2S1d6SURUVXM3eGRYcUlJYjM5TXBSTjg0ZmVmd3VmcWZ6?=
 =?utf-8?B?dmxadWROYVFvTWFhVkpHbXBtSHppNDBxb296dXY5NzZiWWUycFpJTFpPVmIr?=
 =?utf-8?B?d2F3WUI5eEdQWFFmNGtzdS9vUDlCT0tBd0d2c1dhbWt5Vld6Y1dDUGhrZS90?=
 =?utf-8?B?Z0JwUGNYRFBaTFAyU3h5THlsdUM2OFNBM2ZCVWpIYW9pbG11RGJYZWVqc3hs?=
 =?utf-8?B?Yll4UGpobFFGOVFmeSsraFBwVldlSnBvYmlQWGExc2Z6VFFZc0hJRHVRL212?=
 =?utf-8?B?ZzA4SUYyYm1iSG5WRThhUVBxYVloMkprZGNObW9EdHpZWm9seXRDTlovOGVh?=
 =?utf-8?B?Q1I1b2hGNmovb0hxMldhWVNiNjJxQ2pTQ09NbkpVNnhGMFkvUFA1SUZLSXY3?=
 =?utf-8?B?dWIvTnZPTWhBWHBBckQxWnF2RjZINUY2Myt4c0JzWDVRL2Q5Njl3MGFsbEp4?=
 =?utf-8?B?cFIyYmxYeWRxRlBrUjQ2RXpHencvd2Rma2pSeVp6c1NzbGs1TWJjL0FiMmpQ?=
 =?utf-8?B?c0p0bVAyQzVKNytLbk4wWDRqbGJqM2FOVlNCOE0wREQyMUt4WTdlbGVieDR6?=
 =?utf-8?B?Yjk1RittOEZTVGIxcDdld2VEM2JTNmhlbjJqM2RLTDR5Wm1DVjBvOFRUVnJR?=
 =?utf-8?B?NCtSd0hqOXh5cjNpQW9nSGJSUjRnWUJzRm5UbHdteDZoU0ZFN3lxSXFSdWJP?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3c9e1e-a87c-46ad-c84c-08daf949c4c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 11:47:25.8333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrUenHHTY5+AoMvOz09Wm7j9hbxB42K2aQuNw3Xvdwg0ZfSGK6CXv7LV0SP7ZSkVeynZ7CdVS8KCjM7Nl/LhnXAfYaBx1ZQ2uthpeuRfUqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
X-OriginatorOrg: intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2023-01-18 12:38 PM, Cezary Rojewski wrote:
> On 2023-01-17 4:48 PM, Pierre-Louis Bossart wrote:
>> On 1/17/23 09:47, Cezary Rojewski wrote:
>>> Several functions that take part in codec's initialization and removal
>>> are re-used by ASoC codec drivers implementations. Drivers mimic the
>>> behavior of hda_codec_driver_probe/remove() found in
>>> sound/pci/hda/hda_bind.c with their component->probe/remove() instead.
>>>
>>> One of the reasons for that is the expectation of
>>> snd_hda_codec_device_new() to receive a valid struct snd_card pointer
>>> what cannot be fulfilled on ASoC side until a card is attempted to be
>>
>> very hard to follow.
>> Is there a spurious 'what' to be removed?
>> Or is there missing text?
>> Please consider rewording with simpler sentences.
> 
> Thanks for the comments. 'what' is here on purpose as to my ear this 
> sentence sounds reasonable, but I'm not a native English speaker so I 
> might be wrong here.
> 
> The following is being explained by the commit message:
> 
> - functions such as snd_hda_codec_device_new() expect a valid pointer to 
> struct snd_card instance
> - for ASoC hda codec drivers, when hdev_attach/detach() are called, 
> there is no possibility to provide one to HDAudio API as card components 
> are not yet enumerated
> - once component->probe() is invoked and succeeds, component->card will 
> point to a valid sound card
> - hda codec driver is now ready to call snd_hda_codec_device_new()

Let me rephrase the last 2 points: hda codec driver is ready to call 
functions such as snd_hda_codec_device_new() only when its 
component->probe() op gets invoked. Until that happens, field 
component->card is invalid.
