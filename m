Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D54E2B9A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 16:16:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 786401730;
	Mon, 21 Mar 2022 16:15:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 786401730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647875764;
	bh=V53u+XFQG4N22cSEWdIzaAukdnIFJzpRlfhVviY1Yjk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJBnSCmS+F6lX6nvXACHFoiMQRVmx/A0h0yGL3xxsBt5QeeTUPjcB9W2xF06BKFU8
	 WuhV5TCiKcmVIj2+L4LdKkxPadngHUcpWeaZ/aW/fbZu9T/Ghjx877iB4Gjb8Qnr99
	 cBS/YLu3T3gzFuoO3Hc0/LWfPguPnzolYQgcluXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBD12F80109;
	Mon, 21 Mar 2022 16:14:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7D50F80227; Mon, 21 Mar 2022 16:14:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8BBCF80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 16:14:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8BBCF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AtOUX+hI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647875693; x=1679411693;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V53u+XFQG4N22cSEWdIzaAukdnIFJzpRlfhVviY1Yjk=;
 b=AtOUX+hIZfiJ6dlEWBnrMKlx+sPnYTyHUEmToGeBfu8DvGhhoDqrbITj
 FsjK6qAEkYCxGHTvrSh/e9Yyg38r2FdibetoqV5g/o6l8KVanYDCtlq6H
 64bhz/8Q+eZsrKnWeckuYbusF4baBy5B94FH+kLu3xDQYAp5HSKI0Bdsn
 ZyxOCBUQvRtJqY4Pu13XDNhmPBCHctJf1k4YT7dA708GuOvmHH2nlNex5
 vVgLRH13Yvqnxq0Ddwo3n41ddc5lXQJipKMebF1MLpCgeD5MvIfRWJRyV
 9Y3SmKukpxu6oOSvMRtB9VhkruVk8d5RTJUmlj6S2FAJMLf9irYdtBYmF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257765498"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257765498"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 08:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="600514294"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 21 Mar 2022 08:14:26 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 08:14:26 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 08:14:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 08:14:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 08:14:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY/r33gcJf9sn2IOdoIVxv1tCgHINl2fBPlJrclrxcCu5XXvv+lY+d3P+hhJy+bloO0hMYihyLAEheFh7G9jmfgvr0z4ZXVvOT444baA61UOmHy6BX0VAh5uJX94tKpWEd8JtAMQgYrW2HcpFyDVYcxzchGSBU/9HlNR5AQ98PVgrUucnFUzvFOzgzcg4Xw9b3rP2ZBG6Euzxeof9V7wHGY6q9WfQA4FO6ypIT7zsRsMqtkiknpVQr5IdtnMEUVrA0yF7EaTvdgkGl4hT2zGCyl2Qrvy6/kT55W6WPB4MGVs2gupFcC0bPDxh5t2Q9SOCf6PzRm+HzX8UL9ysu7Nqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClJfgOVLI6rugxk54la94mwOSwClztZK4mdxjkSaDcg=;
 b=fz4etdLTbM7iAOJLExTqy3NuxtOaLGhglOuv6sP+gJcCqdrws8NAKztlt+qtkDwM8tBMCn2rYj/qyFa7ZMMQlkhDEmMUFKxD/emSxOGtL/njVOumZ/gkircTSFiY5Lxa5BerP9tMuO6CvDfPnvtUE9nBq9MXFWMOFWkoHmUykI20INNw2AM1wIIK7AelcOCG7o1mSmNlhWkazA2hVcQp7//niqYOOhiG4QQO6Nzhqd7K+UY0/Qz7P+qb44R6JSdt2lec31NYHKOou3SoqPYRGQ8OsqvkJXLwRa0KRVdEdj5K113/4sF8RIvIabfIkEO3D/VHcdESDpMnun9Pd4ULGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SA1PR11MB5826.namprd11.prod.outlook.com
 (2603:10b6:806:235::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 15:14:24 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 15:14:24 +0000
Message-ID: <d950992b-b416-0455-40fc-62c7527562f1@intel.com>
Date: Mon, 21 Mar 2022 16:14:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 05/13] ASoC: Intel: avs: Parse pipeline and module tuples
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-6-cezary.rojewski@intel.com>
 <4a59eec7-f177-65fc-1c4a-3e8f34a828f1@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <4a59eec7-f177-65fc-1c4a-3e8f34a828f1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f58bc64d-7952-41a6-65e5-08da0b4d7b9c
X-MS-TrafficTypeDiagnostic: SA1PR11MB5826:EE_
X-Microsoft-Antispam-PRVS: <SA1PR11MB58268824916EA9C38FD6C5A6E3169@SA1PR11MB5826.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OS1+u+r5jZQ/zW0/JjR1pHS/n64aZS2+IIvmW6Ffz4ifPYHS4BHLxdA+BpMTPvj7rkHlZw7d18S0oJ0lbi7XQIHkEr/4ebQJrSP4w36eXo3DWhRamu+78y/JAFJnCpo8v2fgyu92S0i7kv3L86BCZqF1PB4fgtULke4/Za3iBxGIaSlKyWZcW7GM8thbt6e+O0kKSGzlV1XnVUUpmM9E0WiY3KGsTIZIfINzgnQ7dU47CV4lFMQfx5sA0+IXOp0rltY7I5nxraU2YXXNWwRaUzWPJcMCKox9hZ1nAivketg40qmYhWy2bfQpsXAkXVUFNxwoQixCKqWasNgWeyptL6uRV73RCHDFHDcPiHKlbDQsnNPWoloaGzz75YFQcgkH8D+feoxyxhkct+MeuCEVdIVLriFNnps2WySbyIX0mb+Y41gfheQwRAIiz6l6bRwSYzVh6G2g4oCVckwtyoqwiyYx9oF495syK+dvj7iGkD78DtMJhm819rb5FxyQETFLfgMIC1K3lW5gfjUGELbA77k3OFQGWBfqwhGKRppQnNgPzYV3iuylGkBFCMcaLjnrIaHjMgFYkpD0yrCSN1v21arqfcPd17TZz03qkH9nUzy5L+GcIhqa5o0I3lIsTcHNPxacoGUoiwf7z8yNuaCoAXOqNmFYyM9R32sske1pGMqYWS5SQ+Cg1+wmCRBjfqIZ/sfpaL/QRIs/7hh0qvGhDpjmTbFZ7PZ5AmoME2J98Qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(508600001)(4326008)(8676002)(5660300002)(8936002)(44832011)(7416002)(36756003)(83380400001)(66946007)(66556008)(66476007)(26005)(186003)(2616005)(31686004)(6512007)(86362001)(6506007)(31696002)(53546011)(2906002)(6666004)(316002)(6486002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VndpRDFNanhhWXQxUDFUZjd6ZmcvOWpUa2w4aTZ2c2J1YnRja21Pa2dmZS9E?=
 =?utf-8?B?cmFFbUpIZmVITUJoSWJQdTJTN0lzSFo2L2dIUWZlZ1FKN1dFREozYm5lTHY1?=
 =?utf-8?B?OU9CZitLNzFkSHh2QldTclNuZHl5ZlZqdnJPREMwanBnS01ST3JZNFlROUxq?=
 =?utf-8?B?ZmFIZWJtYlJ0V1VBV09leFZ6V3EvZHVuTEc4bUFtTXE1VjlnUmgvUlh6b2d2?=
 =?utf-8?B?SldIK1lkVFV1b3JSQVdQTGRHUUVkcWZ4ZWUvRGZHMHJGTzZ6RU1qVUc1cGw4?=
 =?utf-8?B?SVcwbER4bHBuUU9jNlBpQXh4TjlaK1RFWDYwcGI0amowWGpnWjlhZDJUZ2Qw?=
 =?utf-8?B?ZTMzK3hSRHJxVWVsSW55QnBnYk95MThOMnBsbDRXMDRWR3R6TkpzRTdSNGF2?=
 =?utf-8?B?VDMwajNVajNiUkM3SlV3TGdLQkc1aUozR0JvcVl3RjZZK3VTdGYyaDJZdzhh?=
 =?utf-8?B?QjYyWVRpdWtnbmwrbjQxZUQ4QzBMNDFxQmJZYmEwUzVHbnhvN0t1TlBFeTBs?=
 =?utf-8?B?a0huUzR0SXptK1JMeWU2a1AzUDVPb3lhTkFwSXpTMkpYQVlUV1U5UWVweUFy?=
 =?utf-8?B?SVlNRXNZQkx4RU9CVHV0OXdxRmVkZEVUM3RVcURGY0JFZytHUkxjR0tEOGhm?=
 =?utf-8?B?Q29uZlg4OERGdXJaRW9pMmFQQzgweU9mYlNQNTJLVDQwL0lGeUJkaC8xVzYv?=
 =?utf-8?B?Wi9VNW9RYzN4YUN5T2VKR1JpQVZ1c3prSnFWS3VwNGJwMUtxaFZUbC9VR1Vq?=
 =?utf-8?B?dzFiQWIzRVNocEE5Wjd6RGR3MGw1U1pPZHJIenJDU05PdWZoMWZzRU02Tmlk?=
 =?utf-8?B?NlBPM1JJd1pMR0ovSzZvbEV3cGVlbCtQT0Y3ekVmWTdJQW9ZVHFPK25hc2p4?=
 =?utf-8?B?a1A4aEFLRjVWMEIweUx4bHhodDhsbVZ4YTNGQjNtY3g2b0RtSE02Tk8zSzZz?=
 =?utf-8?B?MmtCSlcxaldwMkxDd3pmZkV1MXZRQlZMbW5Ra0Y2SmNtWmk2N3psbDVRSk5Y?=
 =?utf-8?B?ZzdZaHRUNDcxZzZNRHhUNUFuSVEyeUxrK1ppeGJBbDc4WU13Wjk2YTR1V3h3?=
 =?utf-8?B?QzlWS2dyR1crRXZxV09ONFpiWVJFTlRGTlQ2b1NuWTNQajRxamRISTJXWkc2?=
 =?utf-8?B?dzVXRzFrWUpYVkg1OHhkYm1INFZUVjBBVmQydVVaUW5DQlBoclpoRnY2emN5?=
 =?utf-8?B?N2t1WVRncytnMVBzeVFpUVpVQXJzYTBQZTNPdVAvMGxkQklUeWJYOGQ3OE5t?=
 =?utf-8?B?bVFkL0NMSXVBbXpXanhEQVArMGNTNXpJY1lpZ1dRbFpvOWZhVDdIMElTYzBI?=
 =?utf-8?B?L0duZ2Vuek8zczZsa01jUGNHRVFTUC9tMWx2c0M5RDZoUk05aUVCM3lxY2hY?=
 =?utf-8?B?R1lkTmRtc0dNMnZXM3dLb1Z1clhKY0RrQjBWSGJsdzluaW56SnV0TnZhYm5X?=
 =?utf-8?B?eTEwTnZKQVRYTHEvWDFNRUdTemR5d1Y5R0dycXp4ZElxOVd4SVMzWE5VR3B0?=
 =?utf-8?B?RlpzQThMT2JzM1dXY2xqV1F3VDNDYlB1QVhLMEFPcUhFVTR0STJiTWxGVWQ5?=
 =?utf-8?B?YmdwMnFsa25DenhwM0QwMXdISXgzMkdMMVNXc0NOa25PcVB0SVgxbGtsME5y?=
 =?utf-8?B?QlFoYll0OWxSS1IybHdRcVdqSFdsM1pYZ09NWWM2Mk1WVy83NFpCVmZsTTZI?=
 =?utf-8?B?SnJIN05TT3Bqdm05WEYrVCtUVmUxeXQxZW9IQkZxRjR3UWs0eUJwc0RMVzN5?=
 =?utf-8?B?YUpvQkhCcVhFVVBXVFZVeFQ0SDlpU3BSSjByVUhrK3FIRVZXSktScUhoWHhi?=
 =?utf-8?B?WW9kMkN6K3JndHVkTGF4aEswUEE2NER1TGhZRTFZc1p1ZVM5WnFZaldSV2dP?=
 =?utf-8?B?dkZqS1E4dVRaTUJ6aHhtNitTdEhoZEZvTUpodWlYd1NLYk9XMDA0dFdzTHd1?=
 =?utf-8?B?TmpKb240cXZ5a0FxOWxRWWtvWkN1bC9jNzd2MTUvNDJKQTRsMW45R0NueWdo?=
 =?utf-8?B?aFdPTS90MDNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f58bc64d-7952-41a6-65e5-08da0b4d7b9c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 15:14:24.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nlteoVAroaNsNZW7UCqe5VhTh7Wo9gsOfZVgZZbn7lG+48Lhqz358p2dNfpkSL7RjA6iyncfObHYka96ta6SjlbhwxpdDc813kZH3Y700s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5826
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
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

On 2022-02-25 7:51 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> Shape of a stream on DSP side, that is, the number and the layout of
>> its pipelines and modules is paramount for streaming to be efficient and
>> low power-consuming. Add parsing helpers to support loading such
>> information from the topology file.
> 
> again what is a 'stream'?


A collection of pipelines, usually connecting HOST (HDA DMA) gateway 
with LINK (GPDMA) gateway.

>> +struct avs_tplg_path {
>> +	u32 id;
>> +};
> 
> A concept that boils down to a single integer is really far from clear
> to me. What does this represent really?


Nah, the structure is much larger. Here, to have pipeline parsing 
separated from the rest, some stub needed to be provided.

>> +
>> +struct avs_tplg_pipeline {
>> +	u32 id;
>> +
>> +	struct avs_tplg_pplcfg *cfg;
>> +	struct avs_tplg_binding **bindings;
>> +	u32 num_bindings;
>> +	struct list_head mod_list;
>> +
>> +	struct avs_tplg_path *owner;
> 
> the cardinality between path and pipeline is far from clear. When you
> have topologies where the same data can be rendered on multiple outputs
> and demuxed into an echo reference, then what is the 'path'?
> 
> Worst case all connected pipelines could be a single path with this
> hierarchical definition of ownership, but is this desired?

Just like in other DSP driver cases, here topology states all the 
possibilities. It's not random by any means.

If you want given data to be rendered on multiple outputs, then you make 
use of NxFEs -> 1xBE which ASoC supports through re-parenting. Multiple 
FEs in topology would be leading to the very same BE widget. On firmware 
side you have copier which supports several outputs. You just choose 
different output pin for each FE.

> What happens when the user uses switches to disconnects pipelines?

"switches to disconnects pipelines"? How could user switch to a 
disconnected pipeline? Not following.

>> +	/* Path pipelines management. */
> 
> what is a path pipeline?

Does this question mean you want "Path" part of the comment to be removed?

>> +	struct list_head node;
>> +};
>> +
>> +struct avs_tplg_module {
>> +	u32 id;
> 
> what is the definition of id? is this local to the scope of a pipeline?
> global for the entire topology?

It's module ID, so it's local. Basically every structure starts here 
with 'id'.

>> +
>> +	struct avs_tplg_modcfg_base *cfg_base;
>> +	struct avs_audio_format *in_fmt;
>> +	u8 core_id;
>> +	u8 domain;
>> +	struct avs_tplg_modcfg_ext *cfg_ext;
>> +
>> +	struct avs_tplg_pipeline *owner;
>> +	/* Pipeline modules management. */
>> +	struct list_head node;
>> +};
> 
> I would expect all modules to be seen as DAPM widgets, no?

Makes no sense since module alone have no real impact on whether audio 
path should be powered or not. Only the entire "path" has any saying in 
that.

>> +
>>   #endif
