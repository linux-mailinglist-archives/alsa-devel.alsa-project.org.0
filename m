Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA65AADE7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 13:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C88751607;
	Fri,  2 Sep 2022 13:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C88751607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662119569;
	bh=LMoci+CyB49ZbH2dxlku2lDcbzzCtfn+jqKJzCYhSlU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xkj8BxUYxTeW797ICNaqqMCK9TRs/r7pwAjqjMPpV15fAfv5rM6G3T6hkVynfM61O
	 /wiQYHEAyFv9KljBLjCDCUVcSifgyzuVKEImDTCd4uzz+FoGZo6pMJ982zUzygfPAI
	 p/MdlLr21Y8Jf/GWVZnu1ZwSVj71uEcmCzWCUuxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A11F8030F;
	Fri,  2 Sep 2022 13:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B8E2F8027B; Fri,  2 Sep 2022 13:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7821BF80163
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 13:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7821BF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YPhKdIbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662119502; x=1693655502;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LMoci+CyB49ZbH2dxlku2lDcbzzCtfn+jqKJzCYhSlU=;
 b=YPhKdIbFGjKnrY6xRwVNR3hiXNQ/X6hP+aoDLnxYA8OvPY3x3UMAzOZy
 bWK/PTRmFQUEPULoOS4qYfVaOYOW8GElz1TNteOYvB4cOORfu3italajv
 IXU/UzoX24dn1enP4tzRIBSJOWrI+wH9D1+8Yy2/u39CL08erD7qUNmV0
 pcEutaurGR10hVJC+Hoq8BsAXmq/lIR38KiOAgZnL92V/ZHoTVgIkvyaZ
 kDIqxOtgCZsnUhTXxpF2Qe4VVo66NsV4zcIDFuQRpuST5h+cF2J4RD+fX
 /XpECS7qgNuo6KNHCtNCIqyufcgPVUT1fdJBALqMOf9BkgZqC2q1XmrpY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="276364744"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="276364744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 04:51:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="590043903"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 02 Sep 2022 04:51:35 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 04:51:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 04:51:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 04:51:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 04:51:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8bU2xFIPb2r5PllGMxlZcOV9fzoz4cfbr7N1LUA+tTzhcfp+eki8TEQFJkK7VhIh5YCr9/ja3TekwdT5ZJIUkU+41f7C6ChFBt/BnNkavYA8e4v6lWS+dQjHXLFcKGevp1oUA+iyLUYx+AQ/nMr/pYIhP/cmCzofYAQhmkvq91EPN8rJ3G/nFIWvovdvVdeZCDV0x76HRna3p5pr4Wml+QksrZhcgVMEQBd7S0E3elWYNZeb5DzfhYb1bQJyC1t0VHYximWcA0ohaIn24+6SnD35wQv6QBbA9Ah7UAbwWT1VkG6wADyfJc7YidqC3v0ybxnKhjqdF3itUFl//DD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcjXQvGeHeO3zt3d/+frhwRUA+cvIi74SKZHs1n/rUU=;
 b=CSSBu6Qdnty+KUfRTVV58I35esUf/l5xcOVCdiBscM6SI13Gm4/wbdn8JpOu5g00jp2663n+KuhsZWFlfIgdI7/xp726fwZuf47vNtRU8hTuGH2JPOjR6ZHF+OVqfYTtqJD36jukE1qzqzqHg4msvaGKLPcSByH0aXQM27kO4Ha7I9GzoeLdxuUFTZP+F01i0AEnM7xYWP4fu5rb30nQJlR8y7ZqO9thy1bLftmnbAFKFbFiMcYPFwYk5kX3Wd16gvwga6JKY/ZFPAE21F3FM41Et7cI4Rj00/aJv5ekou2OPlBa5IoMte7qmr9myyPN6N793K6aEsHHVTHffL1ujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BYAPR11MB3717.namprd11.prod.outlook.com (2603:10b6:a03:b0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.16; Fri, 2 Sep 2022 11:51:33 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02%7]) with mapi id 15.20.5566.015; Fri, 2 Sep 2022
 11:51:33 +0000
Message-ID: <a447f894-e343-c4c9-46c6-f33e6da8cff9@intel.com>
Date: Fri, 2 Sep 2022 13:51:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/2] ASoC: SOF: Remove strsplit_u32() and
 tokenize_input()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220901175022.334824-1-cezary.rojewski@intel.com>
 <20220901175022.334824-3-cezary.rojewski@intel.com>
 <CAHp75VdVqRyA=J0-HsHtgiAZhd8XxqxmMddTyV2u29TxvV9=Cw@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAHp75VdVqRyA=J0-HsHtgiAZhd8XxqxmMddTyV2u29TxvV9=Cw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbad2007-87e4-4d7b-eb08-08da8cd97b0c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3717:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcPdwD2Chy7MUHcOzwXkbiVfUBQBeaRsLqw2pgiYdhQw8iluTqupGp082N1Xa9/Boo9G9M1L1/oCeZ8f+ZlHrWTbL5Vkin6q5gbI4kDUIZp2hGtORd0xmSa949QGX7gSNmZySssrJVdKI37BihM7XtV2RnTpvLv2hAh0zXOXmPRBR8LLCe7f0r2xppFsXJMsEGiizbkmryDo+rya1hDNytJHRql42U0HIr32lfnGQcwif3Az38Zvedt1hjUSn9FRRG5HJ4sMdL4BsnIKRiqo+kO4Hc7VBkMrQ7NL5dC9tJsaSb5fcV9aQ/SwbesTr55OjS4iVLjKD26BDIxrl9X/LwUU1zs+y2YCTraMPtoOGNojMTYRemNjbB6JKXxUWdj+wh0lEqlLCM/YuDZdX5fdzvKq1zYuI6Crcy7h5870VbRFYBPxMcITkuLoh11qOSE4ht5F4D6I4wJSi6b+j3Q3ePInSvGJxzmbEhdEtpyoqMxpSR0rf07Lg6pXcPD2a1vp3vb6tq7nGqfaB2i+u7zkhfN5f/8RJX3DjjwsnP7HDgw4vwk1cN54T5EgRw0nk5mJXSef/U5YtaFzYZxPDVDgKv6zTLUprJ77JjzkpuRk03Cj8NVyAMGas4tJ7vFEeeX/TJKgRnsy5fDuG1h9fYKqiTwaEJQyY2eklg0sPzXHxvbAYToXsxTsPBhMVUQl3WV6sDMjyCgHbJEUFcVY3LrA7gwSTegk6pOW/YgPy4tKfrLnmuG85x1sigz6VWYQjOvFIloYN/ri3bSuGDfUd/IYg7kMT/lJX/ZFrBzDjZN6VAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(136003)(376002)(346002)(396003)(186003)(2616005)(2906002)(316002)(6916009)(6512007)(31686004)(6666004)(36756003)(6506007)(44832011)(26005)(53546011)(66476007)(82960400001)(66556008)(31696002)(4326008)(6486002)(8936002)(7416002)(54906003)(38100700002)(86362001)(478600001)(41300700001)(5660300002)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXlWN3Z5OGZSZ3NibDBMQXFscW04NEVRaTR4TW9zUFZLUHJVTVRITkxkT3hv?=
 =?utf-8?B?elU1YUZOVnJnbXhSRDFvbmJUZWZGM2JneVBLTzJlWmlKNjRVY05CREFJYUpn?=
 =?utf-8?B?ZEM1VHFUeWUxZUtJamplQUV3dEVHMkkxVnZsL2F1aW8zbWpsa3BJMVhLbDJJ?=
 =?utf-8?B?MmVaZWMzZ2tMZU1wQVNaOWt2K3V5RVEvaENwV01Sc0Q3ZTlrVlNGUmNNMDVx?=
 =?utf-8?B?KzF1NWlnZXlrODlWTFlXUGtGdGZiL2Zld3RNK09vdmFpUXFrdndOUVZqOFVC?=
 =?utf-8?B?eG11VlE1VlpZOGRvemtiMm9UaHNhWlFYUk8wRUdiRlhlNEJsQVJqS2F0SWxr?=
 =?utf-8?B?ckZjNTc3MDdWbklFZkI0V2QwcDJNMlo4NEcyWG1vZHc4T3ZsQWxaSzJ4Nno2?=
 =?utf-8?B?RkdyVVNneTErMWxRTkMwL3ppa3luRkZYTkN0ZEQvY2ZaaFFCbC85VHJCTEJM?=
 =?utf-8?B?bEJ6VVY1QWpjOE5DWFhiZk5aL1UxSzJ1aWljR3NyNnRjZzJPajB3c1pFZmhH?=
 =?utf-8?B?RkgvaTU3MGN6MWkrMTlUMXpWOTl3WDBUZytNanIrenFsK3JHQnVRQ2l5SHVq?=
 =?utf-8?B?QStqWkhwSU11bndFVlZyT2ZXem1ucjlHOUw1N2lGeHc1ZWc1ZjhhWWkxNy82?=
 =?utf-8?B?SmVCTHZqbGdMUzJBMW4va1NEZkVMSmZmM2wwaDFyOHdGT1NwdEtFSGN3bjZI?=
 =?utf-8?B?L0QwU1drZFc4TFNFQmM4RnJaVmlTb01qeUlyZTluSjYyTWdoc1MwQlNyV0Y1?=
 =?utf-8?B?UGs2OFZTNlFYUmtiSkVER0JTcytST0UxQmRGeHE4YTNHNGR6VGMzU3VxOWc2?=
 =?utf-8?B?dmhGMUh0NmFUajlKUktDUzFTR0FiQzRWemc5WjZxUFk0OFJNcFB4YTFIL3o0?=
 =?utf-8?B?RDVFTWhnK2h1TU5WMnVmN3FsaHRTRFFjS2wvS01paDFjWDNZbUlQcGJRbm1N?=
 =?utf-8?B?K0U2cENMZjZCTE9ObEV5RGR5YlVuK0RIdjFZaWpRck5zZ3pmZXZxSlNLT09X?=
 =?utf-8?B?SWtRVVJUZTJUMTJyZlVKYVRCbUliREtrcXNXZDEwT2FZYlhzRGR1QmdmMEdw?=
 =?utf-8?B?Ylp3T0loQnZyM2EvLzFRN3ErQTlJOEwrNkJWeHdSeS9iTXZZVmlWMWhoSFRS?=
 =?utf-8?B?WVc3eGd5ZEJoc1dqeG91RWNremFCOFZjYzRzL0pDaWFNZzlsclBTVEIxN2xT?=
 =?utf-8?B?UStTaEliRkFUaWhxUnVaS3orU1FaRzA3RnA0RFdWeUxGSDNMMEp5VFZYbW53?=
 =?utf-8?B?NmF0emh6L2E3V2Y0TWdKS1dCSEdSSGNXNHdjZHp5enJCdDE1ZW9YdlRjNndz?=
 =?utf-8?B?cUNxN3p1ODNUVEc1L2kwZjlhUEdLQ1RTYUw2RnJrdDBVVU1ncXEwMHZoSVRK?=
 =?utf-8?B?RGJaNUNSUlJaWGM0T3psNHhqY3pwR3VnYzZTcEdNYWxhSXNjQ0ZjTllZck91?=
 =?utf-8?B?SkxMTHF3Q1ludFY3WngxSTVzUHFuS0VkUXg4aEs2THppOU1jUEk2THRVK1da?=
 =?utf-8?B?c1k2bEIvS0JNekVmZGZJRk90Yml2K3pjT3VCSHEyaHVVb3JROVJnbndvOXhV?=
 =?utf-8?B?OW1YQjlUd0ZTbE9VcE5kRTdsWEk3ZHhOK1NhaWthdnMrc2NwOFRBcnBUVTBE?=
 =?utf-8?B?eXJCem01ZUdodGdRRGdjaWdmUENJU1c2NzdFVngzZkxSbGJ6WFVDQjlmanMr?=
 =?utf-8?B?L1oyVE9Ba3MvckdWdVcxaDRvWXhRMUhkaDlhOGZEVlZ0SDBueXJhVHROY2k2?=
 =?utf-8?B?dnVVV3JzYnRyaVhrNm5CN01VN3Ruay9jUzZQdllwRTFaMExmYlR1V2JiV3dj?=
 =?utf-8?B?NTlHN2k1OEhDL2U4SlhoNFl4bGdsNFNmeCtLc0thNDUrQmJVNWUweGxqNHVy?=
 =?utf-8?B?OE9pZXIxWWYySVlOaGZhTjBCNnNVTnd5dmtGby9nbG5HS0RoM0NMRHk5Zm9o?=
 =?utf-8?B?d2VIb1phNWJ4MWxNNUk1b25zRVpwTmRLdVlkZlVERHFGQkdTQ1AxS1FBRFRW?=
 =?utf-8?B?U3BvdExpa2owN01ObW1Xb3k0K3prTmhFR2NUdnZWdVlyVnVCZVExNFBSKzFx?=
 =?utf-8?B?ZmpsSmk3SENtWHZNbDBOVkYyamxjNjdGRldKWG8vREFZdWhDeFZsa0dVNWVz?=
 =?utf-8?B?L0o0ait2SzNMOENTenpUNzR2LzduUDU1VU82bVdpSUljdm9KcGxaMy95K3gz?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbad2007-87e4-4d7b-eb08-08da8cd97b0c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 11:51:32.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6shtlk2OTB8Wm/nuuwF3DzFj3wH5YeQleD5XSx9zUORexEq0IPMcJo76fsJ9vvFtozohniSjPctUyUV7cDZFVLAVhYRZQ+weF5vFHryEX60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3717
X-OriginatorOrg: intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On 2022-09-01 9:38 PM, Andy Shevchenko wrote:
> On Thu, Sep 1, 2022 at 8:40 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
>>
>> Make use of global user input tokenization helper instead of the
>> internal one as both serve same purpose. With that, both strsplit_u32()
> 
> the same
> 
>> and tokenize_input() become unused so remove them.

...

>>   #include <linux/debugfs.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/string_helpers.h>
> 
> I believe either blank line needs to be here (to split the sound / SOF
> group of headers) or this should be put after 'so*'-ones

Newline it is then.

>>   #include <sound/soc.h>
>>   #include <sound/sof/header.h>
>>   #include "sof-client.h"

...

>>          struct sof_probes_priv *priv = cdev->data;
>>          struct device *dev = &cdev->auxdev.dev;
>>          struct sof_probe_point_desc *desc;
>> -       size_t num_tkns, bytes;
>> -       u32 *tkns;
>> +       size_t bytes;
>> +       u32 num_tkns, *tkns;
> 
> I would expect a longer line first.

Ack.


> With the above addressed
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
