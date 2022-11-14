Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70762628480
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 17:00:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5C2B1666;
	Mon, 14 Nov 2022 16:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5C2B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668441621;
	bh=AhTyH+1CH3sKTBhdIn7cBrBFaXtDBDlw3g9t8yT299c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwqlKPiUORz1dRE2Cuy10Kuxw8+6x1uDVQ2CmRiH0rfWkY6/pPG4BZbTzZmmYARu4
	 Qulf0R7uTIdRDiWizMykN7zUUudwe0J17KUWp/03Z13mFTG7iUAZrgf/DKIa/VQEee
	 QGXsFQ5wEL2Hc9BRaFZGq9cZdXDKg4ohifsjyQaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F98FF800B8;
	Mon, 14 Nov 2022 16:59:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2354F80431; Mon, 14 Nov 2022 16:59:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,RCVD_IN_DNSWL_MED,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95C44F800B8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 16:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95C44F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BTw7xMID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668441561; x=1699977561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AhTyH+1CH3sKTBhdIn7cBrBFaXtDBDlw3g9t8yT299c=;
 b=BTw7xMIDyDRFVAUVYPhJA+CeNrekDeSJ+MEC5ljVxW3wntNTA0SNf91d
 pwzFWoI++hLBxd4yaMGwqXtvkB6H66xougR71eOmJyHrVNGnHfuXYDe/y
 sD6oRnKLar02XJbgLRJIxpl64KWSfC8LRwxS6SYKv6R4WdKpgQsU9ea/H
 rDtjMjd+F9UGv8RI/OUNXfyDWG0r9dIaJqMafx41M2CofJ+ulZrGriVyj
 ltmLkBQaPZKEFjTmq2ES3sRbGOHUT0F1ykPXtpj+1hcqfD1OFfbcyK4HE
 RldP/Uj1Ct2VvCVI1BXx+E0jEncsymXUX6qkdrCPIECRPrY51Jv8M3EV9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="310713298"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="310713298"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 07:59:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="702055479"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="702055479"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2022 07:59:15 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 07:59:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 07:59:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 07:59:14 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 07:59:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcDl20XTbpXdrjTyH1V8bVcapsOzWAvJGdY0SGnLg/AsU80yCv4PwU0zv3e5mnibw7r08X8qEIzeXPhymLxtcMHI4TzL5MGpB1Lja1R1m2nZ6jmHk+avNNbAjjXTW07jwuf32czxqVD7m+5eUrl76PL/gBtHYHJa/8+dPph6KUbpKdV04q1E9Kn5USKzlps4vVQKDNlrp6HLyHKcggB1Fzu+Z+6Qlh/CNaa3dqc8G2d7gKEApW9gO4CPRO6F1nWKVW7CkIaL3qHhoeJEIfdTNX7bZaphWDP06zt5X+9h7ASx2VW2+IqYGXeu2Rs+JipwpCkuOIoHTJ/2+fGFT6blzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbSkYP2l7p6CaxlV+Jf2zrWilrrnuPZePIicaAgfHc4=;
 b=bxqGxJoN++WY4oY7Ear1CSCcAygU+lBmj/Z+O4jXPAYhLApd6q9HIiMfqOrwG7/JxlOvkyyDORQi+zaxjM3bGcBUH4rvhjMYp/x5mfYfaxSmvsgfkIbR+l6by/9J7wCEU16Qg7AHJiYYdPsYIicQIREU9IUVfUsgmxx699nACWV0RV8SEdT/jyyCalME/HCTQVddqV69Pzmj8p++5CInHWdc6OWYcd0UUdcq/dVHH2trE60aTBToJR1PHwEWMKrLKxQEbZfEXCEtnidZmbL3GC9LyKjbSuj1/ys4yKvt56FodHTgYx4JeS62o1mj/befrVKfJLWcC4EpvMkOIH6rHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Mon, 14 Nov 2022 15:59:05 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 15:59:05 +0000
Message-ID: <cd72e6a9-c862-768e-f060-dddd2c3a6bae@intel.com>
Date: Mon, 14 Nov 2022 16:58:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] ASoC: Intel: avs: Disconnect substream if suspend
 or resume fails
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20221114113729.1022905-1-cezary.rojewski@intel.com>
 <20221114113729.1022905-3-cezary.rojewski@intel.com>
 <877czx4rkj.wl-tiwai@suse.de>
 <f6eb116b-e7a4-c95c-0fdc-01ffaa246bf5@intel.com>
 <87r0y5394v.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87r0y5394v.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MN2PR11MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 540a95b3-dce4-429d-e299-08dac659282a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZYKSFuYdQx3NRrf1vSI5fzKduKWBb8ooXlsx5LIs6YcnVFFCJ4qbflUeNVsQpNsrnFrLbU90/XTSQbuk9vclup7bN4t9rnESo98EDhQQ5R+7cDpbxe5vXezZOV65SMVME8q/BLEwOJN0VyVQD3BuVy00TUx/MKwTuGWJ4Dndg2xUG4yFblvl9gBDq7lwAGXgcd+kF3py0CQH7W48aXaQU2SNqnw74XdxP4JcSB6hkCqkiMebHIllqyeXTOZTJ4hkVTnG+8SQNkUMCCaTXPXplgq61UCRrCsIsDDB08T/FS8YHRdKXDiyvNovZ/jHEcB+l+RecV/H31rexjwajw6Ug5Sn8B3LOAOVzUKxCwZC80m9LK9iEnQ3FKh3iQZgO4O0JVhAKH5oEg5xmQRprUXnxDJQk+1zkWdhmmZMi0JkRsB+PKsaxffn5n8mjH7x+NVfl5gSVOG0hOOSj3Yj8oRqTfu1TSQKpMn+IGfiZBuky1/qlbUTstqOSo79a2I+rZ/0a7L/Y9vFYs2xNCNEEYZrLNNfojLROC2OwB20zTwZNE5X4RstXtC7LsLg3s6LrRLIhmomYC20Av4i3ODFgKmt0kW4FvPsAqBBa76pM4o51Ek3duBPdQNUtryNAbUYnt6B4JGmS4rZNTPu9zFYIsAHwOMSc9znnBEEz+QjnhFQ5j+qqySzT3P++0l2w+wc3tMIV9EMJ1u3kwDVRGE6F6NilyxwoThQQNJnWZ0E9EfH7yJJCBLC+MJjutO3qai0ZgukwCUPcit1OpPETFOBx1XG3Do4jJyZ9cV/RWv/dL6FCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199015)(66946007)(26005)(4326008)(8676002)(44832011)(66476007)(6512007)(36756003)(66556008)(8936002)(2616005)(186003)(5660300002)(41300700001)(316002)(82960400001)(31696002)(53546011)(86362001)(38100700002)(83380400001)(4001150100001)(2906002)(31686004)(6486002)(6666004)(6506007)(6916009)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1BwbE1CKzB2dTgwZlJHeis5b2R6YWVTcUdVNXlhS245Tko4bUFxM2ZDNWdT?=
 =?utf-8?B?amxtR0NtaHhTOFZyRldIRCsxK2FpOW1jZjFCT1MrNE5JS1ZzR1o2dkI2b3J1?=
 =?utf-8?B?amVUTFlQcHV0MzFLaGg2TnF4MmhXc1B3SDZBMmFIenRaTGpyS1FKVGY3ZnE3?=
 =?utf-8?B?Y1F3N0NLdjVNTXAzQW1qdENIdHBVeEw5WmtPbFR3SFJjdHlRK2JLYW5kS3py?=
 =?utf-8?B?VkZjV0prY1R3ajVOZzZydk15dGJkdkd5MGlCbWZlTFFadGgrU3RNelZwYUZa?=
 =?utf-8?B?dFd5WGlVbk5rSEhFRWYxOTRTOXdkSkN1WERPcnpXczZIZzVGb3NTZjFIeHhC?=
 =?utf-8?B?cTZPNS8yL2xJMjJHajNBSUhVRnhnRkRwRmhqZGdUOUxuTkV2cWI3aVFReXFE?=
 =?utf-8?B?amx1UCt5R2JQVE5oanFpYmc0Szdkb1Zndm1oZjQyV1BHR3E0ZFF0Z3NIbmxm?=
 =?utf-8?B?ZmdtTTdlbDF3MVlHVUtmSk9DMDlSMEhpVld4aVlHMHRzZE5qUGpDaUh1ZHM0?=
 =?utf-8?B?SEdKL2xzYy9ZR3hZeWNucnZLYzJJdmZBQU54QlQyRUlJUmhxd0FpeUd3Uy9n?=
 =?utf-8?B?UTlkNnl5d2JoK0FwdzhObmJnVzJuWEpyUVFaYmdaOC9tbXhLYlhFemtwdHNs?=
 =?utf-8?B?bUFIc3NjdGtiUnF4cXFsRGlockdPOUlGRW94ODZmRHE3NHB3dFk4akZqTEJx?=
 =?utf-8?B?Y0xDUVpLRmloSUxBRTZrVW1aWVA5ekdYNDN0eFlTSHRTcFN6cm5LbGxJN1Vs?=
 =?utf-8?B?U0psc1liTE1XeE1rMEFqcWlNQW9tUEYxL2RYWnZ3UTRLTnBtMkVLWUh4RTlM?=
 =?utf-8?B?Ukk5TURES1V0MzlpeS9McS9WWWx4L3J5Q08xMi9JZGd6U0F0ejh2aDA2bXNK?=
 =?utf-8?B?U3gyY0tDZ1RWN0ZIRythRTBmais2S3ozZkY0azVENUlYSWdzajIybVVUaFpG?=
 =?utf-8?B?RzFYYzZLZDl0WVcvS2dYTk9ySUdKTjdiSDNteG42bmNySitLMXZ0dW1JMDND?=
 =?utf-8?B?d1JnS3hlRW5GeEs0eHFPVkFhUjh5bWVNTXV2aEtvaVFLL093aXhxNDVva1NG?=
 =?utf-8?B?b0MzOVQrYytNd2hKS0VsM0xIVjAzZzlVK0l0RUk2RXoxSG9QUmFKMzVXK1Bv?=
 =?utf-8?B?c2VIeHhscGd3RnQ2QThBSmJqQmtTQndwTThvSWc2bWl0Nlh6K1RNZzJqL0Mw?=
 =?utf-8?B?UGh6UUM2WjIyamFzNGhPcUJyY0VKc1JMME9HVmpjL2tYM0M5WnE0VThwMjZX?=
 =?utf-8?B?RGhYd2hGTm1ZOCtkS3pndnBqcFR4cGFTVEtvWnJVUm4wbXY4Y0c1VjFyRTdp?=
 =?utf-8?B?OFRMckhNTDVzZkl3U3I1U1lRSUR2VERzM05VTHhIeVdMVVEzT1gvdng0ZnA2?=
 =?utf-8?B?S05IQ2lVcHhPeit5QktYRmtVL3Vjd1l6bHpzak00dGx2dEl5R25mdCs1N3BZ?=
 =?utf-8?B?clo2ZXpSMExqc1ZRRG5ybFQ4eDQvWUZxMVBaRTM1aU1xZm0raWlsa2w1b053?=
 =?utf-8?B?eFVTS3U4UVhkMVVzZmJhcEpReHQ5cmFqcHhrRFoyMDg4czYyZ291eHRUeU0r?=
 =?utf-8?B?TUliUlZHOHpmM1I5LytkVDNMUFRLQ3NwL1ZUbnNKWWNmYjBZYnUrYUhmTkxO?=
 =?utf-8?B?bE5RMzZYOWZNTHAxZ3g1ckR4OVppU3VHSXNQZmhzVjJoWWpkTU1sWWN0a1N2?=
 =?utf-8?B?VlJFdGYrVjFPZmdlT3ZrSGZYRmFMY0EyaFVwaGVMQndHQ1FhNWt3bDc3K2NK?=
 =?utf-8?B?ejhzZVV1TVZBQ05Fd2ZmRXVxRE05c3dOWC81bSt4Znkrbm01Nzk2Y2tFN1RT?=
 =?utf-8?B?YnRGKy9LUWhtRlZlcTErTkR4U2QwQjBWNzlnK1ZNKzFZRy8vOUUwNDFSSUsx?=
 =?utf-8?B?SlVnOXVxb3ZNQzFmS1YwQVV0Q2FQR3JUaUx6eEcxWGdsWjBiN3V6Q2ZyVDhM?=
 =?utf-8?B?UThobVlCaHMzUjFIK09YSEcwb0Z2QU4zd0NNcGZJZTBYa2w2Zk1ra3BSeUJD?=
 =?utf-8?B?ZHAvNFJ0UHc3ZTZsZFNJZ2VtYm5hRzVjSjFzOFdFTUdSSTM3SUhyR004YmpJ?=
 =?utf-8?B?dnNQcEFoU05FM2hrWnE4SHVHZ0k5N2tHYk56RUFmZXdCR2RDWit6OTNDVWhU?=
 =?utf-8?B?ZTBwTzh2eEN5bGNYRUU2TWtVOUxrZHpwb001a3pDK2orT3VlV25tdFd6SzU2?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 540a95b3-dce4-429d-e299-08dac659282a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 15:59:05.6665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABOLr2V8wli0TSrekrV366pHuAV8A60244SlLVmjUzZ8fGjDcRwsiMiUnMw9/pfkEXvLXrsW+2DAU1E+/1SKyWL54TYpjcaMeQgh1vSfYv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-11-14 3:26 PM, Takashi Iwai wrote:
> On Mon, 14 Nov 2022 15:08:17 +0100,
> Cezary Rojewski wrote:
>> On 2022-11-14 2:02 PM, Takashi Iwai wrote:
>>> Hm, that might work, but note that, once when the stream is set with
>>> the disconnected state, it won't be taken back to the normal state any
>>> longer on most sound backends.  That is, it'll be gone and won't
>>> revive unless you completely unload and reload the whole stuff.  If
>>> that's the intended behavior, that's fine, of course.  So just to make
>>> sure.
>>
>> Good point.
>>
>> Our intention: if we fail e.g.: on resume, we would like the framework
>> to invoke ->hw_free() and close us. Right now, if we pretend that
>> everything is okay, invalid actions can be performed on our
>> streams. This all comes down to userspace calling "just"
>> snd_pcm_resume(). If we had an option to opt-in to a _hw_params() +
>> _prepare() + _resume() path, then things would look differently.
> 
> So you'd rather like to make the stream appearing and working after
> re-opening the stream again?  Then DISCONNECTED state might be too
> strong.
> 
> If the broken state could be recovered by the PCM PREPARE phase, then
> we may (ab-)use XRUN state, instead.  Then application shall
> re-setup via PCM prepare call.  But if hw_free/hw_params is required,
> it won't work.

To resume properly an AudioDSP stream, operations typically found in 
hw_params() and prepare() need to be re-executed _before_ actual 
_TRIGGER_RESUME can be called on a stream.

Since implementations found in userspace apps such as aplay and 
pulseaudio first invoke snd_pcm_resume() and then snd_pcm_prepare() if 
the former fails, one could abuse this flow by doing hw_params-related 
operations in _resume() and returning a specific error code e.g.: 
-ESTRPIPE when they succeed (if they fail, the internal error code would 
be returned instead of course). Prepare tasks are left to 
snd_pcm_prepare() just like in standard case.

I believe such code is a good example of _code smell_ though.
First we abuse the error path, second we basically drop the 
_TRIGGER_RESUME entirely - after all, in such approach it mimics 
hw_params() and will always fail, either with an internal error code or 
hardcoded -ESTRPIPE. _TRIGGER_START/STOP would be reused once 
snd_pcm_prepare() succeeds causing another problem - no differentiation 
between start and resume and thus lack of information when to or when 
not to poll DRSM.

Thus, we ended up with 'state = DISCONNECTED' if we encounter a firmware 
issue during PCM-pm. Keeps things sane.

> Other than that, there is no such PCM state that forces to close and
> re-open, I'm afraid.  You can have an internal error state and let the
> stream returning an error at each operation, instead, too.
> 
> And, creating a new PCM state is very difficult.  It would influence
> way too much, IMO, as each application code has to be modified to
> handle the new PCM state.

Agree, this basically screams not to follow that path.


Regards,
Czarek
