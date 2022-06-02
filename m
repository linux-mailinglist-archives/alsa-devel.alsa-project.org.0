Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481FA53B606
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E9F1724;
	Thu,  2 Jun 2022 11:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E9F1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654162050;
	bh=B7Wa3ddC80ph9JZd4Da45IKDjg7gSrR99XNs2R7IVVA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GdBOr7ObUStQEtAxm+GK0vYNGZJYFrd3rDB+MG0JumUampIJTkA2PBIznDMIlV1lA
	 QIhDvMaDLDVqN7Cb7O8pA+vPl50fu6L3qGVidFspSKYcBCLSBqmqznJusL8invehJU
	 YIc7Jcuf+74nDdZ21+L9oV3chBd+WQ6Ye70KrPKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C4BF8025E;
	Thu,  2 Jun 2022 11:26:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4A04F80236; Thu,  2 Jun 2022 11:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 606F9F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 11:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 606F9F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VeINa7Q9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654161989; x=1685697989;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B7Wa3ddC80ph9JZd4Da45IKDjg7gSrR99XNs2R7IVVA=;
 b=VeINa7Q9u9PG6UsefnXKwGzfmu0EDvTPeJ/MlpPiqcQidBmjXz8c3utc
 5AdnuDtNeHOiWr8k9+PQcF3wk3VpuNE0Njlo19mmqeDR2fYqnN2+hXoDP
 5/QKVfeGv+KG7qNub1vSeceMdnHQjXDyUZZti8e8QKGd8IGbUzN+SQZZL
 Nvxrpww2i6Ha83VWRztRkcmkAUpTyeHq7lD2AGL4hJztNkmcyj5wD9CAw
 IK8bEVPO9YzoeB6Nv9MSWqk5ND/r0nnu2uuLE1TbOjpNE2vTQsY0HsJdp
 Q7rI238ph8Y6lk8RvN11A47sZhuqFXAVUN87C94b/pSsqPNef4OpPm5Z7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274693038"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="274693038"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 02:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="707485228"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 02 Jun 2022 02:26:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 2 Jun 2022 02:26:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 2 Jun 2022 02:26:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 2 Jun 2022 02:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH9ewUvIhNuep4Lu+QH8jpUkMPqy5A23Tva43csi8frvCWPPu/wmg/WmTfZS/c+0/s2oUQtnSUjN76dVAwcoTKW3QeId7r3T4AE7WFsPoZsVj7Lek++6RSBAodehTv1caQGCy+l+3bqJJKSGhk9kIkJli/WJDqYqVdSlTLpfHSlsBNQKcUidhVh+NQKJ3EEYd1tg6u773ROYj+IA/I5m/U1Tlq+8tLwUElUHsvBpfTbYEnu4YHZsis8UspYRk32w6O1L4Y46rf2u+CuF5UFKaK/RLoCSQAcx/yqCtCPlmzSquaBVK5MTAGDl5R9yB/9olrIpQ1uy0JmHc5WtHV3zqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa+0jqZ58316K//bws9Bj2WIAmp54rgPDLnPcr83HyU=;
 b=hDwD813xGEtWXQ5a14wJjIgH7AeIzjiYHTKyb5qVrwnrezuuCO4tNb5vT1+uy/8vcG2RA1Na0QCpLXwo+QGh6L16o2nIGzckEhaU38FlQ7PxHIz0XvHboHGIXDN8eevM1W0ivmN8G1y6VZ3zkNjOpOcUrEKuJMGpnccBrRwlIy0W6qslkxV2IhkpHazfdPuDtjaFaqVMhGqcKiEzbIWY7/369Eof0VUu1Q2HXqZpwHnykTU6UnICSrgxfMdxAsIy7h2P8m/0XDxjK77xUFu8n4UelC+q8jW0fVr+9SLH4o4KekzSLbDh+e6VWrJbGIseQTAdtirCws2ixpc83z8pBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH0PR11MB5458.namprd11.prod.outlook.com (2603:10b6:610:d1::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Thu, 2 Jun 2022 09:26:18 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:26:18 +0000
Message-ID: <ddad78a2-685a-b0f1-ec7f-ba1c9647c243@intel.com>
Date: Thu, 2 Jun 2022 11:26:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
 <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
 <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::30) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e16dcba6-3fc1-45de-7d44-08da4479f29c
X-MS-TrafficTypeDiagnostic: CH0PR11MB5458:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB5458570E14503C7AE9EEB1C8E3DE9@CH0PR11MB5458.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejV9NHvlAhsQV68mVfgv9p+HGf4LS9v0Xxzqv7H3kPkM6zWAUDSjl90SPJIRFjQyapfjkv6kFulZpw33bYN/w210HViE2PBhjIce+PhxPo9WTRYkKu5FxvWFACHNQ9CoCMMXNP3t7XU0XtpnUgf/1PwUzoNMGNinj5Dvq2Mu2B/MEg9Gp3nD3KFxcuHQJeJk8WKsHUdMt6RnRygH96BVdg78QdJexLz/tOhHfPdhSazVqxjp4hqXecRWfDMKACmueTlwi/QEi1yhElK2Rm1Hwa1GR5KXi2YSR+lj1lC7+e/B3j/268o8HEZtpi/78YTaB7kMm2I2Z5QzErxl++Pz7yQDc/ED4k9YPG4XEeWwmj26GsGhIx5y9xn5qoAnmdV24o2PGZFCdgJGT95EPUKO/vQUt6sIZsjUtrG7JLnj9ys1IZaXoeX++Q/zZipAI609zqof+ywOY1aRdQZL5j9OzXLqbWHRBQhNsvpI7O0yv688CNeMz8B41kDT3feoPROdFvCIZPXM75UugBdMXakvNxKn1XluYHhKIwUuBgeyga0Hi0d9xYIoR8kIr+nmAP76EoS4jsZodiSKgHeTtH8fZQM4LfRyCaXp7JnK5n1uPiqzqMeCp8sCwDEirYENpn0tvnG74TY+UJ9A4ZyO1XdL+wL3og6dE2yEjQPunaPyBsYWS2wFUet5EvlbSM9cCJ7HuxK+HnbenkIphsIFUNjcXbsJkQ4lDFBCI7+quTde7MQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(44832011)(31686004)(36756003)(5660300002)(8936002)(2906002)(6486002)(82960400001)(7116003)(186003)(31696002)(53546011)(2616005)(6506007)(26005)(6666004)(110136005)(3480700007)(316002)(508600001)(66946007)(8676002)(4326008)(66556008)(66476007)(54906003)(6512007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RC81b1h0aDJjd2hvM2dvYzRaZG5JNlB6bFdQa2Y4MGVsczBYeHBUbVF3SWZI?=
 =?utf-8?B?K09NRE1KN3NndEdqTXNiWVhwNVRSVkJBSEtTSXpVVUNUeEh3ZzRYU2lpUnUz?=
 =?utf-8?B?NXRnaVpoWERpU2IvWUtDUWQxZktEOHpFK0lsMG8ydEdGU0pGeUFzWEJlLzBu?=
 =?utf-8?B?TmEwWTNEaVZzR0dwVk1zakc2NUFoZHBFcW9xclZHVzF2Y3ozNDFQdnBSMmRL?=
 =?utf-8?B?REEySFRRdnFzRWdjaXdLNG5qeDhuODZWbWpIRWNIcDc1ejdrMG9wNjN5bEJO?=
 =?utf-8?B?M2FSdnlRT1RZZW1aOFpkdjkva242ZDMybWhWRGxuNHA1ODZHMXVRbjF0amMr?=
 =?utf-8?B?YzlPMlFOb1ZLd09TODZBMGx2UndBMnFQRFNlVktUMnhUN0lCam5KKzBQbnll?=
 =?utf-8?B?Rk1LeE1mcy9MVVBQdWp3ZXFrWGk0cHdGUmw1WThwZkNkZ01sS3Bxa3FicUNh?=
 =?utf-8?B?bDd5K3JyWVBpM2RicTg3ZEdRMHMrTkFnQm9YUWhEb3FuVVZSY01DTjNYdktI?=
 =?utf-8?B?R0Z1aFZvdkhnWG1FSElqL2I5ampHdnREaXpMWFc0YUcyOVFaR21ZakZkSys4?=
 =?utf-8?B?YWRJeEw1Y2tjSExSWGxoNG9tVHV0YnpqeGs2eDFHZHM3OHU2WlhTbFVFMFQ2?=
 =?utf-8?B?ZXlFUmw3UEhmRnpIRStKUUJjOXdmVitBZnY3ZVN5R0xFQ28yMDNicjYzcUlu?=
 =?utf-8?B?clJCK2tEWTZOTjB4bnZNN1ErakM1TW4zM0dLZFJhR0ZST1ZqMzVFZTVEQlFP?=
 =?utf-8?B?dkZRTkpXUmZmMDBNMzVwZ0hBaHFjczBlWTd1d1k2dXhPVFFOdjRycmdXZjdK?=
 =?utf-8?B?TDlHQy9tVmJBeEVvYUdXemxGbU9KSmZyTXYvMGtiT3BOK1hBeFNwbWFzb1I5?=
 =?utf-8?B?ak5WbW5MNEllZmRWcnVkbTBKbVlpMXpob3BucEh4Z0pTWFFLdEd4dG1MakZ2?=
 =?utf-8?B?N2NTVHpNcGxESy8yQU0ySnJrbFZDTFZCbm5jb2R4eFFmL3AvRytrZ2FXcmZW?=
 =?utf-8?B?cHVPM21UaWRtWSt1N3FMQ0FGMjFUOHd5RjJuc08wbTJ2a2ZncVBLYTJKaEJV?=
 =?utf-8?B?akhIT044VVAzNGFoMlY1QVJpcmtLUFBCb2xoZU9xUU1sZWJrV2dhR25hSXpR?=
 =?utf-8?B?MkN4UmxpWjJiQ3NmdVNaSzh4Q21aR09PakNLSUZKNS9zZFIxTWxIU21pLzZ2?=
 =?utf-8?B?ekFhR1V0UWpIR1Q0Vko3ODF4bGlVaHlSeDVSamNDc0RqNklRdFRRZDhhUXZF?=
 =?utf-8?B?N3l1ckc5L2xEalVYS0FEMXJyUTZpVGZCc0NKUnVqMSt1MXQ0bmFZb3NsVXdv?=
 =?utf-8?B?cUc2UlhLLzhvKzZnZVZHK2QyYmN0NWduWEZOZ0hML003bWQ3NHNmQkhyc2lp?=
 =?utf-8?B?ZEY4U2p0QmhheDQrUFpZQlR6SzBreG1Jc1JYMWNVbFp6VHE5bldaMjZMOGpS?=
 =?utf-8?B?V2k0dk1NNXYzaEZxRzg0YVk2UUdoc0UyK09mNC9CdnBkQkxkWjA5UFRLUDdQ?=
 =?utf-8?B?dHpkajlXTmhUaWM1L1JDSThFQjJPRU85M2d6M0F3eGFnbG1uYXJBSEFXaE5p?=
 =?utf-8?B?TWhwc3lKeG5JcEtpTnpoVjQxdVFEd09WZFd3d1VnanYxSisrQUlCTlRET1JK?=
 =?utf-8?B?WU5qSEloWWFubXI2QnYycmF2bm5IakJpempmbEkwRzNXeDRGSm1nVU5wTGtt?=
 =?utf-8?B?UWxZRHVBTUtHZ3MvTE00TEVVS1NwbHdLVTFaS3FJSC9WYi9mK3lmTlBqSldN?=
 =?utf-8?B?OU45YXFnNXZ4WFhvcFByc3pJbDkzYy9UQlBxVWwxbTNQVDZNUGF4elhnVG5M?=
 =?utf-8?B?SEJmK2xLbGcwcXYvcytYK3d3VVVOR1gyTCs2ekpYZzZJT29pYUNMd214SWV3?=
 =?utf-8?B?cnZVcWZFRVlXLzV3blNNZVozWVNLTHRxR3RoREtaVWwyeGlPdDlZU0FQMzdB?=
 =?utf-8?B?VHJBN21RWGRvWjF0KzY5c2M4N2kxN3BTMG5IeVByRHBnbk5SRjBJMW5HM2tw?=
 =?utf-8?B?cysxbTk4Z3RwTVBkZGdQYkNpeXpPU2dSUkUxenZiUjJzcEhZRUJSOHVnWnVK?=
 =?utf-8?B?ckFOaGpjbllDNVY5dDBpODQ2NWx4MXIyN1hOd0h0VlNaeHcyd2w2VEJNQkV2?=
 =?utf-8?B?ME85bElVWDVkeXhCTVdSYnRMZVlrQU1MaVJ3OEJHQmtvbmZOS0dGZGhoNVJh?=
 =?utf-8?B?L2xDK0JTaXJxSHlmUDRhWmRqcnc0QVo5aWdka1c1R05RdU5uME1EQlBndDZF?=
 =?utf-8?B?RFVqSXg3cDUyb2RPS09WTVBNdnAwd0k1NFRXZ1hwMXRhaTNtSk16RCtBK3N2?=
 =?utf-8?B?Z09nOUtla0hLUGdnMmVCWEROVGh1NFFPT1U0R0l2a3JTTmhtcmRZVlJiQ1JT?=
 =?utf-8?Q?ZRoj9MVM1T+TYLzU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e16dcba6-3fc1-45de-7d44-08da4479f29c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:26:18.0777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rp+U0AajYi6LjgnrWVyuOcLsCfzlcIc4+cIDenhY3pjfPBXt061LBB4i1urtt+SmqF4mUUsnroLrR/Gi1peWUElfScGonnUqmNC0WPYMPaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5458
X-OriginatorOrg: intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

On 2022-05-27 8:50 AM, Kuninori Morimoto wrote:
> I'm sorry but I'm not well understanding what does "machine device"
> is meaning here.
> But anyway, if my understanding is correct, AVS solution was like this ?
> 
> 	+-- DeviceA --+       +-- DeviceB -+
> 	|+-----------+|       |+----------+|
> 	||ComponentA1||       ||ComponentB||
> 	||         [DAI] <-> [DAI]        ||  Card-1
> 	|+-----------+|       |+----------+|
> 	|             |       +------------+
> 	|             |
> 	|             |       +-- DeviceC -+
> 	|+-----------+|       |+----------+|
> 	||ComponentA2||       ||ComponentC||
> 	||         [DAI] <-> [DAI]        ||  Card-2
> 	|+-----------+|       |+----------+|
> 	+-------------+       +------------+
> 
> If [DeviceA] could separate feature into [ComponentA1] and [ComponentA2],
> it can use multi Cards on current ASoC, but it is not a generic solution,
> as Pierre-Louis explained. I can agree about it if my understanding was
> correct. At least my Sound can't use this style.

Hello Kuninori,

Could you explain what you meant by "my Sound"? Perhaps you could also 
share location of problematic bits in your driver (file path + code 
lines)? I'd like to take a look - if possible, that is - to better 
understand your issue.


Regards,
Czarek
