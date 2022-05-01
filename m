Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686CC5163DD
	for <lists+alsa-devel@lfdr.de>; Sun,  1 May 2022 12:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086511ED;
	Sun,  1 May 2022 12:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086511ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651402173;
	bh=v8NCP4zy1WALaVP8s/5VL2OvftRfdUE4hQGXX/gofYE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d7vYBHJEyHtay+f5jU4tpx9fqeDD1oKqg1dKssMFfXmHFLbTGGu4PdOVHjtVcMTId
	 Mn0x7DEbt2ghpTl51rWBvgSHdbADz+HzDdH+EXmyxj+xqyU6A6u5a0Wn0CCuiQGKid
	 i6dTNOM+7TU5QasluhthBocNuF06kRkKjdIciZY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B1BF8015B;
	Sun,  1 May 2022 12:48:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 609C7F80137; Sun,  1 May 2022 12:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF6EDF80124
 for <alsa-devel@alsa-project.org>; Sun,  1 May 2022 12:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF6EDF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SbP4PcrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651402109; x=1682938109;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v8NCP4zy1WALaVP8s/5VL2OvftRfdUE4hQGXX/gofYE=;
 b=SbP4PcrPyfLX2gJpGVYdnFO5OYHOKtxUiB1h5kiQUy5/ZnehbNqLwhpY
 o7c1ktTtd48fOG3O+2v+J90ie02I+XlvI5KvPxe/XVd2DKgMI7UfBkWLb
 2WBM1QUaQCNjcC65HJcZ48tsw6ss1fDfZ6qezFHbGqX7uWDfxfwQZXy5t
 VYQSHgkqBXvo7+l7boV1oEInbVdvpFnle1iu8hHQ1Y5m6EuWli9jRd8eE
 m7DxfBZZE2f+rdRjbMWrT+ApjMOEXj1PXa6KHpmlt0xyb8x8pNp0Vdd7W
 EAY61Aih1wB/AlAPv+dwl2UBcTNOHglf98LrZgjnMNuoOz4li8MVgn+Dh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="247548800"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="247548800"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 03:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="566789163"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 01 May 2022 03:48:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 03:48:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 03:48:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 1 May 2022 03:48:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 1 May 2022 03:48:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt2hLWAWr/WjQrcX5EGET16qkydL4SipI/RQIRXHCQOcWnNHeDb0YLhmVGxaIdi7ywKS/MJvTTE01RwQf7E3vw/Ibb6TSySddrW7Y6S8IpaBGHc7TjiBNuTzW4Nq/tHxSgBpB+N9owrlE+f2kSS7NeSFW0fKyVoF4azXM7uM3oGH7NLpeqddYe6DzBjuePrEqLj0HAd4WfmnKPt4AVN9wYEiLzXWdYBIk7kLsYT9U3XnBFIpwVL65nenJ1hSpp3uyWI/An4tY4aY7yI9m1zoFnPY+P1WoMBUuLLTxC30+kAaiMq2TeZElL3cGCksC1GZ5HUxSNXk34GvIUWvWAp3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V3IyNPfD38wUT9GvW0+4QXCBM+nKW/XikrMVCn0TLQ=;
 b=X4bnPb4EBtlXZgFiegx12NKWQ4d6zgjxWLwuDimnLfjX0/OC+LT8Wgk31mp8yJPkkaLIyweKBM6cednUCcDhjUNKxdYIB0BWzkroNcq7N4+b/BTmE19bTyKIMk5XLFc8yOY0DMxzb2LUvgy18tOOxZgXxwWytWtFhxNDQUgVdVSg5z+x/ioTC1PR4ZFhS2l+0Gv301iIFW5a3A23u3PVkEl23h8xdHJC8/EsJZBM/Cb5R6+QOI4j7dD2BBAb9lHMNEUKdJDMBH2IBFGG29JqBi39nW/6kzVsT4LEWxuh0x4FDHn2a8qaZ0nier2WWKuvR/OOmMaufFGWuqv02FPnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CY4PR11MB1896.namprd11.prod.outlook.com
 (2603:10b6:903:11a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sun, 1 May
 2022 10:48:18 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.028; Sun, 1 May 2022
 10:48:18 +0000
Message-ID: <ca728900-d7ed-8e3c-a0b5-046069657713@intel.com>
Date: Sun, 1 May 2022 12:48:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 04/14] ASoC: Intel: avs: non-HDA PCM BE operations
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-5-cezary.rojewski@intel.com>
 <ed73bdff-f671-e8b3-923a-5760763e944a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ed73bdff-f671-e8b3-923a-5760763e944a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::9) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f135681-ff07-4dc7-deb9-08da2b6019ef
X-MS-TrafficTypeDiagnostic: CY4PR11MB1896:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB189622B1377A1A543DE6F6A5E3FE9@CY4PR11MB1896.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uvjwhlbye/OuLOcMMVgUZX2Spaoxj8xW1O82IFo91gJzAsuAHFFCn81Bnfvamfh7pptIHNJbEiIOtHBdgYFg087gl4vDh4uySz+ZhUryaASXieu6WHVMdfJewnFmvk84kEhQwReKP494KVLjKzrYezZoxdL7BsULRp1gOYkBUtkHgr9fJIDa1mRyL0tOiLhH/TIQrEh25iSrd5A330UhoSV4ZFJf03zVwoK+Qp2bDvhBUE5ZNQYe5uQPmSGyvYMcBb9r2HIFQUAz99HSgbJnPWHPERWgmpm4z+Sc5VJJy9ae27oLhkxwRuC4vPFYKh2s+W9fcMEM1wD63UiREJl6islR6y5Y1F0wiM6m5XfDYE0jOJ7xQ+s7YiJZctNDGuofqAANhcxqZIeWHaxVQgmiNjWYY8OV5lERTfMoIbfR21PCyBiS8BP9Zv/hgfRbyxu+0CJ/zlnKosJu7prfl5F9iMkGT97PjgM672wNwyqHPOPSyMYEYaAcfLa1V+SyTgP3nCycu6/hybGSkBTJiiKTZ0+ArbP6ysWcygQLoIw1cVQeaoAe2PtyrovkUvvDKcTVTHIef52XHcfW0hSGGAuQIw7DaXPSxifshvyLx91A+jeCaROcz96Os+VcEkdB5oU0lXrNpboubnv5FJGr7XyjoBa/n6H7ZQ1NO9nOt7BGroiV28QhVO8aow+2qXgxZz05KpuPLoyvyNAOMrr42fMD+qzBVitglihE6hrXoK1zmzDW22ky3Ju0L3ojtt4tp5GU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(8676002)(2616005)(36756003)(31686004)(44832011)(5660300002)(66476007)(66556008)(38100700002)(4326008)(83380400001)(186003)(8936002)(7416002)(53546011)(6506007)(6512007)(26005)(2906002)(82960400001)(508600001)(6666004)(6486002)(86362001)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VC8yTTJEMW1pYVpJZ2hyZUYyUm5hckg2ZHZ3VlI3QVk1amgvQ3NldFlJUW1Q?=
 =?utf-8?B?a29nR3hJRjRMclhNQkptY0RTZDZZTnNJUGxvTmpDWUtJY3NEQnU0OUJDbTdr?=
 =?utf-8?B?WEEwVjNIR1FRWXNXVUY2R0RFeU01VXlXRFg5V0VnbGRUZWMzckhkMHVxVzJ6?=
 =?utf-8?B?YnpPMDhvaUV2YUZXc0hUbCt2RUVsUXBuSldBZDhDNlRLS1dBdGdzLzI4T2Zj?=
 =?utf-8?B?dXlSWGJUMWliY2NBcDBxQm14V2tFYm5scENWR2kvOExWVmlIblM2Y1Q2aENn?=
 =?utf-8?B?cVlGaG16ZWY1SkEvOWZFRm5hbHY3R1AyUUVzT2NxLzU5c2Z1NzY2Q1hMaWxp?=
 =?utf-8?B?ZERBRjVqekUyMWJsVGp2c0Q5SlgrTjBlSUZFK01WZkpkMzhlaGxpaDJHT2Rr?=
 =?utf-8?B?VXAveFBMSHRwb29rL2lQYUlRVGQ1Q1Y1MEJOS1dMSUpha0EwSlYyR0lOV2RZ?=
 =?utf-8?B?TUVtL1gzS2xZcWk4RThzdGcvOGFQQW5wNnRibHFhQWEzeDlOU2pNUU9Cb3pT?=
 =?utf-8?B?SWV1Zm1qcjd1TUdEWE5ocDI2M1hONnBOdEhsckorSitrazloSXRpdmZHbzRo?=
 =?utf-8?B?b3B5OE91b2xlUmphK1hZYTllNWZ0aU92THFlMTQ3V3lxSkF6Njc1Q1l3MlpU?=
 =?utf-8?B?dHpPcWFNTmVaSTdMb1FPVm1XNTdOSE9KTlBuT2pvN0gvdmtiQmphSGQ4ODJs?=
 =?utf-8?B?V3d0d3N3WlJPMjFkS1hsYzdDcGYvYkRVaVorRzFvaWZodHRSOWVJVi9wRzNG?=
 =?utf-8?B?dk9HZzhKaUxtYjFWeVUxeWZaKzdHdGY4Q1VLM1RTN2RSdHFabm43ZnNHaDlP?=
 =?utf-8?B?MzhwYjB3eGtwWlJtNXp5NnE0SWI5ckhRRXF4U25lR3E2Y0IvU3U4VFR5OVdl?=
 =?utf-8?B?ZE5OYlpOTTA3dEJYWG43OXgrKy8zUVhKMTFoSGxNWjFMd1M0cEJUdXVibkJB?=
 =?utf-8?B?eXEvOFJNVkZWU1dnTkI5THdVT0lnb3k2RllGcGtCTjdSVWJUQm94a3BiTmFk?=
 =?utf-8?B?cGYyMmVyYTRZSHJpTTRnOTd3d2VJSkdEVFhKQXE2Z21xYWx4a1hjUlZmOG1I?=
 =?utf-8?B?RkIwY0VsT2VLa3oxamsraktzVklSWkhTWmFudVdOcS9WeDRpYmtxL09sd2tC?=
 =?utf-8?B?SmlrMllSUEszbERVUmd2ek44M1NyMXJTU1ZxUmlTL2VHRWRkblZlcnlUcjA3?=
 =?utf-8?B?YXBpOHg4QTh4V0dvb1U3dzdwa20xVEVXWUhyOEhMb3lZS3hXZzN6Wmt2VjdN?=
 =?utf-8?B?OHZZYzBuQURGcS9LMkkvTCs0ZzBGdXpqS3VML0tEWEMvQUxCZFgySWtKdXJO?=
 =?utf-8?B?WmZjMDlUblQxbytvU2JxMW84b1pzWS9WR1dRYmpab3RtWWQ4bmR6V0tPSlBR?=
 =?utf-8?B?VjlBamM1ViswSUdqQytvQnk1YklZUmdpR3RJdXZIVis1N050aDBCT0lSZi9F?=
 =?utf-8?B?MzlqUExDWnpLbE1LdkEyUHdwdWJzMDVEQ2tLdVdsazYxRy9tanFYOEdHTko4?=
 =?utf-8?B?YjhjL1pudzVMbHhIamp4VUxmdTFjREROWDlNOVdSeTl0TVF5UW9xTDdIb3Qz?=
 =?utf-8?B?RnFXQ25tOWl5dnJiTU92QTQzZm03MVhXK3B6ZVVaMlNBNEJiOTdkdHhNMFBU?=
 =?utf-8?B?cXpzM2dBcENPSUcxOWhUTEIwd3pQQXFpNE8yYmNqN2s1cUg0aXA5TWVkVlk5?=
 =?utf-8?B?Z2ZXcm5nOHJXNFVZRUprczk4d2lrTDllenNscUIwdlpuRmVhMGh5UjFaMFAy?=
 =?utf-8?B?SzVJZDViS2ZmNW1QWkZnUG9XZXdQM0I2anYvTG1wZVkxMm5CSHlGUlRwd1Rl?=
 =?utf-8?B?Y0ozQVp2TGNJRXRXR1NvMXJ3czdWTDlmdTEyT0MvQ1FDclAxNUxDbkZlVkJu?=
 =?utf-8?B?MW05Y0RnaDhTeVFSQ1NjbnJvY3ZnUjJBa3hxV09HNEV1RmxwZ0VhSThXb3c5?=
 =?utf-8?B?UkJRWDRUaWE3dm9EcFlwTm9rTDA3dk5KeDNKNkF3dU0yOUVIZWx2T2FnVjB0?=
 =?utf-8?B?YmNaV3c0ejlVSDBydWxxRzBnejNHcWFPVzlpQlRrWElMSGJLV0RnMGkydHc3?=
 =?utf-8?B?WHdWeFhrYUdnN3IyOEFPSW1IL0ZNc2ZCbkI3S0xuRG1KaXdKNUZSYW9PRlhB?=
 =?utf-8?B?SERYTVhsNW8wandSWDVOTURFRndPdE1zOTVvRHk0ekNnYXVvVUVLbjY5dmxj?=
 =?utf-8?B?bm9ncDRWdG9zVU9ocjR2Q1hsWHRFMDU4KzRLK1Jlc3lGTVNZS0p0THpvRlJO?=
 =?utf-8?B?bmVnUmtCdytubUpVaUxlek5GNjZ0ZEFhdVBNQklaeHlrd3dxY0Vnckd1dTVx?=
 =?utf-8?B?d2t3MWJZY0JwWUFSakpzOWREL1E0T2xRMGthcUxqRm5VTmYrZStKQmg5T0tE?=
 =?utf-8?Q?ENxJk5v0mn5vM7kw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f135681-ff07-4dc7-deb9-08da2b6019ef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2022 10:48:17.9445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijzg3PDm3D2pXpJUAVY9ZGEZiEscySFcmPCYDg8+bs08Fo/0Pv6iQm9G2ewpkNQmTOU2IUcRsiMvHPNSUR67mbKBn4vgaI2OT+CGUz1cw+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1896
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-04-26 11:40 PM, Pierre-Louis Bossart wrote:
> 
>> +static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
>> +				     struct snd_soc_dai *dai)
>> +{
>> +	struct avs_dma_data *data;
>> +	int ret = 0;
>> +
>> +	data = snd_soc_dai_get_dma_data(dai, substream);
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
>> +		if (ret < 0)
>> +			dev_err(dai->dev, "run BE path failed: %d\n", ret);
>> +		break;
>> +
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		ret = avs_path_pause(data->path);
>> +		if (ret < 0)
>> +			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
>> +
>> +		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
>> +			ret = avs_path_reset(data->path);
>> +			if (ret < 0)
>> +				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
>> +		}
>> +		break;
>> +
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
> 
> TRIGGER_SUSPEND will result in -EINVAL?
> 
> Have you tried suspend-resume while playing audio?


The suspend/resume support for the PCM streaming is split and part of a 
separate patch. Because of this, all related triggers have been skipped 
in current series.

>> +	}
>> +
>> +	return ret;
>> +}
