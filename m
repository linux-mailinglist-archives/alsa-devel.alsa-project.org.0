Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41F4E43F9
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 17:12:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A1D172E;
	Tue, 22 Mar 2022 17:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A1D172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647965560;
	bh=CIdfBELaHBTsXic9l++Pinqa8k+eQYve/ygnPBxbVx4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bdUPwnQHTI2e67vbe0yMKO3ofTdxu105wZvfuA0coN4V15Am0h+jWzm4y8EObbNIp
	 VASMYxoRGgJxEXwKl3Dl9DPgu08bxzlKaA67zgdE4JE4CL4vPIl7DeCOgNtQHDamRC
	 YA3ZUN0/WwWpF1YeJq4Hxy9X+KiHLSiELFJr85Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 584E8F8032D;
	Tue, 22 Mar 2022 17:11:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 018B4F8016C; Tue, 22 Mar 2022 17:11:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2E35F800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 17:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E35F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FgU51Ojf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647965485; x=1679501485;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CIdfBELaHBTsXic9l++Pinqa8k+eQYve/ygnPBxbVx4=;
 b=FgU51OjfLDRCEM+AqoUoQqAAMU9nW5EEx2CJpWXk3NyOHAd6rJRPQ+OD
 DLZJhWvEaL7eaMfx2uzOuyuHOaACwCn/Z1v/PTcLetHQdCDwJr0OA8gGO
 GHAw/GVac587pQpyG1jUO9SwGeTmnr6+5frKpK4Wr51hH9JOzi+x3N6Ld
 pWxImfpdtJXh+EDd4bUZyVcPfkcBJGLf6pc16XZucp244mYGhHerIeevx
 wBFJ619hrPfbvPcI2QN0qEIo4rwaPqcc8OVR5FIjWR4SWFFdVg4ykPHjQ
 DVfsPgq3KQZqSeEPHyy4swJ/cp+g42HFBDGy6bvAJSqmyJ4ysuQqWAXkM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="257810522"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="257810522"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 09:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="647088327"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2022 09:11:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Mar 2022 09:11:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Mar 2022 09:11:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 22 Mar 2022 09:11:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 22 Mar 2022 09:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS+6ayoB6KMO3mbPSs1Rq/1gsFvxDBVxUXW5AXw1sFP1QQpg3UZr5u4jfM9CNHm/O7kWEoL5ApKFSrmOZx28hzG05fscmeMqdvpr31y6jilhuKy96zIQvjueYPKIOl5Cs8F5E9bXPP2OTekE72KekoMqFy33wxFzQvqYz1yWTpTBHuGKJ93bn5NhgUjeIhULixFTRp4cX8aZninWZS2DYI/jzCQw8rrY99Berhqi/GRCmEmlxHe/ugcDnFu7c9J91HRsgjzP8hreA4dPiLRwUcCvS2bQmlGxafquOdWt5NfWD7d7DGqW5hryTPk0B5Ny/AIVFk++3aeUiFJNO7nN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gisncG3V/wcvumdJeRPaGHT/ETRpWIkZRgcqhZ/SY9Y=;
 b=jtMjLzBMcVKoQHNuHkHnn3ygs/1hnfl2YbF2KTA+LN/NpzRLLxtNVHVrM8MbtWhhN+3RQHMS3+Hp4FbiaG1jLjYfH+4y7FNth2Q0af02JdUNkm3mvGh21izzGZSMzv94jm+KhZ61VRstWgMEthmJn4R+JGXCBjYtKMdAQ1V6jhuH+kqaAs9KUNe96nENPhmXzIlFG5RdZYJskeHYB7uUDPCXr8mzkKEaQ/yPTox43ovb39F0xxS+80AsVAmHzeKzM1kudNrG1zeqL7GyMSGLSupWFJnvI+yzhi+zbvWsrFuteTwujjTSwNm7Rv/qmfJpalw0TjmagILG1TbUVPudRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB3098.namprd11.prod.outlook.com
 (2603:10b6:5:70::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 16:11:18 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.023; Tue, 22 Mar
 2022 16:11:18 +0000
Message-ID: <c0d0dba6-ad8b-e141-6fef-cf51ba0ddca3@intel.com>
Date: Tue, 22 Mar 2022 17:11:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: intel: atom: Remove superfluous
 flush_scheduled_work()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
References: <20220322154826.19400-1-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220322154826.19400-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0046.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::6) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20b2d4ad-d6b0-415b-574c-08da0c1e9923
X-MS-TrafficTypeDiagnostic: DM6PR11MB3098:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB30981B67BF2016A89739E6D6E3179@DM6PR11MB3098.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hm7ZhGd9XIOQXb1IxLKR1LIxQhswYCi43TIEnH6igBYGKMmbstY/3okXz8KEXf2rhUsyI49I/Y7XYMJ2s1lM/OWdscYxDCmLqBfwTBAYRrZGUy2MDjhY7cmD49gUcoitYgz+P/2xuNmGPacwoAVRYhyfrlh1Qil9Fd8C+nNrWFwHO9Vmva3Ki1yl0KbECMPk3VX9uMx3MPUaaafu2UTwZMvHBz5rSYMMCZc5tIgz1AC/2PpMNDxx5GX350TNyiY+hck6jtowyR79lKV/58R8FNtJpOnHFm0VdU2wspmqBRvR9zq/7hpqnpsa5j2nw0ryl9avW8ZQMDtZG7+os76mna3fvzZKIxf9aMgLBEa3nFsgTv2tQz1klpD69/aCONPF2V007sh1d/FBVyttAGdRKQyz631tfilFXyahgecC5cieuFqnT1tsSY85eu9OI1aPL57CCbawB8QWKnrdYkl0UJzVnqZQ4TrdAS48loxOXjMQYas4trIdya1OuEE10OTtuda7BU+EDQt4MmygZvSW+vas/QmCPthss4yq6+jHjtvf3ZmnRmHeCmh6VmIcn6a7dOY/TuPFkJC8IlX/WSXDT/iDP5uZGnUYcDIOoh97uelUac877I5TdXSczIS3Eq4803TcXGHxKp8mx4d1vcXAEhmD830hkVoIIqKPCYcwwjDtefAmCGTSbELkMzPHlD6176vzWM9uPWgSlHdBSYycclgHbgcgdT4TRz9JpF7hY2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(316002)(6506007)(54906003)(31696002)(5660300002)(4326008)(8676002)(44832011)(6666004)(2906002)(6512007)(8936002)(31686004)(38100700002)(66946007)(86362001)(2616005)(66476007)(66556008)(82960400001)(186003)(26005)(83380400001)(508600001)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3FPSk55WXhTK1ZqWWxOVkVVbDlvVVZRUFA4bUkrYzR1WVh6RXFOSU9abWZr?=
 =?utf-8?B?bG4zd1pKQjdMRnBaYWVtYVhPSHVxTW9kSXVTUHFSSEV2T0UyNmJoUVpaSGNM?=
 =?utf-8?B?bDRObmxVZDJzZ3ZNWG9tclJWbHltaUtQZFRLYXpFQ2txNnFqMXhrMyszVGpO?=
 =?utf-8?B?SnJYVnZSTEZUUkNYMk9HRmg2WGF1SDJnSkp4bjJSaHZnVHJpV0VmbWxwNFlU?=
 =?utf-8?B?bWVQQXZtTlhtNFUwc3JHd2NxMXNZK3ZUU2Z4TDlxMnpod1YzMUNWV21mZU94?=
 =?utf-8?B?UWlpU3RoRW1US0daWGRJWkZzcTJpZW81MDJkRVUyN1p6WmJXSWdyVUxEUlVU?=
 =?utf-8?B?TEw0RFREMDZDR3psOG1zRmZDNHJNbTg2aW54RGJIK09IV3hyOEh1UnIvbm0z?=
 =?utf-8?B?Rk1nK1dldkRoSDQrSnA0WnJva1pWQnRVdWNhaEwvT3hHUXU0UVFUZWRQNE1N?=
 =?utf-8?B?Q21uK1U3dkFhWllzbkdkUkJtWDZ1MzFra0pYSExSS0t2VEt4dDJhRFU4eTY1?=
 =?utf-8?B?b3hQdGhVZSt5disvTVJFbDN5cFYyOG1mOGZDTXBQeklYNnlpWTdIL1lpcHo5?=
 =?utf-8?B?UXo3RnpyM1lRamNwVDk0d3Q5OC91WU5JKzlhejNwUElwcGY3eVB4Z2J4Ujc4?=
 =?utf-8?B?ZTZSeU94OU5tTU9RckNKVU5xU0RkWkJ1K2JTU2p4eFlpYnNEK2N4ZWNQWlRR?=
 =?utf-8?B?THVaMEJPdm8zL2VvSEppQ3lnVFN2QmtCSG5QdDFDTnAzRmxHUWZSYU11ZUY3?=
 =?utf-8?B?Yy9ZL2dOdzFFbUNkOE45WkhieFVtNytEeUNPd1ppMy9QSituc3FPQ21DWXho?=
 =?utf-8?B?Vmh0MHo0Z1dQeUcvaHFFdER6V0xpdmN5eDdZaEYwZDNCTjExdWxMRFVjSU1V?=
 =?utf-8?B?WndyUmMwSzNZZU93UWFiR3dZdTA2Z2Q5dVI2N0pGZXVCeGVkZ0ZUakVoR2or?=
 =?utf-8?B?WUYvc1BOb0JQNlBadnQ1VUxYTmFlZkNNSkxPRlFTSnJXUjBTdGZaZEx2SWRa?=
 =?utf-8?B?UE4rM29PRGJvaURVc0pjMDk2eStYWDAwZVFsbGxQeUovSjZnZXI5OFNFVWN1?=
 =?utf-8?B?aDV3VnduMGIrYUxLaUlVSk93ZEg0TzN6OUdabkdUS0U2K1ZPUEF4YUdZZzVQ?=
 =?utf-8?B?bmxjaWdERTZXTzV4amJYTkVDWkVXQmdodEhKNkVCanRmbDMvUkpXbW9qb3lv?=
 =?utf-8?B?ZE9TSW0ySXRjNFJ4SzN0THh4c3Y4MTJXTkVDODhVVWtZOVlmUnhTblNCVEVQ?=
 =?utf-8?B?Q3VsdWlVTUZQdzJNbDdFaDdOZU90dGt3bWRCYzVEUCt1Lzd2WU9xWUdNNUI5?=
 =?utf-8?B?SXVhcXBRV0JTcUxxM2hpaEFXZ0x3VXF2ZWRrc0dJSk1LM1NQZTZEQnNFQW52?=
 =?utf-8?B?eUU4RzhJYStobi8xc0hHbDVlYngzM0c2cnBMZklWQ1dMTVZmSEU3MXU5a2pJ?=
 =?utf-8?B?SXdXbUdWSHFJTVRHbmtqQmVwWStaRVo1V0YzODQxOVJEMnBXS1VaYTJNY0ZW?=
 =?utf-8?B?N3lQOHU0QlZ5QTg4Nzl4K0h1b2J3NzhORHRqOUx3QXBJaU80VVlKSHVubktI?=
 =?utf-8?B?ZVk1UUZnMHJ3elZ0dWRUL2pSdnRMZzRtakVneVRPK1kxVFprNFczUVk0cWhv?=
 =?utf-8?B?R3UrTW1EZWJpT29xNGJsenlUNnZnQ0kxVVc3dmoyTUV0S25kM1JFWEw1WWxQ?=
 =?utf-8?B?S0Vkb3h3emJSTjZjajA4anhPWVFSKzY0OFkzYmtHaHhSUVBrTXpDMGc2dTFT?=
 =?utf-8?B?L2gzWWxTaHdLdzdQVWVodlFzVTU2L3hLdEJZdE9Tc2hudmhsWHA2UUFUcUxv?=
 =?utf-8?B?Ri9yTXFVb0VrRzdjUm1DdWpBTUZZaVBzZFF4Y3U4cVNqcFJsWWwvNU5Pd01H?=
 =?utf-8?B?aUJ5VEJRTWlsWk9hNm1tZlZ4K3FpazRXRGI1S3dQTjViSXVaeXZkeHB5SGNr?=
 =?utf-8?B?enVGeW1odGR4eEJQYUkwMFlLcURRbDJwS05nR3V6RVhnZ2FSa2ZzYnNwUklY?=
 =?utf-8?B?emtxdXZhdS9RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b2d4ad-d6b0-415b-574c-08da0c1e9923
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 16:11:18.5534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+GAobe4uLs9L+NGv+LWX0HyEbxTmZJ99o/lBWqlzOPQjTI0vl5r6qWLsRA5b1sG4hEPPjgbLb6La8fpHiybBz/DIUaRD520GQexbq8Y8QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3098
X-OriginatorOrg: intel.com
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2022-03-22 4:48 PM, Takashi Iwai wrote:
> It seems that flush_scheduled_work() is called without any real
> purpose at sst_context_cleanup() (the driver doesn't put works on the
> global queue at all).  As the flush_schedule_work() function is going
> to be abolished in near future, let's drop it now.
> 
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>


Thanks for the contribution, Takashi! LGTM so:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

>   sound/soc/intel/atom/sst/sst.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
> index e21e11dac000..3a42d68c0247 100644
> --- a/sound/soc/intel/atom/sst/sst.c
> +++ b/sound/soc/intel/atom/sst/sst.c
> @@ -360,7 +360,6 @@ void sst_context_cleanup(struct intel_sst_drv *ctx)
>   	sst_unregister(ctx->dev);
>   	sst_set_fw_state_locked(ctx, SST_SHUTDOWN);
>   	sysfs_remove_group(&ctx->dev->kobj, &sst_fw_version_attr_group);
> -	flush_scheduled_work();
>   	destroy_workqueue(ctx->post_msg_wq);
>   	cpu_latency_qos_remove_request(ctx->qos);
>   	kfree(ctx->fw_sg_list.src);
