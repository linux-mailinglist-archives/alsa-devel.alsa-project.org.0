Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D353F795
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 09:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0899918E8;
	Tue,  7 Jun 2022 09:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0899918E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654588051;
	bh=plVhp0iNsDaZ1XnpMBlYPGRr64dUCZQeam2CYrFeHzc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ay9tB4eXDzGEae1w42pfeNwq9iNATUh+xzPqPXaEga6DDpFRmd7kbAoDaNH6bApcS
	 liAlE5ePKXbvuLYFIjEbuGe/mR+HmmoH/YXmGtVCFJn/q13YD+nnE6VbojwUCRgttZ
	 aYsBfZ3LpvNn06M/YJwOHPZ0DP1OMCKHypEDDq/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30683F80248;
	Tue,  7 Jun 2022 09:46:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3E99F80159; Tue,  7 Jun 2022 09:46:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71208F80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 09:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71208F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BBDH4fHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654587989; x=1686123989;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=plVhp0iNsDaZ1XnpMBlYPGRr64dUCZQeam2CYrFeHzc=;
 b=BBDH4fHVbo7zyVir6IkNI24DmNgkkKSP/v22k6uKdt7xuzmu2AVHkiKM
 Nk0gGBFv7S7XsycWDgzDTg9U2VRDg6m6bXRiCPX1dgBZKCRk+NlO68d+k
 p7i/93gG99XcMo709BssIUzaY3G3ol+Kuf/6nfIEP05rJsreLolcU90Oj
 dntNob7QwMRHWTZQqDiu/lVE3CadOdaINJNURClvEG1dVYlJpjNYy+LON
 2VOtvxnBDCjrjs3K9hAeCHa0psvgB1OXhPHgZKDwKnhq+KZsJBmNKnxOM
 lwqI/C0KwByoi57oFswGYzk7hrgrZTadcjLqDQ5JLPI1k4S4qSU5YG7VC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276752864"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="276752864"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 00:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="682632231"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2022 00:46:21 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 00:46:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 00:46:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 00:46:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVH+ynUiLSRDfRRARqWbeIU5Id+qgY1Viqy8K1UcG/q2t4l4T56CIycIk/y889CqXBmKIhWs8U8aV0ukWmlY3N8yUzfSIdE/sILUb14ZTUPv/HNKDhe5UOhzjBornX48ArTLxImKlXQJFaJuQH24V2RcyoclFyDzlvfKVcen3gUT28U541hgeL/ysFX8ykWdMECuuNIaa66g8rbUfYaB+LrZF1q72pyHdyhFwf1lgxN6lL8Qn9ECyuHinDOaZ7YQmxvrsyyfC94cHEFxLXjQHQNGhCQKj9lWVaFyPhp5fLcRgePQ+IFClNyNpn4OTUUTeFDqLdTMjyM92buo2Fb3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xqb+Whoh9j7iWYa8tO0x4fJMrgSID3a1djwoNY59Jx0=;
 b=N/l7gZVWmpwHQK4ybdaZFmuj3J10MZ/kW1ZPjtS5ma2JSfOw2HAFtZvVFP5IgXaR3GBBqmXFK4e4uFIGUXO0HIyr5cctVd/i1R9vTjEfZVz19X1scsl7gsj8v0EpQJYGJUPEP4i/7rilpVMINWC4Hf2gDdxs1BTtV+u9nHf06DG38EipLhPyKLccnUYvcDZQ4rUdmnwqhXv+XPznI7swLwEiOyTVJLpHDKPOU+FfXuSPpNUjBUkzW9P4Hkq4gPOXHKUbkkDLzbdWOdjvsZ+ndQ0XmzgTTLJ+IuRD6KjR+qo30QjDbRIm8vj07kQaYhPUok6zcGZ+PHfK/I4Jvf74Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB5612.namprd11.prod.outlook.com (2603:10b6:510:e7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Tue, 7 Jun 2022 07:46:19 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1847:ac21:f9c1:e9f2]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1847:ac21:f9c1:e9f2%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:46:18 +0000
Message-ID: <554ad23c-1113-cd91-235c-268a198b12c2@intel.com>
Date: Tue, 7 Jun 2022 09:46:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
 <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
 <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
 <ddad78a2-685a-b0f1-ec7f-ba1c9647c243@intel.com>
 <87pmjq4o0o.wl-kuninori.morimoto.gx@renesas.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87pmjq4o0o.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ffae89-dcd8-4746-21a9-08da4859cecd
X-MS-TrafficTypeDiagnostic: PH0PR11MB5612:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5612B44D4F01D68BF66C8C8BE3A59@PH0PR11MB5612.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTR2b24etNvQGRH0Txbc7MPmurLOT2NrhATlDIO7ooAlJw0xBzfsWwPzVMcMK2ygBLuLdn5cJ2ZbmXq3V9K6R7WQBgF5ZxfZB0Jci7Fz9TICw7W2m8I7J/KWjYXzDJDPILUk/SpPzEOtyrjUTpfA6yfpXF6n45bO7VBop6v40SJKgvtffEQd8O7DeytXpAPqIR8w4Miwrlg2JtA/v3wBJyHUeE4SchNA1wzh/n1rjeAHZCNeJggtdAtW0lEBOjJBS/8XPf4OTNoGXXoWHBECu139ZxyFv80MKLZDxodxayiM1Hxb7n33LG0KtDFAJN+IxBa8DOtT6wotwElVzlNG0CLN3y9ID1LT8SDcf4a/AmwGHFW6KYGWVBpR73Zcg21+QIWHDX0amMawJ6uIqNsHz4fZSOLiy3IhbVFfGO30NdjbsDEqT/fvaf0wDRKK6zozNOlQ49VIqFMDhb/zTXXvuCF+l591ntkN/zZf75gnjk2AQ0nPXFrpWBlqaHoZ3lHCXgHZGeNfUKGaZe/EdXb54LYkzOaXK5Hv8xF1MKOBhJvHLKHdtTQZNyVfj8WJJN1En6uxLQnRcLp/HFWHvFp7HJbcttEW3H2TBWMogdK7LdTPaSySLFetE7r0uQfiTvFYRiV2uTgU5P6y+h2bK0gPSwnfAR/9bgXejShxdVa9oApzkZLhnRmeHEWcb26lwLg9e0c8ry+qI/PiX4eREkpKNBEbgq0P/7AonP7Zbje0jUG3wzNMd+VBx+9OKiTORQn/fc889NZBO65qCHbbkF3JrWA1qVsy27MGqLGIo1zXkqTsz5/hvLvAwt5uEQiV4oCJ15+I5d2twHWiH9b5A+EI8UpfowCmrfivphYdYlTZpjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(6512007)(6506007)(38100700002)(53546011)(6666004)(3480700007)(31686004)(7116003)(6916009)(54906003)(83380400001)(44832011)(31696002)(2906002)(5660300002)(4326008)(82960400001)(36756003)(316002)(8676002)(186003)(508600001)(66946007)(66556008)(66476007)(8936002)(26005)(86362001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVNxcTBOc0p5R1F4WGRwWHR0M1NScGJweWZ2RkZFVjdkckdqOVlGbVM4Z2ps?=
 =?utf-8?B?VENQa0RIY0d2VkYzQTZxL3YwbDhCMGZoRVNjcWFTYUFrdVRHUnhzTXdwR2Nn?=
 =?utf-8?B?QzAzR1hmS0pCeFl3YlVDdHZMWDZLR3BvSGVCNndXUVVvNzRZY0tpcXphdGNX?=
 =?utf-8?B?QlR3NjVGbjhNN0xvM3dpREZKMjZqNWkyYTg4WFdEWm1wNmhsTE16VlVRUFR6?=
 =?utf-8?B?VXg1U0ZudmxqOFc4SmRzSmovOVBZUVRzVHdacmoydVo1SGdQQ3Y1dWNtVkNV?=
 =?utf-8?B?MGgrSzVkeWo0YUpUejJ0YkdJYmdKaytiUWlIUThWaVMrZTE0eklBRlk0TFcz?=
 =?utf-8?B?ZGRrZ3dicnFxOVJyL0tzSlozVnp5V0Z6ZVNhUFdTZ2dvaVhtK1BkK1hINnA0?=
 =?utf-8?B?Q3J6R0RPN2JUNUxxN3VVQWdwdExiTk9FYVhtb2ZxL3VGZHJldkFiU09Ka1B5?=
 =?utf-8?B?OVV5dUVZSlMwK1ZJZ1NyZXpiVjJpNXFTbUlRWWVpMkN2SjdUUVN0alhiaVYr?=
 =?utf-8?B?MXcvOGdaeEdLWmQvUUhQRFU0NTRKcndkRjNHQXNHckhvN1g2YkwwOXVlakhB?=
 =?utf-8?B?VzZoa09IRzBtbUN3UE9RVUM3SUc2SkozRWcwNWVZTmhzMGNLTGc0T1d0L1hp?=
 =?utf-8?B?QUx5eDNFZXd6bGFTUXB1V2dwbTBVREtBTVBDRzRXaDlHa3JYamxNOFQ4ZFRz?=
 =?utf-8?B?bXQ3aHNSQ2lSOVVMelRlRVFEUDBuQUNUUVZKRzNCd21rRVdUQ0xieXRMMEF1?=
 =?utf-8?B?SzhrdkoxYVJiWFUzZEZzQTBMaUdkSjJpV2g5UXFva1JheG9sNXVndzhwOGt2?=
 =?utf-8?B?Z3dJS09sd1dFcGswSWl6OTNhU3E2Q0s0cWtmQWpvRUpKWVN3ZnVpNTNTMFRs?=
 =?utf-8?B?Qk1KSkVaaFNnSUZGZVFxeHg1Y0ZSb3ZKRStYWEZMd3Q4Z3FOUmFRdW9BMkVv?=
 =?utf-8?B?R0UrOTdiRElMVXY3K3BPUWp0c2tpR2g3Vzc2THNMQ2Fua1dVYkt4UDhFcVk0?=
 =?utf-8?B?TkJwT2FiTWVrTDlKTS9SZFV5T0ZrT2ZVSnhVcUpqSmpLQm1QNHlSNklMZVdH?=
 =?utf-8?B?UVRCVVVWbDlIWVhPSkRMcUZLei90WFlJakd3cHdrQnVCM05nWksrbWZZMnRs?=
 =?utf-8?B?QW9zeDVZdFptTG4rLzhJeXF1Nm54eFhpdTlTb3dDVlRYc2dKRGJOcXhrNytn?=
 =?utf-8?B?ZGZwdHNDaThuM01oRDQ1cGUxMmdJamxzOHJrRlJVMFpyd29zbWxTTHJyR3ZY?=
 =?utf-8?B?K3Z0NTBIbzlXK1ljLzY4UnN2M2NXZlJFaDRpb3dzdU1NcjlLSmxwaFFvMGhK?=
 =?utf-8?B?M2NiNjNjVDkxQTYyVDgzU3M5T0FKMExBNFdrSUI0WmNjZ2xJZGJRTEZheVcr?=
 =?utf-8?B?bWlXSlVrRHpkN055TWpBNWFwdDFZbHhoNW0xbjNrU05VNUJkd3g5d3FtU3hp?=
 =?utf-8?B?eGRkZm5mTUhJNS91VVRoUWVKN1FLbDhMeFkxLzhjS0JzNTRhUmVPMTlDdVJ2?=
 =?utf-8?B?Y1JwTEdQNGF5M2hLbi9DUzd2RHlzQk0yK0ZGYUo0ckMwdml4SmRIUC9JQU4z?=
 =?utf-8?B?cExOVk85dTE2bzhJd3JiMUdtODR2Y3hBYnVlQnRlcmNqb2V2TDh3UkhUMGxq?=
 =?utf-8?B?VUxGQis3L1lDNU9pTFgxVG5HclNIaXMwS2NMeEphTXNzb3FlbnBOTlQrWmJ3?=
 =?utf-8?B?WUJDODEwaG5CTVczVjQyTzZvNXcxek5oRDZlMUE5Y3FqbWlzaXIxU2c3bDZ2?=
 =?utf-8?B?d1RNZEN1LzdlWmU2UXhTNTBOVjYzTUYzdm5yYVFFQXFleE1LUWg4c1IydE9v?=
 =?utf-8?B?eEFaSjBhNFE3MjVoUzIxTXI3TXkrWmY4ZGQyTDRMZS9BY1A3dHZXZmdQUzMy?=
 =?utf-8?B?dTZVTWMyaWtnR2tkNFRiQklySGZPS1ZDWEVOSndyVHJteU9yNHhRZ2p2VHdV?=
 =?utf-8?B?MWFoUVllMzU0RStBaXRwNHF0MVhEY0YxYWRiTEd5aW5YNThWUHRhZzkxdDlO?=
 =?utf-8?B?Vkg1SnJ6SFYvREs5YUR2QVl6WTZWNjZwMExFRGtyTHpxMXFZQnROZDh4a2Mx?=
 =?utf-8?B?NUF2Ty9hZEhBTFR5UHVGbFFFaEZKaWtKeVVud2l3T0c0akw1UWd5bWJHY1Mw?=
 =?utf-8?B?YUhQbU1EVWdlc29yeHhFRllITW5vOWtWSnYzeFg4LzYwd2huc3lsRHZjSDl0?=
 =?utf-8?B?Zkt0TFVoZHhzTUZWSVIvYm9WSmJWdE4rK2xETm5jWmE4bk93dnNlQnlYa2hJ?=
 =?utf-8?B?ODlZTnd3djFaRDIyWEJXNXRSdzVIVnRoQVdPQlN5UUt6NDQyTWJveVlLbEV5?=
 =?utf-8?B?T3pEcnJnc2kwc29yQkdxaDRGM08wbnVKcWswS3BtdDFlWnR3b1kvT0hGQXlD?=
 =?utf-8?Q?ASuHWwUcfHKBQuKE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ffae89-dcd8-4746-21a9-08da4859cecd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:46:18.6435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbZdxMz1aTsPhp9+SpQqp1l1gQgHAzn9veJTMlyzBmQnqyzaG+ad3JN6BKYXzSEnv9sgSDNgek/Jl2xRu6eOMLds6NEPivvDmleOe85qs84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5612
X-OriginatorOrg: intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2022-06-03 1:57 AM, Kuninori Morimoto wrote:
> Thanks.
> "my Sound" mean "my sound driver".
> The Device image is like this
> 
> 	+-- DeviceA --+
> 	|+-----------+|
> 	||Component  ||
> 	||         [DAI]
> 	||         [DAI]
> 	...
> 	||         [DAI]
> 	||         [DAI]
> 	|+-----------+|
> 	+-------------+
> 
> It calls devm_snd_soc_register_component() here.
> Number of DAIs = rsnd_rdai_nr(priv) is based on the SoC (= DT settings),
> but these are same DAI.
> 	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1923>
> 
> The DAIs are setuped here.
> 	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1350>
> 
> Component driver is here
> 	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1810>
> 
> DAI ops is here
> 	<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sh/rcar/core.c?h=v5.18#n1067>


Hello Kuninori,

Thank you for the links - helped me speed up the learning process.

So, together with Amadeo we spent some time analyzing your audio stack. 
The equivalent of avs's pci_driver (sound/soc/intel/avs/core.c) seems to 
be rcar_sound platform_driver defined in sound/soc/sh/rcar/core.c.
There is no firmware or topology involved. Instead, we have hardware 
components, each representing some processing function e.g.: sample rate 
conversion. There is also a component which does not represent any of 
such functions - represents ASoC side of things instead. It's called 
*DAI*. And that's the component we were looking at mostly.

I believe each *DAI* exposes up to four FEs depending on the board, and 
during PCM operations, every FE enlists one or more hw components 
(rsnd_mod instances) to do the actual job.

Earlier in the thread you specified the following example as being 
problematic:

	+-- basic board --------+
	|+--------+             |
	|| CPU ch0| <--> CodecA |
	||     ch1| <-+         |
	|+--------+   |         |
	+-------------|---------+

	+-- expansion board ----+
	|             |         |
	|             +-> CodecB|
	+-----------------------+

with suggestion to solve it with 1xComponent:NxCard relation which is 
not supported by ASoC. However, we believe ASoC already presents 
solutions to such problem, either through 1) compound card or less 
commonly, by 2) splitting one big CPU-Card pair into several smaller pairs.

Relation that ASoC does support is NxComponent:1xCard. As both CPU and 
Codec are components, this roughly translates to: NxCPU:1xCard:NxCodec. 
Your case is an example of 1xCPU:1xCard:2xCodec. Such 
1xCPU:1xCard:NxCodec combinations are arguably the most common ones and 
developers majority of time are picking option 1). Less hassle. See 
sound/soc/intel/boards for examples.

As I believe the expansion board has some identifier, we will be able to 
fetch whether we are dealing with basic board or basic+expansion board. 
Or at least the board name should differ between the two devices. If so, 
two machine board drivers are needed - one servicing just the basic 
board (basic sound card) and the other for combo board (combo sound card).


Another option is registration of many components allowing developer to 
represent each logical block with a single component. This comes down to 
invoking snd_soc_register_component() multiple times.

This is especially useful if one or more of your four FEs available on 
the R-Car board has nothing to do with CodecA. Let's say FEs 1,2,3 are 
actually routed through CodecA whereas FE 4 through CodecB. It is 
logical to split the CPU functionality so that FE 4 is being serviced by 
the CPU component that is responsible for just that one part. This can 
be modified further if we want to expose entire set of FEs for both 
CodecA and CodecB. In such case the essence of PCM operations should be 
moved to some common code so that functions exposed via dai->ops become 
wrappers - eliminates code duplication. Then just create two instances 
of your CPU component, assign dai_driver(s) and register them both.

Currently, you're calling snd_soc_register_component() just once in your 
driver so option 2) is not possible without altering 
rsnd_dai_probe()/rsnd_probe().


Perhaps there is something I'm missing but considering that ASoC does 
have solutions to the raised problem, I do not see why either 1) or 2) 
cannot be made use of to deal with the problem. I and Amadeo can 
definitely help with 2) should you select it :)


Regards,
Czarek
