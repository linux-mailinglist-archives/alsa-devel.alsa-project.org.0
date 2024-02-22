Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C42EA86055B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 23:04:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63259820;
	Thu, 22 Feb 2024 23:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63259820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708639481;
	bh=DqX2bv6k4NGko7hWnu+sDUgTZRpqtRkyJTKfRMDE6vs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qzJXPJRTqYoeg008C776LAsKhznpICdc5umyIhLhJh/bJIHRSxAypfYYgpZs9AiJk
	 lfYGTu35ORO9dPrT4YVSOu3NYNxuTSafieVzld2wKEGlyeg3+FS6NAmgRCXxKbqITq
	 kcOdrwyiihVyKsH3IkjaHgDcmkPG2wqSBS73mBNY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216D2F804B0; Thu, 22 Feb 2024 23:04:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1041F805A1;
	Thu, 22 Feb 2024 23:04:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CE7CF80496; Thu, 22 Feb 2024 23:04:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4422F800EE
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 23:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4422F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S7HVFoOn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708639429; x=1740175429;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DqX2bv6k4NGko7hWnu+sDUgTZRpqtRkyJTKfRMDE6vs=;
  b=S7HVFoOnRmPkNy37n76Ht3zsYj/iyQf1a2gfhDroGYMXz2UqRoQx2d5+
   0cQWeL/MaWmdBnGKOht6yohBhgwGD6niK3BeMDUqX/U3rtCSqpvh5cFuJ
   qTAt1Dvabuo6YYNNP9R4T8YKPgDwXzoamK9uEZipfz61SbCoSRWEVLwLM
   GIkeB0kA01fq6xz0yUvo+z8+zVP5mCea78ci98JPTRBdv7tiBGLtz4lQK
   cwyh/NkY5ZBJi3qzWF/fqNMVltRs9etsGMMTevXIADtyIBBkMShK9hI+P
   l19yjVLqIn5EdG3EmwD2j+Beq5FHHjlpvA/3tWIceI4aob9rqs109K/07
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3061000"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="3061000"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 14:03:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="28776865"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 14:03:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 14:03:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 14:03:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 14:03:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBs+Q8ChEUt6VHNiZdJGmEzcfTYDHelrIV2qK2Se70G3kSEXvul5fX8rMNsOB/xoFYrn2iNnRbEmqfvK22atq9BbRV79Q4UcF5VQf2o6f9H1j1tipo3y49kHT5JhM7W+7Vr7BZqDv0BCkAgbTT1ac+r74Tv2EuTjcdRKO69+VmWW+tY9nVH1wjCID8nGc1dGFXdJJOrHRUwzs5rDhrouOIV8TMoT3bgmjqFqVB+SkDUJxT+bl19EU/nN4oGIW/PwqFPIEBv6hVYUij1+s3zDPfEhTFRWzC+zqyV09YtQXObjYeE7D1qDQfJfDjyJ4v67hryqv1O7tbMc+j3YauOR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0ctWq+92067oyQs1Bt+2HOhuTeZAuVZTAcYSftgA0o=;
 b=O4zxHuQskICTI/jS8qp9FqJ3FSV7wfFK4ErJWGCCvn4QPcVKfcDwiX4Km+DAdehj60EsV+wBhOIbZ+zSUG+ix+wHW+bgXbioO/KtNZdsZNI9cmCOVY1c3+gXe6xfdV22TsDZ5xb27OBpq2I/XgKUwxwyU9+voK6yPGOd4E1qFbOI178eBpJzP3ud8ebUo3fB56BIp4hpeiQOdZqHNOP/K0IMZEAqhXLDYeJ48Mn+/aoL/t5A1EeBwawVTlSiSlxdhASVDAcS5ZNw15w79UQvcP4dETiytk7ylc1kdJ/6ryhsq5mFlqYaLflyiEQ0TAtIEqMgPzvgcPJtBm1H5dGxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.26; Thu, 22 Feb
 2024 22:03:15 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 22:03:15 +0000
Date: Thu, 22 Feb 2024 14:03:13 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>
CC: <gregkh@linuxfoundation.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Marc Herbert
	<marc.herbert@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-coco@lists.linux.dev>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: <65d7c4a17f351_ca001294e8@dwillia2-xfh.jf.intel.com.notmuch>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
 <CAJZ5v0hmD+7iSKKexpUccvMUtjNpd9fHo3vRrshD_s=rb5Vq_w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAJZ5v0hmD+7iSKKexpUccvMUtjNpd9fHo3vRrshD_s=rb5Vq_w@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:303:dc::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d958e02-b7a6-4f92-8bb7-08dc33f211f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 cUrBXif6w0B9Jy1Zw4p9D4N2ZaNhGgQBAXcND8aBISpWo3N3uA/HHd9LuP/5rCdELrJlYQ3o6LvBcroYGy84Mfgf4giTJ7nKhVNGGK1xNq/3cp+AXjtiE+vMCDnkqvFux1djEqZO/yZYiQy3CijKMSKNgL2gRzum3NygxFUsfwnt6yLM2XG7R0deI5K62vj+MV4aKJjAaKmiQMWi+Cp3nz4B1sw4VsDhkLD+DIE0n6qYqcI12QPwC5TntYlexXiZnJbQFjzBf3itcJ+QBZCy/AElR35fFkI4NzNbXnaD9KrUHglWB/rnx+HPr6F9vYTa2Fpq9sqmNmH+yD/uePuI0rxJz/ciNuwG6xlDFmYr84Xny2InWJ9yeIWvJTiPxjLSmBPca6kFcFzWz5G4xc8PX/Yz8xsvjNELkvtcPMhtyffzeNn2YFRw+sJTb3chdAOpOEI7Kx8X+HPaJUGCfuuNhJN8Q23d+4GSz8u9sUN4Igyofy3ktn2TKcAgp3dua38NcDUkjJrk4D28m5gYRSuPjA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?ZlZXNkhxVXVLdUlqUThNNmJKYTRCdGtwcExHSDJ0bVcxOGNRQkg4NkVvVkZX?=
 =?utf-8?B?Rk9ZN0w4ek5xZ0xHTlkwSFo2ckFneDJBZ3dyc29VRVRLMVdyZThQNERDODhK?=
 =?utf-8?B?NFd6SjVVQm9KNERzbDhmb3YvMFhJeC9ZcTFaUThtaTRpaUUxellzdkFCYnBD?=
 =?utf-8?B?alB4RjBuTHkxNG9MaEEraFVrcDBlWllQbU9BVDZBWXF3TEROUDE5Wm5SNjln?=
 =?utf-8?B?bi83Z25qNFk3NzhOZDdOSVh5RTJENDM1aVNCYjc3WVVSbWhBazkveUhRNWtU?=
 =?utf-8?B?M2JKK1k2WDVtWXZHOG5rZkdvQjJtc2pKYkNtS3lWcUpvWkxSVzJKVmwzZXZ0?=
 =?utf-8?B?NktLdEpVUmE5dnpoWWhMLy9kL0JhRUZ6N0ZPZENhV1BFVWozc0lJaUdTVjZu?=
 =?utf-8?B?Y2tIQ0RnU3ZaeDB2eWxZd0tYb3ZGWHZLNUxvU2J5emQrYXBoeWFveEFLV0F0?=
 =?utf-8?B?clpPdllWUVpPb1J5MTlLZW5SU0JkbDB6dFpzS2YwRjg0YUJvWUwvWElpNWlh?=
 =?utf-8?B?Q3N3d2IrT1ZFOUtjMUd0MFE0bWdVeVRLOWczWEFVQ3E2MmNxRlhDY2t6aU1D?=
 =?utf-8?B?Zkl4U0cxY0tpYUZWVDRVUUlPMFFNOGtYeW1CaTVlblZmMTNpT21JR3RRSjRm?=
 =?utf-8?B?Yml3MTJrb3pVamtxUDVGQi93WTk4K1F1RHVhTnRyK1FMNUlDQndTamtKNmNV?=
 =?utf-8?B?NGVPTXhFUHcrKzRHYXVNNG1Od3YyUGlSNVFWdkhHYlh5UXRFWitndDJ4cHdu?=
 =?utf-8?B?bXJpekVPaE9tUmMycGR5SmdJSWd1Wjg5TSszdnhXbmRvZkhSRzVkZVBpYmsx?=
 =?utf-8?B?QkJGb2JsajMxdzEyK1VwdnkwOHVSVTdjSGVPOWlXNStyNFBNWUpwdTIrRmZU?=
 =?utf-8?B?SmdyRmdLYk5sbE0yRlN4UzdGTE1JNytqQ0pJTERLVjBLNWZBc1lFd0ZwZXpE?=
 =?utf-8?B?SWh0Ylg1VEh0Y2RsOWRwTTRuc05FNHlnVE9VMFkvNXlzUHVockJCcmwwMHVh?=
 =?utf-8?B?Z1B1UjluZDN1TUlOTmVXakJEVVB5V3ZQRU42OEpBMmRxWVFibGkwY3luOG5a?=
 =?utf-8?B?YzV5UmMyb3FsV3VVVnNkKy91Tkx5dytmczhhZ2lhQ0I3RmFKSXpld0dmY2w0?=
 =?utf-8?B?WmJLM2lyNXlhVEM5QlNTMjh0U2ZYaHViekQ4MFVVSHBLS2VzT0c0UHNIdkxl?=
 =?utf-8?B?N2JlLzZCSmMxcnFZNjBVaHUwa3JvVUFIUlRPY2tQUldvdzM1cE11WmdBU1Bs?=
 =?utf-8?B?YWZvWFlBVUkvcVB3elYrc21INkR4Q1JHa05ZaDFrRlVJd2xTRG1ST0pybnQz?=
 =?utf-8?B?QWtzTTJrYXFpWVNPck5kZ2FoTzJvZndNbEJ1OGZvZWc1K2lyWFZHalNxOExX?=
 =?utf-8?B?NWNqTHNPZThYSlFrWHFZcWNzYmFRY0EyOHM4M3ZtYld6ckl1cmRGa0VOeVBx?=
 =?utf-8?B?NVF5TmR6VTMxby8vTzRzM2pkK3B5SnI4WHdYb1ZNQWk3TkZaRitGMkEyZTNV?=
 =?utf-8?B?QWtpcXpUUDhaRFg1SW1OUWZoTTZXcGxWS3pYQkVCdDFhNDhzUFNOaERaOWtM?=
 =?utf-8?B?Q2tCajdjNkNCNFRBbGpjc2cyWHBMVlBwK01SdkZacDhxMWJVTDRkME5JRFEx?=
 =?utf-8?B?R0htbEoxR3kwNGtZVlhFWTBBbVBlVU9yOTBzb0pCaDJvY2tPOGJUdWE1bFJv?=
 =?utf-8?B?MUJZd2xlbmhhSk9ma2pndW14L293Qld2YmxGWEZYTkx4QVJrbXVCb1pxdW9q?=
 =?utf-8?B?a2NFSEwyTHV2K2k5VEEwM3dWaDdyZkNQV25ZZW1wMU9vUW0wVEJWTW96Ym11?=
 =?utf-8?B?S24zMWJLcU10b0pXdUxLcldXQU1tTkMxOWlTOXEycE9VTldmL1NtdFlVaXFQ?=
 =?utf-8?B?N0gzcS90eFJIaHF6b25QcTU4OFZEcDFKanBBTDA2TExRbFp5MGxGMkVGTTVU?=
 =?utf-8?B?bHFrVEkyRDlLZGFzTzRLbW90a2xIS1dnTE8wSVl3TElPamg4YTZieHp6MVNY?=
 =?utf-8?B?a0lLNmhHVEdKS3lQU3NwRUhaVy93TldZUTJ6T3dnUXAyMzNKMWhrejZ4UUlV?=
 =?utf-8?B?Yk1CMlhRdGdwYmhKczQzSkVIMTJsWkdYSDMvSEZ2UE1TQmJyc08yTW5pUWcv?=
 =?utf-8?B?WkU2akltNTFRK1Q1V24zQVdnVVc5MG0vN3cxVnFBcmg2aEt6QnhtRFcyY3Bx?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d958e02-b7a6-4f92-8bb7-08dc33f211f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 22:03:15.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nitWXAvOupNbvTPBZ4fLBzCMMgYnfFfCugYrlBe3XmL5JYtib5rxLw4lt4kAIFbRTVVa6KX7Cp81vu5YMcKcrhyEi6gMEs/m3emn0/jDKgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
X-OriginatorOrg: intel.com
Message-ID-Hash: HKRM4SX2XHRVV5AKGMO3VCHBQ4XEYGGH
X-Message-ID-Hash: HKRM4SX2XHRVV5AKGMO3VCHBQ4XEYGGH
X-MailFrom: dan.j.williams@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKRM4SX2XHRVV5AKGMO3VCHBQ4XEYGGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rafael J. Wysocki wrote:
> On Thu, Feb 22, 2024 at 9:40 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > It turns out that arch/x86/events/intel/core.c makes use of "empty"
> > attributes.
> >
> >         static struct attribute *empty_attrs;
> >
> >         __init int intel_pmu_init(void)
> >         {
> >                 struct attribute **extra_skl_attr = &empty_attrs;
> >                 struct attribute **extra_attr = &empty_attrs;
> >                 struct attribute **td_attr    = &empty_attrs;
> >                 struct attribute **mem_attr   = &empty_attrs;
> >                 struct attribute **tsx_attr   = &empty_attrs;
> >                 ...
> >
> > That breaks the assumption __first_visible() that expects that if
> > grp->attrs is set then grp->attrs[0] must also be set and results in
> > backtraces like:
> >
> >     BUG: kernel NULL pointer dereference, address: 00rnel mode
> >     #PF: error_code(0x0000) - not-present ] PREEMPT SMP NOPTI
> >     CPU: 1 PID: 1 Comm: swapper/IP: 0010:exra_is_visible+0x14/0x20
> >      ? exc_page_fault+0x68/0x190
> >      internal_create_groups+0x42/0xa0
> >      pmu_dev_alloc+0xc0/0xe0
> >      perf_event_sysfs_init+0x580000000000 ]---
> >     RIP: 0010:exra_is_visible+0x14/0
> >
> > Check for non-empty attributes array before calling is_visible().
> >
> > Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Closes: https://github.com/thesofproject/linux/pull/4799#issuecomment-1958537212
> > Fixes: 70317fd24b41 ("sysfs: Introduce a mechanism to hide static attribute_groups")
> 
> This is not in the mainline, so linux-next I suppose?

...or at least it will be shortly. Greg notified that it is currently in
driver-core-next:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=70317fd24b41
