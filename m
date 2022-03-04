Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F95C4CDBFD
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:16:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8241F46;
	Fri,  4 Mar 2022 19:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8241F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646417808;
	bh=x69KdYP/+y/igfUPlH6XorUvV5xvXVPu4vdUuamBn30=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OLZ3m5LFY21cKKPHUSUsQKgsSzE7S04ZX/D+4RAoedZj6ghQHNbzWUXSwBLOosr9N
	 Qkx/AbMbgAaw3M4VTZi+o1qnwK7XzkNP2OL/kicNidNAt/6Yqs0MrB1p3piABY5sST
	 nfTjpjL/eAGOikhxPNKhg8fJFXjzkaownf3YCBxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71546F800FA;
	Fri,  4 Mar 2022 19:15:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCE48F800FA; Fri,  4 Mar 2022 19:15:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5EECF800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EECF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qsgj2tVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646417736; x=1677953736;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x69KdYP/+y/igfUPlH6XorUvV5xvXVPu4vdUuamBn30=;
 b=Qsgj2tVEdTwIOJ89HYPX13FvOqB9lFUJt8KdFVFfRX8DyA2eU7JlmLgb
 Qdx59U4urm7OcEgOKHjDSIeSn5+yIpWswBasGPKlM1wcoOVATgdl1vuQf
 3Lr4xHHJWxmwhexjHbwh2lz2kTilYreK1Ms196vaech2NISXP3baQjqD2
 mORtf2pVWYsR54r7WFNHCk3/gVGUvmp3ghCfCewAVlQq/JlGNlyLnlfCr
 qSp2fvghT0/R7pb7F+cX0nF2lu3FiLKQbrMsIWUYjVGtHUmZBsjyWkgci
 CcfED081187UaihlzMW6THLzP0xFIgKSCjH7+tc7rCWBL9l+uEZmJ82Gw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="233990096"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233990096"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="610020300"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2022 10:15:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:15:31 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:15:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 10:15:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 10:15:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV0hxiUKtytVtg2E6NxTUr5H+qC50OUBUa5PGlC2Q1iB/qyyw2Bvkj5ftjuncytS1/1rRrWGp7wf3qw+DoyytubLmBg8sB3LhhzT9xpS7IYnFIcM+Y2yU0RJ6LU9AsDD6GI3dvPaRsStn6pTPJWQZ4veEyjbvOdrciZQg86nWx6Mlup5eWnoAlOGiXK7yzZx5fM+lZFQu81gc+/iauq+ytpngswOO2yLQDc1c5z2aYG+20Pj1mY/VlStz+upyaNGCH4eAvZTg9oDV8JN2Wd3HsHBqJF0qIHZTZYjH1Cri26oo9VMpNuhO0PVy0Yw6A1yJ4FlscKZMk9EoG+k6TqDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLhpO3YPxSgPCcP8G5z1ekAYnjLFXE8sf+n4jO3j8Ek=;
 b=nMSquvub+dETePDTADkYEYRRPiOtmrwyDNzSUUzLMoZSq8FvGWs4bsVt2aeOmTVXZykc1EqY1yFz9JcB5GZrVljpjIBOrZ2TowpXMdB3GYRJmmWZkzGDE5Cxjy2FvaxOqNzvORO4UXsP7uqYX7DwvpyLIPXCVTQLJ4SCnQtK5St/gjzxshvAcXzBxKzjfhZmpNKnGP80oIm1MvavYq1v/n1ImvRwVhNcFe09VwsdOG8Es+nY3I2t+7n2lh7fnhrJPhfSZndiKYyKYDv4fIzWOd1OkUx7NyFxxupcJgkur4hKefenED57ualbYNXQEmtzxUMvO77mh7cDKmgmGGYEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM8PR11MB5606.namprd11.prod.outlook.com
 (2603:10b6:8:3c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 18:15:28 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 18:15:28 +0000
Message-ID: <2ea23139-d9a9-a1db-a2ff-9bf26a23606b@intel.com>
Date: Fri, 4 Mar 2022 19:15:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 13/17] ASoC: Intel: avs: Dynamic firmware resources
 management
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-14-cezary.rojewski@intel.com>
 <0afcd1f47073d84b2871a4dc2cb12754ff0d1a7e.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0afcd1f47073d84b2871a4dc2cb12754ff0d1a7e.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR05CA0067.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::44) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c13443aa-3c94-4ce2-ba2a-08d9fe0af65a
X-MS-TrafficTypeDiagnostic: DM8PR11MB5606:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB5606C96A24F1A11B92F04BB8E3059@DM8PR11MB5606.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8z/tsVbAlzuZXc8JdEZo6LxCPHsL0v0IT69MrVG6swFpP7zVXQ62BTGOzFKWtPg00+YKlvAASRlt5AF93U/vmLmsMzsjDMvvV8ZkQqWabRRzZOqjliFJQ5ECnkMtrjCMc8V8rthLiEs9TvwqBqGiYma5jfegMHTytI1bbCbNtsjzzWo7LkxhQPIHfXv4/7Sjmjvc0KDWI0JI/UtFFTcd43yHLUgJhyHdWSR14gI8PxiMzRmoJqnCi2lpf5l7O81GqkUxf2jQFZlJXZLhozwCQvFwVmTC0EPp/xrKVWtNwEruLR7S40AxDxYYEEiKsYyWnxFDEcT/5QpOMAnt2PEWirU3AbOS+jxmvwywIM6vXOKiZFuCLqpSP+UaSdhWIkm0Fe3Gp7MQGRUfUXd3eph4PqLiZ0+nX72+IYEcdVyHpfD2NUBs3JYpp/ZU2fTXZLx0wEX0bs2XUyCjMYPYff+1rV7All+C/cnoFomklWMppxo1mfk71THPHsJgk7fBzlrZJfSwgH7f9jSzNiOmvxJKNzYCIQvWcm4mG+PNIIrHdoKBgsIR+HSweObM9ujbvWYZapPoXpAoWXHAQKDoYREkwfROpeD99ahH52uxWq8rANsGcWqTluyXFbeN0CrupmSMD+VaTELP/q4fJUwiui9q50k4V0PHmKTIP7TKi72ZeABfydq6m2EgSFrCxWYUXaypdH+qnVQ4wNbtN9bdFJFNrOCveye47DUoDufvhUlJn+8EF2IOQdGWDqM/YEMDxEHn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(53546011)(66476007)(316002)(4326008)(8676002)(2616005)(66946007)(66556008)(508600001)(6512007)(31696002)(86362001)(6506007)(6666004)(66574015)(82960400001)(186003)(26005)(83380400001)(31686004)(2906002)(8936002)(7416002)(44832011)(5660300002)(36756003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVRxbkQ1TzQ4V3NmYTlzV2JvMms3bldDL3RwMEhMK21LY3lab1BlcjYxTFU2?=
 =?utf-8?B?ZEFvQnJDd2dtRFd6ZElFTmFUM1hTalErSGJhQVh6Szh3djZyY09uV1VtZUIr?=
 =?utf-8?B?V1JEbFlMV0JwUEJNbDI2ZTVSZ2xCZFpoNFZEZ1hGZGpoc00xOTl3V3o4UmJW?=
 =?utf-8?B?T1FMZ1d2MzV4c2lhZFZMYWZDcmdRMlRheUFVSWRVZ0YxOFNEWjlxeGdGN3Rm?=
 =?utf-8?B?SDUwQjA3eDhIcC9XeU5SSkx4ZEdWQllwYS9mTXVPMHJmN3hFKzliekhYbmJS?=
 =?utf-8?B?VkRGYzlvL2NTc2JQdm5nMnkzVzdpVUsvSjhIckFLalZ4QytFZ1dERnI3NHlQ?=
 =?utf-8?B?bitjRVBBSVlha0tqWEtSOWxIM1VDTDBuSXNFTVlRcDdhWVFiL2Rwc0dwY2U4?=
 =?utf-8?B?MFB0Z0hWTTJPUVl4bkxlSXdHaE1MY2crdkR3VlNIbVkvY1RpOUtlN3AvNWpu?=
 =?utf-8?B?UnlqSzJ6U3hlUHM2OUN4VTR0M2tGL1dkRW45Rk5GY1Z2NkF1ZFNjQ01UZU5n?=
 =?utf-8?B?N1hvMjcwd0NLNnBUNFNPQVI5eWRlbU9laUkxZmhwdnlrUnBiNk90N1JzalR1?=
 =?utf-8?B?MnU3Rnkzay8yY0s4MkpxWlJKblBzU3M5Q3BJL1dhY0paM1NwcHlXUndRVmdp?=
 =?utf-8?B?VFV5YXNldkgwSm9nMjNyeGlvcjVpcTIwTGhpRTFlQllUTFhadmcyOERtVm9U?=
 =?utf-8?B?cjMyQmRjM0xVR2JwaHdDZTl3a0RhamozZEVnN2h4R2ZOcUtMRWNJNkR4clhW?=
 =?utf-8?B?eGFTWDZIZ0VFWW44aGM3VFpxVjNVU3RnblJVM09qa1dIRHVFUjJUNWNnK1NZ?=
 =?utf-8?B?RGhMTis2akxJakVTeHB3N1lTcU9LelNpVzhxQWJtdEIyYmZyc296cHZjeWVa?=
 =?utf-8?B?N3VtVVowT2RzVkZudXFZR0lqdnFXQnhVRHlrZU1QaVdybG8xMk5LZ2pzRlQz?=
 =?utf-8?B?WUhGVS9zSEwvRk9VZkJlbktDSk9Fd2hxUTBNeVVXcmtDQkpDSW5lRFFYT2JO?=
 =?utf-8?B?MjVIalhiNFptQXdTRTdvSEE5blZBMXFTYTlUb3ZTNzU3M3d4NnZSS0FiR3lI?=
 =?utf-8?B?SURyNzBDWFcrYlBNY01LaVV3Y2JDUmYxLzl5VVdmeWw3c3VJbzFBNFJqN1ZF?=
 =?utf-8?B?TEJzZ0NtT0I3MmZ2UDQ5dXd3OWxvUHlKc2g2VXlJMVc5TjZiSDJSYkRlSi9o?=
 =?utf-8?B?OTQvZFFFcFFHUXhQdWpGMjIrQTUzV2ZCU0l1UlJDV3hYWEVsNFdBeFlBYkdW?=
 =?utf-8?B?Y2hvanZOc091TkNtbWl2dEpqbFFEdTJ5ZGx4ai9CTExDN2NnaVZkYWxoNVZM?=
 =?utf-8?B?c3czS3pRa0l6ZGc3WlM1VkZtVlRQNDJxR0NsQk5xZUQwcldiUzFFNHY4SmJV?=
 =?utf-8?B?cmNTaGFuNVQ1aXBqcjlwYjczZm1VNEZ5aXpyd0NDeGw0TWZBT1hiVGFaYVdE?=
 =?utf-8?B?NE9lV2lWTjZaZFBHdkFyWitBdnRsTzJDME1MclJCVEdGVFlscytWdnhHOUNC?=
 =?utf-8?B?UVlKLzRNN3RvMUlHMnBkQVpGcXlKR1ZWelJUdjBpd2lJVkFzQzhuVFVMVk1G?=
 =?utf-8?B?ZlRjbE1uNndMWGNMeUkwaDhrVnROQi9YaWNRVlpNRXVMM3VXLzlJQTBkbUhv?=
 =?utf-8?B?SmxoSDJnSENaRnZlRDhyRUZJV1BieGN0dmVLV0pUTy9uUm9HL2ZnUW8wL3FG?=
 =?utf-8?B?dFJTOW5RTVU2cXlmWSs5SUFwRFg5cGZzR3FWdzlGRk9rNERKTXB6amxBOUd5?=
 =?utf-8?B?SE9nRzFCcHljR0lVUlNrNndWSDBDWkxnR2VGY0RFem8rV0FiZDlDd2dqM0VU?=
 =?utf-8?B?b1F2VFRPN09mNkZkTjhXbEJicFFNSFQrQjJnL3VEV1htbVVXektBWXZzTkRL?=
 =?utf-8?B?RVpsbC8zZWZGRmphSFZhYmh1TlpGS3J0ZDJITDQrSE5rZGoyUEtDeUZOa2k1?=
 =?utf-8?B?U1pSRDhMTFB2T1o3Q0o0bnltWGxWT2MxUkpsMFphTDhQcnd4bmNMOXllQmtp?=
 =?utf-8?B?YkdNa3craEpJWjl2RU41OTdXV3dFcUJHQWczVWk1dHY4bTNYZWR3K3ZqMGFD?=
 =?utf-8?B?TVNDWUQ3c2w1TDFpc05HQWtNVUJqWTRkMmt3RjNCZEVTdE9TVGJYNnUvTVdM?=
 =?utf-8?B?U1N5VTllL05FU3VGeFpRbTcxTjhFVXJma2hNOVBrVUpZWDVRMFZrcytLMTFy?=
 =?utf-8?B?T1h6b0dYRlQveC9EZ2NCenNqWGdWNEM5NHlDTDVxaWZlMjNHWHBpQnFSeVdl?=
 =?utf-8?Q?fR8zBB1+WYYgyp4z8dacRG3FzNz/TXd+L5nLHMlGaM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c13443aa-3c94-4ce2-ba2a-08d9fe0af65a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 18:15:28.8404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UapYRdGPoIrxebUEyA0DCcvwtQAIupQmgZhc9jX3W3COXNYbK3yXTTuGkwsgjv7iLpFDdr3sCjKoMt1I9Km3WxKAqHov/kjM6ZdMBqZJc+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5606
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-04 5:47 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
>> Wrap elementary DSP-core operations and resource control into more
>> complex handlers. This is done to reduce the number of invocations of
>> wrapped operations throughout the driver as order of operations
>> matters -
>> most flows involve register manipulation and IPCs combined.
>>
>> Signed-off-by: Amadeusz Sławiński <
>> amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/avs/avs.h |  10 +++
>>   sound/soc/intel/avs/dsp.c | 170
>> ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 180 insertions(+)
>>
>> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
>> index 02d7591d0eac..0034c075fa64 100644
>> --- a/sound/soc/intel/avs/avs.h
>> +++ b/sound/soc/intel/avs/avs.h
>> @@ -89,6 +89,7 @@ struct avs_dev {
>>   	struct mutex modres_mutex;
>>   	struct ida ppl_ida;
>>   	struct list_head fw_list;
>> +	int *core_refs;
> 
> Is this a per core ref_count? a comment or explicitly calling it
> core_ref_count would help.


Hmm.. That's bit of a nitpick. Isn't a 's' enough here? I.e.: here we 
have an array of core references. Array, as the number of elements is 
retrieved dynamically via LARGE_CONFIG_GET and only then the array gets 
allocated.


Regards,
Czarek
