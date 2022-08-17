Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2584596FB2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25435850;
	Wed, 17 Aug 2022 15:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25435850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660742486;
	bh=1YSOvPsQYHAs22ozsbK6YBFWa2vMgDcipWWuOkp53Rk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvGd1nh/V5h9xN3YMUT/1+CAWJxpCi4rv0MTmQGaWNXuY6QBsUIRI6n42N+qBBx8h
	 yfjF94YAjOG28Xyk3hkddp+FBSZIro9xe5cC9nreYVWSMoKBupQuefRh8IoJA4YiFf
	 2DFW7DJVwzq8JUwpc2Zyd3YgycBddGhzzup4bnwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B5D0F8025F;
	Wed, 17 Aug 2022 15:20:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED8B8F8022D; Wed, 17 Aug 2022 15:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAB51F800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 15:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB51F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eopDnIFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660742420; x=1692278420;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1YSOvPsQYHAs22ozsbK6YBFWa2vMgDcipWWuOkp53Rk=;
 b=eopDnIFy1F1mjvUQhkmGV5dxKRml48AN/beDxqVlLEarR0tWrVMLL69T
 H6lXsbZlTBPEDOaaLiqbT/zblkNvW0CBUszAXgu3Uipl3CN/7ntSIyZtk
 Po6drLjBwl8fhtQWvqWTIDTw98fQpiG1lIV+5+pi3gfgtD06vKCRPwZrq
 TjkYJPtD112oe/H4rGZT9I+FLc7Sp73KL3hirPE1Uu4clwBuZIZrm/c7C
 Fh4efJ4Jt1bjgSNazhpcTi620mdLOwOVNS8F2Fpz6Uo/HQNI6VwwoQfrp
 GCG9lphRL2A9f2NISeYvbyE2Pxk6cCgeklx614ICsg7YhuUrbSwekWhDD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="290059493"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="290059493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 06:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="583765310"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 17 Aug 2022 06:20:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 06:20:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 06:20:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 06:20:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjWKYFASXtRUT0616CLrhWXBKNvOIeZeoNtX5S3w+3TIUcCm1nWDadvyFmRsv3XL/xY7ennlERAho/WS9K2VYjYgn6iq/NRIqY0q7CWj1T9/6kfWJx9b89pX781RidpUV5+AndVOiPZwfT4rAE3iAyCzcMX00+UR8e4WYJmw+IhFZEUcRmIEAwRy4TgWEdsfYQG0Noy1TeWnteYtkWW+SdcoP8VORW1zhEBLCZQUYvkXbFfkPUWmbLZ44s4JjaG2b74gmsdgv+Oa2ctGXfZ/+WBJD3nbv6IjU5fL175O8Gu77AKBE+GkvlMfTsTQfMD9AZgsWl7So1PaGZx5fFccfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nv9qIQiEB0VD+pBcPbw0EqXmLi5bVI1D8BPmpouNMBo=;
 b=Z2tJ18E/usEXCKkYAKMSz+IGMsDAbCTLJTI6mIRMeJkEKmsis+v/R5LbOqSy/eN5PJtsi0QiJo28qFFzmA60XgmMS5ueXSg/Bwnyz14g6rQoLbOZj7J0gb4+n353tUruxn1xUn4MSlIHhg9ubfT4iZ2nzOxQ6WH1pNQ+/br6VjKMRmehvCFj+9GVtkMALVI3C5Voh1yS66roeTSDXBAazVHaUellIwzPXS/ziH1xg5hY4zZhdEZpEntwLWEXtICUVOx34GL3icthk2fYitcubyUlLqvrBap4JUFDz6S5paMzp9txdXd4NPPYAh9Gn7Q5TO4J7opoyjkdfxMu6tjjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CO6PR11MB5668.namprd11.prod.outlook.com (2603:10b6:5:355::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Wed, 17 Aug 2022 13:19:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 13:19:57 +0000
Message-ID: <c3386d45-b643-b4aa-c868-5c113cd2955f@intel.com>
Date: Wed, 17 Aug 2022 15:19:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] ASoC: Intel: Skylake: try to get NHLT blob with PCM
 params as fallback
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>
References: <20220725111002.143765-1-uwu@icenowy.me>
 <20220725111002.143765-2-uwu@icenowy.me>
 <4208aece-0aea-ba86-9a00-9e217546e1dd@intel.com>
 <3346b62c3cd7e07766457c9140849a31d6d8775c.camel@icenowy.me>
 <85648922-27df-051d-8ae8-d0e4e810198a@intel.com>
 <1891bc72834cb6e25d479c3968c04bcef94c3ad5.camel@icenowy.me>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <1891bc72834cb6e25d479c3968c04bcef94c3ad5.camel@icenowy.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdc2b463-6ef0-4602-46c2-08da80532e82
X-MS-TrafficTypeDiagnostic: CO6PR11MB5668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6t+KbAPIQ3aLxl35FDUEZ7AARNExvIIZHmYew8qQDFc/iYxtDGuHtM60J6rmiVbC6Td/zATPn/LbCESZqQ87DK1S89qJ95LzvCDat7TrZ041fdnuZrw7zlP2Xax5Cbblmsv7eiGo7zPSVPybtjg4nSnx1dP4wG73DypQgNEaO2BlceBhA1XMWf1Amro7OzFWJ7cN3sayUQwYIVNll5o5eDnWG0dSF5f33ge4NF+ejnfmORF7+dk13QhF38tTwu3q9om+Rc92d9IVcbQhysBF69u7UybVYCyxdxTfI0X442PStFxHJrQWoOoc5NN6TNJeFyLPiNXYIw5hnk+j0r5iS/eonnGuEpm0mdk3r04faUH3haA1mj7Vx3kqwTblbOwht148/l+GDiVlMQjQygHC4+5SnevLNPInapCxhNRK49UwEJv23ZH0gQHItFRnddIPOxYHukXyBAP89w36g6j/mQDs8/kOjm4C6+qGtzUN7Ye+zg2nH9x2TmLL1mzSeBwq+7b4HVF3245CacUXEA+PCGW8FbsqQzyRSJobQtO1bmE9wjgIVefeU/M0D1kdvo+eJVtacbwfkXll4m7sHHpcKmESbZD8HVPrM1hgaZZ67ndZFt31r4K/5+Kczc/5hmnpvJjPJlmCObyK3VYEZcpjewdex8OyqRqFN+NO0NmqF4owpkgduOLOXeLBj3gGd1+GF29CUl3OI/khMPNXB2LVmKgCMfW3rXpcb3GdM+RmdUxVH38ve4vi00V2sg3jFH1RSRjB4fAryfZ62qG+52+0xh+GZs+o4etgxX5yoDYVD0Fte2rDAdqsrHP7wEmORc3rB9r6KpoPF67nbsfiDgVyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(2906002)(8936002)(5660300002)(31696002)(44832011)(86362001)(26005)(66476007)(41300700001)(186003)(6666004)(2616005)(6506007)(6512007)(82960400001)(6916009)(478600001)(83380400001)(53546011)(38100700002)(316002)(8676002)(66556008)(4326008)(54906003)(6486002)(36756003)(31686004)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ay9aZCtOUFk0UHJSR3FEeHdOcjY0QStxQzFubzRCZTVEcllvV2NHM2R6UmlQ?=
 =?utf-8?B?bnMzZjF1dlp0eDdnR0k1UDJBd08vc2NadVNRM3NZTU52M0Fld2IzVzRBcS9v?=
 =?utf-8?B?Q01HM0hqdldUOUJ3SDRROXB5MzhSTkRjMndNYzN5VFJ1Tm5GeDNydnBJczQy?=
 =?utf-8?B?T3NVSTFuUEZaZGFxWXBTN21yd3dtYnZJMHdmSFlIaG0rVm02ekpIQk54WWRx?=
 =?utf-8?B?cERvNDl5VnphZWlVV1RZUFpoSkdJVEFXUjQyNk5rcDgvUjR3aE16WEhRRlpW?=
 =?utf-8?B?c0FZclBrSmJadUdRd1NmcTVSbW1tZmlpVkgrZHVnNENyUG8vV25LdmVQN1Jt?=
 =?utf-8?B?cUxEUER0dThKMis4Q0VobWI0VmlaRDYyYXM4cjQzK0JVMDN2cmhtTGtybUdE?=
 =?utf-8?B?WDdmYWpmNUk5V0ZkcXVkVGZHSFNBczNmZ0FiYVFTeUsyMHo4T2p2ZlNUcEhT?=
 =?utf-8?B?aWhmdE1nMmNSVUY3ZXdSYTRCMy8zVVl5aWJaeXZDakxGUk43bHMyK1c1bVVu?=
 =?utf-8?B?TlhnTTZpa0NJbUQwRjNQSmlxSUF5YXdlSXJFWFR0T1paVW16Q0FSRk5EZHFw?=
 =?utf-8?B?U1ArWUIvMzFWS1lBdFRvcFhEbUdadjgxTC8vMEpIWmtTSElOZGcxU3lTbGk3?=
 =?utf-8?B?Y3ltNnJFYTZLL25md3BmMGFLaXZDWUZPaTRqOFo4VXpmVUJKSHdEMDdkZnBI?=
 =?utf-8?B?c2xzVG9tZUxoWWpBWjV6VTBCYVJnMnQxelVWTkY4Z3dqU3E5L2dFT3hlVllO?=
 =?utf-8?B?ME9VTUtRRDNzb1BicHAvdHhmS0xmSkV2NVhhdDVqYUxhMFd6SHJJTnZ3dTE0?=
 =?utf-8?B?RTNwRVY3eHNOMWJXN2U3bHNKOUtzWXk5bzJXcWtyeXYxOUZUUG0rcTlPQ1c4?=
 =?utf-8?B?UHh1VkJIWkMxVzhhcVNZNU4xNXBQUWdNaVZjaFZUcEhCd29ONjg4OGVVTmlU?=
 =?utf-8?B?Y0E3elZRSFhqTHlCUFlyZUFOM2h1SVEwaGZDbE1aMmllQVlVUXlwSmxsa3BS?=
 =?utf-8?B?eVpGd2Rrc3lyWFJsWm9Id1RaR3BwektRc3NJaXVTR1NLdHYydDd0dmcxUWdD?=
 =?utf-8?B?dXBZaTE2aW9KdURMeTZXUVJLL0pCMzR4YkZKaUxmUnBtZC8wa0s1VlF6dUdG?=
 =?utf-8?B?Q0VVQSsrdVJMYzQ5QldZNFdGcEJaU1ZUVTJ4T2dZREgxVnc5NjNyaG5CQWZ3?=
 =?utf-8?B?UFlRWHBPNVJIbTBiSHkzTUxYNGpvZGswZ2tCemlPTDZvY3JzeWhRVUsycysw?=
 =?utf-8?B?NVdUWmxXUGVLMXc0RS8wOC9sWXdBdk1sTnBGMW5ObmtJZU5uOS9leDZSUVZF?=
 =?utf-8?B?NlMrVlk1TFdZc0Vmd1VIRHRlQUZyQ0tRaDFVa3paMUtrbHdETXhmaUxKTkJH?=
 =?utf-8?B?by91NDdQRVQ3SCtpVS8vbDNSR0REaWV6RWxseWdsK3ZKMDlLWXNnbGI5L2Mx?=
 =?utf-8?B?V2R3TmNHZGNpbVRzb2R5Z09MU1h5ZlY0U016T2I0RHE0UzNlOW5hbWhDZDdG?=
 =?utf-8?B?dUQvblRCbVNQY1BKNTYzbHN1MmpGeUhDYy9ZZVhKb2VjODFRaUpSbFVwRkdj?=
 =?utf-8?B?WkdlalJpUlhsTlhpUXBLWHZON0lJWU5TSzhQK2gwc1FNQTBoamRyb0YyTENW?=
 =?utf-8?B?ekZ4bXRUT0NURVJ2cVJhWHJoMEs4Q0pzNnE4OFJGV1hFQXZXRFZsdVhJMDlq?=
 =?utf-8?B?Y2lDSHo5SU5JNEYzblpPbmRCUlRHMThpZXNsbHFhWHFxNTBqVlBON1RtN0Uy?=
 =?utf-8?B?eHVvVDlvcEIxZjNWVncydmREakZ6YS82eUFLWFdmSnhacU1ZekYvSmJBckVw?=
 =?utf-8?B?dk12RFZjZEUySG93eW9DSXhpbWFaeU5ta3Roc3I4R1A3U1JabW92ZjBZS1hT?=
 =?utf-8?B?aG9iK2M3dzlENmlXT2s4VlBjZ3l0ZVBmSURXK0xoWkErY1ZGWmJZc2hHYmo3?=
 =?utf-8?B?TlpKNUtDZC93SFNNRmtqWFZJNHFwRlFGYjhMU2w1VW5NOWgvT3k5aTZYQWhV?=
 =?utf-8?B?b0c1WUthZ0NManRrWWd5OEQ1eDlORnQ1YWNNNlByRlJ1TDFqVjNLei9WME80?=
 =?utf-8?B?MmNRRGM0SE53WWs3ck5OT203Um9rSDhnc25zR1RXcEgrK2UydEh3bWN5Z1k4?=
 =?utf-8?B?L2JscjlmRnVZcU9ONE9TMGhwM0FYaVhPT1c4QWI0bS9hRlNNQXJpT2E5bEFF?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc2b463-6ef0-4602-46c2-08da80532e82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 13:19:57.8370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfRWmjD/5Rd8SdgMkR/Ju9ZWKU1m4FHYOTS7keFSGIjjn21Cu+CESM6BXdZZIdIDtvDHKpHt8KGaRC11U+uqgSHLrHjf7thxIZL6x+/uHns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5668
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-08-17 2:48 PM, Icenowy Zheng wrote:
> 在 2022-08-16星期二的 21:08 +0200，Cezary Rojewski写道：

...

> 
> Yes, it's Chell.
> 
> BTW do you need other ACPI tables?

At this point, no. Thanks for confirming the platform's name.

>>
>> ..and at this point I probably know more than enough. We have tested
>> basically all of the KBL and AML configurations when fixing
>> regressions
>> during recent skylake-driver up-revs. But Chell (and Lars for that
>> matter) families were not among them as these are based on SKL. I'll
>> follow up on this with our partners and come back here. I'm almost
>> certain topology files for the two families mentioned were not
>> updated
>> along the way.
> 
> Could this be an issue of Coreboot, which generates the NHLT table?

NHLT was left alone across all the updates. Updating it is one way of 
fixing problems but I don't believe it's necessary in your case. 
Topology update is more desirable approach.

> BTW I think Google pinned the official OS of this hardware to a much
> lower kernel version (but I don't want to use the official OS because
> of limited storage of Chell and lack of VM ability of the OS on Chell).

That clarifies things out. Guess the kernel version used there is v4.4 
(plus a ton of un-upstreamed patches). Again, will propagate the 
information up the chain. Perhaps one of the solutions for end-users 
would be providing working UCM files to alsa-topology-conf repo so users 
are not powerless in situations such as this one.


Regards,
Czarek
