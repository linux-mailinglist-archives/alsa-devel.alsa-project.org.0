Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DC26A9E14
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 19:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA813A4E;
	Fri,  3 Mar 2023 18:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA813A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677866423;
	bh=QDdoVWXuJej5MjR2DUqWBfQ4Nyq2OEnmevmZQnQ9bH4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NZZdLsqcZdhaPy9IAPodLgJ0/W1oJxtAHcRUpYcEyjaDkvxfk0S1sHIZUUKz458iI
	 ZBg2OkVID+ichiHtX1ZuRSZA9XFiHfc6RtbgJpQfn/Ms3TJQxU8KefDm53/vhcND9w
	 ppFf5p8i/uuF+IlRyv77HeoYW5MPwA7w5qBcDowc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36385F8025A;
	Fri,  3 Mar 2023 18:59:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79B1CF80266; Fri,  3 Mar 2023 18:59:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F957F800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 18:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F957F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EqAQSulq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677866361; x=1709402361;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QDdoVWXuJej5MjR2DUqWBfQ4Nyq2OEnmevmZQnQ9bH4=;
  b=EqAQSulqemaUH3AGY8tEd3eZtNewDmAoLsfCbiEzeXeYghoXtwGiGwCC
   xr2wXTuIPsSpQm4Z5ZsE3/eP8hlBnYzi2o4gdMCO3sgaY21qi/R75aqGv
   NXskgkhroyHEqp44PynSXs1K6zvLSf3B1utJ7EA6DanlD4DGxLvP18dXl
   4Lq5ZLQL+FtNtttLQWlxiKQvdShT2ZCUteOFvF+haPVWpLOFE0k+IRvFU
   uk1oXjVtJNjoby9iyrg3KAt5kMuqJqlTGYX3jgwJlcfj6toz5ZciV7+TS
   qw/Xq1ESkDZwSjluKTuqcKt53kziHEzpxU/6pqjJzdMNW80xJYydgoVhb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="314764610"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400";
   d="scan'208";a="314764610"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 09:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739584257"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400";
   d="scan'208";a="739584257"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 03 Mar 2023 09:59:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 09:59:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 09:59:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 09:59:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGTNqNUHRKVd8hSpnOvx9A1m0f6cGbO58G7s66+6DJsJ6c5wdh2nkvPx26wRJfDGii/MZzYZ+bapvW6IL1CR5PoPKdYAdcH2FbCfrfwP2YSX5l2q4yRpD3/dQ9GDBmXuDb1fVnGj/WE8BorftYOo99rSGISC6gMDAClCw4XE0143wNIobmmbWO42C1aaHWmx7Cfj5R05X2T9UALMj3xOZsmDYGXYkwAjQ992uBggNsg3BEWjuai/Y8Tl/chKWptqCjLiON5PQ2wO7ck2coYOu0zn7Y7o7LldAkT593q/H1FvDqGSEqaH/mdGYiB/6iu6DAMGf9CD7uGEhDX6YY1MeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NexviMBbbKf4sX9awqPwse2f7uH2177zEx3aTrtd2xg=;
 b=bHHwHq4Z/0J6VTQV2TKqP/kCUbybm3QDf8zYCNjlilhrAfwzPjJuW4S93BNS7Ji7MOkSVKI6nIs8klBkeGUHkBqITgrmVTc17qwdTW8KLL5DEabtkZyp8h4hQGhbvOt53T0L/MNcNc1pyIC16wpRB52lakZIZngRdM4aF57VX2+JNIxF2jB9H95NdkTnNKbvR6AUJMfegfmXRv/IT54pFe3lctURLqHiSgkm8u/ZWy3Ae7A9DOczS2J+wEtpgW+XMvzbiwE7Pcxm3pc3O8cfdZcKx2KseeGWh1UIQcWFuS5gtf0DAHWcDN11nxvAD1y1RPBd8eDsguuVEazlD00jHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.20; Fri, 3 Mar
 2023 17:59:01 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::a54:899:975c:5b65]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::a54:899:975c:5b65%7]) with mapi id 15.20.6156.017; Fri, 3 Mar 2023
 17:59:01 +0000
Message-ID: <0f9fb463-4d89-d7dd-a856-3de22ed95e71@intel.com>
Date: Fri, 3 Mar 2023 09:58:59 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: Intel: avs: Use struct_size for struct
 avs_modcfg_ext size
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20230301204628.1073819-1-jacob.e.keller@intel.com>
 <59212e65-d565-d5a2-9043-4f25f88f006a@intel.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <59212e65-d565-d5a2-9043-4f25f88f006a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CO1PR11MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: a38efc6b-bf42-45ae-3b3d-08db1c10f819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 tTU83244jyGPyUwW3SHS74r7oSj4J+8emKvS6f3o7XdkZ5IZig14Ovs6tAMr96NMSSduhiv6QqHj10eXUHtBZkiVXF6/A3tObHmB/DofL4M3D+8OdThSLsW/1O9ClCxi4sKZDSCywthLN1BVFA02nKL2lU22HHJ3mf16moHfWZWyveOQKpHuJC7dMdmEoXGfcDwyZu7C14gwMZMxdxdz4k9Td7lyTJ0AIeWE1JEzZxbBGuLbft6SbkkMgolkkZJYdEsm1GKQ2iDuXylYhOTTMEXNLJlOymnoH8pC9QK8NmrHvkMC7A7WyJ0eJuC46nTQnljExJOqbsi5K5fPVSdo0R1QbXxZ6ZsdABXpblFxpV+7fiwTurfHfbed1Et4fPD7Ps2D7/WHCw71zsQq8SIg0SRpLe2GXHTZE6QzTSujSUmLXnfitYUd+1w/ELvsIokGwYNXi79S9CyAm1sfDEl9D1+UhrDWhqNnKHSAZ65+QnwwgoTOzIgy3liPQX21juJBkU0h8tq5cUXAEIkJrNNEh6JZvuFA8TP1gx91AAwC7YiguBxpe4fPck/mPeyAm+6vTR8wfsz3XgoPr3vsW6dV3pN1d/b1LtUvh7NuwBGAQORVsHEUia7ZkW7WKQA8nQQayJSeO/P5fkhB98Bp3cWCIuWD6oYycRKZ3HyWWJSeT1LvaVQXqsg6WC4LrybjHA8RDUUW3UOvjg4tyLm3wA93M8zD9IeKM/y5cCFQLcGz0VI=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(31686004)(36756003)(6512007)(8936002)(4326008)(2616005)(6636002)(54906003)(6862004)(41300700001)(66556008)(53546011)(66476007)(66946007)(186003)(86362001)(31696002)(6486002)(2906002)(66574015)(83380400001)(8676002)(26005)(5660300002)(6506007)(37006003)(478600001)(316002)(38100700002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?ZXJEeVdsNnZJYktzVlhwVkxESnRzdWdGQnhPbjVRM1ZhdXNmcGZWeG1nQS9R?=
 =?utf-8?B?bkkvb0hyNVpIL2NtVUFVdnU3MENTNnVHdUUxYWhtbEJRNmp1NHgxQXRaRGZy?=
 =?utf-8?B?ajBKUFMrL0NwM3F6QmFyNmJqUWxBSUdLZ1MwSzlJOWxHUitFWDR5S1JodzBw?=
 =?utf-8?B?QjQ4d0dsa1FGalgxUGZ3TEc4RzYxclNVN05NMGN1SFdnanFkTHMzSXArVkZC?=
 =?utf-8?B?NzhsbjduVDNmUDZjQWhJVTlTOUtPcTJVS1RZUEM3SStoOEYvaHMwbUpmWDF2?=
 =?utf-8?B?dERFMFBmR290WEM4cmJkbTAxMm1YM08rSzNNVCtCZEtFVEppTmJhclVYZU8r?=
 =?utf-8?B?ZndDaklhVjAzYkZ2UThIOFNQbHU5NGFhZ0JXdERVck0wSTZycTVaOWZVZ1po?=
 =?utf-8?B?VDhTT3NPUTIyYTJxMXNLMklTMXBMQllYSzhqdUlXZHN3Wmt3eXVPT2dRSzBr?=
 =?utf-8?B?ZUdsQ0dxeGNYbE0wR0xTWlRRRGlPdzBqSHJiNUQ3RXlmd1F5TjBuaUVLK2Q3?=
 =?utf-8?B?UnVSZmpYajVKN2pZWWVmWmhXbUJHbjczTTl4QlFtVlZSWjlXZW5TdHdUbWh1?=
 =?utf-8?B?UHg3U0pkVGdzK3dmRlJVOUZBUjhDVXJ2TVIydlNkQi9hTlVFQ2N6TTlyVUl5?=
 =?utf-8?B?SWx5Zm5kNlIwSyt2MzJOc0FCa0tKRUl5Z1B2OGc5VW14cy9vVnEyV1p2ajhx?=
 =?utf-8?B?Qmd4aTJXaUNuazN4T3FsZTl3VElPVWk0aXJUSGFZT09nUzRsVG94bUhKYWsy?=
 =?utf-8?B?bWo0Y3FYUzE5Z0Mrd0dSbW1SVGxnM3NEbklGNWx4U0FFUVhqR01CSytFV3dG?=
 =?utf-8?B?ckt5QjdvR0FoUnJueHJXeHB1dWFzUWdWU1phMU5zOG1zRUJ6dDFVb1IvZGF6?=
 =?utf-8?B?d1owYWpZbzlpdmd5NzVmcTRBMnlwY2J4YU9IVG5MbTBYTDVIUDJUUWU3RStL?=
 =?utf-8?B?MnFobHpmenI0U29XQ1VvQ3kxZjVQN3hKV0MyVnZEN0JMVTZWMndGU3FWblM0?=
 =?utf-8?B?ZlRhT0kzdHczSVBCdXV6SXc4ajZsTE9aSDAvRjVsL1YzWHhFNlFvbEZjRGVF?=
 =?utf-8?B?UmtMTmhoTFJKNkZNQ245MFVPbDRrVzcveU1yajgzWjhvbGJHRE5NdzdDdlBl?=
 =?utf-8?B?TGJocnp6UHJpSjhnNWpWNjZvdVJIRG52ZHFoeC9mcTZaR2JUVE9Vd0FuZG9r?=
 =?utf-8?B?R1JxNEVnSUd3N2Uwa1kremc0eUVXbVBLV05JQUN5NXkzM1Q4cWlKV05tcmJx?=
 =?utf-8?B?Z2hkOGxsQUlFNC9HdHlzUG9BcXhvcXNsVWU4TmRVZEZDQVlCSjg3UGt0N0Q3?=
 =?utf-8?B?RlcwWEsrUWpzaklWYU9oSHhMK3h4WmNEK0RCWm1jYzJVWnFBSGg3UzJKMHRw?=
 =?utf-8?B?eHpkMTlyeGVqTC92VlhWWWwrV2VONE8vVjJ5Q2RSaEJHN2M1UCtGdE9aZVRD?=
 =?utf-8?B?UXVkT2hoN1M2aDJPczFncVlBVU5jUE11L1EwUytsODlLaDJGdldvaUEzRHA0?=
 =?utf-8?B?cUNjVTVEam14NHFkRXZkS3paVFpYOCtZdys2c0kvd3lHSjhya0VZaHBxV1FL?=
 =?utf-8?B?S0IzMFNROC8yQnVJYUpiS1JGQmdQczhGMnFkdHFuMDQ3M3Z2UjlrYms0S1pu?=
 =?utf-8?B?VDhFa283cm9PaDc0MnhtUFJIZWNLQ3hCOVZzV0N6TjdiS0RXUThMeTAydlIy?=
 =?utf-8?B?dHFwQnQ1RFVZWWRkb1A1SzFsUnhDbFFpRG5lbE5ZVnNSamNmdUVNV04xeXMr?=
 =?utf-8?B?dURId2ptSVVCMkoxOW9XZXdnMWlDc2ZVM0ZNRzQyM2k0bzdnZEVkRk9aMUhl?=
 =?utf-8?B?UUczSm5QZkIvZnptUTU2Q1Byenk3UVpmL1EwRUNxT3JEZldKL0ZLbnZ1RXRZ?=
 =?utf-8?B?RjhTWTJ2K3ZPcitzTmVDc2VQSHp0V3M4WG9ySkwyaTNUSFhCcnlqeHk2WE96?=
 =?utf-8?B?bnkwSFJja0szRHpsbXlhbEFGOWdUc0oxSFRhQSt3N2dXVSt0bCtrajBKcXFJ?=
 =?utf-8?B?Y3dLWS9mVGhKT3pDbWU4NDI4SU85ZHFubHFUQnlGV3o4T1FJb3NNS3BjZm1I?=
 =?utf-8?B?RzhBNGtKZnExUU53a1c5UTZMVWtxaWV0Y0Q0SE5xS1k5bS9lTTBRVk1DUnN1?=
 =?utf-8?B?RjhjUEZXRmZ2MTVLa1lNVnJidTZDbWhpUzdXY0V0N29LSDhYejExR0RSRTIz?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a38efc6b-bf42-45ae-3b3d-08db1c10f819
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 17:59:01.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 22KUzdKm5j9woxP3Xi8uZXGpUMRqHbB1s1Mi+adihuX0gC8hAY8zYs+Pp/RceybD8v24PLbIm1SNo7weRySQeRdfi5wN4ONYu2uk72S+gKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
X-OriginatorOrg: intel.com
Message-ID-Hash: VIPYZP24ZMZT4ERJNMTFXTQ3XMNLKFAA
X-Message-ID-Hash: VIPYZP24ZMZT4ERJNMTFXTQ3XMNLKFAA
X-MailFrom: jacob.e.keller@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIPYZP24ZMZT4ERJNMTFXTQ3XMNLKFAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/3/2023 1:27 AM, Cezary Rojewski wrote:
> On 2023-03-01 9:46 PM, Jacob Keller wrote:
>> The struct avs_modcfg_ext structure has a flexible array member for the
>> pin_fmts array, and the size should be calculated using struct_size to
>> prevent the potential for overflow with the allocation.
>>
>> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Reviewed-by: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: alsa-devel@alsa-project.org
> 
> 
> I've explicitly asked for the Signed-off-by to be the last line in the 
> tag area. Also, while I'm the author of the driver, nothing is being 
> merged by me - Mark is the maintainer for the ASoC subsystem, so you 
> should send messages to him and keep appropriate people/list in Cc 
> (email's Cc list, no need for every entry to be represented by an 
> equivalent 'Cc:' tag within a commit message simultaneously).
> 

Will fix in v2. Sorry about this, I wasn't aware what the convention
was. I am used to thinking about the tags in order of when the event
occurred, "I signed off that this is my work and can submit it first,
then it was reviewed". The Cc tags were there because it helps me keep
track of who to send the patch to but I can do that separately and drop
them from the commit message.

Thanks,
Jake

> TLDR:
> 
> Drop both CC tags, not needed. Have both Reviewed-by _before_ Signed-off-by.
> Then update the email's --cc/--to so that it reflects the actual 
> structure of the subsystem.
> 
>> ---
>>   sound/soc/intel/avs/path.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
>> index 05302ab705ae..adbe23a47847 100644
>> --- a/sound/soc/intel/avs/path.c
>> +++ b/sound/soc/intel/avs/path.c
>> @@ -478,7 +478,7 @@ static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
>>   	int ret, i;
>>   
>>   	num_pins = tcfg->generic.num_input_pins + tcfg->generic.num_output_pins;
>> -	cfg_size = sizeof(*cfg) + sizeof(*cfg->pin_fmts) * num_pins;
>> +	cfg_size = struct_size(cfg, pin_fmts, num_pins);
>>   
>>   	cfg = kzalloc(cfg_size, GFP_KERNEL);
>>   	if (!cfg)
>>
>> base-commit: ee3f96b164688dae21e2466a57f2e806b64e8a37
