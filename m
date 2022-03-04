Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74E4CD9E4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:14:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BFB1F1B;
	Fri,  4 Mar 2022 18:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BFB1F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646414077;
	bh=R5FxLG2RmMhyT7nYRb3rebTqJMBw0Y9FtvDEPwgbR4M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gORSL6+8DXYknv/IistAHDAXOiN5GzaFJ6eJC5VjVcvha5V0/2MFoUAt5eEwSPkE6
	 C26LhTI3nPsw+KVUi+xQahBdhMNEdUUGdm53lH1tDDNGEJneJLHOOYyW/nsmW17GhD
	 ybZC4HwWw0mYvP9zgMS2ww7wgRUlGQXq37iqnN2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CF5F800F0;
	Fri,  4 Mar 2022 18:13:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71CD7F801EC; Fri,  4 Mar 2022 18:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1611F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1611F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jw3WlXL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414001; x=1677950001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R5FxLG2RmMhyT7nYRb3rebTqJMBw0Y9FtvDEPwgbR4M=;
 b=Jw3WlXL5o0h0uSgnaJea4FuMf1nHfbDnpT5pJXqA62IrGFWOhGsA/R3m
 XxA6Y4u0KUuNMi5sIpxpFYUKlbvLSv3nJoVpg3hCNqEoA8NujEOsRtr/j
 QK5Yjn+T+SdgFo0EOAcxs4L4L89k+GZjlMn+IlxYNlVRAdn7+MLHEgHNC
 i2FAXnHMrbB/DhL7JWcQIEVu0krP9GpJjifqtpSiNxkejzg25209v04SH
 XQ96K0XCnL6pEdEWnattb4CQcIeOcIMm+j9u7o5c+scxfpj/ItKE8Lk+5
 aXEJNi3XEfPdL1PunUC74Tb3anaiak40BAa13lswl7ErtPLSF317UvOuI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="317248914"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="317248914"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="511914407"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 04 Mar 2022 09:11:46 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:11:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:11:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 09:11:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 09:11:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEikgYQBOecR9lWOdBzOl8+OsvYCLBqfGR9m82em/+gpAKa/XSLljXGaXj8e4oCw/nlwzdKoQ6d6gdwR0zbRgRnFdtOsED8gDF0ug1YBhb2OuNB3QNVv8BtZMPCUUUPreW5LE6aXJmz4DX8frSwM4sKtKerNsbrQpDjZQeQug8PCZq5jhTy1b64d82YTjUs2morLsRo/0ZUI9lk8FOgASqUdP8wp2FmNIZxqHLU36Fh5WRryCZZSJgkmfA/uQzd4WAp09p1I+jfJELTDI+jntQ8GnvRdE6g10yiqaydg2Z2BvwWrOFLzJptbMFEMAGkYSyDRYTeTSW90Fa1apJch4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOLKNOSKfqm5+rKKJfDHRZ55WeQnxLSO2GSVLoCu0oM=;
 b=ZfseL/3aMnuJFrdFKhJtM9onfga+REc2tmsxD1bpAsc6Ga9HtpJo1dhoE/xP43FY8xGfDnubh/I8EU0uZQ4TFJ9/Qlm59UERSzacjbRe+FgOwc+HyQRQWY0Coia2cws8+t+0tiDUlMouV4lqJhaWxrwDgDGjINIhECxwJTgQ7rsNTO14rMrVobuggHgRw4vP2121AIvkHu/YY097BylbxRqL0Dq5DwUCRxKP9eO2wENTnzFTlNfTKdIjD3vV8ggVreZ5pYuG+RDaJXIdZqZwTH9y7KPEjcx/dPjf2BcpWF0N0272ReeDvF+kFNEQiTZrTziWhqI7Crjln6sOSLZ3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB5939.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 17:11:44 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 17:11:44 +0000
Message-ID: <9a536988-4d21-256a-254a-d5b422eceb42@intel.com>
Date: Fri, 4 Mar 2022 18:11:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-5-cezary.rojewski@intel.com>
 <3a4bd57f06b9dddca6b7726c462bd0ccaaa508ff.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3a4bd57f06b9dddca6b7726c462bd0ccaaa508ff.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0072.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::49) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b16670ee-8117-4465-c9de-08d9fe020e80
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5939:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5939D35931FBC8F3BCF22847E3059@SJ0PR11MB5939.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +mbCFo1lyMnZ0bcIKwj2CrS8W04D43lBvMNTMv/5+XgtBDpmfLiUuBwp3x4C11WUONzrJNgwoJiGv/1/vy4MjMiefi/SCTrwSIclKw8o2aM/0na/zNyI+7FHIMDR7fGN0thfh5QzDTjfqlssquaHSwhgYSChqaCw/oBJDaJWlPJ7tiACxq8yu0Pk20IaAmciTE1eRvxkvE5N4Tnvn8K5H704JdaRZaK6pst0qw9nFVe4xL7uX/MobSrUCWlJQYvtTYw+2c+TM8a7YfOFwVGNLDyy/hSNZByKqaWXw8vHM7b3HqCTc/Hr4OjTI5a4QMl6gzWb9enQ57GMTfZ/HZJ2Bv4tRBkf3sBNcJ2hQG4SgppIwSqJkLJ6dbXvIEcrO2b1ygANdFQLGURNC3H+QIPPC4hXjukNnnWOQn1lPswLxNfWJvtl4kQjaL6TlQ/cMV+CThQXeGsIrmJ/UvWao+Qi7MAUCrdch1gNOJBGyvydg2IuAoqjeB+6wd1NgbsLMVR2oUm/wDZJjpEjj1AwpYkJcUCdKgVzirIJ9e2lo6nvMek2tldYeneHShNQySvA/Vzp5Nk7PX100NWxP0VcAXk+yK4rhkrkd3dIGtZVGDDe3RP7yqgOt2xujL+QPDCZWOozQqynch5uJB+9qOciZS6WL/qbOs06krF+B5W8LEDMS9bmks0zdfIHMmZjWGy+5AMvrkCK/gVtQtvB0jpTmI+1eIZP2kL2kKuiBxlZlMy2pi6lLWVlwT4m0hQkROEjLTDZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(66476007)(31686004)(44832011)(2616005)(6512007)(66556008)(316002)(36756003)(186003)(26005)(6666004)(7416002)(5660300002)(38100700002)(6506007)(53546011)(82960400001)(66946007)(2906002)(83380400001)(8676002)(4326008)(6486002)(508600001)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlaUHRHaG1FSzl5QVBDdUd5RXYyS0V4YWJEdHZPUzZVUEJITlZWOWUzZ3Fq?=
 =?utf-8?B?TXhvVlBHTU9EakdLN25NZjNDa3VCWDlXSG8vNGsxdXpUS3ExTGgxeGFBS0gw?=
 =?utf-8?B?eklhQVM0c2FaTXNjNWlRMWFHZWIvS29nRXNaektOdHRhV0Z2NGdEOTFuL3F4?=
 =?utf-8?B?UEROeXQwd3RKSm9ZMFFoZ1ROUSt2T212andJaXlNYTl0UmlpUmxYWDVXdEsy?=
 =?utf-8?B?U213dUpiRFRBQ1B1VCtQNzFGOE5MU1ZuTTdlc0pJMGtqME9Hcng4TDVRdU5n?=
 =?utf-8?B?ODNoRUVNeVZRWEhjemh5TTVsZmFnbU9KYW8vY0RoVHhpVmtnZUJpaTZwWm1G?=
 =?utf-8?B?REJHTVVNWXZtMGVwRE4xQndSMnpuMUE4UlY2cFhhSFVQRlNXVHVKQ2tGaFNz?=
 =?utf-8?B?amNwYUg2L2FDTGJPcGh0WUJTRWdYbnhkQU5LZ2JRL1JjQnFGWU5tL2Y4bTM4?=
 =?utf-8?B?bXRWeWJNcTVhSmpxWHRDVmhOVURiaDlPUEVxT3dxUVlCWFpYZ29VU0N0U1RF?=
 =?utf-8?B?VEtQNXNEV2pEMkdWd2o3NStURjR2MTF2US9zdWpNSy8xdXE4VC95U2kwU2x1?=
 =?utf-8?B?dklWYzVMcUhQYjNqblJSaWw1ckFoSkplaWYxUmRJZk00S01SNm5TK0k1SjJq?=
 =?utf-8?B?UEtSUUJXM2FxM091d3NGOFFFSVQ3RHpOekhFcGRpcEVKUm4xaWZXLyt2dTZZ?=
 =?utf-8?B?RUtiK2hpRnZKOFVHMFZSaXI2T1BrajlGTTVHekk0UUdCUGVuUEs1aFpNUEVQ?=
 =?utf-8?B?c3ZqdWpTUXZmN2F6UllkUWt4alFwQVZmaUJLd2dsK0FzbzU1bWkxK0lMNkFG?=
 =?utf-8?B?UWhNS0NNa09zcDJGaWNBd2t6Myt5WEJ6RFRadHVVSkpybC9sTGUreDVJMU5m?=
 =?utf-8?B?N2JPeDhSaWE1VWZMRXl2K3luemd5RU5KRVpueUJUYU42bE5kOEV3clpLR2Z2?=
 =?utf-8?B?WGF0bHNIbktuMnlDeHdKcmxITUFqQ0FObytvZnRJdUw4U1ZkTkd0TWRhVURp?=
 =?utf-8?B?Nitra0gyV3NZUHZwczVTNXFLNEZjMXlVU0RnUWZzTFBmeXhLNncyTVpqZVFQ?=
 =?utf-8?B?Z2IrQTJqWFVJemNYYmJyZ2RFNVJkektpbzA4cWJWU2lHNjdFME1BMjVKRERK?=
 =?utf-8?B?ZitadEtRLzNmNTF4SmhKNG16MDZpN1pjY0VuYTFPa0NRNmF2cXhrYzVZUWM2?=
 =?utf-8?B?Q3VPZWV4ZHRvUTB4M25jSFFvMmJhWG1vVlFwZWRWejc0SDZwdXM5OWx3TFUy?=
 =?utf-8?B?c1YvelJBaDhHOFh2VGVsODJndTVWZUZDKzVQNEdhQVlEY1VnVzNBZlNhUXR4?=
 =?utf-8?B?N3dERGhlRGQ0bU9ZbGk1a0pFMjRmWWNqUXRYWk5UZDVtbXc0RVR5dExLVmhp?=
 =?utf-8?B?WVFBRERRQXRXMFV2Q25EZ2pzZmFteTJYNWxEWlh1Z09tSXJ0RzJ4aDI1MnpR?=
 =?utf-8?B?T2pZNVJaYlBycVp3R3JqMnNmSU03Q1FhTGpkYTY0U0tzWTVjYTZSdm9HWitW?=
 =?utf-8?B?aWV4cEpzWGpRUWkrbmo5RkYyMGFvak4zNU16UDdOY0Z4TDJPS1ZkNWduRi9n?=
 =?utf-8?B?RFJRQWduNUhnMFoxUzJkUTZEbjVsY3YrTEo3RDVPcG1XVFEvbDNXTHIrbmJM?=
 =?utf-8?B?aXFTV3ZaYzg3K01VYWRYMGNuTzZMQlg3TWJ6cTR6eGxkTTYwZDZ5YjR6Rlhj?=
 =?utf-8?B?R1Yxc1VtdldBU2MwcEU3SmJraVl2Ni8xeW8zeVBWUzRDYUkxRHJyaE04bitz?=
 =?utf-8?B?ZW9iZmV5dm05dlREWFdNSEFCK1BVUEN1djE2VG9vb1BENElTSnJQQkplUThE?=
 =?utf-8?B?SUtCbE9GNUU2YmpzUEFmZzlhNjdiUmE2VXMzcDdCTkovSUFsM2MzeGNzemlF?=
 =?utf-8?B?emZzemlicXEwMGxpMnJja0JBYzQrWGFFbnI3TE0vbm5IMlpZaXJQaGcwU1lD?=
 =?utf-8?B?WHc2Ri91a1dZZ2srNm1OSFMzVjJGYThnOXE0QW1VKzZnVWJmYm93RTlJSERp?=
 =?utf-8?B?eGw2MktZTXhXckdQaThGWC9yOUFjeFg0UllpZjlsTVU3V040VjI2eWJWRjQw?=
 =?utf-8?B?TGZtdDRUSzZjZlRYRVMxTjU5VW9HVXN6aGtEeDF4SEtyTE9lUE1pQzZPZUMx?=
 =?utf-8?B?M1IwYTFSOGYxTHFyRURNUm1obXQwV3QxcHlFU3cyTVZUd1gwSXhKd3VTQUtH?=
 =?utf-8?B?TnAzWUV3Y2dab1pnNW9tTW8rUWJZVk4wK1VrbHk2M3JCQWFYUDJLMSt5NFlL?=
 =?utf-8?Q?ftQ8tbYS9rrGll74wv/OPxuIFVyddNFY92NIZEu9r0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b16670ee-8117-4465-c9de-08d9fe020e80
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:11:43.8846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ32aOz5/xCZSBGSYU/czodfPaTfVmv7+YM/zqaSvUmuOC9L0llVzN3fTleFFygHMRMf2tu4tjBpoofbhtA22yWVqE/eYFR0Lw3UEHJWKK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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

On 2022-03-04 5:09 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:

...

>> +static inline void avs_ipc_err(struct avs_dev *adev, struct
>> avs_ipc_msg *tx,
>> +			       const char *name, int error)
>> +{
>> +	/*
>> +	 * If IPC channel is blocked e.g.: due to ongoing recovery,
> Do you mean firmware recovery? In which cases do you perform a
> recovery?

Thanks for feedback! Consider dropping the unnecessary bits so it is 
easier to navigate through your responses.

Please note: kernel mailing list is not for explaining SW <-> FW 
communication details. Feel free to contact my colleagues from firmware 
team if in need of any FW-iface details.

That goes for most of the comments found below too.

-

Yes, I mean firmware recovery here. Code found in this patchset shows 
that message timeout is one of the reasons.

>> +	 * -EPERM error code is expected and thus it's not an actual
>> error.
> And what happens in this case? do you retry the IPC after recovery?


Not at all. Why would you want retry IPC after recovery in the first place?

>> +	 */
>> +	if (error == -EPERM)
>> +		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n",
>> name,
>> +			tx->glb.primary, tx->glb.ext.val, error);
>> +	else
>> +		dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n",
>> name,
>> +			tx->glb.primary, tx->glb.ext.val, error);
>> +}
>> +
>> +irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id);
>> +irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id);
>> +void avs_dsp_process_response(struct avs_dev *adev, u64 header);
>> +int avs_dsp_send_msg_timeout(struct avs_dev *adev,
>> +			     struct avs_ipc_msg *request,
>> +			     struct avs_ipc_msg *reply, int timeout);
>> +int avs_dsp_send_msg(struct avs_dev *adev,
>> +		     struct avs_ipc_msg *request, struct avs_ipc_msg
>> *reply);
>> +int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev,
>> +				 struct avs_ipc_msg *request, int
>> timeout);
>> +int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg
>> *request);
>> +void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
>> +int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
>> +void avs_ipc_block(struct avs_ipc *ipc);
>> +
>>   #endif /* __SOUND_SOC_INTEL_AVS_H */
>> diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
>> new file mode 100644
>> index 000000000000..c0722f8b195f
>> --- /dev/null
>> +++ b/sound/soc/intel/avs/ipc.c
>> @@ -0,0 +1,387 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright(c) 2021 Intel Corporation. All rights reserved.
>> +//
>> +// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
>> +//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
>> +//
>> +
>> +#include <linux/slab.h>
>> +#include <sound/hdaudio_ext.h>
>> +#include "avs.h"
>> +#include "messages.h"
>> +#include "registers.h"
>> +
>> +#define AVS_IPC_TIMEOUT_MS	300
>> +
>> +static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
>> +{
>> +	struct avs_ipc *ipc = adev->ipc;
>> +	union avs_reply_msg msg = AVS_MSG(header);
>> +
>> +	ipc->rx.header = header;
>> +	/* Abort copying payload if request processing was
>> unsuccessful. */
> This seems misplaced? Why would you called this function is the status
> showed an error?


This comment is part of Pierre's feedback, not misplaced at all.

Header can be message-specific and contain valid info to perform even on 
failure.

>> +	if (!msg.status)
>> +		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
>> +			      ipc->rx.size);
>> +}
>> +
>> +static void avs_dsp_process_notification(struct avs_dev *adev, u64
>> header)
>> +{
>> +	struct avs_notify_mod_data mod_data;
>> +	union avs_notify_msg msg = AVS_MSG(header);
>> +	size_t data_size = 0;
>> +	void *data = NULL;
>> +
>> +	/* Ignore spurious notifications until handshake is
>> established. */
>> +	if (!adev->ipc->ready && msg.notify_msg_type !=
>> AVS_NOTIFY_FW_READY) {
>> +		dev_dbg(adev->dev, "FW not ready, skip notification:
>> 0x%08x\n",
>> +			msg.primary);
>> +		return;
>> +	}
>> +
>> +	/* Calculate notification payload size. */
>> +	switch (msg.notify_msg_type) {
>> +	case AVS_NOTIFY_FW_READY:
>> +		break;
>> +
>> +	case AVS_NOTIFY_PHRASE_DETECTED:
>> +		data_size = sizeof(struct avs_notify_voice_data);
>> +		break;
>> +
>> +	case AVS_NOTIFY_RESOURCE_EVENT:
>> +		data_size = sizeof(struct avs_notify_res_data);
>> +		break;
>> +
>> +	case AVS_NOTIFY_MODULE_EVENT:
>> +		/* To know the total payload size, header needs to be
>> read first. */
>> +		memcpy_fromio(&mod_data, avs_uplink_addr(adev),
>> sizeof(mod_data));
>> +		data_size = sizeof(mod_data) + mod_data.data_size;
>> +		break;
>> +
>> +	default:
>> +		dev_info(adev->dev, "unknown notification: 0x%08x\n",
>> +			 msg.primary);
> info? should it be a warning?


Pierre's feedback was exactly the opposite.

>> +		break;
>> +	}
>> +
>> +	if (data_size) {
>> +		data = kmalloc(data_size, GFP_KERNEL);
>> +		if (!data)
>> +			return;
> Should this function be modified to return the error? If it failed
> here, all subsequent IPC's rec'd will also fail isnt it?


Hmm.. we are servicing an IPC here, can't return an error code, really. 
Also, some memory could have been freed between IRQs.

>> +
>> +		memcpy_fromio(data, avs_uplink_addr(adev), data_size);
>> +	}
>> +
>> +	/* Perform notification-specific operations. */
>> +	switch (msg.notify_msg_type) {
>> +	case AVS_NOTIFY_FW_READY:
>> +		dev_dbg(adev->dev, "FW READY 0x%08x\n", msg.primary);
>> +		adev->ipc->ready = true;
>> +		complete(&adev->fw_ready);
>> +		break;
>> +
>> +	default:
>> +		break;
>> +	}
>> +
>> +	kfree(data);
> You alloc memory for "data", copy the data and free it? Where is it
> used?


This patch implement the backbone for the entire IPC protocol. Specific 
handlers are not found here.

>> +static void avs_ipc_msg_init(struct avs_ipc *ipc, struct avs_ipc_msg
>> *reply)
>> +{
>> +	lockdep_assert_held(&ipc->rx_lock);
>> +
>> +	ipc->rx.header = 0;
>> +	ipc->rx.size = reply ? reply->size : 0;
>> +	ipc->rx_completed = false;
>> +
>> +	reinit_completion(&ipc->done_completion);
>> +	reinit_completion(&ipc->busy_completion);
>> +}
>> +
>> +static void avs_dsp_send_tx(struct avs_dev *adev, struct avs_ipc_msg
>> *tx)
> send_tx? send and tx both imply the same isnt it? maybe just use one or
> the other?


Matter of taste I believe. Also, aligned with the catpt-driver.

>> +static int avs_dsp_do_send_msg(struct avs_dev *adev, struct
>> avs_ipc_msg *request,
>> +			       struct avs_ipc_msg *reply, int timeout)
>> +{
>> +	struct avs_ipc *ipc = adev->ipc;
>> +	int ret;
>> +
>> +	if (!ipc->ready)
>> +		return -EPERM;
>> +
>> +	mutex_lock(&ipc->msg_mutex);
>> +
>> +	spin_lock(&ipc->rx_lock);
>> +	avs_ipc_msg_init(ipc, reply);
>> +	avs_dsp_send_tx(adev, request);
>> +	spin_unlock(&ipc->rx_lock);
>> +
>> +	ret = avs_ipc_wait_busy_completion(ipc, timeout);
>> +	if (ret) {
>> +		if (ret == -ETIMEDOUT) {
>> +			dev_crit(adev->dev, "communication severed: %d,
>> rebooting dsp..\n",
> Where does this reboot happen?


This patch implement the backbone for the entire IPC protocol. Specific 
handlers are not found here. Message remained.


Regards,
Czarek
