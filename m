Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F56C7DD8
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 13:17:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835ECE93;
	Fri, 24 Mar 2023 13:16:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835ECE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679660262;
	bh=Dt7JqVyM7K8rVAZUAlxZl6lZmVOq9n9n+I3dKMVTYjw=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=ht8mmTd325GngXPFNMQbWQSX9SCHJMvxYLb+3SV5t0UCIB/couWwZlo/9ZWgFwr+c
	 UCF3dC1BLLRaayd3riiQftfDT29Vfr4RDsw4S9Edl8xy/841WgP7oXMCUhzwNxiRi3
	 x/8EgdVLkRRG0GpkEQ4C4i7KicfwbESQ/9Hw6nRY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CA66F8027B;
	Fri, 24 Mar 2023 13:16:51 +0100 (CET)
Date: Fri, 24 Mar 2023 17:50:06 +0530
Subject: Re: [PATCH V8 0/8] Add SoundWire support for AMD platforms
To: vkoul@kernel.org
References: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
In-Reply-To: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZZO55SGJUFERT5XDGNPFS4PSELQ5XM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167966021045.26.4193060965851307015@mailman-core.alsa-project.org>
From: "Mukunda,Vijendar via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: vinod.koul@linaro.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F92EF802E8; Fri, 24 Mar 2023 13:16:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 077A1F80093
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 13:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 077A1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yeqppu8s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaMn03jjtkIEM1As1Ujk6mNFIHpKRu3FOPYiIfy2sxQq0vTXp9Ahu5rgKBKQ2YJdekWyYEzo5ikTRT3sL7zqZnMCUaqFObyYcRrtozRmdvgMlO4NGFFYufxK2y7DPI0TFAr4cvn66cgJpQKOu9P4wlYl++i0cMaDNNGgJHXPiyE0QojC84+XYPLy2hHxMo4A0gTKFyTbZZ13PevWxz086rjmF1+Bd6ML5X7j5IN2h2ybHC7pJikxbygpW6fa4ZuiYZkttwUDJd34p5yQGiyfGCudj6wQD0pjpxitA8a+4XqMb02ktcJmZS0C7AKhxX3AhyEaDq3AOs/MPM8tMmUFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/mF3ctz1/ssnqEDku7GEb2Ca5xIIYH0pLGl7zVV02U=;
 b=Ig3cKs5F3v0ElVYsvGdUTPK39BWJEFnigsXw5FUeGTzUnxIh2XS8tYDmrPEvJgSViqenaedkPEPnUV6a3SGsJwnWbx+AuIipa8daqFIZwQ+anj9UwfsufBxyEosiPjX3f0ZNGqzp8J/VHXRK3/2JDhWWZ+XmiRNi7b1aVowyzKRZDUl2Ch2caHnWT62c1ri2itoTDh6SkUFmEGpj+rei2e68jEDxpxEH8RaeQED0yelN4Xu2eRDX9ZWMbPGsoofAceSHDAv9t7D6gDOAqzym4kgibUNG7DqKxT9KnQ1DxKtDpOk6HuWpVipRhDF1jqKxGgic/dE8A7t48WGd/3+izQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/mF3ctz1/ssnqEDku7GEb2Ca5xIIYH0pLGl7zVV02U=;
 b=yeqppu8sAkEVZsKscr5PL1/7wdg9BPlxc3dGnHtBgCA3O/KyPlEScOVH+uAe/z21L+En0yk5ZpIeF1dAo3Xqam9YCPqkdrmto2/HXEiL+/XiC4tQyoaig49KTtBzPfPyJlVmZJlnTqiKBYYs0MbplcDHPAoGMLMDOQ9/XDee0Tk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA1PR12MB7125.namprd12.prod.outlook.com (2603:10b6:806:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 12:16:31 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e4f3:9509:c6ee:41cb]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e4f3:9509:c6ee:41cb%3]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 12:16:31 +0000
Message-ID: <50c9632c-0ab1-baa6-cbb3-a84cd543ea6f@amd.com>
Date: Fri, 24 Mar 2023 17:50:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V8 0/8] Add SoundWire support for AMD platforms
Content-Language: en-US
To: vkoul@kernel.org
References: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::19) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA1PR12MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb81c64-d8e5-46fc-97f6-08db2c6199a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p5CFIH6mEDbt5ISChVso9x0Bt+FNRGdBnh0A0CwnaVi5fRUry6Ynhj4kFngiOlcV31gDpUjsmlLuIbD2nCOQ3aefndLgLAvVSRMruZtB9MWh6gacP/2TptiE7oDOjVKy42iDH/51YxHSFal6JcHujPX1KbNR58wYeNY5+7btI04pZLfVdVRYDIIyJaJEfwGJX1/KtNgT5YXiIf9PvVPRguF8aEJIJ2yNNcHf3ijNwhLBFbuYkBqVqK7x450G8sVQORv88m5KXJ9kcJ7EAef3aqf/V3QBz6IBQ8IWRKsay12J8ONNIi8XjjACp/BP1TabeF5aPAtzSJhqbr4yiXWMrNl1lDsu0hw4cSU5O6G5IhzCx7scGtGvxqhX5PDvMmDOSl915TCHgS9MH5QFgFVJwLImw88ThU6MEMOeY0WFFVT+5KIGzCr6tRcxdo64ZB+deWHd+10sUUFKiXWpo2rjXhhQn+IoWezBL6VsjXkdX3C18g59+xBZkKbd9+IR0GWZWXL1J3zmF4TAX0/FNttZAjOYqUE7Zb2tf/1daBX9YFFS98peB407kr66LBahB/C14Wt9lkMaiV7HgFOYoczTBSmz5/O5N43Cil+z8Rq8J9yZco8NEiBuLpfxeILHZO2jrKQKZHxbJFzMLZVgd5eGBMDik6vsmBKaFceLU1Vfn66V9vAFwE3Icp772tvJOBsXCCJDqc0qnkHH/kX3y6cb9SRw+wJct1fP5x4U5DDD9CE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199018)(31686004)(38100700002)(36756003)(6916009)(66556008)(66476007)(4326008)(66946007)(316002)(8676002)(478600001)(31696002)(83380400001)(6486002)(2616005)(186003)(6506007)(6512007)(53546011)(6666004)(26005)(2906002)(8936002)(86362001)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmF3T1hrdkNiOHBBOFJzN1B4YmxNM2N6aXBzMEpoZ0xVc2ZDNFhpMlJ1VUpL?=
 =?utf-8?B?WE5mRGJRbjNGWVFSdWZvMVhEblUvQjVXSDRZbUJFZnhTYXNjYjI5ZUF1S1Bn?=
 =?utf-8?B?RnNwZHhsWTdzM1M0VzhUbGcrWlo0SWs2d0tnYS9rU3diUnVhbWFScC9IekJ4?=
 =?utf-8?B?Q3NvVnBSaDM1REM1UFlUUzlScm80YW9kMUlXeFlpTkVqUWtvQXI1cXBnYXIz?=
 =?utf-8?B?cEdwdFBucm5uSjRoYmhVdkczbk04TDRON1ZISnZYLytkS2xkbk5JS0l0WGRk?=
 =?utf-8?B?eml0YnRuVG1kb2J6Z3VHSzZ3dFBScXpTc1FpZE5yZ0dobm5kL09EQlpTY3FO?=
 =?utf-8?B?SlhUYXlPZ0hBdDg2MnRYYjNzVXFldVdRWVErTGhvbG5rdTd6WnNtU2RKUmtQ?=
 =?utf-8?B?RGNiV2FIYk1UajI5VzBkTmRJUDJFYnAvbFFvUWk1Zit2NzBWeGFqT3JmQU1T?=
 =?utf-8?B?Y0p5T2NFNEFrelpjdU1ITnlhYktxS3BJcDJFamhiY2RKeGNxdXhGR1B0Vnps?=
 =?utf-8?B?L3BxMGtFY2ZFWk1EOVl1ZkxpbytnWXU4dklKL2VkQWFjdmZOSnlpQVU2Zkpl?=
 =?utf-8?B?UFNsdlhBbjJwVzBSOFRlNzhIRHZIdmhmZFROakhocDYwRnBxMDB1VTRBU1B3?=
 =?utf-8?B?bVU2YWM1NlQrNTVaR1dXZ00rU1NjRXpmeFU3WmNrVnR2MHdudlZwTUhvZ1l6?=
 =?utf-8?B?a3RxWXptUkQyL0QvRUcrNGgzeEVyOGdBVlRGblZzQURJTlFmVTIrVEdyck9m?=
 =?utf-8?B?MnlyUG5zNWlQTVVvRzBzWC80OUpQbVUycEYwejVoM2lzZ1dYSnZ2N0RvamxM?=
 =?utf-8?B?LytIeW9OSGt6cEZwZFRlY1hXRWxhWVVRMm9mcmhzVVFkc2pja3psUDlyNUs3?=
 =?utf-8?B?NTJRVU43azJnSkRrSDlqK2F2Zld6d3BJOEJOV2JNbExjQ0RqRDlQa2hKdXpN?=
 =?utf-8?B?OS94SGNFVTBqUGgzVDdiV1lwRkJlZXFiVWpmenRVY28wcWx3RnBxc1JsOE14?=
 =?utf-8?B?U1VLWmtjdFVrOWszanBNSEM1SjlSYStyaWozZTZncFZRMDk5THlCQ2FwR0Vn?=
 =?utf-8?B?MytTRUppZk5qR1pod3kyWE5WZzZYeGdBQTJRbGZTdUY4OC9sN3NPV0kxMS9O?=
 =?utf-8?B?V1E0bmdKUS9SbGY0WGEwQTdpQUV5U0tlYm11SThxcjJ5WTg0M3kxbm4raU9o?=
 =?utf-8?B?a0ovOG9Qbi9VV2x4VG05NkpDcXNTY0VXZEVRa1NEM202RlBlQ3BEM09XTnZx?=
 =?utf-8?B?V3EwaWgzNldhS2NJS1ByTzVyWXhXVXpVN0d2Zm9KL1hVWGxEMHVGYjRiVU1V?=
 =?utf-8?B?clJjZlY3aHc5ajFqQlV3TWVzeW10R0pWblJxRjZZRnZZQ01zOEhKcjAxaUlJ?=
 =?utf-8?B?azA1Z0lWMTM4bVBKUzY1dVJFR2Y5TnU1VlVUUEs1OFMrd1BGZGIzVnBXZEEr?=
 =?utf-8?B?QjBQb1B0d3Y3MG5vZHJCbDBwTTFOZXZWVXdJeGttdDY1UHVubWp1dUg0S1JY?=
 =?utf-8?B?MGh5cWNRN2dGZWRycHNDTEh0em1XcU9ockxPcFVzWXpRVzNSMFVWSENZcDVm?=
 =?utf-8?B?VmlUbzhiemcrdStNMzY1MzNsSmZKZWxkdXphR3J6S2YwQ2ZoRkQ3dFpnVzd6?=
 =?utf-8?B?OVZLU3pORkFybXU3YVMxU2liWUxJNFArOTU4Y1M0RUJ6WHNWQUVRRy9CQUxF?=
 =?utf-8?B?OC90SzhLSTdEVHk0Mlk3SlBxUjk0ZFErUHRCWDFpbnhRczdCOHBTbE05VFVy?=
 =?utf-8?B?K2ZDcGxJRTJDVWJaZG9rVEEzYmZsYVdLa05XM2kveURBb1ZxdmkxTjJncm9B?=
 =?utf-8?B?SEFaVDVLMFJoYmVGeGxRdzJuaFRSd3d2eGRZalN1N2ExS1BrNXpxSFBCRjBt?=
 =?utf-8?B?eTNQa0VzRURhWktQeDBvMXBMNTJicVRvOVBBTnRwZXZSNkFGc3MwMFJ0OTlm?=
 =?utf-8?B?amxZeVpEeER5a1FaMWJFYU1TSFFPUUlyazNQb0xEZm5SNHhGMG5oeUpSSE4v?=
 =?utf-8?B?WUpuNjJSQUFEZ2VRNUwzRFRTVWpHTVllR2N5M3ExdDF2cmVHd2tUdW5rakZa?=
 =?utf-8?B?N2hIbHh3R085ZHpydDlRSkR2TFUzRWZ0aGRyTnc1bkhVSUcrYlNuTGtTQ3Rq?=
 =?utf-8?Q?2bCF+ZV+PxZD49bP/ZS9AmvEO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fbb81c64-d8e5-46fc-97f6-08db2c6199a9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 12:16:31.3614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M6kZt9d80pIjvQW8UGCIudHPDSiJfY0bdZVa2BRtLh0CXtqmDT7qWGt70qFB76nw1Kte+5LunDtbRQXq24g8tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7125
Message-ID-Hash: HZZO55SGJUFERT5XDGNPFS4PSELQ5XM4
X-Message-ID-Hash: HZZO55SGJUFERT5XDGNPFS4PSELQ5XM4
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZZO55SGJUFERT5XDGNPFS4PSELQ5XM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/03/23 10:38, Vijendar Mukunda wrote:
> ACP IP(v6.x) block has two SoundWire manager instance support.
> This patchset adds support for AMD SoundWire manager driver.
@vinod: Should I resend the patch series?
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> changes since v7:
> 	- use readl/writel instead of acp_reg_readl() & acp_reg_writel().
> 	- drop acp_reg_readl() & acp_reg_writel()
> 	- use readl_poll_timeout() instead of read_poll_timeout()
> 	- refactor command prepration and response error handling.
> 	- Modify switch statement in amd_sdw_fill_slave_status().
> 	- use lower case for hex values.
> 	- restrict debug logs to single line.
>
> changes since v6:
> 	- remove pm suspend check in amd_resume_child_device()
> 	  and always return 0.
> 	- use same name convention for command and response
> 	  variables.
>
> changes since v5:
> 	- replace loops logic with read_poll_timeout()
> 	  throughout the code.
>
> changes since v4:
> 	- fix nit-picks in the code.
> 	- update naming convention for control word and response
> 	  buffer vairables.
> 	- drop pm_suspend check in prepare callback.
> 	- use return statement instead of returning ret variable.
>
> changes since v3:
> 	- add usleep_range() in command/response implementation.
> 	- add usleep_range() in clock stop sequence.
> 	- modify usleep_range() values throughout the code.
> 	- remove unncessary debug statement from code.
> 	- update comment in probe() call.
> 	- fix timeout condition checks in the code.
> 	- drop "ret" variable in amd_disable_sdw_manager().
>
> changes since v2:
> 	- Remove useless variable initializations.
> 	- Add helper function to interpret peripheral status.
> 	- Move runtime pm sequence to probe_work workqueue.
> 	- Use string "SoundWire" instead of "soundwire" in code.
> 	- Update comments in interrupt handler and probe sequence.
> 	- Rename "sdw_lock" as "acp_sdw_lock".
> 	- Remove __func__ from dev_dbg statements.
>
> changes since v1:
> 	- Drop asoc tree based patches. will send asoc patches as a separate series.
> 	- Fixed double space errors.
> 	- Use dev instead of pci->dev.
> 	- Use SoundWire manager terminology.
> 	- Remove amd_sdw_compute_slave_ports() function and use exported
> 	  sdw_compute_slave_ports() function.
> 	- Remove unused variable "num_ports" from amd_manager structure.
> 	- Drop startup and shutdown dai callbacks.
> 	- Drop reset_page_addr callback. - Use relative address offset to program SoundWire manager
> 	  registers throughout the code.
> 	- Separate wake enable interrupt handling from slave status handling logic.
> 	- Use acp_mmio to program ACP common registers.
> 	- Use dai_runtime_array implementation in dai_ops.
> 	- Refactor port_ops callbacks.
> 	- Add comments in port_ops callbacks.
> 	- Add retry count logic in irq thread to address faulty case.
> 	- Add helper function to interpret command response.
> 	- Add generic bandwidth allocation dependency in Kconfig options.
> 	- Add comments for AMD SoundWire power modes.
> 	- Add missing timeout check in amd_init_sdw_manager callback.
> 	- Declare frameshape parameters in probe call.
> 	- Handle error case in clock stop sequence.
> 	- Add comments in pm_prepare and pm_ops callbacks.
>
> Vijendar Mukunda (8):
>   soundwire: export sdw_compute_slave_ports() function
>   soundwire: amd: Add support for AMD Manager driver
>   soundwire: amd: register SoundWire manager dai ops
>   soundwire: amd: enable build for AMD SoundWire manager driver
>   soundwire: amd: add SoundWire manager interrupt handling
>   soundwire: amd: add runtime pm ops for AMD SoundWire manager driver
>   soundwire: amd: handle SoundWire wake enable interrupt
>   soundwire: amd: add pm_prepare callback and pm ops support
>
>  drivers/soundwire/Kconfig                     |   10 +
>  drivers/soundwire/Makefile                    |    4 +
>  drivers/soundwire/amd_manager.c               | 1208 +++++++++++++++++
>  drivers/soundwire/amd_manager.h               |  258 ++++
>  drivers/soundwire/bus.h                       |    9 +
>  .../soundwire/generic_bandwidth_allocation.c  |   12 +-
>  include/linux/soundwire/sdw_amd.h             |  109 ++
>  7 files changed, 1601 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/soundwire/amd_manager.c
>  create mode 100644 drivers/soundwire/amd_manager.h
>  create mode 100644 include/linux/soundwire/sdw_amd.h
>

