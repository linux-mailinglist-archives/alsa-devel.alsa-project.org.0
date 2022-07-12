Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF765715FA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 11:44:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01F6163E;
	Tue, 12 Jul 2022 11:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01F6163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657619053;
	bh=oVr1C90v4/CK1oV4WFqY8MNxGxwgcZuRvPdo5peQ+U8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KyeFCJDWOYdo72EkZ2hpAT3DpdHw3gtYGDWOpLPhNoyEJ8Fn7kGkpzPUeEoui0qqx
	 o2P/hLxeoWRaYH/VwrSuhc9rxMGF07xOwFRsnNXZDgJHojSrB/0Hnn2kk2CY+2VY1Y
	 5sngnaRjtQgvs2vGhBDP7mxd7vbnCNtmmCvuCvIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE94F80279;
	Tue, 12 Jul 2022 11:43:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A49EF800BD; Tue, 12 Jul 2022 11:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEA3DF800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 11:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEA3DF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S3n8bG4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657618989; x=1689154989;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oVr1C90v4/CK1oV4WFqY8MNxGxwgcZuRvPdo5peQ+U8=;
 b=S3n8bG4YqUX0p86Z7ebuY1KBmt7lM0IEGgzQuug25deRuqv28lMoV5lY
 2BqKQZ/0TLRsK4RMNmi3RtK3bpaaLB01K3aQsouNJ72BAuALTLzDWDFv1
 gRtcun41xWTCE9LVUjmyu+3Gdu8Hg1Weq6P889+tv9nJcD/2LizTO2dXS
 k4gkq2icNyNFa9mx2/+h7JHUrgzg9ZVwsf8EXisVMHBTSoROs8tETYmhU
 DgStd51gR4vx97U8vuVQ91dtjcpTeEAYKITFXzXc84xsMUx8sXIEdUUYp
 K9XNDXPwhzRofWdFyYEqTYQyB2yZOZisgooY6xUtLIZHDc+UwFW1Ui9R2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="286016836"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="286016836"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 02:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="737422782"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2022 02:43:04 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 02:43:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 02:43:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 02:43:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 02:43:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrUqMMHAe1VZhuCRZKdidsKNYmbBrcEht8nMVoVAzXd1+ru8XcR/M9xLe28GoOEhIL7k73PoNCJf+x4JPUw0qLDWtGu15lELQxbsnHzpXdLdNhb79Q/fazUVP+/8ltmvBOGqmWCEa79P7OwVhhOp+S22fu0VCf4vuwBKB43nFhJpEdlCkGeG7ZZfHBQ2cp/gk/20QnbzD8KpKqt+OP+aEg1UOii6la9tm38TJntpzvcxXuhSwMAFLAn+5VnhcVko+Va+DbMinM+7YdY16HyT/m1NscJye+FHLmBhVQihA1di3+etrBZZXXtpK6fwgEohO2xXdhMKLwgcysAKHD04tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZGfUjlva8do05zaW2Z6UGXutv+ymsyrGImxRKc1+wk=;
 b=Pi5nq/7DHxsRnI+EoeKJ2vL6H6y2cakknr5Hr7deM31XiHHMKu9iV+u9QhKDsRPs0XPLKG9+NBUBJp0GMnkK5e+OxwZCT2dDWEVgmVgUVh8n3GW41ZN2tZxYNM+yRDsjZaAIy8+ladATncUapebAFrA71vFGKE7auPyp9Tkj3fEcGcvATennFjHyus3wKf7OcLQFbJdVuTkhiWiSkOuqU15muQPaOD55Ldot2sGdPuvsls4e7SuTAG5rTkQsG9FQlF+qvl7gbBIvZoiXM5IkxKLlQDqdJT54P0TKW6a3cIITsb8oiOSshxtQK0eiWEu2idW/L0SUDUZIjcPNqxTWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MWHPR11MB1951.namprd11.prod.outlook.com (2603:10b6:300:10c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 09:43:02 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 09:43:02 +0000
Message-ID: <8bdd56fc-de6b-381e-24f5-5d2c28e337f7@intel.com>
Date: Tue, 12 Jul 2022 11:42:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/9] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-2-cezary.rojewski@intel.com>
 <878rp2i6sj.wl-tiwai@suse.de>
 <2966b410-f00d-9b33-fcfa-30d484455579@intel.com>
 <877d4jsppp.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <877d4jsppp.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 631f8881-182f-41f1-f6a3-08da63eae9b2
X-MS-TrafficTypeDiagnostic: MWHPR11MB1951:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bsBelqYb4iQ/6X15gFccfTaiGdSaOH3wDgHBwH56NfCh2FeHCHgjcOl2S7Se5NYoFds83ZeowpZVgZHx+BS5xACLgG5JX3kwAEOml7jtBRSFmwrj+Rjx3SGhDtGQ4zzf9oI6Q5BDMm8uFTOVPjFGsrUDBXi/GYgLZYVXQMbyxKmqwBRDlZjfasjXTEtFkFCzB9wKWpPnZQVZxFPnnlmFlU/r3yroZrn9DM6fNTzhYdI0bt5yIWuzBCwvb1OJ7DkLasUY8kIOafe/sj4NZmZjy79eI/Z1rF6qoJQ/pdXMdAerQyzzMQiPRKvbPHpYO3/LtWoekyqW9x4M8tpSUM8iQCpBHHmaum8g+cy6BD4rIoCrQHO2b9z57uAAPt4Lca4+FbqNqTlDodV3v98cIpnFzCIBSVAQNiCB9pJqcBSTD6MMeZe0Y0dDyxgq7sAeY+71ciB2mteO3GHbyVaZfHre2iJNLgN0Uu7xwxZoljPrHLnnmTQXxHy4SqTpQ1ociUkc9pBQrC3g97/AzKNebAObY/oKJFIH2axETcTBlFPgQViblJzjDdGnvWaKiszpEXlm7JoX8Ax5D54uhGnH6MCHnDFRi/wLxwmMU+QUs34NYHlmp4D45MSMadwOoSDKgF9Jot8hdTct6Hk0mWJmpXqOk84pnjzQNd6mHr6GXphmd1rTjJGB1BElfwOYZpmEtYVGr1y4HNF5/vrXjfeGFQHPROZ0aYYeMhwezQcnazefYY5ma06j8a/8Zkq4QL4CfDfWik+YrFaNTMGYKc8rQKd2Gxio0+42j5K8eTf/xzRlU1ta3gzDFefCXsVnkoEAwMuzz16CJMAARzAxTIdxtRefOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(346002)(136003)(376002)(396003)(83380400001)(2616005)(38100700002)(82960400001)(66556008)(66946007)(186003)(5660300002)(4326008)(66476007)(44832011)(8936002)(6512007)(8676002)(2906002)(53546011)(41300700001)(31696002)(6506007)(478600001)(316002)(26005)(6916009)(36756003)(86362001)(31686004)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWVTOVlTUk5uT3Z5TmNIS3JXbk01SU41RmhsVDlyM1p3a1ptaExSS0lVQkU3?=
 =?utf-8?B?eGFaVjk2TDM2eWZvcklmVzkvS0NXZGtzVjliQ2QwbXFlWUtZMm5sbmNzbnpo?=
 =?utf-8?B?NGY0c0M2WXQ5alBGbVl0azl3RU1Vb0VaNU4wdzg5dTlsS2FaUkh4SkJrcGZx?=
 =?utf-8?B?QThaS2tvc2hEODBaN3RKejBBU3JGMitqalF5UC9wTEVGdk1jVDB6dlNESWw5?=
 =?utf-8?B?b3BMcUtoL0pueUVQbXVTOEd5cEUzVzJBd1pzam0wSnZ4Y0t0cGZzUzZvR1B2?=
 =?utf-8?B?WVpEeDlYdVMrd3c2aXRhTEtsTW04UDBCOXloNGw2NzlTR3RvQ0haVDQxaVJs?=
 =?utf-8?B?eEdycEgvYVlDZ0hXTlpGbzBNcVRySFFoMlhvVThNcFdKU1AxY0NHRm1lbEp4?=
 =?utf-8?B?MzVNU2ZuWThuWVkvNzFxSjE0a2dXbndJMkIrY2dCNHh1bkhvN01qdzkxV3A4?=
 =?utf-8?B?cU1uQ1FyTUpmclg0bjdCWVVBKzVKT3ZNS3Z3UHFMZVIxV3AwVmZqMVhaRjMr?=
 =?utf-8?B?QWwySVdwQ0JlTllhT0pROEtHSGdqT2prRWRScU5yWWx5UDJVaTg1U1lla3lj?=
 =?utf-8?B?VHNiZmw3UWRpemV4S1ByL0dTK3I0WmdScTNHK3RzR0JsZEhxRklqSC9rQU95?=
 =?utf-8?B?dEwwclY1UmtzbjBBczVsSHMrQkYrb3NHa1NnOXdHT25leGQ2ZFFWejFxSTJu?=
 =?utf-8?B?MXdRUnMyN2ZvNmhEbzdUREhYdzNJWWFSZEdHUHFIaDlZR3FXQTJjMHRXeHJ0?=
 =?utf-8?B?aWo3VCttamhGT1VlbTJoNW81QThwWXdUUDdkVW4rL2s3a012Mk42a0M4UEEw?=
 =?utf-8?B?dGpkTmF2MVBrVmhqdjZhZ3gwSnZoeXpYL2cwdGYzS1lZbXNmVE5kOEVrYnNv?=
 =?utf-8?B?ZmlHOVZJWTRNME9SSjJEWWRmN1BLaU9qMTVVSEt4ZVYvYzkxaDZWdWp3dXpl?=
 =?utf-8?B?STdZYW9MdmpmZWFhMG82VExZVU1URmVIV1ExTnloOHdROXlUUHJHZWpvR0ti?=
 =?utf-8?B?eCtmSER2UmY2aHBSV0FoQWc3UTNMbWxtZEU3bEt1NktOQlFwMnk5UnBlU3RO?=
 =?utf-8?B?Ukt3azVReVBiVmhaWTMxSVpkbUsrMTUwNFMxajhxVHQ1dzY3WHM2ciswOXU4?=
 =?utf-8?B?eE5LYXZpbTlBb1lFaHlRMWphOWdXWGd0MisvdWZnR0NpdTRNUEJ2Q1hBTjY5?=
 =?utf-8?B?RDFiUjFKckxlRnhCY2R6UWZleGEwbzhmcUVVUUdKVnRmb2Z6TXNZYm5MSnpN?=
 =?utf-8?B?eTd1aXJsS0JGWFFSc1F2K2xlYzRMMFk0R3dtQ0FGNXlVVVJOeElTb0c0bDMz?=
 =?utf-8?B?dWJLZ1VFS1dIUTVXTmpVUzZhVVVEY1BkaGQ5VG1OZmtuMkpROGtjR2YzQTla?=
 =?utf-8?B?dC9qd3YwdnkwK2F2VklJSnd6T2lqL0toSjBPc21NZ1RHb1haUUVKRHVIU25T?=
 =?utf-8?B?RDdMbkdkWHJOSHd2T3J5NndYc3NwejJwak5KTklWNHJMQnQ1blRDMVFoWEdC?=
 =?utf-8?B?alNCUkRlbUpDZis0d05rL1pncmZqcFJ2MFd1MlNsWWpHdDBOcXRJeGVsckVz?=
 =?utf-8?B?V0tGTko5L05MbGNxR2w0RWxzbTVjWW9tZXhVSFdwa09CbUpoZFB4ZTlOd2E4?=
 =?utf-8?B?S2crYlJ6OWhtK2lZSnJWM2dNZWtreDVkWVMycVFBUkJyTk9VV1l1U0xTUm5y?=
 =?utf-8?B?QVpHUWxzUnpPU21jQjYxVFdCQmpmZnc2MFRvT2pvRWVGY1RYUFRsQ2lXdTh6?=
 =?utf-8?B?MnhBL0RDZUdTOHd3YzkxSmFsNFZQN2NOdnZhTWVZVVZhU05qVEVoSkp4cWRu?=
 =?utf-8?B?RXJTQ1FUbUhHZzdTQWJIRjNPZHRIdmpxSitpMnJUS09PYnc0WVQ4ZXVRQjMv?=
 =?utf-8?B?M095T1pCSzVsTFFDeWxLL2lIRUZ0NzhkNVpuSVhMWkd2SFNQa3d0dzV4VHMz?=
 =?utf-8?B?WE4vWXljVFdCWXpRcGtKTWtKN2tOV3RXL2kwNXFKdjRPamc0WVBheURVQ0RZ?=
 =?utf-8?B?VGx1OUMxTGJVSWp6NzJ1UjA1SC9mOW1abDM5ckRUcThWanFOUXhia0o3L0Yv?=
 =?utf-8?B?VTJJZTVOMzBITVRoRzRWSGQrK0pJOUFxOVRON293Tlh0YlZkV3JWdFROaklH?=
 =?utf-8?B?dmlyVlU2WEtjTkxnbVc0cVFURWpGNTIvZGVTcWlES3VQRUFWdnhVWndqOFYr?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 631f8881-182f-41f1-f6a3-08da63eae9b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 09:43:02.3006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWWvRZOrnVkBYVJwEA26eij2n/K5N/iIG3Jn5z0UN2ZqcAh2SVcnfHC7Gny9WwKT1107Ib3JS/meVdAJs4PwMKqs1ZJVFc6VxCCrIbqlj1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1951
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-07-11 4:12 PM, Takashi Iwai wrote:
> On Mon, 11 Jul 2022 10:25:17 +0200,
> Cezary Rojewski wrote:

...

>> avs-driver i.e. the bus driver takes responsibility for the codec
>> device only. There is no real probe(), just the device creation and
>> initialization of its fields. The rest is handled by the component
>> driver (sound/soc/hda.c). If this field is cleared and the test is
>> limited to reloading HDAudio codec module alone, we get a
>> panic. Something similar to the stack found below my message.
>>
>> In regard to the other question - are presets freed at all? It seems
>> all of them are part of the static device-driver matching list. If so,
>> the pointer is always valid.
> 
> When the codec driver is unbound and the module is unloaded, the whole
> objects and symbols are gone.


hda_codec_driver_remove() won't get even called when soc-card is being 
unbound so everything is still here.

>> [  136.827856] RIP: 0010:hda_codec_probe+0x16c/0x560 [snd_soc_hda_codec]

>> [  136.828568] Call Trace:
>> [  136.828593]  <TASK>
>> [  136.828628]  snd_soc_component_probe+0x3a/0x60 [snd_soc_core]
>> [  136.828981]  soc_probe_component+0x276/0x4a0 [snd_soc_core]
>> [  136.829274]  snd_soc_bind_card+0x819/0x13d0 [snd_soc_core]
>> [  136.829560]  ? __kasan_slab_alloc+0x32/0x90
>> [  136.829614]  snd_soc_register_card+0x24e/0x260 [snd_soc_core]
>> [  136.829900]  devm_snd_soc_register_card+0x48/0x90 [snd_soc_core]
>> [  136.830204]  avs_hdaudio_probe+0x298/0x2c0 [snd_soc_avs_hdaudio]

>> (...)
> 
> Hmm, in the Oops above, at which moment,
> snd_hda_codec_cleanup_for_unbind() is called via which function?
> Is it the unload of HD-audio codec driver during the probe of AVS
> HD-audio?
> 
> The preset is assigned to the given HD-audio device object for the
> attached codec driver.  Once after the codec driver gets unbound, you
> must not access to this codec driver's methods any longer, hence we
> clear the preset field.
> 
> So I wonder how the access to the codec->preset happens after the
> codec unbind.


Test scenario:
- enumerate avs-driver stack on machine with HDAudio codec present
- rmmod snd_soc_avs_hdaudio // just the machine board driver i.e. 
soc-card driver
- modprobe snd_soc_avs_hdaudio
 >>> panic <<<

snd_hda_codec_cleanup_for_unbind() is called in more places than just 
HDAudio codec driver's probe() and remove(). It's also called whenever 
HDAudio codec soc-component is being removed. Relevant part of the stack 
showing when does the cleanup function get called during rmmod:

[  220.549349]  snd_hda_codec_cleanup_for_unbind+0x25/0x451 [snd_hda_codec]
[  220.549536]  ? dump_stack_lvl+0x45/0x49
[  220.549568]  hda_codec_remove.cold+0x14/0x138 [snd_soc_hda_codec]
[  220.549609]  snd_soc_component_remove+0x34/0x40 [snd_soc_core]
[  220.549942]  soc_remove_component+0x113/0x120 [snd_soc_core]
[  220.550249]  soc_cleanup_card_resources+0x1a7/0x4a0 [snd_soc_core]
[  220.550561]  snd_soc_unbind_card+0x9e/0x190 [snd_soc_core]
[  220.550885]  snd_soc_unregister_card+0x28/0x80 [snd_soc_core]
[  220.551193]  devm_card_release+0x1d/0x20 [snd_soc_core]
[  220.551527]  release_nodes+0x73/0x170
[  220.551549]  ? preempt_count_sub+0x18/0xc0
[  220.551576]  devres_release_all+0x10a/0x150
[  220.551600]  ? devres_remove_group+0x260/0x260
[  220.551630]  device_unbind_cleanup+0x14/0xd0
[  220.551656]  device_release_driver_internal+0x146/0x1d0
[  220.551688]  driver_detach+0x81/0xf0
[  220.551716]  bus_remove_driver+0xae/0x170
[  220.551743]  driver_unregister+0x4d/0x70
[  220.551770]  platform_driver_unregister+0x12/0x20
[  220.551799]  avs_hdaudio_driver_exit+0x10/0x12 [snd_soc_avs_hdaudio]


Regards,
Czarek
