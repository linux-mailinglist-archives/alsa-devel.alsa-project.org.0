Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F5F870BDB
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 21:51:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77B3B3E8;
	Mon,  4 Mar 2024 21:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77B3B3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709585498;
	bh=jyxVyqzEfrcV5c1/TMmV2+eq4vhyOONsviogC5kB3yA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MEtYgJ21nn1ITq1Km+jdMrHJhaXCfGb7YvpmBbIeCYZasjh3GDL0s+d10I0p0V2Co
	 kgHDj+aaqnjTNAdtAhGXee45tonmkbqfsN6RJVIZ72h92pnIzy48sCjy4lCFfpoC8d
	 1yiQgoboqL0UKwNbboiruLzVxFWMDNrO6Pd82K+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B3CFF805A1; Mon,  4 Mar 2024 21:51:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1072F802E8;
	Mon,  4 Mar 2024 21:51:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B906DF8024E; Mon,  4 Mar 2024 21:51:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84FE5F80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 21:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84FE5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Yklavghv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709585458; x=1741121458;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jyxVyqzEfrcV5c1/TMmV2+eq4vhyOONsviogC5kB3yA=;
  b=YklavghvG28DGY7/KHWqpvzeU/zBsrlXEiJgHxaiKO+hPwVEUyBLy0dp
   xE2NfaIuiTUP0QVsS2vofzkzJnDrZiUPpB8sNumnDj3xy41LmFCjo3IhZ
   pJc4Cbk7+0j1AiE5Md/Ul6Vk0rLv7GhENGWyB3UACz23CiLRu2gFqyTrq
   n8u83Ya5pcEt4q8Zh4i5RYEc2zrYjlnFpMFQGzCVcRCe/zFXrsZT4vAVH
   9qwfQ2djmjWgoQ21Q1vCx+3C3riPPdRmtCx2Up7RBqrsEbpLfprVU5QPS
   Lmfc2uX7dOyQ57QMgRCba0tHvoW9m0Qd2RvOwLYeLWAlTCRNnwnqDZ45h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7047813"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="7047813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 12:50:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="9236970"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 12:50:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 12:50:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 12:50:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 12:50:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTXYrHy9yXbj5n3F4kn74afiiKQKZ00IH8V3af39g5N7p//NeMvm0NbuPzwxL3QfAt/4/3/jc5Mw/YYKzBP4LzV1rXKf4mJGMiICqrabU9VHLH4FQ3f1nrYLXmpEjfV0PMz0Sb5fBduwlDBTwkbR4d7P3x3SZBkT3y6Py6PleAQIhGpikVSCCCUxCMyH+owmUn5XErkN3Xl+fDph1x08Ost3Vh2/zfwXoRMKTZnTs6/yeDor+arj7X0rPWSR6TbG6+uDZVRBy9PPZb0CKK0HxTJhPpn33+tkNmzvZ0J7QFMQ7LDT/vd9159TWyMpUZbKOoyYxVQS+sqeaDmb4NBI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TmHS0EzlWyLNLMh/1QppOeCt2t2pMs5YEWpqW1qrbE=;
 b=iSBQJ5Co6Mv4YpvIH8HEx2pE5e4Pdfm5dIEecZGwF6yN8OKKxAq1YK0ZNcRGZHAlmrZNFzH1kjbK7gus+R6ZOsxtlzjOh0n/ia+sbW331sG3cpMnvy6xjX34UrPbLId5MoiNT1QESh7q7yB8zvna7IsT4FNHfQTZrDQyAz+d/hYFKxKzikZqMNSHUyE9WuoS1zZXdIgMVT+c69SE5idVadgX2aaUqYhF/Lo/Uft0GV9xJNxg6wQn8SbOfD+FRrb3C20hdY8apOh9Dt1bO8vID2eHGceLWvSZJLUEfQPfjwH4mheixmovuOKWGv5MeKKr7uM7EVdzfNIklCgwLHQJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 20:50:48 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 20:50:47 +0000
Message-ID: <ea72dd2e-587d-4660-9a8b-da3048819e6b@intel.com>
Date: Mon, 4 Mar 2024 21:50:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-3-cezary.rojewski@intel.com>
 <14a2f9b8-7711-47c4-9f57-bd839c700d4e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <14a2f9b8-7711-47c4-9f57-bd839c700d4e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ1PR11MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 954d747a-6c00-47ed-f04a-08dc3c8cc4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 XTsrb727T2/BO/4jzqICgxGhC4ULSSVG5OUxKyFCy7q92qDnSCy4YyfL9lQ6ZeChKJr16C7EdnxMryaL/zMXQk0wUJBEtKb4+fXbTkcYReni5lpqRqqEFBtNSSllvYuRJKkknTYwUCkAmv0YhSspteB1GHHCnPt2gkEX9wIMIErrGraJ6fDJeL6U7xqc+8kqc2Vvbc4iySWGJU2LLGJNeb1sHKdhRQbjNWXmMr0DEQboJtEXhi56Gqs2h9ZURR/fD7/62StzrWoBoRCDeQcJnWuWuTYqR+7SAgUkQnFHa8g2WDJZ+Dv23vc5cijVBAccR+QcrttgZaxFEkISwV6TDtpzADuiPoaGoi9z2Unw/9CI9qy12VbrvqhEeNHdIHwTPfd0UrfkBJZuG0OjIC8Z2jBnH3NOtbS/l/hVj8/Cklzc8HTJhokvudGimDBvE3nyc/IEPd8ozv6H+7SKpuC+tVe8uiNLmXOSr+03jGpm56PFr7JoWJw4zarVtdiiLwm+1dzorOxuU0R4SxIr58ZCBuGxAt3RT7Ap/x6eaz3YaClatYcYn6fGEn94JU+Xbi5gODLkV4CTgesmDKf3pwC4POfiJdB2gYYehLmGY5b6p5Ix9+yebNuvAfF7lk3RH/TlGWgB1a0zC32vzOHpH26/qxO93nJLTBESPWERwSqF8n8=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?UTdtajRzeDNIU1grQVFaUFlFU3NkUGJKbUtEMTd0MmwyRTB4bFpsSGdybjFz?=
 =?utf-8?B?bWFKWGZ3bDBVU1d6dElkNlNyL3Y4MWVNblhCTWJVV3ZLY0gxVFFiTElnRGFs?=
 =?utf-8?B?cnpQRzFxa1JBTndqUGxBbXI0ZitYdkMyV1Z2WDBPQW5NQk95ZG1hTTVieFVQ?=
 =?utf-8?B?QmJiSDRXa3J0WFZlSzVOTE9MWFp0WUJ2bnBieGJSZU15U09ZYTlsNlFtYkc1?=
 =?utf-8?B?WjJCVmMvWUlmc2NuZ1EySHE1ZXJ3MkNzeGVyQkJzZlozNU1HNFZnNDZwNkN5?=
 =?utf-8?B?MTkySHo0ZU1ZQXdTMHVjTXA4eXF0RlpoclZ3eGFDaEZYd0VIZlVsUlRkVkt2?=
 =?utf-8?B?cytOWUJHWUU3OG1LRDg1RzExTzBTcnVMMUczbkovbWVCd1IybHhKdHNxbnJF?=
 =?utf-8?B?SnI3Rk9LOGhmUjZVRU50a01mQm9KV3I0bHFveVNBeUh5K3RXeE9aaUhDd3p1?=
 =?utf-8?B?dWhYb3RYVDZ5NHBwVXFXeGN0bHBud2g5aFU2WXNQeXNpV2luZ011UHY0aGFj?=
 =?utf-8?B?bVZvcHl4Y2IycmdQdlArRXNiTmdvbHRpVXZJVGQzbTlyZ2s0anRWRlcvSmlN?=
 =?utf-8?B?SmNJSUIxTnR5dlQwT0hwbFU1UGsvQTREdkR4ZURWd1d5dVRka1VMdzhibmQ3?=
 =?utf-8?B?UThjMEU2emYyT09YVjVVSDJtZS83dGZKNCthUUgraytBSWpkQnNmRzZGV0NO?=
 =?utf-8?B?R05OeWsySDBOVHRJdTdHblYvd1lhN2dBMHFrS0Q4TktZWWFXSTFrUFVqMVNW?=
 =?utf-8?B?N09kWFRSNUR6Zy95N0M2ZThaaU5sSmdTdS9COU9laXZmVlZFc2g1SjRxZE91?=
 =?utf-8?B?dTFmMTBQTDBHOVBtUGp6V3dOdWZvZDVUK0FJOTByc3pYaGhoa00vQk1rWUNH?=
 =?utf-8?B?TThKTEFFZUVvSmJ6amE3TnVlNUhQVXRaR0FUM1RxNEMxN2pMTjN5Y1FscXdD?=
 =?utf-8?B?SGgvb255cmk0a2hweVFsakVCcDluZXhhdUE2b2IzbWw1YURSUEQ5S2lJMmU5?=
 =?utf-8?B?OVdpcXlNbXhjQWhSQkFWMkpKTWRLeFJrR3VjdllmWDZSckQrek1wY3RQbXBq?=
 =?utf-8?B?c2M2UU9qbXVsOHJKNGZHcEZLbXQ4QkFvVkdLbnI3WHlObkpsNE5uM29yalR1?=
 =?utf-8?B?cTBjWnd6dmhmMWpha0s2SEdOQVFMcGMvQ3NHVEVEek9wRXZZV0RaY2pTemJY?=
 =?utf-8?B?b05ZM2JpV0JvTSs0U0lPdlhjTHF2b3hXZWlHMVZTT2lsOEkwR2lOYmxjQzh4?=
 =?utf-8?B?dkFibnNOYVZUcW0xTk5FVWt5OGdONWRFc2dzYnRrRDZWM1ZlVXNCVjZqcVNX?=
 =?utf-8?B?VDdwNzVZWWpWQ0t6SllvOGRtRmVxelJGZmFuSmNKZXQwRlA5dmNJRWRjM2Ns?=
 =?utf-8?B?bUFhdnV2T3F5dm1ucFZzclFSRU9iRVhjbTJTZTh2UEhmdlN0czVzTHR3ajlw?=
 =?utf-8?B?dGJxY1FQM3h5MjlXVUxaNmpwcVZWVnF4eDBwUHB4TDRhZVF2akViT2JQVTRF?=
 =?utf-8?B?NXBDTHQ3NE5QTE1xNTdoaXFGNnpZZFJMQXlnRFRNOXNCaVpMaXJrTENFM3dK?=
 =?utf-8?B?aitsTmJSaUVZYlR5dGNaZytNYWUySDh5MzlVRis5SjdOVURQNnVTdC9waE5E?=
 =?utf-8?B?VG9HSExSYnJsZVI1dy80c3RjUE1CNjJocEFmd3hpTDRjbk15THZkakxQMFQy?=
 =?utf-8?B?NkxoaC9xM0hNUkJYVkVxRDNGenlNc2RvMnlDZVFlclBXaHZia0dtbndwVy84?=
 =?utf-8?B?bDVXQWh5SC9xM0VHbTlTb1dCVEltN1VXQVoyTC9PTjRBcnNhQ3VmQ2pLUllS?=
 =?utf-8?B?aldJQXczQXVDalpuaEEzRGs3NnFDRVIxY2tMeDNmclRMMnh5L2ZXZ2Z3MjZO?=
 =?utf-8?B?czhVbWpma2ZBREFHNG9VRSt2TTFvV3ZhbGRodnNDWmJHdzNnUlRKV1hWTUEw?=
 =?utf-8?B?NTFkQVBLR1AreTZlSVI2S2lreXBQZUhRNlhDUHkxUi9PdWRTMFo3RTZidUtK?=
 =?utf-8?B?Yng1bWY5KzRLQVhwK3FVK0JGR05wMStEZjRyM3J4aUJlZGFFRjhkQ2U1Q3I5?=
 =?utf-8?B?V1ptNVk3ckFvdllMMHpaZzBlM3I4MHB4VER6WmRPMzZ5d1NPbFpQTytlZjcz?=
 =?utf-8?B?YzNkeFZOUGIxbDFrdTRzWmhSRWgrcEZnYkJNOXU4a2xpd1NUVDBBOUpHUnZU?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 954d747a-6c00-47ed-f04a-08dc3c8cc4f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 20:50:47.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6pWxCxU+G6FLfyRiVdMDr7J/woqael2eWFY26Z3BAmbNwgCmCa2lHYhrDfdRwwDV/PQYeUNzFUS09tmWVSe+FBQ41yw1GblEbJoTrhc1lZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
X-OriginatorOrg: intel.com
Message-ID-Hash: VLPVVDDSD2NH3ALQHPETX4Q4OAXWNFFC
X-Message-ID-Hash: VLPVVDDSD2NH3ALQHPETX4Q4OAXWNFFC
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLPVVDDSD2NH3ALQHPETX4Q4OAXWNFFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-03-04 8:32 PM, Pierre-Louis Bossart wrote:
> On 3/4/24 13:05, Cezary Rojewski wrote:
>> One of the framework responsibilities is to ensure that the enumerated
>> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
>> the are checks in soc-core.c and soc-pcm.c that verify this, a component
>> driver may attempt to workaround this by loading an invalid graph
>> through the topology file.
>>
>> Be strict and fail topology loading when invalid graph is encountered.
> 
> This is very invasive, it's perfectly possible that we have a number of
> 'broken' topologies where one path is 'invalid' but it doesn't impact
> functionality.
> 
> This should be an opt-in behavior IMHO, not a blanket change.

To my best knowledge, soc-topology.c' first "customer" was the 
skylake-driver and the final details were cloudy at best back then.

Right now sound-drivers utilizing the topology feature do so in more 
refined fashion. Next, in ASoC we have three locations where 
snd_soc_dapm_add_routes() is called but error-checks are done only in 
2/3 of them. This is bogus.

If the intended way of using snd_soc_dapm_add_routes() is to ignore the 
return, it should be converted to void and flag ->disable_route_checks 
removed.


Kind regards,
Czarek


>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/soc-topology.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>> index d6d368837235..778f539d9ff5 100644
>> --- a/sound/soc/soc-topology.c
>> +++ b/sound/soc/soc-topology.c
>> @@ -1083,8 +1083,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>   			break;
>>   		}
>>   
>> -		/* add route, but keep going if some fail */
>> -		snd_soc_dapm_add_routes(dapm, route, 1);
>> +		ret = snd_soc_dapm_add_routes(dapm, route, 1);
>> +		if (ret && !dapm->card->disable_route_checks)
>> +			break;
>>   	}
>>   
>>   	return ret;
