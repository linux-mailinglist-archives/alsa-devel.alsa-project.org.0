Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756484C4971
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 16:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5621EE9;
	Fri, 25 Feb 2022 16:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5621EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645803940;
	bh=O5A8zsjP8apYdh44SARxZ39jEySjdFXnxKuf5vFolIg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FsDs+1khGX6QOpb5iEGmKw4Ce8IwfX+dtUGt7q80VHweQtFSbcCzWjA1aQlOViAcG
	 rXN4D3x/gx/phqVa2eCxdj+ti5QQJA8OSJnAEEnPa8cMoi/WC1rnQcE0SFEsfIfZ4y
	 cgStVqtY3jX5tnz27lBKBeK4+AM3pQ6AP5goZNzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C96F804DF;
	Fri, 25 Feb 2022 16:44:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75140F80132; Fri, 25 Feb 2022 16:44:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A029BF80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 16:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A029BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fmqXdBX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645803867; x=1677339867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O5A8zsjP8apYdh44SARxZ39jEySjdFXnxKuf5vFolIg=;
 b=fmqXdBX3uOlWZWBGpC8Lt4aYcOUCOXJLenAPAQIP/DDw0VfzcWWF4MDa
 e8MQOsGtZOMEYvUl1pVCbDAnarAd9jSe6hNL4Zofpy6X73H6kU8pw27IC
 6wFD0WiBFKiXhJfjvvt9eLTRIZ4hSFAHYS1Gjh53t/4SmvclFgKFzuxah
 nN8Mh0KZ4IMQJmCOgJSJ3o1UvR7Z1+z0Yl6u9cOsUDV8vJffdh5XxPt32
 uZFnqtN1NVB79t7BOhu1WerkJp4jqUzW7r/BW6F/nAexaPEppkrQtnOmL
 r6De0yaZXXYsExwFx66EcNC+HfhZdfA0O3NIJme8ZFyDXIce/sHO+yyjs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="236026147"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="236026147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 07:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="592517672"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2022 07:44:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 07:44:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 07:44:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 07:44:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsPnn4ZE/FPVMxigQvEDa4xvdyM4k4d7NKAjKCQMsfa+Fsm4rphptP7hvCZwZENKIFsEnQm9Q3dT6MzKC6Wf+ReCIH+arHZwTxXhPKGeKQeXWpDB4Z8pBoi1xZlb23xxepl6Hhzv4m2XHS/dyCCe9A2814Ks+/wyfWa2XqEQ+KOQXNGhSAOTdEZhH/L31RpHXw2V//rjFpiBDcana20gdgL5Gd96ry6sqpaTBeimcYF8pCd4Zuflh83JTE96rs+uQai22GpkdXeGq7J4r/cB3/v3pDnkFMl5GAB3sbKOJ7/faRaYfcSd8HdpcZj16K+X/wb79dPJO9S9tb3SpoYj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDqlHBGbKejsKH/n3bJ1ibTzn1Tv0VNtyhqSTpMHH10=;
 b=J9PEArce6071bVPAz/MeqGGLFL46PyCoOFW6x1Jnnl+lUYMRkQrWIS23jHx2MuVG/M9wHogl9um4efWXhFlKvgUVD7NZ7C8apnCtlwD/ZyFJpFHcVdGnyhWRiDTlC69Z71aJ7rsXrWMIf8hVgy0zcXUKsCwoF5j4XB4fRrAkyPl+GgWKmjN6syN4g5rnL/xrwmdEBhqiwQtRghk42/fW9UcWkaHxVTvAgubhVEzRXmt7S09htyELdOfOPYO4s+sm8k8K7/xkhN0gEKvqFpzhepicgi/bsp9g7MxX+/A0bmkTIrxuTHyjYXPa4p3wyr3ELupxPtOlih7XOAFLLIFktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MWHPR11MB0015.namprd11.prod.outlook.com
 (2603:10b6:301:66::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 15:44:20 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 15:44:20 +0000
Message-ID: <eb26c043-f80a-d283-0b4f-299bc182a6fe@intel.com>
Date: Fri, 25 Feb 2022 16:44:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <702df428-e972-fcdc-c250-c0a73c4d2ba8@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <702df428-e972-fcdc-c250-c0a73c4d2ba8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0207.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::14) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4bf19fa-26b7-4754-1415-08d9f875b048
X-MS-TrafficTypeDiagnostic: MWHPR11MB0015:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB0015E3FF49907984BDD5D1FEE33E9@MWHPR11MB0015.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YsdIHlE8i67Vk7C/adlViZLLlw9d8SImc+o2gTCbk8BCvYP4Vqc+VzTG/S1ee4Q/QfrJBsBqn/rkbwNsnTd4AUXV4xmu7nD8rrDcBdUtebSLIZ7UwgMKc03E4ZsFh4qntZL7UiG1qbHEdtO7/ugl127iwFzpWv/SHFIK/nAyGE1RHShnNac2L1nzXBjukgIbEiqBsF2DnyYuj4ZMbMhfdQA1Hrv72IANcHbR2uA0MUckOy/xrBnMnQofu4D/2OhrXV2C3hGsR5wpDwnZ2fNiDIjW+yeONSfV9zMKX9XkIV67cgKXn/cSCuQXCrkNcbE+OOgWnvQc+ZAYMbos/wfCrjLXAChSgXGdijFHekyte48RjJ5ZJq21EvSFGVJ1EGCxOeXbyQIc1eo9v+ln7DqmvZDdJmDPRmyi9tSTgG3RoTrNunVHVNPiu3P6XpBMQQtvEc31h/KVNVFD+enahrgrkhaTMjZWtP6Y7NX71BfgJFT8JBduv7pb24C2apLSMxqRjfatz+fj4SPzLxpugXR6SATh7Esn+EsckhstZ7HJ+4GRDX0zohszgcuyfWIOgZK9NtUgywdnNK4f8mE6fTPEIBWizYCDdHe/taQ+ea9m0m9T0Lgo09aAirqKmVPTx0s6a+jpNKGxTlIVPDOJqRFbEmhd9AOWuCuXgueSKc/cF0cZilfDzis6PaqkJqtyhKC0u17BjO/NcHgQXvmXp1fp1Pr1CQa2bvOlBYe9growljteFMJTbWPtDtMdvkKkMRwL6vEp+8o1kCSGRaeZBH1iUOYBz2UGkjCpqwSu6NbTjpNm3TJdVQaeOcDbLqqeVUVq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(31696002)(6506007)(6666004)(38100700002)(86362001)(186003)(26005)(53546011)(2616005)(4326008)(31686004)(7416002)(8936002)(2906002)(83380400001)(66556008)(508600001)(66946007)(5660300002)(82960400001)(66476007)(8676002)(316002)(6486002)(36756003)(966005)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a05SQm1Zc0ZTNjNFNE9wNzlzRlV6VmJRd1hSWGdzenoxR09ndndFUGdEQ2J3?=
 =?utf-8?B?My9wOXZkZC85a2xoQVR4OTFyM1lubzFMbTVEZ3FQRHV1dG1ubU1FMVNWWjBj?=
 =?utf-8?B?YUJYSGxaaXpWWlpVYTc5b0hWTEdUck5nc1l1WUZSSFlEajIzZ0M3dktwNk93?=
 =?utf-8?B?ZmY1dUxLaHhOb1pZNXpBZ1lBSnN2R1diaUJ0dUY4d1g4NlJBY0NtTzluYVBk?=
 =?utf-8?B?MkE2Z1FHbk1lbS9MZjZoSnlDNWl3MDQ4YjQ0VHErNkVDRlAvRWc2Y0JpT2to?=
 =?utf-8?B?OUdVaVBLZlpmcUVBcVhML2tlSGFTdnJxTlc4STJqckk2WkJxWFl3YkRQQ0k2?=
 =?utf-8?B?SU1SbGZFbkxNUEVSZFBMZ0VyTTRlUDBGeC9rV3VBZlRPUkJxLzNFY2lDQm9E?=
 =?utf-8?B?ZTVZNVN4OGFRMktKU3RHVDZRMDdFUXhOMDc3WmY2Vk9adnNZREpxSzhraWRN?=
 =?utf-8?B?V2NNZ0xPSE5BbExyM1dpdnRCT3RlYkVlNVl6dE1ZVERtN3htYWlERGVmcnk3?=
 =?utf-8?B?TGJlc2hRMXRNRUxHTkUzVWVKNE5HaXdCRFRIRkUvNlJaZGNPWlRlZUQ0aCtH?=
 =?utf-8?B?SkIvSUxWMmZTTm9aWFhoakFocTgrV01wMHZaSmhCL1NEUTVMY3paYVRsNFB0?=
 =?utf-8?B?MWxqa3VGcWgxTGtsSVVqais4M0lHZWdqaVc0ZmJmSGpjU1lpd0RBN2N4Um5P?=
 =?utf-8?B?VDFtbHY1aW5tdDlSUGUyOCs5RVNmd0c2VzBDN1pORm5yNmE4NjVSL1NvaWZH?=
 =?utf-8?B?dVNTN0J5bmdhQVNpeUxsZFZ2N3BFUjJJaDdaNmpaNS9Uam12T2kxUFNjUlpz?=
 =?utf-8?B?QkprOTlHQzhsdmRoRkM3Z2w4aVlCSTQrRjZ3c1ZjakJ2NjhqcnZDY2NWcnZS?=
 =?utf-8?B?aE9PRkx1MVFMWXh2U2pMMzcyQnk3N0RVM2lBaVY1V3hQbVJZSU5ub3BpZVNG?=
 =?utf-8?B?QVVIRVZ6WEgxc3lMUTlVb2FPVmNQZ3UvMjhtTkpDcy81S1hBN1k0a0lOWUZT?=
 =?utf-8?B?MWEyTEY2RHAzd0ttRUR5U1pvbFQ1UDNLMWJEWXVNRjVWQVpLNlEwR0FtWTd3?=
 =?utf-8?B?R3I3OThlWTE5d0QvT2dzN1VON3ZtRkhMUy9ITTlXWUY0eTZ3QjZwc1BGZWxI?=
 =?utf-8?B?L1VDVUZDM0JwUHJDTUJvUjMyUWhHUm1pZ2x0UEhieW5YQlJYNWRlNVY5QzIy?=
 =?utf-8?B?RzA3M2w0MVc4NXE0MXRsVExaMk16YjM3QWM5U243UHZnMENVb0swa0lCRlBO?=
 =?utf-8?B?VmNPYWZ1YXJ5ajZFeUMzRTFQR3ZpTTFNS2lRM1cwYmhCb0RyRVk5Z1dadG02?=
 =?utf-8?B?TnVpZGpQY25NRWNWcjluRTJGUU13T0U0TkhTUU5SaTdYSVVHd1UyNjA3UDVI?=
 =?utf-8?B?VVNqNisreHpPWjdlQkNmT2g1U3VqdjVTTmhPOGdhZzBBMWcyRUxGSy9ndmZt?=
 =?utf-8?B?QlBMLy9pWG5LRWk2M3FLcTVLSXRJZkZUb2J2dUErdHdJVXlLZnlJVHNXOTVS?=
 =?utf-8?B?UHdoN05EMmJGMFBYb1UvMHQwbHBuRzFxK2pONk5PNXEybGk2L0Z2RDd5WE5I?=
 =?utf-8?B?dXNXMVBSMGNIOElIZ0F1M2tUYWhJWERxSXVhVVZ0RlU2R3IxdnE1aUxqYzZt?=
 =?utf-8?B?ZSs3ZEIxVlpBemFSWEVTR0FYaHp4TUk3d0s2SDFNRHdkNzVVVVErUkNWdjl5?=
 =?utf-8?B?ZWJKZE1RRzNCWUd4MWtOZEVxcUhZTTFOSGhBUzZPQnlad0hkdjk4dWVBL3pJ?=
 =?utf-8?B?a3lFSjh5MGQ3UnBPMEJiRjltcGZwMmJyMnNVSXJQc3g2ZzR5cC9DU25DL2Rv?=
 =?utf-8?B?UlhiZWJkeW9pL2hNTFAzc0N5Ris4UDZxWDZOb0NwbTA0Mk1XNHF4ZjVpUHJI?=
 =?utf-8?B?WDFyQlRwVE5kUDN1M0FMOTlUTVZGVkRudDJlQTQwNGlRamhnNTRhMVdoME5X?=
 =?utf-8?B?U1hjaTAyNnV3WTZvQXB0QlMvMWNNNVBnTVVsVm5nWGRQTlZJaEVUVGVGaGI0?=
 =?utf-8?B?NlovK2s3ZTFNbm1ySlA3Q0luTVNlaEw5QkJYYUV3UDJ0NjJoZSsva2tVWDhr?=
 =?utf-8?B?dEgyc0R4VUZpd1V3MVRPemNpby8xVXdXRXYzQk1ZU1lMbGFyQVk3ZE5JOFo1?=
 =?utf-8?B?ZkhrMGw1d3VDVFpENTlqYlJmaVRTVnhDZGxaRDR2RkRCVkU4VjdFRWNsNkNB?=
 =?utf-8?B?eUc4bmo2eGRMVUdHai8zYmcwUnhRVUcxYzlKalRlYUNWWklLZHhLajFCeEpE?=
 =?utf-8?B?djIxRm1JZXFucWJCNHBlbHVRaWdBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bf19fa-26b7-4754-1415-08d9f875b048
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:44:20.4823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vZkNwHQ2z0fsS9J/TKOA1WYvrIzwWSS69FDHVMp0sDKUkrpLr6ShaaP2odGCyQJLqGZfPDPJF6FdNYbjOyIbzdZ0GwkxhjXQkCvGXdlaj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0015
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-25 3:35 AM, Pierre-Louis Bossart wrote:
> 
>> Note: this series does not add fully functional driver as its size would
>> get out of control. Here, focus is put on adding IPC protocol and code
>> loading code.
> 
> This series is much simpler indeed, see comments in patches, but that
> leaves the next steps completely open. It's not quite clear to me how
> the previous feedback on trying to up-level the DSP management
> functionality might be handled, and if/when you are planning to submit
> follow-up patchsets that would implement the required functionality to
> at least match what the Skylake driver can do today.
> 
> To repeat my previous points: the existing DPCM FE/BE split does not
> even being to represent how a DSP might be handled. The BE typically
> represents a physical DAI connected to a codec, and the FE pretty much
> everything else between a host DMA and the DAI. All the internal format
> conversions, mixers and processing are not really represented other than
> with DAPM logical widgets, and that's a big miss. There's room for a lot
> of improvements that would be of interest to all DSP users.


Thanks for taking time to provide round of review for the series!

The request was to split the initial series into smaller chunks and 
separate the driver-specific stuff from parts that _could_ get 
incorporated into the framework to level it up in regard to DSP 
management. Series: "Intel: avs: Topology and path management" [1] has 
been provided for such discussion.

Given the request, we are planning to upstream avs-driver in four chunks:
- IPC protocol and code loading (this one)
- Topology and path management [1]
- secondary flows e.g.: DSP recovery
- machine boards


In regard to DPCM FE/BE, ASoC already has DAI-link components: let codec 
operations stay with codec component, leaving DSP related operations as 
platform component responsibility. FE for DSP drivers typically comes 
from topology and drives the HOST DMA part whereas BE deals with LINK 
(hardware, data transfer interface such as PDM or I2S) side, including 
its configuration.
I'm happy to continue the discussion regarding "path" in the dedicated 
series [1] as current series covers IPC protocol and code loading -only.


Regards,
Czarek


[1]: 
https://lore.kernel.org/alsa-devel/20220207132532.3782412-1-cezary.rojewski@intel.com/T/#t
