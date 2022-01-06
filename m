Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0D486564
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 14:41:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E424193A;
	Thu,  6 Jan 2022 14:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E424193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641476486;
	bh=BSBGxlHi6x3AMhP/J7boh3QY2LYvCycPETbKzDRJ3WY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YsjvIbtLeDUelZBG50E7VREgbRskp4aZ99WogrOgH3F5hq4xf6bsiSAoPGY3ma1je
	 Q8+TCK6Asq65Ie2hXR0URAzI1/DloZJ60M7k+9dCfgRpeU5i9jKgWMQs2dM6G+Dkc4
	 brlVZNMM+mwE7sFbyFPuXeoFg9iTWYvw74bkQHOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCE59F80158;
	Thu,  6 Jan 2022 14:40:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99542F80155; Thu,  6 Jan 2022 14:40:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3DA4F8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 14:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3DA4F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kjPR7Qmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641476414; x=1673012414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BSBGxlHi6x3AMhP/J7boh3QY2LYvCycPETbKzDRJ3WY=;
 b=kjPR7QmoYMPfhLm4MBFeV3lGgv20o6/HwnSI5GpIjz/5vUjpT4bn4HRe
 QXFprE9LB0AZ2/r90l0L9IxS0bNGlmnhhPwDTC7ZprUHjbN9K39YTMLk9
 WYxNQX+Diw+47J/O+vTWWMQRi5XjWwxvBY3QNYFmVfEx+cMObuJfPihAP
 SQXlTbjXBRtsGWlmR5QmzgKcrIVHOMsrgCHeym07qsahhwC/HV+VSZN0B
 STJSBgZqVz2gd4HR7AI4rnomjIIcENItbbCmNxiyk//B5RkK9/tX8ccfi
 cw3CCsdPFXnS+cIkOQosDXzabcFL/f3MC25q2mrTCgTe+/xc75wosTIEl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241474814"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="241474814"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 05:40:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="470947331"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 06 Jan 2022 05:40:07 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 05:40:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 05:40:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 05:40:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF0GpT3B2geDRUYwtypSkeNFe/ZMJd/mnEiawHxfgRDJ/M1CbWM0BSDhVtc0UaTThd6uYrkaOHXcugh9XId3aYHp5fecsiuHEnonzb+17vFhOXTAzfZkqk5w9ec7eIw5lV9ZpSPIf+6wUHh0VLotRIWtwVAkfOMS+lGMGAYFF6Rlu3npD1wXKyd2aiCGJANIEa9jVFzVK+nEsG8y+g6BKlo41lQRCwbCQ7JbdCyqZzBDOpp5CPjQgBmbw3T7jJjNsq37rlDLzGyS5WYhUCb3HznyP1oRxweaNuazkCnkvWImq8hTXpv5MONlQc9NOhsp20sYNJ1CHur4rcvWaE/qtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLZ/ITPiZegIc10lgm68Bj6PI2CWjTflStgOfXd9wtE=;
 b=llFnMxhRWMcMWurhd9whxuHRps5Qqyn8LZrgQ39SH82Oi/VSdG08U2ziYvbsaOX6mOcSws447PrH6p0QWz7nxPLGHkNM/hixVccOGOG4xZ2bhhGvdRPbAhhFi/FB1JiVDmZYQKgWdcoEuRyR3GhWLKEv5mCahi1gcTIUMg+VfTW8TOUw5aiIGXaKB/M0rXT5IEMtk6EypHBBi1SWiyRq0RdmNBR+oKtoK/t1DR3WufjQM+s5RMy7CtZSCDK3+m2+l6YySTdJWRniQBV6NNeS7p1td45MwjjdLhJMxJQFv0XPF4KBCMasHvDvN8mBKR1+1pSW5RoiTt21Ra/2O6o72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB3987.namprd11.prod.outlook.com (2603:10b6:405:78::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 13:40:05 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 13:40:05 +0000
Message-ID: <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
Date: Thu, 6 Jan 2022 14:39:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YcXFwTmP6k1Zfbw9@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::19) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c0f0dce-c30d-4571-3a34-08d9d11a0c1e
X-MS-TrafficTypeDiagnostic: BN6PR11MB3987:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB3987EF5872AEB8048D0C0428E34C9@BN6PR11MB3987.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdKeRYUulRxDgbhumSN29MbT/LBsjCEpSIms79qHHROrkbMSWDpxKprAy1aFZG5xmtceZF4m3G/Ve5egiN4kkfc05IkiOnJykueE4dMbY9vmaaUjrYrHMUd+rNxc9rPk3AnTESo6aCGfdjHMQWzdm3EJHLEUXBDX1KS5jCSj9bT5yd0YYG7vQOhJEWOjlPbL0s0Fgrs0AfkOFNaFrCNanYBalqx0t3nTYPoKHn4ytTbE7WF3H1rcW5YUqh4j/nicTTSyF1PfzDRFDXroSLpeBDbkyene73gEwlx4H4880fvegUNcB7uBFJYLB6t1dIBoBpx9wXRt9TEpmpTIbh12bybr1gByDN+3E1TUCR+Jf3bAXdFIzlK9GxDwAHEOeMqVbJOLor4KxKWjSj41UEKwMjcqMVkfeDwjYrEZMUnC7fBb9EPXkdHA7XLcviRm9FAOOgK1apihT8q+JkXvIgV7mbxvMNXJ8ntKzNyzCyrndHamvz5d41RgPGVIX/x2BIQDNQsvHyAsE0X+7jbJb3rZi49Fg3XchhfvgZlkm2zL+uO9VZrzTcFHV8LCyHdJwCz4NfEzhvDgh/W7uuEFjtbAZo4rDN66o1FTg6ZL2qmc/eIU3GniUsixVgEjtrq05CsPyXQkb+ISP2GVdcTUuIl62GcobrCnPpP3OzgKL8WQ2/QzGvkf/izO2SC5/bv6aHlIPMvAUBkzRAbQskQzkBrOrW8jZU/dxFCUto2F05HgJOdwO87zbiqEGvOyDXDCxFrv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(6486002)(8936002)(6506007)(53546011)(8676002)(6666004)(66946007)(44832011)(2616005)(30864003)(5660300002)(2906002)(31686004)(82960400001)(83380400001)(316002)(31696002)(4001150100001)(6916009)(86362001)(508600001)(186003)(26005)(7416002)(4326008)(38100700002)(6512007)(36756003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emgzWE5WZHRUMzRhRW42ellocEtQK1ZPcU8ydGhTekNVUHl0TWRPc2ZHdmcy?=
 =?utf-8?B?aVEyUTRpZDQyOGE5ck80VTcxYUJub25aNlhJM3BpQzQ4dWVWNnJUeEtUaXF4?=
 =?utf-8?B?aDl3a21Uei9aMWFwU1QrNTkxWldtUzNLcmpBSUNRaGtoZXloemwwN2tZbElG?=
 =?utf-8?B?MWh4all5c1ZBQVYvamE4L2xLa1c5Z2dKbmZLWU1ZKzVvWU1IU2Y4dlBLTWNv?=
 =?utf-8?B?c1hXUHFLbUU1WkxpZkN6YXpsdUh3V0xRMFJCZE04TnZkcUJMM3U3bk02elRS?=
 =?utf-8?B?ODFKSjd6Qnptc2plVXlRMUFqSGxpMElzcWZzVFVYc0JaTUJqeGhlZ01LZVFj?=
 =?utf-8?B?azNkVnhPMDZZSVU3eC9XaE14YzN5V0I3Wk9PL05XMlozdGR5bnR3R3J4ejQ4?=
 =?utf-8?B?bDUzbFdkMTVrS3N5cVFmUDl1WUdJdEFYQXhCYTA4QUZETGtZRzdOYzl6dHM2?=
 =?utf-8?B?RHJFd0orSmdZaDBrNVZ1dmlKbFQySUg4QXMxVUxVZGhoeit5RHpWYjl5eFJa?=
 =?utf-8?B?akFhK2w0NUlzZzdwcUhiYytSTDFKNnA4R29UUlNDY1hxSDRvS3ptdncxbzNm?=
 =?utf-8?B?b0ZHTkU4R1ZrczYzWTFFdSsyWUpRTDJzVk1LeWFTWlQ2TWRkc2tROGJ6Zm91?=
 =?utf-8?B?SUpLYlovbS9aSzAwa29VQ0tiYWw5dy9hUndxQ20rRDFFZnhZd2wzclJ2L0ZI?=
 =?utf-8?B?cGo2Um9peXluYjM1OGRmR093OE80Rm5TdElzMUdSQ1djdWo1T1RROGN4Ulpq?=
 =?utf-8?B?bE1icGxaSVBYQTl1ajJOZHJlTXM0ZjlQVFRiQ0NsZDZzclU4R1VFN213NURD?=
 =?utf-8?B?blQvRUpyT0M1akxZNDYxejM5dWQxa3lBbVloajhqNHg4VVdQS3hkSDhzYTkw?=
 =?utf-8?B?WGdUZElnRC9HSTQ5bHpKNVlXRWhudjQybDZoZnk4L0ZzaVFvUENCdEl3VVdV?=
 =?utf-8?B?amdxSlp0VXBabURwcWdIWnhocHZ2bVpySUJMTTNZWEhGY0JJMVQ5cmlSYlVO?=
 =?utf-8?B?VS9vSThYeXQ4MElBNEx0YThnSU8vZFR2OTVRK2FIdHVMSHc3NFNzV0hVZnpu?=
 =?utf-8?B?SWxHcm5RMjR2SlVTVGtNNWc2ZWpSaWFKMlFsYi82a3JlUlRkTzZGUkErTDU0?=
 =?utf-8?B?S0tuTitwcE5pVE5ERDF6elNmRWRvakpEelNjOFd0NDQwRW1Jc2ZwblhhWEZF?=
 =?utf-8?B?cm5yK2JmWE96dGxubnlTNzF0dXNFWnRBOGdPTDZiMHZobGp0em9Bb1FqeE9M?=
 =?utf-8?B?TlE0M0pzSVp3dUNmOG9FZWcvQ1JQRmF2SDIvcDhvYy9ZYUdjZlB6WDFveXZv?=
 =?utf-8?B?NXExVmVIOHNjTk1NUWc5VXFnWXFZZ0Y2NEFpeno0c09iZjhRd09mMGpXZ2xH?=
 =?utf-8?B?TksxdmR3djVCaDZjeG5wMGQrY1FUVGhWaURwMFU1QkdVaUdHM3JvWnY2bGRw?=
 =?utf-8?B?NHJPMnJucURzYW43Y0lFZGc4WkpLaUx2c2c0eWNWQlFHZmF6L2s2dTR6RkNQ?=
 =?utf-8?B?dnY4MDJnV2s0aFNRRjhSNWh2Z09pQmZkMnRNZGlrRkVDWkF3ZUlHRWVSZzFh?=
 =?utf-8?B?RFdaSlUwVWRLLzV3cXJyOE1rSFJJQWttL2YrM0drVEpmUkRodTYxSzN1MFZi?=
 =?utf-8?B?dVpRZ1ViUkVJL05UWjRSbUJrR1R2WHoyTFB2MGtGaHdPcjhRMXJlNjdVRFBz?=
 =?utf-8?B?b2NNTkhuaXREZkdqSTB5aU9hVUE3a1Z5MXc0UFZzU1cvemR3dUErTnNyQjRa?=
 =?utf-8?B?QUpwQ0s5V1pNOURkdDNjbm9OdWNGUE9oRVBQS21PY3FCZHNPZTFnWFhSZWxZ?=
 =?utf-8?B?TDh1OUUwRTExdnlCcFJXTGdjV1Jad09WU2FsRytOclMrV2dPQjRjdG9YTm5t?=
 =?utf-8?B?ckpmSzNHczF1d0xuWURiQ3hlNGF0cTM1N2lhaUJ5dmIzVjUrbFdCeXhTUkN3?=
 =?utf-8?B?K25TZXQ5R3BHVEJib3ZlVVJKM28vR1dxbEtQZVRGclFiZHdScjc4OXd5cEFu?=
 =?utf-8?B?VHhtWm1HRDBUWGx6K2x5MS91TURvbGZJRldUbExyK1JwNXZsTHF4Vk5YczVT?=
 =?utf-8?B?LzZTUzNySE5Dakgwd1RwMG1ENThwZWorK0ZtcGR4UmZYNTA4blk0QmpiSVEz?=
 =?utf-8?B?bmZhRSt5N0dlZ2hobTRYUXpnalovQ0ZlRDlPUTgrZVRSaFRQMXVLbDRXdGVk?=
 =?utf-8?B?WjZmR08ybEhSb2xjdVcwa2RNTGtjTllmZWVYYWZ4anR2RUZZTjZWeUxPdVBR?=
 =?utf-8?B?bjV2MXQxVVAydTBBeDJyL2Y5a0NnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0f0dce-c30d-4571-3a34-08d9d11a0c1e
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 13:40:05.4546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYSmvtqqPj0eM8WgyIZlFju/u8hkbSaMNcSboiHuHcgEUJ3A9Gf3cZeRzJLJNKNcAl3XYT+Y0QYcTzttjN+pF/xV0nzKWhH5xY3hOdQChK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3987
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

On 2021-12-24 2:06 PM, Mark Brown wrote:
> On Wed, Dec 08, 2021 at 12:12:24PM +0100, Cezary Rojewski wrote:
> 
>> A continuation of cleanup work of Intel SST solutions found in
>> sound/soc/intel/. With two major chapters released last year catpt [1]
>> and removal of haswell solution [2], time has come for Skylake-driver.
> 
> ...
> 
>> Note: this series does not add fully functional driver as its size would
>> get out of control. Focus is put on adding new code. A
> 
> So, I've spent some time looking at this but I think there's just
> too much in this patch set for me to get through in a timely
> fashion even with the efforts you've noted above in that
> direction and that the best thing to do is to look at how to make
> things a bit more managable.  It's a big series and the time of
> year does mean time for review is a bit more limited.  From that
> point of view I think the big thing to do is to reduce the amount
> of interesting or new things that are being done and make the
> series a simple as possible.  That'd be a limited but hopefully
> routine driver which should be much easier to review and would
> allow the more interesting bits to be focused on separately
> without getting lost in the bulk of code that's more routine.
> This applies more to bits at the top of the stack that interface
> with the framework than DSP/hardware facing bits (eg, stuff like
> the tracing is not really getting in the way).  Tactically the
> code is basically fine, there's going to be some issues but
> really it's the big picture stuff that needs more consideration.

Your comments and review is much appreciated. While we did separate the 
series into chunks, I'm keen to agree we could have moved a little bit 
further with the separation. Below you'll find the list of patches and 
my thoughts after taking your feedback into consideration. There's also 
a TLDR if there's not enough coffee in the pot to cover the summary.


   1/37 ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
   2/37 ALSA: hda: Update and expose snd_hda_codec_device_init()
   3/37 ALSA: hda: Update and expose codec register procedures
   4/37 ALSA: hda: Expose codec cleanup and power-save functions
   6/37 ASoC: Export DAI register and widget ctor and dctor functions

As current RFC allows one to see the reasoning behind adding these five 
patches, I believe they could be sent as a separate series. A cover 
letter for that series would mention their purpose nonetheless of course.
Note: patch 6/37 has been re-ordered with 5/37 as 6th patch fits the 
generic-theme whereas 5th I believe does not.


   5/37 ALSA: hda: Add helper macros for DSP capable devices

While this patch _could_ be merged with above, it's not as generic and 
the other five. It seems more reasonable to leave it with the avs-core 
series as its specific dependency.


   7/37 ASoC: Intel: Introduce AVS driver
   8/37 ASoC: Intel: avs: Inter process communication
   9/37 ASoC: Intel: avs: Add code loading requests
   10/37 ASoC: Intel: avs: Add pipeline management requests
   11/37 ASoC: Intel: avs: Add module management requests
   12/37 ASoC: Intel: avs: Add power management requests
   13/37 ASoC: Intel: avs: Add ROM requests
   14/37 ASoC: Intel: avs: Add basefw runtime-parameter requests

If one were to specify the pillars of a DSP driver (for simplicity sake, 
let's discard all the standard driver needs which are provided or 
satisfied by kernel's interfaces and resources anyway), firmware (IPC) 
communication and the topology (stream layout) are the two major ones.
Pillar #1, base firmware (IPC) communication is complete at this point.


   15/37 ASoC: Intel: avs: Firmware resources management utilities
   16/37 ASoC: Intel: avs: Declare module configuration types
   17/37 ASoC: Intel: avs: Dynamic firmware resources management

Prerequisites for below, define all the look ups and boundaries for the 
runtime operations.


   18/37 ASoC: Intel: avs: Topology parsing

Pillar #2, base topology (stream layout) is complete at this point.


   19/37 ASoC: Intel: avs: Path management

Streaming runtime i.e. reflect data provided from topology file - a 
recipe for a stream - on DSP side.


   20/37 ASoC: Intel: avs: Conditional-path support

Extension of standard path management. Could be separated from avs-core.


   21/37 ASoC: Intel: avs: General code loading flow
   22/37 ASoC: Intel: avs: Implement CLDMA transfer
   23/37 ASoC: Intel: avs: Code loading over CLDMA
   24/37 ASoC: Intel: avs: Code loading over HDA

All of them are avs-core. SKL-based and APL-based platforms differ in 
code-loading (base firmware, dynamically loaded libraries) thus the two 
methods. These could be moved *before* topology/path related patches 
with a consequence: code loading is dependent on some of the bits 
provided by the topology/path implementations so additional changes (a 
patch perhaps) would be required as a preparation step for these four.


   25/37 ASoC: Intel: avs: Generic soc component driver
   26/37 ASoC: Intel: avs: Generic PCM FE operations
   27/37 ASoC: Intel: avs: non-HDA PCM BE operations
   28/37 ASoC: Intel: avs: HDA PCM BE operations

At this point PCM operations are complete. FE is _generic_ regardless of 
interface (BE) type it's dealing with. HDA BE is covered by the last of 
these whereas I2S/DMIC by the second to last. I'm unsure about PCM 
operations being separated from the avs-core. My current opinion: leave 
as is.


   29/37 ASoC: Intel: avs: Coredump and recovery flow
   30/37 ASoC: Intel: avs: Prepare for firmware tracing
   31/37 ASoC: Intel: avs: D0ix power state support
   32/37 ASoC: Intel: avs: Event tracing
   33/37 ASoC: Intel: avs: Machine board registration

All of these could be moved into the separate series with the exact same 
consequence as with code-loading: a preparation step would be required 
as mixing code addition with 'making room code' would cloud the view.
If we're strict and focused on patch separation then while very 
important features are added here, these are not avs-core per se.


   34/37 ASoC: Intel: avs: PCI driver implementation
   35/37 ASoC: Intel: avs: Power management

Here, the question is: how bare can the base (pci) driver be in the 
initial avs-core series?


   36/37 ASoC: Intel: avs: SKL-based platforms support
   37/37 ASoC: Intel: avs: APL-based platforms support

These two are very easy to separate from the avs-core as these are the 
last in the series. No problems or consequences here.


TLDR:
Separate series #1:
   1/37 ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
   2/37 ALSA: hda: Update and expose snd_hda_codec_device_init()
   3/37 ALSA: hda: Update and expose codec register procedures
   4/37 ALSA: hda: Expose codec cleanup and power-save functions
   6/37 ASoC: Export DAI register and widget ctor and dctor functions

Separate series #2:
   <everything else not listed here>

   Note: patches 21-24/37 get reordered to prepend topology and path 
management (currently, patches 18/37 and 19/37 respectively). While 
right now I don't see a reason for doing so, this also provides a 
possibility for separation or division of these last two mentioned 
patches if need be.

Separate series #3:
   20/37 ASoC: Intel: avs: Conditional-path support
   29/37 ASoC: Intel: avs: Coredump and recovery flow
   30/37 ASoC: Intel: avs: Prepare for firmware tracing
   31/37 ASoC: Intel: avs: D0ix power state support
   32/37 ASoC: Intel: avs: Event tracing
   33/37 ASoC: Intel: avs: Machine board registration
   36/37 ASoC: Intel: avs: SKL-based platforms support
   37/37 ASoC: Intel: avs: APL-based platforms support

The last three could be separated too as all of them touch on isolated 
subject: recognize ID: XXX to support YYY.

> In terms of things that could be split out there's a couple of
> big things that jump out.
> 
> One is the paths code which feels like something that should
> perhaps be pulled up a level to the framework since it feels like
> the problems that it is addressing are general problems that all
> DSPs face.  Doing something like hard coding this to some very
> simple use case that does minimal to no processing would allow
> the driver to load and function, then the path code can get a
> proper review separately.

Must admit, right now I'm not seeing what could be added from avs-path 
into the framework. Not saying 'no', just after seeing the avs_path 
stripped from all the cAVS firmware specifics there's basically nothing 
left.

Let's take a look at the standard path (discarding all the conditional 
path bits):

struct avs_path {
	u32 dma_id;
	struct list_head ppl_list;
	u32 state;

	struct avs_tplg_path *template;
	struct avs_dev *owner;
	/* device path management */
	struct list_head node;
};

'dma_id' and 'template' are avs-driver specific. To be honest, stream 
division into pipelines and modules as done in cAVS firmware is also 
specific and a different DSP or a different firmware may expect things 
to be laid out differently, so 'ppl_list' is yet another candidate for 
not being framework friendly.

Let's also take a look at the interface:

a)
struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
				 struct avs_tplg_path_template *template,
				 struct snd_pcm_hw_params *fe_params,
				 struct snd_pcm_hw_params *be_params);

Compound step, generally speaking this maps to IPCs: CREATE_PIPELINE(s) 
+ INIT_INSTANCE(s)

void avs_path_free(struct avs_path *path);

Compound step, generally speaking this maps to IPC: DELETE_PIPELINE(s)

b)
int avs_path_bind(struct avs_path *path);
int avs_path_unbind(struct avs_path *path);

Arm/disarm steps, map to IPCs: BIND/UNBIND respectively.

c)
int avs_path_reset(struct avs_path *path);
int avs_path_pause(struct avs_path *path);
int avs_path_run(struct avs_path *path, int trigger);

To easily modify state of all the pipelines that are part of the given 
stream. Other DSP may expose more or less pipeline states, or may not 
expose any at all. Again, pipeline representation as seen in cAVS 
firmware may also not exist. These steps map to IPC: SET_PIPELINE_STATE.


TLDR:
avs_path is basically a wrapper for a list of pipelines which shape 
given stream - from ASoC side, that's a FE <-> BE relation. These 
pipelines exist only on the DSP side and are tied to cAVS firmware 
expectations and architecture. Again, if one strips the avs_path 
interface from cAVS IPC logic, then there's basically nothing left.

We could have dropped the 'avs_path' and instead inline all the 
pipeline-looping but that makes all the PCM handling rather unreadable 
and much harder to maintain.

> The other thing is the instantiating of multiple machine drivers
> on a single system.  That's something I've seen occasionally from
> other vendors and I do have concerns about how use cases where
> someone wants to route audio in ways that result in cross links
> between cards so those ended up being integrated.  The question
> here isn't really if it works in testing (no matter how thorough
> that testing is), the question is if userspace software doing
> generic things will be confused by it and if some combination of
> future framework changes and user creativity can turn up issues.
> There's also the issue of how quirk handling would work in this
> setup, and the issue with needing another set of machine drivers.
> It's one point where input from users and distros would be
> especially good.  This would be harder to cut out for later since
> there's not so much code which supports it directly (TBH this is
> part of the concern), one thing might be to just only support a
> subset of hardware (eg, HDA only or I2S only) such that only one
> machine driver can ever be instantiated on a system.

We're open for more input from the users and distros. That does not mean 
we did not do our homework before moving to the coding part. In our 
research it turned out that 'different device equals different card' is 
a popular and easy to follow notion. These results are of course 
influenced by the other OSes where such separation is more common and 
users got used to such model.

It's worth noting that we did make use of the APIs that are already 
available in ASoC. There are no hacks or hooks here, just the usage of 
the available interfaces. The granular-cards approach, while preferred, 
also does not prevent super-cards from being integrated with avs-driver. 
In fact for some more specific scenarios e.g.: when there's no codec 
driver at all (as the codec is being managed externally), we do make use 
of such cards.
In the HDA vs I2S case, the selection is done based on the existence of 
codecs on the HDA-bus or their ACPI IDs: if codec XXX is configured as 
HDA, then its ACPI ID won't be found. Only the enumeration on HDA-bus 
would happen - creating hda-related machine board in the process. If the 
opposite is true (configured as I2S) then HDA codec enumeration won't 
find our codec - the ACPI ID would pop up instead causing the 
I2S-related machine board to be created.

By default, all the cards are independent of each other. avs-driver 
supports 'cross linking' by the means of the conditional path. The 
'conditional' is a key word here. These paths are a 'side effect' of 
other paths being open simultaneously. If there requirements are not met 
e.g.: a FE is not running as it simply can't be - some specific card 
exposing it is not present - then the 'side effect' path would not get 
instantiated on DSP side at all. Conditional paths are not launched by 
users performing some aplay or arecord (or any other app) operation 
directly. The requirements i.e. the FEs/BEs required to be running 
simultaneously are specified by the topology.

In regard to quirk handling, could you elaborate? Right now all the 
supported cross linking and the machine board division scenarios are not 
causing any repercussions as it seems avs-driver gets credit for. I 
understand that it's good to think about far reaching consequences 
sooner than later, but the APIs allowing for the granular-card approach 
are here for a very long time and the card/device division has been seen 
in practice already.

> One more tactical thing is that I did comment on earlier was the
> use of atomics - in general atomics are error prone and hard to
> reason about, unless you're doing something like transferring the
> audio data using PIO it's probably better to use higher level
> concurrency primitives.  Any performance difference is unlikely
> to register and the maintainability is a lot better.

Agreed and ack. One again, that's for spotting the problem out!

> It'd also be good to get this well enough integrated with the
> intel-dsp-config code to avoid the need for the dependency on
> SND_SOC_INTEL_SKYLAKE_FAMILY=n.  If both are built then it could
> start off with always require a command line override to select
> the new driver with a _DSP_DRIVER_AVS constant, this can be
> revisited later.  That mechanism is really nice for distros and
> users since it allows people to do binary distributions without
> having to worry about committing to one driver or another,
> reducing the risks for things like breakage on upgrade for some
> small subset of machines.

Hmm.. this means that in time (once skylake-driver is removed) two 
values would translate to avs-driver selection rather than one. Value 
'2' is being used for skylake-driver and we don't want to force users to 
manually change it to anything else (i.e. to the to be added avs-driver 
selection value) when the time comes.

Not against, just stating the consequence.


Regards,
Czarek
