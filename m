Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92F43305C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 10:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A8F016AE;
	Tue, 19 Oct 2021 10:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A8F016AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634630555;
	bh=2BCiNk+CVBs4SA49hMYpwkA5FwmEyjFeXlwwixcdzsE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGV1/ozjcl0KW/5Yx/3xXB7WQjrvOz8bEe5lD0zvLKOFSu3yTPxX1nF7DE3LcG/U7
	 4kwTuId8rdACRuPzlSqfbNURHXVWMtFvozqcwyeOgx0h6s3pV9y/oF/GmwgGYa6W4N
	 iexLR4lfBOz83g7A8il6n8jC1Mpopm28wK0tLqAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0707FF8026C;
	Tue, 19 Oct 2021 10:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 588B4F80256; Tue, 19 Oct 2021 10:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B64C4F80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 10:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64C4F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="vP7KFkbY"
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="225909722"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="225909722"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 01:01:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="661699794"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 19 Oct 2021 01:01:02 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 01:01:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 01:01:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 01:01:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 19 Oct 2021 01:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiqBsSRa9QT2OWxeyPww7wwpv5Z+Lg00tDJnBbQqSJKqKGjb5/Kx7tP2WzdTln6azFSahksCvmDkzN4Fvi2WMzNGdDIzVOkoaEQkN8oPNelJ4mMcS0droqo7J0lyWjn8ewuIlBGW5/I+HC1xENcoSuMddDUJngdPjDPl8J85Lg119kSq5Iwdnf9lBlGdZoYy67uTxHpr09/kYmRmzosTbiuG9WcHxRm9ivbmLTK3epK3E06m3VHR8VphuiIQwS7sIwenbakwO7JSsMAnIZyJv4F4ToIDaYg39zJrY+CLP66mhfqvCXMjESWTJhmx2BO6KYkUqMXbvPrHnB3GEEz8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31PQk4VCJrGRITpwUGBFaBUAHeqiz6D2xoCqaObUvVk=;
 b=MafwQk9VphOegTG93qe2bPtFKskaccPRuAKxuxi7NHwWbtalRxtGJEV3Pc+3cqpkruvmbxPaKsR+BChzenGVms5Nw0EjXqYum4NLAkhUgSZvJJ1XWTTlKBd8OU6iwN6DKtpfO1AVvImIJInmFsQJA2WRhgp5y/rRvRotJGOCBei/mh+8c0iewrkaMLIvh2wkZJds/EAluJlXsylFvLkwZ99XOZuz40xyg6dNtA/MfVPRb0JOFYnCGjI2ioHv3UNp+Xz2J6tnfPVfhWHud3xRfc+nnyrat6nv5Ls0piKNST8J427wxBTBzG3DicVPWxTWXlDOLxiwojPRGB4y/9mkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31PQk4VCJrGRITpwUGBFaBUAHeqiz6D2xoCqaObUvVk=;
 b=vP7KFkbYG4sv6sS6piKKJOvA3sGu8aRggoio5Vu2YCjkz7qgF1gXk5zO+lrSnwkP/uxrKubCJJg2fMyMM84b87hdlk/m8cBmnY1OY/y0Lg250hvUTGw+G2XB1rECBXC0V9uTFqoiV4A4shppkgodW+j2ny56S6BzaqlVNjpIcjw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN0PR11MB5727.namprd11.prod.outlook.com (2603:10b6:408:162::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 08:00:50 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 08:00:50 +0000
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <991d0129-a566-d078-9174-bccb55e49d01@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <272c5a9f-847d-14bd-f330-ec51781f2c42@intel.com>
Date: Tue, 19 Oct 2021 10:00:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <991d0129-a566-d078-9174-bccb55e49d01@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::20) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.110.142) by
 DB8P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 08:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abda4407-94a6-48c3-1bff-08d992d690f8
X-MS-TrafficTypeDiagnostic: BN0PR11MB5727:
X-Microsoft-Antispam-PRVS: <BN0PR11MB5727899103333639B1CAA791E3BD9@BN0PR11MB5727.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xGAgthSHOYbr7aQdWOLBUdVR/EUvRlbyugvAtKkUIP7dk6Ica4GpNIPlSgR7Y3fc6YzkkYIOKBNpXs/FKrbBtWi9JH/AUxo/UeCZFMq5F1BDy3AqUNRwmGA+yevqK1MSELdPCMW9VZS2XxXxpNzssCoSm0yv3EAdkc7QIx+eLHSHy6telm4LHAUae0xWaCi00EvsAYQeXgzCuV0dRzxhEY9cxAMr3XEJAvJpVC1hWrGe+wCscrmnZ0o5pkdv9EfsWmsIu5CVXAZe9M3TbgxSh+WMuS8eMXXrreygKnK38gSGriX/G62AsVV//wzkl2gzZwo3cMuVrBxwj/Ti1H0btiDf+jBTSySjOX5rRjh7VCih4CH/lTLB28e24tkGr+YK+BygVbYVPLPRVJDnRmP9NgXap2uOWgi3XJM/XQ1zPs8cMzwDmFSKZzcDTcsSzE2V4sTjOMKwTnuH/l1admUl7xJOW8IvZtRvX2yRlDBd1mlBOkkVb1Q0uQgb+K0J2bTnHUma8HHzb+boAUPCRshvBkZg4M8XPaVl6dis92o6nUR9ronFVXJuHOLzSad0sbW2KJLknsJ4pEaCrQJfV4Ax94p4G6kC0TRukHpmWdgsXpXKM+TGzN9COLm8/z3zASwp0gqnkP9ZKHiBKnTioc9TgFxHH20058qO7njp0MvrLX8LaE6tTqGntQ3S0aHWFid7pFiMNKTW0+XgO/VoKvfoKhevN+cZIbeoHsvTo91ntQaE5FryQDrz/p6n7oYgur1h6M5ZqlQUWPtvfeCVaYeVIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66556008)(54906003)(44832011)(4001150100001)(66946007)(86362001)(508600001)(2906002)(956004)(31696002)(8676002)(6486002)(2616005)(8936002)(4326008)(82960400001)(31686004)(16576012)(36756003)(26005)(38100700002)(83380400001)(316002)(53546011)(6666004)(5660300002)(186003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWYrMFNtOWxiVzREZFdsWGtjZjBUOEk5YVlySDVSdHFJYlhET0toejUwVUNH?=
 =?utf-8?B?MkpOeDVDZkdZRC9idEZXUng0WlRWTFdlQklHRkxPNWFuSngvcWU5SGtZUW9U?=
 =?utf-8?B?eVdqSWp3ajJNWlR1WFlvSnFNcm0rNmI0eUs4Skh6VnJVZjREWUp1T1pMNGg0?=
 =?utf-8?B?YklQRDFBeExFcHNUcy9NSG9CeEVKdndHRlVtUzN4TzM0cmt6dXNaY2xhL2sx?=
 =?utf-8?B?ZjJBZ1pvWDNSdWduTTFTcDhwTkh5WEc0RXNsaFZ6aGRuNklTOXg1bDFrQ2V6?=
 =?utf-8?B?N21jWTdOakNuRWhvV0NsT2ZnL1JEd1NrTlJSZjg2dFllcFVlTHB6ajNwaXli?=
 =?utf-8?B?clVmd3ZFZU9iVjZJdS8zVHhlRUZsbTZuRnlBRksyc0ErZWY4Y2w2emQveUpO?=
 =?utf-8?B?ZjBkMXVFMUZYazFiZTkvZ0dCenZIa28ydWJxOHJUZi9tRkhUc3pSUFFkUVBJ?=
 =?utf-8?B?Y1g1VDFRV1dXL1crYS9qSlcvVDV3bVpmWVp6Z1cvMXRPd3B4YWIrUWY5N2pS?=
 =?utf-8?B?KzRmQUo3ZTFhMUs5dXhETi9CMjdqTVVoNjNYRW10MDMrbVVGby9PWnZDRnpq?=
 =?utf-8?B?NFdBK3BlWS9kbmU5WFdGYU85SzNJd2FDcFZzbk9ac3FEaVJLOGVrRHRIaVUz?=
 =?utf-8?B?eUJENmtSOGlTU0hPbUhPUGlVVzEzWG5KcHpyQmRCNk9hUjR2RU5ZZVJHOFFY?=
 =?utf-8?B?andGa29yUmg0WUtvMjlVUFZXaE5xaWlGeXlZdC9hUW85dUJ5TUJOTDhkUk1U?=
 =?utf-8?B?ZUtjWkI3ZHNDNDA5Q3RKc3ZSTVd4Qzh1K0ZNZGtoSFYwMHhJUk9Lcit4dFJC?=
 =?utf-8?B?UnNvQkpaSk5scXRzYXdtQ3ZNaldBcWIrNWxkQUthSHFNblA3TFRzWmpGSlVt?=
 =?utf-8?B?cEdNTXZKTndGTFE0cVNqUmZQSTRoSWN5SEtwcmkwS1hQTDh6UjVJTXk5eEhk?=
 =?utf-8?B?WkIvWmNNUnlNZ2V0YnVPZ2ZwaC8rY2NsdjdDcWg2SG5ZMFFOK1pXVGEzZFNK?=
 =?utf-8?B?WGEybFFOVlc5MlMxbVBXN09CTkgxUzdKTE1Gd1d3Q0xBVk50TXdvRU1Sc0dG?=
 =?utf-8?B?bFdVVW1vNTc5Ty9Mclk5N25vak90YkNzZDlINnBRU0prTlZlcStHa0RxVHpL?=
 =?utf-8?B?dnA1WVBNQUJURmZMSFlMWXpXWFEwV1AwendDbnJpSnA2b1BPMU5YV291NTIy?=
 =?utf-8?B?QU1yaEdpM2MzWE05aG5BNXdGWG5uTXBUa09CYy85RFAyRC9zbTB1cXBJanE4?=
 =?utf-8?B?VlFEeXpSdGgvWXFLc29GQllYRDZ6OS9SQVpaM25QTDlLSzRkaWVJMjNwZURG?=
 =?utf-8?B?QkVaM1FGWnJmeHJ2RG16emhVWVhHQ1BnRE9zUGFtSXpNc01JR1gxZmMrT04y?=
 =?utf-8?B?T2lTQXpVcm9zaEpkUG9LYlNsdWdSSGsyeDJ1YnBYc1NFblFxdnhZc25PSTFw?=
 =?utf-8?B?QnhVdjhaN2FuSVFTL3Z6eVNXMFhucm9pZkN3TEgyQlc2blFsem1mMkZaOENJ?=
 =?utf-8?B?Q1J6Z0xzcWY5a1hpdEk5eDY5aG9yMVpwMUEvaHlEa1pOR0Q3WW1JWm9ieGc1?=
 =?utf-8?B?OTJWcTFxUk11S3NlVFVxR09oRzN6Yk1Kbm1KdDZ2c0tpcVduVFNDWTRlcVVH?=
 =?utf-8?B?dXNVZlhWYkZ1SUVUTHMzMFhQbnFFUGNyUGRsN0FFY0h3OVRxYTA2anFieDhu?=
 =?utf-8?B?aGxLcVZ0TG5kKzNVb0ZXTDJ0b1BWejEzU05saUV2NUxpSDRZdHpaOUVHbUVx?=
 =?utf-8?Q?UWRoyFuFBr78BlzmbSesUffZ6AMxEKsKkLrl3oI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abda4407-94a6-48c3-1bff-08d992d690f8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 08:00:50.3810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gF5AfaTfdZ1PvOji5ZZayKy+ioscFcICAEK3ITGLlQOqKRVKtoR0HmUMjWHq1X2VqnVexJP7mLJTnoF+aIjFJVDUlJK3rLBk0e6ogTl2/A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5727
X-OriginatorOrg: intel.com
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org
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

On 2021-10-18 11:18 PM, Pierre-Louis Bossart wrote:
> On 10/18/21 2:21 PM, Cezary Rojewski wrote:
>> HDAudio-extended bus initialization parts are scattered throughout Intel
>> ADSP drivers code. Gather them up in snd_hda_ext_bus_init() to provide
>> unified initialization point.
> 
> What unification are we talking about?
> 
> The code for HDaudio differs a great deal between the two Intel drivers,
> and specifically the 'nocodec' mode in SOF does not rely on this
> library, so there's no burning desire on my side to add this dependency
> when we carefully tried to avoid it to use the DMA parts only.
> 
> I would add we recently looked at the code and the coupling/decoupling
> in this library seems questionable if not broken.
> 
> edit: this patch also seems to add a layer of indirection through a
> 'core' layer, not sure where this is going at all. I must be missing
> something.
> 
> CC: Ranjani and Kai.
> 

Thanks for the comments!

Pretty sure you overestimated the goal of this patch, though. In both 
skylake and sof -drivers various bus->xxx and bus->core.xxx fields are 
scattered and initialized with basically the exact same values. These 
values more often than not even match the sound/pci/hda ones. The 
ultimate goal is probably to extract similar parts and move them to 
snd_hdac_bus_init() or some other wrapper. For now, 'ext-bus' is being 
addressed.

Patch would have 'greater' effect if not for the fact that sof-intel-hda 
code conditionally initializes several fields for the reasons unknown to 
me. So, instead of just removing those assignments, preproccesor 
directive is used instead.


...

>>   /**
>> - * snd_hdac_ext_bus_init - initialize a HD-audio extended bus
>> + * snd_hda_ext_bus_init - initialize a HD-audio extended bus
>>    * @bus: the pointer to HDAC bus object
>>    * @dev: device pointer
>>    * @ops: bus verb operators
>> @@ -26,28 +28,37 @@ MODULE_LICENSE("GPL v2");
>>    *
>>    * Returns 0 if successful, or a negative error code.
>>    */
>> -int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
>> -			const struct hdac_bus_ops *ops,
>> -			const struct hdac_ext_bus_ops *ext_ops)
>> +int snd_hda_ext_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
>> +			 const struct hdac_bus_ops *ops,
>> +			 const struct hdac_ext_bus_ops *ext_ops,
>> +			 const char *model)
> 
> missing kernel doc update?
> 

Ack.

...

>> @@ -53,24 +54,25 @@ static const struct hdac_bus_ops bus_core_ops = {
>>   /*
>>    * This can be used for both with/without hda link support.
>>    */
>> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev)
>> +void sof_hda_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
>> +		      const char *model)
>>   {
>>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>> -	snd_hdac_ext_bus_init(bus, dev, &bus_core_ops, sof_hda_ext_ops);
>> +	snd_hda_ext_bus_init(bus, pdev, &bus_core_ops, sof_hda_ext_ops, model);
>>   #else /* CONFIG_SND_SOC_SOF_HDA */
>>   	memset(bus, 0, sizeof(*bus));
>> -	bus->dev = dev;
>> +	bus->core.dev = &pdev->dev;
>>   
>> -	INIT_LIST_HEAD(&bus->stream_list);
>> +	INIT_LIST_HEAD(&bus->core.stream_list);
>>   
>> -	bus->irq = -1;
>> +	bus->core.irq = -1;
>>   
>>   	/*
>>   	 * There is only one HDA bus atm. keep the index as 0.
>>   	 * Need to fix when there are more than one HDA bus.
>>   	 */
>> -	bus->idx = 0;
>> +	bus->core.idx = 0;
> 
> why is this level of indirection through 'core' needed in this code
> which doesn't use the hdaudio-ext library?
> 
> the changes here have nothing to do with snd_hda_ext_bus_init()?
> 

I don't understand the comment. First argument in parameter-list for 
function sof_hda_bus_init() has its type changed from 'struct hdac_bus 
*' to 'struct hda_bus *'. Without updating those assignments, code 
wouldn't compile with CONFIG_SND_SOC_SOF_HDA disabled.

>> -	spin_lock_init(&bus->reg_lock);
>> +	spin_lock_init(&bus->core.reg_lock);
> 
> same, we've just added reg_lock everywhere, why use a different one
> 

It's not a different one, it's exactly the same one : )

>>   #endif /* CONFIG_SND_SOC_SOF_HDA */
>>   }
>> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
>> index fbc2421c77f8..03a68d286c7c 100644
>> --- a/sound/soc/sof/intel/hda.c
>> +++ b/sound/soc/sof/intel/hda.c
>> @@ -609,8 +609,9 @@ static int hda_init(struct snd_sof_dev *sdev)
>>   	bus = sof_to_bus(sdev);
>>   
>>   	/* HDA bus init */
>> -	sof_hda_bus_init(bus, &pci->dev);
>> +	sof_hda_bus_init(hbus, pci, hda_model);
>>   
>> +#if !IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>>   	bus->use_posbuf = 1;
>>   	bus->bdl_pos_adj = 0;
>>   	bus->sync_write = 1;
>> @@ -619,7 +620,7 @@ static int hda_init(struct snd_sof_dev *sdev)
>>   	hbus->pci = pci;
>>   	hbus->mixer_assigned = -1;
>>   	hbus->modelname = hda_model;
>> -
> 
> spurious line change
> 
>> +#endif

Well, I've just inserted #endif in place of this newline. No problem 
with appending additional Enter if that's what you prefer.


Czarek
