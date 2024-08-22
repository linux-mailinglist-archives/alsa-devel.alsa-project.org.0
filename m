Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9FE95B225
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 11:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E4C5823;
	Thu, 22 Aug 2024 11:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E4C5823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724320110;
	bh=QuvsaML4Km2fYy1uieofxMeeT/jzCo+fSdZyatboD3g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QKvK1ca8r7itvEPYrZqxGYhtYQ5W+ZCLYg3Twy7NDC6/Id0zEYQFVEawYNy1bzARC
	 TqTXUQ7NRzpIQSitGcfhISOWHhwLmdcEJk4CZF6ucGmGzBTjMfr/CK9QA/4Drl02Nh
	 Sw+9qWZriGHP8R7ZVwyS++TYG5o6EAnsbfUs0DD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 321EDF805A9; Thu, 22 Aug 2024 11:47:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A08D7F805AA;
	Thu, 22 Aug 2024 11:47:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC76AF80496; Thu, 22 Aug 2024 11:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFDDAF800F0
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 11:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFDDAF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V5AOlMlM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724320064; x=1755856064;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QuvsaML4Km2fYy1uieofxMeeT/jzCo+fSdZyatboD3g=;
  b=V5AOlMlMmT9HKGTqhsCcs96pzzvcrBzXZHE3zyPubDMldiiPqP5h4sje
   pDleEOehB9VnHVoTKCh27BA6qiMzWP7n6PKNaddcECqfIL35ieRnKpEqc
   dXGUi9BCCHdDke7gGUdbAB9Sl8pCKPPZnEvrjWvTY4og0ocT/Ze8ZBBR3
   oJ1sUurF7FGRqCeb4D1Lp/+EuMHyDLCwl274Cf6cPq61iYZxR6ZigMVM0
   hhlWzzwM0NFWhGC/3J/zzFHqJBJHufc8BuO9fQQseuzopkSdt1+Vg/R0W
   JRweQvFoLqHUQ0Zy6wHrG616cnsEBd7bIIjJZR5CoQb2nExCEroYqVtrt
   A==;
X-CSE-ConnectionGUID: zZL09iUKQHWJgwP5coqfJg==
X-CSE-MsgGUID: /iIUctnUTN+P8ivw3BSBpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33388606"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600";
   d="scan'208";a="33388606"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 02:47:30 -0700
X-CSE-ConnectionGUID: YSsrEx7TQBSohfemss7duA==
X-CSE-MsgGUID: 4s+XkPxvSfCeszaYxJ4pqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600";
   d="scan'208";a="66077163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 02:47:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 02:47:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 02:47:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 02:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJgGhxUanKdzx8JOkvhTgz3KT8Q4bBCO0agNFjGHPNgElPAXeCU0V0KSf1MH3XZctqGl851he5bAs+r8giiebFnjp194RV/gBSP96gNhai37QIUIpuY8Z9Z1SoXE1G1wuNfNqPqcY1ZfHk5oSTzBnFDXjhGaoXqdytrP4CPYbzOfuzzA91s8pO6wbvbE8uoPMwOIVTRTwOLS/WZj5oSsCHcKtGcgI9y+1raQ3XOjzqdLI5peR4/Flz5jEYxOz5MMW2l03AtrFoKVGYZJzBY8Z15AkGMv7d2k6yeZaZtvMEPsZjaQc8oR6VdikJNHVVxhg8g1GxJUl7rRmuXJIFgz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWN9CuSi14/ef/3wT7ImVhXDygq9eF+KevZOaT155T8=;
 b=bp2jPl6L87866QeY/iGE5H+MwjAisRoVxr+8AGc14MmG+5Lk0EtAKOC2n1IBUbmPtQJc4XENZCtOK9gH3SxJ1fWztF0DE/YK+0MdH33PY/maLlVgHSGBIozEPcT4RR/Z3Dq9bdBthhqjoC39krE9nTxI06hFXrfswRwESPOowd8slD72nHMtZ2UEcgyzPUvMnreqB1yYUKebXyy8fUOvCNg/rfCtoHIxHKrHAJ5ou+C+tRrlnGEZZW51V1oUnXwMF9G2iZiVu/+gfT4W2KD7pHDhVHsoqdTMVc60V/O24SPijDvA24M+KzpFdR84KAQ/GLaVrN85GVYv+IwE3srLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 09:47:28 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%7]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 09:47:27 +0000
Message-ID: <46e1485d-108d-4efa-bead-061262eb43df@intel.com>
Date: Thu, 22 Aug 2024 11:47:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
To: Jaroslav Kysela <perex@perex.cz>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <bfa97823-d638-41aa-b972-0efd00a6091a@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <bfa97823-d638-41aa-b972-0efd00a6091a@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5ed194-8679-403c-c7ff-08dcc28f6eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?dEUyV3lNUUFtbmRMQVlkT0FuMmdEdm4xRDd2bm1Ta2graVA1Q1dxSGJ2WlJs?=
 =?utf-8?B?Si9SdVFwS0VOSEc2MGVJSWR1Y1I2MFgzbXM2MTBWMWw3VVJLQ0ZxeWhFSWpl?=
 =?utf-8?B?OVdtNlo0M2xyb0JSTEVrdVBxWGNORzZkOU1reXlkSmhqcDBVQjRVWkJVczRB?=
 =?utf-8?B?b3NBWXpCZ1l1bHl1c0ZZZ3k3U3lyYktubHIrcWNBSWZJTUI1NkxkWW5RYXU3?=
 =?utf-8?B?alYzcUhVRWNadzMzSnpTUFcrek1BVkFpMDZsOWcrZkhvT2JURFNaaHgwcEVr?=
 =?utf-8?B?SnFrazZyaWY1NEs2WldCTTFkSHpSY2RTSklUeHNPeGVlY0ZvMmlsOGhxNHd5?=
 =?utf-8?B?L3BHUTRGaVB4VS8vZDlyUUR0bVp4N09zSktIRlBjdWlNS2dqbFBXVGtWdlJP?=
 =?utf-8?B?MHNxczlRUEw1SDVpV2RLSzBSQjVTbUxKclJqbzFlbU45YUN3ZHB2bkxuLzdC?=
 =?utf-8?B?VUN4NjN4eHNBc1lSZDNLcmVnK05Sa2VxYU1NK1ljdkNKRDRPS2xDMTE5Mjg5?=
 =?utf-8?B?Z240NUJxOXlwcjJRZjFaaXN0YkdHWGJIS3lrZlduYjdXWjYyQTVSMUFjVUoz?=
 =?utf-8?B?dnRmcytMM2V2QlRjTStRR0NyRkN1NCtvblNHWFpTVGYzc1l3QTdNWnMvN1B4?=
 =?utf-8?B?aU50ZXNSWVE2VUQ0S0hmcTJPYzg4K0Y5VlNBMVNHY3NMYUpMS0lBNlJQY0NU?=
 =?utf-8?B?TjYwVEZLdi9hbGpYM3BuNzVNRmxWQjNPN0NXeTVzTFNqRGQvSHpsMDZ2VzJv?=
 =?utf-8?B?ZzBlYTJYeEp2TGlSdFNPZjFxd3EwbDAzdmUxVFppVzFseXkzM3ZvaVJ1ajB1?=
 =?utf-8?B?aGViaEJBUHRDR0JjS1FYaDFsb0VXYkgxNGhzOVJRTmkyQmREVFROOFUyT0lI?=
 =?utf-8?B?RVNQZHRTbnFpSS9OV2VETDdsbStQZXl2YUluRGRyVmpqSFd0ZmorVllicXI3?=
 =?utf-8?B?ckc3bDlHcDJpN0JxejFWWklOSS93UzlJKzBydjl3Z3NkYmpEYXU4TFB3cElW?=
 =?utf-8?B?KzJlaG5jcTJkZ3BCc0FRYmV0cHNjdm1DQVcvdGxLMjJnTWtIQVRta0JvYXpE?=
 =?utf-8?B?UzlvclpUZ09UUXpkV2pjQTNodjRlenFUK3JwaExVVDVDODBUT0dQMEMyQS9t?=
 =?utf-8?B?NVZlSXNtZ1czZGRCb2IxS3JCOHVsazhGS01NOWt3a0hIN05WaGlYeFVOemVO?=
 =?utf-8?B?MjN6WG1ZQVlSZnV2V3VRRFBJNDFrREp2MzlZTDN2QlVUTmFrdi82S1pjVU5t?=
 =?utf-8?B?dTVoRHdyYkNqS1I2Q2FwWlRpckhqYjZlME4wMERrR1gzWFNkNkR5T0U2ZjFm?=
 =?utf-8?B?RG96ZGtuaDN3WmVuUlFVMGZrKzJUdy9BOVJ2aC9uYUlZbkE2Tm5oWG52OWVZ?=
 =?utf-8?B?b0VKMHB6Vi9md1FiVm9WcVRqLzNBNFZTTjMwSlJEZTFDdFpld1VuSXl4Y3cw?=
 =?utf-8?B?cU9kOG5nQjlSZ3VSRXRTRkQrQ2p2b1o0Tnk1RXRrN29wbjAzNDR3NU9LR2V3?=
 =?utf-8?B?QlZoWXlKcktRUTJCdEJrbExaMkJCd3I3WXlkb1lDZ3A0eHF6VU1ReUk2QXJY?=
 =?utf-8?B?YlZRdVJLSXRJaXk4d25ZQmlBV3hsM3RtWVFhT2V3OVFpTkVMZm1kM0Nscmk3?=
 =?utf-8?B?SFkreDJlL3VSYTVuaDhaMFpXVFRLR0VKK3JNOEt0RjJGY051U2kwYXB6K0V6?=
 =?utf-8?B?U29VVFNZK2Y5bzFBK3FsaVZDZkZMODE0KzRNc2xrdm1nQzVwTzh2TFJQRExC?=
 =?utf-8?B?eE5BazNLLzhLV2ZBU3FMYVRJcElaYWRSSXRqd0hhRXZzZVRDVEp1UVJCS1d1?=
 =?utf-8?B?MTF3cndmMHFXNXYzbW9Vdz09?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?bEZSamorZUMvQ0RYODhTNlJRVGxyRHBseWtKTXJKMXNYaVc4aWNFd3Y3RXVR?=
 =?utf-8?B?dGo5NEtreFc3SUM1eFl0Y0x1M0xFaUN0YWxPdXVPR3pZR3ZLVVNBcitQd2Nr?=
 =?utf-8?B?dG5DaTZqUDZ5YjZGZmsxQ2dPNzJqZlluRHNrZEZLUmszanZadTZwMEExdzln?=
 =?utf-8?B?VWp6b2xYME9SQU5xRXlna3gyRE5OQzNQWDg2bVEvRFhuV0R1RHRqRXFCSGdi?=
 =?utf-8?B?VThXRER3TzdsNU9zZFEzK0xBaENaZVAxdGpIT29rZEwzOHBWNEJRdEt0UmZR?=
 =?utf-8?B?WUcvNlhVRnY2REJOWnl2bDVJMW45RW5pMzJVQitRZm1oRzErTGJVZzBOTTdm?=
 =?utf-8?B?dlRLZWVydWt1SkJFanN0TzE1T01TOWdEK2NjRmtHUUNReFNabDZ3TUd1MnAv?=
 =?utf-8?B?VVBjcXliWWFZdmlRbHBpT01PcUN3ZWd4YmwwQzZxNVp5Tk1mdlFtYWJyMnhG?=
 =?utf-8?B?OFdHSmRSZytLN0MyNDBBWGdsT0NsaDhkRkJzRUVQeDA0UjNwR1lDVVpGWWhp?=
 =?utf-8?B?YXgrKzZJN05RT3VoMkhrVi9MN3UvZmZ4eU4zKzZGR1RCbGZoZ0I2dG5VUWox?=
 =?utf-8?B?endDNmFuaEsxT0xpTTF3Uk9Cb0dxR0ZDQU52WEpvZ2FKeWNndDhPdWZaNlp6?=
 =?utf-8?B?RktFcU92YS9STmdWMXl4SVQ0QThoSXA2eEhJZWNUWmxtckJ4dk8rSitRZTFk?=
 =?utf-8?B?blJvc1JnSUZZbEVzYVFUZGtzTk5LTWdFa3ArUGNSRGZNc3V0NU93Y21tTGtM?=
 =?utf-8?B?T2pxcURZQ1JoaGpGdTlvOWlSdDhXQlJmVTd0WFVrSVNjWkNBdVpnVjZlNjV1?=
 =?utf-8?B?TUFHYXNKRWcwdERObng2R2lzSjZ6UmEyVFQvaDMzc0NodlRSQ1pheUdQRlMr?=
 =?utf-8?B?L2lET2dYTlkyUEloeVFLNHQrVlhwZmJ5aDdEMHo0aVUydjRuQ0QwNDhKdHNj?=
 =?utf-8?B?SmpaRytyMG8yaTRZcnNrZk5HSUg4UFVENnNZbVRjZEhDdGZsUHdwUkpWTDl4?=
 =?utf-8?B?Y05sNlFzcTg2SlZmK1hBUXlhNG4vb1NSQUxadXIzVHlybVRRQzRtYVBwSWJU?=
 =?utf-8?B?WElJcUlCbnNDUTVmcFVGZ01CWExJUFpsVnZMSHhjVlhtaERWQ2lzandGQlNv?=
 =?utf-8?B?QXpobkxvZkx5dG9lb1NCcVcrL2NwVGR3a3NKc2QvZEF3UTJqeThWd2d3WHRi?=
 =?utf-8?B?VnNLdDNLV1haV1d4ajY1YUVEZ2JiaW56UHlOcGxPR2xlREEyRXRxQVFWWEk5?=
 =?utf-8?B?YVhrVE5yUkxMUWYvbSt4Qm9tQlNyeWpRUjJjOFByT1JPUWFmNnZCUUkvc3RT?=
 =?utf-8?B?V2plQ0Q5NW4wMVpjV29GZkhnN0tteERSWGtTSzdYbnhoQkVEbHMwK2NiTi9s?=
 =?utf-8?B?VktnVTNySVBtNnprdDEzVlc4WW1Jcngvc1V4alkrODg4YlRadG11YUp4M05k?=
 =?utf-8?B?aGRhNktJUDUvbmkweWVPdzlUMXh1T2xqYVdUK3RjQ3ZoOERweStVNEdHRE5B?=
 =?utf-8?B?UzI1aEpmczQ5dXQrTjJUWHpCN3ozTjdldEc0eWZmQnM0SDhCYlZubEVYSWs5?=
 =?utf-8?B?WkdWbVlFRk94aCtuL2hQMjhDM3dXR1hiZ3RwNllXODBYQXdjOVorRHNoZi90?=
 =?utf-8?B?UjRuM0drcU9pQWJuODhxWlNPYmxPZ1VnT1ZxbE1xQ0ZMMWw2YUFhVW1KT0M2?=
 =?utf-8?B?TUdOcnlEMW9pRFhJb09VUk9jUlBqSjYxYkUrM2tZbCtlVDRDTC9rUkRPM2VP?=
 =?utf-8?B?TXhXbkM5b0FJdU1HMXBqMFZiaEJxRUtSWTI0bHJPK0cxTlJ0NEZqaWJSUHk0?=
 =?utf-8?B?SThUVEgwK3JVSTN6b3hHTk1BdllwRWQ5azBXTW9iNytYNW51VEszYjdGWGN4?=
 =?utf-8?B?cVI4K1c5WEtXMmlhVDd0VGdQa3laUVFydmtQRHB6ekFmcUJHalpBOEczRjk4?=
 =?utf-8?B?aTBod0d4US9YUldGVHFsdVhrWWl6U085TVZEb1RYcVo4eDVveWtqYW9FSTkx?=
 =?utf-8?B?RGtEZ0owK3pBZzZvNDdiQkZod01FeGkyT2ZuRnUwMThqUlpmSVoyOWlWdXNG?=
 =?utf-8?B?RTBwNnd0Nld1enhvTnprSHRFTi9vNWJYL0tlVjlscE9sUVhiYzdvcStydjdh?=
 =?utf-8?B?b2ttUEpnUDVNZ3lPUmlKV0tWNmk1SUF4TytsLzY5M2JFNXhPV0tINGh5MC9U?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a5ed194-8679-403c-c7ff-08dcc28f6eee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:47:27.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 saI/PE8RufwOY89cwsptSsjfG7sKCB+W3LNknZFn4SunPpn3R9s/hAOiuDf61AOVoBbuMkQr+PCjnI+d7Kpw1AQarkFmtY2Wlma/gOfFy7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-OriginatorOrg: intel.com
Message-ID-Hash: BA7TZVZTRRSGQ7WVUHQWUYUPVOQANLDU
X-Message-ID-Hash: BA7TZVZTRRSGQ7WVUHQWUYUPVOQANLDU
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BA7TZVZTRRSGQ7WVUHQWUYUPVOQANLDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2024-08-21 1:35 PM, Jaroslav Kysela wrote:
> On 21. 08. 24 12:18, Cezary Rojewski wrote:
>> Conditional PCM (condpcm) helps facilitate modern audio usecases such as
>> Echo Cancellations and Noise Reduction. These are not invoked by the
>> means of userspace application opening an endpoint (FrontEnd) but are a
>> "side effect" of selected PCMs running simultaneously e.g.: if both
>> Speaker (source) and Microphone Array (sink) are running, reference
>> data from the Speaker and take it into account when processing capture
>> for better voice command detection ratio.
>>
>> Which PCMs are needed for given conditional PCM to be spawned is
>> determinated by the driver when registering the condpcm.
> 
> Perhaps the naming may be changed to "sidepcm" or "monitorpcm"/"monpcm". 
> It looks better in my eyes.

I agree, "sidepcm" is a better candidate than what's currently present. 
In fact, phrase "side-band interface" is common in hardware environment 
and should work just fine here too.

Czarek
