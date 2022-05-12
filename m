Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE6524F74
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B4F1A9A;
	Thu, 12 May 2022 16:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B4F1A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364490;
	bh=692ZNEOZofdYhRnQVJWWt4MBnIgvl8ICc55a/0sDmJw=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bEpCiSlfgLiLExOm5uN26qa0ag8FHquG22Y4Hwe9RlLFJ0pVJ1RDcIsE29051zlU9
	 IN2VFgjs/bsn3HbNcIE823mvFUiPdFVny13GGIl/qu4z02UmVGciWYy7uoXrH5vtls
	 IvtYMxYtZLMh7UYrkEwFk9NrVlgsxTw8dEVxh9dU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D9E4F80154;
	Thu, 12 May 2022 16:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1330BF80245; Thu, 12 May 2022 16:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=FORGED_MUA_MOZILLA,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,KHOP_HELO_FCRDNS,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20826.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::826])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6ABF800BB
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 16:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6ABF800BB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvMKMfLPJp2fksjlL7xPapli+UJysge3iMj8LOKhUnUvgF7fudwinK/OOIamqyPPonHV/NRThyIFl8gGU7dIAGQqkkAISHGVpURWbhsZwvDBtizMpabLBh0KOqpF0CEa3cPcSBadIcl8SY/9DxpWpVgfDAXIXPVZTNUj4+6/aOfBeQDWRU5/2wmhOJ16xAT5fRfdPjr3cIcS7DBFktrQo/2Q+CI/qMkCFUpgTpw+UkKzYoRxDoMgNhGU0B+nij+M0QWl99xXph2YE03ZRP0JTRRvboypMAXYvD2ktoa3qW7DsN5xgNcJtaX49X6GJejQ4qugfX6cDwhV2iF6VE1h7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB9pqSVZEFrMVGYBfu4hz/fH+4AbZ617QLJOsujWzKg=;
 b=Kl55cu4Bd5qm82PXIJPoO+PnCkGG8uC26I0qzuApG6X78rI1iaZWRMMhxs18H1GLI6nyZr76NHNtM44IilkRGVV6oqfc6Rpjf0UBs3wP9GPwSCq45S0STlzR+O8rsF3TLmd1+/t6LHLSHyEBV2zCZScQvCPaGlNHVKdRrN2l+DT4/svEJ6R3G7VAFXzHh+CJ8ttXP2I4LbPGKusj5hvukUpOKGTMa+mLhLRhrNmBrcEC2kCuus4mIcpPeseXmCfeVPmYtRbA+VmoheY9CGbFZ5Eh3Vc3DokIthNcMOGDVovRj4+GJ9TyEe/CyvkouuLVhO291Yc69afhj+YVKcyrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CY4PR04MB0567.namprd04.prod.outlook.com (2603:10b6:903:b1::20)
 by BYAPR04MB5367.namprd04.prod.outlook.com (2603:10b6:a03:cd::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 14:06:53 +0000
Received: from CY4PR04MB0567.namprd04.prod.outlook.com
 ([fe80::8e:6e22:f98c:29d5]) by CY4PR04MB0567.namprd04.prod.outlook.com
 ([fe80::8e:6e22:f98c:29d5%5]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 14:06:53 +0000
Subject: Re: [PATCH] ASoC: samsung: Fix refcount leak in aries_audio_probe
To: Miaoqian Lin <linmq006@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220512043828.496-1-linmq006@gmail.com>
From: Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <CY4PR04MB056741C407765D41970C8462CBCB9@CY4PR04MB0567.namprd04.prod.outlook.com>
Date: Thu, 12 May 2022 07:06:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220512043828.496-1-linmq006@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [JxHBLLJaBgVbupQ/OlKm4ESSMrsNiMfp1MoFxagRiQGScHV58ja7n8c7vFXmNunC]
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To CY4PR04MB0567.namprd04.prod.outlook.com
 (2603:10b6:903:b1::20)
X-Microsoft-Original-Message-ID: <fc28981e-e0a9-92b7-e169-575b54825868@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d6b2806-70f9-4483-4ce9-08da3420aa38
X-MS-TrafficTypeDiagnostic: BYAPR04MB5367:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2b+V6HScMhd4tAfh12Evw3PpeUs36dkZgNkLn2/KdT+7eJtNTjwCeNwSrDPYmcwxtjs+JGC0q9GC4X/aq0BJ5G4PBnpefgRrJcMe0Jvtb/fCYjAgzPNUXv+XFSmbPLBbunMW1sBl/sIYs5fU6S6ThnDYo0+BCeDNtQGv5f2YbBhXfRoQBipgAbZ2go/WI/uHL21OcD4+U42KW0JB2/2CbkZpQ8Ylop/iEW0trjgWC4kDUN/vs2fo4jHhTNI0Oc2p0YZEo1EyIzQr10wj8erKGth9gRugsmEczsRPyb9B8k+MnXTMwNVfB/uUNhGOF1ua+xojZ+j2T3cX6JceDQuR52wp8QXwe3p/prdToeN2f9pwpPynQL8lnekER/T3SW0p1/VjGbKX0BZctAIi5Mjv8O6GZxvnQNnD47s9K/a1iqhh3L1nhhmJFVEUcYJC69Gz9E/5u36FF4K3cZNWImaq5RfHZG1J1jlCDlMbTcyJKtk2DTq3lLNaraju3g06iAlUx8PIsx89dAk+7L+x1ABFBaCx9DcwwsAbXKBmt2YngMN63Enx8Hq2VeRzVpdGwPukGVymNTxBNMKZnMLrr5TdQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGw4WVdLbE8wZkh5OWkyRHcvd2ZFUndTT1djVTl5OHh5TkRzQm5hbkdzTThS?=
 =?utf-8?B?TS8xRXY0WXBia3A5eFc1TGJZVVBlVFJpYXM2V3NXejF2L1VKMzd1K2l3UnFH?=
 =?utf-8?B?cU9PZWg5UGFTMUR5cnl2OFBYY0NkZ05uTWhKaWNrSGl5QTAyck56RmRKZG5t?=
 =?utf-8?B?K1gwTGFyTDdpZGltSVMrT3NGUFpFbk9iQnVzYlNrMFVBR2lMT3JiMkVwUExK?=
 =?utf-8?B?R2EwVmsvTERPcHplZjUrMS9BNkkyS1lpRFloRVZMM1hTWm8zc1NuSHJWY0Q0?=
 =?utf-8?B?SmhHQ0l3SkJsbGgrM3Z5VG5CekZHWEdoM3dqanV0Mng3TTQwalFHejRvWVBa?=
 =?utf-8?B?RlJ4YUhaakU1Mm1HWnNtdTNuemNDa1NkZVJFVGdXRWRZV2dWSFJKaG96QVJx?=
 =?utf-8?B?RTF1enVvU013aEhBZXJzVEFkTU1BbDJsVVJNaVJHb0UyLzVxbDdhNHRHQnE4?=
 =?utf-8?B?eStva3plS0ZiaU9ZandmN1kvMlVMWVdlemVybUplQUlIZzF6UCtpZG1relBz?=
 =?utf-8?B?K1RqOUhkdlhvOFpkMm5pVWo4d1NMb2REemUvUkRXV1d4b0x4Q3VuOVplOGRk?=
 =?utf-8?B?K3hNRjBlNlpXaTNsRWNrWnREeDQxTHlubEpVd01lRjNsSCtudG1Vc0pkTll2?=
 =?utf-8?B?SnY5QkpjQjdLa1AxRG1aSFp4T2xuRWZZenY1dkhMWDE2QUNhWHRHcGU3azF6?=
 =?utf-8?B?YjFKYTVVa0tWS3VOdVNUVjd5amE3YStLczROVUh6MTU0SHpleDI3bVhOUHpn?=
 =?utf-8?B?TDQzOTJKczdJdjFCdjlXYXY5cGpFZmFkczhLNmFtQ1F0aFQ5dE5SMUo3cDRM?=
 =?utf-8?B?c2FpUUVrMGQ4dlNPRG5XR2drNUEyZ2Fmb2xyQmR3c2c0OUpFa2VXRW1sTWxM?=
 =?utf-8?B?VzdGOWpJaTV1LzI2TjdyY1BCMkpiZkpRUlU0eG0vbnZoR1RFNlVSWlNIWDBz?=
 =?utf-8?B?cG9BckZMaE9WcFVwNVE3ejFaTldXUHpxbnNZeXlFaG1KU3RFb1RZbjIwaWVX?=
 =?utf-8?B?TURjZCtwUzRWZWgycGRtNUdzOVNRYm5qUDdzeTNXOFpRbUo5WjlSWXEvcll0?=
 =?utf-8?B?RFh6Nm5UcUdlbHRQNW9oU3FnQ09EaGVVR05EOFpNcVgyODdJL05EL2VjVmpv?=
 =?utf-8?B?bzZ6UWtQczV4QlRESjFRTGcwUmtqT01kWnZNWTlJdjZaYjhFbXN5bUhzdERV?=
 =?utf-8?B?VXIyTjJIeC9JN2FWSmV1SnFEME1sWCtiWVJCT3JLSXBqVnhGN2NZTGpJYmhk?=
 =?utf-8?B?NEkzQ1BOQnpKUEdqemFyMjBMbGRPQTNUeFJYa0l6Z2xOWmVFNDgzYmZhMHho?=
 =?utf-8?B?VXo2S0dTOHh5MytUVEQ3VWN0U0xIb1BONmg3dUxTRFU3MS8wNVpROHcxb29Y?=
 =?utf-8?B?OU1SUHE2NHk2T2hBYmtQeU9ISHUzaklnN05OZmtmY2FZVWRNWHZvZnQrQ3JS?=
 =?utf-8?B?ZnhWUkZzMXR5K2dvdFNKd2VQeDdBUnZRSUU0WXdSNmRjSGk2SmJVbmdZS2xw?=
 =?utf-8?B?WCtleEE0bmlaVzduL0hsdEZuaEdXTFhjVU9OQjRydHhmbzhqeTNnZGVpK3RW?=
 =?utf-8?B?cU1oNng1UWpJTGI3RHBlVmlhTzk3emlMMmZNUmw0L0oxdmdoSVloY1dKZ0tQ?=
 =?utf-8?B?TVJzcW5ERGdKdVM1YUhkcS83N04rZ0lrcEFsajQ3Qmxmamp1WUo3ODM4MjJD?=
 =?utf-8?B?Z0VtSktrSGh0bjBzWFpCUVNyVFRQVFd2Z0V5SmFzVDNSTktSemJLem5RVXJO?=
 =?utf-8?B?SDhDaTBtakM1REg5N3F3OTZ3WlNUWGw1dUM3aUJsVHZQcHlqRmFlSHJmRjht?=
 =?utf-8?B?b1ozSFIxN3FnY0MzYlVwdEwyVW1XaG43YjBKeDhMNnB3b0VpdjBxZ29iaGgw?=
 =?utf-8?B?YjN0NkU0RmZrZ3J2TmlobTRaanlVOFpicWlReUcreTZWZWpVSGZQYUQ4UE5R?=
 =?utf-8?B?MDdSdndDNkpacHJ0VkxGcjRvU2xJaGxiUittcVJnUjJqckFyWkQ5TkZLekhn?=
 =?utf-8?B?dWhqVjljU2lnPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-edb50.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6b2806-70f9-4483-4ce9-08da3420aa38
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0567.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 14:06:53.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5367
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

Acked-by: Jonathan Bakker <xc-racer2@live.ca>

Thanks!
Jonathan

On 2022-05-11 9:38 p.m., Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> If extcon_find_edev_by_node() fails, it doesn't call of_node_put()
> Calling of_node_put() after extcon_find_edev_by_node() to fix this.
> 
> Fixes: 7a3a7671fa6c ("ASoC: samsung: Add driver for Aries boards")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  sound/soc/samsung/aries_wm8994.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
> index 5265e546b124..83acbe57b248 100644
> --- a/sound/soc/samsung/aries_wm8994.c
> +++ b/sound/soc/samsung/aries_wm8994.c
> @@ -585,10 +585,10 @@ static int aries_audio_probe(struct platform_device *pdev)
>  
>  	extcon_np = of_parse_phandle(np, "extcon", 0);
>  	priv->usb_extcon = extcon_find_edev_by_node(extcon_np);
> +	of_node_put(extcon_np);
>  	if (IS_ERR(priv->usb_extcon))
>  		return dev_err_probe(dev, PTR_ERR(priv->usb_extcon),
>  				     "Failed to get extcon device");
> -	of_node_put(extcon_np);
>  
>  	priv->adc = devm_iio_channel_get(dev, "headset-detect");
>  	if (IS_ERR(priv->adc))
> 
