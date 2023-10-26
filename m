Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7712D7D8030
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 12:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4601E7;
	Thu, 26 Oct 2023 12:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698314575;
	bh=JJSx6sMRFN6KKhzi8omt+8DOMlR5c1B8yvtLrmp2K10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AhA4O2D57hzjMcgJ5f3+/M8dggQsrII+as6i5ZVDp2z//08yKU6HLw0Eu9S2J3uyu
	 iBh6Wy0/h2HUNC19VxpORAh17BMc3Q55ir3zn5qcsAFlpQVIEyhpDwbMI7Glh2S6vG
	 shU1/wGncaQ954MMNVwRAgS6R7e+WbW7rg3j/d4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58B6DF80152; Thu, 26 Oct 2023 12:02:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04595F80165;
	Thu, 26 Oct 2023 12:02:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13680F8019B; Thu, 26 Oct 2023 12:02:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F379F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 12:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F379F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mFKYkjA0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk5bWxeXtRpv5lWvnn/fwqrIl7B35ezM8lNJLDtJMLUdfhLQJ+T9RvvZEqHJ0+Blf47C4QPkAdBZC+5yb9Xp0DYR5HwNFmQFepPMTXBbTjhRxj6aMV1EVP92wbQkwBa2Z328rXrug4eOF7VpP4LGske/qAFobPwrDbWFu4Zt/J3eaJc1Lk3WakGEwIG2j63+0SuiDZ5vaQb9Q5eEvZ84sAD85ZH+sKAd3Pkshjqj3a8nTob2uEGPbWF/ue7sZfSwgYPswREpg4oA+M5bBi6ob8b0LRrCOySDzoflzwChNRd/bi6lv2ux5HKbLcXEQc4ShHoHUlOspCHt56av8KWkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aY14jYFCRD/qCGDqC/h/2lI1QH4VmxMN9gtAlwUnugQ=;
 b=VZ1zq4xgXfi3ye2M5rHDaBPjkZlmIYAQVwBygyISIRi2XCRE4OihCDiVlMvAZZZqbB/UEd47deFSdPW1eLlBn7iQ4pACmIE8Pi9CtuyD2etZpNfr+h85IItXx+oUyCDVnpePc34M2oh9yj1UVsDbtXxaKFHg5xeQg2d3ZAHMaTYwmaK10kJidKoOncCTg2dGwAs0+Kikj3YxG+9gTCY5mlKqksqFMCHXzqoMsEt4JitdcHOznbi8iraY4WFVzO54u3dQmC+UHOIWjzDdZiOZ1k1l7ScTt3QcJGK1rnO+7Sd/qQtLIuFDgixOqmqMChhfM6ZYY7Z9a1qLhAv+1+RLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY14jYFCRD/qCGDqC/h/2lI1QH4VmxMN9gtAlwUnugQ=;
 b=mFKYkjA0g2sR6kWU+WAdKk2ZGn7UAx5+AmBTz/uiT0959cDuHIjoaZGAdCdvYdqJUG5kYyJIZaNzbbXEJh082hkr+S9gRsgDW4S/7aY+x0U/mZRA4l7F+MQl3A0tNkJxG/6Lo72bneZCVJrwKX8Qvdx/53sWLrD27qE1MSy3j+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 10:01:43 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79%4]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 10:01:43 +0000
Message-ID: <af1a7eff-bc5e-43a9-99c0-9f26a546f537@amd.com>
Date: Thu, 26 Oct 2023 15:31:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] ASoC: amd: acp: refactor acp i2s clock generation
 code
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
 mastan.katragadda@amd.com, juan.martinez@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <20231021145110.478744-2-Syed.SabaKareem@amd.com>
 <b3be3317-218a-48fd-907a-287bdcbec66f@linux.intel.com>
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <b3be3317-218a-48fd-907a-287bdcbec66f@linux.intel.com>
X-ClientProxiedBy: BM1P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::14) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|CY5PR12MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: f97a27fc-5920-46bb-0efd-08dbd60a8e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j4/le2ZJ3+r6K3WVR8GmChjM5NXkACh1gxYTTXuXb6zcinhiGUW9YolVcCIt92bSm37YCqE1b4BI7HTxM3YiQxT249+xeUDYXtLpPumxLeKJJ7dSfHF2igoz5ojMFbzjTrcYeTdpaY/ey0rSVXm02OhDp8EOhrDnKUlCcT7bV68r8UekEEAr8jAxR++bSTqXEy8RuwlFnNjs9w26sSUCacfYS+xScflWSI1BomFDPlX8S8UILx5fiN8P/HycP2Tsa9rcA5gL46c+ayimMRuZ4Iw/Zd2JKfKqitvVR+vR4/ldCW41jR9jf5atQ1mV4GAKmA4shPiHWLipKDY9Rv56bY7lJieIcPOtj+Glqz5XnzA39sAezNEqg44e41JIx+lRvu8kwmhXGa0Hls0c6SKJymlQzniERhYy2L+ATijjvdlqOG+0Kx50n4jnYe70ZWrmYqFbt03cSHVPp/+AuwP4a75dPuaOuPUYxRR6EvOi00nrbEnBWGPc+HaD/5cU5cTL+HBeOchuzPvgDPqqMgV/ZbF98PO4gC1IzhpQ8Yp0Zzk1OW/grADV8n0a7QoJX1v8wxPmqAZwJsXhNK+8OR7i7J77pqKoAwG1NBy2oYSFWNaFAWcHMl9+5Zh95JQKMpyK/cDldZ7KKpN/St3BFYapYabMzMnVBPrNovBcmmuTGgrnQO06cYVKV/o6/o+bweE3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(66476007)(2906002)(38100700002)(31696002)(66946007)(316002)(66556008)(6666004)(6506007)(110136005)(33964004)(478600001)(2616005)(6512007)(6486002)(53546011)(83380400001)(54906003)(5660300002)(41300700001)(8676002)(4326008)(36756003)(8936002)(26005)(31686004)(43740500002)(45980500001)(19627285001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NU1Ram9xVjd4eXkzZ1pwS1ZFMTIrbWQ3L2NOdDJ6R0VwS1VtYVFQUXdPd3JE?=
 =?utf-8?B?N0JOUFoyUzYxQ1YvYWlhNXRveFlJdDZhSGtkOHhKaCt5c29QREtTWmQyVzc3?=
 =?utf-8?B?ait3OGpNMGdhL0ZVWEhvWWVqNXQ0NkJmb2QzNkRSczVyWDgzeUdidEJ1V0Fp?=
 =?utf-8?B?TFE1bU83SVhQQWNGWjl3K0dVNXZWMmYyNUIrYjFYaXZHOGd1VWpRVVRwbk5S?=
 =?utf-8?B?QlR5YUdvNXozbmhKazUwL3ZWVXhsdzg1dXI4dDdhRGo0eDBXN0hkb3NaNHcv?=
 =?utf-8?B?VHVpZGhnNVhvb1NzNmxKMFhJczRwUUVkaTJTNFMvZjhrMWZVbkR1bVE4ZUpH?=
 =?utf-8?B?ZE94NGxiYjUxa05GVVZuRzFHTWRtRE1PdktPNzZ0R0NIMi9VSTlubzV4SFBV?=
 =?utf-8?B?bGJEUzRWY05sWHVZamU5bG9sMEV6N0tUK2syZ2UvSThtVGNqeC9IWWdQL1Zk?=
 =?utf-8?B?UkRZOURYUk81QmttQnVzQUVNbEdPTUpqZUZhVmJXazBqQ0VVWENuMGNPVFIz?=
 =?utf-8?B?bUZJYXFEL2g3djFFYUhXSzJ1YWFLUGU5VmRSN2lCQVJwcWdqbVpCSHZmYzFQ?=
 =?utf-8?B?N2grbVhtSmxmc0pkY2pSZTBnYWN1Z2RGVjVQbE53SlZRZC9YL3BJSlNQZGwx?=
 =?utf-8?B?bXd4dzdtK3pvUGN6MFMyeXZjQmRSakFJUTV5YmkrVW52SGdNMkZVK1l4TlVu?=
 =?utf-8?B?TklWZzB3cG1yZkdCMUJCNDUyTDNQemNVbFVaRzFpcWJSL0I0em44bkNuUDFM?=
 =?utf-8?B?SG41K3ZFczAwUTkvSEFjTzAzWkt1eno4TjVLSXNpa3F4TUpKUXB2SmJuVUdx?=
 =?utf-8?B?ZXZKVkdoODlQSTdVMHVta3BaQzY5ZlZ0VVF5c05iQUdPNmVXT292cGZQVlgy?=
 =?utf-8?B?WC9ka2M1ZVVJTHpxeStkVm1RSWdkQktrMDFIeVVWeFN1K1lZamJRN1BqYU50?=
 =?utf-8?B?Mmh6eEtiMGJhNkVBRDVMeE5jdUI3ckNrNzI4RFNyUUZPdjErcWd4UG0rMzQx?=
 =?utf-8?B?V2JFZ2xrdTFPRU9sV0Z6WXZkRklkQWVrSXZGZHk5SlBCY0d5SWd4eEFEVUpl?=
 =?utf-8?B?cm9rT0pQVVBsUSt3VVBPRVNuay9HWnd6dGxyb3FlMTB6dVZWb1hZczRMU1FT?=
 =?utf-8?B?OXI1VU45TUNIVGoyWXNoVjZ2NUh5empPekhMandjc0UvN3MvNFJKamFKSFpY?=
 =?utf-8?B?VWhWVTBKY0QwaEJZMTVMS2E4bXBnVHh2Z1pCOVlTamM0L09SeWx3cUNUNkJP?=
 =?utf-8?B?OE5mOHVwK3JXTE0wczcwK3F2N2t3YWM2ODh3MVRZVHB2S2E3cWVHSCtDTGRp?=
 =?utf-8?B?YWdXYUhYQVhSSVFJU3ErOEFma2hpUEErMHlROUErMWFFVG9qSmpnWGtlaDBL?=
 =?utf-8?B?L3dWZWRlV1B0SE41eExLZWZ2c2F1U2Nmc3JQSEYwZkh3SGZMMG1YZXpqclFK?=
 =?utf-8?B?WjJlZW5LaXp3Q2tCaHArRElJUUdjQVZza2hucUxsL09QQ2VScitLb1RQbXRt?=
 =?utf-8?B?b1FwS0RKdjAraDRGcHdieTg3b00vYzJzekZ5K3JCcEhZWElOVkpJeVAxTjlv?=
 =?utf-8?B?VDdoL0p2V2xaZENPSkFFMkgxU3ZHaTVKTmJhRHZSZTgrRExZOXIvTGV6V0Nx?=
 =?utf-8?B?cDJGWmdDZjlVeW83cHRYbWZRR2JRS2VjeUk5SVVMM0VRdWUxZmlpWTQ2NGFF?=
 =?utf-8?B?L0RMMGlTU1JFUXVSZW9JVVovQmsrZ2dDMVJBelh3d09tWHNwYkdtd2RZNk9U?=
 =?utf-8?B?WTBHK2E2bXk1THBqRjcxMENvc0RwYUw0c0ZGZVFjbzNReWxRZXVWcXFnaFJT?=
 =?utf-8?B?UGk5Qmt4QmpJWmx3d05TV1VRS2lab1Yzb3BTSU52THFuR0FvME0zYnZCd2U2?=
 =?utf-8?B?TmhFSTBxbzlLdnVMYWQxSTZmaER1VlZRQy9nQUI1c1pOS1JsU3RoVENRR094?=
 =?utf-8?B?bk0vM3ZVakEyNUowSmhhOGNZejNOeFJMWksxMS8wRFlLYzZQRktUVXg3VVFR?=
 =?utf-8?B?ei8rRFhyeXJ3MXMwUXV2LzdGZ1NRbWtUTytaY1VQYm41Q2VWcGVxcmtETXZW?=
 =?utf-8?B?N1pHQ1I4WlhNZ0lCQzVQZmhLM3V6UGVzSEtOWlNlT3dxVHlQbHluREZ0L25Z?=
 =?utf-8?Q?pv+MhTCwMY+FtlsgNDqGvxPPV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f97a27fc-5920-46bb-0efd-08dbd60a8e4c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 10:01:42.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pBbcbjcaln6EoIkqFoAOocjz3dYTbUq9OAlFvawZr5bcpwR5ew1AvCMDBOHNpRXjNs7wsoMNNIRdLhyqrDL8Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405
Message-ID-Hash: HWP6K4SR5Z4TLDTDXRQRFA3VQNBZRCJ6
X-Message-ID-Hash: HWP6K4SR5Z4TLDTDXRQRFA3VQNBZRCJ6
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWP6K4SR5Z4TLDTDXRQRFA3VQNBZRCJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAxMC8yMy8yMyAxMzowNywgQW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6DQo+IE9uIDEw
LzIxLzIwMjMgNDo1MCBQTSwgU3llZCBTYWJhIEthcmVlbSB3cm90ZToNCj4+IFJlZmFjdG9yIGFj
cCBpMnMgTFJDTEssQkNMSyBnZW5lcmF0aW9uIGNvZGUgYW5kIG1vdmUgdG8gY29tbW5vbiBmaWxl
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFN5ZWQgU2FiYSBLYXJlZW0gPFN5ZWQuU2FiYUthcmVl
bUBhbWQuY29tPg0KPj4gLS0tDQo+PiDCoCBzb3VuZC9zb2MvYW1kL2FjcC9hY3AtaTJzLmMgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IMKgIHNvdW5kL3NvYy9hbWQvYWNw
L2FtZC5owqDCoMKgwqAgfCAzOSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYW1kL2FjcC9hY3AtaTJzLmMgYi9zb3Vu
ZC9zb2MvYW1kL2FjcC9hY3AtaTJzLmMNCj4+IGluZGV4IGRmMzUwMDE0OTY2YS4uNTlkM2E0OTk3
NzFhIDEwMDY0NA0KPj4gLS0tIGEvc291bmQvc29jL2FtZC9hY3AvYWNwLWkycy5jDQo+PiArKysg
Yi9zb3VuZC9zb2MvYW1kL2FjcC9hY3AtaTJzLmMNCj4+IEBAIC0yMCwxMCArMjAsNDIgQEANCj4+
IMKgICNpbmNsdWRlIDxzb3VuZC9zb2MuaD4NCj4+IMKgICNpbmNsdWRlIDxzb3VuZC9zb2MtZGFp
Lmg+DQo+PiDCoCAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4NCj4+ICsjaW5jbHVkZSA8
bGludXgvYml0ZmllbGQuaD4NCj4+IMKgIMKgICNpbmNsdWRlICJhbWQuaCINCj4+IMKgIMKgICNk
ZWZpbmUgRFJWX05BTUUgImFjcF9pMnNfcGxheWNhcCINCj4+ICsjZGVmaW5lwqDCoMKgIEkyU19N
QVNURVJfTU9ERV9FTkFCTEXCoMKgwqDCoMKgwqDCoCAxDQo+PiArI2RlZmluZcKgwqDCoCBJMlNf
TU9ERV9FTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDANCj4+ICsjZGVmaW5lwqDCoMKgIEky
U19GT1JNQVRfTU9ERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VOTUFTSygxLCAxKQ0KPj4gKyNk
ZWZpbmXCoMKgwqAgTFJDTEtfRElWX0ZJRUxEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5NQVNL
KDEwLCAyKQ0KPj4gKyNkZWZpbmXCoMKgwqAgQkNMS19ESVZfRklFTETCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEdFTk1BU0soMjMsIDExKQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhY3Bf
c2V0X2kyc19jbGsoc3RydWN0IGFjcF9kZXZfZGF0YSAqYWRhdGEsIGludCANCj4+IGRhaV9pZCkN
Cj4+ICt7DQo+PiArwqDCoMKgIHUzMiBpMnNfY2xrX3JlZywgdmFsOw0KPj4gKw0KPj4gK8KgwqDC
oCBzd2l0Y2ggKGRhaV9pZCkgew0KPj4gK8KgwqDCoCBjYXNlIEkyU19TUF9JTlNUQU5DRToNCj4+
ICvCoMKgwqDCoMKgwqDCoCBpMnNfY2xrX3JlZyA9IEFDUF9JMlNURE0wX01TVFJDTEtHRU47DQo+
PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiArwqDCoMKgIGNhc2UgSTJTX0JUX0lOU1RBTkNF
Og0KPj4gK8KgwqDCoMKgwqDCoMKgIGkyc19jbGtfcmVnID0gQUNQX0kyU1RETTFfTVNUUkNMS0dF
TjsNCj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqAgY2FzZSBJMlNfSFNfSU5T
VEFOQ0U6DQo+PiArwqDCoMKgwqDCoMKgwqAgaTJzX2Nsa19yZWcgPSBBQ1BfSTJTVERNMl9NU1RS
Q0xLR0VOOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4gK8KgwqDCoCBkZWZhdWx0Og0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGkyc19jbGtfcmVnID0gQUNQX0kyU1RETTBfTVNUUkNMS0dFTjsN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqAgfQ0KPj4gKw0KPj4gK8KgwqDC
oCB2YWzCoCA9IEkyU19NQVNURVJfTU9ERV9FTkFCTEU7DQo+PiArwqDCoMKgIHZhbCB8PSBJMlNf
TU9ERV9FTkFCTEUgJiBCSVQoMSk7DQo+DQo+IFRoZXJlIGlzIEkyU19GT1JNQVRfTU9ERSBkZWZp
bmUsIHlvdSBwcm9iYWJseSB3YW50IHRvIHVzZSBpdCBpbnN0ZWFkIA0KPiBvZiBCSVQoMSksIHNv
IHRoZXJlIGlzIG5vICJtYWdpYyBudW1iZXIiIG1hc2s/DQo+DQpUaGlzIGhhcyB0byBiZSBjb3Jy
ZWN0ZWQuDQpGb3IgVERNIG1vZGUgY2FzZSAsIGJpdCBwb3NpdGlvbiAxIHNob3VsZCBiZSBzZXQu
DQogwqDCoMKgIGlmIChhZGF0YS0+dGRtX21vZGUpDQrigIPigIPCoMKgwqAgdmFsIHw9IEJJVCgx
KTsNCg0KSTJTX01PREVfRU5BQkxFICwgSTJTX0ZPUk1BVF9NT0RFIG1hY3JvcyBjYW4gYmUgZHJv
cHBlZC4NCldpbGwgcHVzaCB0aGUgY2hhbmdlcyBhcyBhbiBpbmNyZW1lbnRhbCBwYXRjaC4NCg0K
DQo+PiArwqDCoMKgIHZhbCB8PSBGSUVMRF9QUkVQKExSQ0xLX0RJVl9GSUVMRCwgYWRhdGEtPmxy
Y2xrX2Rpdik7DQo+PiArwqDCoMKgIHZhbCB8PSBGSUVMRF9QUkVQKEJDTEtfRElWX0ZJRUxELCBh
ZGF0YS0+YmNsa19kaXYpOw0KPj4gK8KgwqDCoCB3cml0ZWwodmFsLCBhZGF0YS0+YWNwX2Jhc2Ug
KyBpMnNfY2xrX3JlZyk7DQo+PiArfQ0KPj4gwqAgwqAgc3RhdGljIGludCBhY3BfaTJzX3NldF9m
bXQoc3RydWN0IHNuZF9zb2NfZGFpICpjcHVfZGFpLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZtdCkNCj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
YW1kL2FjcC9hbWQuaCBiL3NvdW5kL3NvYy9hbWQvYWNwL2FtZC5oDQo+PiBpbmRleCA0ODdlZWZh
NTk4NWYuLjg3ZDFlMWY3ZDZiNiAxMDA2NDQNCj4+IC0tLSBhL3NvdW5kL3NvYy9hbWQvYWNwL2Ft
ZC5oDQo+PiArKysgYi9zb3VuZC9zb2MvYW1kL2FjcC9hbWQuaA0KPj4gQEAgLTE4OCwxNyArMTg4
LDYgQEAgc3RydWN0IGFjcF9kZXZfZGF0YSB7DQo+PiDCoMKgwqDCoMKgIHUzMiB4ZmVyX3J4X3Jl
c29sdXRpb25bM107DQo+PiDCoCB9Ow0KPj4gwqAgLXVuaW9uIGFjcF9pMnN0ZG1fbXN0cmNsa2dl
biB7DQo+PiAtwqDCoMKgIHN0cnVjdCB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgdTMyIGkyc3RkbV9t
YXN0ZXJfbW9kZSA6IDE7DQo+PiAtwqDCoMKgwqDCoMKgwqAgdTMyIGkyc3RkbV9mb3JtYXRfbW9k
ZSA6IDE7DQo+PiAtwqDCoMKgwqDCoMKgwqAgdTMyIGkyc3RkbV9scmNsa19kaXZfdmFsIDogOTsN
Cj4+IC3CoMKgwqDCoMKgwqDCoCB1MzIgaTJzdGRtX2JjbGtfZGl2X3ZhbCA6IDExOw0KPj4gLcKg
wqDCoMKgwqDCoMKgIHUzMjoxMDsNCj4+IC3CoMKgwqAgfSBiaXRmaWVsZHMsIGJpdHM7DQo+PiAt
wqDCoMKgIHUzMsKgIHUzMl9hbGw7DQo+PiAtfTsNCj4+IC0NCj4+IMKgIGV4dGVybiBjb25zdCBz
dHJ1Y3Qgc25kX3NvY19kYWlfb3BzIGFzb2NfYWNwX2NwdV9kYWlfb3BzOw0KPj4gwqAgZXh0ZXJu
IGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9vcHMgYWNwX2RtaWNfZGFpX29wczsNCj4+IMKgIEBA
IC0yNzYsMzIgKzI2NSw0IEBAIHN0YXRpYyBpbmxpbmUgdTY0IGFjcF9nZXRfYnl0ZV9jb3VudChz
dHJ1Y3QgDQo+PiBhY3BfZGV2X2RhdGEgKmFkYXRhLCBpbnQgZGFpX2lkLCBpbnQNCj4+IMKgIFBP
SU5URVJfUkVUVVJOX0JZVEVTOg0KPj4gwqDCoMKgwqDCoCByZXR1cm4gYnl0ZV9jb3VudDsNCj4+
IMKgIH0NCj4+IC0NCj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgYWNwX3NldF9pMnNfY2xrKHN0cnVj
dCBhY3BfZGV2X2RhdGEgKmFkYXRhLCBpbnQgDQo+PiBkYWlfaWQpDQo+PiAtew0KPj4gLcKgwqDC
oCB1bmlvbiBhY3BfaTJzdGRtX21zdHJjbGtnZW4gbWNsa2dlbjsNCj4+IC3CoMKgwqAgdTMyIG1h
c3Rlcl9yZWc7DQo+PiAtDQo+PiAtwqDCoMKgIHN3aXRjaCAoZGFpX2lkKSB7DQo+PiAtwqDCoMKg
IGNhc2UgSTJTX1NQX0lOU1RBTkNFOg0KPj4gLcKgwqDCoMKgwqDCoMKgIG1hc3Rlcl9yZWcgPSBB
Q1BfSTJTVERNMF9NU1RSQ0xLR0VOOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4gLcKg
wqDCoCBjYXNlIEkyU19CVF9JTlNUQU5DRToNCj4+IC3CoMKgwqDCoMKgwqDCoCBtYXN0ZXJfcmVn
ID0gQUNQX0kyU1RETTFfTVNUUkNMS0dFTjsNCj4+IC3CoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+
IC3CoMKgwqAgY2FzZSBJMlNfSFNfSU5TVEFOQ0U6DQo+PiAtwqDCoMKgwqDCoMKgwqAgbWFzdGVy
X3JlZyA9IEFDUF9JMlNURE0yX01TVFJDTEtHRU47DQo+PiAtwqDCoMKgwqDCoMKgwqAgYnJlYWs7
DQo+PiAtwqDCoMKgIGRlZmF1bHQ6DQo+PiAtwqDCoMKgwqDCoMKgwqAgbWFzdGVyX3JlZyA9IEFD
UF9JMlNURE0wX01TVFJDTEtHRU47DQo+PiAtwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiAtwqDC
oMKgIH0NCj4+IC0NCj4+IC3CoMKgwqAgbWNsa2dlbi5iaXRzLmkyc3RkbV9tYXN0ZXJfbW9kZSA9
IDB4MTsNCj4+IC3CoMKgwqAgbWNsa2dlbi5iaXRzLmkyc3RkbV9mb3JtYXRfbW9kZSA9IDB4MDA7
DQo+PiAtDQo+PiAtwqDCoMKgIG1jbGtnZW4uYml0cy5pMnN0ZG1fYmNsa19kaXZfdmFsID0gYWRh
dGEtPmJjbGtfZGl2Ow0KPj4gLcKgwqDCoCBtY2xrZ2VuLmJpdHMuaTJzdGRtX2xyY2xrX2Rpdl92
YWwgPSBhZGF0YS0+bHJjbGtfZGl2Ow0KPj4gLcKgwqDCoCB3cml0ZWwobWNsa2dlbi51MzJfYWxs
LCBhZGF0YS0+YWNwX2Jhc2UgKyBtYXN0ZXJfcmVnKTsNCj4+IC19DQo+PiDCoCAjZW5kaWYNCj4=
