Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32314C709B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:29:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B5CE174B;
	Mon, 28 Feb 2022 16:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B5CE174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646062174;
	bh=fxs+h3zA9rkwRR+qCqqslqPDvL3FT/f5nJn/ehufkws=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DzvQoOc3lL0732Q4g9T89f7ARMp3HH767fCMUUhWW4qYeuANBw27WHa/jaAA43PGH
	 Uw3wu0QLGS+1OuJ8LkEa4bAoYmThZmv3SK+nHogywc/Nxo71AZw5gdQ3ERYUng3EUW
	 kjGJHfM/7E60/Vo402mIBzTRHH6s5ZBq9WWGEeVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB037F80154;
	Mon, 28 Feb 2022 16:28:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9634EF8013C; Mon, 28 Feb 2022 16:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D54F9F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D54F9F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ED6lKTZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646062102; x=1677598102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fxs+h3zA9rkwRR+qCqqslqPDvL3FT/f5nJn/ehufkws=;
 b=ED6lKTZbQSrnAMwWAnAJJ34Hc7E5QzTJjPy1vvMXSfEERi4mBmOrDdY5
 QmcL2HmU2as7BjRccS2D8LcsWJCW92Js0lahi+CvuRY5WiMEY81BjvlNh
 BrObJvtBhy2KMl+FF3v/8MtzqZFm+Ph+0PA9Nmio8v/gfUHswHF4FYsPm
 /dURTiSFE3WjrbzD/k9CM5G49aL7Vs9vn+AOFOtN4JjycuEX6PSl/U8X2
 VQc+Mf/6Dnnn4DsUp26wNW6qJ9RVcYFCYW50IPl6olHBkvJPZfWxvZxcI
 vLN80JvYybFfIvqYNWxwVz1InaiNUyqsoLzr1CE5rw6V3QJvNpwYJ2TF6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="251738305"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="251738305"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="608484631"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2022 07:28:17 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:28:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 07:28:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 07:28:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAel/kFnWnw7Z209Tgs1K/xXATOmWZyV5dPB1za7H9A5dxOPyYgF1BA7IDNiOq0A0lN25qklCYasmt2fRC0B7MLc0nv2yYK8/Z2Rl91WOQ+kFke3AlYwM/LWluIE1ajCdFqL28OSzsiHbCMNv/G0dwVvfoCuT7fIh3xelrPCPxAaJc0mictW+wfGr2WNYYowVdZFzvE/T6Dk94wkH6gVh6goq16AUW08vYlkPsga8ECUbnMfJRaYM85xwJIvg/fozxBp/qlCi8hjFtuLHyWNsBbJ5R3jICuDnQlNQgztji8B3uNbk94mhF3ysENw8Srk6/nmi6jjbRlR2Q4klmkQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcGZxzUjPpqV1j/HBEWE0CBRfAq16p+tjQzKsBDQHdw=;
 b=D02gxTkLd8aRRTGbc1SbuvZ/Clt4JyaniYba8gPi9CkkiBUsqwnYi8799TE/UDrH6yqS61GMjLv2X51Vr22w4IoaJCfeQ20+vNVzWI7E+16Wyv/W+Sb7RI+4BbrdtDNKUDXt3UJreNOfgi4Jsc/mWqD3sSAYznQou2QdSIqKOr4YF/nRF+JjIZjiPBAV07LbFeM//wmUld+q3ZBSqcAaj5LVkuX3Ypt0Y1D/dYKv0jk20g16o3JnMEP6rIvoUNnluRKFt4n+QlDFBV8RvrmBooUIO2cjWRxOx/BB+/Qv8UMVkVJUkoT1e8Qz6avY61xVvR6HYDWoYljI2R/Ko6ORkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BL0PR11MB3124.namprd11.prod.outlook.com
 (2603:10b6:208:30::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 15:28:15 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 15:28:15 +0000
Message-ID: <2fb2467a-fa56-24d9-20c3-f99d9f85bf2d@intel.com>
Date: Mon, 28 Feb 2022 16:28:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 08/17] ASoC: Intel: avs: Add power management requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-9-cezary.rojewski@intel.com>
 <24125d33-bcb6-050b-88fb-6b2ef549fbad@linux.intel.com>
 <b24a4d37-6eac-0cae-b1e1-cf26a8fff5ec@intel.com>
 <da68f26b-fb7b-a8d6-ea91-b05ce3a41701@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <da68f26b-fb7b-a8d6-ea91-b05ce3a41701@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR07CA0008.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::18) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2deaeb52-8dd0-4555-e515-08d9facef039
X-MS-TrafficTypeDiagnostic: BL0PR11MB3124:EE_
X-Microsoft-Antispam-PRVS: <BL0PR11MB3124443537E81942A44A77B2E3019@BL0PR11MB3124.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/4hvxs+sMKyXE3zaE+pW2ZqfUscussUbe8n5Cqg6c7R2n32LHx9qwnDIGa9Fr3bfOybVc6nSFsxEvQepi0c+SIeaaYCbKV3skFKA5iLPWHLQb9YH96orlHyJhecoCIPWHNZ3DtmBYEFdj5jd/jDxgl1SqacBlc5Z5DiEuX9HDcnQ8VOQYSuZaahM7gEiZk72/EHo5AYInh5a3Uz6nWne0OXxFHac+2J8ndgRp8sePP3iQxfbqaRHohmMArCrd/qWLRzCzbhKVY4lT8F8wvX8CeFojvNHFiGqQ08m/WHI2RHCOOwHskFS7bh7fRN0NqZeXC0bgcE8fLeJS85AwAAQ+0yCq39BIVAEibhl0IFUogZxgNH582+ADSCMStSZwl4rSo+pzcafD0+j7WaEIpWZlzrxWje4YFhBuRG55dlAa/8Oc3CSF8W8WGfK+haCyBxtfEuUyCHNu/M160MlWDXW66s/Dx2dPJuPAzInbyWGmdEKzn20M99JaJ05AwnAjZBIH81Equ70TzwwnpCbdwV0JFEvr/ss5+p/5pnM3EB5vrFu7hQrROlIrvUTlF0sip7sjrjk6pcftC6fDX+6zu+QPdmJ7Nkf7TmIC2sMV/NiQmrdw7INXHgW4J9eBl65FaX7kkDUvNsMQJqAQwZ4qErUv58F2yz/PzmFzNEqZ49QydGfRQtGVaGWpHQuzpq5vyauKq1q/spOfUBd4iQ0eq5tuprVSBgQQxAJhTQWGsuUWSWlxaboeLi/Qvt/9KAqZrT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(6486002)(6666004)(36756003)(53546011)(38100700002)(6506007)(31686004)(508600001)(83380400001)(8936002)(2616005)(316002)(44832011)(6512007)(86362001)(31696002)(7416002)(5660300002)(26005)(186003)(66476007)(66946007)(8676002)(66556008)(2906002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUI4TzQ1bHd0a2tTK0RyQWcyU1hQNDRyTWVBR1dEZGdSNkRPV1VId1dqYk96?=
 =?utf-8?B?cFg4d1B6ZDc3aGV4NWI0azZkQWk4bEpsM2l4dGFwbXhHQlNCUGdHVEpYeHhS?=
 =?utf-8?B?NmNjdk92bitvbjRqTVlvbDlaRGZVYkVySSszdU1YaDVEcTNtSTBQN2lsVzJT?=
 =?utf-8?B?c0Z5OXNzeGtwa2xuWkt2WjF1cWN5YVdzNWhMVGxZY2kzdXRwbmxpRmxxVmxH?=
 =?utf-8?B?Y2JNTWEwNlRlSWlka2poR1psS0N1aFl1UzJnbC9VT1cyWnBaT0d4OGxBZnM0?=
 =?utf-8?B?ZEpNUUg3NjdTMnM4RnRadCtFRnlXK04vRW4rdk8wTEtMVDUwQTdRZXlKakgw?=
 =?utf-8?B?VGFwcjVPbG1YQ3dKdG1nZERPd2RiUnU3bkh3TUZMYUM0TUo4R3NLVmVhR2FG?=
 =?utf-8?B?N3V2cERwMzNGeE96QTcweEVjb3lKTUltalh3cTlaWFdxZVlrQVR6aGk2YnB4?=
 =?utf-8?B?bGx2RVRnMzkyY29kbDd0K2FTUUd0VzluNzhEeW94c0dCOEtNY05lVFQvRVdr?=
 =?utf-8?B?ZS9ZS3Z4eDlsNDFVbGNmTXJvSE5XeUcwamNjWFpIb1Z1dnVrU250WVc3VUs1?=
 =?utf-8?B?d0JDNGlOVElKSXhUYmRnbUNiTDVUSkNSWnJsVGxsMkFycEp5VEJET3IrUzNC?=
 =?utf-8?B?c2tDd2s5N1R1YkhmbUJBb0RFaWh6SjRzdVIxYlpYelpPc0Q3cUxScUNtbi9o?=
 =?utf-8?B?NkhwUGdyVFBOK283WGhNK0tIbml5NEZ5YUF3TkwxL1JXZlV5ZmF0ZHUzdmpv?=
 =?utf-8?B?VHg1UDF3bmtFaDJaOXdPTTVXcmtjUEU0WkxjbmptOUErWnZzVUtmeHMwWjJ4?=
 =?utf-8?B?R0NYMzh0UHpveldKanFGaVcwN3ovdFVPZkZpem1mcVNia0JOSmduRlJEaUVu?=
 =?utf-8?B?K0dya0F1Mzg4OHdPeHhqUEU5alJPN2U0ZFRYNFZCYzNQZmFrQXBvK29EK05q?=
 =?utf-8?B?Tlh1eTVxa3BaRDd2bG1ZY29ValpIZzVxbUNJcENITVpyamQ4Q2VSalhKd1hv?=
 =?utf-8?B?STZzOFFYRW13cy9VblljS1l3MTQyWFhDcmd0R0huOVNYbmt2UHNldklXOHRQ?=
 =?utf-8?B?aDI3azdMcDQ0RE9VT25FdXREQmhVcFNLbkY0KzNhakI1MW1PdW0zRFNoQVhR?=
 =?utf-8?B?SXRMZVpMcTYvR0VuTUo1NCt0OEFMUlhnOVhSWDF6Y1hPak9WWTI1RWxLUG5h?=
 =?utf-8?B?U05YUDhYbkNGQmVGb1JzaGNmNktrbk42SmRyeFlrdU5WU21kM1dMYjlNOVZV?=
 =?utf-8?B?ODdqYytNSXZnbkZqcWxwVDdlZjhHN1VvcUJmM2ZsSkoxRXZyWlo1TitPSW1L?=
 =?utf-8?B?SVF0aGZJQ2U5UWpzT2NJT3dtNlJFbHN5NSt5QkJFL3psS3JqMitYZ2dtc1di?=
 =?utf-8?B?dEZsZ1RWVTNuZmpHNDlQTVhjYVFqN1d5ektCN2Z3YUlhVXpZZkQ3UFBsT25o?=
 =?utf-8?B?SXRWbVoxaTh0SDkxMzZYYTUwWXVYVE5JaHRpMGQ3d2FraUFKZU93UC9XTHBN?=
 =?utf-8?B?a0E1aGtocTRwOFVXL0tDa2M4QjFBUHJvem8rNlpDRVQ1dTdMbkZTcysxZWh5?=
 =?utf-8?B?UGhEMGYzTjJDbWlUeDJuODR3UmxVWjZCenNtVXpXMEs2UTZSY2dGRnVzY3RN?=
 =?utf-8?B?SHJVck5Da0pqT2I0SXlIRGNqWFZ6WDgxSDhheTYvZFY5MmtFWGNFWVcyMnhV?=
 =?utf-8?B?ZzIrUXhTek8rbW5ZRnBsZUw5YU9NQ2UvdHF0S0NXUUkvaDE4aDUyWWg5clN1?=
 =?utf-8?B?TjBCSlE5WGplNzdJODhFRFJMbFdEL3NLYnU5ZXh2NUpxM3N2eWZKdnFxNGI3?=
 =?utf-8?B?Q1V0TXcwTm5EWjE3Q2s0bmMrS0xuWVptSkNBaHZteDdtaVkrb1Bqd1hlOVpv?=
 =?utf-8?B?d2NOSDZ6ZW9pSnA2Q05FT2lDTktQMVdDQTFWK1lSMWM4ZjRIVnI1bWdOSTlK?=
 =?utf-8?B?ZVg0MlpidElIOEN0U3ZOajh6aG9JaEpOb3NrT3YrNElrYk9JZGc5WGplR21u?=
 =?utf-8?B?eGVIVWR2YnJZOE5leFlVOGVKMWRhNWx0SklJVHY3Z3VzanRucGM2alRJcHhh?=
 =?utf-8?B?MG1TUWdyZGN1ZlVwNnl6TzMyNllGdDJuYmJyMFRxVVNHN0xMSGZGOTEzY2Rz?=
 =?utf-8?B?ek5xeHNwbUNya1VaV3BuekU4NnNmbXhCZUNya3F5a1EreVpXNEY2b1M5MWZt?=
 =?utf-8?B?T0J3UnBBZFF4cGx6MGNSbEdBejEwdHBkMk11R0h0cjUybUdNcEZEYlVuVXNF?=
 =?utf-8?Q?DzhewsPfHvXHdWRBTeiRMb/bZ8qaMqR9IEKBYOF4oY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2deaeb52-8dd0-4555-e515-08d9facef039
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:28:15.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1Ger5Sl7UQnWkg0KF+krRxmzPV7BRs+iRHJv8Q5O8P9WDz7Dz5HxQ6x9HgE6P/lLzPy0rmja0IbfdsrYAEm056yxRXhbMdoF31OrOjz2Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3124
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

On 2022-02-25 9:46 PM, Pierre-Louis Bossart wrote:
> 
>>
>>>> +    msg.ext.set_d0ix.wake = enable_pg;
>>>
>>> simplify the argument? Not sure anyone could understand what wake and
>>> enable_pg mean.
>>
>>
>> Well, CG and PG are popular shortcuts among Intel audio team and stand
>> for clock gating and power gating respectively. 'wake' is firmware
>> specific. I can provide a comment, but not all question are going to be
>> answered by it. Firmware specification is the place to find the answer
>> for most of these.
> 
> again please do not assume that anyone reviewing this code has access to
> the firmware specification.


Provided simple description for the SET_D0IX message.

>>
>>> int avs_ipc_set_d0ix(struct avs_dev *adev, bool wake, bool streaming)
>>>
>>>> +    msg.ext.set_d0ix.streaming = streaming;
>>>> +
>>>> +    request.header = msg.val;
>>>> +
>>>> +    ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
>>>> +    if (ret)
>>>> +        avs_ipc_err(adev, &request, "set d0ix", ret);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> diff --git a/sound/soc/intel/avs/messages.h
>>>> b/sound/soc/intel/avs/messages.h
>>>> index 1dabd1005327..bbdba4631b1f 100644
>>>> --- a/sound/soc/intel/avs/messages.h
>>>> +++ b/sound/soc/intel/avs/messages.h
>>>> @@ -101,6 +101,8 @@ enum avs_module_msg_type {
>>>>        AVS_MOD_LARGE_CONFIG_SET = 4,
>>>>        AVS_MOD_BIND = 5,
>>>>        AVS_MOD_UNBIND = 6,
>>>> +    AVS_MOD_SET_DX = 7,
>>>> +    AVS_MOD_SET_D0IX = 8,
>>>>        AVS_MOD_DELETE_INSTANCE = 11,
>>>>    };
>>>>    @@ -137,6 +139,11 @@ union avs_module_msg {
>>>>                    u32 dst_queue:3;
>>>>                    u32 src_queue:3;
>>>>                } bind_unbind;
>>>> +            struct {
>>>> +                /* cAVS < 2.0 */
>>>> +                u32 wake:1;
>>>> +                u32 streaming:1;
>>>
>>> you probably want to explain how a 'streaming' flag is set at the module
>>> level? One would think all modules connected in a pipeline would need to
>>> use the same flag value.
>>
>>
>> Some of the fields are confusing and I agree, but driver has to adhere
>> to FW expectations if it wants to be a working one. I would like to
>> avoid judging the firmware architecture here, regardless of how
>> confusing we think it is.
> 
> it's not about judging, just explaining what is expected on the firmware
> side and what the driver needs to do.


Dropped all the "cavs < 2.0" unclear comments.

>>
>> 'wake' and 'streaming' fields are part of SET_D0ix message is which part
>> of MODULE-type message interface. Base firmware is, from architecture
>> point of view, a module of type=0 (module_id) and instance id=0
>> (instance_id).
>>
>>>> +            } set_d0ix;
>>>>            } ext;
>>>>        };
>>>>    } __packed;
>>>> @@ -298,4 +305,13 @@ int avs_ipc_get_large_config(struct avs_dev
>>>> *adev, u16 module_id, u8 instance_id
>>>>                     u8 param_id, u8 *request_data, size_t request_size,
>>>>                     u8 **reply_data, size_t *reply_size);
>>>>    +/* DSP cores and domains power management messages */
>>>> +struct avs_dxstate_info {
>>>> +    u32 core_mask;
>>>> +    u32 dx_mask;
>>>
>>> what is the convention for D0 and D3 in the mask ? which one is 0 or 1?
>>>
>>> Is this also handled in a hierarchical way where only the bits set in
>>> core_mask matter?
>>
>>
>> Can provide a short kernel-doc for these two, sure.


Provided a short comments instead.
