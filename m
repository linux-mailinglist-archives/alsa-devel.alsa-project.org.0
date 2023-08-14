Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742377BC56
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 17:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2DC741;
	Mon, 14 Aug 2023 17:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2DC741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692025535;
	bh=IoSsyC8S/zImdp/NoLl7qekeeu3BiYydNg+Koak8QSo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cVCvcCDNHMT5l8XENsN/foJTTFRh3R+tE4dk4p8tojHhDzinNM+1eyMfz3NYzHwN7
	 g+l5WnIW0BQ3VK8wP84FQu5tsokiItWKOc1uDwpSI52kHx0lhkeoSsHUFPIxF0Eobu
	 liJi3HKxdfyXs8Ca/EjV7DbMQCJDa9k9hxwgqBAI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D71C7F80553; Mon, 14 Aug 2023 17:04:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 390C1F8025F;
	Mon, 14 Aug 2023 17:04:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8690F8025F; Mon, 14 Aug 2023 17:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C256FF800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 17:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C256FF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZuJCqflx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692025472; x=1723561472;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IoSsyC8S/zImdp/NoLl7qekeeu3BiYydNg+Koak8QSo=;
  b=ZuJCqflxh2WHP86/WYQ97rZsMRhZONwT0yTJYTI7I7WvZuuyIl7QM4cB
   uWGxEXJeSWEpBZXo6rojUCUfdh0ZMf108Q1i8sAVj4f1PsCDL3VPdRJFo
   aWC7OcXXjdAenQXbYMupogkkCzWPgbD6EcbKh1YazqYtI8Y+LGlnK3viX
   bMDmxMP0HKBfzhS+ntyeiIuCqu8YhHQtzIk+7aISm++tgUCY/P9aNEBms
   fU45FsTT3wli55Eh5czTuadmOPsoPReQeG6t8seCFrrWdyhK2CqFhtLNd
   3cgyntmKR+x0IR2YST5vyHB7P5uLW7W41fTDL+FWw301pGxIOhp7hCTpk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372051915"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="372051915"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 08:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907265416"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="907265416"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 14 Aug 2023 08:04:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:04:27 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:04:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 08:04:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 08:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACJVW3uKE0qJ8wAGWs8UbK6dpVlJGU750ZsbqwamfbRx9ZOLSG4vdP9K3Ac7rJ2bMjq6jgV0r4b+F/Dzyk6ruVdS7Gx1zcCd6pt6VbYm4PyoLkq1mmyzJCt4tlSYj7/jtE7kuLkrEjWSb0Jza1jgosyxuRslJO6eI2vzpEORvIV0s3glZhEht2HZtLxL/isgUvqDPD8ZPLViUMlmD9+Ik5e172S3Bj+HWOh0155NVu6T60NU/JLpvmPrSDJe8oz5xOL3FNgy3a+vY8+ej8IK+w8LG4CQdhRYuR/UNnZM7hMI/1gm0i3KjL2uq1OPU4EEIYmyAsT8eft2JM0f8nH13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4fhCs6ft0DsQf/VeaQC7uM6XV/F9GJHHa09+8wNtHI=;
 b=LD8mltF623S5g4TMCaazgfbxS35e+++mrVxnjAkBNLElBswmXBtITLJbvJ37hmnPXnB+sWbg9xiWoNw2TYB1I5akj6pdcd5yRvlDjT7ogzGhRB8CAjHaWtBNLF7haXGmyia9FQO+sqnvzkxv8WA46j6usH63nJZilagfqUtdAB5eeP3yPf1nQuy7PE4RAFmfWxBNSiK6LZ7YMsxl7SZCqOG+UOo1WAfvpLjek5k2FuWxuePUFRHleDPjVDO6umhK4RKv4hdlHYx3Gp97DzH5tj7+T3GHAQ8H247XxBPJ4lqIVOyuaj5YjXz7z7JYrMjq5xEAGetJuwJjzfuaSHqO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:04:26 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:04:25 +0000
Message-ID: <30232faf-d49a-8883-0666-46359165c029@intel.com>
Date: Mon, 14 Aug 2023 17:04:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<alsa-devel@alsa-project.org>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <87fs4l1ykb.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87fs4l1ykb.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::24) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SN7PR11MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b88fbe-862f-46a4-dda5-08db9cd7c00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 2INGBQadBbdZQw/esN2stjCFlNoaOCBV+p9ylNbNLoFuth2a5sLWgubd1H3mRqrvdJk1+wjvvlbrbM5ZtMoEflMum+zn62mz1V4S7iW53flr20v+CSAzdDzwk/OpCRiqs2kS3iVDp6VczbWG/QObaBvXd4yUqayfEe0/5I6gXIwhf9Z7xdJ1dMRq9vJsUPDo6blvt6ZPdJJdJT6pxUT4PrXerwPdV1snS2DLUsOTK+AVlzrQq0uojBUDnn/W7C0DAmqukyZo3a5MjcG1q5Wa/e1uHB9kzNGPLm3upvZFtPh6aGfN+50nIg428SMo4yVjYySZJpGLQ54UX5XF7koevvD45DB7lE3bpbusqFfjHZQM7l3rbIbRH/lyEklJzIsRWZ4YeI+YqDMv19wQ/fjR1pDXkTIVgjZS9qObWh7VU6HQc8jN57e7p9ooQsI/HXHD7jljLJpFYOrHHtIJogDWJOpCTnp1wtjWE6fqFUDupvm6AdiB/+sDzsnO1mIqw0gIuOwKaymrMe8QXEd10NATQ+oNzUvIkUL0wal6yc5qIKBoR1viuciKdm+xRT/QfGtCaCJLiuyIE66y8FmvCM2F967C+lERGP3bBPubcET2arrP98Feu1ojGKahwV85ycq/64y35YPYhbV5IIRxqPcj5QtfJ5NT3yCrI1UjMYgvT4k=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(186006)(1800799006)(451199021)(36756003)(31686004)(86362001)(31696002)(38100700002)(41300700001)(478600001)(66946007)(6512007)(66476007)(66556008)(316002)(6916009)(8676002)(8936002)(5660300002)(4326008)(44832011)(82960400001)(2616005)(26005)(6506007)(6486002)(6666004)(2906002)(4744005)(53546011)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?bThtT05HQWZ3UkJ4YmhydkhZYjcyeUYzRXYyYkhrV3ZjdUw3VEtJOGVIOWJF?=
 =?utf-8?B?QUZ4cXZNOEk4VTNQU2RtbGVLRElidHdWa2p5anB5b1Z1d2JQSkhtM3JHRitq?=
 =?utf-8?B?My9aWThadmZaaGwwYW1jOUxMV0I4b21kemwvVXNiRTlqNXpGdTNmajNPLzkr?=
 =?utf-8?B?eU1MWW9YT2RxYWZFVlVxbjFLYmNXV09XQkIzdmlKSWRwWmRlemxRa2dZTnVq?=
 =?utf-8?B?b0R4Y2JLWUppZHlTcDVTTStlT0FCekhwRmM4S1BJRTF5Rk5ua1VFWUtOYTYv?=
 =?utf-8?B?c2FtZVFlSGpkb0hCT0RhN3cwcUE4ZEtMWVpsNVlPY1c0RDlCSDZDNWV2aVBO?=
 =?utf-8?B?TW1uQVlNL1JzNUV3WXMxTzhaaUdEMEdhTDV4MHRoVGtsdDVMZk04dFBzOW5o?=
 =?utf-8?B?cEJsVnl1aU5EeXB5V3VTaG83ZllNaVZsTHRjRFh1UXJ4ZlppRG1wU1JkUzR2?=
 =?utf-8?B?NW4zQUZScVpmVG55UWQxbVZ3VHZBdUtDUGx4WnUwYXN0R3loemlPK2MyVmZr?=
 =?utf-8?B?MFRBQTNlRTZoR2ZOUWwyTithYzRudWhreEhBSHhpZzRTOWcwdFhQSm5Lc3J6?=
 =?utf-8?B?WFRzc1Z6bEcydFQ5aDhxbnZNTFNBckY4bEt5S0NaeG5CT1lWM0w4akxBOEtj?=
 =?utf-8?B?M1lpRHNOZ1F3Q0pJUWVVZ3ZyMlplMFJzYU1YMGRSWm8vYlUwcHV6M1JDUHpi?=
 =?utf-8?B?TUlzRzN2YUwyR2I2QzhRUXptUWczakJIUVRSbCt2enZPQ2M2Mkc5WEx4MWVk?=
 =?utf-8?B?RXdZNGZVSGJZa20xZFN0cnZwVTJuWFp5TzJ2UU1vNkRBSUhib0h5ZjNwVzIy?=
 =?utf-8?B?SXdvci93SnprQkpDd25aVTRRdS9QSTFSa1hFeXFiMllKZTNpcHZMUlNVeDVo?=
 =?utf-8?B?YTd1b1Bha0hGNEZHTnlUdm1MY29CTlh1MUJTM2hqVmdPbGZLWG4vUWQ4Q0xG?=
 =?utf-8?B?RzBFUGVHRmV6WWV6N1VITlR3MCtHM2hnUjdUVjd1ZjJISERSMktRVjQ5RDE2?=
 =?utf-8?B?UmM2aks3bkRYYm5ZeEl4OGhXUDVxZGQ4YUpJN050akRIODRRQmg5TnppMllK?=
 =?utf-8?B?RVRqS2VWVDRMcjFaWEw1anZiT28xMVNBYjVSR2NHdWwzMXAvMFd5MGRMM1RO?=
 =?utf-8?B?ZnBvbXltOUVlUktiT3VEZHNYVXZoVkZDR0ZaNkVLU204bFJNSjQyMklqUmc0?=
 =?utf-8?B?OW52RFZLYzBsb2tpVVNKZzRrYjlEY0k5dmFrbnp1Nk5PaXROai9nQjRPTllJ?=
 =?utf-8?B?RGgrSU9BNTlkVi9CZTR3RlZpYzNZYTA5cGQyMlRNT2NVUjc0b0ZWVUtsT0NT?=
 =?utf-8?B?THZKNzFPV09BVlBPU2UzVjVYcUMzc05mRHZZdkxnaDZXcmZxVmMwK2g4bWhD?=
 =?utf-8?B?VXRXTDJrT0lXL2NlZ3NDNEJHNjNjZkpxUUtEdzM3eDhZeHFzcWdTeWljOUtN?=
 =?utf-8?B?Q1UvWnhFc3NlS20rbncrYW9TMis3Z0Y3UjZ1Zm5xSngvdmRmYjF5azlTd090?=
 =?utf-8?B?RmJFQWFORmZhTmsxM3AreDlSYUxRZDhqOWM0TStlbTkzT0JwQzBGWEorUUw0?=
 =?utf-8?B?d2ZCWlJ0TlVPdjNuM1FBVnlYenVocUg0eXFJKzBUWWs4OWE0TUs1ajFSQ0tS?=
 =?utf-8?B?MDlrbzRSaHNCYjdYU1oyZFVtaWdEaVZETW91YVpkU2hxU2ppd2FBcE9ndUE4?=
 =?utf-8?B?RFRDSmZSVG5ya1Y5akpodVByZjZCYWF6dW1CUWFXS01YME1xUmcrQWlIdFRL?=
 =?utf-8?B?N2RNeVNCSkpRRzhEWFFIT3BYa0RQSnpMRU5zN1VtK2ZqUVRaZjFXUHVVZFFU?=
 =?utf-8?B?NVdVd0t2ejlxRzJqRk1CRUVHL3lEMkZQbFovdWVWd1JmZlhPN3RtRGJaRzlx?=
 =?utf-8?B?dE5QUUNRSlBzNnE5Mk5lbUFwU3BkQlNTTnRqTnVLakQyVWxKYzQ3T0pKeWMz?=
 =?utf-8?B?bXVKK1RPSEp2RWdLUjZBRFVTdFI2RW5OdWlZeGs5WXk0NldoY3Q3YmY3U0Jy?=
 =?utf-8?B?NDlycEhRYkJmN1lRQXVCSllEelJJNTlaTldnVElqRkpJMEFYOGt0OXlTWXFU?=
 =?utf-8?B?VWYzRXRmdDhPTEZpSkQ5Q3NpNm42YVZRRVFzWXNoSHMyS05GL2Ixc3RuV1hn?=
 =?utf-8?B?c0ZuOVpCdW12MG14c3FtSW8vOXFTYklHZzJScnkzWTJBU01xV3dsOXZDdExZ?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59b88fbe-862f-46a4-dda5-08db9cd7c00d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:04:25.8651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xOASCNz3dRZVy+csnESsXIZxjJlgMFjRcs9k+Wfo8R8XFdJCioaDFcFbXheYu+PzTi6vLgGb1OZN19RY4oFjItNT42SD3RlQ7TMftJGLfQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
X-OriginatorOrg: intel.com
Message-ID-Hash: Z5YDPUXZ4HBPDC4LRX2RJX4YAWR3OZ3G
X-Message-ID-Hash: Z5YDPUXZ4HBPDC4LRX2RJX4YAWR3OZ3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5YDPUXZ4HBPDC4LRX2RJX4YAWR3OZ3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-08-14 4:35 PM, Takashi Iwai wrote:
> On Fri, 11 Aug 2023 18:48:37 +0200,
> Cezary Rojewski wrote:
>>
>> --- a/sound/core/pcm_lib.c
>> +++ b/sound/core/pcm_lib.c
>> @@ -1706,6 +1706,36 @@ int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
>>   }
>>   EXPORT_SYMBOL(snd_pcm_hw_param_last);
>>   
>> +/**
>> + * params_bps - Get the number of bits per the sample.
>> + * @p: hardware parameters
>> + *
>> + * Return: The number of bits per sample based on the format,
>> + * subformat and msbits the specified hw params has.
>> + */
>> +int params_bps(const struct snd_pcm_hw_params *p)
> 
> It's a too generic name.  Please put the suffix like snd_xxx_.
> 
> There are a few params_xxx() in the current tree, but those are rather
> macros, and left so just for laziness to convert every piece.  You
> don't need to follow that pattern.

Up for that! Followed the existing pattern, no magic there. Guess it is 
going to end up as: snd_pcm_hw_params_bps().
