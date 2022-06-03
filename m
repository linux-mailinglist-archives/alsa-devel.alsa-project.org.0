Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B153D13F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 20:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3C4318A1;
	Fri,  3 Jun 2022 20:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3C4318A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654280508;
	bh=Z7aBF6JqnH07q8Fd8EqKFekV2qfsLjpdPsgZuGJNUYU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCqtnMTysFr0EZ+RCPcmCZp5wBxXPm//0Ekp//GHgjNcYuoBP/F0mpZIoBJN7hKUX
	 6lsTtoPYgJITvmswY+AKNtIYSIClW6xRorcnUbc6vGNo/9B/c8g3opmhWdZMWZfhbx
	 p7E1ENi/+F+NcoX38kmlTbj6SZCBHQaJYGrJhNkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A70F80124;
	Fri,  3 Jun 2022 20:20:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAB97F804CC; Fri,  3 Jun 2022 20:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CBD8F80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 20:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CBD8F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="p7RNxjyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654280429;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=jRzE700Iwk6JPnFC1XF3JnNELKmhJQ9Ut8G4hkkDJF0=;
 b=p7RNxjyiSayvHYPh3pHVP+T7P4Hcsn75gGJxiD5ywUMsVEPqBfsrMCiR1C47cvRHPG
 nCbifbauhHQMWv0vrZkk64YAzDa03TPeK2zI1an99Cd6KVmM/Cwh3yx+l5wlGoFPB+lz
 JbiBdHH/mpVYGdbK2X+pXmeZ7ppmt1PpMOwCSuLRj4L2foo2vDkQeuR4nBDvczVknpiH
 AYkEkOrGQ5yGk/JBTbx1GPRF89BaoAAqffAxeBBjPB1r3TGn9B/gVXvtqqy4P8X6gMPH
 4/lRQ2MNTugVRSf8sTtvJtdeAkOVKpSVSbKKHkQk+2s8mclCSZ+3hjx0ZdP0EAMuvw8b
 zUFw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.45.0 AUTH)
 with ESMTPSA id 9056edy53IKTwlV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 3 Jun 2022 20:20:29 +0200 (CEST)
Date: Fri, 3 Jun 2022 20:20:28 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Alexander Martinz <amartinz@shiftphones.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: tfa989x: Add support for tfa9890
Message-ID: <YppQ7BiqlBDMNsuc@gerhold.net>
References: <20220602164504.261361-1-amartinz@shiftphones.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602164504.261361-1-amartinz@shiftphones.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dylan Van Assche <me@dylanvanassche.be>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Caleb Connolly <caleb@connolly.tech>,
 Mark Brown <broonie@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
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

On Thu, Jun 02, 2022 at 06:45:03PM +0200, Alexander Martinz wrote:
> The initialization sequence is taken from the version provided
> by the supplier [1].
> 
> This allows speakers using the TFA9890 amplifier to work, which are
> used by various mobile phones such as the SHIFT6mq.
> 
> [1]: https://source.codeaurora.org/external/mas/tfa98xx/tree/src/tfa_init.c?id=d2cd12931fbc48df988b62931fb9960d4e9dc05d#n1827
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> ---
>  sound/soc/codecs/tfa989x.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
> index dc86852752c5..8ab2656de750 100644
> --- a/sound/soc/codecs/tfa989x.c
> +++ b/sound/soc/codecs/tfa989x.c
...
> @@ -188,6 +190,33 @@ static struct snd_soc_dai_driver tfa989x_dai = {
>  	.ops = &tfa989x_dai_ops,
>  };
>  
> +static int tfa9890_init(struct regmap *regmap)
> +{
> +	int ret;
> +
> +	/* unhide keys to allow updating them */

Nitpick: I think the magic number is the "key" to hide/unhide certain
*registers*. This comment implies that you are hiding *keys*.

Maybe just write something like

	/* temporarily allow access to hidden registers */
	...
	/* hide registers again */

With that fixed, feel free to add my

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan

> +	ret = regmap_write(regmap, TFA989X_HIDE_UNHIDE_KEY, 0x5a6b);
> +	if (ret)
> +		return ret;
> +
> +	/* update PLL registers */
> +	ret = regmap_set_bits(regmap, 0x59, 0x3);
> +	if (ret)
> +		return ret;
> +
> +	/* hide keys again */
> +	ret = regmap_write(regmap, TFA989X_HIDE_UNHIDE_KEY, 0x0000);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(regmap, TFA989X_CURRENTSENSE2, 0x7BE1);
> +}
> +
> +static const struct tfa989x_rev tfa9890_rev = {
> +	.rev	= TFA9890_REVISION,
> +	.init	= tfa9890_init,
> +};
> +
k
