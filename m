Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963366E12B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 15:46:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F8F6903;
	Tue, 17 Jan 2023 15:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F8F6903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673966801;
	bh=J0V2KrPkChdD2hCKY+j6ARgYn/MyNmNieqISXapmolk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LRN0DdaZ9X3azIcSIQLZ5ltNC9tR0zRpPUG4TcEbXvWV6wftaaT8dDB+gvrjhnk7L
	 6Oexi+H2izu/ybtRj+eEx3PzJLxXaqH9Auif65TCBtAM8Z3EFrAA/CFfR+FnbEy9Eo
	 QbM7jmWWPPTMMt+P8406uhLnvmHllDRCBOTcvkKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F25F804DE;
	Tue, 17 Jan 2023 15:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39535F8026D; Tue, 17 Jan 2023 15:45:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5424CF8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 15:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5424CF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tk0vV9ul
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673966737; x=1705502737;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J0V2KrPkChdD2hCKY+j6ARgYn/MyNmNieqISXapmolk=;
 b=Tk0vV9ultfWf7pvq7dVtPu8FV9rqE9cOjMg988tVv1t87kvEbKY7o8zs
 0T6SAogG3iazJXv44b6T/hOlLKohdIzab7y1m1QQfT0h1hP9mJGpf7vU0
 MP7ca4//0+AgLBPUUefn1YFLlm2iXqSOLDRqYDmoyMUp5ZOvYKcpld1Ee
 9P/U4R0FbTU/qe828h4dtlxu6pIrjiKqbKmC16gjRg3LNpKItsQGAYnfz
 PQJAZbSpWBsH1wzhQMA+FICG4D3c08iG5UUP/ZbKr6KMd8/o+HkXcrqmi
 +oK0R3zPVitP6KfxMLSDgj3CGnfd2yj/Qy+egSNL+QZ+pV0SYTHLEoo1N Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="326779168"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="326779168"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 06:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="661313385"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661313385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jan 2023 06:45:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 06:45:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 06:45:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 06:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdmYTeSHGhezT4SGSfCdxa6mK83EVivPJdpK1Nb0gCnEPnu1umPMrbffJOy+hIC2njDBYDaXhUzWg+0jKRHNhVw9ipniEJVRQ/YmP4LMokVaTjmHOtiJ19iYeCfmYUhuwWz56+seCTUfqIQjgBShmzGBFVNR/I2o8TVTen/WToUH+P4TYjt2rIPoBHyAUqfDZgOctC6LWlsls2hTZ5YTkNTCDI7J56clwFdNVM3/kYPQ/Zxc1LUlya+iQc68UXuW2qzaDoSc4e77Mj6lr47ij54UsS3fAfedZB9eoIvK0nyreRQnNv2DgCPil6FgA/esqkbDKYYtgw/urQX/mtFq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHY0JvMUbXwDcc6hPBjO5pxCLIQZrckiXbNr4fjmB8Q=;
 b=fpAVx9uJyYuTBJFXT/zAhnSg9KRxhZ15PluMkakBCQ53Qph5hVyj94+N1dQH3uHqviOTyRUuSBtaAM4wN/TL4/PDXPKZx22mtvhbERoO0EOH9sRCuz6DjzmR184b1KLl6CGgm0QDF+vNwapkU8Vzqoglh2ko2+CmYAX8Hm2JkZwKxy1bV+z88GYcLeCPnPL9ngOPNQ0fpp23EC2q/1tq6jeLdQblLkTBlO0Gz4F+Lb+cC97jD1j+IDIWRaW1u6oeda4gpS0JnUlv6Bv8ZW9q27/6jG4rd+37Ij7s7Itcf2QeX1sd5q1cb2/AySF4vn/aKTPgbO+BDbB20YY3AvmXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB7541.namprd11.prod.outlook.com (2603:10b6:510:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Tue, 17 Jan
 2023 14:45:24 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%3]) with mapi id 15.20.5986.018; Tue, 17 Jan 2023
 14:45:24 +0000
Message-ID: <9034530a-d49c-9dd2-515e-1a865e58cb29@intel.com>
Date: Tue, 17 Jan 2023 15:45:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/9] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-2-cezary.rojewski@intel.com>
 <878rp2i6sj.wl-tiwai@suse.de>
 <2966b410-f00d-9b33-fcfa-30d484455579@intel.com>
 <877d4jsppp.wl-tiwai@suse.de>
 <8bdd56fc-de6b-381e-24f5-5d2c28e337f7@intel.com>
 <874jzmr4lg.wl-tiwai@suse.de>
 <ea75b058-5716-f07a-c37e-ab9b9c945f60@intel.com>
 <87bktqv30n.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87bktqv30n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH0PR11MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: a59cf067-2065-4cc9-44c7-08daf899772b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UA5sTPcTCREeu4gpjWqtEIxxWNYVgSGYQ1AJ3tljzgYdTEVXD/tBg+ZXdY0OXLGJr6CKeghQ+FxQY/Zsrz5HzdAB4T5HAL2MLelusA6d4UH8b79Yi3TGpIWOYT6lw8sCAHOfSEj8hgJpPVtJ64omoYm7VTD8TGgKezJOH4FdPbZAckhM56czDVa4MBSmMd/G0v0HxFH0C4Z5uAIwx4Vto0TjlUMUl2X+OFOGORQ7g9ogPqi7IDnk3HTW61w1eV3IGqNXQzRNnAW6yz8rxTK/blDxR2xXdiMTagmZdCaGP7bZ7CxBvHGQFgemJfQP/f9OAEBSnDKciqVxLiag99DNxiYywQ6qypkIIWyfJ6obZiOWWnaoY7buBCeX0FrX7GppYCsLShrpUPZcN+3NRiLNQmVguDCPH0t4iY7YtO0OGZpJTgu3SrMDLLOajWVihdumPlVNKRpLJuLh4VXUwEi6r9Doal1w1D4AilGsVKT6kU8K+QNa/zx0PEGYoVlMu6CXp6/x97gjw9fLR1ly7bFt4rh6agyY58OQPHWiZhhI4rODSgpBeghLvcSHSWCU+JyPXKhsDpRbVdfdY/B7DJ8/bur8LBY+dLOwJu0N4Daxy+AzIeBQr/qsKhVO5pUvCgB10vpWnLQ6sG8PPJo7dqLjcCDuAbNX3rR5PXqopOi3KAWhLLqmyzfz991GilpNys04WhIAK7baZN5NNk0nKPyV5yzl/7VigT1sGIdtlLf+0MA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199015)(83380400001)(31696002)(86362001)(44832011)(82960400001)(2906002)(5660300002)(38100700002)(8936002)(53546011)(316002)(8676002)(6506007)(6916009)(478600001)(6666004)(26005)(6486002)(6512007)(186003)(66556008)(66946007)(2616005)(66476007)(4326008)(41300700001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVlVMmhGR2d0VVF3bDBRMk9ZYzlvaEpNMXJMUjYzYmhYR1J1YnNZeFdaODdL?=
 =?utf-8?B?aXpMRFJZdXNwazhZb2NsV21BQWYyWDZvUnlCRTZsVlYxQk5Rbkk4aUNRdVNv?=
 =?utf-8?B?MXFmUHpPdmN4ekJnWCtSVFlqZ0tteTVBUWRKQ004RVZ0WkZ2MTdqUEx1ZlNH?=
 =?utf-8?B?ajJLWnBHTHhjbjF3NzQyNndtMVlveDd0ckxwcWU3RzRvNW5lb01MVjR4dVUy?=
 =?utf-8?B?aC9Obks3OC81Wk91SWg2ajlMNGI0V01VRTdtUTVualhQNE5ySGVQeC84dHc1?=
 =?utf-8?B?WTZwQnJGZDUyaW1VNjNBRmVadWsvZTFiU0pUd2NpTG1hZWg4M0FLVVFpYnJ0?=
 =?utf-8?B?VFlDYUlVTnBycFpwUkxaM3BxMXNlY1VXbG5UeWZPZGpTd2JTTU8zMUtKVm9R?=
 =?utf-8?B?RlpQUTFGVFFLdVJsWnlsQktMcDV3ZWIxUXhyRVdFVW10K1dlZkY0R1J6OU5H?=
 =?utf-8?B?YTB0YjRQb3NLV3c0SjMySENMZFhRRW9ybkN2UHYrTGtaUVlHaVc3MGU2amk2?=
 =?utf-8?B?QWFPUW4rc0JNbGcrWDZuU29Pamd2UGNCbXk0UTlqRDZRbU4zYWt4eGszSEpK?=
 =?utf-8?B?TXBXTVFBMEFFSzZtZjZERndGTXppUkY3U1E0RzM4SkhST00vVGZKQjRkbk1V?=
 =?utf-8?B?ODhkT3hqeHF2SHVHSnp1VGtDem9CbXVUeXRCR2EydGoySzVLNGpsWWhBVXFH?=
 =?utf-8?B?dld4TWtEYTRwcUZ5RUJRWXpoMWNPc1dEN2tKL0p0N3JBKzRscThFMGMwVEpu?=
 =?utf-8?B?MW5GV2JwNmFIOWRHN1VrOHVsM2NzczZEVXd6TFRxeTVVM1lSNnhhVmRORVhW?=
 =?utf-8?B?Mkp1NW5uTEdNUkErUCtWT0tzY041WEE4RjFmSXk1cGN6UURLRjZ1RmV3Z3V6?=
 =?utf-8?B?VzRudWFJaFNxSHVwajNTNktYSXFqcmZuS0JKeFFodnZVeGl0NjVwdVd0ZXIx?=
 =?utf-8?B?NGh5OE45RUFUdk8xL1RGdnIzYm5TWlNzUklaTjVjcW9HZWpNTXRpeStlWnR3?=
 =?utf-8?B?VHhURXlxbzhPRncwUkVTRURQenhIOVVubHVveW5PQjFCMVNHSzdlWVVadU45?=
 =?utf-8?B?TUtnNXJ5Z1hNYTc1NVRueUZFK0hNRFJQaWtCS2VzOE9yYUluVFErNHhUV3U5?=
 =?utf-8?B?QlQzSjlORWtycXlYalZDbXBxNXE1ay9MVHQ4TGg0cnhuYnRjcDRSbVpOamxX?=
 =?utf-8?B?L2xzQ0YrZ2JTWjdJWGh0RTgrQmcwV3IwSDVsOXdSaW4vVUFpS3Y0bVZGaUpI?=
 =?utf-8?B?Sm5RK1NUS2pkaGVxcFNGNDc5TnRLTUZWS3R0dUh3S0ZNeGd3eEZCRThnZkRI?=
 =?utf-8?B?QUdRNStDZGhYRXZpdnRrOEdtT21VUnBNWGJqM2RJMXFCcjhmMlJMYXlrc1Zs?=
 =?utf-8?B?NHJJNGJSQWJkOWVhcVJMSFRHQU9DL3R3QU5mU2RPNGpqMlFXd3V0Z0J0N29N?=
 =?utf-8?B?S0E1elpYeFVEYkp6M2tGeXNLTW9hSTV0QUI3VVMrcDB6YnFZSWdxRW1penhO?=
 =?utf-8?B?cm1GNDA5M0xydU10S3UvdTNqSExscUt5dVJuWWdrMEM5V2kvcEVyMHY4dm9R?=
 =?utf-8?B?Y2NiamF1a2JaUXU4dnJ3ejFMT1J6Ui9YUlA3Mnhvd2hwTnFiR21ndGxWQ2lJ?=
 =?utf-8?B?Nmlpb21IUDdkR29sTFdnTmZMbmJIcnJzME5GU1EySEVUQTRMaXlhVnUwcXpU?=
 =?utf-8?B?VlozQmNMV2NJYlh3NnN1OERMU0h1S0FQa2M1UFdwVExJTGhtZHRpWXNBWDZw?=
 =?utf-8?B?QlRnc1lWTElqa29sbVZqOFppWVA0SFF3YjNwU1Z4enZhVDI2WEdyRFViMjhs?=
 =?utf-8?B?NlFVQVlkTFBra1dhdno4OW9JSlAvWndiVVFwNUJiT0RGa3QwaURWK004Yi9t?=
 =?utf-8?B?TlYrWFJjZUJmZlRrbnpoSjBIaFFQdTJ3TjVmM1AyTFIxRjdEN0dROHZUaWxB?=
 =?utf-8?B?TGJEV2FzTnJURG1vZmxxcldqMXhDODJVOG8xRy9hWElhWHM0WnY3VmZocDBY?=
 =?utf-8?B?RUVrL3YzYlkrQXFHblVGenAzcmJlSzNFMnRHTVpNMTBtNWMySDZpZFBlM2lx?=
 =?utf-8?B?eC8vN1grbEF4eUZhSExIaE9pZER4c2dTZ0lGWGZMelJPZFl5a3RsOGpucUtr?=
 =?utf-8?B?Z3lTSituOVdCaFIwTDVvVm1Ed0FlRFlYdDQxNit6TFpFQUdVWUZoWUcybGM0?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a59cf067-2065-4cc9-44c7-08daf899772b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 14:45:24.2148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMdRYD4bQ+cUc8TdlfxnN/yCc3Le50s5lE/tRaxm+0YhpHzrPi9/yI2Ccm5EQjaceScM/OnLmXLYa2Z6BaDMh4UDUyk2FDp3BiCUK2HCmss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7541
X-OriginatorOrg: intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2022-07-15 4:55 PM, Takashi Iwai wrote:
> On Tue, 12 Jul 2022 12:58:09 +0200, Cezary Rojewski wrote:

>> This is how ASoC HDAudio codec component was behaving for years, see
>> sound/soc/codecs/hdac_hda.c. If the intention is _not_ do call
>> snd_hda_codec_cleanup_for_unbind() then the teardown procedure will
>> probably need a little update.
> 
> Do we see a similar crash with the hdac-hda stuff, too?
> 
> And, after avs_hdaudio_driver_exit() is called, why the codec object
> still remains bound with the HD-audio (Realtek or whatever) codec
> driver?


Hello Takashi,

Your reply was somehow missed by me and shows as a review for patch 5/9 
in my email-client. Sorry for the delay.

In regard to the hdac_hda.c question, we did test reloading for the 
skylake-driver and there are several places where the driver can cause 
panics, that is, it may not even get to hdac_hda failing - some other 
panic will pop up faster.

But yes, the exact same problem exists there as both implementations 
handle hdev_attach/detach() and component's probe/remove() is similar 
fashion.

>> Actually.. I'm afraid the init one
>> would need an update to. Given how the implementation of HDAudio codec
>> component's probe() and remove() looks like, there is no dropping the
>> cleanup function without changing the upward path accordingly.
>>
>> Well, to be honest the init/free procedures of HDAudio codec are a
>> little hairy, perhaps it's time to address this.
> 
> Admittedly, the plumbing work for ASoC HD-audio was somewhat messy,
> and it's fine if we can clean things up.
> 
> snd_hda_codec_cleanup_for_unbind() is certainly written for unbinding
> the codec driver, and if a part of that function code is needed for
> different purposes, it should be factored out properly, at least.

On ASoC side, component->probe() and component->remove() basically mimic 
the behavior of hda_codec_driver_probe/remove() found in 
sound/pci/hda/hda_bind.c. As ASoC sound card may be unbound without 
codec device being actually removed from the system, relying solely on 
driver's (not component's) probe/remove() may not be an option.

So, the discussion does not circle around just 
snd_hda_codec_cleanup_for_unbind() but basically any function that takes 
part in driver's probe() and remove() routines.

Right now, we are in a situation where user can generate a panic with a 
single rmmod. Also, our tests show no regression with modprobe/rmmod on 
snd_hda_intel side with this patch applied.


Regards,
Czarek
