Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BFD4C4E54
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:10:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F7C1F19;
	Fri, 25 Feb 2022 20:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F7C1F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645816218;
	bh=K88BrmBzOEg3QFHnbqwE6a/veuvXJYzfErVmoRLgZoI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFrG3uxRxamb6WO3ElR6b85tHm7c0Rr0LhqFsYdpi0PGQcq3sftmsASqRCiryLIqg
	 efUzxloZds977guD2yXgbU2o/4dE3LEtNEf9ui1pkNiNvd/iumOWtoWyVe4hXJbIKH
	 5ST5a3Vy0ijxewKC6Dac1JfujcFvCSpdqSeBSbtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C5E7F800B6;
	Fri, 25 Feb 2022 20:09:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1AD5F80132; Fri, 25 Feb 2022 20:09:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3334EF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3334EF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b3f7pQ8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645816145; x=1677352145;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K88BrmBzOEg3QFHnbqwE6a/veuvXJYzfErVmoRLgZoI=;
 b=b3f7pQ8nnEymvD9HgkoNsd6fGFnBTcp1a6Hb8Iui2oip3SDnnJXZIIi3
 cLUunK++fxMrFqj3IS98ipYmt3cAY1HLLnhz6/XyWhzmr/yOuQa+0Z1SG
 wOdC0QzrE3FJesO9puh/qpSGJd6lWGD7vdQ16lKyVDOjN812Lrq6po0i5
 HrIqAHlPnbxzWYhdf0OUE20cTDVimy50bq4WBHcXn7bqGjHyW8qKCsrgJ
 2MuGkowyzqtL9/hP66On6/Bd/RldJNi3dlVMIdakQCwk7vw0a1DVKOrGR
 djiLP71kv7G1tvGJ3wlBikDql+buZ7WFEPUgOrMGn3ER+TsFFx286poD5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338998253"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="338998253"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:09:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="544146112"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 25 Feb 2022 11:08:59 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:08:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:08:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:08:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieVeMlMgQQwcOunIpbvXPLZ/pJwYmEMcor7l8PGeIotxIHsODnixsUcWYs58cp4mJ6ddIWNV9hg3d5/KCaH5tsZ6fljg/RywhkJVVtZulOF5HP7uJVuWJN/j3qvmeib9Pa7mcBc5ij8pJW+EhUzyo/4az/kOgeFOSkoDFnMLHWtnV5/UX6YBK/5IS5eSCtAVdg239qmRo8JC98Y0BVIHA26Y7CavdWMkYPnZKiZfWIa4vls0NNraIx4+bIxPocowGqxSOF0mLUTIPfey9Pr4wjAAeD2kPhAvCKBLjuQkZ8fKgU312URh5PsOlhoCzTFvkwNkAhQYXm0iJGfGUbWYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G13MkSuBNUkVXgW1L/ao2sYiC6RgZU7a9HXTz+XooZM=;
 b=gOGjNpilvFzc2PEbPEOWrzLA2Q42F8TA+2j9neFnHGAL7VyWHsn6FwT8qJxVqyWXLTqFc9Ar/F5URr3HLmOHddipBQLtKGpy99iuMCTYVV4ydTJGpOz4sCpjcCrw/fiR71MIZTfxb+Orgo8VvTIFBm07t6r3MH5B8F6MpQZNP9ILpOfsBLgl0c9wSDAzcF+YsoR6jrsT+nJRumUUp1ZSg422i2HStWY0eJGZbfrNQJg3CZVDGCFLf+QP/G27qbLXTqUyDRRjTTIKDhMPN0uNLJTIXXmuM2BXP3Ry68qDjSpupY5gEXDt18alW3v9AXlC/SU5U/flZn0kdN+xXw9bRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BY5PR11MB4040.namprd11.prod.outlook.com
 (2603:10b6:a03:186::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 19:08:57 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 19:08:57 +0000
Message-ID: <b24a4d37-6eac-0cae-b1e1-cf26a8fff5ec@intel.com>
Date: Fri, 25 Feb 2022 20:08:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 08/17] ASoC: Intel: avs: Add power management requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-9-cezary.rojewski@intel.com>
 <24125d33-bcb6-050b-88fb-6b2ef549fbad@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <24125d33-bcb6-050b-88fb-6b2ef549fbad@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0243.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::6) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13fbc306-4e79-4bf2-c3c3-08d9f89245a5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4040:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB4040A54E2E6F86E77140E226E33E9@BY5PR11MB4040.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6zTyAmNB/iPdRc7mn5JIjuf2nJWkYk0u0t+JhwQDZaDHeirJaWBGdFHKbFmMVii2+jQAVGRu0j2ll3BEMGYCoYoDZ93alUqUOVs5YZSRlBtJ9Afpcs0ioM8/N6vDSOrbH4tAbTde2TtJ8nBJJtxAXw+6LqkhaEmFobZrkmPjF7Q3JqD6rU1I47wwOKG5kyaM8nF5/7ioSnitFjXZhKj8VEyCqfggxtdEvgvlFHXTTDJmYxnqITQAAwayg4iTO+e+NquUfXrvRYIU8yom4BVFQ+UKafBZLbNqZzndCF5OEVijLPq+joDz0fsRfnnDXoWrOkVTLgTs6+lUIF4axbFitB3K8Y3YNHqMi2Q84Gs3gpr0tB/LIqHyzSeFH/C3QkgSN7MfffzgpzVr8/QIAY0C1/qQMd8NvVc9bDdigU3JzqIjHQ0AQhTMwPI5M9I6439GbFoea8ZlbhCY5urpyxsq4ZlATSirOF1yjOdc0PZaRVn5K1YZTdePS/zyGObbZBc9l/Kmi2fxta684T/CStJ6KMcGZgG1tCV4/ecYTWjd/+ZmoNkADG93ireY7T+2qVXQOilxlBPQwgh+gMwQs3T3+2k5zKuc+UW+S8S5GKWvqC5yCum+KISeTLXw1/bwGIPlpqS+Px0BOEp0S6zbdATRqrDt/Ul8rLkHjHhbYDiiQS1uFhbRdWlpCRITGUSgmaJ3pOh4/mQU8+mMIAzUU9n6r93/YdC03NpZ4e7PyAXPi2BggY++/tFNvD62QJeN3V60
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(53546011)(7416002)(66946007)(66556008)(6486002)(26005)(66476007)(6506007)(4326008)(8676002)(31696002)(2616005)(2906002)(82960400001)(8936002)(316002)(6512007)(86362001)(6666004)(5660300002)(508600001)(186003)(66574015)(31686004)(38100700002)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlBNMFJuUHRxNWEvYTVQbEp6QVpKT0dKdFpXaWllVFlscHc2c1VhMWEwTk1O?=
 =?utf-8?B?NmV1c1ArYWtmNHVlaDFNL1diUWNXWStaYlRpRmhBRUd0RjIrcmJwSEhRRFZX?=
 =?utf-8?B?ekJ0eHdwOWxSSFBOTWY5MnlGMTRrejhxUHd5TjExVHNPNmZ3OFl3MDF1bG96?=
 =?utf-8?B?YllLM3R3aFBHRW5URTJCWC9wdnRQMEYrcXd2Y0ZXSXp5dkJoS21jeWZIaUUz?=
 =?utf-8?B?bXhHYmgydHpoR0p3RHpXMU9vdXFKN1lmMXFDU1R0S2xYSDFqcjRhZEdjbFE3?=
 =?utf-8?B?TTdLazNaMDA4T1JDa0lOT1RxUnVMMVExelFQWDd5TDIxTmYvSDFlMHFIejhB?=
 =?utf-8?B?WlRZZFhZUytielB6QzNvOHpVZVRYTmtpUDNLcU5rQXJQUjBoTGU0YTh4d1pI?=
 =?utf-8?B?a3RvenNjUzQrYmxyTVlkNEJhblovMENOSjNnckdHY1RZK3c3aytXR3dmenlE?=
 =?utf-8?B?blczTXRkckxkZ2prVWFtQVB6ODVodEkzRUF1dkZhRmRldEkyVU94NVNvSzcy?=
 =?utf-8?B?MC9TajB1eGJEY1B4b2NJQU1ET0RIT21pb3JHRGRVZVZ3S0ZIdTZNTmhQcStU?=
 =?utf-8?B?cm41blJZdnRiOEtSZ0lIelhleUlMM3pORG1zbUl2S3FmQnJlMXBDc1I0M1oy?=
 =?utf-8?B?NG1VUHNxaEZQRkQyQ1kyS2QxZG5DOGU4ZGlEK3hBTEFnN1dQM08wUFE4VXlS?=
 =?utf-8?B?SnIyU0hsTVhFRU03amw5WFFGTEdqam1KN3lFN3pIYnYybEYzb1Boa2tvT0t1?=
 =?utf-8?B?aDNtUFBUS1Vzak1CT0loRjltaDcvaXJJVGswRmMrSnNMUk1TQkxaQ2t6bmJJ?=
 =?utf-8?B?THNnU1lUZGtjajUwbmk1SThsQ1JXakM4SmdCQ0syajRjY2RTajVhcFBDRE1y?=
 =?utf-8?B?ZWF6Ti9MZGowdmUxUHBacDR6UVcreWIyWmk1NVJ5cWRqMDcrcFhUSzExQUZK?=
 =?utf-8?B?NFRFZE5ZdzdaRGE5Njg2U0VtVEIxOExHczZ2NnNjSC9vRHFRVkI0L0ZJaGNz?=
 =?utf-8?B?ZXRnWk5Da3hSaGxXNERkZm43eUorK2Q2OEZpalhJTU1BRTM4dzJxejRyaUxm?=
 =?utf-8?B?RXBFZXloV0xRZ2ZaVGpOOFM0SmJER0lHUXNlbUxYR2pNaDZTYUlqMnFjSzNi?=
 =?utf-8?B?SU5admhLNjZuaUFoTTJUUjB5aE5zbHdhMm03LzhVbVRmUFJ6L3gwNmlBdVp6?=
 =?utf-8?B?bit3VVZMOTFwVTJrUEFMbjl4K0doWEJMUlJsQ0VFeHpWdEpCVHdTUTZNTlUw?=
 =?utf-8?B?U0hQczR6YXZvcW9FdlV6WXdpQk1xY3NZNTV1MVE3OUlnQTNlcXd0aWZOSDJ6?=
 =?utf-8?B?YjRtRlVoZUgvT0dsV3pqYm9WNW1DQkZrVWYxd1NyZDJFVUpHL0F4VTdZV2Nw?=
 =?utf-8?B?a1cyRzFVQUZiWUpsSjlaMU42bS9jbFJ4NDZ3U0JPVzJtUEZSeWJTL3pvQzZY?=
 =?utf-8?B?bnV1ZmY0a2E0Y2dXbUJ3dElNSkNmSnRFWW9uSndlMzdjc3IvYWdkU2twMGJs?=
 =?utf-8?B?Kzc2T3NrNDl1a09OQWcrdzhaOXNXMTFtSUVxQVVzMnlUeFBPbUxTRm5CemE3?=
 =?utf-8?B?eXk2MlI3VVhSdVRkMzdEZ2U5czVOaFp5ck9zUE9od0pzWEdaRUtWMVYvMTB0?=
 =?utf-8?B?ODd3Zm5IcTZGbWNWUFVWaW5BNmozZlhXUlkxMVJZclZjalpyQ2dMdUZnemY1?=
 =?utf-8?B?em00SUU2ZWloQXhvbWVCeVEySmk0L3haOWdqTzNlVEtOT2Z6NG5ENUQrcS9T?=
 =?utf-8?B?ZWFpb3ZTUjErNUo0WWFSNEM1VUU1ZjZlNE5QcXViOWFWS3VoYnNRRDJnL1p0?=
 =?utf-8?B?elFXRm8xbGRFTkpuOHlKUXdUU09Ba08yMWoyTk41NmpNclpEZWJvcVRyZnZ0?=
 =?utf-8?B?TVBJMXJEcTZSR2lUOWx3SUoydlV2OEFLbVJldFVlZ2xib2ROU2h5dUtxdE43?=
 =?utf-8?B?Q3RYZ1pVM3A0UTRsWEZPNGJibnJNWUVSOExtQXdNWHM2dmFTMzZOem8xTGZT?=
 =?utf-8?B?VmtHcndnYXpjSFRhL0wwQUo4U2FmS09kZWptUmQrQ0t4bUZBN0ZGam9wL0Na?=
 =?utf-8?B?NXpvVi9raG0vOXhMclF5aVZjMW5tZ3AyZUxJaFNTZHdtazdYZTBXRlRpb0F6?=
 =?utf-8?B?cmZpeFdnMnEranU1alZrV2dDd1h0V2I3MHhINVUxdWk4WS8xL250Qzd0Yk5V?=
 =?utf-8?B?Mzd0eHc2bTViMzJBcXhjUDIrM0ZLSGc1S3c1YVhPYkhZcGVaa3JLNjMvWS9T?=
 =?utf-8?Q?YOlE7JiIhMV3D6l6B8auWnRr16Av5FPoAt2FDMTBcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fbc306-4e79-4bf2-c3c3-08d9f89245a5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:08:56.9697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKLa8x87jQK+H8dtq6lH1bOf89vAEa7MQiZ3r5S7iExU7paJkJvhApeZnmPSTJEU699V4u5kW9NrgCIU29xt46zZjTbGmpgbZDObSaUZuto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4040
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

On 2022-02-25 2:37 AM, Pierre-Louis Bossart wrote:
>> Audio DSP supports low power states i.e.: transitions between D0 and D3
>> and D0-substates in form of D0i3. That process is a combination of core
> 
> D0i0 and D0i3?


Ack.

>> and IPC operations. Here, Dx and D0ix IPC handlers are added.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/avs/messages.c | 43 ++++++++++++++++++++++++++++++++++
>>   sound/soc/intel/avs/messages.h | 16 +++++++++++++
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
>> index e870d5792a77..1b589689410f 100644
>> --- a/sound/soc/intel/avs/messages.c
>> +++ b/sound/soc/intel/avs/messages.c
>> @@ -347,3 +347,46 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
>>   
>>   	return 0;
>>   }
>> +
>> +int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup)
>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_DX);
>> +	struct avs_ipc_msg request;
>> +	struct avs_dxstate_info dx;
>> +	int ret;
>> +
>> +	dx.core_mask = core_mask;
>> +	dx.dx_mask = powerup ? core_mask : 0;
>> +	request.header = msg.val;
>> +	request.data = &dx;
>> +	request.size = sizeof(dx);
>> +
>> +	/*
>> +	 * SET_D0 is sent for non-main cores only while SET_D3 is used to
>> +	 * suspend for all of them. Both cases prevent any D0I3 transitions.
> 
> The asymmetry in the comment isn't clear. Did you mean that the main
> code is in D0 when powered?


Yes. There is no putting MAIN_CORE to D0 as we must be in D0 to begin 
with, if we're thinking about sending an IPC to the base firmware.

>> +	 */
>> +	ret = avs_dsp_send_pm_msg(adev, &request, NULL, true);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "set dx", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_D0IX);
>> +	struct avs_ipc_msg request = {0};
>> +	int ret;
>> +
>> +	/* Wake & streaming for < cAVS 2.0 */
> 
> I don't how anyone outside of Intel could understand this comment.
> Consider explaining what the two terms refer to.


Sure, will improve the wording.

>> +	msg.ext.set_d0ix.wake = enable_pg;
> 
> simplify the argument? Not sure anyone could understand what wake and
> enable_pg mean.


Well, CG and PG are popular shortcuts among Intel audio team and stand 
for clock gating and power gating respectively. 'wake' is firmware 
specific. I can provide a comment, but not all question are going to be 
answered by it. Firmware specification is the place to find the answer 
for most of these.

> int avs_ipc_set_d0ix(struct avs_dev *adev, bool wake, bool streaming)
> 
>> +	msg.ext.set_d0ix.streaming = streaming;
>> +
>> +	request.header = msg.val;
>> +
>> +	ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "set d0ix", ret);
>> +
>> +	return ret;
>> +}
>> diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
>> index 1dabd1005327..bbdba4631b1f 100644
>> --- a/sound/soc/intel/avs/messages.h
>> +++ b/sound/soc/intel/avs/messages.h
>> @@ -101,6 +101,8 @@ enum avs_module_msg_type {
>>   	AVS_MOD_LARGE_CONFIG_SET = 4,
>>   	AVS_MOD_BIND = 5,
>>   	AVS_MOD_UNBIND = 6,
>> +	AVS_MOD_SET_DX = 7,
>> +	AVS_MOD_SET_D0IX = 8,
>>   	AVS_MOD_DELETE_INSTANCE = 11,
>>   };
>>   
>> @@ -137,6 +139,11 @@ union avs_module_msg {
>>   				u32 dst_queue:3;
>>   				u32 src_queue:3;
>>   			} bind_unbind;
>> +			struct {
>> +				/* cAVS < 2.0 */
>> +				u32 wake:1;
>> +				u32 streaming:1;
> 
> you probably want to explain how a 'streaming' flag is set at the module
> level? One would think all modules connected in a pipeline would need to
> use the same flag value.


Some of the fields are confusing and I agree, but driver has to adhere 
to FW expectations if it wants to be a working one. I would like to 
avoid judging the firmware architecture here, regardless of how 
confusing we think it is.

'wake' and 'streaming' fields are part of SET_D0ix message is which part 
of MODULE-type message interface. Base firmware is, from architecture 
point of view, a module of type=0 (module_id) and instance id=0 
(instance_id).

>> +			} set_d0ix;
>>   		} ext;
>>   	};
>>   } __packed;
>> @@ -298,4 +305,13 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
>>   			     u8 param_id, u8 *request_data, size_t request_size,
>>   			     u8 **reply_data, size_t *reply_size);
>>   
>> +/* DSP cores and domains power management messages */
>> +struct avs_dxstate_info {
>> +	u32 core_mask;
>> +	u32 dx_mask;
> 
> what is the convention for D0 and D3 in the mask ? which one is 0 or 1?
> 
> Is this also handled in a hierarchical way where only the bits set in
> core_mask matter?


Can provide a short kernel-doc for these two, sure.
