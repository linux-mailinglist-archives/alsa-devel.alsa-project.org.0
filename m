Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645926CDB17
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 15:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D7842;
	Wed, 29 Mar 2023 15:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D7842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680097569;
	bh=6V9wV7rMnZI+i5DVyopW9/aFOMCKUEQWj12/k6alUaM=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Cu1DaqMI8MJKkk4PlmbngvDwcqFk9cEn2f9Ah87dVc1Vd7HZV5gbHbQENnN6Pg8Rk
	 WGKFsrCj71J9SIxxLh9b2SdIx4c57sx8IcWieXk1Rg37shBaZION86BWjv/r/VS63i
	 fLe2Nn49JqPwzJE08oLRgPcRg5SxCBtOg2LYbNoY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C72CFF80114;
	Wed, 29 Mar 2023 15:45:18 +0200 (CEST)
Date: Wed, 29 Mar 2023 19:18:22 +0530
Subject: Re: [PATCH V8 0/8] Add SoundWire support for AMD platforms
To: vkoul@kernel.org
References: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
 <50c9632c-0ab1-baa6-cbb3-a84cd543ea6f@amd.com>
In-Reply-To: <50c9632c-0ab1-baa6-cbb3-a84cd543ea6f@amd.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQQIJDUHRQFRBMKUP5FLVPP3Q45HLAF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168009751799.26.10073812074938197278@mailman-core.alsa-project.org>
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
	id 78601F80249; Wed, 29 Mar 2023 15:45:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7170BF80482
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 15:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7170BF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XPHwuR5J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBZSFqsVoUgQIAX9tHQUe5PQNTtlhiS4gmiwt2x+TF47WczrxBSvDUR4QorQxlBzpxtTfYy5kbsy+5RAGabL00lLR4dCXaKyPf8N5Syr4NVUqZHL5uAtTV1iPWNk0hcFTrIVlpAjk/PePreN6tOkuJO1aW/lIrdyVESalYYOefGpR6E0LA+CtwVNfsr9Ru7GoEbrnl8maGiyEhnuHOhnWsA93P31eCbgOYTFG06S20o4tur62qkSbvMhwXk6GW43QTEtiukTj2nrFORaTAHPtyqnOebDdw2lV4YGUxyKdBGQ1Mr/+QozQdFg6/rbG0g5PoIFF8oLRJRhl0PeOJzhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6QIQ1QGUps9wAXdcirWEeMvbbR5kn2wvFTXUle6Z9M=;
 b=NXv7kfGeg0OiJKtk+jufjLVvxxvv5VbuOXR/yyKOJEN8f6z4mZwgmroeYq9za8vT/mmB+27+ZCk/4rC8ElaJzY0roqyw/hAIv70JBp0GbOWALe4SrLiLC+j1bnlIx44EiWMnzv5fp4iHyj0Cdf67R+DBwG1pqgXJ5AGGCMlNznXn27UFxGcZuppREdPPWRDdq1hbyuC+VL6zD/abanESdKPcQ2feYr/TyzgCflN7tTHMjLa3PA5J35incQtOYR+cnk9GgxXgjCbBkrvXbWYnAFjXL6f7OzJ52DN7zxshLgZe/KhDdl/dqBv2RY6U/KrtaDjDJfS7ho7fXxT/XI8aBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6QIQ1QGUps9wAXdcirWEeMvbbR5kn2wvFTXUle6Z9M=;
 b=XPHwuR5JkKnUQFy6NDGjmgJCFcsSd77QCev4o0C9WuERd5yMpgDJc5iZhLC5vj+CDe+asbnWlmGOe5cDIZVh/x/ruv9xBvC49wMo54t9I5ueDnM2dePbmH5eYoE2dSqafkH/p+s+8jvFTzZVs4V0cLDQEOLPh0b6bh6oz3Yv+1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 13:44:52 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e4f3:9509:c6ee:41cb]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e4f3:9509:c6ee:41cb%4]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 13:44:51 +0000
Message-ID: <7da52cc4-3b0d-a6fa-0d72-65293c8b49be@amd.com>
Date: Wed, 29 Mar 2023 19:18:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V8 0/8] Add SoundWire support for AMD platforms
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: vkoul@kernel.org
References: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
 <50c9632c-0ab1-baa6-cbb3-a84cd543ea6f@amd.com>
In-Reply-To: <50c9632c-0ab1-baa6-cbb3-a84cd543ea6f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a23f5c8-15e9-4e9b-0aba-08db305bc50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SyI7etv7CQ7fAh+8zHVLSuC15xpEUXlxYoR6EzC6owDvPevBuUCqeDfvAzD5j83a1pevsdZ4vn0yxUbQBa9jXV+Xb2ckQXId4UHM3jinAJ1ESrouyvCsQYwrQBS0xfyqo6al2RFpl6xonsq//N9XHaH2B8HwvQmFC1q69jWULk+XdP5EKsM4Vgh3BPyVR5YVo7modGSPq5qkpzzSGzHWpur5nMyqOVldd9tJvLkKixMcy2P/2sE9l/YaLP4Vc/DKLZop2prnnZmRlvdOHAuaXWZT6cQv6pq2TQxyY6xtG2smtnERDb+Ky5Kulfcx/Ap/4LxnZNiw+IW7Y5ehcJFF4nqFtV+bPBqf1bWzSvsHpxHb2Q7w5vT/bPs7uF7guQCkocQ8sxSNothjWSpsgOKjRqLfvRZEAvVSosVUnqgkNjAnhPnnlmNCUAThXuPV96COPcEYQCSr3x+sghvqnFlOTp8Q0+1wfqG+FRVhEg1Ey1qLz6nIAMWK1mmxy1jVvI9fxHv/q7hIAYm4rGLi0D1ZxGRnYID1oWjIbEXBTU0740gaEjnyXaoy2ZY3Kq3R485sdY1eFij6H6BLxEJTm1zg1KRBko/nM8D7Fi8pWyfXlmWVSopD343SqQdq67fA4pv2voFGQ1l33oBYLMxEcl4MgA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(31686004)(66946007)(8676002)(41300700001)(6916009)(36756003)(38100700002)(66476007)(4326008)(8936002)(6666004)(83380400001)(316002)(2906002)(66556008)(31696002)(186003)(5660300002)(478600001)(6486002)(6506007)(86362001)(6512007)(2616005)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVJrd2JoL2c4OWUxWUVYcXFINFB5WnkzS2xRbFZJOVZEekw0QWJpOEtMc3RE?=
 =?utf-8?B?WSt2ekcrT0c4c1ZrTnRNNGNXU0JEamJVSmUwMUhQRDZtanlZQUNaTUtGTDl0?=
 =?utf-8?B?WWpGT2dPRER1WmZZU0hBaCtpRFp5Qnc5cHlDcGdXOEdTcVB1bnBkY2tuMzZL?=
 =?utf-8?B?UlhPNVpzQUNpQWY0OUdKL3NBK1V6RndoM3dpbDRZNVRNNHd6R2l1a1cybXl0?=
 =?utf-8?B?Z2JGMzR0bVVNYzE0VksveTQ4b1ZyMnVYemx5Kzlab09rbkYyU0tUdG55Q0Zs?=
 =?utf-8?B?NGRxOENJd3lmYTd2dTBmMHY5cTNzZUxzSzhoYkxiR3NGNkF4UG9sSCszRVgx?=
 =?utf-8?B?cWloZE05ZlFBTk5PUCtkSGhrZ2JJdUJkOUlnNkpNai9IT3ErVVdUM3JOMDR1?=
 =?utf-8?B?VlIwSmhxVVlOa2xlQ2FvV2Y1dW9teGFOYS9kbXYwWVZEcmVNK2V1ekxSbnBG?=
 =?utf-8?B?K0RUNFJ3OGVVM0J2ZXVVNHM5blZZRnBFV0huYiswcGxoTlBiT1V1K1U0bFZw?=
 =?utf-8?B?YTFjOTc2d1NiNGtnbHdTRUxxSk1CeCsweTlxN29IaVBwbm13RkJ3SVZUeFNs?=
 =?utf-8?B?cE9zWlg0MGxrOFJQbktOOE1JL0VVQWgyazgwTEw3d2ZIV1lXQlBmRVZFWGdx?=
 =?utf-8?B?TjFPYlJyOGlUczdsOXlHa0pGL2xkbG00eTk5RlF2UnN0aGpSR1FwdjRIaWN1?=
 =?utf-8?B?d1lpQ2NjSytwSHNDTzhjV0R2ZmVsTWhWYkZOSUV4ZUdETkNiS09PRUlKY1Zp?=
 =?utf-8?B?a3lIS21uTnlxRnI0QjJMQnRwUHZRaURUMGRNbDRmQnk5YTlZd29LNUFrSFVp?=
 =?utf-8?B?L3cyc3Z5MnVzaFUzUmJlZ2dGbHRoWUtLUGhrRkpodGxuR0xkSnJyVjFvTU4w?=
 =?utf-8?B?NmJoN2ZqeXN6T2pHSFFrWnVScW8vUDBCQXAvTnBWZXV6MmVyZG5rem9acGpR?=
 =?utf-8?B?SXp4WGR2b3pwQ2VHQ3NEbE1WWTdRaExzRnpLbXRxMVRzMVpiL2JkaURjL1Nw?=
 =?utf-8?B?MU5nc2RmNVB2dkxHYWpGYkxKU1BJOUtpNTR5d1gwZTg5WFZwS2Q0Z0ZjZ0d3?=
 =?utf-8?B?cWRXMHhML1kxTTdiRklMdnZ6MTdreElMaldPdUU2NkcxYTlER3pEdTRhMTBm?=
 =?utf-8?B?Rm01WG1rS3NYRHNFNFYvK0tIZGRGaTRERitXL3R3emtkQ3FMemtuVTZFVGdY?=
 =?utf-8?B?ekI2R2pnMUJtMUk4UlJISk1qbzNsREpMdXUwL0FMTHIrbTBBdzNxaEkza0Nw?=
 =?utf-8?B?UzZrQkhuK0VaUjd2d2pNTit6bFZtdEJtckFnWkZqOThSL1ltbW42eXptRkli?=
 =?utf-8?B?Qm1RdlhHbjcrY3RQOGVaa3dMRjZ2TG9nbUFjUkJ2TTVoODYxcGdIODBhSVlt?=
 =?utf-8?B?d2N2dFo3K3lKWjNwZlZWMHI1anFjeW44K2pGWjgzbS9kR0tTSlB5aFo4Mmo0?=
 =?utf-8?B?UkFXVGJvbForK0hLYlg1WEcyYkdndjJ4T0NOZGhpZDZSMjdXeXlHZXZMSHF4?=
 =?utf-8?B?Y2thK2JxalZvYUl2TFNCYzRxOTQybjJZQXFETUR4TlJXTmRrWS9jTzRFdjk3?=
 =?utf-8?B?V3BjdVoyS1JBZGRwK1ZmeGxqN2xLS0NNU0FRdTFVNmJxN0syVVR3ZVRiREpR?=
 =?utf-8?B?Q3R1Z2VtamJPdHI5LzN4QjE1YisrN0pVL1RaUm1tRVJidlNMbnBiRzZzaUc2?=
 =?utf-8?B?TWhZTTNkU3Bjd3NPUlA4MkhQZVk2MS9VdHY3QWFWbkE2UFRVdmZoREJrSi9v?=
 =?utf-8?B?VDhtYzVJNUYyalVRUEFzYVR5bXRTVHQvR1BvYm90TUR6Z1FzWlp2RTBmeXdK?=
 =?utf-8?B?cERuekRnNzNpNWlBZy9sazQwWmR6U2ViYjFEZWlKaWx5OGhkZWVuM3AwSktn?=
 =?utf-8?B?N3ZVdzE4RWcyRlZQUW54K1hqdHJjYkhSNG96ZTArMWtUR3piL0lmWCsxSEk5?=
 =?utf-8?B?cThGcERiS0MzV3VPNmZ1dW1ZWVJOd05JbWw3U1JoU0kyMVpDdVE3K1lHNTQx?=
 =?utf-8?B?aWZUM0RyZks4OGVQcTBRanlqZGNHSjJFamZkM1F3MlM4Z2lFVVhJdk5tQmNV?=
 =?utf-8?B?VnFJS3ZqdnYvWE0yZHRjbkN2Vk5nRFZERndQNndRNFZRU3I2bWF4QzJhdlZq?=
 =?utf-8?Q?UQ9vlBgVifYsFY6ea959I4AZ4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a23f5c8-15e9-4e9b-0aba-08db305bc50d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:44:51.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DhUaU+qQq0PIysO+fPP4hE9xuBYUSXdIrFtIA8ZuJGwEDuzGvqS0jnfeaBLae/rc9aR5XZ/iEa8Vm6DhGoCFPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867
Message-ID-Hash: WQQIJDUHRQFRBMKUP5FLVPP3Q45HLAF5
X-Message-ID-Hash: WQQIJDUHRQFRBMKUP5FLVPP3Q45HLAF5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQQIJDUHRQFRBMKUP5FLVPP3Q45HLAF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/03/23 17:50, Mukunda,Vijendar wrote:
> On 21/03/23 10:38, Vijendar Mukunda wrote:
>> ACP IP(v6.x) block has two SoundWire manager instance support.
>> This patchset adds support for AMD SoundWire manager driver.
> @vinod: Should I resend the patch series?
Hi Vinod,

We have to push ASoC patch series for upstream review, which is dependent
on soundwire patch series.

Could you please look in to current patch series and provide your feedback?

-Thanks,
Vijendar
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>
>> changes since v7:
>> 	- use readl/writel instead of acp_reg_readl() & acp_reg_writel().
>> 	- drop acp_reg_readl() & acp_reg_writel()
>> 	- use readl_poll_timeout() instead of read_poll_timeout()
>> 	- refactor command prepration and response error handling.
>> 	- Modify switch statement in amd_sdw_fill_slave_status().
>> 	- use lower case for hex values.
>> 	- restrict debug logs to single line.
>>
>> changes since v6:
>> 	- remove pm suspend check in amd_resume_child_device()
>> 	  and always return 0.
>> 	- use same name convention for command and response
>> 	  variables.
>>
>> changes since v5:
>> 	- replace loops logic with read_poll_timeout()
>> 	  throughout the code.
>>
>> changes since v4:
>> 	- fix nit-picks in the code.
>> 	- update naming convention for control word and response
>> 	  buffer vairables.
>> 	- drop pm_suspend check in prepare callback.
>> 	- use return statement instead of returning ret variable.
>>
>> changes since v3:
>> 	- add usleep_range() in command/response implementation.
>> 	- add usleep_range() in clock stop sequence.
>> 	- modify usleep_range() values throughout the code.
>> 	- remove unncessary debug statement from code.
>> 	- update comment in probe() call.
>> 	- fix timeout condition checks in the code.
>> 	- drop "ret" variable in amd_disable_sdw_manager().
>>
>> changes since v2:
>> 	- Remove useless variable initializations.
>> 	- Add helper function to interpret peripheral status.
>> 	- Move runtime pm sequence to probe_work workqueue.
>> 	- Use string "SoundWire" instead of "soundwire" in code.
>> 	- Update comments in interrupt handler and probe sequence.
>> 	- Rename "sdw_lock" as "acp_sdw_lock".
>> 	- Remove __func__ from dev_dbg statements.
>>
>> changes since v1:
>> 	- Drop asoc tree based patches. will send asoc patches as a separate series.
>> 	- Fixed double space errors.
>> 	- Use dev instead of pci->dev.
>> 	- Use SoundWire manager terminology.
>> 	- Remove amd_sdw_compute_slave_ports() function and use exported
>> 	  sdw_compute_slave_ports() function.
>> 	- Remove unused variable "num_ports" from amd_manager structure.
>> 	- Drop startup and shutdown dai callbacks.
>> 	- Drop reset_page_addr callback. - Use relative address offset to program SoundWire manager
>> 	  registers throughout the code.
>> 	- Separate wake enable interrupt handling from slave status handling logic.
>> 	- Use acp_mmio to program ACP common registers.
>> 	- Use dai_runtime_array implementation in dai_ops.
>> 	- Refactor port_ops callbacks.
>> 	- Add comments in port_ops callbacks.
>> 	- Add retry count logic in irq thread to address faulty case.
>> 	- Add helper function to interpret command response.
>> 	- Add generic bandwidth allocation dependency in Kconfig options.
>> 	- Add comments for AMD SoundWire power modes.
>> 	- Add missing timeout check in amd_init_sdw_manager callback.
>> 	- Declare frameshape parameters in probe call.
>> 	- Handle error case in clock stop sequence.
>> 	- Add comments in pm_prepare and pm_ops callbacks.
>>
>> Vijendar Mukunda (8):
>>   soundwire: export sdw_compute_slave_ports() function
>>   soundwire: amd: Add support for AMD Manager driver
>>   soundwire: amd: register SoundWire manager dai ops
>>   soundwire: amd: enable build for AMD SoundWire manager driver
>>   soundwire: amd: add SoundWire manager interrupt handling
>>   soundwire: amd: add runtime pm ops for AMD SoundWire manager driver
>>   soundwire: amd: handle SoundWire wake enable interrupt
>>   soundwire: amd: add pm_prepare callback and pm ops support
>>
>>  drivers/soundwire/Kconfig                     |   10 +
>>  drivers/soundwire/Makefile                    |    4 +
>>  drivers/soundwire/amd_manager.c               | 1208 +++++++++++++++++
>>  drivers/soundwire/amd_manager.h               |  258 ++++
>>  drivers/soundwire/bus.h                       |    9 +
>>  .../soundwire/generic_bandwidth_allocation.c  |   12 +-
>>  include/linux/soundwire/sdw_amd.h             |  109 ++
>>  7 files changed, 1601 insertions(+), 9 deletions(-)
>>  create mode 100644 drivers/soundwire/amd_manager.c
>>  create mode 100644 drivers/soundwire/amd_manager.h
>>  create mode 100644 include/linux/soundwire/sdw_amd.h
>>

