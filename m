Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 853407A92E4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 11:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A99829F6;
	Thu, 21 Sep 2023 10:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A99829F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695286831;
	bh=LYBDJbwWe9Lhg/pC5A15IY2v4WZlvtOd8u/sUGGdNYc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aghOhgPNzpi6AaOTWdGvKJBXlokMB4jbubHCdfjn85uLVUSimo5qjkA00Gz20kad5
	 0fQc7fpCC2+95ndwE1l60Tq2eJPVd+TKBGoFJNFC75GojcmF+s4hvEbtKIeOaNKLfW
	 rG0hvNJrNzX8fFAJTy0KBXR7ZhjbCy7NORguAEFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B04E6F801F5; Thu, 21 Sep 2023 10:59:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C003F801F5;
	Thu, 21 Sep 2023 10:59:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D734EF8025A; Thu, 21 Sep 2023 10:59:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 057E8F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 10:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 057E8F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FlZS08sf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695286770; x=1726822770;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LYBDJbwWe9Lhg/pC5A15IY2v4WZlvtOd8u/sUGGdNYc=;
  b=FlZS08sfo1CvG3wWtX/pb9UZcHsFeWua4Fn3KoOy7gDz9ARtUQzNOpz7
   xDh2CoFqIvQ8tcg+yPL6NpATkj4Ff8kUzpYSKoIIYflNuXtvONnopTD7q
   bjigUidYTnF89h6/IBIEs87ZBRnmdXoLWjIqWox0sAI53bjR9cMoJ5q14
   Igh+dvPs26AVg83BjhuTpZkZbuVTlWtGrszbNK4cOKqam++zTHLmfiM/W
   HBcgAnNXb7pL/mDI5abfkjmCunLrHt4yJum3p8BufEa0nO1VaPUW/qqUZ
   8/7NvOuYNquk8ZTJ8DB2A4YeaCwjNQ+h+FZx2UezQHSPQKtHzCaJOqtMt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444570919"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200";
   d="scan'208";a="444570919"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 01:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="817291383"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200";
   d="scan'208";a="817291383"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 01:59:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 01:59:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 01:59:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 01:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OviBE2ZhCyiupMOZ36b5QK0ehDNQUBu93FdTTKl7NN3wfqZgkUGbtxjcnODFbzILHSEacwvDasGKoP0217TVn4zOryTBxICFoHiAgk4K1VN4Jqx6lzZNzEv/rFi4GIlCnA89eQjjMejC+nyY+1ZZhNDk2LToDYEsmV3qNUr6wolt9MAtk1Z7xY1+9DiPEfhXoCpMj5TpQdVZ6bjuP1gzvH59L+fAAJYdswaS6EXos36NoIWIAiH3+JlOWJ82eLwk6tGtyikTqJS4VdvBizePLyPnBngxinJjucg+/I5VCAycaWZ58VFiEXN/yM/sk7e7W5JmkCnpbM89gjo/sC7hyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wHGipo/iP8tmfuUcoc0uYxwwyxV3umlVrDhkWXLcHM=;
 b=D21Wt8O5Tz+ZkN/kblgkLuCbkk074AUD0vyGGsQ/zrY83TVFbx0eljunf+aRzEdNpHniShYY1pRnSpX3EtoRbF6JLzzVphSbRh1/aOrcoA10jvRINr7hTDJzmnJmSLVdIEb3KWqIxe2h5Q+o2gXvV9f2ssRpzdecf9fTZiRVHvksUwxj1Pqvw6o9CzcZFIEql0B0Zf8obVIEsh2nOLm2+VwcqnpaGzCxR4b6oqIthtKyQe5UZJ5K2I53vdHHVxFE2Awkyp5cYPmSUxxY7ygcDeKFjglYMkH7bRNFbzY2uAVv91f48ZQNKi0ipWnhIjfLt1zFI/xO0SGNpX4VyItO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL1PR11MB5542.namprd11.prod.outlook.com (2603:10b6:208:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 08:59:08 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 08:59:08 +0000
Message-ID: <7ee7a0e5-aaf4-acc0-16a2-1f73a2e6fa40@intel.com>
Date: Thu, 21 Sep 2023 10:59:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/17] ALSA: pcm: Honor subformat when configuring
 substream
To: Jaroslav Kysela <perex@perex.cz>, <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
 <20230918133940.3676091-3-cezary.rojewski@intel.com>
 <2a249c19-d045-f3c4-3b8a-898ecd278abc@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2a249c19-d045-f3c4-3b8a-898ecd278abc@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL1PR11MB5542:EE_
X-MS-Office365-Filtering-Correlation-Id: 950eb6cc-361c-4680-4f72-08dbba810359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 YwJshHWRZtnulkNyBwuc8ukdDfjUHH8FKpTUweqbcoTMXMWmxwvOH7uzEFoq1XAXv9y+FMwdSZR/iAaWkGlP5CBNc28nL9vjGcl3BBG30ANyvXN6u4FFwiT2JZBkVXR4P5tsgU6dOuXtKAhKZjy4KJsD16jKEznrcziAfqsMg4I5jlTMIe7e8NTHBEOVfCWuj1XPb1ZEpOya/tA5tjipyi6JQwsy6k88Boj6lB/Tk8Ft6h15nm4IsvUtz/7BGeZm4nQ69XVICt17mbkHU6/1ghaTo5s3gP7qtthny7UCGi03m03R3nJD9CJi+hUHzMa/DciVRR4p7PGlR87THmJ1Ln2OdLeI3WOsh/RzPtKfvYSv5wLWbSjm+R22TtKfOsbC2gNbTXFx8PFPk2ogWa9mEWEe5EW8K+ZRI3LfCdMO+K0EBGBXcqp9lnZSzY3t6dLdjA8qzMf7qQZrMiMVmmqn+JpjUfg2SKljaubJ4E3wp2tr8TSIKJ3HpwC269+lHhv3jUQUO46EWJRcAM+jxYCCOiV4urKzbhuZmfHlUwuMvRacs046bUismoLoOdPiA/MY3VIeFJLBF9qQwtY4N5lBDINuQVU0v2187uwoM4HolQBjSt6E5sjvW8Kda3VUmfZqcq70OqrlWGqGmNvVVHbbjKgmTle0dW1rI8m6vcr1YmfBLqp+pBxCM6ocfADXmuUL
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39860400002)(376002)(136003)(1800799009)(451199024)(186009)(26005)(36756003)(8676002)(4326008)(8936002)(83380400001)(2616005)(2906002)(5660300002)(44832011)(86362001)(31686004)(6512007)(6666004)(966005)(6506007)(6486002)(53546011)(31696002)(82960400001)(38100700002)(41300700001)(66476007)(478600001)(66556008)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?K2JkcmNBZ3dxVHMzb3RUbDRROHI5TUlsSm9aZzZCejNBM1UxR3FtM2dRd2Vz?=
 =?utf-8?B?Tis3WnlPeHJ0bStJNjY5U1p2TlRONzJmbTkvNGRDM1J3YjRFMk9TbTFTQm5W?=
 =?utf-8?B?bXNBM0F2VXJDVGxYeTE2MWNMb3lRTHBHVjlDdk9NMHFYZHFCOHhUdFpoay9B?=
 =?utf-8?B?d0F6bGNTTE8xUUFGeU9CTGdNSWRLcS9ORGtIajZUTVphYkNEV3lwVVJqUHE1?=
 =?utf-8?B?STlnWjJBdnpQOHR5WFViS3J0L3BVQ2NOa3Ava29welVMOGN5dXJBSGZrRVpv?=
 =?utf-8?B?NFVLVzlkWDQ5SDE4SFYwYUpqNHQzUXl4Q0lpNzZManZaR0FBaTBuSDZnQjUz?=
 =?utf-8?B?UFZSN0pzV2EwdW1MTUdDRTduMEUwM2w1eGo4NXRLQ0FLY0lWdjR6Y1B2cDA0?=
 =?utf-8?B?RndEWk0xM3U5SVJ2aVNwZWJ0MkdlSFFrNHhlYWlEcStSczM1QXo3THJYZ3Vl?=
 =?utf-8?B?YzlOVHZ3ZldjVG1rRUJXSFVzMzdtSEFOWE0wVGhnL1c1WFhXRkI2SzhubjJx?=
 =?utf-8?B?ekNKSzJ5Vkt1aXdDSXcwUHV1RmVRQSsvTTUvRXVtUVdITXNFQzg0NmJUVnpl?=
 =?utf-8?B?RklEWXBnYVVueWlnVmxjOU04Y2ZhY3RjRXhvcWhweGUzMWxLWUcrak4veWt0?=
 =?utf-8?B?dCtpTjZ3TEtwVDZsZTBaZ1JnblQ2R0NpSXdoYzJtYndOMGgvWjlQbTRjY2Yx?=
 =?utf-8?B?OGNFVXYzUXg0aG1GRjQ5NGhYaVpTNzdhT2o4RVh4ODZhdnMxMVJiY2tqaUdI?=
 =?utf-8?B?ZTFkeXZzbERJNk95cG5STUQ0RmROYU95SEFNNHYwSGw3ZFhFZ1RNdms5SjVZ?=
 =?utf-8?B?UXFTbDErdXQxQjViTzRjaFJIcTlGb0NNT0lVV0NGVGVPV3NJZktOZmppS1Bu?=
 =?utf-8?B?dWdQUDBRa1U0N21KUDRvWUhZSVhEZDJQVDhrMmZoc1VrWGp1V2Z1bXNMc1Zv?=
 =?utf-8?B?R2xQSHdVRTlDRWVQVnpzVGFQMkpOdWE1TkVMbnJoREZRazNJMWhSK0pLeE1h?=
 =?utf-8?B?N0x1YTZ3NFJpT1ZkMmw4amg3OC92TWduL1ZPaEkzODJXTUN3WU9zOXNUc2ZR?=
 =?utf-8?B?QzVMSDdZME95eEl6b1NjNkV3QnJ0SFRLRWhBVzlTMjhtVFVWVElGbGZuY1li?=
 =?utf-8?B?OTdqYlRXT0Y1ZXEwc3pzZDgrODR3Ukl4ZlI1NzVhTEcrVmhpVmQ0Yk8yRzZQ?=
 =?utf-8?B?Z2E5ejV0dExoREFHdGRqS1c3bHlXYmhWUzNIVXlSQ2VCS2pOelFycW5hcHJv?=
 =?utf-8?B?RWdIeGo2ODE4S1dxcWxtNGUya2RuMDRJdHpITVR0Q25EVy85KytpL25peld5?=
 =?utf-8?B?bm9TSFN3ejJkb0RicENKdzR6ZC9oUGFRRUgxTjBXNS9WOTZwOE45eGp5UWxu?=
 =?utf-8?B?THM2aVhkUUwwbUNMK0ZzU0ExcDBjanhoTkRCSmdDd3B1aGo1aTVPUGV1TDJ2?=
 =?utf-8?B?Uk5nUXNPSEJOUm1LVTJrTTROL2dmWEl0R1hmQW9wZjREVHk1RzRtdThSdlZW?=
 =?utf-8?B?VkoremRQdU9EeFBCbXMzbC96YklHTnZoMWhmVXoxenA2Nzc4RmpEeCt1c0pq?=
 =?utf-8?B?dkg3NmlkeDhtWDRSUXgzNi9TKzhOOHJBeWZRZU5DT0djN2gxcjdUNjJvUzlr?=
 =?utf-8?B?bk1kN2VvbExndnRseitpOGM2eWtSczV6U3AwQ0RDb1JhK2g2c1RPVkFOOE9o?=
 =?utf-8?B?YWhWMllvNmZWVkxjYk41a0JNTGxQMGIyT2dZVUxWVjNXQmRSRDM1TVNPc2Fw?=
 =?utf-8?B?bjFsdHpFSUxURlM4TzAyNFRqdHloYSs4b05kUnpla3gwdGRIQi9kdWc3dStD?=
 =?utf-8?B?K21DNWxNY253YUhjSkpIL2M1LzdOKzhrMDhyQy9iM0I4c3BTMHJuMjkwWWZE?=
 =?utf-8?B?eFAxTWR5a2dmbjd3L2N2cVhYQWxkbnc5NmpCRml2MmV0TFBnWTJyM2FVcmVI?=
 =?utf-8?B?V1g1QXA2QXFwM0dLSkhRVjl0Z2tlNlZhVFFMdUtDTUxKeEdrdzJhUG9EZ1A4?=
 =?utf-8?B?YU04UDgwajMyckxxOFp6cXZFZ1JEa21DTXpsODFCekkwdVBiVlU4bkRObXdh?=
 =?utf-8?B?cXUvTWh3d0pESjdGOVN0anVpSmgyNnE1aVVCZUFmbjROR2ZmRDVNNWo4a3Vw?=
 =?utf-8?B?SzNseERraEsxd1BuN2lRNFVpeFdHcUxwMHFwR0w2YTduQXAwUFdnSE1Pbi9M?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 950eb6cc-361c-4680-4f72-08dbba810359
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 08:59:07.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gedtohxBB9G3JU1Ezfic3rgBrin7PjxHq0RCe3MszFGuKcxXzVto7xx593lGFBJR+NxGmY+iPzvpSnIwufujcxwoqBJiQIlo25rSLVJWkBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5542
X-OriginatorOrg: intel.com
Message-ID-Hash: OMTUOA5YOF5EFS6OOGQCY76R5L3SJZK2
X-Message-ID-Hash: OMTUOA5YOF5EFS6OOGQCY76R5L3SJZK2
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMTUOA5YOF5EFS6OOGQCY76R5L3SJZK2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-21 8:41 AM, Jaroslav Kysela wrote:
> On 18. 09. 23 15:39, Cezary Rojewski wrote:
>> Substream value is currently hardcoded to SNDRV_PCM_SUBFORMAT_STD.
>> Update the constraint procedure so that subformat selection is not
>> ignored. Case STD is always supported as most PCMs do not care about
>> subformat.
>>
>> Suggested-by: Jaroslav Kysela <perex@perex.cz>
> 
> Better Co-developed mark. Also I would move whole code to the first 
> patch. It does not make sense to split the mandatory code.
> 
> Another option is to increase the protocol version to the separate patch 
> where all necessary code changes are applied (for MSBITS_MAX). But it 
> may break backports, so the change should be aligned with the SUBFMT 
> defines.

While most of my feedback is below, if we decide that "subformat as 
first class citizen" approach is good-to-go, this patch gets 
re-authorized in v3 as the input on the constraint part from your end is 
major.

>> +    struct snd_mask *sfmask;
> 
> m_rw -> sfmask renaming. I prefer universal name to allow easy reuse in 
> future.

Ack.

>> +        for (sf = hw->subformats; sf->mask && !found; sf++) {
> 
> My proposal [1] defined SNDRV_PCM_FORMAT_CONSTRAINT_END value not 
> relying to zero format (which is U8) and zero subformat to skip the 
> MSBIT_MAX setting bellow. After some thought, if the driver sets 
> SNDRV_PCM_SUBFORMAT_MSBITS_STD, the result will be similar, thus the 
> mask can be zero and the code may be reduced. So no objection for this 
> change.
> 
>> +        if (!found && snd_pcm_format_linear(f))
>> +            snd_mask_set(&m, (__force 
>> unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
>> +    }
>> +exit:
>> +    return snd_mask_refine(sfmask, &m);
>> +}
>> +
>> +static int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime 
>> *runtime,
>> +                       unsigned int cond,
>> +                       struct snd_pcm_hardware *hw)
>> +{
> 
> Because your change does not assume that this constraint is called from 
> the drivers, the comments and EXPORT_SYMBOL() lines were removed from 
> the original proposal [1]. I believe that the standalone constraint is 
> better at this time - reduce code, the use of the subformat extension is 
> not mandatory.

Thank you for thorough feedback, Jaroslav. This is much appreciated. 
Before I comment on the rest of the comments, let me provide a summary:
I believe that most of the subject comes down to: subformat as 
mainstream API -or- subformat as niche API.

If the general opinion of the developers is: let's go for the latter 
until we have more users, I have no problem with merging the patches 1 & 
2 and addressing most of the review in 1:1 fashion as indeed many parts 
of the proposed API lose their purpose.

My view is different as I'd like subformat to become mainstream. To be 
honest, the object that allowed it to happen has been suggested by you 
Jaroslav - the struct made of { format; mask; }. It allows to describe 
what subformat _is_ in explicit fashion and by being exposed in 
snd_pcm_hardware becomes standard part of the API. As previously 
suggested, I believe it could replace ->msbits in future too.


Question to the fellow developers: What's your take on the subject?


Kind regards,
Czarek

> [1] 
> https://lore.kernel.org/alsa-devel/20230912162526.7138-1-perex@perex.cz/
>      
> https://lore.kernel.org/alsa-devel/20230913103716.67315-1-perex@perex.cz/
> 
