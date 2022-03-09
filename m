Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8AA4D3532
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:25:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F35271728;
	Wed,  9 Mar 2022 18:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F35271728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646846729;
	bh=HiP7FH1AcjE+FRiBxr9G8nNjHE7iET32YY9kBr6zoNs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5Kno+lGYcwHKIyl870a/HCyBE5acH6uk6VcXbGQV+Uy4P0zMC5S7O8wViVrYyRLm
	 XNkWw2HXnoE5qv/5vky6nStZfqo08KkjQVS8j6NKW8M752SRfFYW5iApvSVu4l1QyF
	 NhdFBtyG7eg34wJIOqqLbs/8AZcE9Nl185U5WZYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC20F800D2;
	Wed,  9 Mar 2022 18:24:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99A3FF8016C; Wed,  9 Mar 2022 18:24:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E3C4F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E3C4F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Tz0nD/68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646846658; x=1678382658;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HiP7FH1AcjE+FRiBxr9G8nNjHE7iET32YY9kBr6zoNs=;
 b=Tz0nD/68OjRXjg7hbiTGWH0Eilr+U/bKiOLp/L0Ol9Da0/JhK4Yf0Z2P
 hpJ7XAgOxUKoR/ADdaHEGCemsmSSxlJNuEORyPtlr0282uBEhM/SDcGeO
 vJiKEnkkSyK32zABFk8Yeh8kh5E5MgSp9KR6I/1aJq59RTs6DGYeM8OTQ
 x4Zv9w9JosugulCEW1K7GBg569QOMTZOZktSoaPQd4HHQQZ9X74Dfv+tz
 4PJkqwyOBGoitZYJOAV6aJ0lXVNANj8liMYy0ylhwnh48nZJggU/MHN/t
 vKW5vSQqXksFMs0O115lMtVuwuvKYfR7+cfUMwqWrVfKc3Tp97kl/mziG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237205252"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="237205252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="712025192"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2022 09:24:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:24:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:24:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 09:24:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 09:24:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WITmIiz9P58hYIl50+F1mISJIwSc/lQBHTP8Pn3Lxw7VKaney1QUc1rqXVeHT+ErOvPIENay0srSMjuxbiGC3CY+kyShkZhLz1F6+0Z8AfbvYCHx3q1MXWZKidtxtxGV6QJxkv/iMkadgWlMLblwB0hZxraCnMrLNyjmpuFuinLJoPzen2bV8cQQAQ25/LLePb0PoQYnU8iS8Ck6j/Vp8iQ8xHIrUVyVTQPE8FOFDTycldCGje0wYGL6EPRfnE4ttKpvRDElQUkjb8OGszT1KKjt40mBMBP/J2rjGBU+xl5NFxaBZSd5Y4KfEt8huLx33nT9yro9jrVYtGtbHdb57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaghoAJ2k9FKBMlxuFNDTlW+aet90DDMQVEypMgi2wg=;
 b=hzat05bJ5BnG+2uOIzEwubkbfzuiqGTbmWsKtwPYXgPmMnjo6qHo5fPbwqxqGJGCa/ZaL6vPPzIfdI0HTbCQrBTv92EwByYnGqWp7H683DEkp0QRhbqMm3Fnu8cobOoJ6AApIesFaSoP6GaaxMgtEbtRydFVs9btjpHH/H2AaN5GByqzsb2r00qNG8o3Q6e1yc6HZRNHiT30Y7mlHOIOT3h2Yotw/XtkFR8O5J0rYnvsXosidb/FmsYlPynDT3whcaUJkbPeiTsjf7qzmf31ehj+uonKzkLNsh71nIKxPmx+xqWJuS6ByLwisSAA+17fYBwVkIP1+8wWVPu0g8yF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB3939.namprd11.prod.outlook.com
 (2603:10b6:405:7b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Wed, 9 Mar
 2022 17:24:05 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 17:24:05 +0000
Message-ID: <457ddf2c-c0fd-bd26-d1e4-436748150712@intel.com>
Date: Wed, 9 Mar 2022 18:23:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Ranjani
 Sridharan" <ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
 <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
 <f70be289-ee9c-51b5-4003-7bc567e87a54@intel.com>
 <9f4cbf5a720aa66d6a540092187ad88b3adb5525.camel@linux.intel.com>
 <4691b216-92f6-8d46-d3db-e302f5f21c34@intel.com>
 <3c79c158757bfd542747bcf7b4de73e4529ac4d5.camel@linux.intel.com>
 <361901b8-f8a5-7b27-ee44-872c4e10bc2c@intel.com>
 <e71e12e1af0b9af115410c8210f21f4e50a09e6f.camel@linux.intel.com>
 <6afef2db-724b-dc42-b6c2-b233c8ba72a7@intel.com>
 <269ceef4-2d86-8d52-6946-c69859e970c0@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <269ceef4-2d86-8d52-6946-c69859e970c0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a154f0d-7f2e-404f-f1ae-08da01f19c46
X-MS-TrafficTypeDiagnostic: BN6PR11MB3939:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB3939B8EA461F8FE0F2E0E5BCE30A9@BN6PR11MB3939.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: agMczkomVLaUpY92F+Evt32Iz4XL4l/270XjahuroAkiXM1rKZgPoKwaNatlxPjDrjWPLt7lCzdpqZ4WMKST3YHetH1lcGXpwvXAFHRzc0RId0MvsxtLf6IZaSB9e5nPa+r8h+6l+NIDzZVEpzHInfkhX0FWxPIvLci/rl4dk7fDPCppOp8yLI+XG+rpdvSOkuvff17u+OKY6Ekp8ptIq1qIQrFOPd5mJTdNmYk9uh/iYVOnPmq/aPh8NrZLMTvTJzPoQPWKTCKY1c046zFl4sl1aU+EJd+OHS2pyGhccJHUddTKye2FArM3+f8NKzPU0CcWFbsTRJ8Suuxym6r6nXXFpR0uh30kq1MjL6siOzutUuoC50vmGfaGsSRCHs4DFR7DARYGy8V4y0W6IcNAF0obynFnkW58VWpaN6S5Ru0p/zVWE06oKkIyOspE1IdyfXgSaDl0I3/p0Yobs4xfhGAbG0gK33KdOPycfv1YUZnpY74D00viRSzUTmc6wbtg8iNd8im+aymbbofq1L/YtnBRco2IVuII0Sn2/uiIL5B294Ufh+GmNwk5ZTN8Vwr62j/QyPcDQv/6WjtiZMo6bMawwxvznEFAq3/0td+MkSqQpqPqoj4aUmHUpTyPAnWcj5SCkijElDYr/5116MDrMgcqX4+zjheLyCcdCw+50dEhDBoCy+VEnAcWnwss6Bi2OmLs4jvcUYcOV6oz0vJwHndRnvfpjdFXzrKRjY10sW/3wBrff/ydzYNcsuk57f2K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(36756003)(44832011)(6512007)(6666004)(5660300002)(7416002)(6506007)(186003)(2616005)(82960400001)(26005)(83380400001)(2906002)(86362001)(8936002)(31696002)(508600001)(31686004)(6486002)(110136005)(316002)(4326008)(66946007)(66556008)(8676002)(66476007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW9PVTBUelNqWHkyTDUrVnh6bGE4ZS9IRVhXajZ1WVprOVdmVTBPcHJ0N0Fr?=
 =?utf-8?B?WktjaUh4WXgvaG5BQ1lCZXJkdzRWRTdNcG55YXdORmxrYUlTemlYaFhrb1J3?=
 =?utf-8?B?bGZXM2NvSjhTM3RZUlBFMkd5VWdkb3BoMGV3SGRuS29yS3BXMHZiRjFUeU1a?=
 =?utf-8?B?TE0yQVFRSDI0UnVkd1BwRStnTm9acS9KMUplUWxZQm1DdGxGRWl1N3JsaDdB?=
 =?utf-8?B?amN1ZnpkZFVZTmYwWDFwdGIzdTBKd1VvamtHTE15OG1Tc2kwd1Z6VUdUdnUx?=
 =?utf-8?B?SHBhK21wUXdTK1FJNG43dUlubnBWeTI1bVgzclRvQStaQ3NxYlJ5RzdUNU9h?=
 =?utf-8?B?aHh6ek14WVJNam5DdXRwc01zQndrUmZjUWFCdkpVbDdyMy9HcGRFYTkyV2J5?=
 =?utf-8?B?cWdlQ2pWK1hRRmFlWU1lWHRUUndHY0pvU2pISjRJQU83Y2k2cW1yUXYwRDhB?=
 =?utf-8?B?cEczcG91VWJmMUxDeUhLOXoxV2Z5Uy8yQU9TdmtvWTVuQUpYNFFKcUlSRy8y?=
 =?utf-8?B?Uit3QndNc05FREptUE9lRnI5STJrdTJKM1N2ZEFOQmIyTkJLOXRqS0JVOUp6?=
 =?utf-8?B?Z1dVOWZzd2F3OWVMbVcvcDYvNHZaTVI1bDExVVhFcnRRZ1dUZEdOcjNhSEwy?=
 =?utf-8?B?NE8xTzVGSUZ5NHViU2dZc21iMWg1VG9SRE5PVFZoV2Rkcys4NXBzcGo3bThK?=
 =?utf-8?B?akxWajJ2MWZ0VEtXVldDMnZveS9BeDl3aCtld0ZEME5lZmlPUW10QjdHalF4?=
 =?utf-8?B?bUNTK2tQWWZYOC82UnRFV0NFL05HUUw5ai9TalFoYm1ENk9FUzFvT3hEcWtH?=
 =?utf-8?B?cG45ZG54TzhLM0JXSTFEN0t6a3gxY0lNcG84T0xhWDNONTloZWJSeGRxMXhY?=
 =?utf-8?B?US9DVHhOK2gvNVRLbitlMFdUcVo2cnJ6RmxrQ25tbWRzZDlDSCtQcVcyYnBK?=
 =?utf-8?B?VzZSVE51eUJWMUV0U1FTcS96dmxiMDFXV01OclByUEorbDUrL3ZkMzY1MTJw?=
 =?utf-8?B?dG5HNmxCd0NzTTBqdXZ4Vld4OFB2N1JtWDVVM1BUSjRHNFRZdUsrOW5ZT3Jk?=
 =?utf-8?B?MDNJaGcybnppbG9aRWRycmFLZTlRZnorRW42cWFNd3pZR3BTWG12VC93OTZn?=
 =?utf-8?B?YmVzK2RpTzgxaXRkMWk2Zmk0cFZuRTAvRmFSRW5aWmpldzUrUXZTekx1NXlT?=
 =?utf-8?B?WlBMT1lJaGxGbmM2UFNLcW1EZ2JpUmJ5VjhyRWlUNWZNK0p5clpoTUFBTHpj?=
 =?utf-8?B?cndwZmtDUGtoSTUwL0J0VzZEclZEcnkxYWNBZE9KRnhnT3NtUGkrNHBQbHdo?=
 =?utf-8?B?aE5yQ05iakErWm9JTEdtL1RyMlFkUVkvaEdrNU9KV2M1NVdnRjhCY3FJRm1E?=
 =?utf-8?B?OGMrTjZFdjFlYlFkbkVBRXJTaTExZDRSN3FZUGJkYU1qVWJiRlJWaWlkSk1m?=
 =?utf-8?B?cmh5TTBqT1JCUW9nMlc1TW5YMVZCcXNWbXdyOUQxQUNjdElScnFiZjBjZzZX?=
 =?utf-8?B?cDlFVlFLd0N6SkhFUGpZKzNHb3NEZysveXh2cDBlZmwzY1UrV0JFWXhJOUZ6?=
 =?utf-8?B?alRaakE4ZWxDbmdYanVabjY3S0YrdTZkcHZITDlOWVZ2emhMZ1JSSUU1dVpx?=
 =?utf-8?B?TUNLM3pqUGZ0bVQ3dUtsakx6eDB5Q3B1Vnpwdmw0M3FSWVZ4cks3YzNncVJO?=
 =?utf-8?B?WVBwT3p5SndKRUMxZDZJbW9zdVN3azYweDdja3NGNFJDcnhyYnVZUjg4OVh4?=
 =?utf-8?B?NUtyb3I4VENPVmtXRHJoZFlkdFBndDhuQTBrZGdRQ1AyR0ZjTU94bnJJcUhE?=
 =?utf-8?B?MzNpS3RmdlBrWnlDVVVOMU1JV3hmMHFnandFOHU5S25mMVVncFZSVU8rWHJw?=
 =?utf-8?B?bW92ZTVwRmRmMGZsazJyYWVGVVdrSXVRWi9xbStGY3hnQTBZYnBjTzlYekdU?=
 =?utf-8?B?N2tlQlBkaEZYRGVlM1RuRHZ0cXZEaHc3dk9TOEFQNjNXbVl0SG1BQzUwWTVG?=
 =?utf-8?B?MU50RU8zWEw5K0tiSVI3RHlKZ3g3aXBXY2VnOHhOeW1rRk50bStyM3h2eGcr?=
 =?utf-8?B?YUFKSHhwUVJLd0pGejBKREdFSkRCbEFvV2NBdWZheTBkbTlhNXZvNTNyWUZP?=
 =?utf-8?B?NWl3NC9WWjl1NU1mRi8vZ0xvdXJTcnNwRUlFMUlCeFFrcW9ERSttVDNyZ09F?=
 =?utf-8?B?Y3djejNXRDI5NWFNVTI3UXVqTk8yRlJzdXN2Nzl0MElFVVhESWJrY0wzWVFi?=
 =?utf-8?Q?esDxNedtea16cfdt5SWWCqvpQV7fae6beiPNulqsIc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a154f0d-7f2e-404f-f1ae-08da01f19c46
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:24:04.9799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aC7Xm6gNWhf+D511x/REOvlNLQZfXiDMDDvaBceN9rwEWYC8ToYLzE2obgcjf0RQZyCK5bkHTIZqbeKZdOJaRVZAX1T+4eVfTSfUiZlrngw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3939
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

On 2022-03-08 8:42 PM, Pierre-Louis Bossart wrote:
> On 3/8/22 12:31, Cezary Rojewski wrote:

...

>> Yes, avs-driver embraces granular sound card approach as opposed to 
>> super card approach. There is one topology file per sound card.
>>
>> That subject is not part of this patchset though.
> 
> You would still need to clarify how the same set of modules might be 
> accessed or configured when different cards are created, or if there is 
> a 'clean' split with a 1:1 mapping between module and cards.
> 
> The more I think of this the less practical this 'granular' approach 
> looks, e.g. if you want to route the same stream to different interfaces 
> handled by different cards. An example is playing a notification on 
> local speakers controlled by HDaudio and a Bluetooth headset using I2S. 
> This could be really fun to represent even basic volume control to 
> users: controls are card-specific and some parts may be handled in 
> different cards and thus different UCM files.
> 
> I really think the best split of a DSP topology is between orthogonal 
> parts. When muxers/demux are used, or multi-input modules such as AEC, 
> the routing complexity outweighs the benefits of a simpler card design.

There is a clean split - for all the typical scenarios, topology tied to 
given sound card defines the stream patterns completely.

Even when considering "functional" split as you mention in third 
paragraph, multiple sound cards are still there. So, as I have described 
earlier, to prevent any unwanted behaviour, cached module information in 
form of ->mods_info, is being locked with help of a mutex. We do not 
duplicate such information per sound card as that would be a waste of 
memory. No matter how many libraries are mentioned by the topology files 
and loaded throughout the lifetime of a driver, there is always just one 
base firmware we sent MODULE_INFO to.

In regard to advanced scenarios and more complex routing, it would be 
good to have that conversation as a part of dedicated patchset which is 
going to follow this one (sooner or later).


Regards,
Czarek
