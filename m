Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1DB4D352D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F38173E;
	Wed,  9 Mar 2022 18:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F38173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646846171;
	bh=tmLxH2g+EgDbRqsU7GvDAoVCFDzwo7gHR1foq7+YIKg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KHLdzY2CjD20QcU4zM3ou7hyN+XTDWFlTuX2OAMislKBYEMoJmyRqNnZWqylFcuMr
	 j/A9qZxl+aUhlKxsDB2VEzrYxdf4x7YMpk7osSu8fRgvKwU+sZ8AvBiAEqoPVsLOJO
	 4bCoNI4sTwP2Huu+GZdPTD90xVXZWca/Wl09fJJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4708FF80236;
	Wed,  9 Mar 2022 18:15:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 958A5F8016C; Wed,  9 Mar 2022 18:15:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78E54F80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78E54F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y1QtB2wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646846097; x=1678382097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tmLxH2g+EgDbRqsU7GvDAoVCFDzwo7gHR1foq7+YIKg=;
 b=Y1QtB2wi/HsZQHqfkdUbHMKS9fIO6F4t+RNQs+YZFyeQiAJvei5A55i0
 t9luy4ffMgIQDbtjtHR9JqN8fQxYCe7t5ztBxw68iNHYYMUjf2XI6wAbV
 /kXhZObHwhH1/5rsmdK14co/LiY0ohU9NiXehLd737n3I0rlClNBstVfa
 S3vsswiVd8R6vKWqFQ2u9WAuKHDFHqwcxnPgtnjRbE5hzsGhSW7UODKCr
 ylQTKP/GlWf4rGtsQjWbo7ykXS7elKU5wEgKibzrq4zZTplL1yS9lZy8V
 8k4ZuqjBbYnGo7QzO5/FP2K56wDuAcY8S110ftore3PrkNXFQNh6RtTHK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255222811"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="255222811"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="495909562"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 09 Mar 2022 09:05:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:05:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:05:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 09:05:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 09:05:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LB1cltRyufkjVYgVCKHA9TsHoKCn/3cu4d3bd7XOOlRS8+bHlMYoKu2HX6Alye/3g2P9+DcTxqGoES4Y3vtAOh+ca83f6X9cWzcS8bl73fNptbaqc08pRfdVu8sqhQWx58Rn3e52ezMbK2Bl85kTVrSVl/CSQyhDwxeZ92jIdHOtfKBRR0cUGg3ONPSOGIw77De/vU8goQgPC7BZfCGYHg7is2om5mGdIWtirWLIHdM60QPMLjJPPkx8OD9ZM9BOItNqfaKkDRdDdhPFxN3k7qwaaJiUqZiM2GbwVV2QGJKxVRsKs9heNMpmNT/YNGSoQBgEzDnXnuu5kTFodazPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mesqQsS7gKDmZiq6DqXXM2YIlDLXdrxBRhwCxvzGp4k=;
 b=YqBw9sGNbYamc+N6nAuBIWRP+juEkc87nt6cXMuBQGQiM5YBTE7i0/iwrBUgvmq81h8xZsgOijBOVGHiW9XzSTMSoYWPVp4MVrwDJUUnGEEEfJgbKny4Ur33rn1BVd3zCpXsDBAdAZoc+Ow/aTZAVOjjg5kiv5EuRxiJtzP583wx1T/A1FGuhe4RTc4vjOTHDh0loI3KjfK2mHEWyJ43qj1/OKFC9eaCEwRcsKstyzXQgMvPfwcagBFv3nWsFcbluu4y6ZKWZPLB0NW5aK71Tn7ehoxZOPBW2JNaLCnfEwUDzYJ6sgCy/hY2d8z+OmFxBPGa8MEQsZuZ6Ot2brpQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB3938.namprd11.prod.outlook.com
 (2603:10b6:405:79::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Wed, 9 Mar
 2022 17:05:03 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 17:05:03 +0000
Message-ID: <9fc8a959-44d4-6f23-c07f-23da895e674e@intel.com>
Date: Wed, 9 Mar 2022 18:04:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH] ASoC: Intel: boards: fix randconfig issue
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220308202318.401358-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220308202318.401358-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::36) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 019e97df-78f0-4e40-a8b9-08da01eef3a2
X-MS-TrafficTypeDiagnostic: BN6PR11MB3938:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB3938FD424461F8085A602EEFE30A9@BN6PR11MB3938.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwaXUXBtCCAAG4Uj6htmGV75pgqCN0hwTH1UICsDj8Y4FRqS0WFdP2X7UgQJYgyshvFBSeB2nYN/lWpPQipp31HnFU86ySvWW72xfgEWgjNoGdki2D25iuJvwIl3WzCbpoePOQnh6ph0aC6fucclTyjsvHOi7Q79gHHyg8wotfHQz5bFssxLYktHF80wFK1dz/M4w70CPpVaPQ3cnR+21fFaboC6ui8Z44+7GFYXPVif262Gt+zDq9XaBoQXMNgbfndY1atQ76YGrFU0BfVXRgBpYZFLYo3XJwMBm7je9S1AZbA6uPaPcDt8TjthlGdaPdQ0/t9wFZUGK24n8hoCuNEy2GY2BI+NnffTN5PETGqwyucUIX4ErYOd8RwHgB9VsZ9U2evjVnqUIoL2/Yy0UXxdcAWNhW8N03ZMg5e2PExCHQcx/YbHo1lMJ25LDZyEJbo87sl5Va19rTqA4o6nphy2lC146lsExw7D338qenQxnlbelX7hkA+cmWPaL6Z4m89fWjm0fIsqJfjpdoQaAsWFNBuDcQwhcHgu7eP87/HLhyZbMtM3hgRirBtzN96A8W5Ynh4SxL/vam5P2QpDeyuB1nXuVAcinEJBdV/qbdFNGOtrvZpybcGOEEt6peqj/0cBMGDxAYL6RBNt3v3EWTR427x7U1XZAnOFeKlQDv/B0g2mmLqB6GT2V0/g1IKiwKI8iK9MPQ8ltMc5XDKOWfr0BUcxns49rsT3OVbZ4yEFsMlP8AI/9u8hfhL6EI75
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(186003)(26005)(6666004)(44832011)(31696002)(53546011)(31686004)(5660300002)(8936002)(6486002)(86362001)(82960400001)(6512007)(2906002)(6506007)(83380400001)(508600001)(38100700002)(8676002)(4326008)(66946007)(66476007)(66556008)(2616005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjlBTnR3QnE1WWNVaVcvMlUrdlFzZ2FHK1pLY254QWpsTTJ3MndEQkxHRlha?=
 =?utf-8?B?c1J2UHE2YS9QUHRQQzNGalFCT3d5dERMVG5LNVQzMUpmdHl5MUFKL1VURDFY?=
 =?utf-8?B?QU1LZFpPeExXdXhBS09DelJmMHNRMjMzRDNlQ2JVRkpnTjR5V3krQjBCenoz?=
 =?utf-8?B?WkRXa2xNN09RNnpNZ3dCZWc0Z3pjamRvVnpqN2hreElKZHhBT2VLQ1puaVpN?=
 =?utf-8?B?b3luMnh4NC8rdm9LVUVMb0gvekU2djRMSW1RbkxMRVlFazl1Nnpsdm1ZK0Vo?=
 =?utf-8?B?c2RjNWF4UWNnaW5MdUhyM0M5bGxYSk5EcTlFR3l6WVhOeHkxWWs3YXFzRXov?=
 =?utf-8?B?YUFud2craUJOZnorQzR5OUZUVlNzSDNMS1lFUEJCNXlpN3k3VXhXeHRaLy9w?=
 =?utf-8?B?RnZKSy9Xa3h3T0RrY290ZlJ6YTAvNzdxZmJ3REd4M1I2VWN6WkpSMmh1ZEZo?=
 =?utf-8?B?WG9ScHkxY00rdVA5ekQrbzlWeWpLMDY1cEVDVWtxRHl6SkJGeUplVkltRUF5?=
 =?utf-8?B?L3hmYnROZmNpcGc3cTRNSXdybUg4QjZpSVpWWnlXUFRRVFZ4bXVwTmxLSHpt?=
 =?utf-8?B?bDM4eTBYazRtYmZ0ZzB2VG10WDZ2bGNrb283SjdsSFp0UFZNOFhuN2g5SzFp?=
 =?utf-8?B?bGZEVkFsUUhuY24yRzdya1VOMFJUZnovSDBrcGNoNkh2UmNHYXlqelhrM0N4?=
 =?utf-8?B?YXQwMzk4Nmp0aGJUSUpyUldyblNRb0dFVWNIYTJSbUFaWWxPcEVlSWhvbVZS?=
 =?utf-8?B?UXk4THpmRGNXb0JpWkZxY01DR3Q2ejVud25LRGNHK2dEcE5IQ1VadlA2L0FL?=
 =?utf-8?B?UXUyT3hlc3prTkFIdHJ1N05JN2RuZDJrM2JsQU1XdXE1cGFJZFB3ZkZmSWVi?=
 =?utf-8?B?M0hMSHBVMDNwUXlJVE92d2V4emlXZ2xETGozUE1oWTdwMmMzYWpvM3BHNUts?=
 =?utf-8?B?VlhGRjU4SXpLUDlzRng4cUE2MXF5RlNnYXAyK1Z1VzVrZ2IwZ1A3cFVJdW52?=
 =?utf-8?B?NVFORVZHWDcvclJrUE9rS09pRGc0WE9GcmFmR253V0RCaEgvbTE4dFZUTkJy?=
 =?utf-8?B?cUpZR1h0ckxIWnYveVdOSkpGb2FxYWIvZit5VTQrRkRGQjEreUptWGVlZEwy?=
 =?utf-8?B?ZG90a3ZYNVNSSHZPbTJ6dk4waTNpb3hPZlN1YWV3Y3MrcHN0OVdoWm40MWFz?=
 =?utf-8?B?QkNFOHNiOHpNT2hqNUlnUXhvMk96Q3hOdFZWSHQySUZ4ZDlJc3l3WWJMWlRi?=
 =?utf-8?B?cjBnMnlhQUhlT201cVkrSTRjVU1DdWZsYjBpWU9YWmk1UUd2MXJpSENyTDVM?=
 =?utf-8?B?WHdQemFRSzdpUSt2N3dEOU9iN0g4MEl6Q2V2T3IxdDNGZnhDQ3hFRkNSRzh0?=
 =?utf-8?B?QzJaS2tSTHJRbTQ0WmJtUGFDYTJhY3hST0p1WERDWVZrdW1tN202cE0xaDhs?=
 =?utf-8?B?WVdaVjdjcDhZMENteDQ1ZVRrclRTa281ZFExMHIzSHV6c1dBZ2RWOURBMFV1?=
 =?utf-8?B?akJrVGJTNjhxM3kvdGZNK2RVbzF3MjRpMGFIL2R1R09KREZlUjhnYXFnV2lI?=
 =?utf-8?B?R3g1QXRzTU9hMDV5QW9MVTl2bWx1VVZ5YW1FZHpNUXVwbkUxRDU4UFcwaWZ5?=
 =?utf-8?B?akxjOXRqcmhzSjdXRThmbFo0WWlZOFNtOGUwNGY3Nkh1RTZEOHhYK1NJTE9U?=
 =?utf-8?B?eDRwQ3F3Vk5saFcva0VRQ1lJRU5ucGErZklmOXVETENsdkdleXFWdWVYZWc5?=
 =?utf-8?B?UEVLRDRGczlJR2t0WW9ibTc2R3pPdVBkVGdEcE5iUWd1UjdCOHZJL1F3aFlr?=
 =?utf-8?B?ODBZNlpEUWlCMDdDajJCZ3FITEZPSkdSVXFBcldhVGR1R3lCOWpaMm11MGkx?=
 =?utf-8?B?dklFbzk2cHlTcWxkQ1NBRTg2UFdoTCt5am5lYWFmczBRbzg3cno1NHNBdkc1?=
 =?utf-8?B?L0YzczUwL0EwK1JYc2VQWHJEcDF2bnhOeWczWU1TMW5rNm9PMFJqQW9PMXlm?=
 =?utf-8?B?T0crR1JUcy93PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 019e97df-78f0-4e40-a8b9-08da01eef3a2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:05:03.0370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SJtk9aAZTz2Z9nxGzPbVUZPmqAg2ONLzF5hzo8eNFpj6p61qwTOTnMtv8OVNO89knOVug5CRvO+DtFTBnDAqwmGnmz/mj4zUjXPWtQfZUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3938
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>
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

On 2022-03-08 9:23 PM, Pierre-Louis Bossart wrote:
> on x86_64:
> 
> ERROR: modpost: "sof_dai_get_bclk"
> [sound/soc/intel/boards/snd-soc-intel-sof-cirrus-common.ko] undefined!
> 
> ERROR: modpost: "sof_dai_get_mclk"
> [sound/soc/intel/boards/snd-soc-intel-sof-realtek-common.ko]
> undefined!
> 
> This comes from a missing dependency on at least ONE SOF platform
> being selected. This dependency exists for all other machine drivers,
> this was missed in the earlier reviews.
> 
> Fixes: 2fe14ff61bd6 ("ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

>   sound/soc/intel/boards/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index a62785893bec..f3873b5bea87 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -616,6 +616,8 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
>   
>   endif ## SND_SOC_SOF_JASPERLAKE
>   
> +if SND_SOC_SOF_HDA_LINK
> +
>   config SND_SOC_INTEL_SOF_SSP_AMP_MACH
>   	tristate "SOF with amplifiers in I2S Mode"
>   	depends on I2C && ACPI
> @@ -632,6 +634,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
>   	   with RT1308/CS35L41 I2S audio codec.
>   	   Say Y if you have such a device.
>   	   If unsure select "N".
> +endif ## SND_SOC_SOF_HDA_LINK
>   
>   if SND_SOC_SOF_ELKHARTLAKE
>   
