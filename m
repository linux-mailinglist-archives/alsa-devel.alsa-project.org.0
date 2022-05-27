Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C59B535BB7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 10:39:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D369170A;
	Fri, 27 May 2022 10:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D369170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653640788;
	bh=0QniGIpDvAWIGFq3LVayrIeRr190CGfXuV+ZzhMwSEw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=evRrI3cfbi6FKU7UrYQGeCiVLdcLaciH3+UgOMtdkmfGUQgfk6GWRtpzaKM82OmFO
	 KKa60klSIUAqvWLVSqFfenFwiDrL4UH++cubISGSKJEqeIX+ci6dx03oagfxRMRCvJ
	 6aE35/bM7+GLZxos0QbgsAXG3uQl/CJ75nx+1CUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 839F9F80310;
	Fri, 27 May 2022 10:38:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92B35F802DB; Fri, 27 May 2022 10:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6063DF800D0
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 10:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6063DF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j30kAajQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653640726; x=1685176726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0QniGIpDvAWIGFq3LVayrIeRr190CGfXuV+ZzhMwSEw=;
 b=j30kAajQWfF66R3SrQ2Goi7fiFuhMtyuogBf1BQh8DVRYA0fcbpZgt5z
 MpY1kFDxv53+beQ+vutfskJtk7606VK5wRX0IFA+qyPJRV/7mTgIBBRsP
 9YowSJjDAJ9uhLaVELl9edIJ7BNZXkzMYDzLFosssS6sxbMO9mqfVP5vT
 pMD3BID3Ae5UNwBXCW1jCeIqxAlbXkH1io+pJMws/Q3db80UzOBgZyImv
 YBaQ3XO/D8f1KQRwtAvlJul+Bwb6BR4lY3/xR0rX/WwaibtMIVmqu4KuC
 SlBpdsgbxtKSm29hu2kbEH2VcaZkykOtPkbopW1zz2yQBJ5xr2u71YYpN g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="256494345"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="256494345"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 01:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="603757952"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 27 May 2022 01:38:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 27 May 2022 01:38:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 27 May 2022 01:38:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 27 May 2022 01:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+xBN17m9wbuEM8eTEkHjhlieFD9ZnZM6OV2t3/XyIXlKSCZH8mY1wgghZLXGHcQlffvtyJ3o/RFsS+f3ZZtLVjnzsW2ne8gdZaq14hoWXsOJMswpBbZ8jj8XTNDvzKz9bKTPP6KS/G7Mu/MSXQSfkoOGvmlUZPaEwlaCcNag1vlg+GIAWjR5Et6AgKUFiNnjdOGF93IIPWL+kActDAnET4lePdFIXnNpkAtDfIcDmgQF7i/410GjZPbY/5Ss+jawy4SWT4gPxJtV5tB7RSDOZ7J4ADdujKbQSYNYwvEckE85tqBZ2w+0D+eCi7UTrDZuE7VIm7vPnKls3qWn9ET9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqokE7zF8oN5+OLamy3G6gFk8bpwDgpsZK5Mx6duA/0=;
 b=BFgnk1CBgFsaXjywHnhhykTjNjBoeEBd+sUfLdZGlJ9edtUBdz835kW+7hTVlutaLrUt91mYtyZTqe0cTQxf9ySr3Qp2PYN4fRiha1ncEACDrnX3zYVNANtXSIAZ6+DTkCabCdv19BXbSvh/R4H0CCYs65wnuyN6r2J25UIpVpIIXPIzFWATOp6Bqg1YZbt5XICQbfod6vCgMXOjquOcqI0B82fmuw18Gi+AH+HUxjZwmbqzwrJkcBkMCemw1bGUoTjQRB0252bLhJppzHWvm/dT46YlleLTRAgwH1kNWPSXObqJEyfS6VafBP6sb38hamR1NPVFHM6GY0JmeR1suA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN6PR11MB3358.namprd11.prod.outlook.com (2603:10b6:805:c0::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.20; Fri, 27 May 2022 08:38:39 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:38:38 +0000
Message-ID: <ee8b6903-c436-0e4b-328c-feb08b58a234@intel.com>
Date: Fri, 27 May 2022 10:38:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0013.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6495f4e-9e66-40e1-a8df-08da3fbc4be1
X-MS-TrafficTypeDiagnostic: SN6PR11MB3358:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB3358FC11251EB22D0A56A9EFE3D89@SN6PR11MB3358.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: skQAxReT7CVAfZIVsopJInEYyx5ymLYv4HLXoC1fCEJ/7FBypKaI109UIfvF5ckj4a16g1FK4bJ7GGZJt4Vj0dqBZ4Zx148VReUcv1Nctn2+ej6SytnFFw/llQtRU8Pa21o5EPz38hN/smMB6X06qqApPjKtGRnY3HnY5OTGwmYP2iYiquEMv+GVjmlo3lNMLrxYcTjxDjtNIGJKjoAbFkQMC0iE0xM5UMrLCUonXOF84XD0kNX8+2eGt7ah24XjckptJyrQalQM3lut7A82uIRmIx4UzXkc/7e6c3S9Y/Ibue9YRqh5Jp9A2HqGYs3oIl+cR2kqVKfwrhK8BrNQoAmH86Lt4hDQ/XvX4mnaIf4C246DAx5simIF/PN1yh0+bcyZpJpgp4WSziQZCMBXiFoKFtIHnZXwXziLn1zD4W45T6vY1bf0wu4ypacDAXqeS2L0UXENXzrsmp9przSUAJl3h6p0h6SEBWjwnHpjcemQ3M93Uj0OzL2Ur44WxqKZ3c8z3fQmdcXP1NXF4RSLQdNBBP12OYioW5E7jTLungpr3iy4kc0SJTBqgMvmOi/4Cx0Ks9ffe49BpQ4MgbfyHsWp9TT/AH6pKfyku1hhlKR+1N0egmuYIlj121TtRqk5xvrS6a780/3pDFDu+G0vfAwm7gpfRcBbkG6t7CjL9ox+xKejvTyOp1FKuk65T9OVOwHzgJbP1+Ty51mM3eqwkUPBsBAgeQTu56IENdTaaossaOkywUstcihf/9TM0cJL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(26005)(8676002)(2906002)(38100700002)(31686004)(82960400001)(54906003)(6916009)(316002)(6486002)(508600001)(31696002)(3480700007)(53546011)(86362001)(6666004)(6506007)(6512007)(8936002)(44832011)(7116003)(36756003)(4326008)(66556008)(66476007)(66946007)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1dHaSswU1NsYWtVYmNQSGpnYW1GcXEyM3FIeGNwdDh3SG1JeXI4dlRIOVBM?=
 =?utf-8?B?MU1hSzVKVzRvVDlMejVhTVlSUGIvVGl6K0JoTmZjcnBUMmIyNlZoMlNuNks2?=
 =?utf-8?B?Nnc0UGl0NWZFQmJEa3JXZDdWRUVYQ0VSVVF2Vk9PcmZGT0JINnFqMzlhSDJL?=
 =?utf-8?B?L3lVMTBPNXFwMkVIQW5wNEVPSDVJUGlxeEcvMWlQaXQ4S1N3ejI0Y2tpZmhZ?=
 =?utf-8?B?VElwZFM5NnpRN0pUcC9vZVZVZFZSS3ZadlY3YmdQYmdHQ2JTelErWFREMEVK?=
 =?utf-8?B?NzZ5eG1yUmhKTmUrRjUyWmZXNjR4anJMd2ErMFk5MFRaZ2gxTlFOVUVjN0Vl?=
 =?utf-8?B?dVRmVVhKN2JzZHkzRHRaREFTUkFVUzBlTGNiQ2F2dkpDNk5Na202Vit4UDR6?=
 =?utf-8?B?cGZiaVFod252cWZ0SnRTMU8yd3ozNExldWlydWw2MEJ1MmpXOHVFTWt0QkZ3?=
 =?utf-8?B?Tk9KbWNudTF6akFaVmw0amxSRU00aWtvY0grVzBFTTkxT1pGd25LKzRkMk03?=
 =?utf-8?B?aHA3MkVGanFMS2J4WmxzWlo4UldPM0p4Vnl0ajhoTkFDTWZZUVlyZzJTVXpX?=
 =?utf-8?B?UWhZalIwY0ZKb09WM1p3QzFSOVIrLzdVUG1rV0JXU2prdW00NHRUWi9ObDZ1?=
 =?utf-8?B?b2w4WjFFYVlnWU91dmZONjFod2doVXZsNmJRWEhHbXpjTEFWQkN6a2pTUTFy?=
 =?utf-8?B?VFA2MEdQSzZGNWhKUkh1dlduZnVvZ1g0NWNsVFdwN1hiYWltNnVKZWdSYVQ3?=
 =?utf-8?B?Y2NKZkt4UG4vWkhyTzhzU1VtMnZ1M3NYY3J2bTdhUjlpbkk0Vyt6bUd2N2VM?=
 =?utf-8?B?RkpWZE94dDNsTUdRNWVYWXRTdThQQlpXUmNXWGc0VHJXd29jNFNTbW9Gbytv?=
 =?utf-8?B?M0QrRlVsTmJQOFVVdXhJZDMrNm4yMG1OcndCSGFST2doK1liWWQ1OU8xNGsr?=
 =?utf-8?B?UFRBbWhkRDdrSzhUN0IwZlhOanR2eWhvNlZOMkI4eTBMMFdFQm1ndkt2N0hX?=
 =?utf-8?B?UW1PWVlDQzJXeXdISGg3SDNybzdMM0hYL01VTGhFUkhGNkFCMEVjL1prNTYr?=
 =?utf-8?B?S2tQRzk1ODJMemdVcXFyd1BNMVNoOUdDd1l4VWU5TVdqR1J6VmszUXg5dnpZ?=
 =?utf-8?B?ejZGbkxSSzRkaFd2QmppaTBWdUpPenZoRGVWc1g1aFFxb3ZaNnpwYTJyeUxB?=
 =?utf-8?B?MW55YTZTYkxQUnhkS05Kc0V3TXdVSkNsb1JqM3RUYzlhV1lJRWRycU5QWWFN?=
 =?utf-8?B?bFQ4N045cklZZDhrZUlZaEthTUFoU21CMFZ1ZUlvblVJNDRBTzQ0V09wV0VX?=
 =?utf-8?B?Zm9KRTlIRjEzbW9HZENNQmFNaHkvU2NiWldKQTQ2eEY5OVgxQkV0SjlTb2kz?=
 =?utf-8?B?elBGeGU2QVZ6eHIvLzN4WVdIeXdiSFYzV00zM0gxcUFFYitxTmw1TTZ6NVJ3?=
 =?utf-8?B?dTdTYk9LSmpkSW13S00yalNLN3dvcHNtUVc5UWY1R2VZQ3hPd0YrVWVseHZa?=
 =?utf-8?B?MW40OTRpUm9jeUN1R0ZIMFVNVGZIV3paVzVuM3I5RXFtYVM2WGg2VjNBMGRt?=
 =?utf-8?B?c2JXY0pvU1h4MStpclI0YlpnaXJsUE91MmdMcisvWThSVHdMYkJHaTczbXRF?=
 =?utf-8?B?K2c0MHhuUkc0eWFnUFQ0VEVkeEJwQlVQdkNxeHNOa25jTk9jbUVyTE92b214?=
 =?utf-8?B?ZSt1Y2lhc0djRUFkcmhyRGlOWmtYcmNsVjRNMVd1V1JCZWV6TTB2STFWalhv?=
 =?utf-8?B?WDBQeEp4ZWxIQUpaYmttcTQxTlVWcDdmcWZqZXd2Ky83RzljTEpSYUhzWGIr?=
 =?utf-8?B?b1R0N1haRnkyeUFTeU1qKy9kRWJBTzdPSWxPbTZRS2p2VVpJVnc1Y0Yyb1Ay?=
 =?utf-8?B?ZGRjbGEzNVVveXQ3WEsrNUxNdncrZk9OU1JTMjFjQys5YS9zaER6bkdrL1lR?=
 =?utf-8?B?b1Q1T0hKT2FhbnRaeGRkYW1ITDZIQ1JlUzhGb3FmQXEwVHZqWm52Z3NZT214?=
 =?utf-8?B?bkxVQlB1SUhNTVkwZEc3ci9FOEVwSkZRdGd0ZFN2KzhmaDU1bVUydDVxUWx0?=
 =?utf-8?B?UGdla1BzVSt2UEVhemYwUEYzV09CTGRad3JEbVBVZmFtQnM4ODZFbkdzZFUv?=
 =?utf-8?B?aHJLMjNhYk51WTRSKzFTb21YRTlHSnJNL0JyeFhmdXJabHEvY2J2ZlR1VGZN?=
 =?utf-8?B?Wjg3TkI2UHFVTzhaY0tUZDhQK01aekNTOHpXazZNME1WblliV1JaZHMzazI5?=
 =?utf-8?B?Vmo1VkRETkpNbzMxV1Q5bjdzQy81dEU1MmkxbUs2VFFadjBtUTNYYm9hUjlQ?=
 =?utf-8?B?N0duYWgxMnVaVU9yajdERnZDOStUYUE1clpzS3RDWE13WTBOZXB5MzVES2gv?=
 =?utf-8?Q?8T3zRAr4wRv/4H3U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6495f4e-9e66-40e1-a8df-08da3fbc4be1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 08:38:38.7546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EHCQyo1CbR+y/a7wz7r2WqwDBO3gjSlku47baVWOO9QZO1Piqbte0Gd6hvwCmOJB1xCgoKXZl0WxRDPQgCWpZYKBl7YxbqyqCFxNEEAivc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3358
X-OriginatorOrg: intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2022-05-26 4:45 PM, Pierre-Louis Bossart wrote:
> On 5/26/22 09:17, Cezary Rojewski wrote:

>> Hmm.. I don't see why SDW is a problem here. Could you elaborate? I
>> could boost avs-driver to support SDW configurations if we need a POC.
>> Why would machine devices not be created by the platform (e.g. PCI) driver?
> 
> Because there will be at some point an ACPI device for the machine
> driver. I can't give more details on a public mailing list just yet, but
> the approach based on the PCI driver creating a platform device is NOT
> future-proof.

I still believe that upcoming descriptor changes only simplifies things 
- less machine descriptor tables, more reliance on actual ACPI 
description. Remember that granular card approach does not ban the usage 
of compound cards. You can still mix both together. If we encounter some 
descriptor that says given N devices are logically inseparable, then we 
create a single machine board for them. The fact that sound card has a 
device assigned to it does not change - something will create a device 
and sound card driver will attach onto it. From that point onward, 
assigned DAI LINK components can still take control of cards behavior 
just like we do it today.


Regards,
Czarek
