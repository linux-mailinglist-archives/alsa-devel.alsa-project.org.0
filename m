Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E181B8A98DE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 13:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE12E66;
	Thu, 18 Apr 2024 13:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE12E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713440675;
	bh=Nq0fL7b1pSgdJyVExR+gB5OE00BdIrax+6XcsnliTZo=;
	h=Date:To:CC:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rAXxd/h1YjM6c0dCTAH2pF1HlyHPWk5zv4lyxSw90rS4qs77nIp/XntfYJJgBSwGM
	 zAHw1FzRNZYT5WKs8/eYKAxFsgCOuv72JG9daqHqtq4cgWzlLala2D0JnmxHCl/Dlt
	 amlzhpddeCP10L1CxeZ/Uk1CEDHMUaJYwhhO0aBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14E92F8058C; Thu, 18 Apr 2024 13:44:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0EEF80570;
	Thu, 18 Apr 2024 13:44:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AED23F8025A; Thu, 18 Apr 2024 13:43:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96F06F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 13:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F06F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aStstuGE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713440633; x=1744976633;
  h=message-id:date:to:cc:from:subject:
   content-transfer-encoding:mime-version;
  bh=Nq0fL7b1pSgdJyVExR+gB5OE00BdIrax+6XcsnliTZo=;
  b=aStstuGEzcM/xlecbweZbW6KiqyfVcB5bzjlM4Mjb8fnqpELt1r878rE
   JQKsA+C1EPd8b4T6Pl54wwE6MVBgaLJqi86PZeszPi39sgyVTuDfl7xJy
   ghOX+ypMARk7q3tgx5+9w6qTRTSw1+4gtPoG084MPRTPI42/aGPejhqoX
   VGwphG0PkGHb6gaawmnbcxFfq77ZIapBAeiWSLzHypsaNzMyWt+ZQJzRP
   Ndu8SxaPmCDfArryakw4Dq8J52uzAQKRoTcMtsyKkZpRgEJwPE2k1CeC4
   a5HAJhrWVMLsgsITQzYVxdI8mXhLv/RQPYTxXt1nzr5wdBcqSW8RF2Mf5
   A==;
X-CSE-ConnectionGUID: VoD4EQEBQf2KQMBDJ4x/EA==
X-CSE-MsgGUID: Vn+4YA4LQJO3jCn6aPx8Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20372313"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="20372313"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:43:49 -0700
X-CSE-ConnectionGUID: N6bUWrkvRjmqIREBKMRPnA==
X-CSE-MsgGUID: Q/upG17HS/iATYUXD0QTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="22939768"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 04:43:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 04:43:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 04:43:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 04:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLrMKXUFf8GnyPzP3qdO7QYn3JnponAkQjSjqSiGY1bficNMNLSB7/763sWEpgrK0x1Il8782UjH0nRvf48pVDAHPQr+wb365fbj0qqwNCpB/IbdSMu5few2HCaTcVg8Zwd15qg6TEWTf7tlDKh3HCRaiapKGQTBZlDTjcE71fPhSwTX1QM4y43Z/q62pEm1LTtXLGJHqQW8/fO9OlKQCSr49nRpSg2hYmrm+gLkSRgGRhhRpV1sJUlWS8/st4O4QvV7OkZGu+VrtCt5jPYGh8h4vTvAvAwlWVGJ0aTtGafNFJFVnojsAqavYg5TTaFQUoUYwuE6aEZUCclHaL9K4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0sv2myncijYaCJYK8snHEOFSs51Y6OFwcSWzEGtQW4=;
 b=NxWhmOxjPS5Mzk0M34K8/gNazPzr+caCzzQIVvi0VbaQFm/2SYCu35xq30NGaDCWUqwNTUFJMnLyWs7O1yeCNGk0wnrS+2K+m7CQ3XUbzxw1dgu0FdevuIe0/exYUy2b/KRo/BXSsBssAaD1EPCK34MsOCeyydlv+oWMIT/fKJkhutlq3ZEumjCkqMnk2cdITa68i6LeqOKMhTKQwvEqFjCsbVMw0w3BpyWUh2walXq/AGKnht/OZWvn6KUCTyl5WEFE5HkbqibOSBH/6qreanFWv0ykU79mn+W0Rnp96cCFRBTIELgpzBIfGkWLy74eI/Ofez6/KaR3w32XpVZXGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.37; Thu, 18 Apr 2024 11:43:30 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 11:43:29 +0000
Message-ID: <2d1980e9-f5b2-4c9e-9348-af69166d0882@intel.com>
Date: Thu, 18 Apr 2024 13:43:25 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Question: layout of a patchset dependent on another tree
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e30847f-a0e5-411c-9ea5-08dc5f9cc467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 YfOHnHRMAaByCkrGtqEX8bEmYE3Njqp/87fajyI8BBvvGVL/gsRR08BxmEIfceE5BexwW9KiaDiWgw/jfFwtlPOVofDyNvoZN2HYoJwid3IbSly7Dt7fYCmxlNZ4/0uGrO0n5y/jKDYXDXrgffnB9/YaUIhf+/FaQqMkWZJLjOQOqBHguh57bX/tjoK2wt7r/TQmakPZxkdgoqdtjm5u+FnYqksiErcoaWh7Wus60TClX9u8VziPeMD1z3QYfd1Ain6YsRrqAvBRs4Ps1E5kO61q9Gkk49svyif3Jhy+Phb67nIL9KAk8KyXj5/9R0uNXjoxh3Nt+lV+A4ZneJ/o1EQoqRlwL9jYzmOGc5Wz7KAceItRYjB64+8pYALEnegoDkbpFOPAvBF12jAlkOWI+La77GnZpqH2Uj46lo7AsYTJqtp0E9kC14T9nPZs/hb5RoPkfsO/wRz/4B+1PLuU/sP607qg7Szjq1qVJNpct9L272/eVTKosQc4UmESV/XsQKfHtGykbmLRhD+His8y8DEX1EznhhSSr6yFDbh3CvweOK8e5UyzJPLbtpQZBoOU+Dts3ymY8nInEKGc+4fSakrozdVZ4OqrCm6Hfj6XFvLAxzROXsZIftsFiPknV5Fj7ntWPs5boCmS9HxKPX4OkbKwGaMhzOxesmd+uo+5PXE=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?a1M0OGJ5TmYzS2ZOWVZYRWRsbFF1TVQxYlIxMWFhUFdvUUhvVUlIN2Y5R0V0?=
 =?utf-8?B?Mk4xdzUvcTBLbk45RFRYbFVONWJaUDdpNzJwcU1HQm8zVS9qNUpHRURPbXM2?=
 =?utf-8?B?YU5aSWdjT1d0amJEZXZBUUxlRmpudmlqcWJHb0V4cjdvQ1IvcVVuZHY0RTZS?=
 =?utf-8?B?R2FvdU5kS24yYnp0K0NEY0g0dzZ0QTRIUVBiMzVnenVHbThRZi9nNkRCQ1hY?=
 =?utf-8?B?bFR2ekVmTUtZZ2R1eWltcmJRTW5NbjV2eVYraFBFL3pYVDZ0SmJvNHVPN211?=
 =?utf-8?B?UFpLQS9yd2M4amFGYUNzTEF1RzlsWjd4NE1zU2pGQnIyOU1BVmhEamVlMlN4?=
 =?utf-8?B?UTNlRVQxOE50NTdyVGg1amhhdUZRSUM0cGZ1alc0bWhpSkFjZXBhVWRGTnZW?=
 =?utf-8?B?NU8xdm1OaGlYNXpNVHo2cHA5RmxTc2R6c3BJdnpDdGVKYitETW92T1R4NVdN?=
 =?utf-8?B?bmNjaVVDYnFlU0luV2p1OTgwM2dLRnJJTzFXMUQrb0pVOUZPaDkwMjkrYU5m?=
 =?utf-8?B?Tzd2aU5wbGRRNWtBNG9la0xIeHgrYzFXZ0FoaGMzajc3Vi9XSjZJQURKQWFZ?=
 =?utf-8?B?cHFPYlI3ODYydXQxZjd0M25Wd2JXV0hTYUQvOEM5eVJyNUtZeU5RMVgxVFdK?=
 =?utf-8?B?TElCVDFhNmxDelJnbjY4QnBXbVVuVDVNcVIyazBybTZyTk1Ca2RNMGdHQlpo?=
 =?utf-8?B?UWJoUitHOXVpRFFUbnRXNzFHZmhPU05xRXpjUXFCZmJsQXd3SHJ6akhPWTZX?=
 =?utf-8?B?ZTZwTkx6MXBMQTAvQ08ra1h2VGlGZmVNbXNEQTZid3U2MXgydlFSNTBjaDF1?=
 =?utf-8?B?K1hNb3lZNFJJTXQ2M2hORmQveW5sR2ZoNEl4SzZYWWdnS01GZVRQSlIyc1FJ?=
 =?utf-8?B?UU40NVhUWmdxUFpFNnBTWXB0UWxlOENzV0h5YVVJeEQwd2k1MERaN0NQZXNy?=
 =?utf-8?B?Wk1FVVpCRnE1eUhPaUs2RnhsZVhtN1FhNkwra1c3NWxTOEpXb2xXZ0JvbXZ4?=
 =?utf-8?B?WlRmOWJmVTdYQS9OOGxQQ2YvMXprV2tqZHUyVGlpL29XUkNTUktYMW81RU9E?=
 =?utf-8?B?UktROHB2TFpxZjJ0S3N3WDUrd3c4dTRNVVgwSkNybTJqUlViRFZKb29pdzJP?=
 =?utf-8?B?cVpkaUVzYXRHSzFDazZ4b2ZkT3BpQzMrRGQ5YlJtaXpUV3pIN2htNVAvbjVC?=
 =?utf-8?B?WGJ1akVXVzM0cGllZ3JOUXJlUWJ4RnR5NG04V3lBR3BTL0VrMWxjbC9NbzZ6?=
 =?utf-8?B?NlNRcG9Va3ZXY2ZmYW9FKzdEczNZVHByV3BXcEM5OC85QkgxYXhtazRpcity?=
 =?utf-8?B?K3FJOW5sdGFQbTdiSUhtTGRLS3RWSEE0UE5PbllxQzlVRUlnSDBrNWFKTnFU?=
 =?utf-8?B?MFU0Z29nMklGTElvQ3VWV3VwRVBSLzZCNVZBKzFvQ2MzcFdYaHVDbm51d0Q2?=
 =?utf-8?B?WDVFNGU3YVhOSXJYc25VTENGWHpzenJYTFpRYlR3eVFSelJrR3NrN3ZrTGtv?=
 =?utf-8?B?b1hhK1VlaUZBdnZaWUZVcVBmRXNrTkpWYjk3S3drWkRSMHQraGJSRkZkREtU?=
 =?utf-8?B?YXdDYzdweXI2KytRQkNCODNoUXB6MkFUeVg2dis4ZjZGNWZwNWxOcm8xYlph?=
 =?utf-8?B?SlRacHppOXkvNm9HZXJ6eUptdnFuMHNmZmJscWRBQ0pVUHl3aW01eGR0Y2lV?=
 =?utf-8?B?a1oxb2I0THNwdEpjNE1UbFk1U09CUTUzSG1hbWJKY1JoNEc4RkxDa29zRCtC?=
 =?utf-8?B?RzIyY2V5eGtwcm1vc1pVeUt1aWV1elNGOFFzQTNta0s5WFlKMmROUW1Gc0lr?=
 =?utf-8?B?aWFhb3RQZ2I4akpvK1J3aXZNUDdydWtrSlFKdmpLem96N2ppdmtic3poL1RQ?=
 =?utf-8?B?S1loWHgrdzEvWmFTVFFHbHhUb0UxL0JTVXNpa3Y1dEVSWVlBbC9XWDErNlh5?=
 =?utf-8?B?dVJuNmp4a2JyV0kzQ0MxaEJqOTEvK1FkSzIvcXNwaCtvbFdIMUdPRUJCZERt?=
 =?utf-8?B?UWFVY3g3OVBSc0wwWGtGdUl4eWxqcVpxOFhWNFk0dWVROHU3RHBTeWY1YlBU?=
 =?utf-8?B?UnRxT21GZFFzb3U3ZjZncFZzYnE4TnVOOTkwU2pyeVMvSThJNDJDbU1zV1E3?=
 =?utf-8?B?MmhZTXN3bGtQQWlHdFNHNVNBbG5QMjFxMmhHV0gyMG5RZ2J2Z0ZIYnNlMmJk?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e30847f-a0e5-411c-9ea5-08dc5f9cc467
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 11:43:29.8892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IZ7MvNY0cRJnFE7QQcZ8L5z2eLp3M0McB9qsIOB65XXDWSJWUWOuh3xpUVsZH9T7k0JiIRhHuU9V/Z88G/ODymp1P+zy7xq3ieuFgwmtxRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
X-OriginatorOrg: intel.com
Message-ID-Hash: BOH5QMN5SUNYCIGIKN4CRANCFISPB6DU
X-Message-ID-Hash: BOH5QMN5SUNYCIGIKN4CRANCFISPB6DU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOH5QMN5SUNYCIGIKN4CRANCFISPB6DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Mark,

I'd like to send changes which do modify the avs-driver but are 
dependent on ACPI/NHLT changes I've recently upstream [1] to Rafael's 
linux-acpi tree. Thanks to Rafael, there's an immutable branch [2] that 
has all relevant commits on the top.

Should I send both the NHLT+avs changes and have broonie/for-next as a 
base for that or provide only the avs changes and state the dependency 
within the cover-letter? The latter will fail to compile without its 
dependency obviously.


[1]: 
https://lore.kernel.org/linux-acpi/20240319083018.3159716-1-cezary.rojewski@intel.com/
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/log/?h=acpi-nhlt

Kind regards,
Czarek
