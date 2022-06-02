Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047A53B9A7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9A51753;
	Thu,  2 Jun 2022 15:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9A51753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654176515;
	bh=kS6GuWY/lHjIBBTxo1dt3dvzl2SyedRX4vhdhFFTafQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2wYauS2zRcNcuXgC3ZOmAYVI0/m3quQGke4tuQlFrW2/JdLqWbOBy5Ujr15VzzkQ
	 pr5bszSJiXYz9Eka8uFjU28TzK5MXBzJnntyN1C00YB2I65APxIox03cZQZ5RvtcZQ
	 MEkchhz8PUuwP3Cjqwh4ZV3LvUhkLqWjJrdsxJqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D28A5F80089;
	Thu,  2 Jun 2022 15:27:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C2E2F80527; Thu,  2 Jun 2022 15:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9260BF80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9260BF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se
 header.b="JpH8zCBX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc43cnkxdgdQG3vdPODpQpsqjCPYUoa1HiMR334rSIj+us7VuluO6AvaFD9KrEUu3XMX3eUlpXoVq38tTwlVdjROtChUbUbH0L5SVli8Fs6HPffS46CEVXMwgf9DZGsFeiDUYaYWq4F4hDrgV2htazmqrYXeBihsYwmvlGAoWDHJE40JqLPtnAzTa1p+6ewk25zMVyoAE193jFfDGHT2NNvulOaw0TloaUsZLDp5+OFlLo9xBQwDErSzjySnO+vL7A0VcIz2CvIRQCLMRuCgzYpNrdM1n0N2K06EtH+sylD/gF2GudoQ5cEK8Zh62WepUHmcce2H1RUIDHHS+h7NKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5faJD6V2uEZVGIaClOfQ4kz51OTe8QUoCrl7lHRVp1g=;
 b=Xy2j70wgx0eGhItbKFL+sdpHxvzCTDIL3QSWSJiDu6xAnENNDuVN4T6kSLfTYp16pIOy0hRc93WgtYtofCaAnv4QRlFr9fX8nfGlZaaRrnACv7z14EMc4BD9zY/7eWeDP/sCZaRnjshDZOdGvmsRGI5AQGCsp4m2oQ7XMa0AAZL/6dAtNj2+VkDo/uPpi4OWZxAM3a9En2Ib0N7XO5Ycz5eVP26d8BEaEGpNbKZVQJFHR9FqmsbwnyZj87jchce/raqLkClHVCNeNgpeX3OtagX8yXWduzF03ZNhPlZFdVrGLPe8M3a8VHKVoDpl+IwLdlEyA5vMXU2AE5tR8a6yKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5faJD6V2uEZVGIaClOfQ4kz51OTe8QUoCrl7lHRVp1g=;
 b=JpH8zCBXvKeGkeXGCzJnNiWVItVEIhiHtmvwVIKwZqyVbsnsF/hS92rSXIzHgbQirPF1ADMKn1mmThkV3w4yxOdJZg4HOKktZAT/x5UL0bcfyfi9SxzfDHhlZ882qKPy3Zblh21C0FRyAnl+5jwIQrEpc5xRZaup7vtuui2C0NE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM0PR02MB5634.eurprd02.prod.outlook.com (2603:10a6:208:157::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 13:27:26 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde%4]) with mapi id 15.20.5314.012; Thu, 2 Jun 2022
 13:27:26 +0000
Message-ID: <df175c13-458b-a4f1-16c5-f8adef5cfa17@axentia.se>
Date: Thu, 2 Jun 2022 15:27:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: tfa9879: Use modern ASoC DAI format terminology
Content-Language: sv
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20220602131058.3552621-1-broonie@kernel.org>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20220602131058.3552621-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0089.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::13) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b8573b5-67fb-4eca-fbc1-08da449ba279
X-MS-TrafficTypeDiagnostic: AM0PR02MB5634:EE_
X-Microsoft-Antispam-PRVS: <AM0PR02MB56346059AD31F2C8E2864855BCDE9@AM0PR02MB5634.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjTSd4soddYXYAb4EWKTveiTzNvoG7E9DegTbgIS/xcVcoWJh26/Ma9RFE694djGfi29AnQt2es1VP5660qvdZ4AL0EGd6QjVgCYBO2OhIJ9eDu3980veEzl2AT5TJSMiB8v/c3VF0IyunV4Gols49ti2yO4MIsl8UIKnz+/2XND8w9WPuAixIEckivfxHXbLrBAmU3SS1E1D8G8ZDvxn/sesH9yvrnkMn2iQzwN6zNdq/T92d8jO6+/7/fe8z3IZkPMWPvBmZOZUwFY1NOWRdX8yhdqF8GYdnQonXHXV2IkCmy6KJ+OOjKg1hkw2v2PlU3tW6RA6I7hFqx1F69FApLDP6gREfn53GQvDUzgZ53Yhq/mDIMBIlGfp88EMxRUP2Allu58W9nouwjtCTrxqVFqfvw+fjnSCrwBS/fkPLffBDWASwfxQocpWbBorgIW9u2XDErWzraNnTeiQprwSfLVrsLvsy3CP0yYit4A94tWpexQ68OyUbZTK/Co9yLe75ryX0YHLUs4dJAtlIm4HG3aSzBdIVsbDdH1JCZKx1waLrvmo29LOnSllXlDpKTZAUv6cJo2TJcjQ1RQCNRIfOmkLokROyFfJ5GwSAnV5+Ib5e3I/zkyQLDJY9290nj02uVU41eOKbr6BXJuUvzEFIiLa6yIX3Roer1/M3JJ/SIFQRQvfnNgusH0HhFnIFeFvI1luGDc5i7OMFNW0tWJOYQ5T9k5ADTaq2hDy+PpQBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB4436.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(136003)(366004)(396003)(376002)(186003)(558084003)(38100700002)(31696002)(83380400001)(6506007)(110136005)(508600001)(6512007)(316002)(6486002)(26005)(2616005)(2906002)(41300700001)(8676002)(66556008)(66476007)(4326008)(66946007)(5660300002)(86362001)(36756003)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHowQXZPUGRHV1RPN0JodWVYZDhhR0pGdzNIK0tNVWo5U3gvbFFOTEU0SHBi?=
 =?utf-8?B?alZOMnZhU3p1MjlEZzZaNEt0Wnc4bGsxSERmS3JEdzhPUk9MTkd4RFhQaFNU?=
 =?utf-8?B?SnRwMW56N2N3MGZZWDQycjZJbVpHVnlLN0lnbzlzcG5pbTBwUXI0aXRyeG9O?=
 =?utf-8?B?cG0zSlBkVzJRcHU0QzZLNTZYaGNKMStFY1ZxVVlWM054Nkt1djRBVytGTnZa?=
 =?utf-8?B?UzFTaFg0dkhEcnNBOUVvYUpFeE9KaCtXWmNNbW9BMXoxaTNlcG54VitFUGxv?=
 =?utf-8?B?TSsyenc2OVorbFlvaEh0N2NTR0dhR2xFSXl5cXR2VUhxWlczZnBWZzNZOExK?=
 =?utf-8?B?K1lneVVVOVFjNUl2VnczWTJOKzVxdWxOdVUzcXR4U2dMa2xVRU5lZE05aXBS?=
 =?utf-8?B?TWVTUnRTWnhiMEZoN3BabVdBMU9hVGUwUjFuVHNQenllUk1hSFczbUc3N2ZX?=
 =?utf-8?B?UmZtaTJqVWQ0MmlpQWw3KzErOGFQMkZBbUF2QnQ2dVBxdTZpcTZ3c3MrTHp4?=
 =?utf-8?B?WSt3a3VnYmVkTG5xZFRnMFVHc1RmclJ4d0tKSXZzeVJjak1heGlrRGhKZHVj?=
 =?utf-8?B?c2ZiQXRtMDdKemlXSG44bHR3Q0s0bGFrWHNURkdHTGZvNktZeisvMHZ6NFE0?=
 =?utf-8?B?UkFLbmF3dUFNT1g5Q3lWRVJGQ3g5NlBKWitLVVVsdWJQNG9kU3hVc1lwcllu?=
 =?utf-8?B?bjZPL05lakhLa2x2Q3pHckJWck5PdlhVRittMnpCc3lFbDl0Z2x0c0N2Snpn?=
 =?utf-8?B?RDB1SUJRUDR3djJ2UWVpdzgzeG1wZDVUMTNEQUlkMzVVUEpIc3ZkYk4vMEUw?=
 =?utf-8?B?bU5hcWplUy94aC81RTN4RGRzYk9CUitzSlJrRy9UMnRRbkJkRTVqM1lBVFlh?=
 =?utf-8?B?dXU2TG4vNWtZWW9ncUtlT05UU0ppRUJiSUl0QjU3SngxV2xPd3dkMFBXTlBG?=
 =?utf-8?B?WWJiaGl3SUh5clFtWGdzYkNlOC9BLzFhZGZ3SFJPOThBMmkyVkJycm1IN2dB?=
 =?utf-8?B?d2lJd1JIbHJ3T2l0dWNNY1dlbzBTaVVwbDladWg4bjV4U3NIUmhtZ1IyajFq?=
 =?utf-8?B?VVZWYi9zMmR6enNOa1ZxMEN0U0hHRVdyYlJzVHBKSmtMVU85c3pQbHlaS3Fn?=
 =?utf-8?B?c2U3RTdXc2JzRzBmcFRVdEN0QWZKT3VZRHMyUE5seG9DckE0L0g1ejV3Y21H?=
 =?utf-8?B?YnBVV2xZTms0TFRSTGpGaUVoeTcyNWpzcFhGdjBnZnhGSUpqTUJFTzNHRlNk?=
 =?utf-8?B?QzY0V3djbWVqK2JsVmIwQXF6TjJNeGZtbHNlSFgxcUhJc05CQUxWUnlkWDN0?=
 =?utf-8?B?bm1WN1RRYnRaaEpoSnc4U2RPY3RyWEd3SFBYRkhmZVRQRmF4dGVzaWQ3RDBW?=
 =?utf-8?B?UUVoQTZUWllsUnI5VzRZNVdBR3Z6TE9PSzJMN1I0b2RPWm9ZeWtDQVFsMWtT?=
 =?utf-8?B?TFRWMjFnYkFnUC90MjQ4NVJPcmp0QmlEbUsrV1RNZ1ovUWNGcmw4SDFhMlMw?=
 =?utf-8?B?a0xmK2hWT214MzZNMmdUYmI0UE1ZL2Z4N0pQbENYdXhLUE5PVHBFQXFiam9n?=
 =?utf-8?B?UDhpcUJZdGZKNUp2L2w1eEo1NmhMemlMcmZPbEFzd0FLQ0l5bk5CY0tCaHB2?=
 =?utf-8?B?QjlCL2d1RkR1eUhmRWdaV0FEWGN0bmM0VFNUOTJaM3o0djJrSHdZL0tGbFJM?=
 =?utf-8?B?T3puYkV0NU9Gd2FEaWNZWlRSSlp5b3JrUmVZOXY1QndvM3VLUVJjbXU5clds?=
 =?utf-8?B?enVpdE9LTkhVdkU4aTFJcDljVjEvaWFFb1NlUFRhUndyOEpaZ0ZheGxaNXhI?=
 =?utf-8?B?SDJqcGN2a3MrOFR2dTJmQ0Rsc3pzaUozbnVqMSs3elNVdDh0dTd3djByWThY?=
 =?utf-8?B?dE1nS2ZRa0VZQ0JuQm1JV1MyZkwxc21hUkxQSnVRakNrWDB4Z094ZXdwYkZ0?=
 =?utf-8?B?SFFFWEJQZVZPRXFFalNESThWOVZQdVFiYXRDd09aWm9YWGlOMDBQZWpHU2lL?=
 =?utf-8?B?dHZQeWJKb1lBYm1YblhJS0lCeDU5SXNNU3NqdmpNKzNBUEtCQXpEZ3A3MVY0?=
 =?utf-8?B?eml5ZUhpczVidG50eEVMZ3pHL0ZFcXVsbnpXUzRUY2VWcDg3ejQ1V210TVZD?=
 =?utf-8?B?Y0psajlYRGdZM056ZFpURkFmL3A5ZzEyK1d3QjMrY0xFaE5ZVXVHa1RxTUh6?=
 =?utf-8?B?L0x2NWVDSEZNR1hqWDBuTno5QVBweU5lMDIzU1NTaG5VWTJEOWFpYmtOUnQ0?=
 =?utf-8?B?QVhCN2JGbkFjYzVCaXBKVFFBYU16QTdtOXN5RlQ4L25ZTHExOTFWZWdUNFpn?=
 =?utf-8?B?VUFDUXlvbDRXcmk5dUNtSWl0NEZPcGkwaWF0OFI3c0xrODg3ZlJGUT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8573b5-67fb-4eca-fbc1-08da449ba279
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 13:27:26.4744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YKEHezrHrcKfDb/ruiKoUb0LrCtoTPpndRfWP6wk0J85nw4tSBVnxER1I+nKOWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5634
Cc: alsa-devel@alsa-project.org
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

2022-06-02 at 15:10, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the tfa9879 driver to use more modern terminology for clocking.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
