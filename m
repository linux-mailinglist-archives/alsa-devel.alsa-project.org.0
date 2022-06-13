Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D5B5483C6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 957CE1832;
	Mon, 13 Jun 2022 11:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 957CE1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655114063;
	bh=6TtfVzkbWFkGKMCUwS52NuDhTJAVnosAKnK6bSWzAfw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rPDgpW1pymiPVoxckQVe5PIwoLqQ7F12OWCZV4ptealIeg2w536ijHXTOnmjvDilO
	 yq7rWvaz34XIw97P5Igj/3TKIVXr5i9renWZUFmrVgu8nVILlGFHij4V0PxahuI5/V
	 Xk0trohtW2g7q7BQNaRCbeDIWh5KnK8seth1zRiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06774F800D8;
	Mon, 13 Jun 2022 11:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00FABF800D8; Mon, 13 Jun 2022 11:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 765C4F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 765C4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QgqZPfaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655113994; x=1686649994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6TtfVzkbWFkGKMCUwS52NuDhTJAVnosAKnK6bSWzAfw=;
 b=QgqZPfaLXlZB9pS9S9ERjPAo5pu7XbknS2L617N+FwhYaK2PxQBap14s
 d406QhXamy++9byJBYoy5nQEwEN4HZedpWEUUhARTHKsbJ5oM8MJe/E1t
 1Lut1fAOzLP/70tMSKOIGWre3rnDtrTaVF5jfy+qJ+nvHsXQdtvD+F/kV
 iHe41EALKNdCRrdjOO1/w3brjsuv+F9ZNwtI+jWvTGwQWbmdM9XNkPfs0
 lxITL6ATra4gPf5GBTvqnrPS0psZy7xaxur5g4d3DW8By94PX5IE7oKXR
 hcFkmX/aAt6fqcmwSmas408kBbH5qmqd60keXQePvqsv/Pj3LL7iQBN7l w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="339903768"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="339903768"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="685949745"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2022 02:53:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 02:53:07 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 02:53:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 13 Jun 2022 02:53:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 13 Jun 2022 02:53:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQWSIplOnLVMoAfWcRJ5s8nPYMLSAUpV+//FzEySChT7+wQlg+BCxK36GMUR59T04p6Tb5vTNT+66ErLMAExi+nZpkkDm3OyO+AoqMXnnveVhtRkfhjfB1qAV7RCZ0/BUDueL2yykbVB1uKS7DCCNzZIJ2NQNDKiETXZ9Brgb7ST/98eQtu8e3naz6ikfzZA5rcRaJW1WFe7ixvw7KOSijqgSQyUJFR7d9qT+o3K0OOiUg5l3/iZnX5w8iwnHhHTK1gHAybkYemkQ08GqA7SqK+oGbZSkxb2nZqMMVu003/97Mx48Y7rfNK8KZbr3amFv16VBi1PolwVYpZ/jOmpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBHkuHefLkPpYy5UK6cDZCoCpblh0HHQc3a65lJnNFE=;
 b=lJiqFWsve0sOuWJ/PbyZ9AkAl1rD7j5fKa9Btc4SeKfH9giyH2lgQ9AQVA2+UDYs1u5ISuOe3F/jpG1n105j8zz0jU0RIrgZg6KAarlATH/bvXBhVNKfe5YQSXCoT+/X1P1TR+oJ37AFayhcTNxiXvmE5p20alrW7xV8KGK5m/Wq7ZdXrheEfrvS/klws8BDwAP9k/XnxZ/dMZlJ2TaGyCUna6/+2M9I7/5nyzWY/BVl8qb1ozawBe5IvfTqSJVC8BGIVJLXvZ9k+RysqAWCTTxWvcQS5sE625THTpgv+OPDv0CcRXBtm1Itbr+vtrOBvB50HjOcWr1ygFuaBgmqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY4PR1101MB2327.namprd11.prod.outlook.com (2603:10b6:903:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 09:52:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%7]) with mapi id 15.20.5332.014; Mon, 13 Jun 2022
 09:52:59 +0000
Message-ID: <54fcdedc-278c-06b8-5402-28880597d3f4@intel.com>
Date: Mon, 13 Jun 2022 11:52:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
 <2634f801-446e-04e0-89d6-5bee25dab109@intel.com>
 <dae93c48-7fc0-bde0-bcc5-b66dc79ac205@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <dae93c48-7fc0-bde0-bcc5-b66dc79ac205@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0166.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::21) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39145041-03c9-4d2a-c678-08da4d227f81
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2327:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1101MB2327FF48E26900AE0B0CF2EDE3AB9@CY4PR1101MB2327.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPDVtWFj+X1VLEqY5MWQ0H7fyqpPQ/0J2mmAEKdPeqys8XYP+yYn6TGjNUnzYPnk0UYrf0y0XWMP5LNNFOCvfBTxO9Rm8IOEx1Dh51kSHWiKC+I8Y9VuTiujCjNO/wiiLuIDVxf4qiPldNKHgFKBPYFVvpUKVqXKyGqrCumFp92xgvFiJy4VlQfgCrOAu1oYsHOTDBLFhwU/1bAMfMyiIBqNt5PyPYWspwnJ7Zau9glYN2S9fvgVeiBSrtuV5cOkm4oJgeUEonR9xslcACoqpeMJ4YC1Vnffbgig+cp7d6n5JkU3sCkOHX+UCogvIq6ZS8ZYoqoGM08T9xKQJsuWn2xyoseBVWuLSNgCmhRVv56gEfiWMpbfJgj9IQPjuakEmmyF2s3ezCelNp6GH2dZLlAUe5hLZUx6AVYuXnh0/TIP9G3evrXnjLUItcbnniEHfslDtG/Sei/IFCfzmymEX6PiSY2mOFWQ0Bq6OpUW2NuubF4cN7Bhv7ApzpSHdsmykNiNCFXW6VpTUr22fug+SrvYytJcZQoOIgcAzBjcf1qAHEbc/F+YKz5GRftKuHV03L2+DrMsokfIvlYjmEXAz1kG+ZeNn8hRAUBoilBrkb/IX7bf6t7P3ZDZvqLgI2AR02n4BnNjeSMaHNmqr2+0O9cw6UuaVGAHk76Gixmy44XIX6qpgZo2wWe07KfeMnsjmCjUjULBAogqlMesAhFkKvtUuITvAnGCtRYQRcO1DkcHwfnBbybbobsWWfZEWKPocSvhXZvR+UN3XLaeZLOBtjnSxRJ3ltGKOMEVCqX7ODeS3TM7jG+y64bXWlyZxzWj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(83380400001)(2616005)(186003)(36756003)(38100700002)(44832011)(8936002)(5660300002)(82960400001)(4326008)(66476007)(15650500001)(66556008)(2906002)(8676002)(66946007)(6486002)(508600001)(966005)(6666004)(31696002)(6512007)(26005)(6506007)(53546011)(86362001)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2dOL3FaaW92bktLK2c1bUp5ZCt2WmtIeEUzRkorN0JmYkVRclpoVHN4elV0?=
 =?utf-8?B?c1NaNklYN1dYQytBWS9LVTEwcjFtN3VacU11OUc4WGRZcVdvcDMyOGdaZ1B6?=
 =?utf-8?B?SUZiTE1OMVdmcERvWHp6OHp3VGU1R1RnOUJ6akx5TGcrZFdsN2RPMTZwRnhj?=
 =?utf-8?B?M0l2QUVTWWtwSlZGTkhnUHpOYmt5cDR3QXJRV3grMDdWa29zSkJFak1ZWVhi?=
 =?utf-8?B?MUJtTXVNd1hKb1NwQ1dubzU4bFBDU0xPS3E1R2hhN2FRQThBaGhEMTM3dWJG?=
 =?utf-8?B?aGVsd0NXNTdGN2dLNDU5Ty9vbDNabGIxbVhxTDRqajl4V2ZwZWpFOExaK2RC?=
 =?utf-8?B?UnB3ZlZCV29Sb1lYWGlYZUovTDJyTW5WaWRtdjA0SFFYWTk0VEpOMDhsVkYz?=
 =?utf-8?B?NEJQMm5JM0ZtQ2Z5NmsrV0lVVCt6bU1kWk5tV0lQTmVwMUpCdGdSN2QrNjl0?=
 =?utf-8?B?Z1R6ZEUrS3E2V0Jrem9tamtsZTJ0c3c4ek4rY2pyVlBpak5mTHpoRXp6ZHo5?=
 =?utf-8?B?bFdENzl3Y1FiUnBKOFpoNi9CUDhYVEhtK28vM3dYVnZPeUdNYVZMMmtsTGpJ?=
 =?utf-8?B?bkMrVnF2N05lNkRFZWdQVE1DSlgwMTZUalFMU3A2TmhuMU1lblJJZlJKRldR?=
 =?utf-8?B?MG40ME1JVkxydlA0ZC92bWQ0VGcxVU1pSjRHMXYvQnZ0Ly9BV0p5RVhvdWhi?=
 =?utf-8?B?VG5DaXBEU3ZTVmIyaHdkOEFjcDNyOVRuMHExRE5MTTd3eFljdmhCNDZCZlIz?=
 =?utf-8?B?NFExeVd0OHNvcW1tSU5laTNHT2x4c3pZODF5TVpld0Jlb1FxNjZ2WEQ0ODVs?=
 =?utf-8?B?RGRlZzRwVW5DVXc4eXorSHdDRnBIWDVFYUpXNldkM05RQWtOM2dUZzFmYkFa?=
 =?utf-8?B?VjdPR0wwVHRra3c5bW5nWGdjMlVudDgvbEoya2RybjFpU0hsVnhQUzBIdklC?=
 =?utf-8?B?bFlaL3pDLzY4b2ppYmxzd2kwcUd5OGpINVNOeW9rdEtlTmVqRGp6aXBoMXVa?=
 =?utf-8?B?YUNOSTY2RktsNUMvakw4OWYwVEF3elc4WkNudFRSam9lN2dTbkRrTVZjODl6?=
 =?utf-8?B?ZEduSlBHckhuM0ExUWVabkF3Y2xUY0pYbGM5enZhNUZnMU5Pa3c4M2RFd0JD?=
 =?utf-8?B?WEhieXdGYlRlLzdoUXYzTXZ5eGlMbWVvZFk2TXBsMXJFdTJweFY5YzludEo3?=
 =?utf-8?B?d3pOZGF4ekE2ME5haGhMdVlhYUVFSXlaVU11SXZINXNDT3hCOTZuaGx0QVFH?=
 =?utf-8?B?NXJKc0JqMzJJVThXTkhJcjNQZTlRdXBaZ2NOeWtJSGRmOUJXM0FpTTFMR3d2?=
 =?utf-8?B?aG5yUmdNczd4Qlp0ay9BRS91V2Z4SHdYa0xBcndEdENpZ0g3c01UOWVwNUxr?=
 =?utf-8?B?QTBQNytoNFJkdTMrR2hyRU15SUcwVWQvNE9OZHpZVjZqa21wS0VCZUliOXhU?=
 =?utf-8?B?SlcwbTNUMDFTT2dSa3dLbkVpWmNhVnN6NGl2UVFGSkxYZ3BpREZlZ043a08v?=
 =?utf-8?B?d0ZGaXVHYmlBTmcra1VMZ0VZNGMxUG1Td1lKeXBjeEU1OGRuWEQvSjY1WUtN?=
 =?utf-8?B?aDBNNFNxWWsrWURxa1VRTWtWVWpyN29lTzU3NGxEZ3ViK0JIdDBLUGJ0WCtJ?=
 =?utf-8?B?QUkwampRNWU2QTlQUHZkeFlhTG5mN3N1OWFEM2JQblZJZm1Ed0NQclBhZ3p0?=
 =?utf-8?B?VXRrdmlLODlrRlJ3VVN2a2tVNGZNczZRcGwzek5YREhRckhDSVh0RmxKL2lq?=
 =?utf-8?B?ZVF2ZWhNVW9IbS9sQXo1blc4UHhPUGJxWVg4MXgrajYvUS9Hb2tTSzgxUUx4?=
 =?utf-8?B?T2d0QWhRTWN0ZTd6cDlxaVM3aTFuMmlsNFhiV3JoUXBoejMxeG5McU9idHpB?=
 =?utf-8?B?Mm1DblI2eStMaW5uQzlVeWgrSndEaDZCRW1xaDAvU2NaQVhkSmVpRkJxOURU?=
 =?utf-8?B?RFJFZWZPSlFPMmZoZ3lNeEdjMUFJNllxSEp1azR5ZzRFS0ErbHUwd1dhWTJY?=
 =?utf-8?B?ZzhGbzQ2RmY1TGR6Q3llQ1U4cWU1dUpHbFhIRCt2cklKMktOcEN4M2UxZHdm?=
 =?utf-8?B?YnBCYy9OTURGYnlGUWFvRjBOM250aEJJK3VETXZpdHIvTFJ1LzlSaktHTXNy?=
 =?utf-8?B?bjNqa0dvQ29VWS90RmExamkxa3AwTklaeWJ0VGF4MXFPMGg5ZUZJaWsrVmZR?=
 =?utf-8?B?ZTZpOFc1UFBrczc3cVJxcUhZNStOMUs4MEFySkkzemhwclo4R3g2MzdNWkZ5?=
 =?utf-8?B?ZzBXUW52U0E2WnNDM0VvemJ4MmJTY2pOd3dPZzBVY1lyeGk3Wk04Qi9lUUNz?=
 =?utf-8?B?N1NRMnMyalI1S2dxQzdTTk1HdlFlZEd2eERvanBPSlI0aVJxK0NpODBTTGlk?=
 =?utf-8?Q?pZNkLIDcTZxw2udE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39145041-03c9-4d2a-c678-08da4d227f81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 09:52:59.1659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JztqTq/dN89xQ5vHXlWHFPtrDKYm1nTqz7cXpsvVjXbwlfByGANlw5Of+Q1cBaUxLWrigBGFI6nTTPKdts/7CHkg8FoX0mOnEsxyqxqFOe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2327
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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

On 2022-06-10 8:48 PM, Pierre-Louis Bossart wrote:
> On 6/10/22 12:33, Cezary Rojewski wrote:

...

>> Hello,
>>
>> While this patchset reorganizes and rewords code of two boards in
>> question, module (kernel module) names are unchanged. Currently those
>> two are:
>>
>> - snd_soc_sst_haswell.ko
>> - snd_soc_sst_broadwell.ko
>>
>> My question is: Is it viable to reword these two?
>>
>> Both modules accept no custom parameters, perhaps *dyndbg* is the only
>> possibility so the impact is reduced.
> 
> Thanks for asking the question.
> 
> I have no objection to the driver name change and haswell is not used in
> commercial products outside of Intel.

(save #1)

> You have a point that most of the machine driver module names make
> limited sense in hindsight, but it's better to leave them as is.
> Changing them will increase confusion IMHO.

(save #2)

> We have scripts to remove/re-insert modules and every time we add a name
> change we break the test suite. This happened when we changed all the
> PCI names, it wasn't pretty. See e.g. all the 'obsolete' references in
> those scripts to keep them working across kernel versions.
> 
> https://github.com/thesofproject/sof-test/blob/main/tools/kmod/sof_remove.sh#L134
> 
> we also enable dyndbg with /etc/modprobe.d/sof-dyndbg.conf deployed on
> test devices, if we change module names it gives everyone involved in
> CI/testing more work.
> 
> And last if you Google a bit you'll see references in a couple of wikis
> and bug reports to modprobe snd-soc-sst-broadwell, so if you change the
> module name you make the information obsolete.

Hello,

Very much appreciate the input. I admit that at first #1 made me think 
it's OK to change the name for the two but the later portion of the 
message (#2 and onward) made me think otherwise. Decided to not that 
change part of current series in v2, will send module renames as 
separate two patches either today or later this week - if 
snd_soc_sst_broadwell rename is not welcome, it won't get merged.


Regards,
Czarek
