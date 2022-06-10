Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCA54672D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 15:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53B5E16FC;
	Fri, 10 Jun 2022 15:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53B5E16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654866797;
	bh=axrogrAF2AubXScCKe9CVAExs7ZLNPZLA884nYIlh2s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h44bl9kFaiZPIpuNaBtJTPvH6U9EAlWyaCFUkZcJ7OWPctbzf4fz7cAShEhzoo6Fd
	 uQ/ndHprbgN7hHXB4t8hl6GpaZlZAGts7HOg3X6wCYPDL5aYXdOgPwsRvm+nNwGSk/
	 ptbi8Gnpy/6dQFFa1XWV0AlhbpyeJjmMTOJKeg1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 434F9F800DF;
	Fri, 10 Jun 2022 15:12:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C0E6F804D2; Fri, 10 Jun 2022 15:12:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6504EF800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 15:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6504EF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="F251Dk3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654866731; x=1686402731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=axrogrAF2AubXScCKe9CVAExs7ZLNPZLA884nYIlh2s=;
 b=F251Dk3TYa1OgdVBPzVOIQW5Oz3rbqIFB759oQTY3DqsCM6tlvtLvKsS
 6RyHF3h7vLXuEYyukIskhNX17aRx4pi5L+4YbsSieaE3iA+NwPT6JyKkm
 D9gEttnraDMkKu9llbbKNPaC92SGhuPZp6tuOjKB4fmNV4iDfaBjF7pUM
 vGDTT9zWgmnDa+VjqF2bIu3ZeY+xjV25gejBuj2j6VYWjItgWTAf5EIz/
 wVrMqUbPV/PGtjOsHQJDc3+6S2LU1tSCqXMBQXtMieKMQU574ROp0FklH
 E265VbHbPHJXuTJ0BuLf8m6bkHw15x3LfSoIc53TsDSyftXwC+Lo/FY85 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278424241"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278424241"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 06:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="671838695"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2022 06:11:47 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 10 Jun 2022 06:11:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 10 Jun 2022 06:11:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 10 Jun 2022 06:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmnE1BAEtWzToD8WZOjfmGOwPIoakMbgdZhvTwPEpHYR2fk86YY5f1u6aEBagVqmVzZp8pP44jDn5emkxdeJ9nmjfPcqoei7ze4OY9Q6cjePe5ulIDbt/NblOmG8DGOx0CJMWTWKTX7n1r6ldOUAbzBnC3QIP47MTZ+MzwiH+whL/nFBeen2mUT+By82uqHfHP/e7DhJs89CBwrtekrumE5TJMYH/QsEYwXK+mblR24b0A44C3ROlTXN1oV3ydLR/7z7KT5Z1hE7lRJhkYgEWDrLVB+n3cw9wWKZlZj4u83Mx6fw3YztLZvwF6MJDzK4FAdbDQNSZQSXvYte3pPvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8c/ldj6IyGwIfl8zMuXMMyI30LlazeX6hv9hd47YVU=;
 b=nbqJM9JrLhqDDhQODPrdYwcybmfiXvMPFyXh+mlIvWZBfV42Mevx8f34YIBEgkGEeCfPq642o0duasi/of5ulzCdRVL37MEDGI0+CNryWV4LXruKEsfosqdD0G+oGx2o7Yj5bpEYMUVEul6o5I/E6bQJnEiV+ttrzPHkbxnn96k/Zq4dF4VFJ8dHkxwV7Ex4Yh+1D8mrt0uNQsdTfY2pr8fDEjM/cMxo+8T04cx6QMp6odT3PCH5g+rgN87IKz+Za1EhdqVQ0oabJ9VdEEB+d3gyZHTAaMQkkDZpH0quk8A+jbGNtTTo151ux1hT05vh53mZtrLtqvf2Ow8tUxx8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH0PR11MB5348.namprd11.prod.outlook.com (2603:10b6:610:bb::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Fri, 10 Jun 2022 13:11:46 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%7]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 13:11:46 +0000
Message-ID: <04211a3d-8ea1-d4f4-daa8-138932d6be8e@intel.com>
Date: Fri, 10 Jun 2022 15:11:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 02/17] ASoC: Intel: hsw_rt5640: Reword prefixes of all
 driver members
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
 <20220610123627.1339985-3-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220610123627.1339985-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::37) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b278ecde-1869-4bbf-06a3-08da4ae2c539
X-MS-TrafficTypeDiagnostic: CH0PR11MB5348:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB5348AA4DC9EF379BB7B05415E3A69@CH0PR11MB5348.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nI5KWNWL07rIDa8pifZpRelCt6lz/EvEG2TthW1qwHmjDO2nQR90hUsW4w45JXowEXsdwHb54PlYfL4xZMUboTsKRaEcBgbqI5fVecwg//H2ZnKM9HnYfP3pFAJrQAg6cWQHJdPCemhLUrbpqvHziwigJGmJH9ER09Tg22mQte5+mO7VrLszEd8C7zkyOy6QFwHzqcEGI9Ewj/RpZcxE9ck0OX/7B0f5rggSUikp5p2m9T8meWnidCt1EPuuqGDp3Wb6XSFfBKYLAFZ9TMeNqnoAMlWtkUTdisJU5pKnmJbWxHYcrqhlguemI8mBZ+OKbuQwCdugCK5VMaxaEe3es2dYluiW/wc+DFwAlg2dhGFVBekfR5VN685KnLfUiJrMxcKCe0YnmnMmjdkKdBiL6SAiBCrQRYFLafCPVfs+CxOcjNspW8pQ7AduZC38rAPJlzYj684k4mDV0ifOBosuJ9Wt7EdJYz/PIGd4J9oSnO+DVBWFMtLVsvPBrkAfOobUFFAhXa2fWe2XMj2eNUu51dKhWoSweqACGjIdnVuuHFr7Qv9kVvX9fS6FYrNhmyxhvhrGHWEfiUFp+tyteG6l4wVFYGVfdiVeWY6JxZDi24MpxK3mK32Zy1FMGdwXtLP460tvpd/rvz3YDdN+LzY1qGnRXLDKoY5uLmSuE8Mq98Rva7kog0qMl78tEzCGE6VrWZTr5LTCVV++V0jssx6XoLbicCsrLPjDxxxOVH5gVX4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(82960400001)(86362001)(31696002)(38100700002)(6486002)(36756003)(2906002)(66946007)(66556008)(4326008)(66476007)(31686004)(8676002)(316002)(8936002)(53546011)(6506007)(186003)(2616005)(26005)(4744005)(6666004)(6512007)(5660300002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0E3ZDlqQmNHY0lrY1ByeW1HRTVwZ3VGb2JRUDJSUER6S3BPRExIN2RNbXdw?=
 =?utf-8?B?TVc4dnAyYjcvYnU2WkdDS3ByMmRYcnpsTDBHR1VuK24zT2VkdTBiOGM1aUN3?=
 =?utf-8?B?OGZuTGc4M0kyYjR0cUVrd3dSU2FGU0UzQ0xlR1VSVW9XNU5NM3V0RWVxT2Ri?=
 =?utf-8?B?YWRRejQwVzZMYi9YdG1xQzIrNlJFTWxMSzNWVG5VazR4TUlKTUl0Njc1QkdM?=
 =?utf-8?B?QnI0RGhvTFNaVktjemJqSGdWbGF5NHdxNzVXT3g4SEhkNituYWh0a21VclZ0?=
 =?utf-8?B?MnFya1lFMTJBNG40bmRpVVF3ckljdXZEcUVpWFFNR0JZcGk3VjBwWGNGbHIy?=
 =?utf-8?B?alI0SFFXRkx1emdIcHArWHY2eVVaOFFaSGNIZjZhOGtRWjQzaE1zWGpCRVpI?=
 =?utf-8?B?Y2cyQlFKL0xNcDJhSzFtSWl2VmxweXhiVU1qRm9SaGFJdzlaK0pjeUlJZlpV?=
 =?utf-8?B?RmVsMzdodGd2bzYxU1RVSWZlVVlzSDBCWTg3QnRZRDhYeUNEQkNZZGZZZk91?=
 =?utf-8?B?R1AyQlRaM3lZd0dnL29hT3RoaEtXbys5dWNOMTBvZjR5SGREMTAxM2hORyto?=
 =?utf-8?B?UGpkNEtsc0NPUitKQy8yQ3dJbW0xZHlNNEErTnMxZlVXTGNBS1NrSjdOWUQw?=
 =?utf-8?B?Mm5kZ05WVTUzOU5VNDVqcnUweFhXaDk5dVQ0ME5lUGkyYjdjdlhadW90emxu?=
 =?utf-8?B?QTVBSk1EaWxqeEJIdzZRUmxFQUdNOEVzRDdHMlJ4WG82Y2tHVXNRMHpaZFZO?=
 =?utf-8?B?R1lDM0Y2UUhGSlJKOXRYWWxYaXEwbUZ5SVlCREtKVGpuc0xZMTV4UWJsQStq?=
 =?utf-8?B?SFNaK1BBaHo5eE5tVkpHREtrb2NMY1pxTHZIQnB0NVRMTnZRQVY5Y2V2aWhn?=
 =?utf-8?B?dVRGSkpkOXJPdzE4UHkwdjJmbGlyeHFjMDVZak1iRXBEdHg1SzhUWlZvdFR2?=
 =?utf-8?B?NExvNG9lczY3QXI2RWoxS2cwUDJTY0hvNE9IanFEYXhYRkFHQWE1a2c4VjNq?=
 =?utf-8?B?bGVETG92UXVkRnptN2V4RTdEVlA3UXQrSU5XaEZaemRtTW0ydFhlMzBMdXlO?=
 =?utf-8?B?Q0ZGbjAxWFRQZ0xEZFIyQ213aEgxblVmb1Y2WjExSzYxUlQwR0pla3lWWFll?=
 =?utf-8?B?MEtWR3E4RTVPZjN5cnBoNnlYTzJUdkYycy9QSXdTZ1BBS3lrTDJwdUt1bXJJ?=
 =?utf-8?B?NzM0dmZHUFB4UkI2Zk9aM3RyOTZvZlEva2J2V2QrbUlCMnlldnA3TVA0Zy9O?=
 =?utf-8?B?SmhwSTNGaXNhcy96SGl5ZDdZSUc0UWs1cHZURk5KUHIrYUJIUEhCTDhDalQ0?=
 =?utf-8?B?ajVGK2pwYXNwdTd3OWdOTVdncUpYSW12N05LSjE1MUxvQXdxZzRWQm5qSnMr?=
 =?utf-8?B?WjUrWElLVERacjJHRk1mM1c2RElVZjU0cTVWZFZUU1FMU0czcmhucHU5Y0Q5?=
 =?utf-8?B?OUhNNUpTNjliY01JR2dYVXIrdWVOelQvK3JoZ1ptWFZOazVIRisyQzJFUGpE?=
 =?utf-8?B?Y0ZGVDRrQlZWU0tmTmxTR0k1UzQ3ckJYK3lqRDZDdmh3aTc0TFJQSDN1T29j?=
 =?utf-8?B?OWVjUEZPM0FQREVYaWVYUGx6UjNKSFFYTkVXSHlHenpVMlNRZWNjRW83MEE4?=
 =?utf-8?B?aE51YjN6VkpPVDFhalZEZ09BdFlSWFl0eE5tU0RKTllwYWRndTN2em9GalJM?=
 =?utf-8?B?VE5odVB3SVdZQlBTUnUySjlrTkN5R1lsUExiU2g1MUNhTDlrK2hSY1dkazly?=
 =?utf-8?B?aUtOeTF6cGwwSjJ6M09GSVNpSjhUWmh1R3Rack5BRmhDbUd6Ynl5WGdVSWJS?=
 =?utf-8?B?YVRVbGNtcFRFZkhHSWc0aHdJNEo2NXkxbktMNEp4K1hkUkNHbFFLU3htZ0lk?=
 =?utf-8?B?MjI5OTg0azhJTlY3VjZPdkZ6NFNNWlUxbnd4Yk1BQnQ1TDF4a0xBc0Uydmor?=
 =?utf-8?B?L2FXcFRiZEJqY3BKcDZ4djh4ZjhKcGVOZ1pUZHhXOTN6UGxsN3NCbE5IQUQv?=
 =?utf-8?B?SXJkaVJRcElKeVpjd1lHYVFGN3ZFa0dCaUFpcXVJVTVLdmo0NklGblk0QVht?=
 =?utf-8?B?cEdlaGxZSktXdnZyUVJvVnJuS0dDZXQ3WEMyS0VxMStsV1l1L1FNcnpCcjVo?=
 =?utf-8?B?YUpScDVmQmZoUkQraG9sYnA0cnBnbE0wUGVtYTFsTHhxaGYzN0RJV0swY0hQ?=
 =?utf-8?B?NDJSSnhma3kya0hveTBNTzhLVHJsalllemhhd1RoMGhsazk5MEtTSHNHcGIy?=
 =?utf-8?B?NHRPY1l3RnFDcGlMeEVwM3ZiaGFWYjQ5cWthbk16Wm5PMEgzTVYxNkEyZXhE?=
 =?utf-8?B?N0xKdloyR2tYNlo1M3pxenljdndtZlZhUzN3S0UwajNTcVZlYkZPK21IK3BU?=
 =?utf-8?Q?53U6vqS3aLu82Eus=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b278ecde-1869-4bbf-06a3-08da4ae2c539
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 13:11:45.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04nRAiNM7ABPND6sjo4VGgCv0yNpVaw62r7e27KEW2vl3dY6YtinXez76HdZzR/LSnaQm/Eo/m9FZ+7GYB8JJ/f1/o6jF4eQlOnRt/DG2c8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5348
X-OriginatorOrg: intel.com
Cc: pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

On 2022-06-10 2:36 PM, Cezary Rojewski wrote:
> Replace ambiguous 'broadwell_rt286_' prefixes in favour of 'card_',
> 'link_' and other similar strings to clearly state which object given
> member implements behavior for.

That's a prime copy+paste example right here. Should be 
'haswell_rt5640_' for hsw_rt5640 board. I'll add this reword to the 
changes request during the review, should there be any.


Regards,
Czarek
