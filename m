Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12B77BC54
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 17:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C67E91;
	Mon, 14 Aug 2023 17:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C67E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692025484;
	bh=3hzpJUUpvvbiA1bpDA6RYZFmDt0i0+dk5/e6ZBW2dvQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cjqh4jqALCopjZko9YS42/yHu5IjS4EWkpxM7EznSEFA2D+RLzdXRtin49ke254li
	 uAyhcUjP7+eM6a86o9/ewpWsLaU4DcgnO43WXhuRh3RkKEIJ/y1rsw5ruUe5junWRX
	 BfeiFTEEB/JUtlGKIay/OwkeH0dBeICRgRZWxHIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25ACFF80552; Mon, 14 Aug 2023 17:03:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9FC2F80254;
	Mon, 14 Aug 2023 17:03:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43841F8025F; Mon, 14 Aug 2023 17:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC5DDF800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 17:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC5DDF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QzdBmC7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692025422; x=1723561422;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3hzpJUUpvvbiA1bpDA6RYZFmDt0i0+dk5/e6ZBW2dvQ=;
  b=QzdBmC7fsfnXk5n4sE9Y+087McwO2F1m57Vsmox+Dk7ZvhCsEnUawcv4
   q5DCSHWpzKDLixH5dba6Et/ksZvPC9LbGM/QegODaj8q+ZLVHwc1v6TAh
   1Xmhvoblh2t0VTgDS6gsP7y17+epPUniQ7ACxXOSuuLusBeBoXDACbWLx
   sONGiMU2Etk9WerkrmIGMQnitg3ndYaU8SkK3b8bWIX07OOBQ5HgzEapT
   QQW2ibkv0p+oox3oznnIZUsRCgJctAFU3aJJyqJ5VDJPlQiBUgiD/YJUG
   jojK3+Nd6IPgFnN+TWXDUn+TEVVS9Y4Y1NZRV0zYc/7X40kWADqAAd2BT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="362207580"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="362207580"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 08:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803493422"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="803493422"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 08:02:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:02:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:02:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 08:02:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 08:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQQRXlm01cWxgOFXNuY8dsUuCzuiJRKAoqJbcLqKFKxxLXCV6iQ1hImVkjdHXyVarYtLf6V9nNcxMFcipRQVjmCgfRtTYd3zW/uSIsR76u+QCzQfCtZ2dBLGsc9N8Cq4976ojNbLlzYB5VGZ5Js7qGyZ6OnKj+XB/4vUhBuNFJ2+StOGK3vQMqM2sUPDNGlcbv3YDIVo2RzKTH6Abzn5MNE1jmTN7z3/gZYp5ajarzIeYcSz/IQYpM44fu76aKZLQ6NPXI+5s/CALt4UsvJwOoOmghrZ0HZRbsbU9FrElM3G2ZmxZpXTD6VA5MisQASw0ZLCND2824M/5FmWpwF1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjG1SZIkwseWguxWT4GNg3Aw6AM3unPHnTXbU0usQ5A=;
 b=d1cElr4yN9ZeCrL8Uu6YVnfznDfGqEcOROchYOYYPzdN0Yq5HRkJFG6jkEhGg1f5xb268WT7KmmvkBRskXjpw4I+HiPFOLJRhLRzi8aN2FYq3f7zgFKiXxXBDBrHoBrRmGC8x9jpWrss+7MKGkfbaxCXYywmsuAjcJrAYfR2JqvoIv8Gwv9zWlFZEjRnHVVCbdchSZNGsjhaBxzc+BFHKaObl6poz0/rZFuK8hHPT47Ox6yoquQc1QZBXGj1azwH8X/RuZuBdFWNQ3xuxwyCabFaL+AGRO6Ww78kLUQZu0eUXjtQdDHDKNyGurKrtA33RlkH3w/ZXjdLf9nUvm4WKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.20; Mon, 14 Aug 2023 15:02:15 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:02:15 +0000
Message-ID: <5b31b859-5130-fcce-4104-4cc8cc0e41e4@intel.com>
Date: Mon, 14 Aug 2023 17:02:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 13/17] ASoC: SOF: Intel: Switch to new stream-format
 interface
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>, <broonie@kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-14-cezary.rojewski@intel.com>
 <0474e41a-0e69-d739-1e4a-cdc555e6fbd0@linux.intel.com>
 <fef42075-44f8-c897-c05a-180dd30f5b37@intel.com>
 <389f2953-1463-34f1-b720-92af800aad5d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <389f2953-1463-34f1-b720-92af800aad5d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 33fdf81a-b457-46f3-234c-08db9cd77219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 DhAzNYUK/d7zX1qk+P+alBSLipZK5VyBG52JiHlgNfncelqro/KrqQjy0/2pFAQwJbCsCVDrDStok4mX7bvc0g790rhMtyjd2NEG6eJ2i9ssB2GvopXRUqM34SZlQVs5fKUvb4Ahok2gG6q4LlgVUM397z6zyj+YxDScRgEZ2j2dahIdWBEX4GCMLGmanPWhFprNOAH1hAacegj2GNlffy6E8u1SQKWyzaSXrLo3ns6nc6qmKH2O9tyJ4Er2YMkHliuuKN6nu2A/8W+ydab3cIPcPRjF+YyuMTXW/et0G2dBaFzja0lY8+nNp5ksSfeYmFUNeqwlPI+2fKAQOMV1j+z24JeuXBD6wSQI8agz+FW5Sn5JyfZo6xwiURi1HgtaxG1Joz/VGCiPmCN0/Z1SX+fKxKqLRVWYzPCU6BdGjT4BhYgZiwU6ALJtNcUlnAmc90TAYo3WfVuM/JO8IoBdLUfyOfhgGqCqqSOVK2Vq61siiQ5BPSVkuCvQUSwErwYLo3DXRd+ioWfKqZcHOHSbcUVKPlqdlWjqPJONcDsAG+lCnISNVVCmohd300upV6CBOG5SD8GJ3Stbk/AiDqeeH0tVLOoYJ6njOUZBG+OwXi+labShEOMphs+gEM+vYSmc7BRzL49qspxjfh4XVdtlZQ==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(376002)(346002)(396003)(186006)(1800799006)(451199021)(8676002)(31686004)(6512007)(31696002)(86362001)(38100700002)(82960400001)(36756003)(83380400001)(478600001)(2616005)(6666004)(53546011)(6486002)(2906002)(8936002)(41300700001)(316002)(26005)(6916009)(6506007)(66476007)(66946007)(44832011)(5660300002)(66556008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?SzZhRm9DQ1hybWFkeEkrQkRlNXlXWEJDcTlDNnFVUXBSQnhHTU9Dc3JSc3Ni?=
 =?utf-8?B?Yjh2a25rS3BxTFc1WlhMdi9JbHBKMmlzTG5peFBaM0graXhvemttUy90VGZj?=
 =?utf-8?B?OVFmZXAwVWF4VDUvaGxUaEtQcHpPS3AzcVdwTXZOdjV3NnJUM3dmMlZLdldi?=
 =?utf-8?B?QjZLMnFjaEpRQTFyYTJRNXo5dkZtYnZibmVOdW9rV3pCcE4zazlacjlTQXhy?=
 =?utf-8?B?dHdvalRKSGN4NDk5OTArVVhXUktkRDBaQnl1VThQdW9NcjJEVGtyS3Yrb056?=
 =?utf-8?B?bXdSZC9EQkw3MmltcmhwRlRWaHF2RXVtTHpsV05YVWJrOUpiTUJrUkwwNkhN?=
 =?utf-8?B?bUhCYVRjVURpbjdHUUN0UzRIQkUzMHlMZTdyWTBNWW1YU1F2Y0o5eXhDc1VH?=
 =?utf-8?B?L0ZOR3BLMTdVZlZualNIdDFJYlVGZVVYa3pIbUQ4RzhRRmZwRkQ5ZHBIZ0Iy?=
 =?utf-8?B?VzRxaWNacHpSZDJMS2diRW16YUJqL0JBL05aTEpXVGR1S2dUS3czOWNMTmZZ?=
 =?utf-8?B?bEs1d1pYaFpCV2xhSC9CbFY3YzZueTM0S08rNzYvalNUU1FMTm1rblljUEQ1?=
 =?utf-8?B?NERhYldTbmQ5aVEwQUgrK1AreW5iNlg3MWs4TDdxN0hZblhaNmFjWE5hVENr?=
 =?utf-8?B?RTJvcEcyQXA5MHNYRGVHRU9HVlYwM2FUejZRY2JBV1Q0UW5Nb051cmFYdjRB?=
 =?utf-8?B?c2FlUmh6K0RBL0xXQ0RxWFpwODRUZzZlWXBabXpPRTMrbm1XWWRiNW5KNGZu?=
 =?utf-8?B?VVBBUjE1MExLZ1VsVTkyT1hmVVZGbGQzcm0zYlVBVDhMWVEvOTV1WFF4Zmp3?=
 =?utf-8?B?M2d0ZmF2R1NrbEI1bkJHQm85TFpGZDZqWTZlNDNQUWV4aXFRTURDenRnbE5p?=
 =?utf-8?B?N05JWHZ4ME5tOGFFbll5T2gxZFpsbE1qSC9GTyt5L3lvM25tallWVTdlNmE3?=
 =?utf-8?B?RmtFaVdySUFsTG9SbHl0Nld6UVQyQjljS2swOUlOaXEvYzNHTUZLUityYUJV?=
 =?utf-8?B?Yk9nSjQrQWlZc0puMlZRa2VqV1JMWjZKSlFubitMN1A5c2ExT1hKWmhRQ0Zy?=
 =?utf-8?B?ZzJuWFRsU25YNXMzQnNNQ01uQnJjMy9IQk0vYk1QVU1mNlltSHAxeGlFVGRC?=
 =?utf-8?B?SVNtWUZTa2FBM2Y2cHpyZjU1TkROdDZOR09kUkNsb3Q0VHBnUTU0RUdrQkhC?=
 =?utf-8?B?WEUydHlYbDRNL0pDS21EcjIwdngveVN5cVhOYW45VVFtZXN4aTc2UU05OWRo?=
 =?utf-8?B?MW5ZMDF1dlZvNVlBdDRxRDhWeklUN1pGRlV6R3ZDWGRuSzc2ckVzenNyOGFp?=
 =?utf-8?B?Y01tOGVEQ1NlVFV1S09JWlovdHFMT2tOeFBlVkI5b3JvdFdtaWgwdFpwVVpF?=
 =?utf-8?B?SU5ibjViVzR5SE9lTC9VZjBnQUlhc3RaL2xHRHlpaTFEUFFZZUNTUUlBcHY0?=
 =?utf-8?B?QjYzSy9ud21mN2d4VUliR1FtODh3QjRoUktYM2R0aU9rc1JReU5ncUlzU3Fy?=
 =?utf-8?B?dERaemcwY3RzNWdpNWl2a01zN2RzaXpXTXdsdHhmL0xxdHJVUTIyc1JDR1V0?=
 =?utf-8?B?MUl0S05RNEQ5NXQ4MVNVUHMxNjl4N2hWaDBIWnJqM3JnZHVNWnNKWDBrNVlo?=
 =?utf-8?B?VEJKMWZCS0tGUHZFNWNaU1RsRUVOMG45ZmhrNy9uRVl3dzJpSm5Tb1VaNGFz?=
 =?utf-8?B?TU9MTFFuakQ1OXZYVnF0enYvU1JsaHlXeERTWElZelJudWxod0dFZ3FkUXNv?=
 =?utf-8?B?SGovME9mNnN1a2Z0cG9jZEhxQm94Nk1FLytxaGd0Yi9tT3JBOEFVY2k0WXps?=
 =?utf-8?B?Wm1SWUM4ZDhyMUdmLzFpRUE0Wm1QcWZabHErSGdqMVBIaW9WUWM1dk1MOTFE?=
 =?utf-8?B?dkJnR0hkNUpGQ2oxV3FHbDUyS3VqSUV0Q3k4bk5OV0tmZjh6TnA3Y0FuakJh?=
 =?utf-8?B?cEVpK0VlSDloZnJKNC9YYm9xa2hWV2ZHV3ZIWXRBang0VDh0NU9NQkJ2b1R2?=
 =?utf-8?B?SHJsWWZJQkJYbUNjV2VRTmNUTUE4T2h1VXNJQVJ3QXFoSlFuU3lCOWQwQUo4?=
 =?utf-8?B?SmF4elI5c3JmWDNvV3R5QjJoaHNTVXcyV1RScFMwb3NjbzNxTXZKU1FJbXpD?=
 =?utf-8?B?TWRFcC9jb2FabFlaVDJkclBwR0lVc1YrN0NOVGh5M1VIZHplOUozKzQyeFJt?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33fdf81a-b457-46f3-234c-08db9cd77219
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:02:15.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z7ImbDhsO/NyMewiUvcvQppfTPAqRHumpGUX6THVWLmiHgiUTnH5f/SDJ+DEE8BMmuT0qJSTJ0MpUhVh/Xa0F3XRhn5/VJ3DOTQBthy6qrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
X-OriginatorOrg: intel.com
Message-ID-Hash: 5HHC4YD3YCPQTORHTUUPIJ66Q5ZYBXO4
X-Message-ID-Hash: 5HHC4YD3YCPQTORHTUUPIJ66Q5ZYBXO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HHC4YD3YCPQTORHTUUPIJ66Q5ZYBXO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-08-14 4:01 PM, Pierre-Louis Bossart wrote:
> On 8/14/23 05:51, Cezary Rojewski wrote:
>> On 2023-08-11 8:21 PM, Pierre-Louis Bossart wrote:
>>> On 8/11/23 11:48, Cezary Rojewski wrote:
>>>> To provide option for selecting different bit-per-sample than just the
>>>> maximum one, use the new format calculation mechanism.
>>>
>>> Can you remind me what the issue is in selecting the maximum resolution?
>>>
>>> Isn't it a good thing to select the maximum resolution when possible so
>>> as to provide more headroom and prevent clipping? Usually we try to make
>>> sure the resolution becomes limited when we reach the analog parts. I am
>>> not sure I see a compelling reason to reduce the resolution on the host
>>> side.
>>
>> Maximum resolution is still the default, nothing changes there.
>> Moreover, new subformat options are not added to any driver apart from
>> the avs-driver.
> 
> What's so special about this driver that it needs more capabilities for
> a standard interface?

This is kind of an off-topic question.

While maintaining status quo from user perspective, we want to test the 
hardware with full-stack, just like it's the case on Windows side. 
Tested hardware yields less recommended flows.

>> The patchset provides _an option_ to change bits-per-sample. Right now
>> there's no option to do that so the hardware - here, SDxFMT and PPLCxFMT
>> - is not tested. We have enough recommended flows already. Frankly there
>> is one for SDxFMT for the APL-based platforms (or BXT-based if one
>> prefers that naming) present within snd_hda_intel and DSP drivers alike.
>>
>>> I am also not sure what this patch actually changes, given that the
>>> firmware actually converts everything to the full 32-bit resolution.
>>
>> The issue does not concern firmware, so we leave firmware out of the
>> discussion - this is purely about hardware capabilities.
> 
> I don't see how you can leave firmware aside, if the hardware
> configuration is selected to be based on 24 bits and the firmware
> generated 32 there's clearly a mismatch.
> 
> If this is saying that we are adding an option that will never be used,
> then why bother?
> 
> Lost in space on this one.

We are still on planet Earth though. Many codecs present on the market 
support more than just 24/32 format. It is a valid testcase to check if 
indeed the exposed functionality works.

In regard to firmware, please note that the AudioDSP firmware has no 
direct access to the HOST space, so it cannot alter SDxFMT and PPLCxFMT 
on its own. Hardcoding particular YYYxFMT value restricts testing 
capabilities. The firmware expects that provided valid and container bit 
depths values (copier's INIT_INSTANCE) match YYYxFMT the software had 
assigned.

>>> I must be missing something on the problem statement.
>>>
>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>> ---
>>>>    sound/soc/sof/intel/hda-dai-ops.c | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/sound/soc/sof/intel/hda-dai-ops.c
>>>> b/sound/soc/sof/intel/hda-dai-ops.c
>>>> index f3513796c189..00703999e91b 100644
>>>> --- a/sound/soc/sof/intel/hda-dai-ops.c
>>>> +++ b/sound/soc/sof/intel/hda-dai-ops.c
>>>> @@ -194,14 +194,15 @@ static unsigned int
>>>> hda_calc_stream_format(struct snd_sof_dev *sdev,
>>>>        struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>>>>        unsigned int link_bps;
>>>>        unsigned int format_val;
>>>> +    unsigned int bps;
>>>>          if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>>>>            link_bps = codec_dai->driver->playback.sig_bits;
>>>>        else
>>>>            link_bps = codec_dai->driver->capture.sig_bits;
>>>> +    bps = snd_hdac_stream_format_bps(params_format(params),
>>>> SNDRV_PCM_SUBFORMAT_STD, link_bps);
>>>
>>> I can't say I fully understand the difference between 'bps' and
>>> 'link_bps'. The naming is far from self-explanatory just by looking at
>>> the code.
>>
>> There's none. I just didn't reuse the 'link_bps' variable. I can reuse
>> it if you like.
>>
>>>> -    format_val = snd_hdac_calc_stream_format(params_rate(params),
>>>> params_channels(params),
>>>> -                         params_format(params), link_bps, 0);
>>>> +    format_val = snd_hdac_stream_format(params_channels(params),
>>>> bps, params_rate(params));
>>>>          dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d,
>>>> format=%d\n", format_val,
>>>>            params_rate(params), params_channels(params),
>>>> params_format(params));
