Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AED5AC3E0
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Sep 2022 12:22:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4FC31674;
	Sun,  4 Sep 2022 12:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4FC31674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662286955;
	bh=rtDerIFC1ThBRe1r9KZQfslmh/h7bQovKm9M2xFH0KI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwO5Zun2KQazY95wwCEcVYL77U+gRmnqEFaLbzpuixpSgr1RD8+U9K+OxuJWR0C/b
	 07BmuCOLubu7ozN6ru3W3f8TIVwID1QemAtx/JqHGLSaT1Tl1ao6bY1UrhwtQiQJDm
	 GDnoe3dEz4NbK6zXrWK3ExPJ36/r+IoK9IcmPMRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D070F8016E;
	Sun,  4 Sep 2022 12:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC257F8013D; Sun,  4 Sep 2022 12:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 073C9F800E9
 for <alsa-devel@alsa-project.org>; Sun,  4 Sep 2022 12:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073C9F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jX1DVyLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662286892; x=1693822892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rtDerIFC1ThBRe1r9KZQfslmh/h7bQovKm9M2xFH0KI=;
 b=jX1DVyLzQ8nhsVVW+isbKUDuSCkPAdT0ELMB03x8FOjtk9+WJm7Tutkr
 Cc0tmj5lmxMlryKlDwfEl3DJjC4vCOuDuE9r9szebqQq1SzCPaIram0x6
 i2UV2tkakfPnwYyOpu6Q4AIZsOgs/LVcxXHoN8V+xdr6O1kBBVEVv1y4H
 G4pqcA7n9HW4z6HIsy+RVXyBKZ/1rIGDOpy3Gvp0idZBg2MxgXYNebILb
 IxclOWCdxMU+TfcvBk/rYcvwLmaKmsnokEZgR6lrpTPeWkEC8dVMNAyut
 b5WIYcIBldmus1Py8KjDa1NPJ54EhBzVOHNnqNqBZkti4DXol0l9tTIDs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="297016300"
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="297016300"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 03:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="789106052"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 04 Sep 2022 03:21:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 4 Sep 2022 03:21:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 4 Sep 2022 03:21:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 4 Sep 2022 03:21:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 4 Sep 2022 03:21:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csicZo5BwHpQ8/cNppGXoRw8ms631YTYlwZ9hq7gm9rFrXjhYMa8Nwl8W1Bhmdy5+D2Pr6JyjJ6GNtre832NHd9JbvmILHprXetAI752dxVIMsx27xjdtCFDqQnvt+7OtYKIiiMHnUutYFNwLW/eqsC80OJ8dy3wD1k4hCJLfi9HPpTfynr4/EhjvPuLr0WpdMblDa1WdQOeOdSjf9PDOTyMmj6SIC2wa3HLQgSUVr1J8EoKbB9HgvjBqgzz+CEM/QLQ4edgekACNItkx8Ir6QVgucGOAK9Afj4vbvIvSIE3q3v6NHNZ1JVfQSYuMjVDChEWQ9OeT215Ge5XLkvZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be2TzADFWYm7BnJcGO8sZ/PCVqVN4QomEAv+A/p7nhk=;
 b=NOpWhg+I9go07jbJkuGb0Tn+U3b76EyY8QA/oT99wUYAZzTyNSbTEHpMtqH9Jh8M9V8c2W71Hg1xpSA0Bc3j+PxANdj95nxbIo1k50aO1Tep/o4KkuCOYuOkpzvd/wVIc5FS71RRRTmOyXWM4Bd+p8jc0mt88Reyh00f2/ZwQD9L+DMQL0ao34RwEdg7FUmRHkSIwBGbnmIvcmyiRF2Pbq8oJPZMaofCZ3O6IkkqeQK3OX19cyHuPN2ggGXxl/S1ckPYb8iq2EisxSHgw9hRiB7OOAk5msxBD94WF/xQ1x/5JW9yc90UDOv152yII/BKk6UZtj/Zj1Iufg3xASteDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Sun, 4 Sep 2022 10:21:25 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02%7]) with mapi id 15.20.5566.015; Sun, 4 Sep 2022
 10:21:25 +0000
Message-ID: <93871a0a-1381-d0ac-caac-799fccab292a@intel.com>
Date: Sun, 4 Sep 2022 12:21:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v5 0/2] lib/string_helpers: Introduce
 parse_int_array_user()
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220902133256.789165-1-cezary.rojewski@intel.com>
 <YxIQMCFX2X3p8teL@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YxIQMCFX2X3p8teL@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8cec30a-3518-4f2f-09e0-08da8e5f38ab
X-MS-TrafficTypeDiagnostic: DS0PR11MB6374:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BtaStqy9Eq93ypI+ogv6m4ADvoBFC4mfvMbcSA07GszFgbyR7NySE8/PEPPYROyksLBz1TydmXXlk17xoOmdJRAoXH0B5y7d/58/70WpSVpS601djEEakcc/fxXeJgVf18TU8VZa+odqpr3zIN/USnMIWY4bo08AZ+aMFkDICvhDdOuxAK/oFHjUZ7V3X8DghxN1NfPJnSCj5P3t73OisGFnbcxRad6bPV7aIGOnZLoaLnT0reeDlWlLmuQjZLFqLT132Sw9EpGo9JcVPwEov45cKAKPqwKrWW2yHnlqwEJIP21I0r50Zkt3AOd+gASZZ8I0nChNN9F1ched8g1/qWyrkYJSEFimbP1PNUwA5u7Ya2H5KvrNU5+lWs4RxJC1VPCwV1spYJsA08FlaZSimDmAMj/VUDHV+EGL3GsbvppFcX8aRJcxox+AS2nRhRORdSjHmPTy9kQXHrBedrPQ8mP4ZTe0DUenTgkEDafwScdFqNT1++rQSs4cVHtsusUGr4RB0cMxNT6XsUK1TogvGcpSqfTp1a239j5I+U/X+pQAoKKe0MQMO/Qt1Jht/qmczIeRboMlKv7wRcKCaAPyBuyAcnxmqcKEDwpovTQ2Dc2J4h5uiHo6vkcMisWMmMc51cGvOru4JY9QeYRng3LNQJU0dfcx7KNpFrTjTit9i4CQBAdnICiuwaeXyVfs2ZlVetl4/9Opa1vJLMXrNc8obGt/p7nlc1NPBuZ9GlBfHHn+YEmvuC0EnO5GZLvxHNKXSp36s4RqFHfBAFuamGP9jrTetFx8nwTia3ihZaM2kM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(366004)(346002)(136003)(2616005)(6666004)(6506007)(4744005)(7416002)(31696002)(5660300002)(86362001)(82960400001)(8936002)(44832011)(2906002)(53546011)(6512007)(186003)(26005)(41300700001)(31686004)(66476007)(38100700002)(66946007)(83380400001)(66556008)(36756003)(6916009)(478600001)(316002)(4326008)(8676002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFd2d25Nek5CTGFTSGRrQWcxTWVLMlEyZ3I2elFETWRSQi84SE0zMjhHNjg4?=
 =?utf-8?B?NnMxcTgvWFJYTDZBZ1doYk43QmJ4YmlFZExGL0dQQTlMNUFEQWFMUVNCR3lh?=
 =?utf-8?B?T0tvaDJwLy90bUFaUGxIZFpsSzQ3OHB6R05xN3gweGQwTGdmZXdOMGpjVFdN?=
 =?utf-8?B?UXFEOUtnbmpBdUg0NjBFcVFlbmRXS0hVK1A0V0s4YnJsMTFmSlY0VGpwR1hL?=
 =?utf-8?B?eWlSSXV2b2VRNDZwdkcrVmNoY2lKYnQrVXpEcEZJQ1kxZEJtd2NqZkJKcXF6?=
 =?utf-8?B?TG45L2cvY0lONStwaFJabExDOXg4dUw5cHh4MklXZjRGT0U5Y3lDVUUyZEc3?=
 =?utf-8?B?QXkvWVcya2gzVnBaNHdIT1JvbWV6YXJ6Zzg2bmZReTRRVmpMd08vRUwrVnc5?=
 =?utf-8?B?Q1NKME1vYkR4a3JtY2x1ZjhDS0NaN05CVFh2RXpJbVdPTmZlT25kM2NscEcw?=
 =?utf-8?B?SkNObi9jcitBdzV5ZDlmU1ozREM5dWRXM3ZIaWJ3eGZJWUt0bmFyd0lwWWx0?=
 =?utf-8?B?a2FCTmxFeHJPQ1k5TFBuRkZ1QUtML1pDYkk4akwyWWNFWWR1ZGVKQWJuZitZ?=
 =?utf-8?B?ajluK2tIR0xwQWdkQUJxSndvaC81clRIMklsTzBjMWlmN3dPOTg1dTRzYkdN?=
 =?utf-8?B?R0JrSkxZTTVuNFgwTzE0STNCTGlYR1ErRUJZeG54ZkQ4MlcyT3JockNSTjRj?=
 =?utf-8?B?VVNTSzRaRUs0VWR1U3MwKysxemtRWGU2R2JhYXcraXBxNTZJV1NwVWRHUHYw?=
 =?utf-8?B?S3pHSUxxeVlSTnQyT0tOSndOSDF3R3VLbUgzNjAyb1E2K2Q2WFVJQ3dhVzJQ?=
 =?utf-8?B?R3JEdUdZajJXSWR2UkErVzB2blpUSi9JTVlCbXVaeE9SQnJtWS9CYnlvWkhw?=
 =?utf-8?B?TnRpZGhwMVdPeE03Q0djdVlyeXlDZFNNSlcyM0N4QmdBa0ZYMnFseEdUZ0ts?=
 =?utf-8?B?aFc1YXozQkRBRU10c3BvSXROTTdpV00renNuUjdVOGVoUUxDOGRiakpidDN6?=
 =?utf-8?B?c1E0V0lOZExPUnFEa0JWRzhEY1VWamw0WlhZWVdjSk9xb0w1TDF6S2t3OWla?=
 =?utf-8?B?OG40Nm4xaThmSnd6azVra3JFMldSMGRjMm11MkR3U3lYOFJGd2gxZVVpbE1h?=
 =?utf-8?B?ajNFM2JHeDJFdThtYzlpZ3hhTUFUbXloOStaZVFUa1BlaXlMN0duNjBCYXRh?=
 =?utf-8?B?QWN1YnlSN3pGZWJXZHZPamt5NG1zcTMwUU1Tb2NHS0xoVyt6dTh3WVNKVzQ2?=
 =?utf-8?B?Q2Vja2wvM2s1RGFNKzlicXcreTRQLzlYWnJGM2NPNzJweEppRVhIYUFoV285?=
 =?utf-8?B?Wm9JbUthUmhsQ0thbC9BVUl5YmVyMkQxYWcvK2pZWFF2SHBxZnRUWE9aMTRt?=
 =?utf-8?B?T1dKNnJOeHlrdFVwUHRxVVdsNml5WjZ6NHFOUS8xTk9nNHowWWpSMHVNOWJx?=
 =?utf-8?B?dVRkS1NqVUxXT2RlVDhSL3NGNDFSczRnczA4dUtMamNvbDBKOVl6aHZWQThS?=
 =?utf-8?B?VWhrTldQYjlzbmxwK3Q0cHFEOVRDRElVSUpoZUJOaFozZ25XWlJud2xSRFdU?=
 =?utf-8?B?V3FYYmdJWGF2YVFURTZ2OXFTQ1FBMmhGSHNOOVUyQ3dFUzZCOE9EM015Tklz?=
 =?utf-8?B?bVpibFJ1Y2UwMmtoUXRLN01GTTZiMGtaUTdvTS81bmhEdnE5RXp6TGxid00y?=
 =?utf-8?B?V2h3emYrdlNuaUUxU3BrME00K241V29jbG41MXZaRjRwYklyeEc3NHdYMVVR?=
 =?utf-8?B?SVcxN2hGUTVIcUk5SE8zcDMzSjYvSHhGT2N2T204dE0xQjVmcTIxSkNqOEpL?=
 =?utf-8?B?c0RYc0k1R2hHaDdVbXc0cTl2S1d1OGpyR0k4a09hR21sOEhSZGZMLzVaMDdM?=
 =?utf-8?B?Z1Q5b0xHMGZFN0wyNytaM2g1VnRXd21Qb3JPR2hrdndEZGdEQ3h2blE4ZTdI?=
 =?utf-8?B?M3hZNjVQM2psVFh2TVkwK0Uxa2tDUEM4M3hrVng4UEVxVEZmSEVyVkdxWjc2?=
 =?utf-8?B?TUNKci9BallFbVd6R1hlbVVuVDhHT2c4cUZPKysrS0RCTU16OGNibWFBNjBi?=
 =?utf-8?B?aFZCKzN5ZDlwMWFGRXoreG9XNjFxRHRtQlpqYkRaVWk3WGRNeWNGVkVPVksr?=
 =?utf-8?B?c3AvbXgwanIybndwUDB3UWNvOWh5UkdYUGdFV1JLTGZILzhwSU1iUXdOU2VJ?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cec30a-3518-4f2f-09e0-08da8e5f38ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2022 10:21:25.2616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2OGWxdBhDsvA6SmCqedh8UO2tJHmdXqghAmZfxVegpZcMEw0CCb0yjjr0liHEIsqAbeZGxEWL5KRlH+6bRJGtbLCY4QGiDboALQr2ka44s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
X-OriginatorOrg: intel.com
Cc: andy@kernel.org, alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 intel-poland@eclists.intel.com, pierre-louis.bossart@linux.intel.com,
 willy@infradead.org, tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org
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

On 2022-09-02 4:16 PM, Andy Shevchenko wrote:
> On Fri, Sep 02, 2022 at 03:32:54PM +0200, Cezary Rojewski wrote:

...

>> Originally similar functionality was added for the SOF sound driver. As
>> more users are on the horizon, it is desirable to update existing
>> string_helpers code and provide a unified solution.
> 
> Feel free to route it via SOF or related tree since you have my tag
> for the library part.

Thanks for the review. Intention is have both patches routes through 
Mark's tree (thus the explicit To's).


Regards,
Czarek
