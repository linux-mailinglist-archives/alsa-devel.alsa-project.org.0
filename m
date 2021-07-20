Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138A3D04D1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 00:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B402816CB;
	Wed, 21 Jul 2021 00:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B402816CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626821494;
	bh=r2eojnV0+SGL1wJBOwO4mqdyz5lFMvI1avc2fOU0GdM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWwDF5Jv9xDtvSRv9hUmRB5Dxsf3JE5iTdczORi2yEGUiHcqfpJ41TQZKT7agbqv7
	 vkVkSBplzVE6G2Dm81rgUUZgIWovm+59WPnkfxOhSyze7DMtZPddzNNwtjZ2zBeauk
	 lUtbjgPi/aFqxasTXBaj4uh4ZQEZs9+8R8vcyUkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4903EF804A9;
	Wed, 21 Jul 2021 00:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC521F8032B; Wed, 21 Jul 2021 00:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C55EF8020D
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 00:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C55EF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="xJd3KA5Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AajitFM5P51MGoPSF768VwCJy3dhyrc4fk28Cjs33wlFOJdEvf4ZIH2m0sMZ9UIqM+9BV3BvgMmgzL817eLULjU2Md8jaZcu6tEHyoDOxRr8wopivMK4IJ6qnPOAuAfjPnUOz2zgqY6522zMU1f5bDoUQuaHM250ZBSBxeC+FPxyCyY+vsEG7Q8EkO6YMNs6kAc6NU6QmrqAWmBtvSSEe4b432boahQJiHfGCOM1gGjEiI8GHBNzswmnLNK241ho6mygwtnSLprGz+0n9aLoktnC32ZLNWvmwKoWePmC5dBgnc9ik0qKOzxA0MKR5CPV+ZXUOh1DN46CRT9yFG/2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rvL5HQ+2oj7S9mAJPnl8dW2ino+2XcaVlNM7m77QLw=;
 b=injUVU8j3Mll6Cn1xvK/95hN5RdxbAalzvXH7wTdbOC5GQzVK4n+8LhjhA7CmrN+5JtlRtiJAGuD2A+ZKse0DV8rH5k8DWQnG5oHRr8P/c6IfuhFK7nHZJ51TuQQOJCSopk+Pnh/HSDk49jB/HltrZ8m3bM/MyCwtGxdbbF+KYoSUP1xfnDOzIVGN0VgRMTvl/4m/+Zzy0gRcobE6vduJMUOerlnAB0Hy/RpDiexH1CBesBWYHrI7HxLB9UNA1muQ8kZuDn1GfBu3jFi35sCkKSiwFpWzrz9QBlhYP6dh/TZE87zazuEN5NrjO+HHjsML8q9RPwMXfxW8pUTll07DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rvL5HQ+2oj7S9mAJPnl8dW2ino+2XcaVlNM7m77QLw=;
 b=xJd3KA5Ze7jGNYntAdBmdbsKrpdV2VXrTL64qaqADK4MXZAjxgMmILjOdh60iyqfgPluc2zKutpHg+ckkTvDqtPBY27kitVKOKubP7ZSuZ37hNSDreqYOdD4bEsyUovzgLik0JNPGFCvbM3faVBiOt1qWUSwcGLFJct8Cxlsbpc=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW2PR12MB2507.namprd12.prod.outlook.com
 (2603:10b6:907:c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 22:50:31 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.034; Tue, 20 Jul
 2021 22:50:31 +0000
Subject: Re: [PATCH v4 09/12] ASoC: amd: add vangogh i2s dai driver ops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
 <20210720163732.23003-10-Vijendar.Mukunda@amd.com>
 <6983b9cf-d270-1033-5481-f8aa5bb378d9@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <4bba4d88-c064-7ee3-cddd-edfc5a047a1c@amd.com>
Date: Wed, 21 Jul 2021 04:38:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6983b9cf-d270-1033-5481-f8aa5bb378d9@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 22:50:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73a3c264-a5d5-40f1-5273-08d94bd0c6c7
X-MS-TrafficTypeDiagnostic: MW2PR12MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB25078B06C25D65109CA6F4E197E29@MW2PR12MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0NNQvAQfFjRRfBpXW+i+Kq1YOnCTUU4Ttp4LpFbIPA8cGmawSV5YtaYQq2PtrHShAhq821d8Vi9eXy3DpT5RSDkdqP8QLHNPBeabaqMAwNSq8A6RNcaaZKXiKzwdt+9FiXizd2IkfYDJEWW82iYw7CUGUpgtkK63jvQGZBQXFrWbn8LGAbgggbeGrRFzjMbsbY/5LK2sZGLDFb1y/sDTdNqKujhw0MYWsf1vy94sDMnvm/IGd8TLW9QLgAlJ/xoY+H5LZvDUYo4BNz+7WqGmZRXS6P1UhHGJcmyQNNYuB7zx4N/Rwk/StBaEd8bsaLt2yoTm2Uxu+gX2l7L6rM9d2GL8r5ZZSh4CyOfl9F8DVsmLSQgOh61saDsMEvtfIxl4y1ZPQB9KxSd2GR4ra3fN8GmM8Z64XC4HlWxG3NVUEpOlMxrkE8xO4u39DcCj6pycJB03lEOD3bUc0zOXuN+VptuxKC9sCHJF11i96LgxboNrqG3JusIsTwsHz5ZNb/ZH30+0f1D1pFGP039KthrqFHpvm5R/5issUKW+n+BCFxd2QCV+rGebfzYsJrC8eKs/Fon0i2OwgNUfNiMAX809iWlLWkeBew3DJVpr7OkAog5miC2dBqPu/7lib2J5HfudB57BqwRZ5nKW6M2WlXClHQ5F+ta/ZWZD/yz+kBj5QdKMegE+uaxGji1KRmNGRD7wIgzceymetz+VLkXt/WjODRnWcR3LMsj5B1q9fqpSx66L9wt/QVkGadXj/TC9sfzc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(376002)(136003)(346002)(396003)(2616005)(956004)(6486002)(31696002)(316002)(16576012)(54906003)(66946007)(186003)(8936002)(8676002)(66556008)(53546011)(4326008)(478600001)(31686004)(6666004)(36756003)(66476007)(86362001)(38100700002)(5660300002)(26005)(2906002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkFaa2VWZHlWaDhQYVMvR3NrdnByWjN1M3djSExLajRIZHdITFU0QkRha3Zs?=
 =?utf-8?B?SHdVYmREdEpVT0huT1Q1RGhBVGM3R2lXL0Q2b1VBT2p1ZHFxT2x4K2pPUkdk?=
 =?utf-8?B?WmRaRXVRWXc3M09ZSm95b1pIWFdseGFkdUl1V2M5NG4zc0RTSlR2QWVUemQ0?=
 =?utf-8?B?d3YrSXZBaHBhZURjQ1NwbmdZQkJqZlRWdlFEWm5RUGhlVUI3YkYxc2FwWS9q?=
 =?utf-8?B?bDRiUCt3TFlsV091RE5KcEtiWWZJSDJ5K3lUTXJTSnFIMEZuUm9DUlNIT3FG?=
 =?utf-8?B?N1lQdkMwcFZycTBzR3ZRNksxdnFlcUJqc0VwTDlnZjhJQWVrOVVxS0Vjd3ZS?=
 =?utf-8?B?SUh1b2V4N3JBTDhuVFlUa01wV2ZLdnlJT25RRjNydk9mSHZ0TDJMMnhqYU5q?=
 =?utf-8?B?OWFLNUVBa21pcDBZemswclBTT0dxSlU0REk2TkIxRGNwenhMa1AxUHo3cmp6?=
 =?utf-8?B?djUvbFFYeWw2TTRWU0hkOEo4U2VFaHhIb1RnS0pkamdoc3RkSHBKaVJjaWxy?=
 =?utf-8?B?dU5QOHBBNU1Na09peHlIc0x2YmxTZ05IS1o5TXlpVlFTZS9ubnZ6RWhBL0Ez?=
 =?utf-8?B?eUNHNFFyUEdJbklwc2hwUmlrL1VZZGE2T0RBQy96WTlzL1JTUVlWSy9hdEV5?=
 =?utf-8?B?eUtMZXJNdVM5b29GNDhML285U1ZlK1U4VmJDelZ2QXRBYWdUV0p3ZXowWG1t?=
 =?utf-8?B?WjFDcUxwaTdNVFg4cDZlWmVVeHpkUktDMVdTTFcrN2ZLVGFJalZWZUc0UEpR?=
 =?utf-8?B?WUJwajkwa3pxbGw0Vyt4VHVSd2ExZk9XQXoxR0YxSjRONWpDcmVmR20vTUFC?=
 =?utf-8?B?N3NCSlNWQ2pFMzh4SExyTWIyRGVQbFlaZkhQNFZ6V3BUUlAxRWxIbkRCTzRI?=
 =?utf-8?B?S0JXczg0WGNVMjVGYkVVeGJuampQZ0p1QkUzMVVCd0h6Smo5SUpIVGh2RnhN?=
 =?utf-8?B?eUpsc3RIRjZ1OWcrRTBMRjl0UU1uQVBsSVNjYm5UWXYzL2Vva0VZY3dmUU14?=
 =?utf-8?B?QUdPYmV4M1RxcFJzZUZVUG82R3ZrNEhHc081TXg5NXRIY0E4RWdOenVaVjFt?=
 =?utf-8?B?YzFmbW4zLzZUNFB2VzRteG14RFArWUw1UGJEZWJMcWV5MkxrOC8wclY5dGt1?=
 =?utf-8?B?Q0JBSkVJOFNUeWJrTjhZT1RlSlZ2bnZoZFpkUjN3Q2R3MHNpL3JmWmtUWDZw?=
 =?utf-8?B?RGlBMHEyeS8zN0tkYjRWMm9TenZlSHZ2cnloOXAvOHZwaUNlS3J0U2pCZHFU?=
 =?utf-8?B?bnZUMk43Qi9xOFFqVFVmNThrY29GUWNPbTloNll5ZGVhU05hU1A4S1l4dFd3?=
 =?utf-8?B?b3BVcERZcXYrUGVBN1B0SGJNSi91cDFoWTNVWG1nUEZ4NFdwQWpzcndXSUx2?=
 =?utf-8?B?dkl3dU1PeHdKUkhFQ3dHc3dRb25CTzVScEF5QkR2ZVdHV3BUNGV2TXFzUGgv?=
 =?utf-8?B?R0JQbEVpRDlvZFUvcEU0U284WFhJWlA4emJ0MG5sUEhzUVVoQ2ZVN2tHNndx?=
 =?utf-8?B?bytpR2JCL3lycHB1YnFiQkdJRGhPRWtYM0g4OUpSUlpwdUxtWm1taUVhbkYw?=
 =?utf-8?B?VHFKRlBjRlFwblVORlFQbE9lWkFNUW1jQ2lRelhVOXJhYlRZaGE0MUV2MDBn?=
 =?utf-8?B?MFVIeXNNMWJSZGNpYjY4RVRmQmhnbk5IRmt0U1gxRkNUYzZnbHR2dU1RK2Yv?=
 =?utf-8?B?aG9hbE14ek11OWgvajNtVStKKytsblljYlRRdDJDbk5rdytWZ2NIK2RuUVp0?=
 =?utf-8?Q?Q9AQFkGDdOwbQouEtUVlDqFM2e1fJ8gam616cnm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a3c264-a5d5-40f1-5273-08d94bd0c6c7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 22:50:31.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oszYo9eCEKt3GIj3BH+dJHzADDYHNtSQIHUh8e+58celT1+/v1P5cdw2sNBnF/TWCjPGpAhxMxIRKN76Cih4yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2507
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

On 7/21/21 12:00 AM, Pierre-Louis Bossart wrote:
> 
>> diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
>> index 2300e63534e7..c94ed8795b9c 100644
>> --- a/sound/soc/amd/vangogh/acp5x.h
>> +++ b/sound/soc/amd/vangogh/acp5x.h
>> @@ -74,9 +74,20 @@
>>  #define I2S_MASTER_MODE_ENABLE 0x01
>>  #define I2S_MASTER_MODE_DISABLE 0x00
>>  
>> +#define SLOT_WIDTH_8 0x08
>> +#define SLOT_WIDTH_16 0x10
>> +#define SLOT_WIDTH_24 0x18
>> +#define SLOT_WIDTH_32 0x20
> 
> nit-pick: it's not incorrect but is the hex notation necessary?

Will fix it and post the new version

> 
>> +#define TDM_ENABLE 1
>> +#define TDM_DISABLE 0
>> +#define ACP5x_ITER_IRER_SAMP_LEN_MASK	0x38

