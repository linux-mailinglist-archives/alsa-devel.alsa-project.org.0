Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815454A387A
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jan 2022 20:17:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E82B41666;
	Sun, 30 Jan 2022 20:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E82B41666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643570220;
	bh=cz1dS7Q4AoKwaCswORlPyRCVEjJVtSjwaFXpHHO7OUg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nAI3XzPq2vt1rl5emTj83n8Q63W313+1kM3+8/W19Tgh54WE88sp4SeNC/C/wz+0F
	 1nGpfEfGE7ZQA90yy3uao7ypDWxaSrVZzl1ZXugAIX+YziB6aowWW178vl91viZNIY
	 eRaORKz+eCA9RZ5uT/HVVEKtALBwPRT8rT614zgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 529AFF8013D;
	Sun, 30 Jan 2022 20:15:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E4C2F8016B; Sun, 30 Jan 2022 20:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_155,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0F7AF8013D
 for <alsa-devel@alsa-project.org>; Sun, 30 Jan 2022 20:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0F7AF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BFciCSoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643570147; x=1675106147;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cz1dS7Q4AoKwaCswORlPyRCVEjJVtSjwaFXpHHO7OUg=;
 b=BFciCSoJ5zLVdTSh5l4e/DpJIwh1zwfUF5BDw+gOWQytuZUCCcWSeBue
 BwtxJU3Sew7I88YyPA4PZguCbJWzycl/JoM0CKHZVhtfjTpuONU8iHWLD
 SAzcEYZIaG81HkyUFQWGxcm3lP3mWZ6oaATdr7FZ8lk6mevmRZGIh7X/J
 oykjEGBnNWayl3D33Qmdp+3nIJM/cB/hzpDWtSrVsqNphjHeBFK8cbYTt
 Ma/R0o053WdItSBIJsxlpywN17LDbt1tyJ0QF33Ug+OkHeAVXFTcWekXk
 NMXeDcW/QT2JUvw7nQxHa/4mOfQGcJMqhdqEZd49zCQ2a9q+IQ16zBGGg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="234758811"
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; d="scan'208";a="234758811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 11:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; d="scan'208";a="536835009"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 30 Jan 2022 11:15:37 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 30 Jan 2022 11:15:36 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 30 Jan 2022 11:15:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 30 Jan 2022 11:15:36 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 30 Jan 2022 11:15:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1u6c633/j4LS8GwH0hsAOo56dz4tOwkcueFknJyPObxwv4tvWhR98lJNcw7P9K0TrUdUIAfDNIrSu5sQ4sxePVoDfsSma+05AaDOFN9d/TToyQGdDvS0fordYsxy1OvRHVTIC9MysN/PA4aHNtk+QTVb2odvttvP3PfBRrgNC7DpyDdkH7NFUWTVuTS6jLTqsNR9k6AMzJvNFHNiBgdH0oGwB/kt9GPtBUq086T7YDfgjTf3VrhaRExd9Iq6ySdYD7Xk1IhIgf6ANDZS7U/eRzf+RvKAe8JYpOeY/W0QPOBc/QzD2cS3jI4HRabotvBWNhi58GYzZWAlnPu7gKIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9adrOYBv8CVEgvAIO/KWULJWAOl/F/5DCq+oiqloJdM=;
 b=WJaiJzNEwEmP/K68rqWum6RcfaSRNJk/IGYJh2zLGu3owYQ0/NNAbNKNIzt6aml3jn1lhr7AavP+il8t7G2vmuwDe1I7xlJmgXWuuwC0XC0b2fOCEosXxYmtaZkiyByo+ifBVRtX+3GjUS08GaV3c3WTSnbVZkk8CSUioyV5wjMFuIkB4DhnxZihU4UA92WVGRPJF5RXroTqZpQ6QEWRnHmlV0DUyn2spgKDj+Cm6bNK6D59Ivfl55KdXuSBPjGH2OwupXInQZ666tq8rm6DDJm7EJQ44AQ34DAv1j6WulCzWaPmwALH27A0AN3154XXkc2mr3T+Bqz8VjtIY+d8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sun, 30 Jan
 2022 19:15:34 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4930.021; Sun, 30 Jan 2022
 19:15:33 +0000
Message-ID: <ccb2f9f0-e9fa-3215-f623-bac58b4c9633@intel.com>
Date: Sun, 30 Jan 2022 20:15:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
 <YfQhIoXTkzO9AEQc@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YfQhIoXTkzO9AEQc@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0501.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::20) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93e1bf0c-331f-4f2c-e261-08d9e424e322
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB26780C3844C65DD85F8E78A3E3249@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yI3zMWaDz4LRWz1ExCNjRsCTFUFJ+BlJFFq+R59pRW32AWNwwaXJAdohKwHOGaIRiPr1/i3S9JEZALxhb3tbvjYW0bICGIt7hDkKxuT3BRu3PXrgrcSBU0z+92ubitt5vrxIry22ZwCb7oCR0cOMOKgPqRhGK0fqPIJGGlaIHYXrWsi+2D3WfA7PmVOtf47yzQJOrhF8HhRzfTp5gZYLvXX8tnpV//SGnwZH59MlMCX3F+HFI6Hn7TYe1dohq2nzOboMYm8tymspVWENLEB2arNVcfzDV5f9BAqP2ff7F7k9U4X4oFEMK3d/tFbhvnzMX6k/7qVvumIBOyEdqHznM50Yql6QD6cok29jOo3JIm719xEuj0+RfI9Q5v+qO+AmL1gK6gmEB17JOMrcf1Mh1vYJex0Z1RB8F2LBSxAfRxGPy32cun9wPUYF/bZE7/dg7Jnn3fZEsqPdjEHoebUdoyKBuGPwk/9MY7I2op+5+ESRB5YxwBR8+hxMKJfh0T8CMgvnTV2Gx8L045h74A4Te8cxd1r8C+qHcHqJQ5C27uUS+JIadnFVfXmwiXsbYjQQNdUJeB8JqXyX5/zfiUTcnhS8g76Q8osqYi5o2JBXFcSEzWunYUL61fbIWJ3EMCOfVEcFrODiFhnXeNkgqzeYT3p0auoJWEYPxcOcqWKP/S1Mz0DPmEGgIlPKh5X9PGIbVsl1+oomk9M5Tf3ZqKLNJqzk3BVnQtcGsEhp7QZq02Yg8aEYMbF/xedyLJPKEhZ1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(6486002)(44832011)(82960400001)(508600001)(38100700002)(26005)(186003)(8676002)(86362001)(4326008)(2616005)(66946007)(5660300002)(7416002)(83380400001)(36756003)(53546011)(31696002)(6506007)(31686004)(316002)(6512007)(8936002)(2906002)(66556008)(6916009)(66476007)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L20vckN4Z2RFL2hqLzlUTGRnOTFwRDFONm9hMTdPVGNpRzdVMk9zcWhmYUgx?=
 =?utf-8?B?MTRMSTl6UUEwWHphSlpjZGUya0pKejkxQ0NqYmppOE1yRHk5SCtmbE1GQkZY?=
 =?utf-8?B?cU52NHBwQWs0NUVBU1lvbk0wcjFYbSs3SXNJTVVGWmZYRFBjalFKeFpvSGF4?=
 =?utf-8?B?R0NwRzFFYmFkc2I5USt2cHgyRHNYL0JGa3phOGh5QkZ0eW9ZaUJCRktMOFh4?=
 =?utf-8?B?b1cyREZIem9wdUdka0ZvTmhMUnBaNnUxNzlhV0IyakJOMnE5RVJXYXVUMnpJ?=
 =?utf-8?B?VGNWY2l4bWtSdWpUY2ZOOEVnK1lSSElQcVM3dmZlS2REeHBiZUdaVFI2c1o4?=
 =?utf-8?B?VkhwTmZMQmtnZGx3bDNIZlQ3RU9IYi9HSWJ6aTRmVERNbUo1RHJtSXJlMGVx?=
 =?utf-8?B?QmNydDkzclJ0YTZySExWYnNYUVZIbzhiNlJSTHFUUkNTUWorVkFPQ0FIZUdx?=
 =?utf-8?B?eDZvcTNhWDJrdFVLL25TNS9BWjY5K2tHdDN3RnE5eCtQTVFOR3dmQ1MzdFY3?=
 =?utf-8?B?TzhTelZOWDNzSmt2c1d1VkRFYTVzZksyeG1uSVRLZmFNeEFsdXFGN0xYZTVq?=
 =?utf-8?B?bCtTTnlockJldEFPVzRQcWp4SDF6YUMrSjVjc3V1QlhacklNdWd2UnBncytj?=
 =?utf-8?B?dHI1WE1KeGxJNUdSWkhrWkFsSEthTEJtZDVLLzhDOUdQMFpDN2dxa0w2N3I5?=
 =?utf-8?B?ajZxS01HYXl1UU5tT3h0UzNQZXpQV3IzS0h1NHlPak1vc1gvSlJjWXFSNTdG?=
 =?utf-8?B?dW1YeU44dUkwckRnRkdxdGE1ZGZBTEJOcHZqQ01ldW5wZkhYOTMvbmEzRWVO?=
 =?utf-8?B?K0Z0c3FmZ0Exc1JwdjFCUlhLbXNHNkY0TzFxUUlHY0E5VDhmeWpBcFg4MGxH?=
 =?utf-8?B?alhSWjNkZGhOcDdKeGZ5RzduTHJ6R2xUeGo4YzI5UWV4L1NOU0pibFhudDdj?=
 =?utf-8?B?M0crWG9sdVE4ZUFLSyszcVc0SHRMRHJRTTFWcEp1M0NzTElBbGEzUXYzdWxn?=
 =?utf-8?B?TTc4dUZydlpVc3MveWVKeFQrRDI1VUVlUmlkbnNoZHJ3bkg1VHNiaElxd3pl?=
 =?utf-8?B?b1VKcXpaZmg0ZERtY1RJcUxUOGl0RGtkYmFRdFBBRURlcU9EdFhVc3h5SGs2?=
 =?utf-8?B?TlFwaWVpUlhJVlRkaXdDS0oyRmJ4ckVzS2NWRnZpNHJJT2NtUjFZSGpVUng3?=
 =?utf-8?B?UlpXNld2M1VjVGtNUkZYSWlGaGdZcktFdEhqamdQSG5lNURuMm1WeVRGOEs1?=
 =?utf-8?B?a1ZCVm1JRUpuN0hweUk5eVdUKzdpRXNyaFVGOHF6TUN0OWM2SUw5eERGaDJG?=
 =?utf-8?B?UUgxdm83R0tsaC9vMWl4Nks3Q0l4bTlMTG04VFV6RkVTVVMvR21pWHFrQmxG?=
 =?utf-8?B?VVFNNjNGNFZwcVRYWUladEZpeHlNakFBb0dINzNTM0F1M29BbjNFaWZNejlq?=
 =?utf-8?B?dVNQRnhIcUh1SDV0SUhPeUgrdExWOURHdHNUOFBMNEp1SUx6eUdiVVdSMVBr?=
 =?utf-8?B?TW5ON2Z3MUV1cnZ1Tkpneko5R1lXMEtQOUxIV1RkOStQaGtGbFg2MlhXcGxB?=
 =?utf-8?B?YlBoam5lNkpYaEdxRTZvRzVERC9INmQ1cFU0U1ZRS1BtekRRTk9EejVCdnZR?=
 =?utf-8?B?YkkwcXQ2QkFva004cXJCSTBxUnZFSG1yYU8xWWtVYnZYc0xhRmhiRVBWR3lR?=
 =?utf-8?B?WE5PZFRqRXFNbTZVbmVSeTIxQWdTQXZrYVh0RHc5cG5tODNJTk9jOUpPNDg0?=
 =?utf-8?B?b3ZNeUFyYUg1TU5qZjJHNGREdUZCQlVGVklGeFVEVytwVjQ4SUlnWnVtWVFv?=
 =?utf-8?B?NTVZcnN2Sng3empFbUkrVnRteGtKVllUdkptazlzbW9yZjlOSmQ0d3d3Vkdv?=
 =?utf-8?B?bkkzRS85NmJTVXRURmhnWjh6bWdodU13QWNteU1jVDZydTViWFZKME0ycUhF?=
 =?utf-8?B?UDlDNG4yWnZWN1Z5dDN5Q1VXN2xDYkNVdmo0VnZFL3QrbGtOMmpPS1BrQXQv?=
 =?utf-8?B?Zzg4SXh0VmY3U1gxa01tcVlhcGladSt1NHBLR0hHUVAyK3dGWjk2TmVQelVy?=
 =?utf-8?B?SU00UHo1YXR3dmdudC83MCtIanpWWjFVeFNTNEN0aUdxSjRXc3lxYUtCVGhG?=
 =?utf-8?B?Z3pVYWdFdFplSUJUZkxydGJFMTVwdUdybXBWcFExRDBXTlZSRjhYLzhCbTgr?=
 =?utf-8?B?cGN0S1pteU1wUzdaMVpTYnZQaUhIZFdCZzFMOTcrZkQ1TTBBMy9kcGRGclg3?=
 =?utf-8?Q?aZXJrfekbaJbIHnq/bKYGzyqRJiO3cBUGAC43dq8XQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e1bf0c-331f-4f2c-e261-08d9e424e322
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 19:15:33.2854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbWpAoRgNvXoBytCUezHEV7b+Uo8XndTApxCP3ez4AEkdI6UDC9/+MCU4SYDDHFLWLkzRwg9FmpSi7XPqofsnJXic/xRJHiYOY51KsTtAFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

On 2022-01-28 6:00 PM, Mark Brown wrote:


Plenty of good comments, thank you.

As there are several subjects that are part of current discussion, in 
this reply I've decided to focus on 'avs_path'. I'll continue the 
discussion regarding rest of the subjects later on.

> AIUI the firmware itself has a bunch of DSP modules that can be
> dynamically instantiated and what the path stuff is doing is providing
> fixed sets of instantiations that can be switched between.  It seems
> like it should be possible to pull out the bit where we have sets of
> modules we can instantiate from the mechanics of knowing what modules
> are there and actually setting them up and tearing them down, other DSP
> implementations would probably be able to benefit from that (at least
> the larger ones) and I imagine more advanced users would find it useful
> to be able to reconfigure the DSP pipelines separately from getting
> firmware releases.

There is also a notion of 'pipeline'. In cAVS ADSP case, almost all 
modules require parent pipeline in order to be instantiated. Mentioning 
this as modules alone are insufficient to create an audio stream.

'avs_path' is a runtime representative.
'avs_path_template' is a recipe for avs_path. All templates are created 
during topology load procedure.
No modules or pipelines exist on DSP side until driver begins the 
(CREATE_PIPELINE + INIT_INSTANCE) IPC sequence. That happens during 
->hw_params() callback of a DAI.

So, avs_path_template provides a fixed set of recipes to create concrete 
avs_path what effectively creates modules and pipelines on DSP side.

Mentioned all of this as
	_fixed sets of instantiations that can be switched between_
in my opinion implies existence of some sort of pre-allocated paths 
(modules, pipelines) on DSP side, what is not the case here.

> I suspect that at least the template could be pulled apart, and that the
> DMA ID is identifying one end of the pipeline which seems like a concept
> that could be made generic, even though the specific implementation of
> it is going to be firmware/hardware specific.

...

> I think part of the problem here is that there's missing framework,
> coupled with the scaling issues that DPCM has.  Ideally routing in a
> digital context shouldn't be fundamentally different to how we route in
> an analogue context, there's new bits needed for format management (both
> tracking what's valid and ensuring there's appropriate conversions) and
> we really want to be able to dynamically add and remove purely software
> components.  Unfortunately work on actually implementing this mostly
> stalled out.

path-API found in path.h is limited and maps nicely to DAI operations:

avs_path_create()
avs_path_bind(struct avs_path *path)
	used during DAI's ->hw_params()

avs_path_free(struct avs_path *path)
avs_path_unbind(struct avs_path *path)
	used during DAI's ->hw_free()

avs_path_reset(struct avs_path *path)
avs_path_pause(struct avs_path *path)
avs_path_run(struct avs_path *path, int trigger)
	state setters, used during DAI's ->prepare() and ->trigger()

given this picture, one could say that there are framework elements that 
allow driver writer to implement whatever is needed for DSP-capable driver.

And now back to the _full picture_ that I'm clearly not seeing yet. How 
do you envision interfaces that should be added to the ASoC framework? 
Are we talking about soc-path.c level of a change? It would be helpful 
to have even a single operation (from the list above) drawn as an 
example of what is expected.


Regards,
Czarek
