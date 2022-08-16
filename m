Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27B595A2A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 13:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302C5163E;
	Tue, 16 Aug 2022 13:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302C5163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660649528;
	bh=NIIYVcu7JfmV8Y+wzx3MmRewf7f1wu3J1gZVVVhrEoc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkPIdQcyIIbWmL1yT/n31avhn6QKivu6CJuklZvETUlKPlzLSIOeWm+JUF+buKBhg
	 sZAPQfnu6RUoKJfp08bZYkNa5nQC2jx+90YLDHkkqD4XhlKwxgf7jmDY8h6n3RW/LG
	 X+lMEIpU438BMlz6S2DNG2SSFCr1LterkpoDKwjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 943DFF80424;
	Tue, 16 Aug 2022 13:31:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51589F80082; Tue, 16 Aug 2022 13:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41B21F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 13:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41B21F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YZiv30ZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660649465; x=1692185465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NIIYVcu7JfmV8Y+wzx3MmRewf7f1wu3J1gZVVVhrEoc=;
 b=YZiv30ZYlu0TQ3jZyIb4lugUgkiQA95DxjEUIB3Epe8pFs8ZpnhZlKJa
 n3Px/S5fftGiMT5QAmnH8eBYEL07st1QF0amslzrtyAuT5nUDd3yia8y4
 a5ccO/A5IjVoZL9F5QPVPB3yGH+ecGIl7IFcvDh3yLVheTi0w5QwAB0Gy
 HWKRcD8CcheROQg+fd1yzw8pKJMdIcsSBdCKHHHiTZ5srshPmmMaZKcDt
 Tz0l+DRezn6veN+5vvuu4/nBNqYuieg6GXmgO+Lgm2C+e37M3ucBWGnDS
 8CqSPR0Dx9hmI4NUbDtA0lt2PXhAztQ/hcJ71/+wdB+OK2drEAtGUl5tV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356195101"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="356195101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 04:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="667074922"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2022 04:31:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 04:31:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 04:30:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 04:30:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 04:30:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/iTEYzqcs8RXT5284MWN0EdEHWJKwNnbbrj2RB1/hD4V42RpaUoByfU8JO8ijQRs2t/p4N5m+NCEzvvDlED68yE2p2GNxwdhsRXgEfe2GlACmeL+gQg0jkLBkScr3486FTDkmOqyukoWkfrNVRf7DEfriMNiTHtTukxIs+OGwchRGGbn/2KqgPFiyLOKZ1RlAmpgrfNinqhTkICErZf5uRLka3Fepv0rXJNp8RV9yFb8GHhrBfmz1Z0EMOXXQUJaS1xENioTqB82eHZ5+1OiA5Nb+bueXkgyI+18TGMm8FNCyAop3wXoVgpqobeS3Vw+1ewqcJGRapM5yFO9L+5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C6xNqGGvud5dwkdccMnyAA4C5SI0d/P0GKzvzURgG4=;
 b=H4uMq8H4CWQJW9/LwBGsF5iYaYVjx4gaDYZ08xJZBANGLHkf9oyITisW3Rr4FaFYKlYMv6SLDoAhuunNiQdWLPYSEX+34RiLBmA7YCoACq0U/8qz/9NNjPKN52MBgcx+ZkNVr3CRfIffXEoQOnfTo3l1lECX7epYFXNwAUPpmJzvGjvxxGP9y+vbFHK47dZjGZZwl+G0oWa/ExjG1a5l/8Qx73lcXjRVGn3MOCHesBX+JnWN/mak1oW0+ZwdmkZN/rVWOMiQS+QkEyRNgyt3GxzjjpQctYapZMXoWrILPT04LK3fotfAt6LFi8bbA/DvaUsysGEpSkFV6c3HxhK7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 11:30:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 11:30:58 +0000
Message-ID: <7fdabdc0-646a-2bae-902b-777837b2979e@intel.com>
Date: Tue, 16 Aug 2022 13:30:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [RESEND PATCH v2 0/6] ALSA: hda: Unify codec construction
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.com>
References: <20220816111727.3218543-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220816111727.3218543-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bd14fe9-ebf7-4bc3-4cb8-08da7f7aca02
X-MS-TrafficTypeDiagnostic: MN0PR11MB6208:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6gORrWQm+N0ENs0k25jyBJBzXw9FqvC1S9YEvDYLKLc0OwJ/+GdmNYluei+wxyhV1ZlyYdKbFcoYLan4VSVwUYjSgmJYID277PmOw8sMAdrKFUWRh7/UIVkquQqVpgdjl4jflXomaINhbcMBxJERhMKS/2d2kysdq6Cq6rGinONaxnlUr+ilnphneQEHC7OgerLSFFGM66/2KvfKggOFwAYDvnvHqN0Bp9yrfv+tSe2/rICXjEg51THd7aQ8g794nYJPPWmwOq8hIKaK2NpQaqpTdRl9YzGHeRdsfWAl3kIsc3ks1KjBiGZPbXEV9bakQa4cnYvefkxPQn0nMhe8O4NIz5QEjvs3GabWs94c4erfiUAd16lu4+4XA/NKjQd/q6rDzCc5iS70SFxOge2V1MB49hy7YhIIq5kilYuK+dkC0NdCDeMk9K7mJF4ntI6IBVeWsbQUywFcQP+39L6okNHSnpPbAl8mWkdodShwdWj9kSeLbQwCi1TWQHc6JciWs6/kNILOCHIpRrKP/f5Rl+csY79fdqgBN8HB9EXf6dZmwcbyibZiNdPthHk6CJEfERyxBojm0nOnYX7NfQaGwk9xLaPaRQ++2yvPZEIKTzLnn9bH10XUkGgWH4ih0xKXt9jQWx67/PAsFZG5tNubK6VBA9HTPny7WeaUhOsZQNAaU1fUSHEIYRx/05KDCnq+JZsuzN2+EHhFRJ8Vq3OGWE0JEO/LuEQMXIcOo5y3AUZfQO50UiZQbUzt0UNGBxzJmR690rKe3zgPaJ7fW9zvRevSXrRcLeJf2/byIIpYftJMjQCRo9+LxUzYz+AlgBJS1SX1gGSo2l1kMUpobRivXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(39860400002)(366004)(136003)(44832011)(4744005)(5660300002)(2906002)(82960400001)(86362001)(31696002)(6666004)(41300700001)(6506007)(53546011)(38100700002)(2616005)(478600001)(186003)(6512007)(26005)(6486002)(316002)(36756003)(8676002)(31686004)(66946007)(66476007)(8936002)(66556008)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZ1cDBrckVZODdvTHFjMmZKb3Zia3FhdHFvMWRaNmJEcURZT0NFQnFPb2ZI?=
 =?utf-8?B?K0d4OTRSM3NGU0ZXZDhZSE5Ed09ZN2J6UElUemg4NXN3QlBLY25tbHc2N1dj?=
 =?utf-8?B?cHo4QnRhN2grNklvaHo4Tld0dC8zODNMSDNmbDJMUzRZTEhXVVZEU2sycnNB?=
 =?utf-8?B?bzR0emsrRXVuQ25zVnNkRXd4cStxWEp1TEJuZEtNU1RVT04ySE5tMUNubWVk?=
 =?utf-8?B?OThaTWIxT29nNHI4cHR2YW5hVE1UUHlORmZaRVNhbFBXZ3lkQWVZMlM3QzhK?=
 =?utf-8?B?Vk1HRFQ1TXFwLzZPSFRHZVZQS3FpY2FveHRNeW1TcmVPeGRuYUZRSkk4TzB3?=
 =?utf-8?B?T1BxTjRjR2JQQjBocFl2dXh6NWorOC9aZUpaL3ZXMUNYVmw4NmRjd2lSRXZk?=
 =?utf-8?B?VmVEZ1Y0c3VEVXM5L1IvRmJkMURybXFvWW1KdnJXUTlOM2VjTUFQM0VLNEZR?=
 =?utf-8?B?N0k2bG9nRDlTWUI2TjNXb2lhZmxacnhzS2dPai90ZTRSMFhIYlZxdWJZSnQ2?=
 =?utf-8?B?QVNQMnd4NU5MTnV4ZmVVa1MrbmdxTGRadnpFMjErMm9pa2ZvWjk5VjFlUEFG?=
 =?utf-8?B?aGxPK2xjVmgyWkxFREhSY3p4QnlvdFFOeXdvTnJWZkh2UldQM3ZuSzlHSFdl?=
 =?utf-8?B?OER3Mmp0dE9ZYW1HWXp6UXoyR29rVFhpcEEwZkJuUXFPR2VER0VEVTJQaXJs?=
 =?utf-8?B?clYwbSszNGRzeWlxU1NCcFVUWnQrQlNTNy9uczU5RjFvNnlqTFcrN01FQ0Yz?=
 =?utf-8?B?bngzS05RaVVwT0x2OStmcnlrUGVtc01haXNMNWpONTZURXV3Sk1rMmhKbmhq?=
 =?utf-8?B?Rzh2QXhmaG5Kc2xURkZKK1Q1eUIxcFJob01vcGgrYnE4eklYVnVQU0Z0MFpw?=
 =?utf-8?B?Si93QWIxOExQSjNFRkVWOWl4M3NnUk9TRGwxeXlkTW9kSU9SdlljditsSUdw?=
 =?utf-8?B?MkFKbnUzNkl6QitUTHlBMEdRRWxRZUJ0T0IxMHJtNnM3d0MwN3pJTnZaOWxy?=
 =?utf-8?B?UGN1eUlWeVdnZXRReUY0cVhYTXBBWUxRRVZha2sxYzQ0a2lINlFicnk1dkw5?=
 =?utf-8?B?ZU1EZnFNY25SRDZaNXo1NEJQNTRmWjBCSUM3ZjRHREZWY1VicnBlQXZtRzFj?=
 =?utf-8?B?TVhBaGdlWWVFVjBLMjZ3aDBlRmU1VXlRSU5UaXpGZ2M3K1E0aUYvTCtDZ2tQ?=
 =?utf-8?B?WDgrKzB1eTJPbEZKYkVOUGRUKzQwKzBoYjRvaUY1YzE2NnoyRUI3VmtqSUxV?=
 =?utf-8?B?TlFONS9meTVESmgraXBleXRvY0laZ2hEZE1RcEx6QzhwWE8yNW1LQXJiQ3VG?=
 =?utf-8?B?TEppSFhvVG1zbU9rNitqYml6bmxsbURjbGQ3Y1R3REhvNnVUQlBpb0JqOTF1?=
 =?utf-8?B?b2VQeUZzWTBLZ1JhQ0M0U2Nzc3pkeDRuTVZuSXV3QnJSN1ZrMkl6S1Y1RGZC?=
 =?utf-8?B?R3h6OUd3UjhQVVZLemJUUlNLdHh4R01hL3hQb1JKNlI3MUNiYTFZQmhHMWRh?=
 =?utf-8?B?QTVmS0Zmb0RVb2NjTmJZc2xPcGZJWDhRNWZBRDVLc2hiNGJUN2liUGFXR3V3?=
 =?utf-8?B?eXdubCtaS3J2VmpUblY4K3I0bzVHOGpuUjhvZWxmYnh1SEdMdkx5OGNCVDhD?=
 =?utf-8?B?NmplTmtacjBNSlNQZlI1RDZqZjNOVXFJelcvSmYybmY5TFZhN1J5WDJEKzZv?=
 =?utf-8?B?WlEzWFNJY1M1Qlc5d0NJd0lnbzVITU44SVUwQXoraGtLTVRCcUR3MGxkVEMv?=
 =?utf-8?B?a0FTYk1qMit0aVFyQkpsdjMrWDNrNHJKYjVQTURuWTREUHFoNzdBTGZaQzdM?=
 =?utf-8?B?aHVpNFU0TS9JSEdxWjd6U2hhR2dmd0R4Ym1idnBjNGVPeFRNbDYwbGIrNldY?=
 =?utf-8?B?SEJDYVdUckpkWEdMYXVtN3FtNWRMSHl2L2xPRHByK1loWldhalRFbUYvKy9P?=
 =?utf-8?B?YWFBcE1ySkhwSWhVSThyU2pGdW9ka3BPVDA1ems2bnlibUxkV3FwcjdLWUxM?=
 =?utf-8?B?N0RzQWZNcnJuSGZXTTlKcUx4eFErVkNLN3dYZnlEdy9pZ0Erc1RJTFpNVldX?=
 =?utf-8?B?bjBhSHVoZDUrMmR4dm13eERvTGkxK2VPR3hCL1p3dlJQdDEvMGtYM2FIODlO?=
 =?utf-8?B?YUNOZ1cwaTdHNUNySjlTR0NzQVZESUdXVkphK3pFMThqcEtIcUdEMCtkZFNu?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd14fe9-ebf7-4bc3-4cb8-08da7f7aca02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 11:30:58.0263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/Yp7BSQGGjWR+m6Q5NuLbbZif0NLXOCmfn/Qy1e934jYuvODf/3m0cyNlL3UfjukoxHEm8XDaB8ZT3SLkntIez5Zj0ySHWJF+SnxXapN9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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

On 2022-08-16 1:17 PM, Cezary Rojewski wrote:

...

> Cezary Rojewski (6):
>    ASoC: Intel: Skylake: Introduce HDA codec init and exit routines
>    ASoC: SOF: Intel: Introduce HDA codec init and exit routines
>    ASoC: Intel: Drop hdac_ext usage for codec device creation
>    ALSA: hda: Always free codec on the device release
>    ALSA: hda: Remove codec init and exit routines
>    ALSA: hda: Fix page fault in snd_hda_codec_shutdown()


All of these landed on lore.kernel.org without problems now.

The only thing I can think of that could offended the server is the 
incorrect email address that I had appended to hsw-bdw related series 
[1] which I'd sent before the unify-hda-ctor v2 one. Kai's email was 
provided twice there - by mistake - and the second copy is missing 'm' 
in '@linux.intel.com'. Perhaps these topics are not connected but it's 
the only offending action that I've managed to find.


Regards,
Czarek
