Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75294B6EF7
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 15:39:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2010317CF;
	Tue, 15 Feb 2022 15:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2010317CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644935971;
	bh=CNA/alnNOWDwI05i23DHGBLEXlJGA5DwLlh7uUVIayw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRhzGud+YKYY4eT9WuXu9+wihGWZNwrc2YNsWr29HgZkDBi7xrj+SH3Yck4ByIhng
	 q7mOZGnsyZ3Vu+AVZ0EyR35OlwSFsifBoMyavKiDyi/qLj0mwW0P8GREcbLnWerf7s
	 bRNaSHoreF28M0F/cMqblQ29UHDxPYvGFgX3FYVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97845F80159;
	Tue, 15 Feb 2022 15:38:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B55FFF80132; Tue, 15 Feb 2022 15:38:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9C02F800C0
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 15:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9C02F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ly19t/3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644935897; x=1676471897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CNA/alnNOWDwI05i23DHGBLEXlJGA5DwLlh7uUVIayw=;
 b=ly19t/3CYe9CRFOw6n/onkDlF0Fx+Egmz++TeqLlvrVh+5tR8VVNTz7p
 pXNY/Aciwh7ikve6t7bfexX+djWhS1yTmORy2aMKQxpq5pGWkiTwIpWCd
 YENZag14n8t6wig0UTXPpkH19pRDRN9hqkDSCBeka39C7g9gzGjPS7w1W
 X0iuxAqYeylEyhyBlxwjj/3jcWPQLF3AbYHOfX39Xq2GRXFmPvieKu8gW
 27W9hAK8rg3ceo/Gk/XpkGifg90OjMKckpUtC6wMDUu6vDU83SH6OoiQG
 PWQXmDECQesXnyILlv12rKw+2IdEIdEMOGdweyg+woMochCfDkyK/QCtZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230991338"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="230991338"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 06:38:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="528889940"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga007.jf.intel.com with ESMTP; 15 Feb 2022 06:38:11 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 15 Feb 2022 06:38:10 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 15 Feb 2022 06:38:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 15 Feb 2022 06:38:10 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 15 Feb 2022 06:38:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyhUCllmS2h0rF4zCgfgol7bJ/TPZoLWqtgR8ROVfIlHeK8nHDqjuv64sXfe+wusHfGH+Yf+uKNt7HNrG01muZTSjbA0kZcCoW3A4VCS4kJhdT3TXGbLfkaQMQ0byL2fw+PIMjf8Iq+4IDxVVZZXy5ll34lNHvM4WWShUNx9NG4aiN08PTHULetcXjPxSs8BtWv+NTT8RVkEtF7SSjCaQ7HcZEKjQfaTTE2SRnrOC7FM4PWBYA6rjDayFCmvoH68jVkaqpfy2dt6uw3hvLSFhhBKt6YQ2xdch5kOl3+8WWFP5NvorBmDVK/AmB38hgZDgVQgxJx7IA5DDj9ev3yyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwrKeTZR6fw6CkPNWa6ca6RoctJTHkC427WOUunu+wM=;
 b=FdO1/iAvLgbO4BqA/NCmovjEvcrxnKUvz7x9NlY6IJE49ZBzdpDNviO7ruRiPgLjojTmvyvaa0TmMl0gKi2iWD/Ro810q6HcZRNBKY21vgGs6cZapCgbRNnGERdO6/pugcIzX7HY1VfJUH67Fu7h1EQg7Uo7OnErVn10Lt66KEMfY02Lmc0xVdsEChCU74YcWP+/ueziaE+Eo/IlR20cO3ecJr9zzycr9DAUYW4PbRJLB3GHnlt5Wvvzh7UHqlsOt8vdOGVqeHKDPSUx4Q4+NIdxnZTLoiwc46hyxMk1Yhw1ZYk76/jy7hTdgz8RQYSk7q6JiVMiXjROdonubcpmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BL1PR11MB5553.namprd11.prod.outlook.com
 (2603:10b6:208:31f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 14:38:02 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 14:38:02 +0000
Message-ID: <af117b20-15d0-1392-b6aa-36f082eee0e0@intel.com>
Date: Tue, 15 Feb 2022 15:37:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 3/3] ASoC: intel: skylake: Set max DMA segment size
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
References: <20220215132756.31236-1-tiwai@suse.de>
 <20220215132756.31236-4-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220215132756.31236-4-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:69::22) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d2bb85c-5529-4096-458b-08d9f090c4e5
X-MS-TrafficTypeDiagnostic: BL1PR11MB5553:EE_
X-Microsoft-Antispam-PRVS: <BL1PR11MB5553EDFF5A3C9FCF6FA77043E3349@BL1PR11MB5553.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6gmd/HxXQVAvhSjo1tFWoSQvl79FXCo/sayb5nwu5pnGIYSMyO5FnVaWUKvKVAnwe/jRoAhtWH+n6+5nZMXyzX893pu9M9vL/QB22lbvLEjsGEa1ecgGFx6PAfYca8oaI10qvHS13omjS7itCqVFRtOVWiNr6I3hx1MHiBUny9LYevJCc92nT63LhOJ781cX56XMWuffn7EDdJ527TogRWlpcWggARAIFX42vC9xVN/tAA0FFUYJ8OSO8LRTC8rKzu9CizomyGrIv40FFrDIynH4DRyMwPcZZxnizGqGGC+75dr6vZjpNzla6wmJ5KDnU9ANpsUDTN2XvFiyZbZOGZefg7SrkQhOtXKQKWzo/1jHLIKPHWNRm8IG76yTv5PyE0/aTC6LA7eVcl2OzsTZa/09lop3AiVBZeGOt/qONJcUH9r9SfK4lDX4lS3m1lR+FS2qaYYThbBjX4aYvJ3+DOp049hpxUPg9YXjQRP5kCZAmCWPUq1K7dZVWcaoVuGosypcVodsj/Cd844wdSo4OQKwX1LgbaL3PkRNbiuxoN9VCe4eohKnArl7VPR7Jiq5LnOqy8eeT9Wd1UNaHE2ZeYmKmGT/aFmYr0ISbcvtZw89oI0LXdm6+5aVABoRp5CryPu/KYkEw5tCECktA+9Wjqe/sbMXFzXO/PErchXKhRugz8gfBjUEoibIyDY029HR7IiLGUahz/qdioWjPVGOCOE91xpCWoOyxqTXFAZW7b8dINfNAIXIg9rli32nBOpoEbtZaiEMN09DfI9QPamHU0plAZjmO7eAcxehM40g8Y5QjeIgHfV9Bm0KY37STB/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6666004)(38100700002)(26005)(82960400001)(31686004)(186003)(2616005)(44832011)(6486002)(966005)(508600001)(31696002)(316002)(53546011)(5660300002)(54906003)(8676002)(66476007)(66556008)(6506007)(86362001)(6512007)(66946007)(8936002)(2906002)(4326008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhGVTkyTnpmYllIR21YOFY1MGhuQkw5K1p4TlJ1b2lmbGFxSktMZWpLN1B0?=
 =?utf-8?B?TlpTOGRUOGwxcnRnL1ZnNmgxaE43RW5iZy90clFDRTJBbHhEQ0ErVERnaEJO?=
 =?utf-8?B?VWRWVERsT3o2aUtHQWU2MzVnN1pCNDdFS0FiK0hYUzkyZkhCZi9SNjhzMnJS?=
 =?utf-8?B?MDkvUVRqT0JqSndCY1RMd2hJZHFzL2hRUStIV3k0L0RnM0pxbjBJK2ZoU01P?=
 =?utf-8?B?MTNya0IzVEpsYTJoUXk4czFEYTRBUVBCTEgrc1c4ZjlKM1J1cm1BaFlCaXBu?=
 =?utf-8?B?OGp1OFIrbjJZUHk2UDBzaG9OOXI3MmEwQ0hZa0tvVElTMVcrVldGVTZESHA0?=
 =?utf-8?B?SkZLQjVsb0JLQVJPUG1PWFRBdzFQT3pFTWNuY29rdTNkR21xMzRJdmtNMGJv?=
 =?utf-8?B?QW9TU0puL09tZ2Z3SEV3amYwUVVTKy81T0tTL2ZXRUNDazg3MmdYNEl5V2ZQ?=
 =?utf-8?B?MHU2MFhhbFNQY2U1T3UwV0dSVW5oOU9xaENndlp2dGwzK2Naa3FQdmJLaVBZ?=
 =?utf-8?B?SkQzZTNsaEh6SXFJWFV0TSthYTg3RHBiQndMTEV5YlI4ajdzc052bzFmTVNK?=
 =?utf-8?B?bjhzMUVmYUhmSU0zOFNNM1RiYzlNODdrcEwrS3ZtNFhYUjdXRDhXemtNcFQv?=
 =?utf-8?B?U2JUNDBlV2VHZjNrcVQwVUVEN2tzajV2bERkdkhZejNXUVhENTNYK3N0cnVI?=
 =?utf-8?B?ZEw3dFFMWkh3c0VFQTdDOG1JaWFvYjREQmNkU2tXdUh3OTYyQjRlKzMyRWhx?=
 =?utf-8?B?MmQrdTJTbXQzQjFRY0JveGxhekppSTJhcHlGU0dtRkZIUno0L2tFaTBlRWdk?=
 =?utf-8?B?M29qU2Rhbnp5Qm1hOWdXdFMybFkzSnArdU5RWUEyU01MSWgzcHk1RVUyR01B?=
 =?utf-8?B?QUZxZFpOYTFKWnZvaHVVaDY4dzBsaDVIa2c1TGtQRGRzejBhY3dVUGNUVzJS?=
 =?utf-8?B?VUE3eXBtMW96S2dsREJqdnByL2g5QTBZdUlZVExVTEN4dFlYc29mbUJuL2ZZ?=
 =?utf-8?B?K2VOeFZnaUk2ZHBhQzN3TTErb0poTERYQXNwc2tUeFhtRDYvSzJQekxjdVlr?=
 =?utf-8?B?NU02TnE3YlpTcEVkb0NSODJHdjF6YWRxUGdXcytCRzk2b0hyNFpwMDIwWXRD?=
 =?utf-8?B?SWs0TXJpc05vTHlQV0RaLzkvSXBMWU1NQzhudkpxa1JNOGxQeDR5bGNCOGNw?=
 =?utf-8?B?dGErY2FvRGxlbWN6WnRPM2t2ekxzTWcwdHJVaW81TWdFeEdOb3J4M1VqOSs3?=
 =?utf-8?B?amFqbFgzclYvZ0svelBLYjU3b2xuQytXaVU4cWNwWG5IUXYzWktuMmU5djB2?=
 =?utf-8?B?aWlVMEt6czdjK1hWek1SSnRQOUNTOXJOempQREdlMStybUhFTXM4dWc2cGZT?=
 =?utf-8?B?MUxlWGZQbGttRExtMUMwZXpEamw3aEVtMC8wbGVCMEtacWVFR0VPV2tlWXhv?=
 =?utf-8?B?SFo4ZmNNdktrY2tBajNJWk84UmNocHNBT0trR0RrTlpmdU4rbHloTVFEZTF1?=
 =?utf-8?B?andOTmhHL295bURZY0lxektOODhrR2NRYmJqa3gwZmRyQ0tzTXpSQTIxUVdI?=
 =?utf-8?B?NndJVWpZbVRNaEsrbTlON3pGKzFyMk9HU0c3YVlNUlU0OXBQMUpIVjFTOWkr?=
 =?utf-8?B?WVAvYnlNSFNqSW9XMXIrZTJzcmxFTjVSVUs5VGMyb3Q1VTlDNExTSlNMc1da?=
 =?utf-8?B?b2VEakZYVjdnaEFUajVHNk9USWFMQ21ZUnd5UWROMmora1N3V1NjYjNTSXZE?=
 =?utf-8?B?bklPd0t4UG9qbEU5T1grRHh5L1VOQWxKbnNPejRSNjRkWktEWTlURjJtY0dT?=
 =?utf-8?B?cmxuUmhBVUlRSkRXbTM3Ti9Hc1ErNDBMSHVOb2NHQ0RENFgyOFNYNk1DUXF1?=
 =?utf-8?B?MHMwSG9BbXVORThNRXhsVFBUMXIxbDF6Yy9EQTY1MU8vZmhBL3BoQ1pucGFQ?=
 =?utf-8?B?VXZ2MEduZ09ldmVWZ0Z6WktXSFozUjFsU1hzL2JBODFUT3RFUDVsOHgxWkJP?=
 =?utf-8?B?VWlGUk5mdnpoWmZZaFVvUXgxQ3RmOWZvNEtoK0VONHF2T2MrSVBJWDJQNTY5?=
 =?utf-8?B?NDY2ZlNHa004SmNqUFNHVDF1Q2VFU2R1TWhWbnU4akd0Wm94TkZKcVdpZ0JQ?=
 =?utf-8?B?OU1yYUVwbDRZL2Z1MHkxd2RlS0JFK2NXQjU5NHlZL2tobG1RMzJVVzZrOEsv?=
 =?utf-8?B?U3c0QmY0YWRpM0diU25PWWNqWWRWVEdWRDhwSFpEM3VqdWx6V2RiSHI1eGUz?=
 =?utf-8?B?aFFaL3NVdTRoQWhraFNmOXJ5Njl3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2bb85c-5529-4096-458b-08d9f090c4e5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 14:38:02.2702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: On86qL6fxL2Qhsaz4CrshQsuBpsrp01/fVYV4AiBbqUpDnkIF6BOPoJxQhqlM64k5Yuhj7pwQ222oclDhAnxnyXwww4i63Qv8gSRQME3fOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5553
X-OriginatorOrg: intel.com
Cc: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2022-02-15 2:27 PM, Takashi Iwai wrote:
> The recent code refactoring to use the standard DMA helper requires
> the max DMA segment size setup for SG list management.  Without it,
> the kernel may spew warnings when a large buffer is allocated.
> 
> This patch sets up dma_set_max_seg_size() for avoiding spurious
> warnings.


Thanks for accounting for skylake-driver when providing fixes.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Fixes: 2c95b92ecd92 ("ALSA: memalloc: Unify x86 SG-buffer handling (take#3)")
> Cc: <stable@vger.kernel.org>
> BugLink: https://github.com/thesofproject/linux/issues/3430
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/soc/intel/skylake/skl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index 148ddf4cace0..aeca58246fc7 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -952,6 +952,7 @@ static int skl_first_init(struct hdac_bus *bus)
>   	/* allow 64bit DMA address if supported by H/W */
>   	if (dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(64)))
>   		dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(32));
> +	dma_set_max_seg_size(bus->dev, UINT_MAX);
>   
>   	/* initialize streams */
>   	snd_hdac_ext_stream_init_all
