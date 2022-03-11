Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F030C4D6777
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 18:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891E516F9;
	Fri, 11 Mar 2022 18:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891E516F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647019309;
	bh=NGv+Uob+E5+EXEIHaWzG1WIMvDAW+b0mSXYLUflQFso=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GIj1K1GKDBT9RtEbX2ErR8OwTv5bcwY5PPLUZ/PU07S1g3uuHzJpRpb6bA3puJg83
	 MKYDK7Sr8w6yF/F/Afw31C5ZKmqRH9g/3Xhs6Mvws9E7/AEJKZMlkFp+m8L7/hnEA7
	 ajJ46TRawYnrq8P/rcvY88SqaNERq8I3ioVcCakE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECED7F800D2;
	Fri, 11 Mar 2022 18:20:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 981D6F80227; Fri, 11 Mar 2022 18:20:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4740F800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 18:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4740F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FBdY7EwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647019238; x=1678555238;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NGv+Uob+E5+EXEIHaWzG1WIMvDAW+b0mSXYLUflQFso=;
 b=FBdY7EwLMn3SSmh5EaTBNu/SMgwOiffDQXsaZAE5jB4k7nVLre8T4lJb
 0L3Wt6Hk6gqN7sikj2dOClrlAPCkxcF6ImseRf14SAbIg7kmFZY+Pr9ud
 fcObGGI3OB1cJ09Tj2s6FQQcDsi9se1AFg04rIe/UkIXYW/F2wOPvZ39y
 MjHCBAudLpGBBpjNx578R1E3GaYnF6ZufRpCmJpRnerDrqN5VgAM4gkbu
 nIpkwsd4mgj1832swjS8IBTbdB21dlZJmCWSNpExjM6aWA/yRXPiG3KDC
 59tMxMuHfANUUhGZ+JgXSkPo5VGmMxocMNWpHdwsdpcmHZrAQA+4YB4AD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="243061001"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="243061001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 09:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="555384664"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 11 Mar 2022 09:20:33 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 09:20:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 09:20:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 11 Mar 2022 09:20:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 09:20:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyIeH7nbCM02Fyuqp4HWsVl0Eym/ROcsiC5AVZRc1MCffDgJ6+DnETnVzAaj1tsbTitkqZwCgHdYYPCPXKpjSh+G+zX9UDwrd4HRCge9tvx9Rdf9287F+O7z0SmNG6LkJVjvu9xb+i2E7bS+pexshmP0dWKxuhaEZA+Gxc5XUilEt+YPjBLySg6TdqpthoLqSTaVAocoJywKQJr5aFXE5tR1eg3qFA9iT9XeFqd9zSKwHnrWg7TsR1t+hJcrC2aHdey20R5c7WqprPpcRSMF4b0lgTrfc0446TsYBaNLIg4iBRdNeb4/Rpanox5nIvFcTZkuoruPM7wK6bRXDIapeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8tIYZRLnkGB8IXF7yUyEV8V47e+NCIB3Oeq/sxtMms=;
 b=NrjBVlxc51aSsRh4y+tS06G3oTHpva5Rfa2MyS+W3962X2wTqogLt+iaqAPWZTi6+5kKyfekQUyEKsuhngfm1htfhNYEw/ORUAzR2fLBMRNHg4dBAf+r27JzmiUFXWLr4cW8eO4ZmmlPgfmvSIuZOHywhGFRMv4zenDrU76WmIYWuve8MokJb+S/a4d6u1y2Dkzfhzs0DP4sMBkh5PaS3VicJ9A1hw6fSFw1p72BKjKr6nXA635bpaqg8JP5nHWDK/7dYBjeReMLr8TNJI7a5rCAh6esFGl7vBsLVOxFHpZwNlPXtdd47n62XM5CctY8n0VUzGdOOZGQE5QZ6roDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB5215.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 17:20:30 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.030; Fri, 11 Mar 2022
 17:20:30 +0000
Message-ID: <8560cb93-c2f8-a486-61d8-7955d888d97b@intel.com>
Date: Fri, 11 Mar 2022 18:20:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
 <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
 <05f38bf1-4400-354e-bfc6-636e602201f7@intel.com>
 <7deed9cd-0123-1903-00dd-4b7ce9232f14@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <7deed9cd-0123-1903-00dd-4b7ce9232f14@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ba19833-7573-45b9-5957-08da0383715e
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5215:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5215533FAF8380C3CF87E1FCE30C9@SJ0PR11MB5215.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZqlZLll6wOyieRVetyzFTpXfT760PDX/O78F7BnbMZJk71AEyEenphKCazPjSsbm1PxoO4aRlDF6boBYF6hw9ruqeBAE01bII+n0fAM4uepkMYwfFVT/oCWCMdLHngj9vWbm2AFsEFiwsfUi1bo7F2z3pQqD1sfdpeXDnre4eMG9NN41kxFzF3l9cP4zI7KpgCJ5Mp9FYhKGB0IY/NRykJX5fTMGZEQE3Qwg5+iG0RH5rrkbbniAJHHeDWWMQeHT1gMVSYPue5aDrwgMyZnrm2E5DmJmajqmTFyRnFPLORCqH231I++OCRNlvFwJxQKIhvwVOT8++z/ex61A4eOeHzt1ed1DO3hBl6h7CTnNYff+J/ZXv0zUphU+V8L5WyJIBVU3s6HTj60DPmcDiQ3nAoL8BV4CwL8HglrcLunDZ6ww7vKRvhV3CkZzZKAsLTtGJ6B3jd25C/0JHy8jO4UFKn8o5Qqd5x9ARELosCvGOGYWoXJQS3WBoVtV/rM+bSxFJLee36KQLHgXc/my3Fu+67sfRyseaU9yLoGqQrXvHqCU6nqTUf3RaWho7yZ/zO3VMGlor5baUxfJKJ4yFPhhwi9M0aUWabHxJaXXROWtZvlw4kvUhaE2yuR5ZWYUQ0zeDIzPqP9Syrw7J2clDhQ3TcNVLH8kyvsaSEZh504dM/RGbXvndb8ktKzsugPBAwOOuaP3CV4K+0AZB0ymodlmNxbBwxVpHNYBD1fc42WcAr58sGA+TawWBsK1AZiOkEGV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(86362001)(31696002)(83380400001)(8676002)(4326008)(66556008)(66476007)(66946007)(2616005)(316002)(38100700002)(82960400001)(53546011)(6512007)(44832011)(2906002)(6506007)(6486002)(508600001)(36756003)(31686004)(5660300002)(7416002)(8936002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVczeklIUXA5RVVTTU41S0dRcHZRWUZxN044OWJzaE9IRWRCQUxVUVFWMUFz?=
 =?utf-8?B?Z3kxWEk5Z05IMml6QWlLUjhmWUlsZU85cHh4dnFqejNMdFFHaHhRNWFQdTVN?=
 =?utf-8?B?bTBmcDV5RzJUcDl3N1B3Wm5yK2RQbk1RRkthYXJGcHFpWHpwaWVhcjhTekkv?=
 =?utf-8?B?TmM3WjdseXErWkRXS3JtSWlJTm1mb0VBNTdyOHNuNCsrVldhSS9LVHZhdHdI?=
 =?utf-8?B?TDhBTDRhYklLRlh6VjdUR1o3SHZ4OXU0bzhGRkNKUzZGVXZRK0ZUSGZQUnhN?=
 =?utf-8?B?bVc0cm1ab3ZzYkJOV2w3Q1BVV3ZqTHB2ODNmcFhRbko4RDF4L1ZFcE1YY09l?=
 =?utf-8?B?R1VxUE9uSmRnaEJOZWFPM2VKVUVJQ2pPdHFvTGhwU0VzemFnOTNRN1JQTFRn?=
 =?utf-8?B?cjhWSU1HME0rZjVkcVhiWGZtUDRVT2FPaTdMOUJWL1ZpZlVNRDl2OFVzVlhD?=
 =?utf-8?B?cFFUWDBOYTZBTWJ0U1ltSzlkK0FiL2FBTG83MmxjODRvWnhRSHYzelRDanp0?=
 =?utf-8?B?Yy9hc0QxL2Y3b3NDb3ptYjk0OGtLTUJEenp4QXZKMnY5NDU5T2pjb2FrRGlu?=
 =?utf-8?B?eTdTR1JsNEVuV09NR2pKc1VkOEl6OVZYK1ZYZTlkQ3JKdzhKY3RLbjVLN2Zq?=
 =?utf-8?B?b3VBOVIwNUx3Q2poSGZtY2dOU1BnVEY2c2hyRTc4RVZibWx5T3Yyb1RVYnN6?=
 =?utf-8?B?V3FYTWx3RTNBTGs0MFNJUTRRdXEzWnJnOUg2TVV4SFgyVUJ4RXFJNHNaUmVI?=
 =?utf-8?B?RjJxNXpwanlTUjh1dVpUWkduMkNOYzJaMnBHOGY2YXRRSmp4eW9kRUZ5NHRG?=
 =?utf-8?B?K0M5THFrc3duNnJXZXExSjZ4OUZKc2E3a1Z6TlpRcTNQbnZvbElQR0hnL1Rj?=
 =?utf-8?B?S1ZYY1p1K1l5RG5YN2pBM0lLbWhQbVNLQjZvRVg4RmoycVZxWlVjaHJOVHVU?=
 =?utf-8?B?REZ2ZmhqY0Z5T1JybWxmS2xNK3J3WWY0TUxucW56WHhieklTQlFVTFpkT3Fq?=
 =?utf-8?B?aXM4MUp6ekk1S1htM3FGZFNXMTNMaWY5M0lSQldLaEYzSXF3ZlU1enZ6TzF1?=
 =?utf-8?B?YUxtYUY4OUFpalFRMDVsanUxVFNYbEU5QW0xSjBwcTFUdHVqSlJsV0gzYjg3?=
 =?utf-8?B?QjNCbmwzUE5LZHl2aE4vSlF4R25iVzgrNkh1czcxeUR1L0NaVW5IaU5kMjB1?=
 =?utf-8?B?cGVDSGRzd2E5RmxPK0s4emMrOXRUem5ZMVl1blEyL2dUQkUveE9yVU41bzg2?=
 =?utf-8?B?NjJwSitNdmRla2VlSmJ3YXpjemlEd25pUjhUOE00bWd0bnhCWitXaEdaWGNB?=
 =?utf-8?B?NC9UTURDdFA4MGd6RUpmUXQxc2ZuT3Nxc2YrVUFmS2VmaGMwMk9oQlcyYUpU?=
 =?utf-8?B?TDN0MGVTVjc5V0JOSmhwWE1uNDg3enVkRzFxaXFBSVZ4SHFFODZjOHIxOW5w?=
 =?utf-8?B?b090aHBhN2tiVTVMa3dLUTFTRFoyNHExT1hiWjZOaThRL0t0eDBXZHVBdkho?=
 =?utf-8?B?UnpYdTNTaFhCUC9oenFxUUZrZ0EwZ2tRNC82T3NDQ1Z4M3lvcXZCSDNTak1R?=
 =?utf-8?B?bWFMRjl0anRybnNoQjlJVFdjZm1oL1V0TGhZQ2JZOWRsYUFYS0hvV3ZYUERE?=
 =?utf-8?B?VEV4TkFpM29VbE8rNnlob3RlYlFiL01WeW1yU3JqdVZQZFZ5bXBKZ2g2SkQ5?=
 =?utf-8?B?Qy9QUmgyaDQyZWRrVWp2Z0VLaXNZU1VwcS80cGNLZ3MycmsvYlZUaGR2R05x?=
 =?utf-8?B?WlF3eno5Y0cwd0cranRMdFBmVTZrM3RVb05uclp4YjB0dUFSLy85TUk5aUdG?=
 =?utf-8?B?aXEzVzBOMzlLSFNnZE5zMmxGYlAxRkpjMXBwS3ltT205MXBCY2FnWVdYNlpi?=
 =?utf-8?B?dXFiTzZaRFI0SWJ1S3VYYWtEaFdVRUNQUDdnMjJpSDNRK1NzbFFDcUhPM093?=
 =?utf-8?B?MnF1djJ6SnZ2bFVvNkp6eFJabnJjNUlqMGFmRmxFNDl5VUFBS2RsbHRWd0xi?=
 =?utf-8?B?Y0N6d2JMb0FnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba19833-7573-45b9-5957-08da0383715e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 17:20:30.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APi13KT6tGaAgAuwEsumSu2hHY8X82MTT3eT1lOkndOVGA9s3L0VWpc57iuVMg4Sog2OwXIhS1n4yuOeoZkvLUuKY9xLCcBtrAHoRrdc3Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-11 4:59 PM, Pierre-Louis Bossart wrote:
> On 3/11/22 09:46, Cezary Rojewski wrote:
>> On 2022-03-09 11:36 PM, Pierre-Louis Bossart wrote:
>>>
>>>>   /*
>>>>    * struct avs_dev - Intel HD-Audio driver data
>>>>    *
>>>>    * @dev: PCI device
>>>>    * @dsp_ba: DSP bar address
>>>>    * @spec: platform-specific descriptor
>>>> + * @fw_cfg: Firmware configuration, obtained through FW_CONFIG message
>>>> + * @hw_cfg: Hardware configuration, obtained through HW_CONFIG message
>>>> + * @mods_info: Available module-types, obtained through 
>>>> MODULES_INFO message
>>>
>>> is this just for the base firmware? If this includes the extensions, 
>>> how are the module types defined?
>>
>>
>> Only base firmware is able to process MODULE_INFO getter. So, every 
>> time driver loads a library, this info gets updated internally on the 
>> firmware side. We make use of said getter to retrieve up-to-date 
>> information and cache in ->mods_info for later use. ->mods_info is a 
>> member of type struct avs_mods_info with each enter represented by 
>> struct avs_module_info. These are introduced with all the basefw 

Sorry for the typo: s/avs_module_info/avs_module_entry/.

>> runtime parameters.
> 
> you clarified the mechanism but not the definition of 'module-type'?
> 
> the definition doesn't really help.
> 
> struct avs_module_type {
>      u32 load_type:4;
>      u32 auto_start:1;
>      u32 domain_ll:1;
>      u32 domain_dp:1;
>      u32 lib_code:1;
>      u32 rsvd:24;
> } __packed;
> 
> I see nothing that would e.g. identify a mixer from a gain. The 
> definition of 'type' seems to refer to low-level properties, not what 
> the module actually does?


There is no "module-type" enum that software can rely on. We rely on 
hardcoded GUIDs instead. "module-type" is represented by struct 
avs_module_entry (per type) in context of MODULE_INFO IPC. All these 
names are indented to match firmware equivalents to make it easier to 
switch between the two worlds.


Regards,
Czarek
