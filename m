Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E7E828627
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 13:42:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBEB3EBE;
	Tue,  9 Jan 2024 13:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBEB3EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704804142;
	bh=KhdJo1BmDBXfF8I1p7r3zSKjjp9A2FL9dfLrgbhml8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Akp0L+2coMnOKJ5CWp3XaPA1WZG4XfLBwoNqHibOXd+dOO3MlQ84jDag+7AO6UZox
	 n2RN7QIVIQTU9bgr2kgZVoRxC3C+/sxqxdn3oPTAAgiTDJWQNof98RqqSU4KiPDuDP
	 fLJ72D34UsCIvV6iA4tw+1NiwrZ0STlbU2Rx4QRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B312F80568; Tue,  9 Jan 2024 13:41:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD88CF80568;
	Tue,  9 Jan 2024 13:41:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5585AF80254; Tue,  9 Jan 2024 13:41:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61162F8014B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 13:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61162F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ORG0C5Te
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCqduUe1akk2AX44Pxmc/zg/IvS6mRLlVwwjEi8Xlo1XAlf5zR6wTWubE4lU12PUez0P/sawb9jvfwymdRJntj83vVUnBffrxDJSXu3e7SWpHw3S1rfLUINS5QdL0UA9De5wizoe7w34rEK9Wq1eMOCrV7Q/lG2VsiGNqIcyluvG1AhRPb5cr9SlO6MNa2lc4gp1COnbEC7fHvuRGOryGNrIXJI/WF4b8UMYOBxfGAtZh4iH9FGLSBe7DPtEKlaxX2kvwF6sCULEQG4fQMNec7ESGMSx+bzcYgGsGmRR/MGerHSn/W4YVJ9isLl7pNhKFz9O3KAgEqcLTdcMwFinOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMcrongwgBXDjpgTMesPN61+DLO3I67KUWPhz6ELiN8=;
 b=eLtKpW88fK2Ql/aAIy+Z1fmeTpBDbVEyZU4R/O7r2b5225Dv5GBcVEFwfdpiOYVqp/7mwUCXJAVDeUx4+CeofZb4FnstL721T4WO41tclJugeefcuETg/7xLwFImtOd+4d+bAG5D+QHqxdmv4Mn8Pldg6DLC3VI0AXc4TiIgH2OCpDym7hnh6OxO82yOoDfZkYTOCDu6hQRqvT/00YAcelqPwDZFtuRph2ve8ELzHGS1H/m5pRgxYP0aNZlMmvs5HM+rez6W7Bw3a4KzCDTBddIVzrmdiGPutquOx5ghfafD6TsKfZ5rm5UHPO75gzRiWcBUDsHSAr4BXbmf/YMy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMcrongwgBXDjpgTMesPN61+DLO3I67KUWPhz6ELiN8=;
 b=ORG0C5TedOIy+m0XOtC05p0nZnVyvdWGw6uOhBkBJCt7ENwyiJTYpdxkrhIop8V/nQvKSEzu4v66Y7j8vRur1bCGz7ghb2OntfXA4kKJ5zq/+cGfCU0hZwkO0wA4lZ/1x+F5LWi9eeuzCiBdi0tJr2GPEAI5wU90NAGH7ynyU/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 12:41:28 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::59d1:c9f5:2c67:1da6]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::59d1:c9f5:2c67:1da6%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 12:41:28 +0000
Message-ID: <084fcb95-7418-4898-bcb2-8eec993cc39e@amd.com>
Date: Tue, 9 Jan 2024 18:11:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] soundwire/SOF: add SoundWire Interface support for
 AMD SOF stack
Content-Language: en-US
To: broonie@kernel.org, vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, pierre-louis.bossart@linux.intel.com,
 vinod.koul@intel.com, venkataprasad.potturu@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: d9283250-f6ac-436e-1fc2-08dc11104c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Un+o0RyzalobMGyzXF5sqBkZIXdy8pOWTt6zFq03WaWXOSMOVh/ArsFRzQ/6WqWdGYsazwWbqUqx2+n29QAaM75PANjDAt8GG8mnXnxMbi/c87DsJYB34OQeg2aApiKCH2VdzsduqlsSZV2o07ZWIk0f0aBzxBqiHfGWnGkrSAA8yMVSw5P76Szg+s2gMQgmNZCt9MiHn2qg1JZVyOiIFt4KZKv9dst6PdFNnuUwcAnTK0EzfnfQzJ9KB7i96ywP+9R0Cank+K6mQzxUOxbX96ACR5AKHQ4shC7hJcj/6VyR9EqJN8k/GgEfEf9UfsAUYW6HvvHDwe11b9T4j2u0Rk8iRhEAJy5t+2i64aIGuA20R/Qg5mM3E7zvAoET2OqGYUSZ5hRyacwvBvCsJ/lupvSTimGA9aygNGdHcF932I/kp7H9IKvLflPNoe+hPuOHhsVJa2wr7MCqE9zYijxV7ZlprJjM3dpSVY1lo/T7bVtTSvmrWlcNUpXpdGrVDHT19V7AZcG67S4tG7//2s0qWlzyaLw5tPZdcEDlBwr+nucz3CV68OFA4djnBpsFiWeQkn+G1fL+Sk5Bi6EG9L6oGn25JKfbQ9hP+Bs4zZgr++Fbp8NwK7tZw+9oNANiExIVj6T3qs+E/buDR94f/5hpJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(38100700002)(2906002)(5660300002)(86362001)(41300700001)(31696002)(31686004)(316002)(36756003)(8676002)(8936002)(2616005)(6486002)(66946007)(66476007)(26005)(6512007)(478600001)(66556008)(83380400001)(6506007)(6666004)(53546011)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VU15Y1lZeGFhUlBjL0VRSUNnSllFUXVTVlFDQ2VReFRSWWtZUFJtRVk4ZEox?=
 =?utf-8?B?eGZiQjRwejNhNFc2VVdwR2xTRUkvalhRUDJqRnRlVGZKbUtrKzZEMDU4TVp3?=
 =?utf-8?B?cmZ3dGJuS0MrSnBPd2tGalo4UENSVk5UbnN5cGFqdFZxQVhPbmxVUmVVbjJK?=
 =?utf-8?B?L3k2cndlVEp6YVZSRmFWUXVWalFyNnVSOVpnMjBtZXIzMWN2OVVuZGROK0Fo?=
 =?utf-8?B?dEZPcXlFQTJSTk1FL2k3ajBTc0ttUU5FL3YvVWpaZVdLc1EwM1NzNGdHY1Fo?=
 =?utf-8?B?L1VPMUxXdmg4TmFoQUswRUpUcXBzOU5qOW5TemkzQ1FaOUdKT2xYNHJETExO?=
 =?utf-8?B?U0VDZDZSeDJESGluTmJmQ3BnOVBiOXJGamxUSTYzMkhudytleS96TkxwK1JD?=
 =?utf-8?B?aStpZkNycVhqeDBVTGFsejM5M3pPS3hnR0YrQW5vdGdjeXQ2bjdJNm5FanJa?=
 =?utf-8?B?NEdQTW5vUUdsRkdYY3BMaVM2c1Q1YmhlR0R6alRPb1YzcmJYdVN3NFhPZzg4?=
 =?utf-8?B?bmpQelAyRzhldlp2WW9WdW9LdkorSUUxVkJPWGxzME9VaTV1bTV5diszTkhF?=
 =?utf-8?B?aWM2dmNKYUdTQXVPOUhkUXhSaC9DVCtWQmdFNG14NEhURkQwdGxNbXV5SDFZ?=
 =?utf-8?B?R2o2NDhHaHNLWDJ2QjJvTThrNWhQZWwvWFJXMGRoS0lWcVRKTlN3M0hpYTZm?=
 =?utf-8?B?ektwOGlHbXlnZm1ENmpaVnlMcVVaOXRWQVZoalpxWGlkaDRrS0VPQ0FFakpU?=
 =?utf-8?B?YTV4YUlJcEdlTzl4c283NmNwUlNCR2RlbzVpMEFNakNRbXAxcUJEMW5aQ1VN?=
 =?utf-8?B?NnFQcy9WSUFjOXlkS2Q3VGlBS0tTUGFIZ2dLSUdneUk2ajUyR2w5ZzJ5c0Fi?=
 =?utf-8?B?U0xhQ2NycXdKb08wb25wZmtJMUlYU3p4V2ltSE5XSlcyVjZLWURvY1BoN1R4?=
 =?utf-8?B?T2VUUXFLYU1qcWlIdnFOTUlHYmV2clhudi9xWDFvS3VJR000cUFLdEUwRmtB?=
 =?utf-8?B?ZTA3aGJsdFpjd2ZxZ0Q2cE9JS3NFUXE3Y3N4Z0NFb1hlNzNPV2pCRFowSTl6?=
 =?utf-8?B?ams1eTErb0o3d1FVbU1USU1ITzVMWUh0T0pHWHJ3TnJBODFrSDFoNG1KRE12?=
 =?utf-8?B?cWFDNXJDcU1mcEkrK2hneEtHbERzZjI5cHNNdmkyaDMrREozcHZqSng4Q2Iy?=
 =?utf-8?B?VEdRUFB5MElhYVE1UmZ6V1dCanRaOUpRQ2RUVjFLNjdrQSsyMVpSeHZROGJB?=
 =?utf-8?B?cUphZFc4bWQrQVRyaHdpQ2xSNXF3ZHhzSGl1bmRkZC9PNStnN2p1UzRiTlRl?=
 =?utf-8?B?aUhCNFpXS2VmeHM5WktlL3lNYldqY09rZzNlMDdZcEdwSElkWnFjbTFYbWdz?=
 =?utf-8?B?bFVLVjRPMC9zYnVQQjlOKzJsYUhGZ0pxNXkxN1doWmZHRVNSbXdaWDhTNkhV?=
 =?utf-8?B?MEpjSFljYkUxUmZ4VlFrUHo3TmRET24wNm1rMW1NWURqTUNTK2RBZ1RZWjVV?=
 =?utf-8?B?NGFMcHdRbFY5dzVkUmhvbGhKOTZMbUdZK2p2NWZ5QWJRNDgwK2hmYkNudy9h?=
 =?utf-8?B?Vngwa1dqR3lLRU5qZXFJY3RxUEVtZ3hYdm1HRm9MTGhaSENsMnFHaWpLKzZh?=
 =?utf-8?B?WktzZmpxY0ZwcitTOG9selAzVm9heWN3ektkazBrK1RaQlhhQ1ZZeUtYektC?=
 =?utf-8?B?cTJ0WlJUSW5rcFZOODB1WmVvcURzSmNCQlBEb2EwUGthY3NUMm11Nm5jdmM3?=
 =?utf-8?B?LzNyRlkrdXFsUDh0dDB3MG1sY2JKRkNOUzZkWE5KR3FlVzlmTHh2ZG03S1pV?=
 =?utf-8?B?NHRCMnpCNytIVHpNcVZTbXZaVml6MVQrRDQxYUtmOUlBaUZuSm1ENmNiMno2?=
 =?utf-8?B?NEo4VnlLVXZvRjQ2OU1uTXNTdDlNeWFmYXdEN0FqUnQyRDVxSkdha2xjSnRv?=
 =?utf-8?B?b0hUOFYzS3FvbURJeTdqSlJTbnZkUDBpaGR5VTFqMzVtc2RaUEhrNG5jVDhj?=
 =?utf-8?B?Vmt6WHBHa28wbk1vYURwak12OTZOYmRSbGd1U3djR09JMHE2WlAwYUFFL2Uv?=
 =?utf-8?B?UlhFTkMrWmJQa21xVDZXc2U4cEk3MzlRVlp3YWxTdlNyTkdrcmtGZDRqcmRM?=
 =?utf-8?Q?isYyOId1HRCS81d9oPTKrIstV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9283250-f6ac-436e-1fc2-08dc11104c7c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 12:41:28.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z1RcbEz04laOK3LeVeTKQymixbZbdFtFTv7k6WucklQg+uu+kmb4PJHkb5SfVFYBkCvJuwb+HrNE1bTBwwWs/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
Message-ID-Hash: 7PTFEN7LXRHTAA7QKZTPCL3GIRJ2EE2Y
X-Message-ID-Hash: 7PTFEN7LXRHTAA7QKZTPCL3GIRJ2EE2Y
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PTFEN7LXRHTAA7QKZTPCL3GIRJ2EE2Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/12/23 13:05, Vijendar Mukunda wrote:
> This patch series is to redesign existing platform device
> creation logic for SoundWire managers and Implement generic
> functions for SoundWire manager probe, start and exit sequence
> which are common for both Legacy(NO DSP enabled) and SOF stack,
> and add SoundWire Interface support for AMD SOF stack
> (ACP 6.3 based platforms).
>
> Vijendar Mukunda (12):
>   ASoC/soundwire: implement generic api for scanning amd soundwire
>     controller
>   
>   drivers: soundwire: implement function to extract slave information
>   drivers: soundwire: refactor soundwire pads enable
>   drivers: soundwire: refactor register mask structure
>   ASoC: SOF: amd: add code for invoking soundwire manager helper
>     functions
>   ASoC: SOF: amd: add interrupt handling for SoundWire manager devices
>   ASoC: SOF: amd: Add Soundwire DAI configuration support for AMD
>     platforms
>   ASoC: SOF: amd: add machine select logic for soundwire based platforms
>   ASoC: SOF: amd: update descriptor fields for acp6.3 based platform
>   ASoC: SOF: amd: select soundwire dependency flag for acp6.3 based
>     platform
>   ASoC: SOF: amd: refactor acp driver pm ops

We need to post v2 version patch set.
There are few patch dependencies.

"drivers: soundwire: refactor amd soundwire manager device node creation" patch
has dependency on
"ASoC/soundwire: implement generic api for scanning amd soundwire controller"

SOF patch " ASoC: SOF: amd: add code for invoking soundwire manager
helper functions" has dependency on SoundWire patch set.

As this patch series has to go in two different sub systems,
Please suggest how can we push the patch series to get it reviewed and merged
at one go. 
>
>  drivers/soundwire/Makefile         |   2 +-
>  drivers/soundwire/amd_init.c       | 235 +++++++++++++++++++++++++++++
>  drivers/soundwire/amd_init.h       |  13 ++
>  drivers/soundwire/amd_manager.c    |  41 +----
>  drivers/soundwire/amd_manager.h    |  12 +-
>  include/linux/soundwire/sdw_amd.h  |  79 ++++++++--
>  include/sound/sof/dai-amd.h        |   7 +
>  include/sound/sof/dai.h            |   2 +
>  include/uapi/sound/sof/tokens.h    |   4 +
>  sound/soc/amd/acp/Kconfig          |   7 +
>  sound/soc/amd/acp/Makefile         |   2 +
>  sound/soc/amd/acp/amd-sdw-acpi.c   |  62 ++++++++
>  sound/soc/sof/amd/Kconfig          |  18 +++
>  sound/soc/sof/amd/acp-common.c     |  65 +++++++-
>  sound/soc/sof/amd/acp-dsp-offset.h |  10 ++
>  sound/soc/sof/amd/acp.c            | 202 ++++++++++++++++++++++++-
>  sound/soc/sof/amd/acp.h            |  26 +++-
>  sound/soc/sof/amd/pci-acp63.c      |   7 +
>  sound/soc/sof/ipc3-pcm.c           |  25 +++
>  sound/soc/sof/ipc3-topology.c      |  40 +++++
>  sound/soc/sof/sof-audio.h          |   1 +
>  sound/soc/sof/topology.c           |   5 +
>  22 files changed, 798 insertions(+), 67 deletions(-)
>  create mode 100644 drivers/soundwire/amd_init.c
>  create mode 100644 drivers/soundwire/amd_init.h
>  create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c
>

