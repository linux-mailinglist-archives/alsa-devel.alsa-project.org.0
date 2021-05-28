Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03A394237
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 13:55:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF56E16DB;
	Fri, 28 May 2021 13:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF56E16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622202907;
	bh=IYVKzkgHWRvXu6V2i4cZOA/FY/B8NioPudqMQXy8kgE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dnVe1mf0EXYGSSbFZ6i+SIjDyQZd1ZehDVzo8ST6mz4ON8ed6IEkyih3F48Z3fXko
	 5Cs6Ld3CJW9ZOyagoZg/OzuC9UuCIRlyqWLFUP1vYy+CIvZDeD5YqaCH0EwwJGIB/c
	 TJKDc/r5cOWrm9s80Z/vL1/hCbLWGL6gn2dI5RJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49C4BF8013A;
	Fri, 28 May 2021 13:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45DF0F804AC; Fri, 28 May 2021 13:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 517E4F804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 13:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 517E4F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="YektN80m"
ARC-Seal: i=1; a=rsa-sha256; t=1622202805; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=gLK1sqRVT54+Em6fvohkS9IOTIxat8KOMk/Y3cUXra73MJsWaXNZIQS6TY/Vn6IqvS
 PoU5ZIMIna1s+gP1DMzUxmg5YQRFYmuu81+1oAi21xKn1dXwUqxD+yZgx7VowHVrY17m
 /ZWPjvBpbCw+Q2AiCp2670idQPVsdTFau7Mz5LoscRe25uZNQmhDUT+mN9Si4RwRE6ib
 0EiADeHJhnlMARtmQlxR/R1OFANxA1Hu8/PmWprZjIFfcNWXfedu55KKUv4NCYyQK/9k
 YJZb2KwX5cpAISfTs8iWF9yRgNo1gp3uyF/39+VTZqx6vsat+uZw69gZpwVjbzMNYvFv
 F9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202805;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=U1J+eDASjru0W7XiJIJhBpUW+RsxMxrwxTA8pmA7rYw=;
 b=Es/ns2n/8Vq8xF4tdSbd+yAKHYZSqxuU0WQzQsHM6IgHoFs7jzEwgIl8prFvTxvjEI
 JNRZhbj2r0YK2DklbDQ4kmCbQaWAJO+w3snNphaTi5flc9jPr/zB/qGjM0FIAS/8D9QF
 kDXubLsvzLRkUMZYewvKStsBE07nNZfmagCBbvr8arIkOfRUg6K9BISfTZwBxKCOB5tM
 czzo0lHEZmFQRRl00CnWYm1ic5dQeoTej6Gf9ucMR43Q/Bjjr5r6R412Zw2PnuacIZLi
 brhULSd+ohcyX8GkMS/wBOEY7mFDPNYD0OR4vDEdR1iW9E4QxESujBd6cZiW0ze/7XT3
 YseA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202805;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=U1J+eDASjru0W7XiJIJhBpUW+RsxMxrwxTA8pmA7rYw=;
 b=YektN80mPcjSULZZ0y4m5ODba/OcJ9/xcvMvSd66SnGgbDQHNgU9/+H3r9SElgTL4c
 qv/zfxLYiK1rveEN/qSRi1OKmH6X7XphPYion5VoQMwxeZWQeqcRMQhCVAnQOZDXmvXH
 eC5VutfuJbdduR74yKT8xvp5t1i9ztC8dnv0elc20LoXlvmN+RO5ul8nV5Fzkq+SRdix
 tF6FArJuJYohU7/p6MjShErlKvVm8oZqTeOCbv0GlVldPccgnfQD1Nv/r7kWCdKstvFB
 rrLYKWdmCqk91REqSx9JsHHULrpmK33T6fwTsTi0LEI94HI7EWLZ6i1/LXp5tNBT7tS7
 dk7Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczFY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.26.3 DYNA|AUTH)
 with ESMTPSA id U0b2c9x4SBrP65d
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 May 2021 13:53:25 +0200 (CEST)
Date: Fri, 28 May 2021 13:53:23 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v1 2/4] ASoC: codecs: tfa989x: Add support for tfa9897
Message-ID: <YLDZs32dM/KrVDAx@gerhold.net>
References: <20210528105101.508254-1-vincent.knecht@mailoo.org>
 <20210528105101.508254-2-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528105101.508254-2-vincent.knecht@mailoo.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
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

On Fri, May 28, 2021 at 12:50:59PM +0200, Vincent Knecht wrote:
> Add specific init function to poke needed registers & values for this IC
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  sound/soc/codecs/tfa989x.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
> index 408e26eee108..6d94865c534b 100644
> --- a/sound/soc/codecs/tfa989x.c
> +++ b/sound/soc/codecs/tfa989x.c
> @@ -44,6 +44,7 @@
>  #define TFA989X_CURRENTSENSE4		0x49
>  
>  #define TFA9895_REVISION		0x12
> +#define TFA9897_REVISION		0x97
>  
>  struct tfa989x_rev {
>  	unsigned int rev;
> @@ -175,6 +176,29 @@ static const struct tfa989x_rev tfa9895_rev = {
>  	.init	= tfa9895_init,
>  };
>  
> +static int tfa9897_init(struct regmap *regmap)
> +{
> +	int ret;
> +
> +	/* Reduce slewrate by clearing iddqtestbst to avoid booster damage */
> +	ret = regmap_write(regmap, TFA989X_CURRENTSENSE3, 0x0300);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable clipping */
> +	ret = regmap_clear_bits(regmap, TFA989X_CURRENTSENSE4, 0x1);
> +	if (ret)
> +		return ret;
> +
> +	/* Set required TDM configuration */
> +	return regmap_write(regmap, 0x14, 0x0);

For reference:

Sadly we didn't manage to figure out what exactly this register does.
There are several TDM related registers but they are not really
documented. Devices usually have fixed register values specified in some
configuration file, but it's not clear how to set these in a generic way
(e.g. based on dai->set_tdm_slot(), dai->set_tdm_slot() etc).

On the device where we tested TFA9897 it's just used with standard I2S
so we didn't need any special TDM configuration(?). I suppose we can
leave this open for future improvements if someone needs something
different here.

So:
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan

> +}
> +
> +static const struct tfa989x_rev tfa9897_rev = {
> +	.rev	= TFA9897_REVISION,
> +	.init	= tfa9897_init,
> +};
> +
>  /*
>   * Note: At the moment this driver bypasses the "CoolFlux DSP" built into the
>   * TFA989X amplifiers. Unfortunately, there seems to be absolutely
> @@ -280,6 +304,7 @@ static int tfa989x_i2c_probe(struct i2c_client *i2c)
>  
>  static const struct of_device_id tfa989x_of_match[] = {
>  	{ .compatible = "nxp,tfa9895", .data = &tfa9895_rev },
> +	{ .compatible = "nxp,tfa9897", .data = &tfa9897_rev },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, tfa989x_of_match);
> -- 
> 2.31.1
> 
> 
> 
