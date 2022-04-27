Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E614951135D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF4917AD;
	Wed, 27 Apr 2022 10:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF4917AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047407;
	bh=fBlGQ4XyOD10Fl5S12wiFI3/yBssMtUMwWfNcp2qWRQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLYZA70naRzdtgotDZ5sJ0XR8SGV5MeGT1quzz219nD/HDMaynsgKTl0rclzCymwc
	 A5hs3/XGSfnHVom4xAlrPxReZS4JgH2n6iZ1rLiNsWM207/W5EVyh8lFaDkYmvcc9V
	 5wCmdmXxrbuK7LdENZn6T87pBH9wVw9lqdWjib5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD2EF80253;
	Wed, 27 Apr 2022 10:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A602FF8016E; Wed, 27 Apr 2022 10:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85F9EF800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85F9EF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SKrB1Goq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651047345; x=1682583345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fBlGQ4XyOD10Fl5S12wiFI3/yBssMtUMwWfNcp2qWRQ=;
 b=SKrB1Goqyr7AliRhIzej/cj98bU+5pQC6Gkim4b886HAVtYJo+tXtqpH
 I7IBok8hG0+BBgDoroBS/w7vyV2Jw5A2iAI43kmXaB50/gZA/YUyHfRmy
 M3HxZ68ShBC1DK9gmctZY2k8wv3SQH33jHs9sNY9YJufXNz6xjFl26uvN
 pqVbVlXaqVemngmBl9R+J2r9ngBQvm8Ec94vinLqEXBxWKxHcTcS/JT66
 n24d9BxJ6u1nHKerq9vqlaFAPUTSUGEM/t4WJXuNLGUlAo+7gJrXD/KqL
 +0npIq/tkYTs61Uka4xtAtHCHJsBG0nZj4yrawrNvMd9KNmums+Zmg2LZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="266019603"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="266019603"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="661105247"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2022 01:15:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 01:15:42 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 01:15:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 01:15:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 01:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAB5kYQLzLV3UbhjeWuKr9KCQYle3orpMplNDL7DSpEEphT9ZU4FCp8+a7FB1tYewsgpyRUgU4J4o+j1Joov1TpiIcIOEYQ2RNJ/ZrqcBExkaZn2Urv3SoLzNDcBIBgai/raZIW+nTTygYcPPJPDk4ZDu1FDTOqk3LHrV1g6MM2HbOXtiDEj7xYDCTqCT7vh63UTABw7PeQuCHJdRqp/2oVzwI1+PbyhOdwwv12wpHlqHRdQRM8SKlm2YDiFmBwK/LhBr33k7TimHTl9+pkJb0EIOQdHqXCM1i3zVzbaeBlJuNPk+jsC3In4axDcLmCH27ThE8HhjGngoA2yGJP6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYgnDAp8BbKcuffSXuPNjVo1SQ1DAw5wkeU/ZcIbjP8=;
 b=Y5tFFlBKemBjp2g/8hsLpDxdmFeVhcdT3viW3YyO2liqCj3RMh7/rKXlrd2cKQSUzr3Ya9bYZ9KAOSXW/+o6d4XVWxkA5eIQcZMp8VMOaPTXYDT7uK5vsbKSzad5sOJGKUx+vurG5NqL3e8d4loAWwz4bjutf3Wz8UpJRpRm151V66LGfF7Duj24WCdxjPFL7npTmvDBXvBfMWY/uGDyHjrNb3rXX798mDLQbDFrAe4hWLnPfNzH4FuscDuVybb4Eud35uIDvCIo69ktabFdeWe7IRTdsHKPf52LC5jomMuSEVujEVKPYYt2T2Krs6pMorxX8qNPHTOm9QRDLicwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 08:15:38 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.021; Wed, 27 Apr
 2022 08:15:37 +0000
Message-ID: <f13b4d03-a51a-b4b1-5005-0694acc154ac@intel.com>
Date: Wed, 27 Apr 2022 10:15:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 00/14] ASoC: Intel: avs: Driver core and PCM operations
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220426172346.3508411-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0247.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::18) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e084043-2930-4e3c-ef03-08da28261c60
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB306306E53F8ACED091E3CEFDE3FA9@BYAPR11MB3063.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 398ED0fxfNXKqISh74zNpHZkdbmLF9xgxxOr45AUZ/R+y2HMDgZfpnfnVrshx1DrDVTENMTR1xhYP+Ou57LMBDxkl5kvKtLX5ZYsXfgFh2Nc6VOL4DGO4s/icj9OXCXdb8GJBvTDQtYWxjfNtSLGU6Afh9Oje9YzhDHVlFoPsWZiSCyLqqD52U6JdIaImaFZQ6GSOlikUjC0N/tH8NojJrAeWEb6W7OT4ZL5zvewuTdk227/KH79U/lZNpv2nu1GeYXNMPJ/omLtbFGYBRHYn7o7jlXsDReg75wg2PLfUUSmWFJiy7zSvWKWNkLla6f1yzyYba2wKL5q5l9O8svm9n695P2nZTWpHFivmwguQ1wQNBES/D4tTFmc36pWJJiF844PG6m/0O7Wbi5+LbNjTNhX1HjFhXH9//9bO0GR/6OZmL+lgBdWPjClp1qCAi0E/wHGMPhvzwfxb96QYTBnGM5m+pjR8IniN/r5i+zkmV11X6ZUe4FWyf8dcbQ8ippzdEHUedjd1PwL9cDi1upaB6PdiNSgNPJHpXpHJMEpd7nc/Lv5KE2CUulwTSLnZb9GXkwe9QDc2bJXHWdaHMPqQde72T/Dfkw9SZrh0b4BqGkJ+IYlW8PgNd/uZg2zYQCPTtLX/Qj+n0bpRdeupmE9T3KogbEj8ja+TKCzhQe/eYPNvH8vwC4BnVv9W0YT33U2lnFBWnmuIstK33ibeqkrYb/sctZFWuA2QX+GaZI5cKtQwArTW7/M74d9Ga/hrUH0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(66946007)(38100700002)(66476007)(4326008)(8676002)(2906002)(6666004)(316002)(36756003)(31686004)(6506007)(508600001)(53546011)(6486002)(5660300002)(4744005)(2616005)(31696002)(7416002)(86362001)(186003)(26005)(6512007)(82960400001)(8936002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3RRNE9WeUhSVDlEY3NCUW5hQ0VubURFcWRjcE5nWFl6QU5HRk9nV2pkRTZv?=
 =?utf-8?B?dDdrZHViWFREWVpNT1BnZThDWmpMU0pIWGtEMGFEa2hNRHY0cjlLenhFSlJK?=
 =?utf-8?B?UFgyQXlUeE8yUitMK0kvcnNuSWtIaHhUb3g2V3BQdXplTEdWVTNHR3RGWUNC?=
 =?utf-8?B?U0pxam1DNDdMeDFiUG1neFliYi9TMFFhL0FlZE1nL2x6SnkyK211T0t1amJD?=
 =?utf-8?B?VUVJSHg4Ykc0SHZEdTVKN3pQakhUQmJDM0d2dzd5NHR4MmlNc1A3NGxVQ1F4?=
 =?utf-8?B?djJnU3B0K29uN01CNnBPczZmZVVhMzlXNE12aHkzWjNSb0luWGdVaGtkVXIv?=
 =?utf-8?B?VS9iamRySXVvWU1kbDhVem9JbnQwNTlOMWY3bW95T3dSZlc1azFTQm41NzF2?=
 =?utf-8?B?K0xsVXR1QlNVY2J2ZldodjlPQnJma0kraFFUakFrN0YvVE16TmhaNTVLYll6?=
 =?utf-8?B?ejF3MlJTaUxZSFI0TmdnSzBhWlU3LzlzWkliSU45OHg1UGtaNnJReDhsbkdD?=
 =?utf-8?B?SVp3NS81UHJqcXkyQzVOcW1KWDFoNFVXSEVLaGt1REJ5L2pRa3lHZDhnSlJG?=
 =?utf-8?B?ZHBaWVl3eDlaK0p5L0hvYzZ4MEZpaEwrb2U3R3hVNXlRTmxUb1RBbEcyQUVV?=
 =?utf-8?B?dEVHRElUbWVGa2dFelZJU0Y1bWpRWGhvTUVQNk53S0NPeVk1N0dSSlJnUjZ4?=
 =?utf-8?B?Zm1XK0ZqSXh3K1NZVGthUzUzUnJ6c2ZldjU2Z3lQNTRVSm9MUE04cnBVU1Nx?=
 =?utf-8?B?Q1JkK2tLZ3FidkcyNE4vNDRsdGJRNmE5alVqNVNZQmlqNm4zeFk5aW1xQlUz?=
 =?utf-8?B?WnVSY1BmTCtqMlREM3czZVhhdFB5RDRiQUc5dWtraGNaSmI4YU9IOGlxaGxZ?=
 =?utf-8?B?TFV0Qk8yKzdmTzhFVzgyTkxuUWlQM3ExNDY0WUg2bVNsVERhOXFvWXlsTFRS?=
 =?utf-8?B?ZUtRcTVKQnQwdm05bzlPN05vdGhCUW04OU1DZE5jVFlsSERNVUYwSnhGNEF5?=
 =?utf-8?B?MWdOOWtUNjBudVFoR1pjRzRjU0NReHUvSktNVE5UaWo2elp6Q0RoK1ZWQmV2?=
 =?utf-8?B?Z1I1L1lqdXE4NHY0TWtFeEZkMGpTczRGMkJoQ2QzeWhKUUNuRzVnYnZPb3BC?=
 =?utf-8?B?VmNjaVg2Z21pa0hnVlhaVUFGV0plcEkyd3lJc3RhYjNOZkVUQno0QXNDT0Np?=
 =?utf-8?B?VG43a3pWalNxZVBFRExPQS83c3lLMUVEMlZJZmk5bEp1MkFCTzdFMWdPcmRZ?=
 =?utf-8?B?cHIxTWVxR1E1VWkwZklkMU0wZ2pidE5UUk1vQnFMOG9pNlYvV2N2clRNWXBX?=
 =?utf-8?B?bE5PVGJPdjl5VTlXUnl1aXNyODdjVDZ5OW9sUjNvL0Q3YjBQd2tCSGt0WVJn?=
 =?utf-8?B?enVWbisrTmo0ZFdnNWZ6Z0dMZXAzZjFSaER5enVoT0dYSnkralNoZHV4RlpB?=
 =?utf-8?B?QWU5K1cySXRiRUE4RElTZjlzYlJsSGhyNDZEY3NBTjJDWW5TWC94eGdCcDFm?=
 =?utf-8?B?NGsxenpLblJ4VW80czJHUGIybFdqWGltWWNRMUd3L0E3eENQK3UvaEUxSll2?=
 =?utf-8?B?blVraEtWZElOUHlzeFZQRjNKYkpReWRIYXBYTHdIZEZmcm9jSW8xVTJWK1dn?=
 =?utf-8?B?UVJxTk9nTFU5NDZMcFQ2dm5hN21pZkFVUzBBZSsxQTZlSHN0VTdOeHpJQjRh?=
 =?utf-8?B?a2xiaGEvTEY5dmxycDJrU1ZiSm1PYUtIM2tKRnFLV2pObzdRKzU2aHp0Y3dp?=
 =?utf-8?B?ak91dWl4T0szbFZEREIvMzJjRXhJMXFqWXlQd1RwazNKRWNDTUtiVG0vZFc2?=
 =?utf-8?B?akgyRHBIWEhsRjF0VHFLS2gvdVJBMzFFeEhSSjQrMEFaZTRBUjl5dlFOYW5z?=
 =?utf-8?B?NDhCSDcyU3RuYWlzbzVxSDh5QUFuMTB1cTA3Z1R2YjJLK0U1Zjd0cXViSC91?=
 =?utf-8?B?V1ZiMmpnOTN5cS80Mjg1S1RjRmFDMk1ZUFV2cXV0TnV1Wm8xNktWZjN4bkZF?=
 =?utf-8?B?dWR6V01uZHZSRmVKek03cC9rTUdGOGl2ZXY1ditwY1hlUHc0ck5wb1lGekYy?=
 =?utf-8?B?MHJSd3crQmJ6amttd1g2cnVWTGFpTFR5T2h5YmxuQkhzWnRJbFpaSlEzSi9B?=
 =?utf-8?B?OS9FMXdXT01CbG11L0EwZ2l0di9qZXNWQS85MFlReWVRanZFUDhrdkpuUVdI?=
 =?utf-8?B?RWRhaEdZZVNtcWh6N0RSeU9CeWhvNyt6eG1uR2RYZy9MdTMvMTB1Y3grMlIy?=
 =?utf-8?B?bE8yZFRyQXI2SnFQNTlVaHBDZ1VSSSs4elFIT2hTQkkvaUNIOVRUOXRYbGNG?=
 =?utf-8?B?VUdHTER0N3o0UnZTWXR5N2VFMEVXenZsdlJydTdIZXY2VUhCVUovUkRFTVY2?=
 =?utf-8?Q?YyZbe2ygghkX0pSs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e084043-2930-4e3c-ef03-08da28261c60
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:15:37.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y23LI6oVFgsBFKPzdDONAfXAD7+FbwdIn9GFqUGub/utmF2SNAqr1h3/Bx3hQUHP4MhhpZzIAIe5owpQZwHRbm3KGcSZlrsVcwBhD+4s4GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3063
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

On 2022-04-26 7:23 PM, Cezary Rojewski wrote:
> Part three of main AVS driver series. This series was originally part of
> the initial series which was later divided [1] into smaller,
> easier-to-review chunks. Thus, many patches found here were already
> present on the list.


I'm aware that series generates conflicts due to recent changes in 
sound/soc/intel/Kconfig but I believe it's better to leave as is, let 
people provide comments without sending immediate v2 just for the sake 
of it building.

Given that we already received good feedback from Pierre the decision 
seems to be the right one. Fixes addressing the conflict will be part of 
v2 along with all other necessary changes given the review.


Regards,
Czarek
