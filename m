Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 106EF5AC3CF
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Sep 2022 12:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9ED166A;
	Sun,  4 Sep 2022 12:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9ED166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662286226;
	bh=DVQG10NOyonCiTEae0P32MWuNZQBFYwEpLVbK8E76KE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7CCG2st3LCIxpKPSS5YuX71+JDAvWQ+o5sPLlBAyjAXD1MqMQmmtxK1L8din1QDH
	 nP7ZzBDgeS54HJKWyWQz/bm/Zh9X4AI0LWrWXRx2d+qZVhUpa3Z56F06ePJeXUhhpL
	 h7mZh0Zaq6X4AnalH3U402jHOS1Ig6K2OSmRsacQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5173F800A7;
	Sun,  4 Sep 2022 12:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DAFDF800A7; Sun,  4 Sep 2022 12:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2482F800A7
 for <alsa-devel@alsa-project.org>; Sun,  4 Sep 2022 12:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2482F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a1WjJcMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662286163; x=1693822163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DVQG10NOyonCiTEae0P32MWuNZQBFYwEpLVbK8E76KE=;
 b=a1WjJcMSQ8+SRpY9xpBD0rNwIXPRDsZHPWTGxsg5E4qdVZytT9x95CDJ
 Zjjf+qqxcRr7Os2HkuRGpDPrkkdd0jqK+pwQnQfBXOrK0bIlzWdY7xRfI
 fYU2/xL4SJ/hki6nQB7jPSv3MVeAbQeqmMQlFBr0lMGwIpCDFe++A8LP3
 z66v8Wd7YHKJpUyDtJos49D6DXA+jkCb7C0t7XvOfxX1Mn+/5TKOB2d/w
 eA/xVPpqreFqZPEPzewQxLD89wPNN55kBfexBCtcBToBDAEo30F/WT/zv
 pHWqJ7mWLpbuBnc9cGzUAKRA+UAJLKoeS3vROIX40yJZxhyOx79sy0r3F A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="276624180"
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="276624180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 03:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; d="scan'208";a="681745512"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2022 03:09:19 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 4 Sep 2022 03:09:18 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 4 Sep 2022 03:09:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 4 Sep 2022 03:09:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 4 Sep 2022 03:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmMz4S+YSVqrbMzVSWepsxJH1yhCDWP7+dnGe1IsVh7sJVM+x5Nix5TfBOycXgLOvQeOMUMgM7EfqgHOK7eQSk3y4oi066ObruWWseLDIelrgKrL5h2LexD68zxVNCWxHA7kn5DOlTH+uk3GDwaKUk1xRvGlCJZV/JVRDpQBu+sllxOP4i4tIqHQ3rCQUCNknkiwYp9gxtu3IYi5z3KTPVzH8dZavgUFfFEn/ibfcD2WpEx9zJYQ700gXnseIT4bhkFr0EnMpPN1aBJ+h9bMibFjxcI6+e5AIMxisViVaCxJ9PAxci+XlsMCARwvT23I/79EYwpOvvPV6uxFitElig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCLns1K2bCi+xj+Id3VSLOkB9xvH1QqdX9vHqzCZJ4E=;
 b=RRnUa7ha/8c7MpFGk+cDaC/eZ/0PwW9TOyDUE3OtACqjwtWVjBknjPL73giTzyUzaCtSZYDbHJoR8BbvxMykE66qH7Fzd+vPES2U60UMIIw6ez44vr6rWHgH351Mt8qPK5DJInQC6EXR04MDrDXnjHZrbk7TmS+LfWGOASH7SD1KdGAKe+PObzkveL+tdgp4jQtF7v8BkVrLDhuSG5qkoLDlhX2pVP2sg0TAkeP6m1NCAAEKdI/+snlLH9zyLAn37243ZjgyUm1qvxr8X01rUl9OeE/cc8D9rP6WLw61snSpP8e//r8Ooh3+ccGiadgs/m84f3UwmTj39iBFJPFiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BYAPR11MB3526.namprd11.prod.outlook.com (2603:10b6:a03:88::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.15; Sun, 4 Sep 2022 10:09:16 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02%7]) with mapi id 15.20.5566.015; Sun, 4 Sep 2022
 10:09:15 +0000
Message-ID: <83184fe9-d2a1-8488-65fa-3735b3359bca@intel.com>
Date: Sun, 4 Sep 2022 12:09:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v5 2/2] ASoC: SOF: Remove strsplit_u32() and
 tokenize_input()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220902133256.789165-1-cezary.rojewski@intel.com>
 <20220902133256.789165-3-cezary.rojewski@intel.com>
 <YxISRG13SGScC5Fn@smile.fi.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YxISRG13SGScC5Fn@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c374b986-f43d-4b2d-d02a-08da8e5d85a4
X-MS-TrafficTypeDiagnostic: BYAPR11MB3526:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MxmED9aSVixkqUqxAc0Ehdw1RwKrl6DcdN7kHIJnPhFin0ztMZ4DkmIxSIveC6+YPzmChmaKp/7xVf5N0Y8kJiNGw6KEc90Ivux1djtirKrB5fYD/RpNHquYXxOHfQdxD2AuREH/RWzXAZQVehkO1lwBO52ewYdJICrDQGUm9/sCLVq7fx0qiPi37vYdbETdLtkdhTt+APeHdNMwttLqqgf/PSBCkYi5+2H03xS/P1iOp0EwkO2zSGJWrd03QBflaY6DzRGRuQOf6Q4FcUtdtBCM2EZqGqooJdHDDJkD34bexYQKcMN7RtDPF0fgYFrEVeROBQ+taz7PRBeU+qrGJgLopHbhW53ai4WvuRRIRnxNNwHyKkUFolmEXqrJU0AKlNaaR2eJORL4pEb7xEv/+jqOCFkQo9GXXyfiaIct6mcOc+X+himMHPdl8gC0++X53BXMgQl6lLVLClQxXVckj/hPxtzk/PXDMPRmjr3rYeGOLDAqbC5shMiVNtllAvs+pkAwOp7nMYuUgEtvmODR8b48OovoUAGj67sacK0U1XxxCYhx4YlCcQVYLZ8/Rny0NnquazanIuA1RYsRrWHsQDPFFJz0vBk9KIX6euqUq9y2iH3CM3I1hjnREJoU/a3ruECzyDMZFrkPIEhznCzgRZusJRzYEif3vNBaPz+jLGrvDUk0JNyCm5gy8luWAqCNGtYWSyVxI8e3QYdLWhzFPPtoTV0l4tLFzSol9lQWDn9WHOlrzq0G9lEaYswXttzzzQZHE/9smctv4e8p0rqkIdrIOAiTI3Lsvn5q/J4kFMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(39860400002)(396003)(346002)(376002)(66476007)(5660300002)(86362001)(36756003)(44832011)(6506007)(53546011)(26005)(6512007)(6666004)(4744005)(2906002)(8676002)(7416002)(31696002)(31686004)(66556008)(8936002)(4326008)(6916009)(316002)(66946007)(478600001)(6486002)(41300700001)(82960400001)(38100700002)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDBHa2J3ZStTajFIZ2o5MWpZbS9wdFNoVU1qRUY4cC83VmRkZmh4UmZvMHJP?=
 =?utf-8?B?OXlsbnNoMGZ2QW9sa2FpaXBkUTNWeGxoV2t5WGlpdElhSGpIbm9TZ3Z5MURi?=
 =?utf-8?B?cG15SzF5VjdhMmVyWkdkSjhwMXRBb0RGSnFFZ1NqZkRxdkFWdis3emJqTHEz?=
 =?utf-8?B?ZmJBRHlWaHNiNk1ZdzBzUkFZdlg0RzZSYVBYUmN6aWVKMHB6TkRaRUVZc0Jw?=
 =?utf-8?B?S2VmZWhMMUxPWFJQcHJaMU0vaWxSWWxEd1F1S0FOOEp1WGNQaDBxK1ZiTFB5?=
 =?utf-8?B?K2NRbkVsRE9QL0xSQXBScWFFbmpVZFhVV2dTVVlxd1cxNFowb1d0SFNyVWZq?=
 =?utf-8?B?VGZldVhjdllFQnJCM0FmVmU5bUoyTStlWWphcDBkZGhVNVpDMU5MbHVCUkRx?=
 =?utf-8?B?Smw2eVZtK1BvckZ6K1BOOVRDYlFHaWpoMGJKMlQrUHJ2MSttZjhJQlhhZ1dB?=
 =?utf-8?B?VWUra29XK2p5WGwzQnM0UkpxV2NzS0xxUnF2TWhuc3dkc2JmWGRkV0JUSnVs?=
 =?utf-8?B?Y05XWVpnNWpPVHVRZHZla1EvZU9Vc2NrUlZtU0M3WE4vVGtiUy9XdnVENW4y?=
 =?utf-8?B?T3E3aHZxWlV5QTdqbHo5cnJxRzNpU2hRSjQrVndFRGV3ckV2VXFnaTZYd1VM?=
 =?utf-8?B?RmFxcGkxYjRzWVY5NkFuVllIelJFZU9Yd3lxTDYvdGNpc2cxTlpscSsyMVZ1?=
 =?utf-8?B?Q0p1TW9LMUhyOXZuYkxtUVlya1BPQ0ZJMGpQSFd5bjhncG9mUGkxanhRbVlX?=
 =?utf-8?B?VHc3RmNhbm9VeHA4aXd3NDlYRDhSNXVOa1VaZ2QrUkpzenM1dzlCUTJzTG4w?=
 =?utf-8?B?TlorUmk3SzRHSjdIWWpZYTl2U3A5TXpZMDlMSVJ4My9JdnFubTNWZ2d6a09P?=
 =?utf-8?B?a3I1d1d5SERmUlVPZlpyZEUyL2lnVHMrRUNhN3ptRGU5ODg2dDFzRjlITk41?=
 =?utf-8?B?V0NtRXRjUWRBRmJLYVh0a092a000cFg0bUs4eGp5OWM5NE9KSWtSN2xrM0JP?=
 =?utf-8?B?M2pOYkY4TStIQUFJS2xaWnMzTTZJMnEvU1hMb2xLZnU5VzBLWXh5N1o4N2tC?=
 =?utf-8?B?UEJPZExkbkFTZytkaEJlMFJLa2pwTU4vNHQxaXZyaTFVQlJhZDREMFdQOWhS?=
 =?utf-8?B?eXNRMk1PRU45SzRod0ZNOERFWFJnUjNNNDhkalh6dFlpMGhkNVJudUxqVVJi?=
 =?utf-8?B?NXNwbXBpRDRyRDRjU1Y4ajdKcnpwYTJndllVclE5ZTV5K3pNNGZNbjQ2Wjhn?=
 =?utf-8?B?MlA3UjVkaGJNNi93YmdNRFA3MjhVQUV2ZXVNQkh5TnYrQ3V6M3ZYT09sNFRn?=
 =?utf-8?B?U1J1RkN2Q2hqSTB0WjBqeGdOcm5NM2pDV1lDMDVrdUZjZW1DNnUyaW9DYS9h?=
 =?utf-8?B?eUlMeVdrbVlYOFZxV21WVW4yZExjaUZ6U1NCS1ZnZ0I1N1pIeFdjOWhiNVdK?=
 =?utf-8?B?Q0FMbVgrNGR5RmRkeU10V0tEa3VWNEkxS2hYelRtRnROUkxhcEdVNHpQOWt3?=
 =?utf-8?B?MzFXaDk4TUU2SGZQcG1sYlRLek9zYVVUZU5DdHMwNXMzWm9heCtqZ2c0T0Yv?=
 =?utf-8?B?anR0b1lLNE5vYmlnNkJnTGVJc2d4RklHdG9iUHhvMFppYmxnUlA1Vy9NWmxJ?=
 =?utf-8?B?VWkzN3FidmV4QWs1YWVXQXlyOTB0SEZZeEdKVGZtRGpvR25kODZlSzg5anBN?=
 =?utf-8?B?c1pwL1ErcWJ2LzhRblBsYVdUaGFYcFlFaER2dERJS1o5UWJveXFBckU0c1hs?=
 =?utf-8?B?K01CcEFkMHk3T0swQ29hbjNKQ2NFeVNJK3Z4Y3Q2WS9sMXUxK1VVRWRpRVJ0?=
 =?utf-8?B?MHdQTGJmdktFNGU0clhLS21BU3NQclBWZ0pnVU82L1BxL09VMVZ3L21Meld5?=
 =?utf-8?B?S251VVlVbmVGenNvTmpQQk1hYjBKS2R4REwzUGt1aTduQmpkYXZxSnkzdDZ5?=
 =?utf-8?B?MkhieHlGUXpYTmxHOVVTdE1xdXN2TERlQzU3a29seTFFalJzRkVtUEwxSjFo?=
 =?utf-8?B?YTBKaVdZc2VCbVdSVDhyd0g4ZGZzQXJRcGFnajJCM0tmWFJwMmhMb1JYYVhp?=
 =?utf-8?B?RTNFN2kyNUJXcVFZeWNsRnZhSVZ3UW1OZmw2M1I5dlJqRE5nUGFTSDB0YVg1?=
 =?utf-8?B?SEtrTXFiekU4dTBFQUxHS2hrZ3pCY0xhN1Q2aktnUWh3VmJCQWF6K2o3cXlu?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c374b986-f43d-4b2d-d02a-08da8e5d85a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2022 10:09:15.4275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wlk1ocr9voE3UpkCyhuvXnVAfi1dnPrD6f+jgME49tpHsivxjpVVpgCkgopLIYzQFFEX97zLvKvgpAsX+qv5NdesfewP9GOsZI0oEKHb5IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3526
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

On 2022-09-02 4:25 PM, Andy Shevchenko wrote:
> On Fri, Sep 02, 2022 at 03:32:56PM +0200, Cezary Rojewski wrote:
>> Make use of global integer-array parsing helper instead of the internal
>> one as both serve same purpose. With that, both strsplit_u32() and
>> tokenize_input() become unused so remove them.
> 
> More minor comments...
...

>> +	ret = parse_int_array_user(from, count, (int **)&array);
>>   	if (ret < 0)
>>   		return ret;
> 
>> +	num_elems = *array;
>> +	bytes = sizeof(*array) * num_elems;
>> +	if (!num_elems || (bytes % sizeof(*desc))) {
> 
> !num_elems is a dup since previous already does this check.


>> +	ret = parse_int_array_user(from, count, (int **)&array);
>>   	if (ret < 0)
>>   		return ret;
>> +
>> +	num_elems = *array;
> 
>> +	if (!num_elems) {
>>   		ret = -EINVAL;
>>   		goto exit;
>>   	}
> 
> Ditto.

Ack for both.
