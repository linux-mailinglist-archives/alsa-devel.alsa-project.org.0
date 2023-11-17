Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 427747EF224
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 12:52:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D0D84D;
	Fri, 17 Nov 2023 12:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D0D84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700221958;
	bh=cHBn7J+xutRy3cFtBN+2H04dlXQE5PLdo3sE1/fW3hM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bwZVsxnlvc1thWuex9ZghwNEf3ebRW4ZUqjjTKZVDP7rJwlQ65yb3D8MdDQVrBmxE
	 xiZvELreiDVLEIB7N0RbWqIvwyEH0DLiyoq+zRLnu9NN1nMptWYpmBMIG4gpgx4Rx6
	 cqlBnfHurs16+cSqXsVZLlEeQRhNvujZHN482Djg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ACC6F80557; Fri, 17 Nov 2023 12:51:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C799DF8016E;
	Fri, 17 Nov 2023 12:51:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 329B8F801D5; Fri, 17 Nov 2023 12:51:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C72AF80166
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 12:51:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C72AF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BjuyF7Hr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700221901; x=1731757901;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cHBn7J+xutRy3cFtBN+2H04dlXQE5PLdo3sE1/fW3hM=;
  b=BjuyF7Hrqhx7/GH50V0V8hOg0gZwICAsHar5WeNGwG7OXQyp0gzZJtbp
   R+nob4304Km/lsss0W5MVmO2jEbD60zI9jv9TV8vNk6E2NT6KtIpAG72C
   ZIefsDn9/3ZCwfjOTRN7lEqdiPxXob6S2x1R4ijU0zrGdQc2EeFE5OsVN
   XWDDWh7f143/RBCn0efoOkaW/54zd6icp5s1ibpnG+TS0Ev/iwZE42Yt8
   GDt5qHZk/c3jQapLIZGRP5tEYTM1RnU8LqRBhmkG955zlURDmCKqX+0v7
   yUcRg+XouCAQ0mcuN5aBRs199WrKD7aENa+JOi8oS3fLdVFLW5dL6WlfI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390139133"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="390139133"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 03:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="889212947"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="889212947"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 03:51:37 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 03:51:36 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 03:51:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 03:51:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 03:51:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+1PVD2Q+Hsl/cPILm1Y9MKQPHnSEfWjuD5rMqtgh049SWiQpaK6O9lMMU5jDHvO0837QZLkR+EUy231hL7cEZG8i+2ZRHfGNDeDDx704K1wQ77qkBYIy9UhbvQWg4b5r+VVm4UWB196Wt96sULOWjXTBJ9fP1F/Dd4NiF9hHLijmpoKXHBc3u7JfMJnOcSnhiBDN0BkUcYdVd7ZyHFRRJ7kYAIf3VlDHc8A2Vgpb+a2C+wNst38HrfhMIaq16E2JvKqzTVC2mX9DQwmkCLYzFyF19n5Af/Lyp3e1rb38psZFAiPBORiYsFbxEQY7O5hvV3djJEQPq9frFE3qq2kCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2P9EKJAzIIy6dsiDTQOuGTt8LmtDKbu/L3JrUM7QQc=;
 b=AFMUj1Slf51bZjVBl14hVDMIxoX6E433KARi6fFlNFauVLwkiE0cEv6+47th6kO1khlukiZA2y48VDlrDspTcupkno0WjFAMKy8OUJaDXvCHg4WCiDCJNWmIuyOd42T7dNe0H4HnRkD449W7LfvSnX21g1y1YqArg/YJUD9y/hr16AcWb3rsnv7lnMC7Qlg4kLYsoYRCE3ExQsSTM56zd73clq71AjOrPSf/GRIMOsn5k39rwYO2y/9I4UFi3J2CoRtLOreACdvIVOUowGkQYufRxBQXB0CJdyXiALVE7fDh8Qo/E81L8ufew1qM4HUX57rXMLY/+YBEyswd0UzlRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 11:51:25 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::ecc0:2a4e:16c3:2019]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::ecc0:2a4e:16c3:2019%3]) with mapi id 15.20.6933.026; Fri, 17 Nov 2023
 11:51:25 +0000
Message-ID: <e714d741-9333-60f3-a797-c005e2545359@intel.com>
Date: Fri, 17 Nov 2023 12:51:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 04/16] ALSA: hda: Upgrade stream-format infrastructure
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
 <20231116112255.1584795-5-cezary.rojewski@intel.com>
 <f4d510a8-de37-494d-b7a8-61770da1db93@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <f4d510a8-de37-494d-b7a8-61770da1db93@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 2707ca2c-352a-49f4-4bb9-08dbe76386bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 KVAeu6oRShsgdw2TzwK53DvgER1GQ0q+V1fgvx7+C1xwSgaywVkKwKjEUAZfsEX87sFa8NfMdpXCZDqw9mRcePVYKHMyUXoGnMM0do/gx/4EluMKvVaO4BQqUMKsLJGOmYB98X1FMKV2Lm+FgJSgI185wW43CSOftinxQZeQdjX6w1tffB3sylhfO99m6wY7orVNTDYaR6oYi8T+3krJYTzEHICR+w0mFdb66ra7LaR7LVFmGgPrDlXJbvFPc3SXPRTqWFuscCkWP9v5GQrryi3jWDAiEljkyvBDOMdJFDMq2s8bC7kngASafwvozBDBGH196nl1hZGGba3dIyHzu2x1QpP9wHjBHxpPmV2fTtCVKgi/mFyY2uRGkwJE/Bk6PJ81gqNXvqPOsckYqRZb8PWz2k+0OYkvVbZS4Iamq1Ooh6ztW0fdIzcabDG5Q+ZZd5ptaBqrZMSuc43PdU7vnMKkT+2zphrZmGqP/sHt+B0Sw/gINAdr8hqF+fpeGNPyL9fsNPZKmoIY5Ci8HV+7SLh48aZU1ST1t02EVuafjNv1ZST1fQ5N/hrFQB0LvImdmYiz9Po5PRVpbZfkeZWP2/lWAI3QnLiaClsQk1bQ4PDiv96FFWmDKFHiJD5N8o2kQhyqAtErqVch/hHp927Lfg==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(41300700001)(44832011)(36756003)(4001150100001)(2906002)(5660300002)(86362001)(31696002)(2616005)(53546011)(26005)(6512007)(82960400001)(6666004)(6506007)(478600001)(6486002)(38100700002)(31686004)(316002)(4326008)(8676002)(8936002)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?V3h1b1Q3UmJZeERVM3RZZHllTGduakF4OXU4U3ptdG1NbnFkSlFIWVhreHhJ?=
 =?utf-8?B?dWxCS212dUkxbGIyUnYyc0FuMW0yWkxObVhodzRZaSt3dTVNaHRESnFyQmVG?=
 =?utf-8?B?V2FsTTZlU3BPdHNWYmF4djZVNnBXUlFMQVk0dlVwOUVuUEJnS1dBcCtQenBa?=
 =?utf-8?B?d3pwekZFaXZ5bzFpTnkzZk1iZ1EwZVlZc2RUNnFNYlZjVlNXM0QzTTFuaURX?=
 =?utf-8?B?cDk0OWs2dHlMRkkvd1FGRGlyVXlDMXRMd2gzdnVzQ3k1VWJSdFlpYnBhSVFW?=
 =?utf-8?B?cnplMG5TbUlpajdVTG9GRGJyL0JNQlNpTzlMcEgyNVdrYU1IQmFSYWZBa3BU?=
 =?utf-8?B?eVJFbUQrVCs3QXFzUlpESy9EaVYyOWk5b1JXUThsNkEwRzVPT2RDV3ZtTkZr?=
 =?utf-8?B?ditxNHpzaENrOXJKdzNaVDJHZG94SjBXWVJaZlFZWUVpTW91WHVKdFFjK012?=
 =?utf-8?B?dFR1ZmRMTm9lK2UwV1JYT24vcHMveWtSMmhZNjhwOXlRSWVjdDgrY3JyRXk5?=
 =?utf-8?B?Yk9vdi9CU29VQzg2RnYzMmVvc3JBRWJIQmYzR0U5MTgrOU9nQ2gvUUROVUVQ?=
 =?utf-8?B?eWYvR1NMOUs1RWZkZ1ZYMHlNSzZSK1c4N0Z6SDhuNkw4QStXaEJxSDF5bS9r?=
 =?utf-8?B?Z0tHaDZPbk5LbS92L3RpS1ZFRWNQRmV1dHJHWmIzamxMOWgxTXBhdjg3M1hp?=
 =?utf-8?B?Vy8yZ2RsaDZsQisrVG84WTd6VlZFSjRqM3BkcWlGclFlN2VLanliOE42SXNX?=
 =?utf-8?B?dU9JTFUvcjhrbHdtTEF2bDNpZ3FGZnZkZlpQRjlFc2tlRVBpcFh5Z3Q1QXFq?=
 =?utf-8?B?bytsdVZmc3Iya2lmTERtK3RrNXZ1TjlDdjF1U1ZVaTBUdlA5dEFXTWJQbVBY?=
 =?utf-8?B?cFNnUEN3dWNhZUErMWhsUkcrYTM2NVRZY1BQdHYvNmkySSt2UDlBV1FuTWlT?=
 =?utf-8?B?RzFYNnRzd2R4emR2eXVJNFVtbnZTYXhqaDkxaXhFSGo4TUdKRFhWTnlSTEFK?=
 =?utf-8?B?SnF3SkJCOVhibWhMU0lIa1pxbXZMZmpsNjNEcUtPcHlXcjB0azB2YUw3T21E?=
 =?utf-8?B?dENZQmJzRXVidk4wV1kwVDV0YW8rcGFML2tLdFg0R0dydC9ZMC8vYStrVGww?=
 =?utf-8?B?bThpakhxVnJocFNaa0t4TWhDSDZTeXRBY0xKVHZOTTFabjJDcnJUU2ZERi9r?=
 =?utf-8?B?NUtqWWNmd2wzK29UK2FWSHppTHRtbmROMkt3dkN3bW5kY0NFWHVlTmJIRkRx?=
 =?utf-8?B?L1VSMFNzVFkyQU1qVXo1RVBzeW9EMENacENtNzhkQjJTSWF3UHE0cWM4NUph?=
 =?utf-8?B?UUQ1QUMxMTZDMkM0SGlmTU9WWVEzMlBxbjlmVmVyR0tYcWRPdE4yZnAydytH?=
 =?utf-8?B?MklxM1BNVEVQS1o1U20zUFdqQ3VtOUFJNTZJNERIOU5qUnBWN240dXNoZHZv?=
 =?utf-8?B?SWRpUE1KSkJtdmJmSFVvOEM4R25FVk9heDVTZzN1aittTzZhZ3FnSGpucEoz?=
 =?utf-8?B?dVFqNDNIeTJPM2R4Zm9oM2ZaYTFnWjlTdzUzcEJCZm9FQU9VeWRqRWtoS1My?=
 =?utf-8?B?RkNJR0tMYlVybEdwWEJtczRPcFRTSjlyRWFtNktkYkJLNjUwZTFId3JsN0Z3?=
 =?utf-8?B?cktIV2JzajFsaFlhVDRRYmxVcFI3eUJNcVdVcGNsdFozak96eUNXUmwwaFZX?=
 =?utf-8?B?S3o2cWl1bEc2OGJHUEpMNjhWbHpsL3NESmp5TFQ4WnhZNnJNTkNOQ1g1aEJ5?=
 =?utf-8?B?c2RCaHUrbElOakN3RkVBalNGRHRpMDBJSGtIZ1h1eGVKaFVDS0RpQ2dqOFpX?=
 =?utf-8?B?WHNhek5pRFY3dzBGY0lndGRadTQwbS94aWNyNkRXNmxYWHYrVkZJVFRYcEZk?=
 =?utf-8?B?L2F4cG5WZy9LdUIyWEU4Wis0b0ZqNjZXMS9yYlRjNThONjZiQ01MS0dEeUxn?=
 =?utf-8?B?VGUwbURCTkY4QmkzNG1JY3ZNVTA4bG1WQXlnSTNmS1prUUFLcXdvSDlmVEkz?=
 =?utf-8?B?QUFrOVBiazNLRU5aSDQ3Wmo3VmFReXVsK25Rb1lpb3poc0VWdE1jMkhEVTY3?=
 =?utf-8?B?UzdhZXAwSGlDUlBKVThtTVR5VDgweHQ0S2VtKzBhajc3QXZMUkpINWlBS1p0?=
 =?utf-8?B?ZDl6N0VJZG5ENFFYQ0xPZDZtZGNHT2FrRTBDcGJpY3VjWll2Rzg5Q2hvb09a?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2707ca2c-352a-49f4-4bb9-08dbe76386bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 11:51:25.3901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LKywftA3ffJO5z0utW5+Swx6fj52dejF22nIFDpdm4LIvDXT4cq2IbR9DPraZEYHmJW4Vvxb0YEyzlohPeISwWNON8SubITK+7w4Y02G9WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
X-OriginatorOrg: intel.com
Message-ID-Hash: GCVLVN7A7CDBCPDEULQMD6NPVSBTIKTK
X-Message-ID-Hash: GCVLVN7A7CDBCPDEULQMD6NPVSBTIKTK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCVLVN7A7CDBCPDEULQMD6NPVSBTIKTK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023-11-16 4:10 PM, Jaroslav Kysela wrote:
> On 16. 11. 23 12:22, Cezary Rojewski wrote:
>> Introduce a set of functions that ultimately facilite SDxFMT-related
>> calculations in atomic manner:
>>
>> First, introduce snd_pcm_subformat_width() and snd_pcm_hw_params_bps()
>> helpers that separate the base functionality from the HDAudio-specific
>> one.
> 
> I think, snd_pcm_subformat_width() should be implemented only as static 
> helper for now. There are no users and only snd_pcm_hw_params_bps() 
> makes sense for callers (format & subformat must be passed together).

Ack. Inlining into its only user.

> Also note that _bps is mostly used for bits-per-second in the computer 
> world, so maybe _bpsam may be used here to pay more attention by 
> readers, but it's just my optional proposal. Maybe my head has some 
> "fixed wiring" for this :)

The current shortcut is taken from existing intel/ code which utilizes 
'bps' but I agree that it can be misleading.

What I did to solve the problem: opened both, HDAudio (bare) and 
HDAudio+ADSP specs and in both the relevant fields (the fields that 
relate to bits-per-sample) are called "BITS". Also searched google for 
the 'bits per sample' phrase and one of the first thing that came up was 
audacity doc which used the exact same phrase (bits).

All occurrences of 'bps' will be replaced by 'bits'.


Kind regards,
Czarek
