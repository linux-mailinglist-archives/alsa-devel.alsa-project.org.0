Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282E4C8D97
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 15:23:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3451181A;
	Tue,  1 Mar 2022 15:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3451181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646144633;
	bh=KamdKM4N/BG6y2omn3pY1wbNro0hrwkqNsTxtkzl+T8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAbzkenu1itLP0QyJPhDA6V2p02nORKquXH3Izn829NU2cXlHrMScmiY/X83pjqhh
	 jsjKFTo9TVad+XmoMPzLAKtZHEpiVtPAZjXA+sz5CzVMuffMycRetmQpE0ZWEp4igm
	 sdQBRVymGuW/xeol0tzuyUvf1VorCJZS+hUY4J+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD60F80054;
	Tue,  1 Mar 2022 15:22:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69155F80227; Tue,  1 Mar 2022 15:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D044F80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 15:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D044F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UNqzPVES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646144561; x=1677680561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KamdKM4N/BG6y2omn3pY1wbNro0hrwkqNsTxtkzl+T8=;
 b=UNqzPVESv1xRmUmT8oeaFPH/SaDVmtQ9nqnL4Fdnl+K2nH0HwIKaua42
 7XWHiNIw82ZJeXi2qa3yADZjT18P5RBZKIyG1Be45nLj8bO77lu+RRkkU
 teJA3PGTIwQI73L3vmi5uOTQo7bk/yFh/D7YlCh9Gh2A5IodUbyYgPe/4
 t0CD3k/SChkXWSBJJlaZ3cOttFplClfE0JoQHEh3W+HTuI8XHjen+drc+
 EBWfBjTvkiSHo6nhX4wesjYGQAdYFuIH+46p5EAEVGyScQOtLOvY6N9WE
 imTR/SH06s4nUs3QAwdUX3byu9JACa0yQzww2FJ0lQJnQRhwxCb+MECBG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="251969829"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="251969829"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 06:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="575714417"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 01 Mar 2022 06:22:34 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 06:22:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 06:22:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 06:22:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgrkSi703hQHOrt51ft+x5zzQAf0ZmvoJWnBxxFgcM0NqwBpQgOTb5enzSVN8AFDykiksDH0uZuDd8eY4bte1Pa/yZL88lEdqURohXGuy2GLllW6cvRmr4EjHxxQunt/tctvphfiFbPTC2UKwDjRnLzHponqSZRQlSYIM1+IsaReYu50AQr5eyL8myuQNWU+o8XIuw6IQrMULNGk7HjVQdrzD0U5BXdx6QnSCknXsl45aiRpnTVUgyAGV25J22oCOoSDURBsCHip6twh/On3rkgPjcGatRyPLVvLMLATD0gSa4xLzYpvLZvEzaXjbINwQ+V/afUmZWwBQM08IlZlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul4yDAMHk/dvCvh2ychmhZzfZEWqjBaynD+i979MXJs=;
 b=TbMZ3QF4aW1wQOh0gOJukt87rfY5iWzQ69nDo1WKSKb7KrpOMmW4Ky/SRPmAy1ffKZ9fX9LC1s/DQcaSW7he0AYhrnbK7iNYwK5cX+jREzOj9qGgU4YCBqupVd04BXr5c1p6fbBaqhWCPZJ0LJeKZ6m42P82OrO1V8vMVeTrDZhCcW7/+IzoXiFHNwBGj7bRI7et7mwvniV1yGqvvq0bVBcTlou9Ki9HN65hCAaTuqqf9ZFvIR0VcZJPZQGBgPk7g8ON1i5rx3XfqAZtNy2kLPfdoVUTiyO/tgMjYfD+0wO0lSglILQwk+mpugZs1U3AqcDHsy4UZTKqBN8hPeVnSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR1101MB2107.namprd11.prod.outlook.com
 (2603:10b6:4:5a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 14:22:31 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:22:31 +0000
Message-ID: <3f0a80d2-bd9a-ff4c-80c7-b12e85fc40ac@intel.com>
Date: Tue, 1 Mar 2022 15:22:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v2 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220228153343.2263412-1-cezary.rojewski@intel.com>
 <00972101-2526-334e-c2ea-02558b93f5bf@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <00972101-2526-334e-c2ea-02558b93f5bf@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0088.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::33) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e605194-dae0-46c1-2d34-08d9fb8eebef
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2107:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1101MB2107565F52ECF91FDCADF805E3029@DM5PR1101MB2107.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6p9HOCXVww+RIKMW8hdYuu+i0xCq1lAwxX+OkQbzeX7QpSG7Ywr4FpsrwmxUCZy2jCArsxxXANAhV80ihFQdne9D2HiC8qE2rJ/t9e+L4tOYjVWROVA0x760oLahiuf9Ml2oUIubgta6wOIA1E1QV+XUhtd6opUPU+M/eLrIO9dAzCkSUuwJJ22hpJYf5S512lll3ThMUyFyr4VCdeLgw11pUqqhAVtwZcka/4+Y+BpoOwAmDvBQ/ZH/DK1Qu09lw63SfWA6EqAlCvhbQIBntnawWQHlk9mvxj5QHPPaI43J+cAHSu6vKnZJdhxdLFyTXUAk6OUJ1CRARw/r4VOu8U+JmVkljSAcq862JdfMkSFZ9gMOEJsMHACniLnCfRKqAt1+gPvxh00kB79xjO39IBB5DtN10kESuC10D8K4XKVgYOPx5d2fBIAJIAyq1dabsZfays7vbf/HKblMWW87Jj1xPjGRPdtm4g0W3P/OrhpzRz+vHx8LABZYfsOTUBZfL+kimirVRMWxGql5BG+NVq8OULsc2w3HybysDzcQAEsTMI2C77JfleV+qQaxkvfh2UZz6QFXkRg7mc6JI3IU0tTBEFAqPFvbCHTnFqMZPh/jsyz65LIn4fTErojR8XLcP/sNF9HhpJJY9h352tfKXUe6doacmQYJeWP/UjwVzDEp5Nm78GYjN6O6Q6CHYGkIJrWrx7WgRNVjR+Gq95SsgA9u5Ah4A8OlC6tkjnxGcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(2906002)(66476007)(2616005)(6512007)(31686004)(44832011)(82960400001)(508600001)(316002)(8936002)(7416002)(53546011)(186003)(36756003)(6506007)(86362001)(26005)(6666004)(31696002)(38100700002)(66556008)(83380400001)(5660300002)(8676002)(66946007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3Z2Nk55UWxMTVRSNlIvK29ZZ1luWFNoNERjL0FoQWpIREtlNWdHM3RWaUU3?=
 =?utf-8?B?Nm90cnc1R1ZQRXp1SzA2b2YwWFNBd0krNmFUYTdIYzFCbEwzd0dsbE52ajdm?=
 =?utf-8?B?OHVPRlE4VjBxR3BIMDlLb0dNemtNRTEvclFiSUJSTDRPLzQ0aG42NEM3VWtq?=
 =?utf-8?B?WGtNZmxkdmxQdS9SeU10V3NOZW9Ub1ZaOTU5eTQyM0c5QXVzeW5NWDIwMjRu?=
 =?utf-8?B?MnNnMGlCdXRYUlA5RVpJVzlMVjRUd0NiRlFqeVNOVklsK3NLNHpoK0FrZXl5?=
 =?utf-8?B?c0lQSUFHUTBOS3M5MTAwMGJHWXIrbWRJVkJaczcyanp5MytrSnVkVUNmYzNT?=
 =?utf-8?B?M2dwZWxYVUJ3UmZhc2NGU1B6Wm5yM29LUnlFSGh1dUZyNFM4ajcvTUZTeHJh?=
 =?utf-8?B?K2lqWVlmUjdBQWRZL1crWFBCWTBpUCtaOXZzU09nWDl2aWluUFdvSUdaSWpi?=
 =?utf-8?B?bEJCU0tNQjBMdVZYRVNsUWVqbHFZeFZnbVFBVG9rNFJoUzFtMFdUT01NSVhu?=
 =?utf-8?B?dXVNZGM3aVBQUUkxQTdHTVVKa2xqeFZpejhQampodG1DOFo2TE1IeG01bzdm?=
 =?utf-8?B?emQyWCtyRkpyYW0yc2xzQ2lBS2puNytya1NQVzZpRHY1Ui9qSSthenFaN24w?=
 =?utf-8?B?eFZGMmZEYkZUaDJPUTIyQk9oVDdoL2ZUMG9wM3dmWmRqbXI5cEFYS3VCOHJ2?=
 =?utf-8?B?dkRSdDBFSUZjTTdReHNWVHEzckVXNUorUXVobHd1SXpoN1cyV2R1VTFWZ1lt?=
 =?utf-8?B?TEFNYnRjRUpvcHN1VGxKekxZQ1JkbGdCWU81YXdnWlZLcWlTN0JxN0o0ZUMr?=
 =?utf-8?B?bUU0MnNkNE4xWXV1RWVEVVpnSjhhRzZzSS83SVk0RzkzVFc4V1JzeWlVMWRp?=
 =?utf-8?B?QUp2aHdDTXRqdU5nb0lONkd1SEVrZTNwSEdJTm1mY2pZS2gwTzhIaEgxWlVp?=
 =?utf-8?B?WDR0Skd3bzg0NGorZ09TemlyZ2hocmNEcGlCcDJvRE5zY1RNYVZBbEVLVDdv?=
 =?utf-8?B?WjMyRUIybmltdEFoN3g4eEQzZlNEM2kraVJiLzJMcktJUXJoZzZNcXFZNFlY?=
 =?utf-8?B?ak9ENWJaQTcxY1E1OSt5TThMMnFHNVlpWE9FcW5pZnFiU0p2RzdYZ0t6RlJ5?=
 =?utf-8?B?U0pNT0kxZVIvZmpuekNKS3c5UHZkS1Q1bFlPQk04UnZJb0N5NE9HV2h3azkw?=
 =?utf-8?B?VHRTZlVNNy9tU295dStjSlBkK3F6a1VLWXRJMEdyNWdXTHQxejBwaDkwQUxa?=
 =?utf-8?B?MkwwUW5yWmgvMlRNTkx4U0laNDRBdnV1QklEYWFEdlZYQ3ZHQkVlSXNkc2RB?=
 =?utf-8?B?MityazBrUkFHNGhSTS9TbVFETUIrOGhLSWUyTXdsRTJZMjNnUTViWTg5QW1N?=
 =?utf-8?B?YnhIcm54YkgxTGlneXVqeGZiSnh2cjl6cW96WHVXS1FoOXE4bHd4SDFkMm5j?=
 =?utf-8?B?bDROV1dmMEFrM09lN0FLcDZ4azZuOEdtaHk1Z0FSSW81T0J3U1VaczNnTUxG?=
 =?utf-8?B?RlhTNDNvaWdBdzZwODNnZ0pZYlVjRUhRMDBta2pBMnVtYS9adXBXdlpaMmwv?=
 =?utf-8?B?b2Ezdlk1ZmNSZmpJWlljYmhSbnVjdzZXeG8vYmJjQTFibW1BR2w5eVYyTFdk?=
 =?utf-8?B?cmlIOG5GODdvemEwdHBQUVc1bXR0WHJCVkVNK1B1cG1yUEU1d0wzU2pYZDFs?=
 =?utf-8?B?Wll2UVJpemNRL2J0UFNZRjdqak9xbDNzbEFyQkVWR21PN1lBbTdLQ2JrTVhi?=
 =?utf-8?B?MkFPWTk0VC9Zd0xWZXVlOE0wSmRwVWpWVGhqeGlsTVUyQjJzVW5ibDlXa3Fy?=
 =?utf-8?B?ekJpdnAyYXVmN2JadG5SWnE4WVF2VWxIeUJYa0xlSU4rbEcybkNlYXowbDBR?=
 =?utf-8?B?T1NqSFBZZlBXb2lFKzAvR2s0OVFrSkpvdllKWkVBQjdGQkovbTMxVW9BVi9v?=
 =?utf-8?B?SktlVnBtck83MklzWXhqOWRXdy8xcFNES01RcUhlMUhPWVV6M1hOVkRRY3Uv?=
 =?utf-8?B?N3hmTWMwV1o0anZ3bmFXKzF2aFl4QjFsQ3p5ditnSzRZTExJMEo0NmpzeEdF?=
 =?utf-8?B?OGoyMjlvbDgvSWtaVWJwU1EzaHpDdEwrNU1TaW5pWGs2OTVHNUk3aWMvdStw?=
 =?utf-8?B?VVMxWWxURkFMRlFQZ3A1bktoUklRaC9EV1gxT1ZMMGNKZlFtaDZuK3M1S2w2?=
 =?utf-8?B?eUJJc0lyaU15MWhMRWV0SHRHL1R5UmtndDB5Ymc1WGVvdlBpSE02ZjZNS245?=
 =?utf-8?B?c1UrY0RGSWJmU1lESVA3VjV5Z0RnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e605194-dae0-46c1-2d34-08d9fb8eebef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:22:31.5165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwOsVG01Sx1A5ti5bYw/ue2wfn5Pp8x/EiziqD+J0RVOpCikSsQsh8yboc2iEHjw1b84EM3VNGTRsa2qjYxoSzUc4LIqnSwUv50a2oET4QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2107
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

On 2022-02-28 6:23 PM, Pierre-Louis Bossart wrote:
>> Changes v2 -> v1:
>> Almost all updates here are thanks to feedback from Pierre.
> 
> Can I ask for a bit of mercy on reviewers and specifically my time? I
> sent my comments on Friday, I haven't had time to look at the answers
> and there's a new version already?


Hello,

With all due respect, the v1 version of the series has been sent on 7th 
of Feb with most of its patches remaining rather unchanged since the RFC 
available on the list since 8th of Dec last year. Prior to that, there 
was also a period of time during which an internal review has been 
conducted. As majority of recent feedback was related to explanations 
and comments, I see no reason for not sending v2.

Please note that the book is not finished with this chapter as the 
series does not provide a complete driver. There are several changes yet 
to come and code can, and probably will change in time. The team is not 
fleeing the list once these patches get merged either - we have been 
maintaining and supporting Intel solutions found in ASoC tree for a 
while now, and plan to continue to do so for years to come.


Kind regards,
Czarek
