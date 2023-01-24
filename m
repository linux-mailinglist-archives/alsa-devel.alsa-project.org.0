Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33D679D34
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 16:17:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FD2E11;
	Tue, 24 Jan 2023 16:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FD2E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674573467;
	bh=zSQBF/DHLejvVefairnEXcIxlcG5Mw950jKhe2mafis=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cc+9o7Rp1c5hoaTFi2NpMQE3/mzfT+6N0L/eUsbg6E/IT2RuH36B6BUXEEAziLD1A
	 aOff649yjGoeVlT3ezko7/f9zapoSiF6AZlbgdjKZc4nthhm6eczJfZ4vXKxr6g+GJ
	 3GT/Mxdisee6iWBtRSNXYZwcNRM4WS1ZdDxyqyCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE7A0F80163;
	Tue, 24 Jan 2023 16:16:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BF6AF8027D; Tue, 24 Jan 2023 16:16:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2027.outbound.protection.outlook.com [40.92.99.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C671F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 16:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C671F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=kSVt6Nqi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1SAOWUnYdAdMfZmRQ44f+iz3UPb/aJqUKfYOEtYGOnL2XdDeh/B9x2EgsNyvejY0bkn0i/um8mC6T+QRY0BKPPY01wZBeDe0lzK0G+FfqV6N0NKbE9SjF2ALMgy1P193ZOALU2RUcrAAdJ6R7IMVn94cfXPc89qm0Arz8L3QHGOwu/yZkNHBKk+gr8+UvHYmmc5LJoKzsmn6IPP5tOGtmq7V+ZCAtyp6DJxlJdbyKBoLUtbEej94z80BcsXqy2+v5/Re81gTY5N/eX/ebT3tRNjaIKnfsdlRPMSBybB0bwAG6yOIkrF4JsQY3CUYVO/EWp3IzBnLnJ0DYEqx4n37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xI0I7bJ65AOFkS7XMoiYyC7XdpDTKgH2WAkgbs6K4JM=;
 b=JLBWg58rDWvQzEvUlUWnBbKvdgfFY2LKoM7/Ml4w1PJoUtS7RhlG5JTjw7jNDLXUSam4WNpQe6yYBoaXNh3JLaoe/EB8foQMS+tM2qQdqpPCGUyc3GMBDTPM6nS1daaN55v0pfv9Ru7LmREW+HIArvsX3EvOn5s3kLyl+A0kdgYknPhPx2oXZ6vj7ZOa39HgNCXVpTKGA/yN7NXE+yKgXY1I8sm3BcmEHN07Y1wOYmRNZPv1YHR4VRWIa1gswiglILrGUpHuxuokL2ZxIRtVJWKipPqJX13tUm4XPskN71EFxEVnfDJwWeVN+NZjm2WgCJGVk7aPvx3V46/PdsAsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xI0I7bJ65AOFkS7XMoiYyC7XdpDTKgH2WAkgbs6K4JM=;
 b=kSVt6NqiT6aRuz64CewMZgmshB5PPmYJihZtP/KdUs9Q8TCu2e88AidTEFbhZdV1FioXNBk2Z9LSUZ0DU3fg69IWV80HgnRv7ScRz+7XNewkirBqGazjodAgQkGpHccbQqSfdLhZ6lWjTFTQYgL7TwHkVX7jnhF9PT8oJ6CuTuJG66KOw1nEDKsNzO7JURVolMi6QJJCAirhw0xBVS2K/H5s70aAMqcG6VU58syJsz3ORU3pGN1zNjRvumtFfOyypw/9sMgQTvqnW6JL9kyzmUVyyTzfEaHRopkYajCDlPiOH4gU28FNGfDzdSgE0b5HwXn+WMzt9KjsIfZrKBHfdg==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by OSZP286MB2288.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:18f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 15:16:32 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:16:32 +0000
Date: Tue, 24 Jan 2023 23:16:29 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: ac97: make remove callback of ac97 driver void
 returned
Message-ID: <TYCP286MB2323D4937533FE89ECFB615BCAC99@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2323A5AB1B2578EF4FA15DA7CAFB9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323A5AB1B2578EF4FA15DA7CAFB9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [Sri+k/tG0WtZzq5x1cFnlWiH5HPKVIrG]
X-ClientProxiedBy: TYAPR01CA0225.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::21) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20230124151629.GA2227@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|OSZP286MB2288:EE_
X-MS-Office365-Filtering-Correlation-Id: dae22fc4-f956-4d2f-fa4a-08dafe1df966
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwwWcWq1uVLt4vQdfdvjoQ4pYC+uz6eH2oQzFKUflhDych+9gxVEWGOEBKFDhj9CcETCALRm3wGIhPWO38+mVTnI7IRkkfTgupU3H4e6PHUe49TWCZq8kurDU6TsulFTsWG9dyhxiOHLhKUDNi2mccIxx8MMGsyowZmWVdOp9i2m8F5S3HXRDa/UHQR8fTwp0aFeQu7Kp/ger1eWPEDmEBf4VhFVlYpZev00wedOKt/q3aPwj503apKUI1Vdhgm7zVSA9+VnmNKzr6R2Z5D+mzxpW0bfHihaLDcjqvMGOMLdM7M8uxG6Duqn3voUvHrOAfM8ATqICDbvRN5zVHC1PaZ6vebhKhO/zOXuY4Y1HgAOOZJZAeZ3g4avfIBsO4GOVRyCkwwqVhHlhgybd0Qn4IpS8TgwVB8FPNp12n/SmBj1ztBxOfPiThfPwncA52rVCiC2CRaBxhjC3M9xPT0M5sRE3xjsjpmPk3m23WdOFyUvhMRfmz/LjPPk/n8X/DnS4/cdDlFxLDIvytOUzEi/Re2IG2EMTRu1nfBhp1AilAqcD1UIX/1w/9+/K8MdoihD70aZTvzLb9L5X9RRJiYV3mpa/iHHnLR7QjeldpibgH/qdqQACiDBxgNiHieslqHczEK1Q/bhQa8uMZHhI9KU8g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zuc3pg7oVjRTwwzL96SddQcRABeaN9evfpX+Sl9KuPU/tFF4cY9pWCUWGw0D?=
 =?us-ascii?Q?VgCJnqSx/3AI9HX/WY2Z73icqxk42JmsJWFEDcx38b0maAEWNDzpGSDp/6XS?=
 =?us-ascii?Q?fX51gdsaMf/B9ZnTWPi+pAxUoCN1e+DN8KGmAQSIjqjEytdwBGmXNNynmVor?=
 =?us-ascii?Q?74Kigs3K8bNO0PmuitebQwtrUVGBopk2OU68Jq0JSsYaG/adCrwCray+SeJy?=
 =?us-ascii?Q?kDqhpp3xfDMfsyrqnOEydi0m1/BvCKoec/eEo6qAhr9NCS1aOqX6gSXbVBxW?=
 =?us-ascii?Q?/OWOHyAyPsN9B1oUaMx33NHF76JS89uMAKfc8WrTkTr4qicGpy0P/Yx4EKSM?=
 =?us-ascii?Q?uTtmQxyddS/s/cRO+vDzUOmBSlx9vpSX0jYCfBxbvSVEBDLKQNPdPTzalCMg?=
 =?us-ascii?Q?oy+/qruldnDGRrtokPxs6ZuhylVgFOtq+NNEwK3L58MZceg0DBcDOIGxxGGc?=
 =?us-ascii?Q?+08gmKlhav0dV1HOTCRF96724azJtKVQpLS6WJYCs/qD0d1jnSnDIE3cKwcL?=
 =?us-ascii?Q?US2c74CgV8Mr433k+5mr0fFtj182RoBAq1DMue10JLAMd3AKVFifIyiPzaqi?=
 =?us-ascii?Q?QFASllQXLALUFtVqKQ5MuJqF8CaiyL9smZpjn1FXp/Pak001iYIHMgYAi2js?=
 =?us-ascii?Q?rEOY0xFWCPJmJsgN2Hz1i3YIiDTRXyQGu+jGDPxt95BNTwF8jZQ1XfcbzzOB?=
 =?us-ascii?Q?GwH6TyqVir8z4Ju+x/ThCSPdjYA59EvmgJnpNPlLu7GwfpkRn+cjEI0t93RY?=
 =?us-ascii?Q?dvAY5uL+mBY/8/Zey7nzTmRkspP/y1OVdIf7xkdJiqPY1M2nlFcsZ4QVLzx7?=
 =?us-ascii?Q?5B/wnfqR+Og5y7A6O/8LBDOkqabrYrv2dSkCwKC+JJdU5TFEN31gYG4FG5qx?=
 =?us-ascii?Q?2u1OYVj90wfq2K8WE9RtSRaDIw4EWxJO1lqSMgpaRmefdQuU44RCy2OIxOd1?=
 =?us-ascii?Q?433Hxwu2iYMPTGiS+abVft+QdpKt6GZd94wHVCKF7YfFK9PitvWJM+QVUrBU?=
 =?us-ascii?Q?a/VNdYLkiRVpjijGKaUMGuRIg9AwsnTl7PHarei/A9++u3Pmyj1RhAFDUppc?=
 =?us-ascii?Q?fISP3F9cmoLFHhk3RbNv3T+b2n4ZaBOLAgeTfot43dzCgWXESiyeat2URCEG?=
 =?us-ascii?Q?5aoHxG2Iw7o4bmSVJSZtO8PwCzgia73sD+0KWwrb8FG9yT/5HhWs1I1Pav4e?=
 =?us-ascii?Q?WAmYTXDojbOSJGLwWRDWYhE+LMp8Z4iBNruRvZd4dlK00l3cAt+wPekd0NzG?=
 =?us-ascii?Q?LJnRFauwdPdDGvduNhJo8AF8IDoJW7p0c1yXFvb14A=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae22fc4-f956-4d2f-fa4a-08dafe1df966
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:16:32.2346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2288
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 06, 2023 at 11:13:49PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return void")
> forces bus_type::remove be void-returned, it doesn't make much sense
> for any bus based driver implementing remove callbalk to return
> non-void to its caller.
> 
> As such, change the remove function for ac97 based drivers to return
> void.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>

Gentle ping...

> ---
> v1 -> v2
> - Update commit message.
> - Rebased to latest sound/for-next.
> 
> v1
> - https://lore.kernel.org/all/TYCP286MB2323207367F2D39D0D725828CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> ---
>  drivers/mfd/wm97xx-core.c  | 4 +---
>  include/sound/ac97/codec.h | 2 +-
>  sound/ac97/bus.c           | 5 ++---
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
> index 9a2331eb1bfa..663acbb1854c 100644
> --- a/drivers/mfd/wm97xx-core.c
> +++ b/drivers/mfd/wm97xx-core.c
> @@ -319,13 +319,11 @@ static int wm97xx_ac97_probe(struct ac97_codec_device *adev)
>  	return ret;
>  }
>  
> -static int wm97xx_ac97_remove(struct ac97_codec_device *adev)
> +static void wm97xx_ac97_remove(struct ac97_codec_device *adev)
>  {
>  	struct wm97xx_priv *wm97xx = ac97_get_drvdata(adev);
>  
>  	snd_ac97_compat_release(wm97xx->ac97);
> -
> -	return 0;
>  }
>  
>  static const struct ac97_id wm97xx_ac97_ids[] = {
> diff --git a/include/sound/ac97/codec.h b/include/sound/ac97/codec.h
> index 9792d25fa369..2fc641cb1982 100644
> --- a/include/sound/ac97/codec.h
> +++ b/include/sound/ac97/codec.h
> @@ -63,7 +63,7 @@ struct ac97_codec_device {
>  struct ac97_codec_driver {
>  	struct device_driver	driver;
>  	int			(*probe)(struct ac97_codec_device *);
> -	int			(*remove)(struct ac97_codec_device *);
> +	void			(*remove)(struct ac97_codec_device *dev);
>  	void			(*shutdown)(struct ac97_codec_device *);
>  	const struct ac97_id	*id_table;
>  };
> diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
> index 045330883a96..6067c04ce4c0 100644
> --- a/sound/ac97/bus.c
> +++ b/sound/ac97/bus.c
> @@ -524,10 +524,9 @@ static void ac97_bus_remove(struct device *dev)
>  	if (ret < 0)
>  		return;
>  
> -	ret = adrv->remove(adev);
> +	adrv->remove(adev);
>  	pm_runtime_put_noidle(dev);
> -	if (ret == 0)
> -		ac97_put_disable_clk(adev);
> +	ac97_put_disable_clk(adev);
>  
>  	pm_runtime_disable(dev);
>  }
> -- 
> 2.25.1
> 
