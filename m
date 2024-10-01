Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9718698B18C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 02:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD84685D;
	Tue,  1 Oct 2024 02:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD84685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727743485;
	bh=s5L29XpUtH95TOssq/nyqFbwWTfPD774GCsxzyThRTI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f5/nAcVgHuOdBMY8HFP3ZGUHfDFGdvuMtxuhaot7qpBey3EgMFQ8cmWtNTmm0dzTu
	 m36xqMilWFmac7fovGgZiV6+wY2cMi6fek6QybORuw26sT6tTqnSWM/36Shem/krhT
	 ulxyl3WybIqUH9Duox1MXIlt6qfumz0T3KnL2W4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D034AF805B0; Tue,  1 Oct 2024 02:44:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 326BDF80528;
	Tue,  1 Oct 2024 02:44:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB8FAF80517; Tue,  1 Oct 2024 02:44:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56DE1F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 02:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DE1F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PtQjcJzN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TH52amB/PKIXl0UodVTQldYs1deqrPDJfgab82iS5+izPvziEXypdgFgrJtzIAZVRCEWPgOgX7L1+FYUl23dLkd2fFcIZgjrBm/S9MuBbMEbPXKryWFxaZZJp+X+E0oTyKz/z+vm0JzlYto5+BGGwfLwCrHYogbphJn3K5TmGgUCHkR5AEQxZaeyOQrpZFPwS+yUIGjAJGIDVY5HokqIcDStRfa5GKOeh5SXUAX1x2vf1qT1nXh3EK8X3Ebg932mP+mdcZG3MbXSx0XwozzS+gzlicNEQeIZGIbeMH8LWuFv2bMSd/oiD8xSc0Te8vUI0p78SWVnu+YgDIVl+sX/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fhWeeumlxAe0F0YwmfxuXDqHjFVEWvJynMLrDnqGNQ=;
 b=VX1eVlxZBz3Ld21VAwzY8H9KSkuA9a3c5h97wRTOmO60uQf2OcEFUzY7Rnk/7C8tf94d/cjpcm12+/7T+LUztvk7umqMxJpppzKgTGdBLu6HILYpmqevAtDp0jMwthcowKaJ3J31KrYgmM+cXIUcQphcggqi77u3is8f9K89gC2khgVBpsdw2GagTxG4uTZUZj12paAh5gOCMxnzUlsJrEsaLh/GGKWjdnV8xD0sxS7AGFRBeg9Q3+XZYLgGSGNoTj1LugJ5LbAtUy3rFJdSSUgr2aDD+ASSb+2gwJhAxtLhty67Ebqm1oxkmTBQq9I6AH/81bxFV0KIfycl6dRYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fhWeeumlxAe0F0YwmfxuXDqHjFVEWvJynMLrDnqGNQ=;
 b=PtQjcJzNbA2J6/fKd3A83xlFFZ5lhALCsmx9a5J7kYzAyYxI9JegTwjsGOS9FBeiaebSOvEy125Z8GLJk4z9DOUi6bxY06sRL/ApaaWbW+dJjCu1C1ykG27duhmI+z5Pcj9luVHDxTi+29KA9tWSwnXmiK+3yMMn/4pd2N3JqiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5568.jpnprd01.prod.outlook.com
 (2603:1096:404:802d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 00:43:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 00:43:56 +0000
Message-ID: <87zfnoveic.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 04/13] ASoC: intel: remove dpcm_xxx flags
In-Reply-To: <7b4ddfa0-193e-44a1-a039-1f2fdea0923d@linux.intel.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
	<87ldz9lwgl.wl-kuninori.morimoto.gx@renesas.com>
	<7b4ddfa0-193e-44a1-a039-1f2fdea0923d@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 00:43:55 +0000
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 204e0af4-5cf9-4c6d-19b4-08dce1b22145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g8sQuZ4siLrrRxAdrPBcryW+XI40Tp/Oi3TI3Yc6XLI6t36o5cOa0y2Kr/pc?=
 =?us-ascii?Q?I2ZnY1xboO5vQhU8hygExoktmXcyLEyP3xByi1JDWbSk+U17IGFQD9k2I0jK?=
 =?us-ascii?Q?0zQ9WtWlCIBxQKsfxS7cpNszsGTfQMcV784dccwuPoiwpPCaaAdJjFbbXTec?=
 =?us-ascii?Q?bQTPgGsmumzn8byJp1MA5M799LRBPe8j8N1Bn9wlBViMNvKCQwfdPktafFIz?=
 =?us-ascii?Q?6ucg5pKtB0osEat3zaKeGZ1+60bno9f1Ra9yQRvbn6jSGsWCNipdxgkqvL5r?=
 =?us-ascii?Q?NcxqtqbS6gQJ35ktoU7jXVRGtNhKOFbuIMoQerp6/twqh0DGKfkueu1+bUWI?=
 =?us-ascii?Q?x7TTY6AWq07o5lFJ35ougVQXs/3/vHrvLohgXNj7qhGt0XT6YxUdUZyu+zNA?=
 =?us-ascii?Q?d/NWYK8kddJ7Jei8UxuKTAZocj4NA0+exQBgLpSYcX5p1O73UR9Z5fseHStb?=
 =?us-ascii?Q?hEFL9BlMRJANXewnbf/3fWU7+tFZj0AZDrK21iisihZUfV165CO3UaJ7C7KJ?=
 =?us-ascii?Q?OPjl9YEpKWZR3rT6GtKyD54mXU9X0NrBTl/9/dlr/GhaVeJYenEdFgV9LLgT?=
 =?us-ascii?Q?5xwCLP5/kAshP0ybHh8p4dSsA34LP++WW52CCuPboHBK4/WV3B24wZfZdulb?=
 =?us-ascii?Q?EB81XHCRSyy/xpsRQeTMszpu2bmXv1Hi20UtY5R61iTm2UX9fzMj3R2xGQ1s?=
 =?us-ascii?Q?2Gt/wwwmURUhGVggu1IBzbGK/QVbsQO5iih//BHUKXLP18qywFZIuU7Lr8wN?=
 =?us-ascii?Q?B3xKz03w7pD9DeMKnjSa+LaLgn3ClDOvmPkWXe9qKZB2XxVFNGzt3FEsjI2b?=
 =?us-ascii?Q?+coM45zTKWaifIrRlTwl47HJ/j4hNTAxWQmSeR6NJbrM+jh6rxpwLPdiFSz2?=
 =?us-ascii?Q?Fsmk9/WDDT7NW8jbJVdOQ7vi7Nt9TjfvFQ66+B8IWREwdF8uscBW2IpQvlpw?=
 =?us-ascii?Q?fmUssobeUWJe7mNhg9DR3OpCJi8UEA/IQTFxUbXad7mDlzPQun6bG3u4QEhA?=
 =?us-ascii?Q?Dos2ZQRu+Y6cS8WnrVH/iWcJtuuMWQFtyLhBfwwF6F25QUKZKUAYH4nbuRcf?=
 =?us-ascii?Q?Gyv971XuEJeuTdqaOgoDpzwUdxpu9YER4WjsGF/9sKB6W6XJOOiXcCB4FsNw?=
 =?us-ascii?Q?7yxUWJrs6vXkkjz+9fF9rO7fWt9n4hyXsE90fS8cSGlgVr8zwXfuFgBvtaVX?=
 =?us-ascii?Q?Kcsm6zZL2MVjEw/RH27OflNFFgCqEIPXHYHmiGBqKRL/kfSyoe3IteJal+Ob?=
 =?us-ascii?Q?fFMOqwirIxMpImcdNAnn/xsuw4xz9gfc+iME5mXvz2gfieSXQV7DVJltNhbV?=
 =?us-ascii?Q?vCEArxbN2S3h63Dq3FLhNnfrG568XvqwcUCnfNBo8hCgTy+97cMUBP4zp41s?=
 =?us-ascii?Q?fasdLQZnXgP3KXQLPf2Russ/cwN3bgos5n5Uo77yaezaSlGPnQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1pma5UdQYjGQnIKe5fU+Vm9jASgYtVWAwmw4/EKLvrzAUYavjeAvJj1MF9o+?=
 =?us-ascii?Q?rFN4VsJjyOEcipAujDLk5UFX84Gsu5FkzzIfu6QBcIqX72dwxeg1Mqre/aW1?=
 =?us-ascii?Q?B7fj0WE+3nOdA3l402K2Of5oqiX8blq8/gdolGKYXzdU59PkBf8RNUTQfJcn?=
 =?us-ascii?Q?6gYay5Hze4hCeZLzHQbiYR8j+nkDdGQ+M/q8TEu475IRBLfmk/CJZgVBeyjG?=
 =?us-ascii?Q?AMc40Is+eU08zNk6mFwur7XWnxSLsW8WHjXYkZ6fjo76t34Sl/DiSCIDVLz9?=
 =?us-ascii?Q?5gLMF2jkKP3MKl7p1+xlc8YyyR8c4CdI2mGheMBEs/VE3Vhgd1BEQDIpOhV6?=
 =?us-ascii?Q?f3eDYPOLt+3uXKuMfnA/sQXDLQgjYHjJS+8Lf3RX4qRUXWBfiT+Kig4/HWnl?=
 =?us-ascii?Q?AFO7bzJ2EsilPyr48dTNwsrJB8VG1vGKhUny/em5s8m2dIV1VbcwEXOD2UsA?=
 =?us-ascii?Q?pGfqns8KuglYP2xfGKbOS26HpjhKLv/EisuyR2OUr7bQrI2ZST1YVQFVey6L?=
 =?us-ascii?Q?OfiUsPREhIKtpakGrRfv08vCnZcQUxd6m83STyojTCNHD1qTeVoEgNtS7N0u?=
 =?us-ascii?Q?BxbZFZ6qSDq0JqJqPmLetlwPX9qHV7OysE1qa2S8jWVJGsdAqWGkdQpe+hVW?=
 =?us-ascii?Q?PLZqIZoUUBxtnnXhI/CVQ5cLIwm4UQZXQ5ZcsVEVLT2oLLBzLI3s6T1eHQvH?=
 =?us-ascii?Q?5/IFR1Hd50HAlf0RVYgg7jiBZ/aZlgFdbVbiaGQwfu0rtqHlL+oMs21RONzP?=
 =?us-ascii?Q?DaeIvUsXyMzVM+ratn0cFIZqgDHWyklAiKlCDctOUAnQvyvTDokwzdGUkuea?=
 =?us-ascii?Q?TuOHF5Y4g53eYDZ3AeI8TI2jkPrWjjhi5IMaSUwmMLzP3RBYu2kQmVUZ0tED?=
 =?us-ascii?Q?5GLFpLbaTBLk2+lp7+A/vvjTl65/uLU+9i12g/joGPWI65FJOCXRkp1Ovpxo?=
 =?us-ascii?Q?4oUb2GOGIA5uluS2bzKSOjrmtEOkZi46OVGq34kUFy7Qy0mEX6XJ36BkzIaX?=
 =?us-ascii?Q?Ikp3Z1mnE9tHF2fF/H+3tHGMl5aGETlh1zKZIOs+GDK+gm6JXHUyVHBoaJso?=
 =?us-ascii?Q?9LW2Obhj9p+7JLiO/5R6IocsqtgdXdKOK1OhMYm+h9Cv2b2opZ1XH4zrT3yH?=
 =?us-ascii?Q?cU4SxOjKS+IC2pTxn7QUPa37dWuxXPGUrCheakcMBkJAgNZ6G/4LiL30Js9o?=
 =?us-ascii?Q?sPQrfmEgpRzq3Y60DAT0Mhd65hhCAzl7qdjgn+MX1PJiVOyv3lNcjp7udDBS?=
 =?us-ascii?Q?54nvAdE/Wra8kUsRV/F60K8p0TfFhK6QL8ktYYqZe+MtbLiPrDbygRl/ZP9S?=
 =?us-ascii?Q?RPaf0BjxztKvugVMtw/wP+dqK6hz8grsP4C247JcNlzMSnAY+QIwL/GFrxNq?=
 =?us-ascii?Q?6jN+eqY19UZ90jvisj7rKMIv7jcIbCmFwo5WrHsRc6MziC1WoVjIKPyoOuwC?=
 =?us-ascii?Q?KjjJsWf6xHOlXuQUWwBqGaVIE2U6pUeuNpW9gm35KFrcDv/zmMGetR6uyDSR?=
 =?us-ascii?Q?NXaWIxUPa6VTeF0hcRY64/UcYxM+pc3ilbFaWd1EHVLlpTMua1uPl/ecKNGR?=
 =?us-ascii?Q?rKb9s1B1hSnWIwy9ZIuSITh23e9A9TkL43ULV7VCm1a4DzaNaHN3Ief87cbb?=
 =?us-ascii?Q?OAgB4LkvueOQMULgf2BLTZA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 204e0af4-5cf9-4c6d-19b4-08dce1b22145
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 00:43:55.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IMXCdW08wPWfnEcT+u7vy64CiAO3cTooHQH/XvbKDBLFHVeap87m6EQqZtaXFWRIvzv+9eb41OEV7qRfZO9xE4HcO/YNMr0FHuDh1hfqRZ5y6ysnv3wSdIhaDEnccFwu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5568
Message-ID-Hash: E6YD5S3GVRPQMM2EPB7K66QHYIVLC454
X-Message-ID-Hash: E6YD5S3GVRPQMM2EPB7K66QHYIVLC454
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6YD5S3GVRPQMM2EPB7K66QHYIVLC454/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

> >   sound/soc/intel/avs/boards/da7219.c        | 2 --
> >   sound/soc/intel/avs/boards/dmic.c          | 4 ++--
> >   sound/soc/intel/avs/boards/es8336.c        | 2 --
> >   sound/soc/intel/avs/boards/hdaudio.c       | 4 ----
> >   sound/soc/intel/avs/boards/i2s_test.c      | 2 --
> >   sound/soc/intel/avs/boards/max98357a.c     | 2 +-
> >   sound/soc/intel/avs/boards/max98373.c      | 2 --
> >   sound/soc/intel/avs/boards/max98927.c      | 2 --
> >   sound/soc/intel/avs/boards/nau8825.c       | 2 --
> >   sound/soc/intel/avs/boards/rt274.c         | 2 --
> >   sound/soc/intel/avs/boards/rt286.c         | 2 --
> >   sound/soc/intel/avs/boards/rt298.c         | 2 --
> >   sound/soc/intel/avs/boards/rt5514.c        | 2 +-
> >   sound/soc/intel/avs/boards/rt5663.c        | 2 --
> >   sound/soc/intel/avs/boards/rt5682.c        | 2 --
> >   sound/soc/intel/avs/boards/ssm4567.c       | 2 --
> >   sound/soc/intel/boards/sof_board_helpers.c | 2 --
> 
> That's a bit of weird split, sof_board_helpers.c should've probably been 
> with the rest of SOF boards in patch 10? ;)

Ah yes. Thank you for pointing it.
Will fix and post v3

Thank you for your help !!

Best regards
---
Kuninori Morimoto
