Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A51435FED
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 13:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF99167F;
	Thu, 21 Oct 2021 13:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF99167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634814294;
	bh=90bANRLI8t4np/Qd4WB2gJVrols5DXpGYW84R6xJ5Yc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JeT0JGx8uk0nwM6clQ4lAKly5npAMsOaUGUi2e0CFeZG1AoA7in9LClVyX06mDwXt
	 Jg/ChLtJLHjAlPp7qGH4nFe5OCUJcq28PHXTfF7gVv55ovmJqv2Ka9wYpxJZEXyqXZ
	 o1KviAz+38FR4tgTd+ZlPxiqAEhE4Aw5LcpiyMs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB18F800F2;
	Thu, 21 Oct 2021 13:03:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16640F80240; Thu, 21 Oct 2021 13:03:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C72B1F800F2
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 13:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72B1F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="JzGZ3+bg"
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="252505035"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="252505035"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 04:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="527445877"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 21 Oct 2021 04:02:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 04:02:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 21 Oct 2021 04:02:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 21 Oct 2021 04:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCthq2G3NnSEfIHUUYfRVXpCgC0UNOQ8lbB0nh6RkOv5tLOMB/8NsbBXisyksNqI1ES/QCyKjkyqPkpNnJkHz3UEMy7S+BFBXf5t4h3wB74SQNlomsbHQRMrqqgdPgFxG0WUq5NYkF/g0W0hS1P2hro2djE474Sg22jZxWA73Mxx3/wXFg30+H9paQsF35euY9owmWjWt9r4L2OtAmLUuvnFi145a27x8s7+Wg1Ymll3rj4YJHEpbqfNj8ftvzUc700fY/9IZoym13rJjr0M2ciBvdMR0Z9odR7Ve3jT9Q2ofcwy219Kt2ri6Zn9O4paBk2GnvIDRbaoKGNzAJZgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IunNji7m48E6ovc82+fKkyiOmEDb1tknPQfAB6yiTIg=;
 b=YLYyVAnZzNoDE8//xLU/idpAv67x3JSt3vMoLLRDXTaEGrNF3uvDCO5hWharA+8P4y3RJEj+UwpdO3t0BjBqb2A6QLz/sQMtoHi1EQ3Ox8cZMeCS1+oFu5Kuu7qXinylcfVlRg1fuu3rT/GqWWhPiMm4FRSwK0pDnyXE7aXE9uNxH6nrFx+girrLxxoANWdc3NHmrfERaIWIp2Z8ZbmfwqlEzabM6Q3xidC9EFZwFTa2gf8Bx/GCA8pKovvxw/yGizo1mbjq4VArUvluscVC/Hus/6U/OqX/a11A3E2SKnekXrMK17iG1czJoXpgnkeOHxwhvmiTb23jPOmzPT1l0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IunNji7m48E6ovc82+fKkyiOmEDb1tknPQfAB6yiTIg=;
 b=JzGZ3+bglxcfWMpKo+Z8J0v8cp2NjV8WZp0qKKnnfjXTl6V6B7dpmryIygt+lLQOJwwFVjDFAJZhvG75MhWqwPGCkmHIL0e8avlmTmzi496teUEkGKyZR75dYwFesHPTzC7xdWsGLcxZreuh43dKyqhir339uzUJ1KYJ2oAdD4w=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 11:02:23 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 11:02:23 +0000
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
 <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
 <25811f8f-c7bc-89c2-f616-4102293a2deb@linux.intel.com>
 <d8b90004-6c64-8cef-266a-17b2a4a480d7@intel.com>
 <569f6bf6-c346-3059-fc7e-e8c46c7dc4b6@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <994c6339-6f67-58e9-77a1-a2faa20ade72@intel.com>
Date: Thu, 21 Oct 2021 13:02:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <569f6bf6-c346-3059-fc7e-e8c46c7dc4b6@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0331.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::19) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.111.235) by
 DU2PR04CA0331.eurprd04.prod.outlook.com (2603:10a6:10:2b4::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 11:02:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1d3389-0ebc-413a-b5c9-08d994824288
X-MS-TrafficTypeDiagnostic: BN6PR11MB4049:
X-Microsoft-Antispam-PRVS: <BN6PR11MB404980C432B8393E545E737BE3BF9@BN6PR11MB4049.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JjARZw83S04V8Sn7FDUp8l0GBNzIDhn8jrJoJDfvpt4lF6Lx+OpNpnBAfARXauJXAhoqPu5G/d5t5IlHxd6YIa7MtxQe5aXGshcFc7hXBp+FC/9ne/LtxWAo5zsoVHzgdn4YmToJpkQtXtD1rlkZHn1tx1pFUWs2zz0YpP1lbEQI5YFK/jShfB/U6pXIpqXPy3jY3NAzh5SFxss49pXEBHs4QOtLrgHANn0lu5qL4xmSNSosEtz+Mn8cvlf+cnzQwH6/KWfhKfZQ8VeikVH0TYj3VWCO6n6QBvmVgc35y3Swssfvr1oBcavC4RTtxEbGYKz1M+PfM+f07NOq2cPqi4z+bBUKBoh1Uj6hWBDnuqGYgYG5BcwysbvOXzzqvMulrjeqcof8n6WZAA6G4cTYQD21cqGjahj+VOM9Psw9xE7HOp3n8y+MVtiWYQe7bE4izbDQpNpd1s0x0my6sQLyhINsplxrJrRNdohsLQnAt23xGh0TauyBl58NpGce0ldOXfgOgzNAk2Ze2kh/uDT0/Sb06+YkSN/OZKRlwvmSnTxFCIFifw1H/huoKrpAvUau5RrU7/GQEjwNOkD5WQLlAEjtRP6PttqmLe2LNuggQykxMJc+DeFxuq8pxMFRbHJkzzuJNMtq6XOuP09TWWzbFRNbOYPfSYaipuV1Ac2paRK8I9Bf61wF8AL4YZ1YWmZ4tnQ78FdNk5pPB0L08DzRjN71kyUJp5x9uFdz0F1NNCt8rzdqAo/K84jAp5Hxi6HGiVqTN/XYtcZwmrs67Ifp7twd/27aapFYIy64dx0NFV/CBl3x1EjhpTpsxGlZjRdYrZJwE6lxvpkLS9imWC3G+1OORqWWeprhv1r9vu/NHb1kPtZf/OTO1YFE8sYCnhq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(82960400001)(66476007)(38100700002)(2906002)(31696002)(4001150100001)(86362001)(53546011)(26005)(31686004)(36756003)(4326008)(8676002)(2616005)(186003)(956004)(66946007)(6486002)(5660300002)(16576012)(110136005)(316002)(66556008)(6666004)(966005)(508600001)(8936002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNaNVVpWGEyTWJ4by9tMGZsbGgvNE5NSVZBRmtiYnYwT3cwdG4rR0hnNXIv?=
 =?utf-8?B?VEtMeDZ3cWNZK3hPWklKdVN3ektaUHU3WEtRaEY2UHpXQXl5dVpXVURGT1NG?=
 =?utf-8?B?TitLekwwQmdwNlpGUk50Q0J6d2IyQVduSFE5a3c1R0lEQVgxa0lJaUI3czdU?=
 =?utf-8?B?eVVjdEM1VXNOdldvYzBXZSttL0tIZTd4cHQ3dEJ2NTFKcCtVRkVFZ2NvaWFk?=
 =?utf-8?B?NUN2cHJCL2VUekdZQldaQmNQem9oWFZidWRZOGF2WGthRVRLNjdZUTlPUzBn?=
 =?utf-8?B?OUh1MW9DdWJBcWEreXF3bHIzek1NeitVdWIya3NabjQ2UStHaE5zT05nN2Vz?=
 =?utf-8?B?QitGMDZBYVd0SjhyN1Q5NHdBTWphZ25VVE9NYTB2SFZ6NkZ2VjFrUkxPbWhX?=
 =?utf-8?B?anVZdUF5L1FtRlkzNm9WaXVNT3hoVDlqZFh6UHNnYmFrY29aajlLb05WWTIw?=
 =?utf-8?B?UzMxN1dkMTRmYTAvSlQ5SHhBQzhocy94S3FSaG8raW44OGFUZXpyVGw3MDhm?=
 =?utf-8?B?S1pFdkxPZEFkSUs0aE5hV3NnRmJLZDBBZkQyT3pSUTZSdnJ5Y1ZZTnFMaWUz?=
 =?utf-8?B?VmlWSkF4V0J1SG5CUnFrYzFnWWpaOGYzeWNoUXNIVzMxUE9Wa2xJZVpaNGhp?=
 =?utf-8?B?NEdZY1Vkb2hwd2YzVGxXRlpXeUlkeVVwaE5jZjJpblFGTmpEL2NTS2h2SlIv?=
 =?utf-8?B?UWoyT2FPenJuVDg0OXEwZkNycUZXb1VTOGt2LzVTZXdzK29EZm1Oc2NaWk83?=
 =?utf-8?B?Y3VnMzhwZTQyYU95RVVVL3FIcWE3ZTZ6OHRCaEZNaHc0VnhSaHUxcTg3Vk8v?=
 =?utf-8?B?ZVpxS0JEdjZVUDhIbXJmaS9wTkliVzhkSkRoNFhtY3ZxeUd1SUFSMGFhbVQ2?=
 =?utf-8?B?K2JRMkRScXVUOFJIMWQrSGdjd3M3QThNRS9abUkyZUZyUGYxMFh1aXNqWW9t?=
 =?utf-8?B?Rlp1TUJIVWhlTGh2OERGaXhzTG5uS0xKYWtMdXpLL2h5QW5tT0NtRGY2WHpu?=
 =?utf-8?B?MDV1KzFtTnpFdlptR01NdE54azZHMXRLN004WVd3ZGp3WjVuT0krNUhLakgz?=
 =?utf-8?B?YXQwZUp2Ui8zMElFRytobEtXY0tpNWRNSDhWNVBaRU9LejRtcHhJaE9GeWNk?=
 =?utf-8?B?YmxIN3h3eVgyaHQyTjlmVVRBcU02VnZaWVA3eVpUeE9SME5VZGZ1c2xPRHBz?=
 =?utf-8?B?WEo0aDNORXlxS1lzNkl1aVB5SUFtUy96QnpqVS9tNHArVFBBM3FTV3dBMkNZ?=
 =?utf-8?B?TUZsVnpEckFmaTROQXRSTEkxMHpYNmdSWXVxS2FveXhQMkxaT2lMT1BtcHhq?=
 =?utf-8?B?YStlRU94YUQ0TFoyaWpybHV2aEw4alpCUHJWWSt6Wll0NkczUm13TktTWTNY?=
 =?utf-8?B?M1FZckNHK24rOEY5RGI2OHRGNXVDcU00UmU0R0dEZUx0anUyU3JjWVpXRldo?=
 =?utf-8?B?TEdweDdObE9GRW5EL0dWT0trUTUrTzJWV25oTitpd1JFeUFzdGJsN0djTmtS?=
 =?utf-8?B?bXdIWmE3Qmo5ckplbGJwOU9jZnZsSERTd09zNmh6WVArQUtaekRKNXJmWVZI?=
 =?utf-8?B?ZzA3enVhcTVwZlJHRW95NnFSeGJBNGE3QnlOMWNwSUtJN0ExQ1BwQUdqQ1gv?=
 =?utf-8?B?S1kwUHFVRFhES1l0S3c4ZUo1Sk94Z3c0dnVvUDJRTXk3MFlRNmFoc1dwS2VZ?=
 =?utf-8?B?NEhrZzRidEkwQk1PVEdLNnFYSkppcjJTclpKRlVMSkxpbkpEbStjbzI2d0d0?=
 =?utf-8?B?Q2cvL21yZWFMU1VkNTJWSmlmcCtyamY0NlYxNDJxOTNNZWlCdkc4Yk5VQUgv?=
 =?utf-8?B?ZkFNMGxPQWEvd2YvMmMwYU9hZ0xGTEIydEVDRi9KY3ExMFdnb0pWSGJyK3po?=
 =?utf-8?B?NkJuMlBMNGR4SGlRcXVXWjgxN3Q3eXhyVm9Oc0ZtdUNuSzMxMm1rdm5zUjF6?=
 =?utf-8?Q?NREqOTby/K66UAvGz3jn1UA41+vfuKIS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1d3389-0ebc-413a-b5c9-08d994824288
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 11:02:23.4339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cezary.rojewski@intel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4049
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com
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

On 2021-10-19 8:42 PM, Pierre-Louis Bossart wrote:
> On 10/19/21 12:32 PM, Cezary Rojewski wrote:
>> On 2021-10-19 6:58 PM, Pierre-Louis Bossart wrote:

...

>>> I am not opposed to updates in this hdaudio-ext part, but I am in favor
>>> of less ambitious step-by-step changes.
>>>
>>> a) This is legacy code where the initial authors have moved on, and it's
>>> very hard to figure out what the intent was. It's quite common to have
>>> discussion on feature v. bug, see e.g. the discussion we had on this in
>>> https://github.com/thesofproject/linux/pull/3175#pullrequestreview-772674119
>>>
>>>
>>> b) In addition, this code is shared between two teams with separate
>>> testing/CI capabilities and limited number of commercial/shipping
>>> devices. There is a very large risk of introducing bugs even with the
>>> best intentions.
>>>
>>> Before we do any changes in functionality, there are already basic steps
>>> that can be done, e.g. using consistent naming between variables, the
>>> existing code is just confusing as can be:
>>>
>>> struct hdac_stream *stream;
>>> struct hdac_ext_stream *stream;
>>> struct hdac_stream *hstream;
>>> struct hdac_ext_stream *hstream;
>>>
>>> I started basic cleanups here:
>>> https://github.com/thesofproject/linux/pull/3158, I haven't had time to
>>> complete this because of more important locking issues, but I intend to
>>> send those clarifications for the next cycle.
>>>
>>> Again before we do large changes let's think of smaller steps and how we
>>> are going to validate those changes.
>>
>> Agree, step-by-step is the way to go.
>>
>> Isn't this patch a 'step' though? This isn't remotely a refactor, just
>> gathering of common parts of ext-bus initialization. We could start with
>> this so legacy users are unaffected, then have snd_hdac_bus_init()
>> updated so snd_hdac_ext_bus_init() is devoid of 'core' fields
>> assignments as suggested by Kai.
> 
> If it was just moving common parts, I would have no issue. My main
> objection is that you went one step further and started renaming stuff
> in rather confusing ways, e.g.
> 
> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev)
> +void sof_hda_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
> 
> - * snd_hdac_ext_bus_init - initialize a HD-audio extended bus
> + * snd_hda_ext_bus_init - initialize a HD-audio extended bus

Reason for renaming snd_hdac_ext_bus_init() to snd_hda_ext_bus_init() is 
argument type change: 'struct hdac_bus *' to struct hda_bus *'. Don't 
believe that's confusing to anybody.

No problem with reverting naming change for now - we can streamline 
naming later.

In regard to sof_hda_bus_init(): I don't see any renaming here, just 
argument type changes to match new snd_hda_ext_bus_init() usage.

> hda_bus is a definition from hda_codec.h, I don't see a reason why we
> should use this structure when the vast majority of the code uses
> hdac_bus. And the purpose of hdac_ext is really to deal with
> *controller* extensions to couple/decouple DMAs. There is no dependency
> on codecs at that level.

hda_bus is the base for all HDAudio drivers:
struct azx
struct skl_dev
struct sof_intel_hda_dev

So no, what vast majority of code actually does is hda_bus/codec to 
hdac_bus/codec (and vice-versa) translation when in fact all the drivers 
are hda_* based. If you speak of confusion, that's the confusion that 
should be addressed in the future..

> Even if there was, I also don't really see why/when we should start
> using hda_ext v. hdac_ext, the naming convention completely escapes me.
> It would seem logical to me to only use hdac_ext as an extension of
> hdac_, no?
> 
> I also don't get what this means:
> +	snd_hda_ext_bus_init(hbus, pci, NULL, ext_ops, "sklbus");
> 
> what is 'sklbus' and what purpose are you trying to accomplish with this
> change?
> 

Well, please see the updated declaration of snd_hda_ext_bus_init() in 
this very patch and then the existing code of 
sound/soc/intel/skylake/skl.c - skl_create().
Last argument in updated declaration reads 'modelname'. Skylake-driver 
has its own, SOF initializes it differently.


Regads,
Czarek
