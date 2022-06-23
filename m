Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFDF557535
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 10:17:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E6C19FD;
	Thu, 23 Jun 2022 10:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E6C19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655972252;
	bh=+0V0KrrenTNQUIt1hGAUIXNJwVEBxoqcdUFa6xJh/GY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iaJcNyStUd10tAH6qI+RU2++LluXocXVwEzAocrjivEKRyIJCwv/FBntTw5j4F/2l
	 urm9zXTGCtBBW6hX6xmqL3ln6N5Ays8qUkG3WvCN1uNTxiW8dbt6bsTIzRcPZuioj3
	 Drb0yGy0hlgVxk5fFOSmyT46M8NT41YjyL9L9PnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8FAFF804CC;
	Thu, 23 Jun 2022 10:16:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 189A1F804C1; Thu, 23 Jun 2022 10:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED0ADF800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 10:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED0ADF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jfOB/edT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655972189; x=1687508189;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+0V0KrrenTNQUIt1hGAUIXNJwVEBxoqcdUFa6xJh/GY=;
 b=jfOB/edTsQZbGT5k9WwFt/ZfaBn7LjbkcqwqCSi7kj0bePqloXIiCUVV
 QP3FJBzv7pTOr+gwJfu+AixkZorrlPz2f4h0/cQrNHxc5joLx+pssLZtM
 Stc+bpHmABbTVuK7U7fROLOmVJ3XKNvEePrJb0yb9jIUSos+9C6Ov2mjR
 vnrS3x/W+wqlFR8g2ggj1tM5cg+dkidHrhs93+7XXu2o74E2VnLX86jAb
 oK4R5RRUQzYvFvM1nh4TDVuAtA9jA44v37bwnAw+my3Fhqg9+vFhENEXn
 nyzX/LV4qMnJzoC+LWq4/p4yyE7KmK7alx0pJLbVZwI4bA/Vd5nDDy0LO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="263692048"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="263692048"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="592597903"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2022 01:16:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 01:16:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 01:16:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 01:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaV1OihZXnf0ReHw03wksH7S6vLoPphZAzAkDkgelmBbRHg2/tqq1lJBf1MWOElvoW38nMwQv1NrSSwH9qVnH0IvodYBjgoRrL8Y+tLMJ5jWcVbTGcQsZYGTCoJEJgxBr3s8DEB5dyakx7MZE9kxKn7dc2fzvzGgGQHfJvwksrp4bd50SsufUYdBJ1o7lC73CDzd40GXlAIvjKDrhDEVE50QUQgCCeyhuafOvTKkstoelN1At92yqIiMVjC+aH9nlmkZ6bnuL2glsLlJBsTPsaOZJV3/YvdMJgAlCDRjMRTszI2GjY7AG4LFEivvYsxfYPuHRacfd9vPsmgzh9CW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzqTNOUakeAfHXT7SRorj/AOwP/jQRuUr58+8eB2kJY=;
 b=AciZSRyistGz2QNcK0mtYa1KR8Dixkwry6SdqiXu6Ajr+mf+lsfZp37PYP9Fmv13rnQrpXysnTdi0fsZrfHP/n5/kDWiJ4yFQ1GyaUCBsHPXNsmWGvygY4T3CVVVmKMnWjvO9VY0QhK7s575NfOlVw3ERbSl9vquP2Mni6SNmfYbJATtnvf69aFaWhJ0DdtqOU+Ho/KfIEh9gtRVBXiLqYxFHrCmmKg7uG0UXybGV0LkWSuN+J1us7jTjW6coHcupOEB2+ByxHFsS7Ave8ki++TlMeRIZEDTmiczxoWpyaQnrM9N4kP0qJM7IgBNwvHm3E+sIQSIqW6ehWXv78/j9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 08:16:23 +0000
Received: from CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::7592:b83b:92ac:6c61]) by CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::7592:b83b:92ac:6c61%4]) with mapi id 15.20.5353.015; Thu, 23 Jun 2022
 08:16:23 +0000
Message-ID: <3a10d841-b8aa-fe4b-4fad-bdaf0fa42ad7@intel.com>
Date: Thu, 23 Jun 2022 10:16:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v4 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
 <95a7a219-8330-628f-aa10-28a078217de7@linux.intel.com>
 <2ed532a4-a232-eb14-7122-e5b08cb79bb3@intel.com>
 <11ef5841-6c33-4647-7309-ba94da6308aa@linux.intel.com>
 <58f3ae25-59c3-6432-2c7a-ca11b5f37492@intel.com>
 <28efb05f-2f8e-c0fb-c079-0f65ee5283c5@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <28efb05f-2f8e-c0fb-c079-0f65ee5283c5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::27) To CY5PR11MB6365.namprd11.prod.outlook.com
 (2603:10b6:930:3b::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 581d6eab-7d0b-4442-d430-08da54f0a8c5
X-MS-TrafficTypeDiagnostic: DM4PR11MB6335:EE_
X-Microsoft-Antispam-PRVS: <DM4PR11MB633565D261467B714D903C61E3B59@DM4PR11MB6335.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKDjmfMcrkwSr74PeiiBjXKr81tylzqPVOM5DM71tOgnjK49eZkfnGDtxFpgBAEkWh4jKnVSnkPPVGdqqJyhI7s1fwRaSmyEvcNJ9o871knkTdny5GecNITpFNCHq41tlx33g4PgpQ7KI5VFocq4i41ojiRjeX4z1KGNduXRB3hve7+mYSN3DYuIMrLiosNGnxxZSaYB0EdQe7mnw4byZgNXcKEijaIGDuki2I3CfGykKhaNNmdhqCOa6zJ4KhCqlBEU0pCweZuKaqX0wzAqWMbiSBSNWVgxOTNggzbJPG5mFA/r8EtKzjmvig/tj1k5GHt2vBxZoJurQpJe6AV1HimjaoT2dUryQRc8LK/Uxkb+2a9ntxzoOeAUBHCndyOb452s+uJD0VK5qJU0wjhF0ACV+dBUN7mQXiZS0oOSBV1ZR6JOablFdKrVk3j4GjbKhFCeow8veBErD3x7fIgLTckGmekAYXaaKGg5M5MZMNzEYET85GwqEdTylJU6gR5o4+0GgR2C5QcBr3aLYUypTUsSd4GIyc7+ErqkxzK+ns/r4k63d1ZDkSntNadhhxMW+tyh31HYzH1/xnAVPBGUOLsGybaWjJ5qKmmVQJ7Pa0GQRMv55XSW1sBbNvm259/c4kiTLRMZStTRZhqpUGxzk3oraMwd3OWyN4vNyUBTeg4iP0fmmH107988AG5SO0D/PC0X8M0ARNTGNaGtGDXeMlr9o9QpYO1Gd0O0qP0OQEJTntyT1joORBBIwDoNrV/jKVWnx6j9AtdUU+9nWcngcVSKP9xfPCR74NtTGdanzSN4m4o+VmQKKhSQCZ7OAnkr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(39860400002)(136003)(366004)(376002)(66476007)(66556008)(66946007)(83380400001)(6486002)(2906002)(478600001)(8936002)(8676002)(5660300002)(4326008)(6506007)(966005)(86362001)(82960400001)(38100700002)(44832011)(53546011)(6666004)(31696002)(6512007)(31686004)(186003)(2616005)(36756003)(15650500001)(41300700001)(26005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGtQQjBpRnZpYmNEME9qZ1VEb1RIRzlpMVR2QXFYOHdLYURlQ1hKWHpsQVZZ?=
 =?utf-8?B?RGNnaURqMnpLS0VtdzQybTJ0SFhGT1hhNDF3ckRlUVlyem16MTFpa0R1ODl5?=
 =?utf-8?B?NXYrSjVPQlBlMHFqTzZteE5ha3RNNWRzeGlWdlBaTnBOWWpHUnk0Ny9XZk9Y?=
 =?utf-8?B?amZzNDJzTmpkRjZqR2dmdVV2Y1pURGVSV3J6K2xFVUhUL1hyaWtmbWtscTRC?=
 =?utf-8?B?QU1YcmIyMUhmb2lkaERob1h3UDJPVmxFV0o4aE5taiszTTgydFdBYThTancx?=
 =?utf-8?B?MTN1TnhXTHBDM2RSK216eDRLbkZFb1dFTnMrUXF0ZHpFMXI5R1Fzd3Ivd2NC?=
 =?utf-8?B?RzU4Um8xcHdCaXArUi9uOUttSndUc1djd0dPS28vRU0ybjdoSzhaNVY3Ykxh?=
 =?utf-8?B?Ums0a1hjclp0YXVBOTlEV2xQcFZ2b1NGM29OZHJRaEFpcy8rNGRWVTBsOVN4?=
 =?utf-8?B?OHg0bnNqVnJwZGhVSkQwdXNCdlhmNDhxTUxYYUVWMGdhaWJpbUw0emt0NFIy?=
 =?utf-8?B?Q0g4TWFzYVdaam5NbWZQajl1bWEweWhZZDQ1K2Y3UjZPb3A0b1NGbTdnYnN4?=
 =?utf-8?B?SEtuN0NMdXQyQnNqMm1KOVlXSTY1NDhSdVM3aDEyVDFzWENhaVFKdTJYT0h1?=
 =?utf-8?B?Z05Venk3RENzMW90cTg3QzRiMjRDZjBqcGt2ME0rTnZnSWcxemtVQVo2aWR3?=
 =?utf-8?B?eDR4MGdndC9VVmwvZFFoekswb0tRUUdpQ3FXTSszdXhjQjBHZVZ2Qlk5TmJY?=
 =?utf-8?B?c0VHR0hxRXlLeDJoSEpKdDRqOSsrenMxRGlLejJJaUFTU25aVUlFMnF5WWJm?=
 =?utf-8?B?TWJaczBHcFQ3Q1ZwWnJTSnhyV1pZRi9TMTBNekQxS3QyWjcwcVhUOEovc1VY?=
 =?utf-8?B?TjJTU0VyRS9HSnFKckVsRGF3VDdNSE9qRFVLRk4vUHA3aEYyWHFXZDN4MkNY?=
 =?utf-8?B?ZlNycmUvNDV0WFJURExqWmM3MW5pZTJ4RytIcytrWjFYcGZ2WEFGcXlKUlV5?=
 =?utf-8?B?MDFrQ3M4RDBZb1ZJWThUS2lRN1NEYmMyUzdzYTU2UjNEWXEwa2xwMlNScG1D?=
 =?utf-8?B?QjNYK2ZUUE5kdFVTRkpGT3I3dDJzUTFVQmVRdS9SdnRXa3p2cDVhM2VBWnJI?=
 =?utf-8?B?Wk0zMXNJU2FzMnBCRGh6K01YK3Q2R3ZlbDJDV2lUSHRQVlFTelMvYnBiUmY3?=
 =?utf-8?B?NTdxbmNDd3lCWWxPMnVtZDRhdzlTTnhVMlU3TDUwcnlrRkI0YlRYN1dmZi9G?=
 =?utf-8?B?VDdTb0liaEtSUHVXQTlab3Mra0ppU25lcG5vUXVhMnh1bHYzYjBkT3pLUnB2?=
 =?utf-8?B?Qkp0OWM1bmFuVWRURFVyRzdxNFQvZ3lwN3lVVXhhL3ZlbURVNHNrL1RIRVlX?=
 =?utf-8?B?Z2k1bHduM3dJbUdhTnNxN3ZzYWJDWFV0R2FKOFFWTTczWEh5ZFhwSGxPUExm?=
 =?utf-8?B?dGdYTlphK0dpdkpqdkErd01YM2ViMVBkdEJiMUcyM2pwaElNanZUbnd1N2x1?=
 =?utf-8?B?OWk2THJJd2pWT1grK1hLc1hySlR2R3prbTNFZ0R3eHZrQTRzbDhYMGJhbXZu?=
 =?utf-8?B?QlFRNitCcjJUOWM4ODA5aU5vY1M5WlpjZE11TnNKOWlqZDRpbjBVMmhNQ2Zr?=
 =?utf-8?B?U3hSZVh0V1R3ckFyWXRISHJ4WjVBVkFQa1p4d2lxT2dQaVFkRzZZbGtzeXls?=
 =?utf-8?B?KzF5aGF6SkZlUFZpQWY5UGVBaTlWTGNVZXVZcy9hdmUyUjJPbVZNVzYxTDhE?=
 =?utf-8?B?SzFJakR4cmNlYUN5OFdaV2paSUpEQ1NHemduY1VHV2k4YXl4U3BJOHBQUmhn?=
 =?utf-8?B?a0Y2WDhLeHlDKzQ1WXQwcHlHekNzNzNSZ2tIM0l4YURic1lSN0JpMWhJTDNZ?=
 =?utf-8?B?VXF0bWVtaWdBNU0vYUd6bXVnb000VS84anBEc0FYRnZvNERwT1JDbXVlK2pz?=
 =?utf-8?B?eklWYkJleVZaZHBpbFlYTngyMnUvMkI0YlIrOCt3TWEzWmlIYzZOaGpCRzhq?=
 =?utf-8?B?d2NQTEErZXkzckNDdjVNUHAvbWhvdnF4aVFselZKc2k4SnBzODQ1ajVlUXE1?=
 =?utf-8?B?aHQvb2g5ODNUZnlxcTIzUDRjQ0tSWVNyU3poaklCK0xRL0h6bDBNMzRGWis3?=
 =?utf-8?B?N1RhOUJENHI1WUx1Q1hDOENXalNXeGNFUTRlNllDamlncHhDaE1oMlJ0QVRn?=
 =?utf-8?B?NmNyOEU5cmszaUIyZFNmY3YxM0lkak4rWWoyTkkrOVV0YU1CelZMc2RuSlQy?=
 =?utf-8?B?T242UG1ZelR6d0ZDMDR5TVpJOHJrcTJPUGpFK09jUjZqNmhsRzl6akUraTdS?=
 =?utf-8?B?emx3akdTeTJYSTlRM0pXeGJWdkdtVkorNUNqYXo1YnVqVW92Z1hBTmJFdmVY?=
 =?utf-8?Q?gD8kccUzuAiFWacc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 581d6eab-7d0b-4442-d430-08da54f0a8c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:16:23.0205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+Q8z1O6ic/sUFGeDjS9eSOV23Ea5y/hSTsDKc4mnWch1sojdYtgcWs4FSlNszDidwA8H6En4lMYIej3nWDbSvNF35VX/4Zeo+XrLRvfJ0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On 2022-06-22 8:55 PM, Pierre-Louis Bossart wrote:
>>> I also had additional errors not reported,
>>>
>>> [   36.125113] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin HV
>>> [   36.125128] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin VREF
>>> [   36.125130] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin LDO1
>>> [   36.125921] kernel: rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1

(save)

> That's fine as well. What I was arguing on is the relationship between
> patchsets and dependencies, what you are suggesting is perfectly acceptable.


I agree. Frankly I was not aware about the dependencies myself - it 
wasn't done on purpose. Your report above (notice that there is more 
than just the LDO1 line) made me analyze our tree once more. Turned out 
that fixes related to Realtek codecs sent by Amadeo last week [1] 
address the problem and that's why I had not noticed anything.

Will work on the codec series and see what's needed or not given Mark's 
review and then come back to the bdw_rt286 jack-handling subject. Thanks!


[1]: 
https://lore.kernel.org/alsa-devel/20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com/


Regards,
Czarek
