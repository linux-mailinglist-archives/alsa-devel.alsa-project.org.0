Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16772671B70
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 13:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5222C77A2;
	Wed, 18 Jan 2023 13:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5222C77A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674043527;
	bh=DmSCnBLUyereVZBc1T/aNdE2vYHhh08gyFsbMgUWpd0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O7R8ziKLivP/cOI6IY0Y3utUcMFhbV9ebmJRGGSq+V+yxx8S4GH7crMDXmFuwSEdO
	 4J7XYEyn2a4xCz9wkgDQpppZSSPV/2ijoxe8w2Vjd5KMpYHshWR7esGL2zRe4xk3WH
	 L/ij7bNO4/kGYXkb8U3tiNku/E0F4AtTfmWDQHAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF298F8024D;
	Wed, 18 Jan 2023 13:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA1EF8024C; Wed, 18 Jan 2023 13:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA0E1F8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA0E1F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bqQhdqID
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674043463; x=1705579463;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DmSCnBLUyereVZBc1T/aNdE2vYHhh08gyFsbMgUWpd0=;
 b=bqQhdqID/hIcrzrd9XRxCJypKxByJ5CMkEjXUX/AGTE7NsqER968ZQPb
 1/cfp2W23znuESBghvVvaoaJctHM7U2uM3cgPletmUzY1kkEvTsEomX40
 yQivXt8EJgsWNDHi4oFeeaN8CCnIFMLxUWLhdFeqP6K9OovV2Li/yEkLA
 6Sq0CK9LoXgbGf5ZSY0NhC4hIYLLeMXa1p2YviRqeQGzYf8l/Xb2iJvC+
 138V9XE6n3rIAqShcWaUGvHlI0E1GH0kZe4+9lDy2iBUb+iOj/5tQjiOP
 Prdy3ZKScnEBO0FgutUWR4qeYLrUHb5GIPf+4go23eU4pkAdm6BWocNes g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="325019783"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="325019783"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 04:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="723056876"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="723056876"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 04:04:16 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 04:04:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 04:04:16 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 04:04:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeHbNTiBIGHyTtbNxbNzY/ecRrdOKv/Btd2JbGA7ICiVmwutNVrPB+oUoz9MPcZgWQdeEgoLiQNvhWifhNKKGIGj8mkLFcEtvqSdMYmdd7IeOwGFt4x0pUUvq08STui6zk9K0eALP7N1evtISjgkNEwy+KMfXvcg7KFIlWYPsd0aVNk/GtivntPpNu7lZkbrxQp5jnJnPfjQ/pnKJ6s5oCZ00hY+ZB8rZdjnxNN6Py6O7N2IICCPVSEU+lHpNXyQK7VciQ8+BG23NB+dGpAKC9C+pvAsFLWe0JVK+C/JJskWD3D5bzTYcDin75SqCgEEPZrw9vI+aJifOhOrlaqm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG8+XoNn03ahHveWUI2GEJ+eJYwsRkHT1KfjfVUlC+g=;
 b=N9e3xuY0FZ3dKQS9WbF0cOV66gcowP6BkbbUWDouaS5CnzDNA5b/xPe0gTNqvEQxV1pJQzUj9Cpl6e1zeUBmmFJ7+yUF1hlcnuU746gBKnrNB3NgmKFC2ljDAi7bIeLT4ZOIeosyz3D1g2+XK6EAgBunR8a46x448OWOj9fU5SafRPvLKN+yKFeT9g0OwzM5pKVRr55NV5T0nmtbj2zHcYT0Xh3IOyrO1obkWJiVIPUV+a+C/yldYaaF2Rr8J1cwIGNBsWbYj+k2f6yjikYiBKxCrEHg8+4P/jVyd0FcSVhyVNeVtVxYDVE8bHfGxLdz45Xj5j8jI+niP4LePgg8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Wed, 18 Jan 2023 12:04:14 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%3]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 12:04:14 +0000
Message-ID: <22911d1c-02d0-e70d-63eb-44328d131c30@intel.com>
Date: Wed, 18 Jan 2023 13:04:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230117154734.950487-1-cezary.rojewski@intel.com>
 <87edrt6tg3.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87edrt6tg3.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::27) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f86ed71-26a3-434b-9b02-08daf94c1d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XfjgmCr4hlS9SKIcmkFuOiv17gvWYMLSl9s40buKeE6asTde6sg+X9tLsuig/1X6Qizb41HJEV7ZeDqTAyXXKN0lDOnrRjI/nU37gCr0NEHa5OiE2OfZDIv/2baXHszUZPZEAfaQySN/ErqhAZYc8aJ1p2P3Za3zSdq2DGFhNI/8UwNb8UyEq44Yr9Un94fl5xubvpGt27nQzLIbI/9wBBdHDEFVS5iP1fsQRsbGfdvnF2NjWa0ruKGjGMT+zzenFfg9PUZI1RIC2eC2iJrrmHTKFKOy8tjockNjYgy0JBpqruaA2jRrSz84jnPChXVDK0O9pOu5gbMrW3diixybbCg02ok/AT30eaeXUm9/GO3qF7c0euNJap9P06IPbsPPVKLoWhrU0j5sQQDngM/oIq7tAm5fDL95DMeb0dw+OVbpcYTcdtgSMqoiBRXOMttYp6j8HUTQae1cqjbeTDzYeXUZtZPO6VpOeJuMcd48dFPfspQxoEzmE4yaOfkpdWvHa8Vn+kGMJRlkDZJGX6/gvrtbI10k6BpBR0lYz/IXokgwuz4m873aVWuHws0GnOQaAvoh2VkgsARVT/S104VLfDM9lgW7m2e6/9LTTbLBMKaRovyVHMgmBUEkDaCgsaAxUmUdjwGzEC5ii/06OqO1jr8E9dqGoNajVs5HWhFRQUfG5mwJhe3xP17hxPokT7lUduVjmws/Yov/qWlJuVt4JcCvD47tBXXlwh6NDyMTjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(82960400001)(38100700002)(316002)(31696002)(86362001)(5660300002)(2906002)(8936002)(44832011)(66476007)(66946007)(66556008)(4326008)(8676002)(6916009)(41300700001)(26005)(2616005)(186003)(6512007)(53546011)(6666004)(6486002)(6506007)(36756003)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5DM3owQjB4c3JMOEdWc2dIcHcwQ1o1azJzeWk5OUFzanNPa2JhMnVVYUFt?=
 =?utf-8?B?RWJvb0Z3R3FWOTFqTncyOXNCalc5emh6YzNqNXZmQ2N3Ym1mY2pFVjdXRGRi?=
 =?utf-8?B?R1VhRUJNTlJjWjJxKzJSZFpJbzlhNkQwSkp6NkE5VkpGVVkvampRR2JHQlpK?=
 =?utf-8?B?R3lvc3pFeTcwQUo0QWtkK3A0dUg2RFg3S0krM3hqUi91YlJIWHhlSjFkaTU5?=
 =?utf-8?B?YndkMURtUEpuREVxWWZUcmVpNUQ3OHcxcFBjY0dmQUpVa3U2R3F1MHJzamJz?=
 =?utf-8?B?TDcrL2VrVWVZM0o4bG9HM29jVkptcW10WXZIRS9hZ1BkWk8zaUcxMVNkYm13?=
 =?utf-8?B?Q1h5NnUySk9VMTFBWkVmb0M4aVNZbld6aFRBbVBtaVR4UlU1aEdrQ2U0WXBR?=
 =?utf-8?B?eEI5U3NQK3FJMnJXaDg5emNHY1oyUitHZlk1UkJvMTZSR2xBNVFWM0FYVWFq?=
 =?utf-8?B?YzhGWGhRZ1BZZFlTN014dmRsRng4aHpGUXR4V1BLckV6Z1FrVzdzVGhPMnNy?=
 =?utf-8?B?bVVYQi92TWoyRjkwcXdKc053dVNIZ1JaWkJydlZKYzF5SEpvbTFvS3JnaGZm?=
 =?utf-8?B?UG1lQ0JKTjUwblN6TFdJWkN2d2ZmMjNpNGlick1obnUyKzRlK21UbkpDUktF?=
 =?utf-8?B?MFB6bEdJRzFQdTg1bXhOT1VPYkxucTkza3o2TzhBTjh4eUovYVdMWUhrOEdp?=
 =?utf-8?B?Q2VLd2E3UDg3b3NUSjk0OTZZNjIrU2N0amVkdWN2RkRjMFRENWtQSGM5ckxG?=
 =?utf-8?B?WHVOVGprZTJsWEFmQjR2Sms5bFpEOEI3VjZGZFlWZVMzZjlXUjl2S1BINUh1?=
 =?utf-8?B?cHVTYklrcy9pTy94UDJ3d05LUlhqVXhQQUljRlVPNzk4UGlOZ1ZVbzFHODMx?=
 =?utf-8?B?WmFWeXc0cGNCWVFPWU04QTU3NTIvZkdINEI3R3VGcmw0anRkRmFzUHByTnlv?=
 =?utf-8?B?d2FhbkZPRVZWRURSa0s3V1l3V0lRdks0UThqVWx6eFpkRWRjblZqUzU1dGVt?=
 =?utf-8?B?MkRnNWs1clBLK0hYWnZ2d0xyaFJ0YjIvZ0F1cDNEcDN6Uks5ZXAyR0FMUXVL?=
 =?utf-8?B?R0N0WmtxcFlNMmkxaFNZSTRSaWZTb1hTQXMrUnRyRUpLZ0piK0tnTXJSSmRM?=
 =?utf-8?B?NkIwNnc1M3B2MDh3Ty81NjIrNVhLWVNyeSsrVEVaeDdCRHRRUC8yZll0YlVj?=
 =?utf-8?B?c1J3ZHAwVFhYQmJDajF0NXd4RzV6MzczeVBUTWw3QXBYM0R0a2gySUNGNEkx?=
 =?utf-8?B?TlJNbnpYV1BEdkxpazlhNWtsSGdWUW5mZUZqSllucVdFTVNndm9VYzdtUCtr?=
 =?utf-8?B?Nkp2dlJmajFMVk5ScU03aDB6TUV2c0wvK1k4cENRZVIzbXFTOGJDTGpCdk80?=
 =?utf-8?B?MGN2Ni84NUorMUs4bjBRaGNkMTVGT2IzR211QjBNZmpFam4velFLV2lhYUsx?=
 =?utf-8?B?MXRsSU9mS2FDQWlNZ1pNVWFmeXdOU2hicFJXOEZGYk1NWnBXbFAxTVo3dFRM?=
 =?utf-8?B?NHlTVkEyLy9GNmI5Q1hWZkg4Sjc4OTJadlVzVDMzcytqMStIMU1VenpjQitZ?=
 =?utf-8?B?ZnhMdzg2RG5GM1Z4ZFJwTmhIZmJwaEZoRE5qc0lZSDhwZWlMWWprLzBMdzA5?=
 =?utf-8?B?eDdZUTB5cGdFUVlpREFKSHRIL0haWjNZSk5kQ2xEQWl0ejZ4TU1VdDl2ckFw?=
 =?utf-8?B?QjhHM3ExQk5YT3dTeFlSeUVQT00xa25XSHAvWjVPNEYyQzVkWDZHRStQRjJU?=
 =?utf-8?B?Z0NoVnNJSEMwM2VKdHNoTlV0WnJsRFhUWWtWem0xM0hPZ244TUcweTZqd0Ew?=
 =?utf-8?B?Vm10UFd6WW5zNEsyb1FwakQzbEZJb0l1MytsQnVueVBjcGd5Z29FSS8zY0N6?=
 =?utf-8?B?Q2N2Z3FjWUh5Y2N5SlEvSXduemxMNEQ5OW00YmNxRSs5ME9yZnJHMDBERHRO?=
 =?utf-8?B?c3ZQRFdNd001WmRqaDdWaVJVdWpSWU5za3Y0ZDVSMjNMV1Z3THJIcmdBcnpX?=
 =?utf-8?B?WDNKeS9JaHIvSnVQU2VodTdyT2xqNUsvbEg2NzRiL2lJNzVTS2FNTkxGQlZh?=
 =?utf-8?B?cmRmOWdjcUpmbUM1dGFGN1ZkeGVZYTROSzVleC9uNGMvdDNVdzQxWkcwVnZr?=
 =?utf-8?B?aG5WU0tDa0tkTlhFODVDNkV2U2NNcXp3cDV6YjRCQVAzemlHYzRVRXNvVEpC?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f86ed71-26a3-434b-9b02-08daf94c1d9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 12:04:13.7098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDuGpCuBA3c0YJjjbfDile/F606vuPNgV2hMvnSRsLHA2oT3JwcrbYklpWplXc7MFq7O/u8k3mYGY3xzk+2wU9yZ9zkpxl8sapuFK1jt1og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
X-OriginatorOrg: intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2023-01-17 5:01 PM, Takashi Iwai wrote:

...

>> This is a continuation of a discussion that begun in the middle of 2022
>> [1] and was part of a larger series addressing several HDAudio topics.
>>
>> Single rmmod on ASoC's codec driver module is enough to cause a panic.
>> Given our results, no regression shows up with modprobe/rmmod on
>> snd_hda_intel side with this patch applied.
> 
> I think one possible regression by this change would be the case you
> reload another codec driver.  With keeping codec->preset, it's still
> thought as if already matched, and a wrong one could be used.
> 
> And, this would be nothing but a leak of the possibly freed address.
> After hda_codec_driver_remove(), card->preset may point to an already
> freed address.
> 
> So, just removing isn't right.  It has to be cleared somewhere
> instead, e.g. in hda_bind.c.
> 
> But, one thing I'm still concerned is that your comment about the call
> without the card binding.  Do you mean that the
> snd_hda_codec_cleanup_for_unbind() may be called even if codec->card
> isn't set?

One proposition would be to add line:
	codec->preset = NULL;

after both invocations of snd_hda_codec_cleanup_for_unbind() in 
hda_codec_driver_probe/remove() in sound/pci/hda/hda_bind.c.

In regard to your last question - no, cleanup is only called either in 
component->probe()'s error path or in component->remove() once 
snd_hda_codec_device_new() succeeds and thus, codec->card points to a 
valid sound card.

What I meant by my comment, is that removal of any components of an ASoC 
sound card will cause all other components to have their ->remove() op 
called too. Let's say I unload snd_soc_avs_hdaudio module without 
unloading snd_soc_avs. As bus (snd_soc_avs) owns the codecs, its 
platform component->remove() gets called right after codec 
component->remove() but the actual devices are still present in the 
system even with the sound card module (snd_soc_avs_hdaudio) unloaded.


Regards,
Czarek
