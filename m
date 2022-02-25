Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED704C4D59
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 19:09:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E28441F16;
	Fri, 25 Feb 2022 19:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E28441F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645812587;
	bh=JhNmkE5zz3Mb6M1EhZgi8Jb2GJMFaAJn7SVBb4SUR+k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jo/c5Ibm3Wwt7iKsi7f0WDWLhg0T8KALzBU3RpDzwh7eVOa/R/WKMmkMOfIV0ixT7
	 wio00cWXwWtnwokEV+JGdqxu2824YBvy1D6YV7PVkFsiVt4uRo1RBUMGSW11lher+m
	 tNSnEd2551InoBYytlF4Klh6wBOOPmhPy1JdG3yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD6EF8020D;
	Fri, 25 Feb 2022 19:08:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A81F80159; Fri, 25 Feb 2022 19:08:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C4C0F80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 19:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C4C0F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VJCbydi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645812518; x=1677348518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JhNmkE5zz3Mb6M1EhZgi8Jb2GJMFaAJn7SVBb4SUR+k=;
 b=VJCbydi+Pxwg6Sw3PROav/f3BdWDjSoIO6mqHE/sLrH8/Pf+wEg7L/Ax
 9pS+sGxuKEsAinNDwEb85KGkAT8Qw6JeCNbMs+ZPchJpyE/93ONNlZqlz
 SNhSaeSfOCurmM0zS3RnWRGCi0lzoUMZlGnVF7mAe5vdjeJh/QNyfBgWK
 Xpx3rLbz2NYTp1H8CBCQ8sJBnNRbUMl7e8Ja5AXxS7aG+PnMVh1QTyTnL
 eflK0bAO6dwH333DS8hGyNG37RF8ZG8Ex5d66HRcQ1RSfS2My4IvU18WD
 lW+iczAQTJmXc3fwrnZJyUIacBL3fFU5+Yu80SFsppEUTzj0ks9NVPZKt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233173900"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="233173900"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="607835775"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2022 10:08:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:08:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 10:08:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 10:08:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5To1zwTtkp9s2H/mCp0mO56GiKGX2dc2nL8WFSld8FTXVXJBFwQmuxEAb8En9U/7bLta+yxDMGUZ9HlhrkmYTxs2eA3sSnaAMf2iG8Q73QlwJpehd2aK5VjrLMEH0UatHx25VbPVM2EAiHcjPWdBDK3xy/voU53iUrnccv7VcSw1l56R8+B0vSr1TvCA5kJ3l76HpYAGFLKdRFm2SjtPMgDnlFgQbgC5VwRZuESF5edUomTPNY+Kd/WHfbNxOgq+52eJxy+4+J2T5lsjtbPaJa2foelL/DzA8BBtixN5ptL/gqFq/dmpPaP6351OO9ReLXWaAszjzGvC8CTCGl5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpvJJrKahPlRPE+X+hZ6Ow11xjwWoL9VwTWkl5ljPXo=;
 b=APzhyoR9rQ1ZfUXiSIJdluOhy+NQah6MIIalYat5iFi/npE4nwLqiS1py1z69ZkXVe20uUy98JxJ0SOQhTIEXc+yn/PmnNXmf41iQb36ZNeAPcrOroYmkqZYIWkpiLZ68cyR5tVbKedpm6luJbP4Le8DxwKSRAYahdrTf4tikLBya5PEVhrpxms5xW9gLKLSvEzetdQlZ9GFWHWas7bzWZZbMoxTyfsJxvCtHSjlqN2YjIFIT00Z6L3tiLLBSo4f9o0ZkBmeVmSvfmUPo34hA3iKXcrguVEljcd/c1rHjhlZsFJrjHbq82Dotl/pwAfA2jV+lSmGZ+c1pSmmskNPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH0PR11MB5048.namprd11.prod.outlook.com
 (2603:10b6:510:3d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 18:08:31 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 18:08:31 +0000
Message-ID: <23529e60-3919-57fe-8eb4-8ecb3ae0a988@intel.com>
Date: Fri, 25 Feb 2022 19:08:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 05/17] ASoC: Intel: avs: Add code loading requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-6-cezary.rojewski@intel.com>
 <b3b95859-d3a7-7159-3806-1beac558828b@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <b3b95859-d3a7-7159-3806-1beac558828b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::33) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fe0a9fe-77f0-4619-cb62-08d9f889d4b7
X-MS-TrafficTypeDiagnostic: PH0PR11MB5048:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5048FDA077BE0D2DA0EEE85DE33E9@PH0PR11MB5048.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FkKQ/YhHBgc3dwUpKi3cSU/Gmoxq+FZlxwRzN5QJtfYdxnXKYtPKEM5oZ1JCYeZPmZPNz+W70Kt5kgjUwdbaIfFeZp6dE+M4dLM2IgHpkacwAOC6EdefeU+cog5/Sn84LVmWhkYzTyfzbQMQ8C4lAY9mNCbeuy253XwN0SkURjNgKJ61AZe/eCIY/Hukttw401+cmkVGtJFGFefI7OEoe/m37yz4PIi3m2hMzIPrIaswEloBm2G3+6rdfK3xqBmk6Az5B6xcf3v42W/bg5XKvA1FiADpLkqHu+YQPHNgkC3LqW6qXsro5K/ciLtpll4QEtEYxSTdtVtocFuTCQ1LRlEmDh2c08CROmjFJ8F+nX6XT6XH7OqSPyZEpwwYsStd7lBQ/O/RsJxWVyeVyk/8gt9Pr/mMH/+K+Ba8cwXhg1JGiOZpjyCh0PGWLZe9X7A1cpfYBU7Vqc+/pd6SicT0K/Nnml1HJPTvIMNk7s3bPgxupqbkbTAxVEhYHIxAAU7qxfP4+lGD/kspVM2OvVVd01Cow6WXe1genplhZE6Ep7ZaBLM388cyvNbkjQSaMk7uyS95EDCx65lBrbkkdiMrJCbxt5froK3qZ2WGRh9jkqgrFmzQIB7v6wIAKfCTeOdJ6JRwJ5JH62OCTnhDibPjEBDagZg3pnpF2OxPLZd7lSI40PxhUQXFvH7JBMmBORyyBjW1zTwhW9K8VaZL22XPgIrm0T3FwwkdyDP7UimEmKfM0rX7IogUlc6GqdA7vn4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(44832011)(26005)(186003)(2616005)(31686004)(6512007)(2906002)(82960400001)(53546011)(8936002)(31696002)(66946007)(66476007)(316002)(6666004)(6506007)(8676002)(4326008)(38100700002)(508600001)(6486002)(5660300002)(83380400001)(66556008)(86362001)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm1zbWN0TDRqRExTSjRrdlRmZGdtYjhBK01XdzgwZHEvS2toeFNiL2w2MWl2?=
 =?utf-8?B?ejZJaXBTZkVtblUxZDFoMStNK0lpYXU4Vk83OVB4azNRcjdCeEFBb0tUSzN5?=
 =?utf-8?B?cFU3SnhKNW9IakU4ekpPK2t3VG95YnB4eHRJcHFqbzQrdmF5dytJZTQyNTU2?=
 =?utf-8?B?OVdGNHZ1QTU4WnRrNFZkNDJsT3NNVmMyWXN0a1BldTJydEVBWVF1eWtGenl3?=
 =?utf-8?B?VWZiSTIwUFN1SzE0bkJkL3M1TVdIM0RoUnY4aGhaN0hoMWM3aEhNaEJjbmU2?=
 =?utf-8?B?U0w0V0YxMnlvdzVhMWpvYXQ2ZlFzc3Y1NzJ6a2crelBxd1RNY0dwU2hkNVlx?=
 =?utf-8?B?Y0ZZY2VRTlpESWlLYlBEZmNPL1d6dWM2OFpvbWQ5ekc1Y0RFQ2dTWkVlRXYw?=
 =?utf-8?B?Sm56enpraXVYNjdvVUVpdFFpWkpEMkZKWm9DZDJpWjhZajRSU1ljQm44MlEy?=
 =?utf-8?B?Tmw0QVNpM3hLWFRIOGpFV3dpRDh6eis1UGZ4TjFkWUxSVFNMZk42cUp3TGI4?=
 =?utf-8?B?VkJ4bHo0Vlh2Mm91TCtxN0VJYmFjanhoRER3SDM3dWpRMGlVMjRIRURuenRF?=
 =?utf-8?B?UmwzZlhMa2x0Z1RDS2drbGZyS2tRZGw4TFVsN1FFdFBLN05aMEhML0hWMDYw?=
 =?utf-8?B?dlVjdVJSL2Vvd3NrRlhBUklSNVlsRG9lVnViZkNDYU1GZ1pTL0dvNEllbi94?=
 =?utf-8?B?bE5KcXU5MHVVUllUd0tlK2RTT1c5L1RhcGRkdEM0SWJxYmE5YlZTcVBnL1dx?=
 =?utf-8?B?QUhrdjZHK1NObmFxMFppVEVFY1AvdDhucUVDVUcwbFlNSXJjTzVxWmg4QWxZ?=
 =?utf-8?B?NFNZbXcrcHAvOElhZEQ4cVczUHdkcTN5a3lLWWdRcUpqV2VYUW16MjBhaWlY?=
 =?utf-8?B?U1Q5aDdQaERMbjh3VittSjNMZGhaUlhkQXNUdkhVdUVXQ0JKWGpTZmMrcXZz?=
 =?utf-8?B?Sm9scmFJcXE5ZmFjalU3OVZRNUlMV0I5V3dSM0plOXlGbU9lc2xtdmVuRVBD?=
 =?utf-8?B?TGU4TytkOWluL0tYZldhU1lJUWpHTEcwOXE3UG5EczlRQWwrNm5BaGE1Z2Zk?=
 =?utf-8?B?UVZyOGw4WE9rMEU5MmJtaiszQnZMZmJYM3JnVmJtYkZXODdYV09jM3Y5dHIz?=
 =?utf-8?B?ZzV0M2VxTW5VWi9oc2JpYnA2dVZreGxNVTJVbWVJRG5oOU1lRzd0S2tXMysz?=
 =?utf-8?B?aVhrTE96YmxWM3BLZ2J6WWFaR3p0THZveUxmQjQyZmsvV3V1SHpQU1lwUC9X?=
 =?utf-8?B?NmZITWtXM2pmTGw3bjZ5dXJaTFgrbkVrYnFKQndwTGRETFhIdmxtMEE0SXh4?=
 =?utf-8?B?YjNNWjZyUlZkYi9zZFdpZFFaM3ZzUjJ5RytvSVJvaXJVQjVuNW0xaVc0d29i?=
 =?utf-8?B?eFIxZFdQN0t6VzdPc0NmS2lqSVNrbnJUdS9GL0pQNTNZVUxoRllWZEFYZlQr?=
 =?utf-8?B?RWROT3VZVytLNW1iazAxbHMreXJBTnJPUDlJL2d2QTZjdzNiUUNSQ0poYzRM?=
 =?utf-8?B?b0JpcGtoZHYrb01OcEUyMHJyQXlTYnNwUTljZFdEUjNPRlJuNWZ6enlsbHJt?=
 =?utf-8?B?Nng2bHdkbFE1Z0pub0JMT2c2emtkcW9tMXpwY214SzFuQWhKSm80TzRjaWJw?=
 =?utf-8?B?THlpNUk5YWhFWVBqbi91TWZYZlpJOUtKcWZ4WUR2dElrY1MrdHZyQkxSaTNl?=
 =?utf-8?B?K3pkTmpBbWd0UGVPS1RnTUJsNFFWUVVPYmxCVFA3VittVFVrckhqelNEM280?=
 =?utf-8?B?cC9GQVJvMTBMTmVCeWUwbDJmNU0vVWtwSDVrU0VGbnplZWFCcGk5alhSejJx?=
 =?utf-8?B?WS9YOENremxmZXY0YzlkelQ3djI1ekJpLy9YWTVYdGFMSmlDc3RvWmRNUHVK?=
 =?utf-8?B?dVphMi9HSE5ZSDdUVCtsK3hIRktTTUlicHZKWVV4YW1IbDhWQjkrWkRkM2hr?=
 =?utf-8?B?Z0VGbjl0UTRQSVduYmJVY3A0cDgrOUF5YUxtRGN0NmsyaEsvY2tDUTVVYTJE?=
 =?utf-8?B?UHRjWDNZcXNudFNSNi96Umk0TU8vbFNyQWE5QmxmUUVTdi9XcWozMC9YQ1Vw?=
 =?utf-8?B?aklyL2FCeitBcUNSV1Z0WlhBdklHTkdXWndrYW92dkowSi85cXpBLzB1K3JQ?=
 =?utf-8?B?TEF1NXVMWjFZTHhHUE5nb0tERmR0Z3lxaFBWV0JPbWpkdW1FSGtwQ2NzZ29a?=
 =?utf-8?B?K2tYYlUyd3gwVDU1TXFWa2JvRDZJU0oxT0xQUU9nOFhNektTTURWU0E2TmZ3?=
 =?utf-8?Q?8zba88cHqTExq0CWYrAv8sWYStXyljp+ZwGysVaEfk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe0a9fe-77f0-4619-cb62-08d9f889d4b7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:08:31.5314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89tlbNUxbc5yWQr6toh5jplCNCgo5FgoJ4SfgYc5gyhBD64t2JJJ1FMSnva+xsyua8kWVY2M+Wt2N7eRtCi0BDOYbq5TYySCn2rq9RJiw7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
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

On 2022-02-25 2:02 AM, Pierre-Louis Bossart wrote:
> 
>> +#define AVS_CL_TIMEOUT_MS	5000
> 
> it's not clear where this comes from, and it's also unclear why both
> types of code loading would have the same timeout when the hardware is
> so fundamentally different.


I can re-check but most often than not, I'm basing these on proven, 
working, close-source equivalent.

>> +int avs_ipc_load_library(struct avs_dev *adev, u32 dma_id, u32 lib_id)
>> +{
>> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_LIBRARY);
>> +	struct avs_ipc_msg request = {0};
> 
> I've asked this before and I don't recall by this case requires an
> initialization to zero?


Fields 'data' and 'size' are also part of struct avs_ipc_msg. We zero 
them out here as there is no payload to be sent for LOAD_LIBRARY IPC.

>> +	int ret;
>> +
>> +	msg.load_lib.dma_id = dma_id;
>> +	msg.load_lib.lib_id = lib_id;
>> +	request.header = msg.val;
>> +
>> +	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "load library", ret);
>> +
>> +	return ret;
> 
