Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D674E2F21
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 18:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56CB41752;
	Mon, 21 Mar 2022 18:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56CB41752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647884112;
	bh=mLEvfyjAbdIfDqL/ZEt71aQ70nwvW8gesIFeZxaGQl4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jMuqDNrYp7FZ/irj/ic2N7QJzt/E6A0iUcbUZmchTfOArX+VvjIjEOQO8DLqLTJig
	 pQue6O6Qgov9HeP06ktl0jlVDjQjb7Xaheekhsm9cufMhA4TYRY0ttw+AhsT6k8OAy
	 n4dIHPKTtWt8ipY8CbXT4LrNac/QEtyC3dCxJOAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D33B9F80227;
	Mon, 21 Mar 2022 18:34:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E0CEF80227; Mon, 21 Mar 2022 18:34:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CC7FF80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 18:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC7FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mnrpQRm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647884037; x=1679420037;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mLEvfyjAbdIfDqL/ZEt71aQ70nwvW8gesIFeZxaGQl4=;
 b=mnrpQRm07mgfdzfE4ndKRyNmsA7yRwjIte1V+l5I5k2vIOhXFZ8P9Obx
 LsvRnHP8BI7hpf0RR9xppIOgZY0LguRNZQyvrwlI2PznJQC2XZJh5IucO
 p9KFvHTOGlYMiawT+9CaOnk+DxpkelrSdrAKLnAv6PwDHyHIoh0lJQXLG
 O/3ddzn3+pA2ZjiGZhV6k/qJ9XWG9I1Qge/yZZh43qznsvf3tUMQPBnKm
 Tkv7EWNE1lDM8/k3wo4V/9gcnnLjZkDE+P/ig8U9tyEBwXBrDjgSErj3Z
 ecwnLXbYYrWlIDz1LXdRRP3PzbBRDAUxwx35yiFxQ+HJsGawV33s1evKS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257328831"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257328831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="518524709"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 21 Mar 2022 10:31:45 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 10:31:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 10:31:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 21 Mar 2022 10:31:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 10:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1odFidHoB2l9arTUPjVh4RVEGmEktlslUZF1S4P5zZEuCOcu480e0l/lvMVghwrnBKVw9WyRndcmNxjaqV0BdPLYsW7xZjdgoMUlP2kmxtNrbzG/fnSvTpo5w0Opr3xohOKgfrmN6yZieCxR43QDEg7+UJ3qMB6BqG9YDq+J4XD6UGBZtOFtDkm2fRI/vXWD3KGGS8AK5i1puyZxg8UYNwNVWjpAEQB7tFoJun9Ai/2CDPq34AEGeU8tVgxmv4OFtPTx4xETsp5U9JkwVO4eyGnxGawA8Hh9XAxmhJdtGsVWlLlhwJ16f2HXANnK7PO61LhX0HrBkusTGI+aL7hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHkOScvL/0tH7Fw9/fF6LOAFvAQGLVCXQ8M9SlSF7mo=;
 b=bITmF5+Ss5K3Fb8rMyHr6PId1VmnZ3rWANsFc7VV1CpRfAK2W2GUZg3SxxsKT9Hh0YSEXLYpikuPASwmKop8RGOOQiGClVRLPhRaajd3NprWoHuBFIRskX9sj1FLtSMY6iW6b7rrh9NWq/4XO7QF/pTEKjis+/cFt6539o+El1Wt1wfJ/BiT1J/zcLTeZqPfKx1losrlpMU/PSX9VgigIdkuI/syr9tOGmQ2evMjv5E6dgMVRZ9O/emUjp5Ogyw8jk63cQ1AwFljlFQDAgwGoHcpByU18RP24YFkJpgDuZprXgedCZVNpbLPcZ2HNrOr1xVApQf1Y90m9+5B1NaWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BYAPR11MB3174.namprd11.prod.outlook.com
 (2603:10b6:a03:76::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 17:31:42 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 17:31:42 +0000
Message-ID: <ec07f844-2fb5-9b2e-f627-f809308fd3a3@intel.com>
Date: Mon, 21 Mar 2022 18:31:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 10/13] ASoC: Intel: avs: Path state management
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-11-cezary.rojewski@intel.com>
 <49fcc185-f954-1811-729f-5969fcb68125@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <49fcc185-f954-1811-729f-5969fcb68125@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::18) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85b507ce-0399-4045-c4f8-08da0b60aa1c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3174:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB31748B1246FDEE73FD166B5CE3169@BYAPR11MB3174.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sJFhevszLpMIWuE6OCi0JYJndE8XblqZo+UK+hfqylOAQDwducYsRahf/vWAY/voqu3bGDXQ1K04Hz/7KUT4YXuElZcOq3hALRSnth1Zvg5vJcWnYto4rNyCkigw0moIRhuzjM4F6ku/zUu4PAzf4q2wM1rr5gs7aOKJLWBvHSAOMRLg4I444FRT8aXJzVYernYygGiuXHJCFu5pzE7Z09LxRJ8dM8u2LR39NRIui2+hcyEZXszLr5md/GcJgszb4cjTxoaOhRMhOwNyGQ2TfpgVE3xbDL0M/9VC+CG7b0oI6sg8D2zlOW0rU/+aHF4JbDxA/5gOBzUn47H1CS0OuROVJ3btcoUePYhN5lBHV0ouxPMYAsDYY0CQ8AE6ksMioVjRuOu5YVciY1cUKava3Cr09qD5ls/067pQOzoR23T9YRc/BSCr48zohQf7YiAx+4d+zPRM4H1eQ77DsgSJzsxq66anOR9RO9x/lUye7z/r3VeU+WPW4ZIcDnaWPQ0mnFZI6s/9KG2VKvWHmQo6gfU2xYhwmkkBIq1pbLl1hC1lz2VTvV1fNVHx2V4tY1Q023zBsU8NUs3HmubBn3YDb3/+xpSxdseDPaUlxcm6JtpVSicOqKRPFnh4Ndh5bzf460pXYQYAykqwJTExqjdEM1vdrfDvh8VZKupnOwX1Dy9uZGWWlhWupP98gEYjuzJgduz1Le86QHNprwh2dVxbLcTOSqPkXzW8QZyW8HtWB4Jq+FYds8Srki8foN1FEDA5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(31686004)(2906002)(31696002)(44832011)(6486002)(5660300002)(8936002)(82960400001)(7416002)(508600001)(6666004)(316002)(53546011)(6506007)(36756003)(6512007)(26005)(186003)(2616005)(4326008)(8676002)(86362001)(83380400001)(66556008)(66946007)(66476007)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnlaUVRBQWVETkdOYWQ5NTZtbG1WQUZ3d3RNK2cvUDNRZG5VbVB2di9leFI1?=
 =?utf-8?B?TDFFanBnWmRoK1UraFlldVVGS3NQaFJzS3M2aXQ0UGNTZllFSUVCcXZRSHJT?=
 =?utf-8?B?VTMwZk9QTUJPeGxlSW1KTDFFU1lGMGhrOG9JalJqSmxKQkgzU1VmeTVqVjZy?=
 =?utf-8?B?c0YxZ0ZXdUViK282TzZkMllScWNPclA3Q2dhTVJYSFEvK2xkZWVtaFZrTW5t?=
 =?utf-8?B?Ry9tWEl6ZW9LS1dNb0RCeXJWWmZiWStHbUZxUjlydUJEcGNIRHVES09LaHhp?=
 =?utf-8?B?UVY2UjNuZkdjVHpyRytSVy9lM2V1Y09SKy8wTWpScHc4RmN6ajQ2dVlmamhp?=
 =?utf-8?B?THhYdEdOU3ZWcW41RnZPRUpGbHoxY3gydjlTTXM2ekNCTjRxRm5sNm1NY3pa?=
 =?utf-8?B?aUtscUdQQXgrdExxMUlhQzM5bTdTdCtHOExzb3RFSzdSZWdBZlBPRldPdkov?=
 =?utf-8?B?SFVVSjg4RDFMU3NYZFhkTlZFMXlXUUNpYzU0L0VpWVhmKzQ5c1dIRjJtMGNZ?=
 =?utf-8?B?blZKVWt5UUJtbWZrZldUWUlMQm5vTlZXc1VLcXI2eDBTNTZTS3RsdjN6eE15?=
 =?utf-8?B?QWNScEJ5MHFyNDFxYkMxbER6UmpJandSUG05b1l1Wm9jUHkvSnpISzdscVZ3?=
 =?utf-8?B?dFAxWVJjdUtYUGUrU0ZqT2NuSitMcVAwY0U2bHVEYXBnSG5Ra1B1R1NLUldL?=
 =?utf-8?B?RVQ2N2Z1UElQVDBsYXVJTTNURysxbVEvS0ZCMGtkOFlreXFHUzNRWG9sZU9P?=
 =?utf-8?B?d1ZES0g5RU9La21zb0MrQk9MOHVOTzM1a3ZmVVAzYmx1Tkt1ckpGQnhZclBC?=
 =?utf-8?B?b0VRNWxETnYya2FyekpHTlpIdVBjR1MySVluU2RrcWVRU1MxOCtKbmhPK043?=
 =?utf-8?B?V3JiUUdPQlMvL0N4Q0RUaFFwWm81dGVrWnBWOCtPejQyYWMxdGsvRloxcWhY?=
 =?utf-8?B?amE0S3pITW9UN3F5Vkt0M0xYYzZIanlzVm1IVktkQ2Rxd2FSbmdFbE5Xejh6?=
 =?utf-8?B?dTVDTFJZTlNQTkFoMmxYeVhERDB1bU44RlI0WXFTczRHZys5SHhpWjUwUU0v?=
 =?utf-8?B?UXdHNmV5ZGFOVjRQT2hRSU9GdnU4a0dVcDRydWJUVkp4SXY3YmtWKzZvOGhZ?=
 =?utf-8?B?TWlnRWFKU1lGcUIxMWdCQW04QkNxa2hDWDFmMTBvY2dXSzhPdUp5VjZIeElO?=
 =?utf-8?B?d2pDS1hEaUNqeTFHYWFHYjNoellZRkpkS2czdUNHLzZGdG56QzlUcWI3YTRO?=
 =?utf-8?B?RWlYRDBxNTV5emFPQzR2SWVrMDB6SVV0VFpWQktBaXBoWG5wTGpOZXpNd0dK?=
 =?utf-8?B?WnloUElZejZvUXU1YjlheGdPTDJsSjRmS0RGbHZ0WTNqL1kySjdNVy9SeWln?=
 =?utf-8?B?dWNWbnNyRmgvTEczTFFRc3c5VVJ5Z1c3aEhRY1dOMmxkVFBUR2RJOTZHQnJU?=
 =?utf-8?B?OG0wWDBsQ2JHaDNGaEhwa1hOM29Cam5oS3dNaFdSbW11bGV2QkVtRjlLdkRp?=
 =?utf-8?B?K2c0WHk5L3VZdy9aV2YrWUR5ZFhBeEZLeFVaYmJzRzBqaXVMSnluQzR3RlhI?=
 =?utf-8?B?b2xLeGdEREE3eWlqd3RXeUdBdmJVbzNnbEo3Wk9IWjhGYXRIeXpsZXc0dVFn?=
 =?utf-8?B?TkFRd0Y5MENXdWtLczVDcitUaWFXMzVjZVpzOGd1MnlnOVRXNkNWMUdUSEhv?=
 =?utf-8?B?aC8xZStsdGlhZ0d1VXdVQTFrVnhaOWh6VTg5WGo4Q014djAycTNsRVpsVzYr?=
 =?utf-8?B?ZEZSUDFqWFY1VUdidTJGZVpUSFVSeWVIRVFvcXoxci9FclhsTDY4aERKVncx?=
 =?utf-8?B?dUlsNk9JM1pFVVBWZlh5MjhvTFFDdml0WEo1bkFQdTcxRG1ST3c2dEFPT1V1?=
 =?utf-8?B?RjZiWVlBMzRYUXR1VGF3YmJNWFNrTEQwaE9RWFRSM3hQQ013MDJUUlpIYmdp?=
 =?utf-8?B?TmtYY2ExdTBZUUFZSHBUd09BcExieDQ1Nng3d0d2TkRGbDFvQmhKbGZjNHNN?=
 =?utf-8?B?Z01tb0hjZGlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b507ce-0399-4045-c4f8-08da0b60aa1c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:31:42.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dcW4wbSruhDH9/x/hQhKwbcC5uDocQR9VG1hoqop2KZdnV58KXbPKPF4dAhwrJ/fceEmeixcIVpNgol6RiIj2rLcoQgQ9VIRD9JtKcDiSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3174
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

On 2022-02-25 8:42 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> Add functions to ease with state changing of all objects found in the
>> path. Each represents either a BIND/UNBIND or SET_PIPEPILE_STATE IPC.
> 
> SET_PIPELINE?

A typo! Thanks for spotting this out!

>> DSP pipelines follow simple state machine scheme:
>> CREATE -> RESET -> PAUSE -> RUNNING -> PAUSE -> RESET -> DELETE>
>> There is no STOP, PAUSE serves that purpose instead.
> 
> that's not fully correct, the STOP can be handled in two steps due to
> DMA programming flows.

 From DSP perspective, there's no stop. Literally one cannot send 
SET_PIPELINE_STATE with STOP as a requested state.

>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/avs/path.c | 130 +++++++++++++++++++++++++++++++++++++
>>   sound/soc/intel/avs/path.h |   5 ++
>>   2 files changed, 135 insertions(+)
>>
>> diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
>> index 272d868bedc9..c6db3f091e66 100644
>> --- a/sound/soc/intel/avs/path.c
>> +++ b/sound/soc/intel/avs/path.c
>> @@ -285,3 +285,133 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
>>   
>>   	return path;
>>   }
>> +
>> +int avs_path_bind(struct avs_path *path)
>> +{
>> +	struct avs_path_pipeline *ppl;
>> +	struct avs_dev *adev = path->owner;
>> +	int ret;
>> +
>> +	list_for_each_entry(ppl, &path->ppl_list, node) {
>> +		struct avs_path_binding *binding;
>> +
>> +		list_for_each_entry(binding, &ppl->binding_list, node) {
>> +			struct avs_path_module *source, *sink;
>> +
>> +			source = binding->source;
>> +			sink = binding->sink;
>> +
>> +			ret = avs_ipc_bind(adev, source->module_id,
>> +					   source->instance_id, sink->module_id,
>> +					   sink->instance_id, binding->sink_pin,
>> +					   binding->source_pin);
>> +			if (ret) {
>> +				dev_err(adev->dev, "bind path failed: %d\n", ret);
>> +				return AVS_IPC_RET(ret);
> 
> so what happens for all the previously bound path?
> 
> Is there an error-unwinding loop somewhere?

This is a good question. It's an unknown ground. Usually if anything 
wrong happens, all the pipelines that are part of the path would be 
forcefully deleted. What I can do, is add unwinding and check with 
validation using some unusual scenarios to see if no regression occurs.

Not promising anything though - see below.

>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int avs_path_unbind(struct avs_path *path)
>> +{
>> +	struct avs_path_pipeline *ppl;
>> +	struct avs_dev *adev = path->owner;
>> +	int ret;
>> +
>> +	list_for_each_entry(ppl, &path->ppl_list, node) {
>> +		struct avs_path_binding *binding;
>> +
>> +		list_for_each_entry(binding, &ppl->binding_list, node) {
>> +			struct avs_path_module *source, *sink;
>> +
>> +			source = binding->source;
>> +			sink = binding->sink;
>> +
>> +			ret = avs_ipc_unbind(adev, source->module_id,
>> +					     source->instance_id, sink->module_id,
>> +					     sink->instance_id, binding->sink_pin,
>> +					     binding->source_pin);
>> +			if (ret) {
>> +				dev_err(adev->dev, "unbind path failed: %d\n", ret);
>> +				return AVS_IPC_RET(ret);
> 
> what happens then? reboot?

Yeah, unfortunately when an IPC fails, it's usually for a very "bad" 
reason and only DSP recovery can help here.

>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int avs_path_reset(struct avs_path *path)
>> +{
>> +	struct avs_path_pipeline *ppl;
>> +	struct avs_dev *adev = path->owner;
>> +	int ret;
>> +
>> +	if (path->state == AVS_PPL_STATE_RESET)
>> +		return 0;
>> +
>> +	list_for_each_entry(ppl, &path->ppl_list, node) {
>> +		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
>> +						 AVS_PPL_STATE_RESET);
>> +		if (ret) {
>> +			dev_err(adev->dev, "reset path failed: %d\n", ret);
>> +			path->state = AVS_PPL_STATE_INVALID;
>> +			return AVS_IPC_RET(ret);
>> +		}
>> +	}
>> +
>> +	path->state = AVS_PPL_STATE_RESET;
>> +	return 0;
>> +}
>> +
>> +int avs_path_pause(struct avs_path *path)
>> +{
>> +	struct avs_path_pipeline *ppl;
>> +	struct avs_dev *adev = path->owner;
>> +	int ret;
>> +
>> +	if (path->state == AVS_PPL_STATE_PAUSED)
>> +		return 0;
>> +
>> +	list_for_each_entry_reverse(ppl, &path->ppl_list, node) {
> 
> does the order actually matter?

Yes, it does. We do here what's recommended.

>> +		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
>> +						 AVS_PPL_STATE_PAUSED);
>> +		if (ret) {
>> +			dev_err(adev->dev, "pause path failed: %d\n", ret);
>> +			path->state = AVS_PPL_STATE_INVALID;
>> +			return AVS_IPC_RET(ret);
>> +		}
>> +	}
>> +
>> +	path->state = AVS_PPL_STATE_PAUSED;
>> +	return 0;
>> +}
> 
> it looks like you could use a helper since the flows are identical.


I did try doing that in the past but the readability got hurt : (
avs_path_run() has an additional check when compared to the other two. 
avs_path_pause() and avs_path_reset() to the things in the opposite 
order. So, I still believe it's not good to provide a helper for these. 
If you are seeing something I'm not, please feel free to correct me.

>> +
>> +int avs_path_run(struct avs_path *path, int trigger)
>> +{
>> +	struct avs_path_pipeline *ppl;
>> +	struct avs_dev *adev = path->owner;
>> +	int ret;
>> +
>> +	if (path->state == AVS_PPL_STATE_RUNNING && trigger == AVS_TPLG_TRIGGER_AUTO)
>> +		return 0;
>> +
>> +	list_for_each_entry(ppl, &path->ppl_list, node) {
>> +		if (ppl->template->cfg->trigger != trigger)
>> +			continue;
>> +
>> +		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
>> +						 AVS_PPL_STATE_RUNNING);
>> +		if (ret) {
>> +			dev_err(adev->dev, "run path failed: %d\n", ret);
>> +			path->state = AVS_PPL_STATE_INVALID;
>> +			return AVS_IPC_RET(ret);
>> +		}
>> +	}
>> +
>> +	path->state = AVS_PPL_STATE_RUNNING;
>> +	return 0;
>> +}
>> diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
>> index 3843e5a062a1..04a06473f04b 100644
>> --- a/sound/soc/intel/avs/path.h
>> +++ b/sound/soc/intel/avs/path.h
>> @@ -62,5 +62,10 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
>>   				 struct avs_tplg_path_template *template,
>>   				 struct snd_pcm_hw_params *fe_params,
>>   				 struct snd_pcm_hw_params *be_params);
>> +int avs_path_bind(struct avs_path *path);
>> +int avs_path_unbind(struct avs_path *path);
>> +int avs_path_reset(struct avs_path *path);
>> +int avs_path_pause(struct avs_path *path);
>> +int avs_path_run(struct avs_path *path, int trigger);
>>   
>>   #endif
