Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 119867BB3D1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 699F7828;
	Fri,  6 Oct 2023 11:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 699F7828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696583233;
	bh=8B2Zcb6UEK9I3REAnG3kcsYm8barygKj3ljjR37ZLys=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sEERjyegWf0OP3bQd//XK12PKV16z/PodDgZH0sz+yQBtUUfXpoozkfLqLP5LVwyC
	 YBnlrH/zbLf+uTUVhdjzTHJR/BuHuMVY10YtZ+FFK9YgmzvMkIGNmusDkMJkmue5cF
	 vO96DaKXzHS9gkx8bUscGeJSyX3sF2SIKTeQe9z4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76ECFF80558; Fri,  6 Oct 2023 11:05:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9871F80310;
	Fri,  6 Oct 2023 11:05:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E275F8047D; Fri,  6 Oct 2023 11:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A6DAF801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 11:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A6DAF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MNIfd+QW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696583149; x=1728119149;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8B2Zcb6UEK9I3REAnG3kcsYm8barygKj3ljjR37ZLys=;
  b=MNIfd+QWgZwa+LZCThJXQoTVy0iZgqDRJEa8X9Gf0z3N3/t6lZnKna1y
   8Csf8Kjmro5dkzDNlI+JNevfYejEvTS4mEzTyMeFcv5yW+tJu+rB2uJcX
   OATGVldeprMpMbhl3iwoPihiZe/2OCGZCIAqPGGcRNDbxgH/FcaWoE6JY
   KqHL6lpL/jvuvsn7U6bxGLAwjgyo27vPjrwjeQsudG6/kUSZi18JSw54A
   cxct1oPV/64Poz0EWWKCI4SGZvGfbBbHd2p8Ml+J2C5ylF1sU+BM4CVkx
   DwroLBQc+ProiIU4qDVrKcRLTufRwN38ctyTipfUCciQ8TPPtJeOqtoIz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2313335"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="2313335"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 02:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781582152"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="781582152"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 02:01:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 02:01:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 02:01:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 02:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC/npktTikegRgdbtxvYJ2rt3hmi12+JJ3r5oYILBoVD2Y8Vg68eZaXlkK6lsLROfOwzbRoVJsNAucaRMIj9l4ke+X1POlpwKa/7Q6l9vh+ABuoCJmlGi9fEigFjwv29EKFVclIm6QZA6HbreJWwmro4lc9S5BvL+9Pja6e56A9DSy9VvffsYAjaWrMq+Yx6TWj20ox9BRZDeFpETqclpPfXhKVIrWOmn60RBP2CXAPTm1Ceno66QiSBlmMm05xnQsCexOXS16sYt8zHaAHVBm3qZru74+TBjlpuzCR5qoVk+9oP262EbkEWsmP55FTlvxnX747usYpUOIGz7SjY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvyZBm8wkdlFsxfOU6ujLg3+3I48+O0r0tzQJWJT048=;
 b=DGBw9B1MBDrQxkDgiEx0rz3lqkQMH2CszK4t4bbwN7jP7hnFmt1Ahq8+IOApcIs5t8fFrgDZSRdnGzkB986yh2J6gATefUimMzK+1t3Jg7NtBcWeqraXRQVXMxWiWnLiPpDsInTACueHNRRIUaMWpXnxIlzA+tIX56NG5nUf7mnwd/JV9GAXxTQBTdC3LfHGFxsy/KelgLMc8Fv+Y865Vb0m+1xNNI5sX8eV2XVRqKx4Bui34ForB5gCEu70lHvZwrPIv/Qt1N7iOQob5m1bthPn32QbKUD9AVk66kKfS5BDK6fGa/0pNBGt4rqV807/mNn4L0ms+FCElaHUo22bdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.29; Fri, 6 Oct 2023 09:01:50 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 09:01:50 +0000
Message-ID: <bb4d4eb6-9bca-f007-da90-f38f910fa541@intel.com>
Date: Fri, 6 Oct 2023 11:01:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/4] ALSA: hda: Abstract and update HOST-stream setup
 procedure
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230926080623.43927-1-cezary.rojewski@intel.com>
 <87y1ggw36h.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87y1ggw36h.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ff9f8b-e36f-4d59-2918-08dbc64ae034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 n8G1ieurMlifLEeJcl4E5uZncj+UCCmH4dMJRIauYiCqdwF8Yu81JZXaYN63yZ8n8Dp2/C+MJeC+ct0WfJTuWnHDyq6ertTH6Bu5lapXwl85+3qi0vZX5i3BbeOZktGy16erXLnGYNtMxk0P5gO5+SPu8ExBV1hsPkNDFDu64+f2WkKI4wTYzlU5/nNrCrqox45YqK678VehATlwCwJPBChYRTGCWXmZbfag5d+kLhPRfJn9g28N+L1YK0eCUszQVAkNO1dcAG/Gj6guhnNCRJPaajlOCyRZY2OaGSGjOBMxO1UW+C0rjhomF6ivOzFSr8E+sVtyUlNlbP/v6TufLFaIyyM9LxCnCt/jQoaWzbodLiQNFH59Fia1VsOJbMRqWqINh9xDo455Xdji0UD2XYrqIUTYkxTjHopsis5Pod9d6nwW74P1Rr0vDnijCvUOwH/6Z0SDzcexB1zO9xy1uP/1gRK6MZs/InApEb5I9Us/hOepThFvcbJUhGdmmFsuy0LhM1TNESL3IeHoPBrdECBGgNDcG53CIN1rCYe6QG0vGoMthtUR7MsdwH6qf21pHeiDMxm4R/mb2ddKrO0BEjCOCAlAeMSs0S8kuFDJ6yT1Y7uwLyTfPTBAeyRqKG6lcmt4KMWmCMIckf0V2OEojg==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(41300700001)(2906002)(66946007)(15650500001)(8936002)(66556008)(44832011)(5660300002)(6916009)(4326008)(8676002)(66476007)(6486002)(6512007)(478600001)(31686004)(6506007)(53546011)(6666004)(26005)(38100700002)(2616005)(316002)(83380400001)(82960400001)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?cFUwb2tnYzVvYkp1d2pUeC9FenRYLzZ6N0p1YjlTNkRyYlBaV0llVzF5UGNi?=
 =?utf-8?B?SmJTbGt2UzUrMVpEMTVaSWVsQ2lzclhiWWtXUHlmZER6TG52SUM0VGlGT3Er?=
 =?utf-8?B?eUt3a0FrY0t0OGJQVzQySHpXNE82WURsQTRQaldGQzA0eFlqdjNQNWFnTGdv?=
 =?utf-8?B?M2JmUkk3cXVMQllMUlphQVI3OTZiRThScU5qemcyb2hpcVBtdUdZaXdlV0Zl?=
 =?utf-8?B?SFlpd0xwY29neDhpRjJlZlRBSGpKRjcvdUxYdFF6cTdMeGQyOVhyUVNyTGdy?=
 =?utf-8?B?eUpBS0JnWnQ2WXBYOEFyWnFUbWM2RVJweitVL25PRHFWMDE1aWJseSthdGZ0?=
 =?utf-8?B?a3lPYUxaZDN3eGF2ZlBFbGFSMElGZUQzZGxMelYrMElhelp0VnN2QkxtTFpj?=
 =?utf-8?B?cWpnN253MmI2NTd5NkZ1VXVvTE5rMFVwTGw0SUZRYzFoYVNLVzVMcnhPczlu?=
 =?utf-8?B?ekJMaXZZalhUeVVTZkFNZlpJVEZrb0tnVDVIK256MHJkQ3I1U3F5VHBidEVT?=
 =?utf-8?B?WUhJUFd0N3RaNnF0aWloTGtFOWVjVC9YZ2o0TnpxUWR0Qk1Rc01aQlhjUFFE?=
 =?utf-8?B?NFBSdElYVjhOb3BiNkx0MFA3SmJKakY5eXNEYzAyOFhqQ1NyQzdUVkhDNnhW?=
 =?utf-8?B?ZitXK1I1THpmV3lYdEhERXB0L0QwY1MrREtPZ2NmbVpwa09ENURHL2gxSURQ?=
 =?utf-8?B?OFVNUmZNcUtpMUFiVUUyRG8xN3RxZHlCWkVQZllqQ2cyTlZpb0dVcHRnbWE1?=
 =?utf-8?B?c3ZnemIySGdFLzBkZzZJejFZUFc4Y2UvTzI4WXcxbUU4NFZoaXVVM2NiU3VP?=
 =?utf-8?B?eGFoNWFGUC9RLzQ0QzZHelhieEhXc3B6Yk9WMElVS2s0V1hyUzhOS2R1WFBw?=
 =?utf-8?B?QlBUZlUrMkk4V24zdCs2T0xQOGlyc0diSDhIa3VwVTJPTHkwT01NVGNKVmRE?=
 =?utf-8?B?VG1UbVNwVjh3em1uRk1ZNi9GK0MrampHb2I4anptNWQzbVo0WGZ1UXN4c3cy?=
 =?utf-8?B?bTVDWlo2UlpPS0NwYUMwU1dsZThUK1ZzWG14aHFFanhaOXlZZUNCcUN1Wmhv?=
 =?utf-8?B?YkM4WVZHL05LL1V5Q3IzakovK0JRYTZ0Tnhxd2o5bzFtS0lvODEvZFF5aThN?=
 =?utf-8?B?d3JLQXRIUUZ6WXYwdnhrb1NycG9MTXVjUm90RTFESVZZLzNhdXdqTTZNUXl3?=
 =?utf-8?B?M244cXIzc1J6OTcyRHpzSkZSWTlNOVFnQmhrd2g3a1pFK05QMExSMkRLaUQ1?=
 =?utf-8?B?bEloTTNldFk5VHFER1FPMWMwSUdDYkhzZ09CZzFsZ3RROXV6T1VOeUsybU1u?=
 =?utf-8?B?UWFhMEhrSHpCRTI1R3pjQ0lyV0FsR0kyOWJHUG83aS9DZnU4T1BGa0dJeFRD?=
 =?utf-8?B?d3k0d1FKNzhkMm0wYzJ2ZEZVT1EvYU5uVVZ0L3RhcjNaakFubzNZdHFUcDBB?=
 =?utf-8?B?RWY5TTRkVytZbmJHSXhOR3pzZGxTdnpNeWZETXk1a2ZXdHNPSmxIWW94VWxQ?=
 =?utf-8?B?QXJMRG5MM3FBQmREVExBK1JEZ0M4VlpuUmJzaUVpaUFvU2x0YmdZRnl6d3Zy?=
 =?utf-8?B?ZlpFMkZQWDFvamlvZ1BBN1lxWDhCSVluUDAzOFY4SHN6aldnUHpGa041TE1X?=
 =?utf-8?B?aWd1U2ppYTBKenJoaTRwdzcwQ2lnNWVxR2Rvb3dzMStpdmpUK3RWT3RsZkZT?=
 =?utf-8?B?ZWw5Y1dLVlRLN1Y0c0dlT2dZRTdrQmhhK3V2MUN3QitKOW9hQ3hZSlNxNzFn?=
 =?utf-8?B?N1JFU0dpTkN0cVhRbEd5ZG94SXVYeERObHFrOEFCZUovQ2N6YkpCbCtpK1Va?=
 =?utf-8?B?MCs1NzZMS1hOZVFvUWs2VkxYdDlRb1h3LzVGMm1QKy9JWS80QkdhcjBVTGcv?=
 =?utf-8?B?OUk3QWVwNS90TU5qdS9Ob25HdE9ndWZFWE94S0loK1VCUXZvVGVoRXhramZs?=
 =?utf-8?B?SGx3UUcrb29EWDh2dG9lcmdWZkdSOS9nSHgvSFZKQXlWVU4vTlgrUWtCY2Va?=
 =?utf-8?B?R0R1bXhEYm9BSTNleEpnYVhZMXlWcms5S2NYWlZPQ0NtbEQ3UFlzdUlvbnUx?=
 =?utf-8?B?dXpEZENNT0ZpY0xmOEpMRlRoYkxHdG9QR29FUzJiTG1ERHg0NUVlUlBIa3RR?=
 =?utf-8?B?em1vTjhUTTk3Q2VieGtCeGdsL0NFSWlWd0NtRm4yU1duRjRvQ2NScC9Ia1dP?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5ff9f8b-e36f-4d59-2918-08dbc64ae034
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 09:01:49.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dMT5ue3ap8KkSCm/ZyF45sucsIYgn6VTbjkOXjJxAdQgKYVvgTRTqRhy9KOnSpvL9FxVV2Gy7w7KEJQ4r9zyloaK6eb9HqQ0aTRlyA+YV5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-OriginatorOrg: intel.com
Message-ID-Hash: DNXH5T5HFONFSUI6SXATQ2SRI3JWFDJR
X-Message-ID-Hash: DNXH5T5HFONFSUI6SXATQ2SRI3JWFDJR
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNXH5T5HFONFSUI6SXATQ2SRI3JWFDJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-10-06 10:44 AM, Takashi Iwai wrote:
> On Tue, 26 Sep 2023 10:06:19 +0200,
> Cezary Rojewski wrote:
>>
>> The patchset targets two intertwined topics:
>>
>> The driver shall poll SDxFIFOS to ensure a valid value is set by the
>> controller after programming SDxFMT. Due to amount of users and
>> limited-number of configuration available in our CI when compared to
>> overall possibilities on the market, the check is non-blocking.
>>
>> Second topic relates to stream setup procedure. The procedure differs
>> between HDAudio controller device revisions. Right now those differences
>> are handled directly by a platform driver. Existing top-level
>> 'if (pci->device == APL)' could be replaced by a abstraction in lower
>> parts of the code instead.
>>
>> With that done, the two users are updated accordingly. In avs-driver
>> case, this updates the flow to the recommended one.
>>
>> Changes in v3:
>> - fixed issues pointed out by scripts/kernel-doc
>>
>> Changes in v2:
>> - fixed ->host_setup assignment in patch 02/04
>>
>> Cezary Rojewski (4):
>>    ALSA: hda: Poll SDxFIFOS after programming SDxFMT
>>    ALSA: hda: Introduce HOST stream setup mechanism
>>    ASoC: Intel: avs: Use helper to setup HOST stream
>>    ASoC: Intel: Skylake: Use helper to setup HOST stream
> 
> Sorry for the late reaction, as I've been (still) off since the last
> week.
> 
> Now applied now to for-next branch.

Hello Takashi,

Now I'm the one sorry for the late replay - I've found two new things 
when fixing the debug message (reported by me in patch 1/4).
- null-ptr-deref when assigning hdac_stream (when type=COUPLED)
- azx_dev->fifo_size is initialized incorrectly

It's good to debug things, you never know what you may find!

May I send v4 as a collective update? It would address the two above and 
the false-positive debug message that appears when code-loading AudioDSP 
firmware.


Kind regards,
Czarek
