Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77BC4D64BC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:34:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 686621A92;
	Fri, 11 Mar 2022 16:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 686621A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012898;
	bh=ALFE5WmFvoWfsNxhpSEUZtNm221MInrpxCy1bLoZ0dg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fPfyp5t8REU8rVNItHYeYb2mNVAarl372an5mmZDqOvNgpLOe/8ZqSjnxtftQ15xJ
	 w+rPZebap8krpE7ZKR8KKK+i8guskDRZT5Y+ZDF9pe15lSJ2Dc5nshWM6GiL+43KqU
	 EDRn63HptHVnvj0Wej7jHFSFloFqJCJH115i5AnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817BAF8012C;
	Fri, 11 Mar 2022 16:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3889F804CC; Fri, 11 Mar 2022 16:33:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D87C9F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D87C9F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iKw4RveE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012787; x=1678548787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ALFE5WmFvoWfsNxhpSEUZtNm221MInrpxCy1bLoZ0dg=;
 b=iKw4RveEME6wNzEyHpS+ODsXIN2DSshBPbHq8Q1NRW5x8TOVw+3hl2zF
 GLl0xPdOO460ovmXm6QyyTkham0ULlFT91FzpV3JmTIyqUDmSdlwZr8j2
 99F9vmRCeFZg5grB1+Vz+vf7WywbRUQmzSsWXnvUffdgvhTH3SfDkSDqF
 y9pLwkAus1R0OfncZdlkRE1EIJkzwA4j+XNg31YOs8ZXg7ZbqqmkN5B1O
 IaY+DQwWRZ4i1N5QZGmSWNMrvKYrwQlDBwyNvsEIQ3G9JrV7sV5xpXANA
 OWn7u+4AGc3BHiXZ/FRZzWe3fDq+gaWJmW2pgG3mjppsTYhGS+/ggpQkd Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="253155312"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="253155312"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:33:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="643009412"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2022 07:33:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 07:33:01 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 07:33:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 11 Mar 2022 07:33:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 07:33:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3Fg53aJNCJbkBOgwloR77rq1Yg5mx5KSFOGwJaEYN1Yvq9eWtrj8pXxhjjroIVb1RftC+mbQp33k+WrfgEMuzmRGuFmH1WUmEnf4Fe/mAlfqt8IML/cMBUr+QL2qUIlEI1cqzRD+uNlZkDuZZztwJs/b91yfB0rbWM8q6a9ZM1a40Vt68si93WJvC97hB10XrQlAoNBUEyRWjypbT4SIe1xzWiTjOwMrS4Li5bVFeXHlONXxIiPTrKEl1bgVBL+m3PnfEH9mZ+QsZwZSYKW/lVZV+CVeJHfXHyCThFgtOd1PNVYE5Ix6MD8HvtzezlyJxwDcQ23KgvGFlyoMi7lsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTjF+pNrNh0Yb/M26oEWkZTksJxO/vHIdqOcAUmRh94=;
 b=Mx+uhDrYNArIT8YbVc22ANFeLQ2Xi+zOOep02v3WcRYn9FB5qsoFptI2py0ToRRya8ir3W9Gspj86Eox7Z59cdv2xJjmABBdelNLSmerPKAQPZbzRSIrb/WuqHiRjFJfVIK1Lp6dQgAN6SzZbCTdLLKMhi9rTF/BWdMkD8hJX+lslj87Q4GcBHXmHca7z09YRZmCPnDDeBO74bl6UGalvmwSsTsVGY4GA9eO7Qm3v1sabQNNUvrmXgPU6sDRakrQKt5VliQ3jLy6oE0XMYVPmt6o24SBBi6r2hll/KAQpJOlJjlwH6k0YUiDlFU0Ju7kNt/8ONPllpX8VZbWDusCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1690.namprd11.prod.outlook.com
 (2603:10b6:3:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 15:32:58 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.030; Fri, 11 Mar 2022
 15:32:57 +0000
Message-ID: <a9af7344-ad54-6740-8b29-ed268196b6bc@intel.com>
Date: Fri, 11 Mar 2022 16:32:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v4 03/17] ASoC: Intel: Introduce AVS driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-4-cezary.rojewski@intel.com>
 <d6f22a35-2587-268d-a4cb-13dd6ded5a11@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d6f22a35-2587-268d-a4cb-13dd6ded5a11@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd42f4ff-e5df-4c55-a887-08da03746b08
X-MS-TrafficTypeDiagnostic: DM5PR11MB1690:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB169097430210D019DC387E40E30C9@DM5PR11MB1690.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYvDE+UG1MXkNX1P9FR1WHV7qkrlj4yR50SI5DtQvE/G+vezGUi6z+8N6O48q08rc7PaTJ2C0/W8uiNa5kwUAzyBGMYuhlAnQ0UppoQPBpckKJ/EEuoBA5wK+Xn7RuNkj18dA6jw0BG8mwkTnEsg8Ud+oUfIRnpJjSD55+x8tj+EBMXarAHKQKGMYW4pxhkpJQjgvSpEgJ48lpf3uG5FjCufm4wtRZ5LjqwZAPhcRS13z5lzbRcwmVsYUMcfIpdUXOH1DWu20S9238UWUX7v9MOvVwzZ7VHKk9JuWrzEnhoUduV0QzgosC5kuyFs53TYXHyUbk01/BwTpkB2eh8j9rmh0RaFPzaNhts3qtkD9POWsB195uikJj4BzPxDQnal0iSb/j0FfilzsxaX5rh99TSRR/224qE0FXi87vBGp+hesVeXkDDqGecn5Uj80nWTspaMY8z9s/8sfjiou9dfUi7guHVqJkwXGEuadTiE4TiC80S4HrfJ9FoRCrF0tdflbxp8D0WIxdlY5ySybn7lQbn55Uj3xtthDPQHiH17umXlcanNI5X2clShQ3GIIuJu3QSDEvAb3L1fLx6rqWabUvW6tYO3nH748Fad+y0Lk0fzIhoV+neEwIpVqlJnpdAZDSLWXVR3iEFyxY1XIZTO7TjCXwxvQW4zdOUOsFFQBp+EkmT6PPn3qMU3v//iCf6dzR6TbT0njTr0zcVbi8e2cOuXxAlfIZ6MORgD8TyJBF9uv9kwpvY9FmVeiiOHx3+Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(53546011)(2616005)(36756003)(5660300002)(186003)(83380400001)(6666004)(6506007)(26005)(508600001)(6512007)(66946007)(66476007)(82960400001)(316002)(4326008)(8676002)(66556008)(31696002)(86362001)(6486002)(31686004)(44832011)(8936002)(7416002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGJ5ZWExeHoyTzdBdnJLZCtWNEpQdmlTaGhRa2J5UWVWbEd6L3dtNENtdDc0?=
 =?utf-8?B?alRNblgzYldrNUdoYWx0WHVDSCtwbnRpNGlYL3ZsQnpoQi91U0s1V3I3OStr?=
 =?utf-8?B?SFZKYUNucnJyNFplUXhmQUFtSUtXZ0lJdCtnSGtrVEZaNFpFenA4dVBGNloy?=
 =?utf-8?B?Nml4Rm56QlcrelozU2hwa3hUZG8rWVJEV29ac0lhbXRvQjdsQTZjUmNDU1Y2?=
 =?utf-8?B?Z3ZzNzRWTTRXUy9DVGRMQmlFNEZuQ1NvcTlTd05rcDIxbllMYWVpbGpQbmo2?=
 =?utf-8?B?M3VwUlhsdnlSN0lRWkJoSm9QQjBEVi82cFNsQ1dwTEVhSk1yUVd1eGU1R0NL?=
 =?utf-8?B?YTRMamljWTV5a1RSTHh4L1dFUFBWYmFDZHJzK3BmVDBVUkUrMW9paWxNdjh3?=
 =?utf-8?B?a2thQXl4eDRIb29HSEdUeFBJZGhXdFFFRElxeWlhVnRLaFlxYWRGeU1XakRC?=
 =?utf-8?B?Skd4REU4ZmNjMVo5VjB5T2hteWUwRi9ZVkhmcVp1aThtaWlRNmFmeW1NZXhE?=
 =?utf-8?B?N0dIQUhuS2ZNVEw3YUw1bWdmdmliUTNhS0ZjUThEempVcWFPdGVZVjFwNTdP?=
 =?utf-8?B?aG1qTGw0REo4VE9vQ1hXVnpWRkFVRTdLK2lHYitGN2RkY2VqRW5KSU1zLzlL?=
 =?utf-8?B?UFAzRUxURlBsOENSYjRueUtoeGtsWWY2a3o4Y1dpN1dEcFhwZW1QaTg0OWs4?=
 =?utf-8?B?dWp1MnRwMzlia3dtYkZpN21xYWZ5NzN5L1pSQmYyZmt1VlZyUGJJb2NlY0cv?=
 =?utf-8?B?Y2tOV1I3TXE0dDNTdjd4MC9jMGxVM3pZM3QxYVJ5Y3kzdWlscmF2a2srOUlX?=
 =?utf-8?B?Uis4Nkl5ZW5jTHJqdk91alNCWmdZMXdTYnR6WkxudU9KUDZnOTJNOFQ1V0Yw?=
 =?utf-8?B?bmRzUlF1N1VhN3FhbW4xWXRUYWFVWTh1Ym5nVEFSVDU1ZEJaeDlpL0ZhanYv?=
 =?utf-8?B?RXZvSTBuSFcvWXNjKzdmb0NnbXFoVGFqblozSWlhVnZSeVgxQ2tPY3pLSnla?=
 =?utf-8?B?UUNhMmo5NWI2Zi9HbGswV1hHNHNSZm9CRVBCQW1CVTdaZXo0RjdvQnlTR3dK?=
 =?utf-8?B?N2I2a2l2V1JoNVJuanNkaXNsZDA3aXAzM3dEOU9uYUcxYU5uMFBiVnE0QkJs?=
 =?utf-8?B?Mk50aDl1dTFMMG1sckk0NHRXN2hpV2dwQUx0bjJQSVROL2ZBdEdQQ0xNWnNw?=
 =?utf-8?B?bWRGalhGRDArZzVRRTMyTmF2VTZMSzRjNnR6UEhmZE9rdTRnNG4vV0RKRi9U?=
 =?utf-8?B?b0RWY2UyeDUrc0RtQ3l6Q09WNzZDTUtBcEZFZXdSMHhSVmZjQTk3emNjWFcv?=
 =?utf-8?B?a3JvYnkwNDByMEJZZlgreVY3U2xnMTZCeW85dmpQcTNGdEZNNkU5ZHJRck1S?=
 =?utf-8?B?eDErTFJwRi8xTzdaNGZITWJOVUhKcEFJTnVLNjU5NitoblJ3NGR1eDZLWnY2?=
 =?utf-8?B?MVd4NWtPelNWcXY0VXhkSXpnMGdLK2o3ZzdKNFU2ZkxLTHI5NFczbnFaa1p4?=
 =?utf-8?B?QTRtZjhmWU1ZZXVYamVNbnlPTnR4bm5lUk9jMTRyamNxaE5QK05XaWprUE1y?=
 =?utf-8?B?cFR3Wmttd3VtU2VPMEN2YS9xbVVDOWplR0lKUlJ4YU1tYjBmRE5qaFN6YkUx?=
 =?utf-8?B?R0ZmMy94dmxqejBNZ3lMZnN0ajR1QXc4VE1ER3YvbERDTDRKelYvZ1hCWGpm?=
 =?utf-8?B?L3h4b2pXRFByR21iZzdtU296Yys5c0c5RkRMbjdjM1hocXBEOHo4M01DVEdF?=
 =?utf-8?B?MmlrNDJ0R1drczk2aEJpSGE4QnNKQjZaUDZUYUl4S3BSanBDWTQxcERPQ2xQ?=
 =?utf-8?B?TVdON29KeXVBTzFEdU5oWVlqUjd4aklVVCtsQTdvaGQyN3Y3eEVWUnZydUJ5?=
 =?utf-8?B?QzJGNWdIVjd0Y2x4aWJFbnhycTE0SHJIajI1VEZOSjZEeFlLUGxmeFZlUXh0?=
 =?utf-8?B?QzRXODZqNXdsbERuR0RXVk9TMm5PLzNmblJkTHNjQmliYmVia0ZQTkl0cXdQ?=
 =?utf-8?B?Z1lLQXFEN1RRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd42f4ff-e5df-4c55-a887-08da03746b08
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:32:57.6134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4F/qsIFGVHQ9wPa0KOQccpesF7+UGF+xXf6j7lEA88O7Ad6mN2j4ppSwAx6pvwJa+IhVaf+MWY4xphPnTuOQ64I/7IjHocX53FJ9P+j1EUA=
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

On 2022-03-09 10:58 PM, Pierre-Louis Bossart wrote:
>> diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
>> new file mode 100644
>> index 000000000000..5f7976a95fe2
>> --- /dev/null
>> +++ b/sound/soc/intel/avs/Makefile
>> @@ -0,0 +1,5 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +snd-soc-avs-objs := dsp.o
>> +
>> +obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
> 
> nit-pick: snd-soc-intel-avs?
> 
> avs is not a clear mapping to Intel platforms


We already have snd_soc_catpt : (

>> +/*
>> + * struct avs_dev - Intel HD-Audio driver data
>> + *
>> + * @dev: PCI device
>> + * @dsp_ba: DSP bar address
> 
> not sure it's only limited to DSP, is it?


Well, this space is classified as: "Host Device Memory Space (Audio DSP)".

>> + * @spec: platform-specific descriptor
>> + */
>> +struct avs_dev {
>> +    struct hda_bus base;
>> +    struct device *dev;
>> +
>> +    void __iomem *dsp_ba;
>> +    const struct avs_spec *spec;
>> +};
> 
>> +int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset)
>> +{
>> +    u32 value, mask, reg;
>> +    int ret;
>> +
>> +    mask = AVS_ADSPCS_CRST_MASK(core_mask);
>> +    value = reset ? mask : 0;
>> +
>> +    snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
>> +
>> +    ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
>> +                       reg, (reg & mask) == value,
>> +                       AVS_ADSPCS_INTERVAL_US,
>> +                       AVS_ADSPCS_TIMEOUT_US);
>> +    if (ret)
>> +        dev_err(adev->dev, "core_mask %d %s reset failed: %d\n",
>> +            core_mask, reset ? "enter" : "exit", ret);
> 
> nit-pick: reset %s "entry" "exit"


I did align with what's already present in sound/hda/hdac_controller.c. 
It's done the other way around there. My personal opinion is: it sounds 
more logically the way it is currently - but I'm not a native English 
speaker.

>> +
>> +    return ret;
>> +}
>> +
> 
