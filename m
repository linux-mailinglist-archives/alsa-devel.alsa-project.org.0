Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECF604428
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 13:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB91924F;
	Wed, 19 Oct 2022 13:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB91924F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666180766;
	bh=oMR+JMdvElVZYEsdhJU6WeCAdP7Y3tNWv2v+GxUE9vY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPlWisytFXmBHAjmQr/SKRIU7YKOkeh/g6Y/g5OfBbfvtcsaOzhBmuprxSXSdZ8lS
	 m/I23xpsFOu5y46qT20KceidkxIZuxGR3JfRmsW+BIbZgy9cT8Uu/QcmLifuhcuSTo
	 0xaUKMOVuaFAMX6ly6V0wg2genCqZhehboZ3k9Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A3AF804E0;
	Wed, 19 Oct 2022 13:58:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD8FDF804CC; Wed, 19 Oct 2022 13:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303BCF80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 13:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303BCF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c9/xdXYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666180709; x=1697716709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oMR+JMdvElVZYEsdhJU6WeCAdP7Y3tNWv2v+GxUE9vY=;
 b=c9/xdXYuAawQeAi1pEJ/SCwv8n1NKmfFsUmjAP0p5N5mX+ptbgQexyGA
 qO47gCBdqdy5n87g5+4hEOcCSxHrtTLWnWB7m892d9OqLhn6al2MJDtQT
 njQ3hXdiqRWZk0rI+8X+tntkPlJESc3tPaqG1biCo2oMISSM93CIX/0VP
 suzeaSJk2BEo0HAiVmAXuOpEt1u+UFLvfnDns5S8yyARYK3/kmjuoc9Iq
 cuhRM+lKjQ20DpTt7u8tgmXtPb3sUeJtduSpmnogbaY7SlrBNE7O3Vii6
 IkogzXsF03sQ0m6RKRtIRqWaOhZBas6VDQtSPhEn0BQiIZfWkKrCuUPaR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="304004207"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="304004207"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 04:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="607061772"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="607061772"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 19 Oct 2022 04:58:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 04:58:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 04:58:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 04:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdv6SGmXU0KMqAJvscNIucr/Qg3dsFJ+a2DU6OY9W6Pyzp3AOOzncezFWBx8drdwkJkimXEkdIyBE8zpicWlZgZN9BPfPv9z1K/nj4O2Nh1uXg0VZX7Fg11nAO56MbcfifFLzCjKMjMIjuaiW9I/+EDzGJE3bJfn+RGTfF5Pg3ANVEc6QXdElOiXCuGrl+uH1B6MYz52CU9Hl7Ri5+QwYHsQ/cCZy7zj/b+MhtpThAKC6liK9IQbh1ZTcO3NV0Hq5d1qlzEiquYxh16AItXt2XiMuVekcqiLHgPh1acbqPJs43tIpPttuJKoGRLQOcZNp8opawmVoN7oDjNQCAdx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCt1ocvGYq4lX36UfwVV0hYj1JbV0eYV16qdAMit1Hw=;
 b=HE/h/pG59a3/o57qH4RJIqy7gH6Q8UgBpUZQf8YMS5b4Ml0BpSEYl9eJ2seb+j1YYLVXRgBm7X3/4W0dzZMoqe3IySG8YVKvUeqWNxL6DfGy0fJMnT376vy0Z1TuKLn4e/Puhjsb9w2BmfDObhSiBTPwGqx70ZmREng6RGfnqqbZRX1Traq2/C/vMJkXc6P+Ybyq3HqDFFG0ryxaL7fDTMHh3ywuCmwdwGEjEFG2fqNPPfN1csj/Bc8QScb1ZJfqac+7NzLaDr0MwfiNCNY7lGk02MhbnnjgNOhOVwrvC/uIjpFLIClnrre0eP/PcPRDnNUk1Q6B4iDHCOdJM5I+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 11:58:19 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Wed, 19 Oct 2022
 11:58:19 +0000
Message-ID: <ede9830d-9208-6fd1-cd60-c570cb5dbfff@intel.com>
Date: Wed, 19 Oct 2022 13:58:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
 <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
 <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
 <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
 <28d040a5-52dd-a8ac-2217-7f71cbf8e905@intel.com>
 <52b62b01-420a-75b8-4355-784f5eb7d62b@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <52b62b01-420a-75b8-4355-784f5eb7d62b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:206:1::32) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SN7PR11MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8a20f5-14f9-4a55-f2cf-08dab1c93690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1IGg5+jwVzrv+sVc+SRjMfJ6uRvbUZ2EUAkAseY9PNzJr7HCuXLm+Byh7fbLb3B8QRHcn/JF5fyb1KH3FSG9CE8usqV9Zp48VDdN7WIRBneJQVAFS/InDnHIYa5cAZ+fJ1r+WzxvfFR7aGqnsFcmdCf8LqKWiF3uD752StRPGdBHdGH7yS7GEMiQlirtCoUpZhIYfCMfcEnJQvSHCiJ+7/yGqUhLrmqG+0YbzsnK13kcp1K1BHQCop+yIU8fzmsL9ABtVKvpMidVTxBc3VkTYFsBK1Km2+tJURkdXvRZvKKUALX+f5N8j/gOwvmtbbyn2eRKSNjBwLpuAFrNzhQgYvIxQq7+Hb/RXpIy84TcavHvv37xuyZvt+/HfaBZ7hT0Fk+RB3mQcZcpORMy3lNtvMjq9Kio6Evu7AOO/y1FCBD449J3TvD2pl2AeUqGZ2wUCnwpCvWQbeblUJh58yGcuhzTchivtPXwyoLrzYTAtNxRCx1+XcTOPzqgz/3iRNVjxj5rsxTdPn91MZ7yWCo0JgqW2wqmB5M1cgmqfNSeAgVWRt5BkGRPLV+uQS/Z1ng2ojrPgX3NB6VSGHFeSt8/rm+aCZfI2xHVKIQaLWZpSyuWgjqtxFBJhC3q2O79AyzmBZ9vL5HnnuS9GX5IQP2NdAmufwO7QPrKeAsy+6fUih1IalEwMYtylDUVKF0VGLwyTsArj8oUP/4x/pv/W2Hxiw+9tcNQek33a7gKxJ86B991sJuk/WeIn0mi+0W81TCYWn8uDq4ZmyG0eNuVLLaVGngMElwolcGruLkC8N5hLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(38100700002)(186003)(2616005)(82960400001)(4001150100001)(31686004)(6486002)(478600001)(44832011)(66476007)(66556008)(6666004)(53546011)(66946007)(8676002)(36756003)(31696002)(110136005)(6512007)(86362001)(5660300002)(8936002)(6506007)(4326008)(41300700001)(26005)(66574015)(2906002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJPYytCVmFLMTlablBoQmxkUFVpSkNaSTVlRSsvUy9wTmt6KzVUOURMbk52?=
 =?utf-8?B?UWU2UFdCRnU0bHR4K09oa3VnY1ZLTGlGb1NnTjd6elZ3K1VTd0RCR3JLM0pU?=
 =?utf-8?B?OTYxT3htMWtxK2dwUFZxVVd1UHFPMEt6K1RYUEgxZHZLTnp1czltTEdqWEtY?=
 =?utf-8?B?SElPa2NkSXNGUllWRWl4VGROSkxGeWladUV2ZDRDdzhaczdJbXJ2R0NJSUZv?=
 =?utf-8?B?cmZpSlVkTUVLZDQ1YW03MlNVcmRMMzhHQXk5T1BHTFJCUnJGMVNUM252NWV6?=
 =?utf-8?B?dmxTWkRwR2NFZC8yZ0xlQi9xUE9xNTNLbVRqUHYzM1NTWFUvRTJSZ1JTSkxu?=
 =?utf-8?B?SWczWUNiRnZmMnhTMU4zcnd4VDI2KzJoZ0NyRlNndFJhMnVKNkNZY1JpMWxF?=
 =?utf-8?B?ZzhKL1lucjY5Qm9NUzViMGFBc3gwVVVPcFZIYm1qd0NuY2lYMWxISzA4blZl?=
 =?utf-8?B?YWoyZWlhMy9BVGZ4MVZaUG1SbVUvWFdrcjVGb2hOVWw5ZEQwWHhpQUlPWGNB?=
 =?utf-8?B?a0lWempDTEJCR3B5VmtrTFpHbVpCOXA0c2ZnWE1PYWUyYkhYcEowVWQ5cGJN?=
 =?utf-8?B?eW5CUGNNOFpQVHlCYlcyYkh6WEtJZzN3djFaU0FxaTZZeG5rQ1JEKzY5aFYx?=
 =?utf-8?B?dzh4UUdpQUJVTEJhVldqVHRvNlJKclkyNk9xQmNFcVFQQU5tV240UUMxTUFl?=
 =?utf-8?B?cjFKSzd6KzZsNHRqY1owa0dFdk45ajExR1lNNXR6NG5uM1lTMmx0QzBrWEhr?=
 =?utf-8?B?MWpBU2dtc3RYTjZER003WDUwUmxKRTcyNlNZK0hzY3gwYUppeFptWEk5OEhx?=
 =?utf-8?B?Tnc3VG9wUkMrS3ZTWVhNM2JjUnFMRklOdGRrSDNUSjlhRFp5bk1TRXd2K2tL?=
 =?utf-8?B?OFBnaU9OTTBUdUw5RUJ6T0JGUTdiUGpHTmFXQmtHelFmMGJweUVIYUo1M1ZP?=
 =?utf-8?B?ak9ZakVMNjlIT08rMGVvTXVUdjEwczBjUDdackhRc05SdDA1L0U0MU1RSG84?=
 =?utf-8?B?Z1FNbDhFQVBrZ1g0VUwvRUlSdkIraVI2V0YvQnBvZlh2dXlYWkZSeWZvbUp3?=
 =?utf-8?B?Ykx1UlV1NlNzS0cvd0NmUjdQd0lXSkc2cXNNb1RCdjI3cjVLL2ZWMCt6SmlQ?=
 =?utf-8?B?NVRUSmZMTkpmc2hWL3k1WktraUh1Sy9PYXNRUjRIM09LenpzWElQdXdWWWJD?=
 =?utf-8?B?anhHNHV3T0t5cXoyajdSSnVxS1RWUThVYkQ0dGRYZndTSXdLMzRrVVhDanBN?=
 =?utf-8?B?TitnSjZTMUFxWXJGZlliQjVCYTlmc0xkRG9ZaU1qcENHSkhUUHhuSEVGSzBq?=
 =?utf-8?B?UGZ5Q00wNmY0Smt6dkFDZ1NlaFAxYjFDSnZyMkU1bnhaR0hOeG9oYWZkN3JM?=
 =?utf-8?B?aFBhN1JQRmk0OUEyb0JxcE96L1lsMnpkYnhRcDJXTXVGdTFKOEdEL0NuempC?=
 =?utf-8?B?ZjFDQ3FUUE1BenhVSHRxa24rb212eCtVYm9mMjdpbjFmY3RwRDdDZ1paa3Rq?=
 =?utf-8?B?V21SQ21pLzFvbUl6V2I0MEM3Q2l4TFk5bUptUjVwaHRwUmVxeWN1S2dqNnRX?=
 =?utf-8?B?TjRkTE9nUW1xcjlVVjdDY3MyRzZuNEc2TVUzb0VUVm5VMGpHZlF6N2VmcjVM?=
 =?utf-8?B?MkN3WTRVdDltUG1GK2ZwdlI4aGFMMmswSjFzZDErVVZWcEgzYmJLK285QTc1?=
 =?utf-8?B?RC9ReWZIWHl0aHFqcCt2czdYeFdBMkM0RnpkeDVYVDVYUDJCQkFISGlTYkl5?=
 =?utf-8?B?WW9hbVEza1Q0VHNVRWJvWTExUS9KOWZaZUFsWm02V05jZUxsc3kwd1JzcG5K?=
 =?utf-8?B?RmxKRlVIQTVUK1luYlpVYXZXWi9BRTROaWc3L0diUkFuSTRqK05pWVJKWWhN?=
 =?utf-8?B?UTYvQnlYOXBCY2JWRC83WHZ5cUVMcUpFazJUeElxV3lQSmQ1RjFRRFdQMTIw?=
 =?utf-8?B?OTJaeUsvVFhSMFovS2RzcmNMVTBxbFZkd3NHY0R6b3JOVzBIWWJqZk0xQTY5?=
 =?utf-8?B?T3VwWi9zY2UvQ1AyT0hrTnQ5K2plOUhXUFlWdmk3QlJWQWwrMDZySk1lOXNs?=
 =?utf-8?B?czBnN1NySFFoRXdQaUw3cGtjZUR4bVhldmwwbCt6SXFubUpFVFgxY0poZ1R0?=
 =?utf-8?B?WG9sZlNLdHJQWnFIQmYrL2xFYkhWYjhKR05LbG5VMmdLVXM4bXJWQXhsNE9J?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8a20f5-14f9-4a55-f2cf-08dab1c93690
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 11:58:19.0714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZQXr1eKQQNxQq4jIvjytvODiAjwPkobcfh217ay3spl5RLg+zvJjtoGxqVAIQtOnet8MvtBb34bHmQ26amQ6dMPeS3YNnvOwLo/OsqC60E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
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

On 2022-10-19 1:16 PM, Péter Ujfalusi wrote:
> at the moment:
> # ls -al /lib/firmware/intel/ | wc -l
> 108
> 
> We might have 2 sets of binaries per platform, one using product key,
> other using community key.
> 
> If we dump everything in one directory (/lib/firmware/intel/), things
> will go out of hand pretty easily which can be somehow handled with
> complex file naming. This is only for the basefw, then we have the
> libraries (however they are sourced) with again two sets of keys, platforms.
> 
> Surely it can be done, but historically SOF prefers to use directories
> instead of pre/mid/post-fixing patterns of file names.

The concern is understandable. We haven't said that firmware files 
should be put directly under intel/ though.

> Also note that SOF is looking for a module UUID when trying to load a
> library we don't track arbitrary file names (see cover letter).

Neither 'dsp_fw_' nor 'dsp_lib_' prefix is arbitrary. A library may 
consist of more than one module, each with unique UUID. In general, 
'library' does not equal 'module'. Now, when speaking of modules, 
firmware-loading procedure that searches for file with certain UUID in 
its name is part of other drivers too and I haven't questioned that - 
it's perfectly fine and we're making use of the method ourselves.


Regards,
Czarek
