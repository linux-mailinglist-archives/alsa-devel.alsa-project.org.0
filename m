Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517D604063
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 11:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290CB5555;
	Wed, 19 Oct 2022 11:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290CB5555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666173212;
	bh=rqXJgDSsiKul1/OBzIOQUtAs0Yj3sZ2nc2hYygvJeBM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4BAS5hHVhEiztMB+/fE3EH/czp43NCSlFwLgUmGPFCDXR++43Iq1BCeQATnqEj/a
	 TmB/sz/QYJWz/v6CRUcTCvtJOYdrKK3qU4YuZMPh0iwlad/XDbm9gwOQWM/nW/14Co
	 iBbi5YAZ1yXxKQgZ4KmXgmQ3Yhld6XrefS5ihSoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B79F80087;
	Wed, 19 Oct 2022 11:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F5DF804E0; Wed, 19 Oct 2022 11:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDA30F80166
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 11:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA30F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PIGwvKMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666173151; x=1697709151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rqXJgDSsiKul1/OBzIOQUtAs0Yj3sZ2nc2hYygvJeBM=;
 b=PIGwvKMYaMsoQ56bRzDbpFVE0VhaQ1SerHOp9NQ2x6FGtbpp15BPIpho
 0H2JcVv4BYeXHIVFcqbDKC8wwvtBTuAKtlo8r9CJzn9BdWMuqOTJMQ67X
 b+BQvKnXxdfes6nwFizsBd+u7oaG4c3kCvVIymK/pSC5P6O/vyYje0iQS
 ona2ipn/gXXKYPMVOyEdGgWsEwXnzRE1P6fGw8lU59dIc0hoz37odor0O
 Ze+otX5/jMTLcn5uAvQljuRXzrbuMHrbPF+UQkzyyew/aODtHxjS/cF6d
 DkK3S2NfsNZhh1MZV7ZmIKbyGHlZM6fWjp7xgzeddBdvIJRdUgnQDPPZl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="305098716"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="305098716"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 02:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="607013255"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="607013255"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 19 Oct 2022 02:52:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 02:52:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 02:52:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 02:52:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 02:52:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSqdSGH2EITcmCoSH99mL/+Wc1wF6I+PTymyIFPMvByNoalgfqsx+m7QGdiRxcqmCRGZ82Qk96uVWvIRLD4hEGxuxPRGGECXV5/oW+6A86kxm2c+RSYWjexg1D2DxDext7h85mf+U3iK2+VYbPRgSFCQj8MHYuYuI1F1W1CzLSfjbnCUqh2korfBUbliheOMhzs+tfG1tnqGrRJuaTGXdWG7DRRrjK8qnziCwm8vlP2WffM/yCNwZFHXjj1KgFCZUVR/UvVloB+NUheRTZyWk8Thp5JVl1zZNtzV5ocEiGIiZMG1HQmt9nX4WxmM9H6RN6YE4g7eHy1NdmFDbNiUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpkI1av3aDnSy67SrRUiQCpahHmDvLysU9fUnuT968s=;
 b=OUVmwSAPDM+3CrR03J8CRXH4QpGpd4OV5tUWAtTulQawFs2yS5hsHGUpSqv5RrluHdp5yftBzeo8S30mp5yr+WQmHz3U11hP3MxKhIiLnwN4zS+1gLU12DrfqxMA793FBSMqhK5N1tp9aFxihFrIyLVMwHNrNjPfcLwlbNDkamWl6th3Za2N2wDS5gLXtf74rP3GU2WaX4s92Hu2hZLQX6oaJ8ENHxuOEpNq1/hdlTDmFSyffGwOaniElk6ka/dq4JMqh3fa1AHl10YGtZbPk5eLXMs78YlRqBFreB5d/d/RZWUbMm8hbDLI20kyyM6yJw7QbImvNeJ/qUj74pgPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 09:51:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Wed, 19 Oct 2022
 09:51:58 +0000
Message-ID: <28d040a5-52dd-a8ac-2217-7f71cbf8e905@intel.com>
Date: Wed, 19 Oct 2022 11:51:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
 <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
 <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
 <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a6924f-4520-4c64-b127-08dab1b78fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8il5zp0I2xg+eqIcPVc04NQAwXSD9CXqobWBt7dKayMTm7SYP0DWdnCaqRuT+fAYS33kGbzhWyV55NuTQxYcEjcNAosgElLkFoGw4cEHc7jZfFHBGj4T5WB/QRY/kNMeDUKc7bTAYch6UwN4/Lys3XzaTbWdDj6BI++DlZK8Zv+9dDXstBM1/+rqpd08zct10lTFnhV6JawGRIV29RNgrBgeTZPzM7Cqe/sYrRklRVdAY3mHGWKaUAPJ+TO4GP++JOUfhbFS65eGw9h31aZkJxvG5/dkfFzWXF+syfN7OL6c45/GW0Rj1zdLSTTTOi2CuKwCPLHi37Y+SGIT06XI8gFzCvBth0Wt9FoDsNBCS9bNBODfh7Xz/KfxcvkZsB8cT1FKD9WGUtQNVLc/hfIFHOEo7Gbc6E9DCXFCrnQZbkSkoRerZ8taCu4S/9N62zAGccItLBvg+zaTxgbTRV25UvEBpST6r3qA+nJCBMLbw7e9JpOXM1fWJ8I5D+kOD2pE5kLL47oGb8gOFAekakBRlMKQ3k01h/xQ32aDsdMY8Nff3EhhBcsVdKxzNe6w/CDRbV/iRijSWH6p2vZAivOIDQApvSKfzSITJKUgVJS9qzqfQ5AHvzkEELMwhCdtkBW16EOp/aGECj5EpJcFnIA1h25vddb8HowiUgHZVM1ydSPFYF8qeZCPXZ10qBWOA46i6lwK3eN3nQ10OUMdvmYxlMCf2cbR6ek4aHAgJxjBhA2LtIuftX+UUZi1tHfZqUasAhX2KzqRySYqIJm3Rwt+CLRO4m1/vfxIlmZvT6jkDOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(110136005)(44832011)(4326008)(5660300002)(53546011)(6666004)(6506007)(8676002)(66556008)(66476007)(36756003)(8936002)(316002)(6512007)(26005)(41300700001)(66946007)(38100700002)(82960400001)(2616005)(186003)(2906002)(4001150100001)(31696002)(86362001)(31686004)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXdmZzZxTkx1RzFjalJ4WWNLODlSWUg2WmVmc0hMVy9ucE9FWTFYakpSVnFr?=
 =?utf-8?B?aThQa1BLd2Q1RmNyd2Z0NTh0eEdKcThmenAwOGtyQ1FDQXZzRkxIRVNEdTNn?=
 =?utf-8?B?QVhZemErMUxGS2VGR1ZBc3NlQ0YxNFdLbnVwSW1wYTQzY01PVzBKNGRLRzVn?=
 =?utf-8?B?SGEwaW9rVGZCVERUQ0hjUFdnMXg1OVQ5UXVBdUdsUjJDVUJTdnFwMWEwMHVs?=
 =?utf-8?B?Wm9MYVU2cEJTUWphU2xzQkpKdTlVNzdTOUk3QVV6bUJ5d2ppUEwwaURpcWVv?=
 =?utf-8?B?UlFxcnViME1GUGwyVmZWU3lCZ0RueVhvS0NodG83MDM2TVpiUUd3eUpSOVdF?=
 =?utf-8?B?Y29mdHQwT2hQSm0zT2F5bjRRYThjM3krazR2Ym4rT2gybk8wd291TXk0dkFV?=
 =?utf-8?B?OEdCUk0wMVJZM3F6d0FON2t2ZThuNkRqVUpGNHVWUEtIdWNJd3FiWDdBb0Iv?=
 =?utf-8?B?YktpcG5odjEzcXNKVjBqLzNDK1phamc2dXlkb2JidTg0cktwQkczTEJmbmhp?=
 =?utf-8?B?UDhrbDFyaGpzdjRJb1k2SkY2cGJ2RENDaTNnVTM0Zk42bXBWRENnaWpIemlS?=
 =?utf-8?B?d2N0Zk5ORjNKYWc2MWNlNitzMVJvMis4SWdUd2VGOWhqWHJYQVcwMWthS2xD?=
 =?utf-8?B?TTBpYk5DQ3lZWjZGcmVhMjNBb1YwaDZkSUdMSjAvSjd5TVZ0N2VJWVhMNm40?=
 =?utf-8?B?dlFQcW5QaGFXZ3ZjR1Z0dFBxL1g1VTdOSFZiMitNQXNRWmlVT0F1WHVIL0Fx?=
 =?utf-8?B?NjFYNk9hMWE4R3oxYkRkN2J1UnNNWnNpKy9HZ2N5ZVJzL1hSVEJXWS9Gbkxy?=
 =?utf-8?B?bDJRQWdlVnZzQTZ6Y3BNeldEZUM1bXlIdkpqaUhWd2FVZGtuWXFNam1hVGk3?=
 =?utf-8?B?cTFPbkR4MmZLMEtLSzNRaXphdDN0blFQWGo5aDhIVHI0Y3lRR280a1d2RThp?=
 =?utf-8?B?dEw5T2NKMmxseWZrNGcwVFBoMFg0ckFQMFI5WWhJUzViSWk4QlFDVy8zNU1n?=
 =?utf-8?B?dlo1NFJuV3JMNXNwYTM5dVdodlU0U3VZV3E4MElvaHIwd0IrUElCbk1ZRTFa?=
 =?utf-8?B?MXBoUHBIdFd3UUJaRHYzd1hHdGs4bXVuTUhjY0FOb3RFZXE4NTA4cm8ySHcw?=
 =?utf-8?B?NStLMjhpYUhYVjZ4Q1FKWXp4TllkdEJJZG9WUENTY2J3cmNhemFjQXh5clJj?=
 =?utf-8?B?SVlZVjllVmRYRHE3cmo5OHFTT2MwdjlmMU1RN1ZzejBacW5PN2wveWdCT0Vo?=
 =?utf-8?B?QlkxZkU4MU1UM3NScXVnUFNCL1FveFNseTl0eStpMlpmeEc5VXB2QTBJZU1r?=
 =?utf-8?B?b1Urc0cxMWZYMjRTTnBDWktudTlnbC80N2NSRkJ2YTFEMXdtd1pLMlhFRUd4?=
 =?utf-8?B?T2dpbjVrMm5LeEpFUWFVR2JrNkJmTGdEanRPVEhxR3VpYnpOZUxndGNwdFBy?=
 =?utf-8?B?NUI2a1FQdUNUN290bmVoZ1ozWmZGU1ZqOEU0bmZHSEV4ZlhCdnFxZ1k2czdr?=
 =?utf-8?B?Um1tYlNpWFd0RW80Y0ZFOG15enFIcCtCdE5IMEdiK1g0SURQR3FvSFZMN2xU?=
 =?utf-8?B?VDFkeHdaV0ExZXFtNDZ3Umx6TGxwZFFXSkNiUTBuUVkvVU9JblMxeGNMVWsv?=
 =?utf-8?B?VE13SjVvRTV1ZW5kVVNPb0lkTmZ3dm0xemJ2NXJEQVdLUmF2QmpvZFJwb1dk?=
 =?utf-8?B?OTg3VjRlczc5ZTU4YkxkMWI2eGVQRlRkcXZzbW9ET2cxVk9JTEFROW9EVUlS?=
 =?utf-8?B?RFBqdUkwVHhwS0tlWGJqaUN5bDd1blFkbTl3QU5TRGZib2FxNWR2OXB5VWgx?=
 =?utf-8?B?RUg4N1gyNUlvRDhWY0VpclhQUjIxWkFKYjNEUy9TbG5lZGRzNy85c2I5enMy?=
 =?utf-8?B?eUhMbzJ4UFE4bVZmQzMvYTJLM1VnZjdvWHRrRHlVdEJWSGJsZEZrL0dMWWVj?=
 =?utf-8?B?dzFrOHRRTGgxNXY1VysvYW1SMnkxa2ZYUW9ZWmgvRjBFN2gyeWpuVWMvQm1o?=
 =?utf-8?B?c1pMa05heVRNcWNOdHdsQnNXSGpKWjA1RTFBcStROGEvdTNQNE0vTmh1dTFR?=
 =?utf-8?B?aVhXY1B0VUt6SlN2MmtscUZZSFVOMis3WVdqbjFIR3BvT1FRY1JVQ1VpZU03?=
 =?utf-8?B?dklpYWdTS1dmdTI2a2hnTW4xcUFVM0hrQzFvOWxoVVVJTUtEM3h0WjBUZUY1?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a6924f-4520-4c64-b127-08dab1b78fcb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 09:51:57.8312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jR2NjGADxaIpvzsFaUIAAG7sUuDRFgEDJUUKBZnN/41K4PhowBmX7lQnxEjidri7mMwY9ZTOBkgaDQ8ymHZFujqeKjUSwbFFSa1fwyQ9hQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
X-OriginatorOrg: intel.com
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On 2022-10-18 6:37 PM, Pierre-Louis Bossart wrote:
> On 10/18/22 10:46, Cezary Rojewski wrote:

...

> We should not debate on this mailing list what can or cannot be
> released, not make any distinctions between Intel and others. The
> library handling mechanism is generic, who provides the libraries is
> irrelevant.

No problem, leaving this out of the discussion.

...

> You're assuming that it's the same exact set of binary libraries for all
> skews based on the same SOC.

In majority of cases since Broadwell, that's the reality though. While 
theory may say otherwise, we were (and still are) releasing 
generation-wide builds e.g.: SKL-based firmware package, TGL-based 
firmware package.

...

> That's not necessarily a valid assumption, it's perfectly possible that
> a specific OEM decides to allocate more budget for a specific feature
> and less for others, resulting in libraries that are recompiled,
> optimized or configured differently. The UUID is a weak notion here, as
> measured by the same UUID being used for different DSP generations.
> Nothing prevents someone from generating a slightly different library
> exposed with the same UUID.
> 
> We didn't want to restrict our partners and gave them with the ability
> to put both the base firmware and the libraries in different directories
> and overload the default path should they wish to do so. They could
> decide to point to the same directory if they wanted to. That's not our
> decision.
> 
> If you look at all recent evolutions, we initially introduced different
> paths for firmware, then topology, then firmware and topology names. The
> logic of adding more flexibility for library path follow the pattern of
> trying to avoid making assumptions we have to undo at a later point.

Thanks for the elaborate input. The evolution sound good, and is 
perfectly reasonable. My only feedback is - should we put everything 
under /intel directory? If all the paths can be customized, then the 
parent directory needs not to be the same for every firmware package 
regardless of its origin. It's counterintuitive, is it not?


Regards,
Czarek
