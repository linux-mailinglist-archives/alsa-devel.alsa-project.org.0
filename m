Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D34C1522
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 15:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B3731AA2;
	Wed, 23 Feb 2022 15:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B3731AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645625365;
	bh=G1Nn1EMqTXAEwGKXPJWUzHQCn/A8lTJGAWhWTGeo+Dg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIgZ5+rxIGsHnVQy5rsnR3T7WUcIEfoXgmtwfWJjiQn19K2YoQCvLVVsYDc+0NqAs
	 nkR96tDSecUvSx77pbw2I3j6UVGrbOKoNPNVE66m7EJen+vLYp4dpunV3P9xqec/4q
	 CrDHRMPhUIZoaYRDPWR4V2XWZEl/FikVBJ52Lfp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A371F800B6;
	Wed, 23 Feb 2022 15:08:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4541F80237; Wed, 23 Feb 2022 15:08:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D6F0F80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 15:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D6F0F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LIConssT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645625291; x=1677161291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G1Nn1EMqTXAEwGKXPJWUzHQCn/A8lTJGAWhWTGeo+Dg=;
 b=LIConssTTrwKElwuOSi+PlluQa3IH1vAkGxkr06Og7zqsG3Tel6qwOTZ
 Dj4yWzLQTRh9UX/QkzpUj3THfJ01HiLdVaTbJs1dhLfilCeXv5um6YEW3
 pRGC06R+qTZfpQvbKL6vCVVm/Ujo+Ybc0ZYJhK/MEm3vYYfwG+RqzM5cu
 ogM0WXAqn28oPOaj6Vg0KJKgh8O/78xHlxmFFcXCcYWnlBaxzQmpwZaLK
 Htq7Nhyk7Se6uMJjwMy6OB641VLfBvHqyjgntIrQv5jcAdJ2VmqqEin3n
 gby4WsHGdviCdIf0XIPpxmJOj7cuPSMz1GexWTjsQb2cZ7cYCoqasy58+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338406947"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="338406947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 06:08:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="548261882"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 23 Feb 2022 06:08:07 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 06:08:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 23 Feb 2022 06:08:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 06:08:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo4OVxibbtKEI0spoh4XUPiJQ/XaqQcpU1vO37K9vCopv1X6E/Ae3T00s+ebCZTOB7XYC5QtIY7JVVihSVjfm/3lB+M/F5y4TLD3gp7fMTCgc2UhuRzt65Zajmz9yXiR2lMpYXeca93qV3BmsI+mtG4G9ZKD2OOzenXvx93zJrsDuSfvHsjrEc9HXPTd2L7BrjFqwWwjOrXl3ci1OHEWWHfraKzUYf6IyhneMHlJhdLjR26DC+SiJ+k+UVBmJq+wpxlpyMgH3oJmdB1w/24kRBaKyGWop/iHTeYxdg1CabXmYN0Jk6SzboPzdPgvvPvugVHx79C2ekdRBoQ+UzuLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQUA4NGRb1IXUeSTEkAjKMp6IfmNdorCSgt4OB6ehHc=;
 b=VJqSnEoamrg8yS4AWCwWLi6tmopnRrfL2crl9rWSo3Nx4B3yWdcNn1QqeR4MXBoKzmWhlCgDaVgE0BJqXMNLFJLclpLRzSpO06BvVg0PgD8w7HC7lYGJD/eV49n9Ckp6nre52rQrWxQTXvV6naRcsyDdb0aW9L0vI4bfHC3UYPP362CCwTU9Sjtmb27JR1gWwA0/bV9XfxEXRkvVRPMRxNmnmlHibjzNepgJ532VslqKQHXQUXTGSXRcNNgS8NSAiNgjGnWHO4tw7cFk+GR6YyiaX32R5IKW0QuTDmOpFrbCMnlN79IgWCSWvMjdd+Hq+UntDd/5vYdFoaICX2OOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CY4PR11MB1383.namprd11.prod.outlook.com
 (2603:10b6:903:2d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 14:08:05 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 14:08:05 +0000
Message-ID: <60cbec2b-08ef-499e-b823-c53b97497017@intel.com>
Date: Wed, 23 Feb 2022 15:07:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
References: <20220223135237.731638-1-hdegoede@redhat.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220223135237.731638-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0081.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5356f31-29d5-4713-038a-08d9f6d5e92a
X-MS-TrafficTypeDiagnostic: CY4PR11MB1383:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB1383DC433D447D61271DADFEE33C9@CY4PR11MB1383.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLad3eI3Yc1HE9U1yh34Kj8P8WKMWNMZi7cXbK75nG/nPOsx5umhpo6UHqcy5KzV5c7UEoDosD4IMIh5PGvH25hkzX+XOF9Ef77VQqbVDpVK/OcUck2EjkQVBjIl/F8Xd4ln6dDbySBSHNqLdoxwxiXQxnH55as8PX5B641SWKqMYN3JBC73NUMVLc5UxOn4p4B467VyKW+wn1K1k67swf7//V0Glb1z/uv3S0TGf7JykuGDUsjZ+cNmGbMD2jEftlu23LDaqVCB4lx2WIa4tcJCm4OcY+EvU/urWI8MW9MAEMD2VCBCt9UyyTp8KMaQBdW1eikNKllZMKmooN3CgunRlQcAYTbSMYTSvEiYRb7DtOQs9fSncsTsNh23V+7FOcO3Gatczias2VQ4EvO4ZYVuev4MoVRKdeJFfzI5hBTxyJdDmrO1BUb3SoEECGg0ZTto9O2LO8uz2UL14yyxh8x0Ylv/O+FXSu2ARm515LMwcNoG/6FqsbSzhjb5nsCEyGFREtcOpRKK5gI8R0LYcir3fC2qyE4psRdbXdSGZW9I4aD8FJUSlhnVorRJDBECGwIObKK+C8H2ai2bC39xiQu+IDHA+qh/XpaRh1e8n44vMNQzfEQ7vM/5g3ApNojm5EIToSWlnM9pOB3mX/b4RF6tUaJ8+Pt2T9/pGPSqeDc0aXH4exS2TGN4yjWbPqP9TkO+54I3/LarKmncTcIdZ9fDddQk1AR4sCd/qbbE2Pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(508600001)(66946007)(6512007)(66556008)(8676002)(6916009)(53546011)(6486002)(2616005)(31696002)(6666004)(86362001)(6506007)(54906003)(316002)(82960400001)(66476007)(44832011)(36756003)(83380400001)(4326008)(38100700002)(5660300002)(31686004)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjlIdFl1WWd6Sll0M3dDMUk5RmVMbm5JeUphUkF3eWdrem93cU9LS3VxRUpo?=
 =?utf-8?B?am1RZDVueTJSNTV2Q2oxZUZhcHhyRlJHc1FidGVqcmdTRXBOY2Q2WEkxbWlr?=
 =?utf-8?B?eDRNeTkxMk5aSG5NeDRVMkZUZmgrdllXK1lmOVRpTWNRakxuUURjN1ovMU12?=
 =?utf-8?B?d2YvdUViSEpUNUlBUW9pQ1NtWlZCZjBJc3FWRW9mNktFSmhuVTFhWE1EQjMv?=
 =?utf-8?B?bkxVZXY5SWdHTXNQSWxoeGdEVWFIYmhGU3haa2J6bW80ZEV3c3BDS3hBeSs3?=
 =?utf-8?B?ZmNBbTFQSDJFL3BKMUlCWjBicXA2a2d4T0ZWRnJiZEtoWTdjVkVydjdSWnFY?=
 =?utf-8?B?NEhWK3p2Z3JsZXRvcE05YzNXeVVXYW4yM1VOZWYvVnVTMzRidWhrTmJaV1Yv?=
 =?utf-8?B?L3gwTzdDZkdVZ04yS1BZWnVoOS9WRlZwZStnSktBdWRVN3dQYVFrZGZ3ZFVF?=
 =?utf-8?B?ajR3QWFCNmVrdWFGVERLNUFmU01wS29rVXltS0kwcGpiYy9DdVNmaEpFK241?=
 =?utf-8?B?TjRwZWFlS24zVUlkYlNVZmVMa0VpdXFXRytqK1BITUdDQ1ZBRXNWV2xocGpz?=
 =?utf-8?B?WDdCR0t1RXNaMFp1eXBpaHNKWFd1ZUgrU0hRNW9lNjRPUExVYXRxUUQydFdq?=
 =?utf-8?B?eFBwT0c1R0VvWXN2cmhQSDhmNkk3cUpOWUdKVHVVZUkxTnZBRVVyWnN0SkI4?=
 =?utf-8?B?WENrZ3B4M0ZmbFY1YlR6NGt3TVZnRVducDJ4bW9GV3p0VjlXVVFCZ1h6ZHBq?=
 =?utf-8?B?Tk9BK3ZCQ2RDZnpXZHNUOVM4Vmt0eXpyRjQ2YXJyNTVDM3ZONHdsVllkTHRF?=
 =?utf-8?B?anAvTWZlTnVjVUZmRFhadWNHdmIzdndpRCtZN0pDNUZHbmtUVzg4eGpTeE9V?=
 =?utf-8?B?cmp5bkZwNktsYzNhVHRhdC9BYmdjdTArbmdqbTZQVytpcTFUMGVyeFVTb2hm?=
 =?utf-8?B?VGV0aVdYcTExVnVBK0FaSlZRSkpIbWhMN2lSMWxWMDY0UFJXTDBZMUE5dElC?=
 =?utf-8?B?MkU1Y2tVeC9ZQ0cwWmlLWGpmd1hpM05TWko3VXBHWXhnSDV5RzUyWHpBMVNO?=
 =?utf-8?B?M3lxRXlPVnE2SnhzZjhWK2ltZ1NmWllxdjEyN3NOanlPZ25Zc1F4TDBoL2Y1?=
 =?utf-8?B?MVNwckF3WTRUYmJnemJwTVdDVys4WGFZb0FFN1NQZ2pHV29PRjdhdHJNVlI4?=
 =?utf-8?B?aGI1d0hmQjFTT3c4cUovdVZaZ1JEN0o0SUhUNFlrYU5MYm9VZ0VxOFV5NXVD?=
 =?utf-8?B?SGN0QmpyNjkvaFJXbFhNMExURndEK1VxOVN0MWd6UlQ4TUF3RFpUZ2tGbkxR?=
 =?utf-8?B?UVh5NVlERVJleDJKSTFDYWRUd2ZLMHBzVjB3d0lPNnVhUHRPMXgrZTM3STR4?=
 =?utf-8?B?NFYvbVVXTmdtcERKdDNwZE9HVnlDRXVCYm10WG5NaFhVT3JuUFloUkZ3ZVBm?=
 =?utf-8?B?aFNVR2NVSWVWMGh0RXo3V0w4ZnIyb0pXWUJ3ZWxsYUZUcHQ0Z2k3K0l2OUZ6?=
 =?utf-8?B?THlJbkt1SjR1aFZLdHBqYVFtQ2ZGWk1lcjFIbUMzWElhcTlkanRQYzE4UklZ?=
 =?utf-8?B?c2VNSmVFWUV0bnBLNWlJS0ZUdXA3OVF4OEQxUFhzblFYMU51dkUweERKMGE2?=
 =?utf-8?B?YlZ3NFNtOUkzTEtobjliNFVIVmwxalJmSzVxcUcwOWttVTlEc3c5QWRjazh0?=
 =?utf-8?B?Y3YybGhLcFhCbzNJMTVhbkt6cktEM3pWVXJtSlBWZXNtZkFxWDdkMFE2RnBu?=
 =?utf-8?B?S2RGMkxiaW9CRGFXakhXQkpaNmxWRGF4VG4xRUlmdzVJKzM4MHhHc1R2UXVO?=
 =?utf-8?B?RzU1Mi9vRFJnUkNJSE0rRHJhcmRRRXRFYnpNbEQxQU1TUTlmU1YySGQ3aFFx?=
 =?utf-8?B?V3ZFK3ZJSGtSa1k3OFE3eGdPb21WZlRHTzRtS2NvR05nMkRqNVNGb0FFQlh4?=
 =?utf-8?B?dWVVNFdzbVJIOEdQclYzUUo5WHZBdVBsSmJ5OG5hc2ViS3FKL3dUL0VzMnJ0?=
 =?utf-8?B?M1hpVDZNSlo0Q1gvTC8yK2dmWDJpVjVLRE0wSm01bXcyMzFuVU5kRjJUN3Zr?=
 =?utf-8?B?SENMbTJrT2VidDZIeXNBTUhIWDRSSVVoZ2pVMGFDZVRuYi81QlpsdEtLQTRC?=
 =?utf-8?B?V000bWRuYTBjN2pkNmtMc3IwKzk1L0xqOXhoc2RRYzZvTzZIZERiWUk5OHR1?=
 =?utf-8?B?ejRGcXdzeWhaQ3RpbEhsckVaOG5aby9jVlZnMGxHZkZPRnRSRERhdXhMYkNI?=
 =?utf-8?B?TlBoSTJBcG9TbEJqYkFjNmVxL3lRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5356f31-29d5-4713-038a-08d9f6d5e92a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 14:08:05.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djPhSpZ5jpBeNZWwnZ5cm9bPpjXho2ZRMz8/EumTWbcu3d2N/b0c2bkbtzMmtEtjfUKx8h73Zj0KOs6SSwBFogU1839889ul6mBZgh0QXok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1383
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On 2022-02-23 2:52 PM, Hans de Goede wrote:
> The Lenovo Yoga Tablet 2 1050F/L tablets use an ACPI HID of "10WM5102"
> for their wm5102 codec, add this to the list of HIDs for the wm5102 codec.


Thanks for helping maintain BYT-based solutions, much appreciated.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/intel/common/soc-acpi-intel-byt-match.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> index 142000991813..c532529a3856 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> @@ -127,7 +127,7 @@ static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
>   
>   static const struct snd_soc_acpi_codecs wm5102_comp_ids = {
>   	.num_codecs = 2,
> -	.codecs = { "WM510204", "WM510205"},
> +	.codecs = { "10WM5102", "WM510204", "WM510205"},
>   };
>   
>   static const struct snd_soc_acpi_codecs da7213_comp_ids = {
