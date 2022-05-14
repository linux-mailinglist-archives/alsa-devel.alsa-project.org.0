Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C391B52712E
	for <lists+alsa-devel@lfdr.de>; Sat, 14 May 2022 15:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5055A17DE;
	Sat, 14 May 2022 15:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5055A17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652534528;
	bh=sNApz+29k6pNnEDZpVOFOn9zXT/erIkVyL/k/3ryrGs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yi2GlOQ6vUH44lQtJ79sq/XutmSyZ3SxyPagMk0qd3iQ7gNqUJi1Py/7Tbrk1HOCq
	 8GazdlZtiKqdlmeKANFus2jpf/57P/ycUceh4lrxVIX4q4rcI/GNddpH3KnEL8nwso
	 DhnEpEUNmway1yOvRqsLPQyg9E+d0AG+LBQgmc8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEF00F80166;
	Sat, 14 May 2022 15:21:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 095BEF80163; Sat, 14 May 2022 15:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_14,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53C6BF80107
 for <alsa-devel@alsa-project.org>; Sat, 14 May 2022 15:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53C6BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="O8Q0jhH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652534462; x=1684070462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sNApz+29k6pNnEDZpVOFOn9zXT/erIkVyL/k/3ryrGs=;
 b=O8Q0jhH6PNzj2I9rc515zReAK779W+G0GmIvXJAlLVPSXhzoW2/zDAt1
 W2ed6p+a8/AMZwAT2GM20Cb8M3inCilRNDzzgaQGcGAMCaaz1e0ijPHqZ
 G5kmjBgkc+6nBvFvDDR4yxksDluqTshijmw/qjvCfruEn6M37IlKOfjA7
 mU8togrqDRxU0ezYPCwjcGnRYgj24294WdBXQBMqhy08Idy2hYAUQpsRd
 ptDRdwPtQeDrmZpgMUD+l8fqVycW6z68ZPtCwS5MYZU4XjJe80CBrI8he
 ggqDs6a4BoVuWD3vLHN3LRmEdEKtyaRD2x7KndQuLnF1jaT0CelVLsY0g w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="252567466"
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; d="scan'208";a="252567466"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2022 06:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; d="scan'208";a="740553681"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 14 May 2022 06:20:53 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 14 May 2022 06:20:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 14 May 2022 06:20:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 14 May 2022 06:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGlxbZvCinUSG4+R5rIGhKrazcBzW2d55LWKJoalfh353LwoBkhNLIdHZuPncMl0LX9hGKy3ZMkdHvtWJmOoPOMD85djRvcio6HSgsZr8Z/2Gs1S+q4vktDOFyIC9+O2RsGDrE3DxMehgkre5AKax7xw1acUegqEgloqf4nYFWhXHFVQanG3KiVKym1Mr8oxPQSWAvNJczblXCue16pFCSb5oCWDPxX0XVYYkZgpwxR9mkvtqflxgHl/dWD1rtTopZhuwqEp0flfluGte0y6ATYlcO3WfMkWrpNf2ArV9j/HOh3xRrEHea6MuaZor1c+dhl12k4vvHwsY0/WLTQAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I9AhmZv0E9Wyg2XHjZUhXcg7+8N1byqjM2+as2jL2k=;
 b=dyhDV9PXh+WMEAEPYyAjlSyBIpcEClhLF4tpSr6JqIRVZn6DDjdmAuTMExV6FZEC7a/MMjX50jsxFRToaHUOSskYrl6tbxs49NBUvHvnETovFFx4gvavISa8CaIwBcNjQErov6jD50lT8j53vO1cgSBNmqk1uGTwBnzvWHE6/Rm0mpuIg76REZL3+RyE1ANEcXl6lB4/IMPd+nk27d7RiKx+Uh+3IEOl+N2rTw/n4G3uLkncmDjcg01XEZzyEu52YsrGWh7642dkMonN+7s04rAUV3Xf09Tu9FfBFrxh+3uQHzVubL+Xm+uk5yKA7h30e9M6cIAdQvvvAhPS4AhtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MWHPR11MB0078.namprd11.prod.outlook.com (2603:10b6:301:67::38) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.23; Sat, 14 May 2022 13:20:50 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5250.014; Sat, 14 May 2022
 13:20:49 +0000
Message-ID: <9be2b24f-410b-a458-ba71-8a63cfb79ccc@intel.com>
Date: Sat, 14 May 2022 15:20:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 11/15] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: Vineet Gupta <vgupta@kernel.org>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, kernel test robot <lkp@intel.com>, 
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220509085821.3852259-12-cezary.rojewski@intel.com>
 <202205091954.7hT2TBhd-lkp@intel.com>
 <bb6e1945-df7e-f339-ea69-05248d480af3@linux.intel.com>
 <c8875143-87b7-9ece-8613-b8d90acb4526@kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <c8875143-87b7-9ece-8613-b8d90acb4526@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdc62905-b749-4011-8d69-08da35ac9040
X-MS-TrafficTypeDiagnostic: MWHPR11MB0078:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB007823AA7FAECDBCA1559219E3CD9@MWHPR11MB0078.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2z/wgE/zR/SRulLPzqIvs3O7lkFuA95+m5c+4tsP39lE05Re3ipfGB4+KeBR5GEXKLNfx5joPk26r8P4X+j12aOYmyiqJkSBlHYCZgQpvxmZH/kfcTHNKG8yHRaRCPsufXdaDxggBxNh4I6OdBB5+bEDuIDZHZI7j7TncEl5/3E7wx/VkHrdPkPEcjCjMtAm/KBcJJKxVL262bId5zbapuEL1czEU0Kd+uefkDQnEt6z55c9my0oy92rLc+mFj5ngrXM7EfXApoYI4HOh5E/emFTlHDt1zyxvZK45NRoH8ClDgWEt5U5XkuiTupvIc5JpjYeCMW64orNqrmZBKXGGPznSZJ9XmZ00Y3QJCBD5/Jafu8vHHmD8zJWxTHNBDXHQQd8fHSUfRDQKjsCHL5+HDyziPkvYmgNScUSJyKICx6ieoUfh58URJZmx2ucwUXY1kLwOBdJQm9zb15Ph9SNo/1BxQQ9JUkZFOUfjASUewwepxfxjezZ4COQ2n8R0T14EA5G0JgVSekUGs0gTonL6GbUloO5F75VCV1VQFSStiRhgM+AL7q3sIwCGvD1SDE3nojtaVs4owzzSa2mIfDEfCe6Rlfb0zI2vGgc6CBbsoKbjJQRgZYRSKAhW0T/L1a2592HXpmwCuTEfGGt1IIe/yp8X48i/gpmB2r40FfFmV5PgQrHafW788pppt9UDVCrkXiMipQqKQuNH0OgnMzcygcKqtGrGuEU++ezqlfDWV6RwoYIVnIlh31SUvyzeM02DiYRdMPMGyiVfZ2Iky4XbysA1XlYKmHTzwlywuFTjt/pj1le1/cB1+3c1m/m5VA8hWM8+kcayrK/Ifp4yZsKY0FVARC9SBFJzirxEMe57s0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(110136005)(316002)(31686004)(2906002)(38100700002)(83380400001)(82960400001)(36756003)(66574015)(7416002)(66476007)(6506007)(44832011)(66556008)(8676002)(6666004)(4326008)(31696002)(53546011)(5660300002)(6486002)(6512007)(8936002)(86362001)(26005)(186003)(966005)(66946007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckFvMGt2VXVqM2Q3Snk2SVdBSnNnTzhQY3BWYStHLzlzRmxKbzNwL202VFZq?=
 =?utf-8?B?UjB2RElzRDV3R0E4T0p3NTI5Ti9NZXVxdVMzNEc4R3J4WjJ0MnZya3NIZWR5?=
 =?utf-8?B?bzF3YUYzVHZUQ1JvcXl2OTkxZTJJaG5vVFBDcyt6SkJ2a0NNcGhDbXpJRmdu?=
 =?utf-8?B?eCtIbk80NEJMRFZINUxoYTlWb0luNEtxbCt5OG5ZMlQzVFp5TzlMc1RSbXY5?=
 =?utf-8?B?T3dUdGk0aEFXWW1WQlkyRDdFeXdsc05SbWpsUWl1ZThLbVdaTXl4NWtTZVVk?=
 =?utf-8?B?MGVyaTllNUJYci9WZFpTOHpCYkVLdkg0ZFRoMFlLTkp0NnIvWmVKRVAxcDN5?=
 =?utf-8?B?WVBWb0hNM3FscFJlYWl1RlAwMkg5U3dObEcxL3k1Z3o3ajV3dS9nUWYzUmJK?=
 =?utf-8?B?M2gwRGR0Mlg3bFhhNUVFaTlabnVPVUkxNjdON0lZaGYvbEo1Z25nVjRkZFFZ?=
 =?utf-8?B?c2ZxV3ZPQ2lrYjFjUXBQbGs0cUg5bW8xbzRwSUtKQXRIbHRhWXNJWDU4bmtm?=
 =?utf-8?B?NHAzWlh4ZzUvTlFnYVcwcCt0Zk54NDRBN25Va0V4cU14VHBmblJsODRaaTQw?=
 =?utf-8?B?SzdmZFJxN2tpSktxV0FZUFFhRTN1bXE3a3Nsc29sdStza1pYYitVZ1I2NzFZ?=
 =?utf-8?B?bEVMbzl4amxUcWxkRThpSzQ5cTIrbUZtR2hveGllNzZ1Tldhaytud2VuV0F0?=
 =?utf-8?B?dVFQcXJuR1daSVhPTTY5eGp2TExnQVZna1hwKzJPRmZ3b0gyNmdmakU1eVpZ?=
 =?utf-8?B?UU5nZXRUeDhFTCtVQ1M0WDdoZU5nUE5sRkpaYTdTTnlZclZrWjdMcTBwbzFn?=
 =?utf-8?B?bll2RDd1UnZlWGtXNkc5RXBiK0FTWnZ0QkpEbEZNcjhUSzcxbjV0V3QxNUpt?=
 =?utf-8?B?NXRlWnBXMmpwV1poblo5NG1xMjRCZ3RZclRNOVFobDg4allxNWVSZ21LcXFX?=
 =?utf-8?B?ZVRnbml0NDY0TUgxZkQzQnpJRDVNdG83Vy8rbW9aWDl0WHUwblc3V3VFdkNz?=
 =?utf-8?B?dUU0T0hmaUNFTk9FdjBFMXpORXlRREUvWjcrV0dYWDRmUGZ3dUhZN1RPKzhy?=
 =?utf-8?B?SHFaMHM5UTh5b245Unc0Nk1kMlBpN0RwUllxbW9takczaUx5bXhKWUxJNWxv?=
 =?utf-8?B?YXJlWi96OElaRGZURmFVQjZiUWlBbTFRTm9JTlJmQVRJWU5XMWw5bFJXRytQ?=
 =?utf-8?B?Y1ZwSkE1RnZoNG1iay9rOFp3VWJGL3l5NGJtcWZialpaeU81MlJVSlNCWmJW?=
 =?utf-8?B?VDZLOFhnRldFb1hyR0xFclV2MzZjWGxiRHlZdWhjMFU3SFpHRTZPWEVqTllL?=
 =?utf-8?B?eXo3ZFVQODhDeFNnRHpHUlZmTHkxSk4rRXBTZDliOXdwcUZIODFCOVZYKysz?=
 =?utf-8?B?Z2dIYnRmSjBISnhOeUFxcDVncnJVZnhOT1VSK2xFZlRHQ1F3ektaMEdvOWRj?=
 =?utf-8?B?WEIwSDk1aWJtVUpzQ3JLZjlka1dHc2hQcG9qRWhsUE9HVjJ3d2xvM2hMSWtY?=
 =?utf-8?B?d2NYVUJNdmhMV2JxM3dLSm13Rzg3cWh1TjFqOUp3T1JjcE1FdC9mekVpdFd1?=
 =?utf-8?B?S1F2dTFMNFhTRnluRlQxamVxdjFVMHZuK1ZzZk5ib2JLQUNVbkJpd1hjeXBC?=
 =?utf-8?B?N1BTb09sV1J3Zmt6RFgvUzN1N29WUlN0RFlWMHZqeHczVUdlekJuQTZiSUF2?=
 =?utf-8?B?M0wyeERwVzEwcDVmYjdPNVNoNmVQM0oxZnc4S0I4YjFLZTdGZDkwOEZuSGdU?=
 =?utf-8?B?OUZPUzBycGsxKzNEeXFEU3lsT2VCWlZidWVhdmxmamhjM3M3anVoUi90WVZ2?=
 =?utf-8?B?Q0ZzV3lsUCtiaHNBS2xsSkt0cStQODYwdFg1WStUMmdaS3ozZGpoZ0s5N1BU?=
 =?utf-8?B?MHUvS0Q3bG5sL3hUWFJ1ZnZzRkRLUUZ3TitiUWJ4Z0FCTEZ6dnVvM293dzk2?=
 =?utf-8?B?WWZSU3lzY1JLSElYS3lhUHg0cUl2WCtUMk9wTHF6RUIweDYyNW5KZDlhY3pm?=
 =?utf-8?B?NW1kc0hvRGFCNU5BaVJtK0w4TEl4djRzZ1lLN3ViTjdFQzFxMmRJbjh6R3Vy?=
 =?utf-8?B?WjV2RitQNTNGK2ZEMTEvS3ZpSmxqdy9qQXlDK2J1b2lOWUNvMXQ4QWtMNXBw?=
 =?utf-8?B?NkdpNStHUkljcXd6akJRTmNrMG5iOUtwWmdueE4wb0t2eHJMWlNkZHlFMGhk?=
 =?utf-8?B?Tmt4M1U3NjBGbm96dkV1Z2pKT1ZZSWV5dkNyWUQ3Y0N1UjBJZi9mTkN5Tzlt?=
 =?utf-8?B?ejg4eGN2SDN0Wk1QK0NrL2FkQXlsTUtOWW1SZkU3S3Y5Q0k2OTh2T295VjZJ?=
 =?utf-8?B?Y0tsbUl3eVV5RCtpRjhkUFF2eUNPeld0VHZLQlNTcGFjZGpwbHBSVkl3TWJB?=
 =?utf-8?Q?MXTGpMv9LzGMjqGs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc62905-b749-4011-8d69-08da35ac9040
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2022 13:20:49.9185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgId17jUeaWu9+ICdbXYqPRzN0pBB/K5ICD/RK53ZxOY5HUThUx+iI6w0kCQK+sdTKFY9cbZbp6xfhufbpYlvPZaEmxGxNbyuZoimjsfm8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0078
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, kbuild-all@lists.01.org,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-05-14 4:49 AM, Vineet Gupta wrote:
> On 5/9/22 18:08, Amadeusz Sławiński wrote:
>> On 5/9/2022 1:58 PM, kernel test robot wrote:
>>> Hi Cezary,
>>>
>>> I love your patch! Perhaps something to improve:
>>>
>>> [auto build test WARNING on broonie-sound/for-next]
>>> [also build test WARNING on next-20220506]
>>> [cannot apply to tiwai-sound/for-next v5.18-rc6]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url: 
>>> https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ASoC-Intel-avs-Driver-core-and-PCM-operations/20220509-165656 


...

>> Kernel test robot warns us about __fls and it is right, as __fls 
>> depending on architecture returns either unsigned int or unsigned long.
>> But I would say that this seems questionable, as I would expect 
>> consistent return value between arches, especially for functions where 
>> we operate on bits and probably don't want inconsistent results.
>>
>> Generic asm header [1] seems to suggest that it should accept unsigned 
>> long as parameter and return unsigned long. It seems however that arc 
>> accepts unsigned long as argument and returns int, while m68k uses int 
>> for argument and return value...
>>
>> Adding relevant architecture maintainers to CC.
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/asm-generic/bitops/__fls.h 
>>
> 
> In generic code __fls() returns long, while fls() return int, which is 
> weird as well. Anyhow for this error, ARC indeed needs fixing.
> Do u want to send a patch ?


Thanks for your input, Vineet. Yes, either me or Amadeo will address the 
problem with a separate change. Consequently, this means we won't be 
addressing the warning reported here by the kernel test bot.

Regards,
Czarek
