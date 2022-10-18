Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0E260309A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 18:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323C8A09C;
	Tue, 18 Oct 2022 18:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323C8A09C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666109808;
	bh=TlatGGgqxHKFQ0WBfpKLPibQnGBe/h3THjcNFYwZH4Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D3j4ihZA+QKuSb3lXG7MrinhOKQi7YXu05yc0ShB7JaeW6a9tKcwTl8Nvh26iFsyC
	 N4udow8kc6X5g2s9+qZGtEHrcMKOeB35mKkBsWKnUNIMal3xbWK+ruH81XAG5ajMU3
	 lgPkDUCLp18h67nLTQBLb1ElnOAHGkbtQEq9omh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC512F80166;
	Tue, 18 Oct 2022 18:15:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5C98F800AB; Tue, 18 Oct 2022 18:15:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CE14F800AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 18:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CE14F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aTrVoXdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666109749; x=1697645749;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TlatGGgqxHKFQ0WBfpKLPibQnGBe/h3THjcNFYwZH4Q=;
 b=aTrVoXddTdiBRtCvufWlz292iCY8mgAB1hLAA6Fmi04e4bI3bR9sKnsu
 i6gLpHD4cJYugLWVsSZaEaZj6WDXnDIuuQJac8QUYvU1zUcctYgMlvp+z
 i7QQa7DIRp+XX1364TiMVMiDsz+7ETQM3VTfta6enFJhgJ8gvgw9rOBEX
 dwsvJLDJxsmwojXCsf2v7YG2mhvUZjJoWYHNVSlOx7i7wsFjBGIoln9Zi
 d33IXn2n+ULv3Y6jNXRhi/LXQ408w8pYv+II3aYIbBDy0TYN1G8xP/Cjq
 WGY7LTe2ZEtaPu4C5zo8jbd9tD/I1gLsqyYdfkcTKbPMRUNuvoxaDEgMp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="304893223"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="304893223"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 09:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="803823908"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="803823908"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 18 Oct 2022 09:15:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 09:15:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 09:15:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 09:15:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 09:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbgXPeagOpvRUpvfUQvYrVlWh6fDt08z2VfWnTlS3JB5niioRdcMbM6GJ/gXAOZUzHQzT8QrUHpNdbizrNREnFt4aP+LbcdRag8jmwPOqGuTSJZGcCi4naRMmX/zTomi8ThoJIO16dFRlyaxp/JJTYKjWW28Lp8329dspmDHLslwFZHVF+Y81skHmj4XuXDyGPO1HZxKUbQFSjpZb4p5iI2ISNeOE6VEtrKF0fLAioN7D45kLuoC6woEcqCQ87zf7ueKKaXgED0HMlOybwrFyUCUKjY3p5tGEXpUtyiJzVuVh1S81baUzHZJgtiWSUBG3oFGkHqW7M7UJReCqisDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLVBlDbroYr03m693LHxPv54kYDa/uy7GjcyOSGfE4A=;
 b=OQNZFt4NUOrYJXmbzAFWvwcrPyzLGHVcrcUrxo/+Xu+FKtrOD1ILJ62v8idrlmE4Cr9560QvtViVsPQujUCXz0I5tFjC53StisWOsJH8hR46U3P0jLUpY4B4BNoXXVJSdSzZRNWgFackILXw7e2hruQULUdynPipJc+IbGebuHMdqJj3xgM/LnrEv+yHhDzhvlYaSG/5Ej0qx0iStzob/B61tp0F6/S4HW9XmoX1uxNw8EreKMlLZ1/ySgCNxyw5kIpIqLFdzdHvvoVUKATpKt6P/lvZ4TtorYCHckM7oJd+uA13fOx5Bms4jBaAUc/dcpoIRF7iECgPfjhcT/GaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Tue, 18 Oct 2022 16:15:41 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Tue, 18 Oct 2022
 16:15:41 +0000
Message-ID: <fab967b5-db7a-4f57-2422-3b68b46139a4@intel.com>
Date: Tue, 18 Oct 2022 18:15:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 0/3] ASoC: Intel/SOF: simplify S3 resume flows
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20221017204946.207986-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221017204946.207986-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0c0f1e-6145-4cd6-1e15-08dab1240051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUEWb0w1NV+wpe8JcuynO4GB710HpzOUyNGzvxE6CWGe0QSkTAzFXnyDobjjM1PxzNTFq1L18wQBnoVektexOgHODnTfjH/7R4CbrHoDAY4j1/t5MQdwAqPKFR8NDxrVNWb4FXG8CD7jbkO3MSF9/yAwst7U4oiRfitxJ+5izkr9AgLj08cP5l2IeFnF9eKkOKOGVANncoy0iV4QfFQ4Ri+bEaAw+6tZRl9cJAo2cB3AssaooTsCxGPeUPyTwIzSX5BmktSk7WyRenjpvDma6qa3wOIGuKsf5cKXpqz8JC8GxVlPL6gIAJ0tdLNY/nrvWa91KH9Ve0Tubogzaa6tPkOjxTLNr3ypcxW/dJOAXP9eBZZiL69tiq2rXu92YKSj9xJhUD+XmKHlTecxHKov02eMPWOzj5YC8m3blU1i/pBS1j1zBraHC+GFSA5ncB8vR/GAJErghmL8kSnwA31G8jB59tz0k7xnKN14wHMFFmUDSRYk48xAUotaDrH8/jNKAbYTsRhgueXBJ5Q55YQv2ziK8gDjDvXDMc7JLnLuHNJJWvO10PTVQPR6qLuZ1JfS9rniMXcxp4s93KrUn49EHPkSQjXD5pi9CeLjGrHPAyYOrrqx328EA1J+4VMDgfa/5J0bXZRbw1UHs6YksYH2m4J0PSfB5hb1KsrtwUckuE+8mv8V9mXkv9ayGmDaKmR8h8H5enTS9OB/uzWf8CUOIq2phpSH62Rokm9VGRCMdtdoyS1xy2KFhWWrxlSIxbuAytPqDCWuZ/6bFByiZCkG8Ch+oG5MrEbqVRQo+FZPwTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(82960400001)(31696002)(36756003)(86362001)(31686004)(38100700002)(4744005)(6666004)(4001150100001)(186003)(6506007)(2906002)(5660300002)(44832011)(6512007)(2616005)(478600001)(26005)(53546011)(4326008)(316002)(6486002)(8936002)(66946007)(66556008)(41300700001)(8676002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dURaRmx1K1Z0M3ArNVFaL1U2Z2w4YTl2MGNCNG9TNWUweE9QUGdKY0dzRG1C?=
 =?utf-8?B?S2RJRzlWUzhsakw4YmNmeTlrcXhyY0UxWjRoekxhVDFXL2pVd1JuL09UVzh2?=
 =?utf-8?B?WEQwWUFDWW53WElCL0ZvMFJkZnhZR3JObEFBQXVvYk9TaWpNb2pMZWFmWi93?=
 =?utf-8?B?REZlZjVGaUFieEJJM0tYSFN1N1JPNUFNeFh1b3NRN2dUNVNkWUlBMFhuU0I2?=
 =?utf-8?B?UHNOR1RFNm5HWHYyc1c2aWFISnpoc0c1ZTRmbnoxN0dhNlpZWW5MQ1MxbWwv?=
 =?utf-8?B?M04xM25QL1RxcmVpcTRDVVRzTStYZ3V4bjhJSDdBV3E0Rm1YdjVHcXhUSnFS?=
 =?utf-8?B?clJ6aXBXQWdSUUlkVmJHc1JUamlaN1RJNk45bWlZUUVwaTB2ZlE4TG4xZmVu?=
 =?utf-8?B?eWVpSnZlNjlYWGNyQisrUEY1RFppdDMrYm9adG9vdTJwVFhlS0lwaVo0WlJN?=
 =?utf-8?B?MlM1VlkvaTcwQ1lJL01mZDk5d2FuUEFOOHJPY3VWVUU0WkpuVi9zYURkWllB?=
 =?utf-8?B?RE5pZnlpZTRJbzZEa1RCOTR4TEJCTGZ6QVB4VWphTWRQMyt3MWRsWjArODVL?=
 =?utf-8?B?L1BPaDFqbGc1TjJiYy9xUHpzOG5tRFZpYSsxWXVNcGhnb0dkMEZ0Q2NITHFN?=
 =?utf-8?B?QXkyb1RRUHJRVW9ySHZqdGgvc3F4K2JnZVNCaW5XVTdHbkZYQzVlVVJocjQy?=
 =?utf-8?B?em5xaS9jK3dmMW9Od1llMmlpWDJPV2RITUNyVzNxZUs3Z2x4MXdlVGJKajhn?=
 =?utf-8?B?TGlXTHhSNkFTYkNKcGN1ejFlcGpEdTVpQnk0WFFDakNuUzMrT0czOVVnWFQx?=
 =?utf-8?B?M25NNGhaNC96Y2RxeG1ROWFITW01Ri85amllUGhHZklRUFA1TDkrcHliZlZk?=
 =?utf-8?B?ODlhQ1ZFaEljc1dXb1cyTFdlVitwdmdkS1JnRkQ1YndkTTMrN1Y1dmlEVC9I?=
 =?utf-8?B?QUI3Qi9pbzBCOVZNTTA0M0ZWMmhlRnphdllRT09sdmYrME1HT3oyeHRibm5Y?=
 =?utf-8?B?dndaOUo3K1FtUWcyanhSZWZ0dkZEelNqNlZKeXl4MmhBTUpyb1BZWWhLTTZC?=
 =?utf-8?B?cVUvN3dDWUIyTG9QR0M1aW5VblB2T09wVHA0RFlQaHBCeXJmV2EwQ0VMbkRT?=
 =?utf-8?B?WElWWDhuRXJ3VEt4UlRCZFAvRE1ET3lzV3lFMW53a2FFbzlxZVZBRE1LYnBu?=
 =?utf-8?B?WVVRb0QwL202M0F4MEROeGJGcHdvSittM0ZXNURMaXdEZjd4NmwveFZXS0Ja?=
 =?utf-8?B?Yks2dkUzKzRYL0lWa3hYQjN1OTBydXM0bGExUXQ1d0NGR3d1b29nRlpHcGRP?=
 =?utf-8?B?ekZIYTllQXBqU1doWWI5cGp6RHVPZDJCT0R2UUZwQm5ObnJFdCtGb2VOeGJx?=
 =?utf-8?B?ekRQcVJaNXNnaVJwZjl6N2U3YkcrWThML085RHc0cUYyY3VpOGM0SU9lRVVn?=
 =?utf-8?B?TzJnelBUQ2FRQThYcmpoNzBwYmowb3VsdCtsalpNa1VXR250dHY1M3JhRmJP?=
 =?utf-8?B?Q09RMWFvQ1pxellSYXIxcUM0Rzg0UkViZDVhUCtiSmdvaFdjY25kSVZnL1Vo?=
 =?utf-8?B?WnduNWNJbjFvdDkrS3E3ZHlTVWtLV3JQR0JjUzEwN0VsOTAzUGl1T1ZvZkNX?=
 =?utf-8?B?UDBSMHB2SHRqTEFYT2ZJa2JhcGF2L3pSNTlJbFJrSE0yNkdKWS9MY3E1Wktk?=
 =?utf-8?B?TWc3c1pEOVZpeGg4VzAxemJIS3h4b21sdm5qdHZ6VlplRGc3UXhXSXR2Zm1Z?=
 =?utf-8?B?REpwdXVyclZSa3VTL2ZtZzh5MThpNFU1YTJwN2hoQ2pTRnBtbEF4U2Q2ME5O?=
 =?utf-8?B?d0I4dEJSSTRlWkdvMXVPMTVyS09ISXduLzdsL083QTBlbVpDOG5DK2RXUWRy?=
 =?utf-8?B?VEdMbnB0MjlOL21VbUczdmRzYVNWNWtpSFlEZXJDUGVFenpSUjkwRXJ4RnZ3?=
 =?utf-8?B?RGUxZjl2UDV4SUlxWlpKcVcxWjNhRnVpMDdQZWJzZkhFV25MWlMrcW1HR2Fr?=
 =?utf-8?B?UVlhN1F1ZW1ETEdmNUM2aWZhTHNmdFBmakkwSUIzajgvNEFPOXBmVkZGZ21E?=
 =?utf-8?B?VHA1ZitnRTZ1Z3ltRk5oQ1M0bEpXV25La1pEWnB4dzd0bEdHYVVzckhlMEx0?=
 =?utf-8?B?SnlZNlUxbUdwVTY0dzBzOXNZTnN4dkcySXhwNlQzcGxtMmxBY3NZYUdVMERO?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0c0f1e-6145-4cd6-1e15-08dab1240051
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 16:15:40.9695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXIOmQ82L4iOhTYSv3RYBLWGwQF3oq7EmLya92AL7q2fZ0TBHEJ35tlVPqr3/+L45nHIEZki6ZIcLrGF2ku6HPhld1c5NmkhF3Bv9RE8moE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org
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

On 2022-10-17 10:49 PM, Pierre-Louis Bossart wrote:
> All Intel drivers for cAVS platforms contain a sequence for S3 resume
> which doesn't seem justified nor necessary. Forensic Git investigation
> in internal repositories did not provide any rationale for the
> implementation, and tests show no impact when those sequences are
> removed.
> 
> This sequence was identified as problematic during a large HDaudio
> cleanup where all programming sequences were revisited before
> extensions are added.

This is a good finding as discussed earlier in the review.
Tested-by is already there by the series-wide reviewed-by won't hurt:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
