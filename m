Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873F54B5ED
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 18:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5DE18B7;
	Tue, 14 Jun 2022 18:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5DE18B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655224062;
	bh=8zULre+bnxR6GuIamGjAlwbIUjz7TyO6o1KdAAGlF6w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hE8PH2IyPvAMhMqc4BhvqPTScnn+GnpqqfgluBGOWITRwlbAWjAFh+snW08QgUS2j
	 6Tp4Lo8NvW6lVXsPt6SPRZj6bJE0ZyUOjSpiZqAel31HZyso4StwHr4Nulgzh6vUoK
	 UKH4HMlHYIQgTlbl22+Sfb4DSediIGo2hK4BIMic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DD8F800D8;
	Tue, 14 Jun 2022 18:26:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3022F80139; Tue, 14 Jun 2022 18:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0499CF800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 18:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0499CF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Rj6V2Prt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655223997; x=1686759997;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8zULre+bnxR6GuIamGjAlwbIUjz7TyO6o1KdAAGlF6w=;
 b=Rj6V2PrtZQKIm3sAGwAN5eQ/EtTcdLG1nQ/MziQKAaZgz/IEPg3klnyO
 g0vtE2DVmLRVDux/HU7ggjrM3+s8GxT/+vfxsgMNEbamS/FuMuHLOOejz
 /zCxW86okMz11SaS/7fe8+7KoHJLFoT/psG/QNYX5vAZvUSLSjEVVwlqm
 KMLA37FU+peQnrcueFtDZwdqiAoNjDQAWruObV5EDYUDchKuJg2fqdvOa
 Uylq8t08Px7Dr+CPqhInGvLNVmQGLgJ+pJjZYdu70P5rU6DcPSpwgm8t2
 AVKvwfefG+Di1gEN61aCAQNIlyECvisJPwXnQfKcE/UtSW4bwieFrsMu3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="261695339"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="261695339"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 09:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="612297386"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2022 09:26:31 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 09:26:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 09:26:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 09:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwkx6zEl8KYRTtpp8hvWSzp9p/W8P60CIH1+nu9xjQpfwyeJXTMB0PNuMQVlkrfP93XIxlJDF49ZQsuh1Lro1DqehEUDgymRgop3MJQS7WblsmEemG0QVYyJIH7AselqxO5/vjLx0TMKmy4wAHYRiNFh0c1Msv8YwZjzg06LhEp/AY9bDSpy8M6WgTiUrGvr9jsbnNHfi/fY3EEin3Zhd+S+AeZgwhdjGem5ASfMijC/eifN6tZ/KSmWlOTpVbQb39Y9NWHpz8uhewaoG961WgPM2qffI79Ath9aiRxC6FP5k6kfWV/iQVChbqecnopeaz7PnOM4pbSvbxE+DBpKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnVHHSP7VMHu2rc+NLh8ySYMMD+nFEAwI9YayDMrfuU=;
 b=JDdzEAoi1RtAX8PXViJSAB/A7kH6HvJBURMqY2A7aGRf94wtRmPu90Sw8hLus/Tlr2B28EfZ5+gRvuc/9e+D2pVgNuAfiMVGDxo/+CHKZToH6nbnabT0hBAZkh0d8zfY9hHIRrOzKqX3iR4268eqVzpZ+MlntaWEA+TvmoNcYWXVfAdc1j8xnS//+MTRKgyDXa15/06OVGhcALg/fL1ZGOwV4T8JVtNEh07bMun8KYD42DG34pEyXqo3eNXdPFml81Gejmss9twiIWQywuUcNS3vkcOpOHOCfkgxdDvr9f8SOHdtSYD937Tt9Klb8e8pgpE1M2GHj/7ZDA+lw5Np1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY4PR11MB1767.namprd11.prod.outlook.com (2603:10b6:903:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Tue, 14 Jun
 2022 16:26:29 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%9]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 16:26:29 +0000
Message-ID: <fb13198a-3d38-4304-6212-966561725d55@intel.com>
Date: Tue, 14 Jun 2022 18:26:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: ACPI REV override for Dell XPS 13 9343
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Dominik
 Brodowski" <linux@dominikbrodowski.net>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, Mark Brown <broonie@kernel.org>
References: <29a2ca0f-bc0a-04b0-d0c9-8658359d365c@intel.com>
 <47431e56-9acb-7c7d-307f-83d81956ec5c@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <47431e56-9acb-7c7d-307f-83d81956ec5c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::28) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d9703c5-cdc0-4a17-4847-08da4e22a2ea
X-MS-TrafficTypeDiagnostic: CY4PR11MB1767:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB17677715CA2D0F1924A045AEE3AA9@CY4PR11MB1767.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvsjihtECyIYf8Z92lLOtWuT1T5qgfyalVNNNcZXmpmGhGsv+kbTKdOvvfFFaSqofFvyk5ArZSLai1M2yGR8SicNIJK12T7ZU/xFfl9IbI9sICphdxwMjRWw4EWqqD+xlVtglrAX0hE0aeMEpUaiKO40N6DlGvxPCvAeURzPMoVIQOI4mmrsOPR0vpH8qIHuZ1hw7nN9MzmKJeB3ZwC6VNljLyLSinphjF1rwCHQHlRSzk1rzHf5RH32M45IBQ3RtkarE1R+hTtnr0Q8olXXfxRPwSxzC3uAVoJs/bpzx4iaUIzgWU7D+7/ETDzuYRTQnh0Yd0ahihnhKcRwmynzZJFiE9l/8n1csMVVl1seUMkJOv92ZhXkGlJmSNxOiR2ZnPp3uyEClQNZQBuSLVAM3rRAqJrSwsaHVzww6u+3mTyGVivFDv07LcrK/QOK9n0ERLkESy5BSPgQCXJkxif79e45TZA4Gvh8USwrlykcU9zWj6kLFOH0uIJf2/+w11pgCna5lnu9Pp/2lSkRC52riMjV2pbxJJRCptX448hgnJZFt3lPA+DfKBj+ZBsjHMDH34cPMXzs/Fa1Ww9E8/MFHOTrQJmZfjYnlErm+itgMZzi3xjkoLhtacL4Mk4M/t6TtOQoI4RtabezB/ABF3eGu+VWfP0nyLwLo/dVuvIBOEEYqMmGrfr+J7OuuKkGUZrcaOX7txjE9AEpb3916jGJryv84qz1MkS9FQvLqQxEaSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(44832011)(508600001)(5660300002)(8936002)(82960400001)(110136005)(54906003)(31686004)(316002)(31696002)(86362001)(66946007)(6486002)(4326008)(8676002)(66556008)(66476007)(83380400001)(26005)(6506007)(53546011)(186003)(2616005)(6512007)(2906002)(38100700002)(6666004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXMyOU1ZWTFoMnV4UDFrMjR2Snd0WFA1MldRUG1ra1IvcUNmOXZjQ2ZzOVBz?=
 =?utf-8?B?M1o5ZHE5OTNYb2JiNkQ3RUpJaWdoalg1VnU4TmhaSFJLY0wwZ3ROOFhndEt5?=
 =?utf-8?B?ZTdrWFhWTXc0TDlIR0lxdU0xdVd2RTl3c1pBT3NJdVJiSzRienMxRndZRk5V?=
 =?utf-8?B?bytzQ0dQQzhMeVcwWFMxUzJFNnFHTlFtYVo3Sk5rUVlhdHV3eTRjVXRSRnhY?=
 =?utf-8?B?UmVCL3hkVTdkWFdjWGRiR3M2N0RFL0V0cmZQdldSaUgrdkRBT2hCWE81TDlN?=
 =?utf-8?B?dnM3NEZoc1llVUR5eHVBaXgyYkpha1VOV3I5NFBEcWh5OXVOWTJLaFZoU2p1?=
 =?utf-8?B?TDlKUVRFMzQ0aHNDVkU5SDN0Z1UxWUc1eTVURjQ2akk0UE4zZ1I5NlV0R1NB?=
 =?utf-8?B?cXJkdXRmVExuSXl0M0dwRVc3S240NUJROTFLT0l0Kyt2c2RBc3NreFMwUGYx?=
 =?utf-8?B?SUZETjRWb1krRlRqNWMzKzBPcnhURjV0SVRLNkwxQnRwZGFRc1Fic0xVZzRv?=
 =?utf-8?B?VEpjUGp0b2krZGVzUCtoTHRUZWg4MFdFd281N3dHR0ZjQmFaZHkvMktQMUNm?=
 =?utf-8?B?ZGtXUzViUTNBRnU3eDdNUjdNZEd1K3U3Q2wyaVVybmprT0xwNmljQ1laZ2lj?=
 =?utf-8?B?WVVSL1pKSkpOejduRlB5MGttVnQ4bGNOY2ZEUnBUNmIwTHdxaUhCd0R6Mmxm?=
 =?utf-8?B?MS9EUURlM3RKNHpHUmsvY2xuVXJ6czZzMU90WHhyVUQzWTdtR0FBc1R1c3RG?=
 =?utf-8?B?K3puelhEQkdpTmczc1VlOHYrb2o2a25RUUxGVHNiUG1RbkltNjdYNFdtb3hC?=
 =?utf-8?B?R0pjV0NKVStta3Bhb0N1WGNUdURrNktkQW0wZGRXYVZwSlpucnJlN09QZXhY?=
 =?utf-8?B?dXZmSkIzdUtpUHlPMkFURG1oVzVqaVdBSW4wYy9qcnlpLzJTYXQ1L29TVUdF?=
 =?utf-8?B?bUZRNG5nN0JCZ043UW1TVGg4VlZ3NHkvN0h3SmdqbDErOWtvbzdCalBRT0RW?=
 =?utf-8?B?TWZRNkM1L2puRzhsNUZRNkJaS1VkOUJyRlYxMUJRU21iRUFNYno3ZHpzamN3?=
 =?utf-8?B?dFNVUk0xeHcvVlRqcWtWdDFyOXkyVDBqdnpzekpodXI4SjFXRUZ3dEFGQUVF?=
 =?utf-8?B?bXNaSEJXSXRVczhOdEdGWlREaUd5YzdzbVVOQzhEd1p6MmtaM2szSENWZTZj?=
 =?utf-8?B?eWZlbWhFaEJIMnJVN1cwQmVteTV5STBEcTFSelRWdzBOQXpUMDZ5TXh4MC9Q?=
 =?utf-8?B?cEFCRCttYTZVRzd3ZnA0RHh5YVN0V3ZpR2pTaHF5TDZDdjkzWTRqbXlYc3hC?=
 =?utf-8?B?RDhTMTVmZkR6RG96U2F1RjU3VXI4eUI3OFR0d2dOdnpQQ1lKYjBtRUMzZGJQ?=
 =?utf-8?B?am9aOFZBQXlFc3kxMExpSEJOMzJxaU9JQXN3bTZDMEtYVEtLbEozc1VZejRk?=
 =?utf-8?B?bTN4OWg2a2crNlp4U25NSFJZdjJUVWNNL2hvVGV5MTdHWmRNUVJZUjY5RDdu?=
 =?utf-8?B?eHQ2TkFKbWdISHRDaEQ0NVNua09tL05hSXJOZ1F2ZERQbVg5WFBuQmI3MVJy?=
 =?utf-8?B?Umc2Mm95eGR2dXBkZyt3WGNFZFdTUXFNYkFxZ1d0ZkJaTkRNcWx0QXB5QWN0?=
 =?utf-8?B?bks1U21CODdJOTZqcjVWQk1ncGdyYW5BVDBHN25hOHVsUHZNdkdSUnJ3dllI?=
 =?utf-8?B?Y0xRTGRYVDA3WnRwcUlrM2RaZ082Q0NLS0dHazRNTkVmRWR1NEg2d2NnZWRE?=
 =?utf-8?B?Y3ZMdCtqZDNUWGdaZ05VbUdiNHZrSEdzWXZkeWtrNTg4cEoyditvZEFoVDJa?=
 =?utf-8?B?aS9VRlVVYjIyZjRoSGlzeGZ2WUxMeVo4dkMyWlI3YmlTcE0yQk1ROXQ5TlZD?=
 =?utf-8?B?cm10cTgzOThnLzZsbWxrQlplNWpOTldOcXdGbzhKL3E0Z3N1WnVtcXNEQk00?=
 =?utf-8?B?QnY4eTFTNGZqVGx4OVRlalgxZHhEdDBzeFVmRjJoWWpyWEY1NHFndU4vWmx1?=
 =?utf-8?B?Umc5aFI5ditwQjdKOUQ3aXlGUXgvdElFQVNPQmlIWDgrMzFDRTJYZ1hqb2kz?=
 =?utf-8?B?Y3JRcHFTSTF5TDYreTlVeDczeFZSaUpjWEtudUV2MjBrRTlYcHJRRlVoR0Fr?=
 =?utf-8?B?WkhVMHlxVmU4bzdNWk9xTWNMT21GT3J1S0ZZcFNXcXFMVUdwdVlXNnp5eCtJ?=
 =?utf-8?B?ZlZURDRWejhxRzRiaVNMSjdMMGN0VVpxSCs5cEcvVldia1IzR0NEbUc2QVlK?=
 =?utf-8?B?SVBIV3ZkMURoTDJGcE50akJZazhEQWdkdm9LaWhUN3dIL01jc2VEUXdOUVo3?=
 =?utf-8?B?RGpKL2ZRSHdGSmpSZGVUc1lDelNvcXdOSHo1elVTbU1EVTMzQVpVSld6dS9x?=
 =?utf-8?Q?i1otBZLEStGMkm68=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9703c5-cdc0-4a17-4847-08da4e22a2ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 16:26:29.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RN1v66xvRzOYsrZgsqx+6+u6xIKMWXNIRPbkN86x1Da6S4+mu6wv4KBI7dAdWkSSwTk2seIqgeYsOGC6k4TWjiTMa2/lQOPjynDcycEf55w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1767
X-OriginatorOrg: intel.com
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
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

On 2022-06-13 3:05 PM, Pierre-Louis Bossart wrote:
> On 6/13/22 05:53, Cezary Rojewski wrote:
>> Hello,
>>
>> It's been a while since catpt-driver [1] has been introduced to provide
>> full support for Broadwell (BDW) machines with Intel DSP. For BDW, audio
>> devices can make use of DSP only in I2S mode. In 2015 Rafael and Dominik
>> provided quirk [2] for Dell XPS 13 9343. Given the description:
>>
>> _For example, based on what ACPI exports as the supported revision, Dell
>> XPS 13 (2015) configures its audio device to either work in HDA mode or
>> in I2S mode, where the former is supposed to be used on Linux until the
>> latter is fully supported (in the kernel as well as in user space)._
>>
>> It's clear that such configuration was not fully supported back then. I
>> believe now it is. Perhaps it is time to let the quirk in mention go? By
>> that I mean just the relevant entry, not the ACPI_REV_OVERRIDE_POSSIBLE
>> functionality as a whole.
> 
> This should be a distribution or power-user decision to enable the I2S
> version IMHO.
> 
> There is nothing new in terms of functionality with the I2S version, so
> limited added-value that doesn't offset the added risk due to the
> dependencies on mixer settings that may or may not be installed (UCM, etc).
> 
> If it ain't broke don't fix it.


Not much of a fan of the last statement. I believe challenging status 
quo is the right thing to do. We do not want to bloat the kernel with 
unnecessary quirks.

The broadwell-rt286 UCM is part of alsa-ucm-conf repo for years now.


Regards,
Czarek
