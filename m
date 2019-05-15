Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D48261F61D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 16:00:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464DF1688;
	Wed, 15 May 2019 15:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464DF1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557928811;
	bh=KOIVgU9r08SoOziloEyNVAQXLGaGlOw5tOkzcHfNB/c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbQsSSg/vdoWUubnj61MArBLSYH3ChTGfl2lD7LI5RMFa4zEVHJvYJzxLSTqCIFMD
	 0fCifkrZEF87yCeJyGwRna+bc22eo2WmNGrgwUd72DHRLyuyyuL2I1OPJvDTFdQjwd
	 eU5SL89WGqp1Ytt0ckvLpbE+JMBrqy5uAONWksmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABABF89684;
	Wed, 15 May 2019 15:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5894EF8968A; Wed, 15 May 2019 15:58:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C31E5F8078F
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 15:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C31E5F8078F
Received: from localhost (unknown [80.215.224.99])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C3A16100010;
 Wed, 15 May 2019 13:58:14 +0000 (UTC)
Date: Wed, 15 May 2019 15:58:13 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Georgii Staroselskii <georgii.staroselskii@emlid.com>
Message-ID: <20190515135813.5y72f2h526yjkncy@flea>
References: <1557925120-31498-1-git-send-email-georgii.staroselskii@emlid.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557925120-31498-1-git-send-email-georgii.staroselskii@emlid.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, dannym@scratchpost.org, tiwai@suse.com,
 lgirdwood@gmail.com, wens@csie.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: sun4i-codec: fix first delay on
	Speaker
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, May 15, 2019 at 03:58:40PM +0300, Georgii Staroselskii wrote:
> This commit fixes the same issue as bf14da7 but for another codepath.
> The issue can be triggered by having Speaker in codec audio routing.

Mentionning what "the issue" is in the commit log would be great.

> &codec {
>         allwinner,pa-gpios = <&r_pio 0 11 GPIO_ACTIVE_HIGH>; /* PL11 */
>         allwinner,audio-routing =
>                 "Speaker", "LINEOUT";
>
>         status = "okay";
> }
>
> Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 15d08e3..e0099519 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1329,6 +1329,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
>  	gpiod_set_value_cansleep(scodec->gpio_pa,
>  				 !!SND_SOC_DAPM_EVENT_ON(event));
>
> +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> +		/*
> +		 * Need a delay to have the amplifier up. 700ms seems the best
> +		 * compromise between the time to let the amplifier up and the
> +		 * time not to feel this delay while playing a sound.
> +		 */
> +		msleep(700);
> +	}
> +

Since this is an external amplifier, I guess they would have different
warm-up time depending on the exact part being used?

If so, we should use a property and set it on a per-board basis.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
