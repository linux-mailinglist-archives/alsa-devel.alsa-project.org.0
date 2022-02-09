Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED104AEF35
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 11:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCBEC1713;
	Wed,  9 Feb 2022 11:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCBEC1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644402179;
	bh=oEVeAjI4oQ9+PubuywsOTWpb0VdHIyhH3d4KzWk3jgE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BH+NnM5O2Eq73VF4gtPy/hDla1vuiqXryIynQPh+lttTtEa5MlivjCaxlh92JFOTv
	 hZvvHsiGoEYFp3gG1yHzNmG+/TNQ+rUbOzbd1oMvJ6JhCuat+dsxXeAHUnSYayE8UV
	 JSlpGbZURbMdaDcmV+lj/0yftyAJd4R64TmAq3lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4399FF8016E;
	Wed,  9 Feb 2022 11:21:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A73BCF8016A; Wed,  9 Feb 2022 11:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87833F800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 11:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87833F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AflOZ79n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644402103; x=1675938103;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oEVeAjI4oQ9+PubuywsOTWpb0VdHIyhH3d4KzWk3jgE=;
 b=AflOZ79nBe/b4Q6WHZ0WabOc8SZPI4By25ugU5Ub5TfUY945pm+6ziCm
 Tnw8USFJ1+bMKnLQHSeL+BEERxxJLj+pG0Y9fYn6cUdnxdDe8iN5gpR2k
 EsaT3WqTxPiuudESIA0ESMf9dUWCQhKQemiwPVYB+PNnZ2dEHZOaqkHxU
 z6WPeTQfpEV1qIIn2ykAPlRjrPwiyX5RJOF70hnSgw8PCFrt9HjrZJSW+
 lTTMNh6uLg9FKHqIXxhyPk8N5eAfXnnswttQdtGBSUaYIYHM+69b0QIBC
 N3IJfajU9JCqQ5Q2bnQm07QuuG6Tio9CHI9sLcukoE1IW0luNTWOPEkaW g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229822810"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="229822810"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 02:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="525937156"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 09 Feb 2022 02:21:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 02:21:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 02:21:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 02:21:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpDS5ix7WSSof2774LOkF6zzv+YYlCoycPcOBCyklXCJvtsLAzlabm4PHcOdiuZc7GQEKvTCzyqWpoj7DqIOncyWVl3M9hLsmAPCTyP8DCHfJnhXBXZV87kHkVkAfHsCyuzFj5lhMQcWVyKf5+gaaTFCPO7XymyDFvba9BDDrto8pLHA7fsZbU/8ao8+OQBJV51MBfbddRIImWme/wuPJ8Hei69yH1VgO3ISXp3XT3MEPkvfDf1uYJL2P0aqeaAH8rOBS7zhHnpSimCTMHchkha85fnAA0/jPcMtbulkJVNEV7T2iFg0iAJLDCsbfFKytQxmxOtOcS7Cwfk9o54tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr0ZKx4Y98p/X6Ektk/w8ujj1I6DWfpumXkgH5rQGk0=;
 b=NWxUpH9k/rVIH6loh0P87OMbCyddhhoyLUo1gulzj5Un8Xy5P//pbjLYflIhWGDSiRzxrUOJLX6+ii4KipC10iYfakUP7KkgFU711OzIbhBaLhxsPbaeEoT83CA821Okv4Ouoot8CVhvttdaF7e4uQnYBdkfYox8OmliUKOADiJtzqyU9dN1ycPIhBryp20OUVjHd7YMbRptK33udP7B3tLTId1bKLgFIjaszWSWc6xvuTPLMM+kF3lKR/DufPKb/H3i1kYoH3aW6OpIuFtY5H1RAQpN3rfKvqp3reW2Sowyjl+XDGrNy8HKK1lg6FEwk6+6FQZcJMHo3y3sBR3eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CH0PR11MB5722.namprd11.prod.outlook.com
 (2603:10b6:610:113::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Wed, 9 Feb
 2022 10:21:33 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 10:21:32 +0000
Message-ID: <14d6492c-ad72-772c-55ed-2e5d51f3cbdc@intel.com>
Date: Wed, 9 Feb 2022 11:21:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
 <s5hiltpqo0n.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <s5hiltpqo0n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::15) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c490f536-43f6-4f24-cf9f-08d9ebb5f1a3
X-MS-TrafficTypeDiagnostic: CH0PR11MB5722:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB5722BE0C7FDD924CAF1B4ECAE32E9@CH0PR11MB5722.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4V3G2pf5qU5gnbvk3VMSFazb1Nx4V8XRrU1Q0zw2aYw6MoPMTYH5sDCzvz1tsO8U5fKw7iKwIVaqQdbLCSTCRauE30VH7+D0sGiq63GQKMSrEl5bzIPzbkdhrEUQVf9NNJxwlSQnbmhoNLSrLqeF7KwLXx5uGkx17nHT85cDeTNHwiVA1mOPASuP/oR3xy3F0ZABYX3rC3S0wLvZGvb2Hx8ITWCXjIp7kkATdqA+UCUeg63kcI7AqxZ9R0W7xApezxs0QQb3BAt9HwmJgQ3KsaKibVOftZv63gqImWRfwREWXj7N8LwD3ecWm0sICER5ATns1NeW6gevw1Qoz3urAisoh3VlpcaKcg+vVn7CCV462qE0KWSPK12dPiBeHf0aT1uvSGfntwnT1V8NrKB3+1/jVRNxkFQ9HEQ6aiaLZiFlv7O+umnZa4CGmMQWHCKzmzm3hY1F7cJ0Ms95IQ85+ZDMqk1tRPMTMwi6nxjNxr0IbgeohKN1D4BIxsjuRm8wToBkiV/S6xHdbbLrAC5aGl3iAzfqKqBBXgefxbNqUiJVO94xkXECPm/yG+q+OpimMM3H9QG6ErhmqIOJYK1NtzjAkSywEdvfN25VEW3E0JGMfwO+UST9UOvXLi10v5+T7SdEWnsXDPNVJPmZoOgnviJ5yexrqTzm0oQ27v8Y9Ryr+U9AsADVWDbAQh6Le5kZbJElLWJl/CnPivkqzMgdyHCJ8bFsUv2YO5rUXH0LjbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(2906002)(508600001)(44832011)(6486002)(6916009)(15650500001)(82960400001)(2616005)(31696002)(6506007)(5660300002)(186003)(86362001)(26005)(6512007)(38100700002)(66476007)(4326008)(6666004)(8936002)(66556008)(8676002)(83380400001)(7416002)(66946007)(53546011)(316002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2twby9LUHVnUE14MlA5Z0dHTUNQN3Ridm9KUENpTFIzVEQ0N0hxVENlS1ox?=
 =?utf-8?B?NURHanBkNlIyaDFxS1ZMNmZVS1NjSVdvM050ZUt3SVUvK1oyREFtdkN6azJQ?=
 =?utf-8?B?S3JkeUxrSzBUbFM5b1pJTkxuUkFlbU5FUXlHR1BIMUVQWDFIREVuV2Y2VmJw?=
 =?utf-8?B?S0xhOVE5bHRpVlFrQWx3Uk45MFdFTmdoZ3AvVXNPT3hjSUpyVkxVbWhHeUZq?=
 =?utf-8?B?R0RXMTZVV29CY2VWUlBCUFlzcDdsR0Y2Mk5kYXdPVStka2FiSUFySWtMNHJj?=
 =?utf-8?B?bGgzKys1VlVwb3Jac2JpdnprbDQxWDhwWFJzSFc1R1ZRUmthcEdNdTFtdisv?=
 =?utf-8?B?OXhvWUVHdm5md25BeGZ4eEtVc2h4Vkl3amJjc0pwUlVGWlB5eWpWTTlTbWQ0?=
 =?utf-8?B?WW9RTmJhaUQ2UTg4MXlJMHdXci9HZ3JuTUdXMEovRTZGTll1ZmgwbW9JSmlQ?=
 =?utf-8?B?WUFIMDdFRlg4c2J4SkJnajF0TGhkTjdManNqYUlCZGhMZTdJVlJDVU5LbndL?=
 =?utf-8?B?VEtHVktrMXdMM0dzMmRMOEJwbk41cC82WFUxcUdjZGk5anE3K0xRZ1N4WGpo?=
 =?utf-8?B?ZG82Y3hKSCtHRDEvV0cvd20wbVRZd1pBaVoxTE9iRWRiVFg1bk05ZzB6VHJx?=
 =?utf-8?B?WGZvNmVhNVdnU3NDOWVxTWd0MnZ0TGJTUmduVzBBaU9NWmlJZC8yVjlnSitZ?=
 =?utf-8?B?cWttb2hGNnJYRE4zRWNSQkZyaUlzbHhuangrUjQreTBHOHNBSlpyNlNGQzZ5?=
 =?utf-8?B?U2dhdVRTQ3NKbkljbkNSQ09xQk0wcnlZSmRpdUVOZVg4NDI2dGluUjNhSTRu?=
 =?utf-8?B?ZFpBZjlXOER2VGpNa3RHOVg3TVNiMW1SRTZDalB5TmJFZXhlc3pzd1VFK2Y1?=
 =?utf-8?B?eXNmcURBN1dLV0JhbDREYUNsdG5aTEFrVjRaQUFyeVJCMTNBb0RGai9lZXVT?=
 =?utf-8?B?RjlxVFJLeGVtOEh5UWxvZG13UTVwY2NuMUF3NUwvNGc3U2FrRkhzMUtmUktj?=
 =?utf-8?B?MnlTVlBuUm9EZlFnQzUrWDV1Z1M2dTdtK3BvZTZ2dTdRMndjOHJrd1FUZ1NP?=
 =?utf-8?B?cksrWUNXWW5FcGVEZU85L0pXV3dPR2dwMStkMjBrQzgxTGJDbmN2NncxWWVC?=
 =?utf-8?B?L1MwYmNwczEwcFhQc0l5NGtId0ZLbnAzVS82TzJyM2ZUN1JpSzB6Wkk4VGZJ?=
 =?utf-8?B?UVl0b00wODJxcldmQzlNSFVYZUR5WHBrMVRwNjgyWUZqZHhaaVBLTVVLdDVD?=
 =?utf-8?B?cUhod0dZL0pZQzhOckg5NzJWTTBCQnowZHcvRThwYzNxL0lxb0I1MGNXWnBD?=
 =?utf-8?B?eVZoN3M5TWtBSVNaVFNrdHkvYTBkV2RtV2U2WFgzZVhPa2FlcWw5NHBtT0sv?=
 =?utf-8?B?V1JaYWxJeTRQNiswd3dFWDBmTTlRVWFGL2I4OUxwWkx5dm9pdEdMKzdnVG9P?=
 =?utf-8?B?L2d0NGttTFNpandQREdIWXZTdVNvMUdnMzQxdDJwMXpPeTBKcS9rUE1ZaVVy?=
 =?utf-8?B?Q0xsU0tqSTB6OS8ydGNUR0hmaXg5K25ENU5uS1dxa2JKNjhpc0xJSWlRNHoz?=
 =?utf-8?B?QUREaTVVMVVxNUVub05CZm15ZC9TMWpkTXZhU0FUT2xJNzhZVlk3RE5HcUZU?=
 =?utf-8?B?S3ZqbGxRNDBmM1RuT29nZ044cEg4Q0RUaElONnBha2xlbmZvVndqSmJwQXFF?=
 =?utf-8?B?VmdNTWh6TTJsb2NxbEE2Kzk3WFcxclhQdmtlalBHd3UxWFF2Z1hodURpUEZr?=
 =?utf-8?B?K1JyREpOQjNMOFZHYkF3WVBseFJwKytyZi9SRVh1UG14TDRTY1pSOEE5ZVls?=
 =?utf-8?B?NG85dS83aUx5QXRXb2VBbVo3Y1ZOU3hPZmVHV2w4Sk1kS3RSMUVGUG9zWkF0?=
 =?utf-8?B?YmxqV0lkSWpFL0ZnYU9MdUNCY2tZbVdZSER4aXFtcGJqSk9PR1RGMGVxTk03?=
 =?utf-8?B?UzlLSGJIckE5UHlCMDl6VkpHWWJ6Z3RNVFo0WEtub1B1bHlyKzF0NkZLT01C?=
 =?utf-8?B?d1dtb2p0RHN5aUhyYmlBQ1NUMlFNQkxjSm5XaVlCYnRoUVlXa0o4czYzWDRo?=
 =?utf-8?B?VG95ZTV1bktXWVNRWHl6V3lOQnhBZm0xZjRMQ2QzRGZpai9HM3hqSmhrbkZR?=
 =?utf-8?B?dVBlNEtqT2Z1bVZNUHgzV01qY25Pd202MDBaM3VCOE5jY1BCQWtMTEx0V3dk?=
 =?utf-8?B?ZXlUMnlVNHRJT2FVYVZPeXdnRHJ1WGFNb1JXTWxXakZoR2dKbjQ4eXFKTHVI?=
 =?utf-8?B?V3doT0d0WnFJN3JoaU84TzExaHdBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c490f536-43f6-4f24-cf9f-08d9ebb5f1a3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 10:21:32.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFtkarTP/gTr+5I61eMke9XhU7bbnRYGkduf7SQ7kDhVofrzoJuaxmJJSyqWeEiA/tGRIq3kYYibwk9g2Jct2wVJkQRVqLsPQ+53OfcY3Rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5722
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, harshapriya.n@intel.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org, cujomalainey@chromium.org,
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

On 2022-02-08 6:14 PM, Takashi Iwai wrote:
> Hmm, but snd_hda_codec_device_new() also does the actual hardware
> initialization including the power-up sequence, and there is a call
> snd_component_add() with the card instance.  How the function would
> work properly before the card instantiation?  You seem to have handled
> only snd_device_new() and not touching other code where the card (or
> the hardware access) is involved.
> 
> If the purpose is to get the fields of snd_hda_codec to be
> initialized, those init code can be factored out to another function,
> so that it works certainly without card.

I was anticipating snd_hda_codec_device_init() related question so much 
and was so ready for it that I answered like an autobot, regardless of 
fact that people were not asking about snd_hda_codec_device_init() vs 
snd_hda_codec_device_new() directly and that's not even the patch where 
the change is added. And I wasn't even drinking coffee for the past few 
days..

Meh..
In regard to snddev_managed, If I'm not mistaken, the problem is 
connected to the 'dev_ops' (.dev_register, .dev_free) provided for 
snd_device_new(). To have basically 0% custom HDA logic in our code, 
rely solely on code found in sound/hda and sound/pci/hda ability to 
control when snd_hda_codec_register() and snd_hda_codec_unregister() is 
called was needed.

snd_soc_bind_card() invokes snd_card_register() which in consequence 
leads to snd_device_register_all() and that to automatic ->dev_register 
call. That call involves PM operations, and at that moment, codec is not 
ready for it. In the end, ability to call these in correct order allowed 
all codecs that communicate with avs-driver to remain on HDA_DEV_LEGACY 
level.

To answer the remaining question found in your message:
The purpose of the change was not to get the fields of snd_hda_codec out 
of the function and have them initialized elsewhere. All other 
operations found in the snd_hda_codec_device_new() are required and 
their ordering is not problematic so they have been left untouched.


Regards,
Czarek
