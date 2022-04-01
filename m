Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21B4EED81
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A301816;
	Fri,  1 Apr 2022 14:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A301816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648817606;
	bh=UffCNjSN4sul9h8Us7wCylgIwk4xayshL0GgC/qeyYE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rOnzxw9b6BOASqjIEjNcKftDuSvBGzur3r9iS4XZfT4jl52oH/yXNtJMJ2u8kmRrl
	 JhVqOI6Nc/bufLHh1IedP6AkuoMeDgFRO5W9hKDqMl1A9yfAP9GmhdaIwTj33G27nw
	 nzTn4vPjEH/aLKvU5EEw+EPaTbPMYDMRVovqOSww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D1CDF8032D;
	Fri,  1 Apr 2022 14:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A08B6F80279; Fri,  1 Apr 2022 14:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1163F80109
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1163F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D4bLG86X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648817531; x=1680353531;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UffCNjSN4sul9h8Us7wCylgIwk4xayshL0GgC/qeyYE=;
 b=D4bLG86XnG2w0qwx1tAAwnYUfpybZFI9/KfnjLpIGmgYJ6uBZhSaOpUp
 q3acn05TTNMvoplnYCfmvZ4BkbxUW8hsH9rFxMkAHHLgln7MhqFkjuzCG
 Cg4JP9mE9gNMAqN/P7YJXKP3WgKK1+iEuk1qUGJQ0cc+Jpqgdzpt5sZVV
 NoaNVcVMFbvs1QUVa/mGIFq5C6zccIGTnn+6y1iYdtxhq+9rHqfZ8rn+s
 PFLwcgV7cDSywaT9ECw5aKE3SX6g4iOCARfTyLohA/zjAFI7xu1EqC1A0
 odh6hu6AETGTnRYMO6haGcir0RVJ7hZkegiUqhBYsYKgzcnbN4eQPjvbM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257710017"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="257710017"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="640531386"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Apr 2022 05:51:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 05:51:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Apr 2022 05:51:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Apr 2022 05:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn+8wdTxLxxNfW/WoG+iat7KcVdvsd6Rsv0KIGdf794HIKGqOxFUcYizXof6YcmjN7cHOJyPitDwwQCxJQnstITetVdZGW+S++THore+uWsQD4Jqk1gZKDfMHTv4/t6+u1OF3GxMvosWMYqZLNbR9uKq4N9tJcbTYjhYFtJLP64a9T72wmwFzhtFn0srh6e2+3pHQM5bVY6klkMBnz6cQitBqcgyODi/kRGMblYe+z3R/N+pqtJ2bDHd4j6CU5uNg+qJdXxNO9VX/dkj72Yaeg50doG3/dk8d/AiFbtil4/ICjH0G0YzLnSPmzBa6VZvXxxKSe1FtpwauUxEPAnxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUfcFZgmtC6WdaJYpmuu4NkM13TbwaRmuFwjyNMIUk4=;
 b=dWKcinjmbopOCd9UQVpn3lAh6NJqGlX5l7tEPMZJ88y8MVTSShZtg9fnsVh1YEOYVtAFuodFIg7UjSt3eN3ezwgJS7gou4QRe3t8Gf7ht1+Gw0d90XdkV/eXcP2cEm5QCYeBliGZJFZthnuTffWnqvEWI94JBTwqnzruWZgJ6C2e58SnwipLPq3s+9zOIouxl71rk+vBH689glbKObSohmjZ5BmXZcFR7F7lqYYqvErXp5pvENmFMu/aoppimVSkj1v4RcWLUx4rg8Us05YZVx4rTOwCYH7zt6H76lYY0W7vbHrN9UC9Aj+l/yOXFOjQLUdK/LQU71J8MTUTehxhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BY5PR11MB4484.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 12:51:44 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%12]) with mapi id 15.20.5123.028; Fri, 1 Apr 2022
 12:51:44 +0000
Message-ID: <f8e1cad7-c411-e8db-b182-654054456924@intel.com>
Date: Fri, 1 Apr 2022 14:51:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 0/6] ASoC: topology: Cleanup patches
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:4:3e::49) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ade0b2c9-a7ca-4dfa-2252-08da13de5ff8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4484:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB448481A4CE56133C0E934FC0E3E09@BY5PR11MB4484.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fo0OF+Gtqqg379N8TjJcecB/MoEBeQH8yRbLGLuzUSSMcVtB0yWdJyZmDe7S1OskzPuFgx6ubOmYnzsfFk4VUYeKLopTCtOxu1yolmhqyxjy3GCEooxmnhbGUt7G2ypdM1F4oAPLC1OpMV+45djZ3RqLwMnVSYDIjQpp+eUDJ2WNAvi/ZX7XycgluYEc0Hz+tg7aH7sKGS51ncUgdUomenHwIZXxKPtffgDPyEpGph5nqWH0VhgODfio5+i52oafiXI1jjl73JfwG7p+ZFsEczCtNq/Gn/jhzJZ60sGrA7UUl9SryvyJMLkNNrUyzV4DmQlumMyGxCzqf8K+5377TiefFhFXlvP3hK1KpmekoRfcixnUlQunOF10c2QlMwgmyYckKVzcSfC/rgASSDyD4IOgn5V6oZ9Mvd0LJPQ+LwOTQIIaglxg3wYW+23CuggpxgRU7vIx1Eff0ADeLbz/OWfTRTFix8rJT4BsUDwxGFjytveHOiW3l8pEeXCZjNJ4583RZgtfKB108EE4pJyQP9xwslrXxhSPndB2unSW2lQqceOEicf6xuyeNr+lPckzTXqA470DsnVD8H2aGRETVB3PDPcFXeckenQTjXk1aV/bP0MPYcZXatKQAze+t3L0k3BRfNP2qveJK4L6Qhqj4AI5dlNmemJSCNdJnRiIZgeAXTHl74rRsuv2exHXeWjpl4n8OQnlgvZuYoIOtOVYbugLwTqox+sYQuG2G1RNCKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(2906002)(316002)(53546011)(6666004)(6512007)(6506007)(54906003)(6916009)(66476007)(66556008)(86362001)(5660300002)(2616005)(186003)(26005)(83380400001)(4326008)(8676002)(31696002)(8936002)(36756003)(82960400001)(44832011)(31686004)(6486002)(508600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFKcjBUZ2o4Q3RwelRlcWlHaCtRRGtqSTN6UUF5QlRUQnp0dGxsSVM2M1Fz?=
 =?utf-8?B?VkNJT1R5K2pNTjhUQS80ZW44Vyt6U2hhRTgwWDNvdEgyNmVtWjZaZHM5RFF3?=
 =?utf-8?B?ckpsdUVZUlRrakh4WHVPWk9VenVFVkowKyt1bk1jR0N6RlNoV2FmTHorSVgw?=
 =?utf-8?B?SmxUMHdEaUtlWUVFaXRQVndiNmhDQzVkME1Zc1VmSUk4SFpzS3BOTEJQczJp?=
 =?utf-8?B?M05CVzlaN28yMUg4bW1QNG00RzdEeE1oR3prQTVRUVVWQm9KRUZ6WXNmVkhZ?=
 =?utf-8?B?Vk1rZDFDdU1KVkhxRk56QUY1Yi8zSDNKa3A3NTkwQjM4a2krWXNwTGNRZEhR?=
 =?utf-8?B?Z2dqU0tSK2hZRWpqeDNPTitza0NzckJVQTVBU3VVYnVtTmMyeEFqdVJrVVR0?=
 =?utf-8?B?VXZWa05nemU1Y3pKQndIUjdjZThucWg3aFNDTmpac3dkMXhJQ1JZKzJ5dTZF?=
 =?utf-8?B?M2cwRy9JWUlTa3NaU29pcXczWmNOdWdlNFh4NUJ0V3ZWSEJlNjZ3TlFEVWRr?=
 =?utf-8?B?emtSNGFXcmIwbzBwK01wOHhQYjU0dXFTcXpYMTVMaE9pcjFrY1l4b0lnRjNm?=
 =?utf-8?B?QSsxOTJSeWRkYnRHWXdjdEdTVmFnbWx1eWJVT09lNldSWUFmdVE0WDNsNnNr?=
 =?utf-8?B?K3pkUEd4QU1YTG5mUDVBWm9XVjJjR1loYWNXdlRpRlNzdTV4ZFVuTktITjJa?=
 =?utf-8?B?dUlwTCt4QTlhYUZCalJLK25mREF3OURBN0NucUtnYlFjSUJBeWJ2aUNZTVB2?=
 =?utf-8?B?YWh3aHJXcmtoc1hsdE5lOVlCOXlRMkhIQUVES0FVU0lHZ1lIVVRRZUxMZnlp?=
 =?utf-8?B?R3g3cHE3VHVjaTBvSGhCbGd2Z2YrOVpwdEE1Unc0UTFwa3lxREZpQVVUTTFs?=
 =?utf-8?B?TVh2ZFBnYjJnSmtvQVJRVmF5QUo4em1UYlFNWHZYbEo0WjN4aCtTUTNFSk1S?=
 =?utf-8?B?RlVUWjkrWEZCcFp6VjgzOG94c1NLeHgzT041Tk9WamFiRzMrbTFvNTZqNnVm?=
 =?utf-8?B?aGVTMm9kYXIvdmJsaG5nVkVGczZnQUpha0xad1FqMExoZkVUeEhSWlZqUVdE?=
 =?utf-8?B?bkE5TFhDTVFBaGJUQlpmS2MxYURiSzE2SU1vRzdhbDR3RFNzVXZvOE1jTXNY?=
 =?utf-8?B?V1hYa2tQajhoclpOUnFUREdBZ1dRV2MzVGpBR3U0SHdJemxEeUQ3clBOcWN4?=
 =?utf-8?B?VkozQkRKcU1rUTVCKy80bGxTQkRRVWxoZFcxcFl1WjZKb0IxbC81UTBuOU9W?=
 =?utf-8?B?WXpSRnJ3MlBFK0xvM00vRy9tdXowRmcrRmFDMTlaU094a0ZFbjlBVjkvUzNQ?=
 =?utf-8?B?ZVJwaVNORGQvRitsbnZZd0ttNkJvcXZrTGRkOUM2djhoZDYxNnBYZ1UvNEly?=
 =?utf-8?B?OWU5R0h0KzdYcVJmd1BSUnVrbnJqYmgvZjRxaW04bmFWQ2k2VklaSUFyUlFQ?=
 =?utf-8?B?WjJNWHNoTzVrWGY0Nnk0bzNaQTg0ZmE5enVLMStSNHI1YjFUOTRXTm1hUTR0?=
 =?utf-8?B?RW9YWmxWS3JFdUFHeFA4ektueitYRXdGWVZ4RXU2ZjJkNUZOam03bm5VamZW?=
 =?utf-8?B?VTh6a0ZkYkpzSWZ1MFF6VENnZ1lzcFpLU0NhMTRUT2dvZ29JSU04RE4zSUE3?=
 =?utf-8?B?NzgvZTc4dHpGQ2w4elpvSE9tTGk5bGNKQmw4REYxYjVwYjYrTXRoNjI1MHUy?=
 =?utf-8?B?LzgyeERTR3FiaVJnM2tFU0xOZVZRdWtqNzNaWm5xbTdacnFXNmtzTnpibGtl?=
 =?utf-8?B?akFzdmdxemI0alV3Qm1WMWVzVEpZVVNvcDY2czBKRDk5OER6djhmZ3J5Zk0z?=
 =?utf-8?B?L2VWTzdQT2xBVWdtbDQ2WTRkTlFQNkM0UWFOWVVBdFZaUmlqK21BWlE0QlFh?=
 =?utf-8?B?WUVpODNmNlF2REc1cDZacUZtSWtvM09GTURUd0lkRDMyaERPTnJ6WER2RWNQ?=
 =?utf-8?B?b2ZJKzlWalo0cFN4djhBTlpiVXVWRWlSZFlSZE1GdXZyVWcrd2NyRDBUazhk?=
 =?utf-8?B?M0ZCcGdYdFk5Y0hEc29haHVSODMxRkNLcUgrbjdPcXBkTUhNZmtqSGU4cDh4?=
 =?utf-8?B?Y1VLYnB5K1FadjVjVEg5SUFLbVlkbVpoZ0FZazVLVytIdE5HRnZoRDREYVhu?=
 =?utf-8?B?NUhjU3FqWFZqQUZHYTRJcnZTYzFFTVYrVHFCTUtKSjQ5MXRuM1lVdmg3bS8x?=
 =?utf-8?B?Rk9ybHM4SVl0VTJkNGpLM0plWmJ3R3NjRzVhbTFtcHRpMEdjdVh6a1Y3VkhB?=
 =?utf-8?B?WkxRd21kMzlab2l2UzVPSHlQb3pGQkt6cERMdXV1SDFIakVzempTdHRXdVBK?=
 =?utf-8?B?RVlsZWVxYUl1YnI4TVNDenZhODB0TjYzc3p1endvYjJERzlXci9Ebnk2c3lq?=
 =?utf-8?Q?Vlcuvafirh+0KUwg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ade0b2c9-a7ca-4dfa-2252-08da13de5ff8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 12:51:44.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bkr6Ul0noc9wOKI4PDeLabGn76SQO5OkJUihK2iHSxBrV2LI0GQkimCbJ8XKXrQz6oIBCLAL/7eIHW6tsVuj9cXpGLg1wrJpKM4k5JSUvp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4484
X-OriginatorOrg: intel.com
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On 2022-04-01 2:01 PM, Amadeusz Sławiński wrote:
> Following patches contain minor changes, cleaning up code to be easier
> to read.
> Clean up few loops, to be simpler or altogether remove them.
> Rename some things to make code easier to understand.

While avs-driver is not fully upstreamed yet, I believe it is still 
vital to state that patches have been tested on following cAVS 1.5 
platforms i.e.: Skylake, Kabylake, Amberlake, Appololake and their 
variants with the avs-drivers.

As code looks good to me:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Amadeusz Sławiński (6):
>    ASoC: topology: Use for loop instead of while
>    ASoC: topology: Remove unnecessary looping
>    ASoC: topology: Return bool instead of int
>    ASoC: topology: Rename SOC_TPLG_PASS_MIXER to _CONTROL
>    ASoC: topology: Correct error message
>    ASoC: topology: Rename soc_tplg_init_kcontrol() function
> 
>   sound/soc/soc-topology.c | 455 ++++++++++++++++++---------------------
>   1 file changed, 208 insertions(+), 247 deletions(-)
> 
