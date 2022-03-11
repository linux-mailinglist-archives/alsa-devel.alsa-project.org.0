Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E11D4D64D0
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:41:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8E51A22;
	Fri, 11 Mar 2022 16:41:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8E51A22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647013313;
	bh=ZbZ6pjDwFjhjqbj/ksRnU7FZ6VhLgftOj/t/Ovt7xN0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQaEA/4GKqVqdrX/UOyebOIw2iakrxZuvn4QIgvQlletIK4AzA04UIurdKf/9LJ9M
	 9hlY3E8FTvazK2bfdpmpxUU8PUIj11um8fJ7zRh7aDGpNHyydFf4HEiqW5qrsf4qTw
	 QhQcppjfVJXpwaPSjs6J5MDjSz9vynAxfU+ikRJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E0EF80518;
	Fri, 11 Mar 2022 16:40:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A954F80517; Fri, 11 Mar 2022 16:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B94CF804CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B94CF804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KJnVbUPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647013243; x=1678549243;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZbZ6pjDwFjhjqbj/ksRnU7FZ6VhLgftOj/t/Ovt7xN0=;
 b=KJnVbUPSYX/0rI4UZ1gjc+kVpCdPbX8xvnjFU97Bzy+ScWZM6iRApowZ
 HxfA77YwQ6FtfWPDbAsO3TEK8ITXa2786b+v1KtTMgxJPw6nTb1CqFtWF
 ZVCXMBaEoigFs0MUFgUH8UAwWve+n60mvD5gqZc9R97Br26qDYvL4JPxB
 +iee3KDQ8ArJeGxptH9nCEunfdjgRpp9lQNmMULXJ6Ni75QFkSvNEDx9k
 VhgiJe5Jm5nC8dDqLPHbxC3mp0BCyKgQqbpfPPHq4tj0mswJ7gYc9UXvy
 pPJc9L4LDOt34zWt8UeMf41h+77xihWtHTtoVqeDerRWhE/vtx44lw9cw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="235545230"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="235545230"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="633444913"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2022 07:40:32 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 07:40:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 11 Mar 2022 07:40:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 07:40:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqaUNovkxeJkVu02j6WlUlWE19vjKmNqVKjKWojzvfEC+eIsOy4hiuQNj/icrOE1B9MXSxjwMbsfOaWeS9j+azdNMd6uZ4MGIUiwWIiu7yrTF4esQtKE84LdLYBUshZ05vNXLqlh1SA9xD+g2ZsE4zLZWj+sE+Ll2MPU/XMnduACaDavv4AotfIbyWkrWejpXShKLJ3Mc9jBVb0tRqL0Sg6x9V6X29pYrlMM7tSVlyVLEqcCp39IGz/sxpOcOCZ9DcyeQuTMHtWUe4uoLkTrgagH8W9PdQfYQDLG0RAY8mepPDV+X0WTyml9SkvzByW60rWL47RmDaQ8b4rRbnYWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEj+aXOZ+5mz3U8p+uLevpRVxVlqJblYdkZwwO77x/4=;
 b=kp8rc685nzEPn4N2rcwEXKv2U0vGa8kE8sNgYYwfS7P1Ul033pgDLwIDoT12g4Q4eRl0Kj1HAwhJu3p1j1CNglcYw+FyqmEmvZZq2kPHrOl1r6HCx9QWCIa38Ak+mMqwyAytfPVYbgNe15rflPInkcqypIdEu2t0IKRtq0er+pdjru8eBsioCBaOaBPSEERD1nzOvCiIR++VCdZSk2Ms15kbGcoxjSVpr7lEIOOixxmnU0Z0c3SHiBEUQe5m8T1UZxAbL7ZpI67TH3JeohCOJ4TV3nkOB2QIQKBe7mFQzxpemvG14eTrxt/sSBbMFYET8ibqNOiGdt9L3s3dlhAOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1690.namprd11.prod.outlook.com
 (2603:10b6:3:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 15:40:30 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.030; Fri, 11 Mar 2022
 15:40:30 +0000
Message-ID: <37554d28-0b4a-b938-094c-709896451456@intel.com>
Date: Fri, 11 Mar 2022 16:40:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v4 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-8-cezary.rojewski@intel.com>
 <0ec3041d-1e67-e1bf-03b7-688cdd6fd51d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0ec3041d-1e67-e1bf-03b7-688cdd6fd51d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::13) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7eeef66-c50e-4890-0a71-08da0375788c
X-MS-TrafficTypeDiagnostic: DM5PR11MB1690:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1690E29301DB3E8E46CA1EC6E30C9@DM5PR11MB1690.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7Char3aO7iopFZxK0XfNBsOG3yjlnzShMuIJG+s6cYYFi2Oht7eR9p584ycaZdidHCtE45KOIWKCJ9gmHKGnifum8um0Kptv7R9P6xViRn7f8l7o8AL80w+5hk8Zk/EIbV7UQAwZSkdGpL16VlRQbCCIgVLRp5xTTYIh21z6RzhAyJLfPfuHSB1B7RwrxXkPiyWxsvZ+Hh5NT731dwSJ9lrP06Za1gLJvhmUpNcOLDrvjTPvjPrQjB+SwRnqtthfi4cfjQ1SYzrDBqKK6D7qcPz3Em0D9BhTj/lvEes57LBAn17eBJ1HbY6RTdl4hsXoxvQfFT1JwkjhVseG2yNLLqDkrhwxWAm6Xd/8qw1XyHxOrvJ0yB3n/JVFz7cMirWPhyG8cSnoOJoNxn8KKz1lH/zNd2blgNOSRqe193PQzOCWW4ailaZNSd0uoShwr2SSotX+RcFcaQxoGPLf+s1fLh8OqUdL+YaIvuzmziyrGauH+3NNPMn4PZ68RnCSlPKD4l0h/ynduoEkZ+tExF5q//o0ZJeKGkMKhPauJUZS0v+GTxomDqt7NqZvW1Y9WycXcYsiNiCalEW1z+mOG0x7r/l6O3NLRMvDj+ghVc10brPArDgMlsLAnPOLCeuMIRbTCzcW4sleW04OTauzw+txElao4PIojGATKb6dzlKKCpDTrEw7CW/us9QdSqHJBWpQJVrw9go7BjY0tEYQa61sHEp02E4tDjxx6P+DtPwdJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(53546011)(2616005)(36756003)(5660300002)(186003)(83380400001)(6666004)(6506007)(26005)(508600001)(6512007)(66946007)(66476007)(82960400001)(316002)(4326008)(8676002)(66556008)(31696002)(86362001)(6486002)(31686004)(44832011)(4744005)(8936002)(7416002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdGeWJpdUwwaE50WXI5akZjdklRN0NvUWs0WU1ZbTU2R0hhalRDZVArSk5U?=
 =?utf-8?B?WlFpK29JTnFSc1F4bXpoblVyTnpPdlRqT3lzWDRjd0x2bU9kcnpGd0dJYVln?=
 =?utf-8?B?MGZBSy96dCtWZ1dXOXFjSURQY0NUOG1nQXdnL2p4ZCtxZkRORXNMWE9VamdB?=
 =?utf-8?B?UnIzZU03Ris0Rm9xZ1E3OXRaVmVjR3ZsWWNNVEJ6THFiVmc3NWpTZ2U5ZUpw?=
 =?utf-8?B?ZytMdHlXWVZ3RDJXTjVyN3dLMm5KYnMyRUZLL2pDcGxUTFdEckp6blIxOVA4?=
 =?utf-8?B?aFFWclUwaituR2VCSndSdDdhYldNVVQ4YkxTTlZmM3lxWUJ4dHBNV2xxZUw0?=
 =?utf-8?B?ekRERGRIbSswamdTUDZ2N2VtWHRXcDVJYTloNzlPamt1U2hQeVVuVGoreEFM?=
 =?utf-8?B?RnVoOXZ2d2pXRTVmZS8rdGx3ZUZhSlJDS3ZTLytjWFJBWkwvUDlJd01QUGFK?=
 =?utf-8?B?OExnbVVlTW5QdXFvV2kvN3gzekhUc1oydHlXcjBndUxmR3VoZ0cvRG1jaGND?=
 =?utf-8?B?OHV3QXJrd20reFNNZXVla0lDSUpsZEdlUkl0MlRZUFBuQTg4d3VJYzRnVzN3?=
 =?utf-8?B?dDk2KzJvbFgxc3haQXFBTEwwcHlzNVJ2WU1FMXR2UG9QVG5qY053WGNBdi9z?=
 =?utf-8?B?TjkzdkYxa1loWHgyRlRsWEZudWVBbkwwaTdRS3RCbmo5bmRPK3JTY1NUclRB?=
 =?utf-8?B?K1pBbURoM1NkZGlKM1YxWHAya2s3YkQ3emdBRUJBckVaRWNqY25SVXREWWlw?=
 =?utf-8?B?YlVNcmoyWVNoOERadURGaXdiemN3UFM3NGxmYW1XWEhrS2NuZ3BHL0VnMWFz?=
 =?utf-8?B?WERsMHBhdDR0anhBd2swVklObHNHeTh2R1pXSHpVcXhhbjFWSzRVa0U5OFRP?=
 =?utf-8?B?ODNrS21QeVpxZ1J6alNFMEpZNG0vTXJEamxHN3NXV0s3SnRwSk10VTB3UGhC?=
 =?utf-8?B?RjZMS0U3TWpxY2VYYysveDBpYnVpRlJ4ZUM0UzVoazFqYzVwSHZqSGFzYzM4?=
 =?utf-8?B?SC9USTV5Y2xUVmlSY1ZEU052SmRoRDFONUVRYXVjdFJsS0JUaG5vTi95V0Uy?=
 =?utf-8?B?UGlDeEFheThpNDc4UFRFM3RRS3UzY0lKcmZrVzkwang0Zk00VUtDelJZOWRp?=
 =?utf-8?B?OGJNT0lxL1ExV2d6ck5MbFZaWWc5aTVDU211MksvbU5OZTdKVlJJTWVveXR5?=
 =?utf-8?B?S09zaFFvd3E1RjhRSWNmVGJDMFY4NUxGL0pPcHdwWVFJWkhGTk5XMXhJd2Jq?=
 =?utf-8?B?dWxJcUFQdVZOa3ZsVlhsWGtPRWhFSlZ1cEtBdjFldWU5d3IyZVMzRUJ5Y1ZM?=
 =?utf-8?B?VXZid3MvOEJiSnYxQ3JWVnpOQWtvNllNTHJjYlg3ZStYV214V3d5NnR5Ulhv?=
 =?utf-8?B?Z1dBN0pIZjRCQUtJZitKL3N2Mjh0UlVvdDMxVEk4R0pCY0VkZ2FwcTNzUFI2?=
 =?utf-8?B?N0pvVmZFZWswU2VBM1dkRFk3M1ZwTjJ1RU9OMmtYeE9qTTVxdE8xWlZ1U1Fo?=
 =?utf-8?B?SE50ejVMUDBHY21lQVJQODNEb3dIcHFEdENzb2Q0VDhHS1BBMjJubjlxY2Nh?=
 =?utf-8?B?WXNmdmVWNHdRb3VHNnZqOWdiUEtXS25PM3Y0bE9Rb0RyMTNrWUdFRy8wVHl4?=
 =?utf-8?B?UzdvUDRIYmZUMHg4VGErVVdrQ1M0eXRJYU10WXlGazJ0S3ZIQXFINTRqbDh6?=
 =?utf-8?B?YkZWbWdKblpZZGYxN2VWdXpuOGZ4S2xWUjgzK3g2UEZhdFJMZWJTQWwzTEZZ?=
 =?utf-8?B?emVmRERLNDVaMWtqNGcrdHlsaEUzYlpQTzZPcS91YXdodzJrWWNuK2cvVkVJ?=
 =?utf-8?B?TlZrK1BhQTBUWk9FbjB5RU00R1diUEE1QW9qVkV5ZU00REJ4UDNXa2xjR0tT?=
 =?utf-8?B?aUNDK1p0V2FaVFkwWGc4V0Z0RTUvcUhrOGhva2dnUy95RmNTNkVqM3BESWlS?=
 =?utf-8?B?dUlLdjk1c2ZRajNSMlhQdXE3WEZ3RDI3YUUyQ1FyYWczYUVWZWQzdjVXaDd3?=
 =?utf-8?B?NEZySnhGczJRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eeef66-c50e-4890-0a71-08da0375788c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:40:29.8440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpFZsSMu4l05teztvSsO5C6wQbcFvgX1qochxpu0rsKiZ9qYsMwgcJx1guhBcUKkPvWNka14sQao/Uv5v4Qf21cm4Lix9NcphTKsuLxorIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1690
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-03-09 11:16 PM, Pierre-Louis Bossart wrote:
> 
>> +/*
>> + * avs_ipc_delete_instance - Delete module instance
>> + *
>> + * @adev: Driver context
>> + * @module_id: Module-type id
>> + * @instance_id: Unique module instance id
>> + *
>> + * Argument verification, as well as pipeline state checks are done 
>> by the
>> + * firmware.
>> + *
>> + * Note: only standalone modules i.e. without a parent pipeline shall be
>> + * deleted using this IPC message. In all other cases, pipeline 
>> owning the
>> + * modules peforms cleanup automatically when it is deleted.
> 
> typo: performs
> 
> checkpatch.pl --strict --codespell would detect all this for you.


Ack.
