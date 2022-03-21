Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6309F4E2B91
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 16:14:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C5571747;
	Mon, 21 Mar 2022 16:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C5571747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647875642;
	bh=ipkgJQjf5K2R+S1QsRulpTCFGjeQCivNGHqHR4lHm5g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pCuTqiFRiP95a7dWmDVq0snxsMGLJ2hhF2w5tZA4RDChRA3Om5FnCpghW2O0KUICE
	 PrHRRZufT9yUWo7O1dDy8QucHqm2spmE/hhpfkKnJPh3l7PYjbsAwz4FXBm9YU1WCB
	 rmvgM0484XFfUxHcey7MACKHNhBINb667SqSrucU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 229EBF80516;
	Mon, 21 Mar 2022 16:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B0A4F80515; Mon, 21 Mar 2022 16:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E1BF804AE
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 16:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E1BF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NlAnS+O1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 543AFB8170A;
 Mon, 21 Mar 2022 15:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8905C340E8;
 Mon, 21 Mar 2022 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647875577;
 bh=ipkgJQjf5K2R+S1QsRulpTCFGjeQCivNGHqHR4lHm5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NlAnS+O1h0ZwjtCK+NlIhwFXGU5XDIfc6JGdZ3urIL2RJgtikmxARsu5T/xn2sG44
 +sMa8uQKAJl5lDfb0Gtk130vRqiUiPP4k7Ew+S0s4pW6avdeWP4xku+nyMuhTN2Rmp
 iPSaHZ/oH4lRowbTla4PbRXLvuADQ/+xfZAP3HMpj7TQNLOIM2sr1tYVt+2Vt7cOKO
 fY2tr+LI2U4d3OjryhCDpf+ExYtyfDMrOm2C/W/LtZRXW0qUNsEhHhU0rpggDyVl5b
 yPNWxbwu/5SL1vBKAPkQ5TKZrNkyEeob1ohw/VLGf7GFhUoKlpm7JKIIKcT3ys79Cl
 yMdFEDZAz58Qw==
Date: Mon, 21 Mar 2022 23:12:52 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 5/6] ASoC: mediatek: mt8195: add machine support for
 max98390 and rt5682
Message-ID: <YjiV9DfLC7T1uweb@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-6-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321072312.14972-6-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Mon, Mar 21, 2022 at 03:23:11PM +0800, Trevor Wu wrote:
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
[...]
>  #define RT1011_SPEAKER_AMP_PRESENT		BIT(0)
>  #define RT1019_SPEAKER_AMP_PRESENT		BIT(1)
> +#define MAX98390_SPEAKER_AMP_PRESENT		BIT(2)
> +
> +#define MAX98390_CODEC_DAI	"max98390-aif1"
> +#define MAX98390_DEV0_NAME	"max98390.2-0038" /* right */
> +#define MAX98390_DEV1_NAME	"max98390.2-0039" /* left */
>  
>  #define RT1011_CODEC_DAI	"rt1011-aif"
>  #define RT1011_DEV0_NAME	"rt1011.2-0038"

The quirk bit order: RT1011, RT1019, and MAX98390.  To be neat, move
MAX98390_CODEC_DAI, MAX98390_DEV0_NAME, and MAX98390_DEV1_NAME after
RT1019_DEV0_NAME to maintain the order.

> +static int mt8195_max98390_init(struct snd_soc_pcm_runtime *rtd)
[...]
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_max98390_routes,
> +				      ARRAY_SIZE(mt8195_max98390_routes));
> +
> +	if (ret)

Remove the extra blank line.
