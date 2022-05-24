Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2182532CA3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 16:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A5116F7;
	Tue, 24 May 2022 16:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A5116F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653404066;
	bh=uXy8ypxd34/h2Bv0/rR9kSdMVJiJ0z1fja1CSkGpLlo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jDMcvbfDVkDWaTkDFlEh+eMGWoV1vitYm5cvYpg9zozV7XSBQiKSD1qE/upkoDId8
	 j5k/oydlNyWEhNutwK3UuKZdQc30FVWgZiZR/8ucuyLrVQcvmH+0XVmbunNEWKT99N
	 baIdYsCKXfjgaMMWR7nT5qlibQiT+VN7OZz8d0qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BB9F80100;
	Tue, 24 May 2022 16:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D24ADF804D1; Tue, 24 May 2022 16:53:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE8DF80100
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 16:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE8DF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jGOOUl+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653404004; x=1684940004;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uXy8ypxd34/h2Bv0/rR9kSdMVJiJ0z1fja1CSkGpLlo=;
 b=jGOOUl+3VNL/BfkjFEdCCo3S/z0zwttiIE3scZ3w0S2MzGTDTVEvYypR
 9/VTY9b4Sbt/U+vGXLZt0sOW0IW+qBfGmjLzvH9N87BSrV3FEFS1/YhQ9
 j9GQQJALP+C/LeAwZ7zzhPHIoymMbiiERpUKseZfA2mDTIeAqJ/wQrMAM
 CjbhYEBw+H6c2ZgmJTd6UCXNQ4ytmyfNHg4xva0NvtR45RLgDh7YGTHeL
 P6eTKXd5ztZ+o/pFxBt55oBtcVxLTfZhGll2P+dthjeFm0NKYUNRnqh8/
 0delGUmkJ8Pdx5ZfWnYfHokj84oASC2MHh+yFyWrufl6eSg2SBiS9U6zH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="273665150"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273665150"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 07:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="526434534"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 24 May 2022 07:53:18 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 24 May 2022 07:53:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 24 May 2022 07:53:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 24 May 2022 07:53:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du5L26ndc/MAGVf+d9j+ssdFpeTzhb0AVe0LXRm+laLed/qtWJyZ0i2rEiwAhmnSmjdVDZ0+mrcuVBEoQ6mkxtyVJH9hITYt5/pkwbrKPXRnac2NOL96WO3QLb33bCx7rCwZfMdzb+ud+A+WeiDADOnWa3t090QMDm7KvgQaa9AQxzd1gtFysHK2P/J6JjpubZjQTx4RN6/pEcsZLoWPocoW9OMKQzj+a2oloSzbrv5kegS6d9WKDflC6YYGfDGqZkz5OhfYB5GMTvRs+AFPgmZCl4DmO/nMV85KWEIbOZIzzmEx8ioeN+Vz/UnUzocaaTUd33/yfjFyzRfDxs2CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HpARnphoXDkGBY3WWAQYxZ/WXuyKHiWcYcDjB3QBfw=;
 b=eODArqzLxvV8PBF0IpXpmQZyzACsOg9CbxXk8NugzKfsOukZv3GulgRuDhmNFX23fWM9w5kPu1t1v0OsqeNfti11y/l1t1eS/wYLPbgTVAEP2OlVFgasHdy+MWrsxGiXlXIvMSNqod170Df4GKpmeY1DNDg5XlW9PSaaQJP+jme3DfJknwe6VtE3fO8ZbDuROFi+QTic9tE+qPvnELYhJw3FwQ2XY0c0AbxjhFvQyvrhhsObkCQnA1cEU5i7Y3sw8qc3X19pOD+SNfNr51NLTp65mz2S8RzBz4AqsRb3IWG1XiSwJjf+skQvP2WIIwlPU7lA6/Ro2YBBTzvDGsbo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4137.namprd11.prod.outlook.com (2603:10b6:5:199::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.17; Tue, 24 May 2022 14:53:16 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 14:53:16 +0000
Message-ID: <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
Date: Tue, 24 May 2022 16:53:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0107.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::48) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189fea9d-74ec-4a97-e990-08da3d95222a
X-MS-TrafficTypeDiagnostic: DM6PR11MB4137:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB4137527ED3A34D30318C488EE3D79@DM6PR11MB4137.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vDSOA5ROLNxFSN8py+Bt/r16FD5TrBxNKFPcM2LGovLCztpwTtim2/OwKX6VgNOH7h+WAIKx8d/3HGGPkdAY4rsh0naJE/CXFKyBiixek4pfekoY+W4vemNin5oZE4M2KwLuXHTYmFGFuhXcqmkCdaPjEtymip8KSnUwybiW27i0nXasAKkg90XK7qfsTEb9pdiuCuhQjVxtDkqqufdHL0tWJl5JgTeEgmxtSgweS36KrFnGaIaWaN8wGDMhmPPKscpfJq+m9lBZwabOb24s75cISZKI3KiNIj+mzXVoNq0hd14t1s42n2ntPMso/hFw5pD2YfWJrF+z4B5aLcfXxBkXbhqd+x0PB6zKHqdeAUeCX0cQsqjr3MlL/2krSgE/xun/oCEJYLJ6dBOvE8VB4pTtMnEldw1gJx+H2VVN0PjGn8gE2+LBTYSht1D2EzwVAzwrrmU2btxQpoYLsWlJfUNkKjtFUh8WHNUuLW8agIG0uu6bSxqXh3CDPsVw7xJZzSpUC2TZmr6c/DWMvNClQHqAWPoErjV2lCCMHm1R7tbRTOOyr/IDg1sldOSMGfQFcCqogYuXrylL9YicPwW/+Gxs/8C6gC3F+GhSYP9rT9PZ8fpfUOK5+B02DeDZKpfMkgb5JMyT5HIu7Uj0hqzhlq9Ox3XMObWMrlWGVBi5apzGw9rzG4iUa6+vGl1oaEaTttbUiEdqV884Ai5lq8URTIefYDiAw3XGHC9yce8jgD0rlMooPuySN4V8fzFCczrc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(8936002)(316002)(66476007)(5660300002)(44832011)(3480700007)(6666004)(6512007)(508600001)(31696002)(26005)(2906002)(86362001)(53546011)(186003)(2616005)(6506007)(6486002)(7116003)(8676002)(66946007)(66556008)(36756003)(31686004)(4326008)(82960400001)(6916009)(38100700002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFVDc2w3SzhoUTZMQ2dtL0lnc2t4K1JhbWZhVzVob2FSYitJeFUyVU9sY1h4?=
 =?utf-8?B?VzVwYlhFenBSdURweXptSTI5TWFCeW9jYVRuWmI4T1dkWG9zQTFNOU0xbWR3?=
 =?utf-8?B?aEw4SmNCWm0vOStqR0x6U242TmNhanVGdWV1ZlA0VjR3SHUwelNIRFduZ094?=
 =?utf-8?B?bG5mVzIxNFZwMVVmaXhDVG42YmZ4THRYUDhIZ0lwZnFlaVdBRFBseDU2SmUw?=
 =?utf-8?B?YjNxbEVWU2RyV0I3YWF5c3M1SGRLWEFjOXF6c3pMK0NJL1o1UFY0VGY0eFJt?=
 =?utf-8?B?Zm43UjBZL29veWhpRzRFK0F0MlpwNk93SXNkMStZZ0YxeUdLcS9rN2Jnb2NJ?=
 =?utf-8?B?M21ZMkZUelRhMnBYcmgzbDNCOCtsUnJnMVJ4T2FYczhLQmdWWitGWWk5cDF3?=
 =?utf-8?B?bVFzc0Z0ZlQxTEQ0WE1DQVkxT0t5b2pQU2s0TW5qSlZaT2FhT1Y3MFgyTGFW?=
 =?utf-8?B?dnppM2dmcldrazBZZnVLNE1IbkJLNnRQKzVQUW1tZitxM3lCbjdpTVBpdUpk?=
 =?utf-8?B?MW0xbXVZZlpNd3VmUXlHTXBIbDVJQ05kSlVLRVRVMTR1NHZNdlFuTjZWdVhu?=
 =?utf-8?B?NHBrTWFSWExvY2M4L2o2WWprWnlLU3VTZTlzRHdVemJ5bmlFS1c1M3FyL3pB?=
 =?utf-8?B?RlpIbVF2OHkrR0Y4cVhjMEFqUTloaEFpTVVGN0JQRXJRN2ZzS2tHUlJVZncv?=
 =?utf-8?B?VHVPYmpMOEx5TVNaUTMwVXJEb29jaksybG9WclhPNmREK3lDMUtpSVRpRVNY?=
 =?utf-8?B?TlpqRk1pemdwUFVXdFJLSjk1RjNIa3NTKzBybklmTUgyMHN5TzN5VEUyYWY0?=
 =?utf-8?B?b3pKekRWZnZ3YUR3U1FEZ1VkWEhZK3F3NmszQnNRQXNoMFo5UXF1dktEU0dr?=
 =?utf-8?B?WHZWc0I3amw5d2x2c3N1Y1dMSDhZZDgvVldjU2NPQm55QmJJalZjb3F0SmlD?=
 =?utf-8?B?UU1hbkJ1ZWx3amxPVjNHS2RrRHpuZ29lOC95RmJCMlF0SnAzWXVjUVJCWlJM?=
 =?utf-8?B?UGFxWEczazB2RzdMVmNnUVpJQWk4M1IrZitXVjJ6TWoxdnNHK2RoZXY5UFo3?=
 =?utf-8?B?ci9QSUtlMFBYY3k0ZlN2MnJBTlhjeE9hZjVPRHRlL0UzazhVVUorTUpmR3dP?=
 =?utf-8?B?UENjWkVqRGhiekJRWmVlNWZrejRvT0JNckc5VW1VdEFmbDFtUmViUXpwZ2Fv?=
 =?utf-8?B?ZThSUm1GKytyd3ZMbHR1RG5uVjFPT25WL1kvQ3YyZmpFanJtRVpodXV2RU5K?=
 =?utf-8?B?aE53NDVuVHNUTGtNVWVWRjNpbGFmVzJyQ3hSWGRJMGdLM291czdZazdxSXd1?=
 =?utf-8?B?bjk3aXpLYkREdnBNZFI2NTB1UExONEpoVUFib2dEMkRaa29ldG5vaHozcmpi?=
 =?utf-8?B?RVhnTXJMM09rMjZwbHBIMnVkbzg5aUV2OWpFTHBJVTZIK2ZLY0RRS3BBNkJa?=
 =?utf-8?B?MjRld1czRDQybVFnelNYNWVuR0hoVWFiejliUmVsRUJQcUtPS08rQzlOWnRv?=
 =?utf-8?B?Q2dmc28rRUhyeFU2Q1FzdjJLWjk4ZHZiUDJaR0Y1c2NVdWZBZmd3WmpPUkh3?=
 =?utf-8?B?QmFoSzRQaE53eTlpdHhOS29WdW9uMDJSWEp3VHdKdSthekg3OFBwT1QxaFBx?=
 =?utf-8?B?UnpiWS8zSmV1VW1PYjdZUTZwbG8ydzlwZ29XZk9qNWRlcHlSMDY2L3NUejFO?=
 =?utf-8?B?SlQ3WG9OTUFUdHVXY3o5d0RsVE9OOEZuUkdtSW52U3B2N3VFZ0MxNzREZTNK?=
 =?utf-8?B?VHVwU1VmRHEyVS82cHI3MmN6OWpXL0pabE5RdmJHdGd2R3FCYmpwYlZTbm1a?=
 =?utf-8?B?VkVmaVF5Y3BmRHVCdjJCanBMNEdtdmwvL0I5RnNzNWxWQk5ib3JmQXJ1UHZr?=
 =?utf-8?B?ck9Cb3dBa3hXSkF6ekU0bjd4Y1NkL09DTk13eloxSFdRV0E1dENQZlVtYm9M?=
 =?utf-8?B?UkF0NnhBWkRjaGp2aGttWHlpM3FsU0xBR0U2NlpMZ1BzUnFIVUQ3eFhEdlYv?=
 =?utf-8?B?VHplQUNvcmZJaEZubXJiaDMwNTI0WE9QYXdnWEZKZ2RLd2N5ZTlYZkFZT0NS?=
 =?utf-8?B?a2I3clVzNW5zN0tlOVB3a1VZRDhremFQYkNCYW4rNmlNY3lvU3lqSFNtUlRG?=
 =?utf-8?B?MG1Tb0hHU09aaEZ1TmZaM2tVc1N4Z1V4Q1U5bE05dmZ1RE9zQ250aXlLZW9F?=
 =?utf-8?B?M0RBdUtvd2V3WnFCVUpheVJESkZsYStGZ2lERXZTZW9ObXNOOU1VUVpLWllq?=
 =?utf-8?B?a0tvSkY5dmw0TWlPUDloTUhQejVrT0xaOGNtZzRaeU51VVV0aUtUTVJvUDBy?=
 =?utf-8?B?R0tFWXg0Z2xyQ2NCNkt0V0laSnpyN2ZpOWdGQWlJVlZIQkVidEpsYlF1VS9I?=
 =?utf-8?Q?6qsmqqCmWNcVDVF0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 189fea9d-74ec-4a97-e990-08da3d95222a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 14:53:16.1036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLHWW26tjr+5HyRcjwlNu9+bskFZFAbakqU3qLa8hV4mmuHQHHjIInNAU2DgIqCUS8qXlN9BzU8wg3a2dMLQtZ7+itx890JFPS4bLyJttjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4137
X-OriginatorOrg: intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On 2022-05-24 1:17 PM, Amadeusz Sławiński wrote:
> On 5/24/2022 6:40 AM, Kuninori Morimoto wrote:
>>
>> Hi ASoC
>> Cc Mark, Pierre-Louis, Cezary
>>
>> I have very interesting to clean up ASoC.
>> I think it is still very complex, thus, non flexible.
>> I'm thinking that we want to cleanup...
>>
>>     - Component with multi Card connection
>>     - fixed playback vs capture
>>     - fixed CPU vs Codec
>>     - DPCM connection vs normal connection
>>
>> About first topic,
>> I guess the biggest reason why we have limitation is
>> its connections. 
> 
> (...)
> 
>> This makes the limitation which blocking multiple Card connections, I 
>> think.
>>
> 
> Hi,
> 
> I would like to understand the problem here, before I start to discuss 
> potential solutions. You seem to be saying that there is some kind of 
> card<->component connection limitation? Is there specific use case you 
> have in mind?
> 
> Personally I don't see a reason for connecting component to multiple 
> cards. Even if it would be possible it soon becomes problematic when you 
> for example try to decide which card controls clock on component. As 
> I've wrote I would like to first see some use case definition, before 
> jumping into a rewrite.


Hello,

Thanks for your input Kuninori! Some questions first though :) On top of 
what Amadeo already highlighted, I'd like to understand what do the 
below three mean:

 >>     - fixed playback vs capture
 >>     - fixed CPU vs Codec
 >>     - DPCM connection vs normal connection

Especially the first two - what does 'fixed' stand here for?


Regards,
Czarek
