Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BE2A0819
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3C0D15E5;
	Fri, 30 Oct 2020 15:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3C0D15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604068756;
	bh=NJEk1fOi2baSXrwNdn5V13l1z+e2gDcusHLmraYKMgo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rhe6RU2oJvFJTtDdB21uJDF0Q7J0qJvJkKJDfHggT/xR0jB+CX7Usav3FL7JM2Mb3
	 k5+HFx8fVxf4dyVcZPis6kT9EotWiSAd2yaPEwqVBkJ8d3N4V0mjK/xLlJXv/6icwD
	 jNhvidB096o1ji5q4hsEMY6oS7Zj4cCBJTxYlX3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36566F80107;
	Fri, 30 Oct 2020 15:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F22D5F80212; Fri, 30 Oct 2020 15:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B9CF80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B9CF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NT7p7iVh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B069206E3;
 Fri, 30 Oct 2020 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604068656;
 bh=NJEk1fOi2baSXrwNdn5V13l1z+e2gDcusHLmraYKMgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NT7p7iVhiYQCc93ZdI9+xvsSoyTLlIaAUo01rL63ndPVHXIdVEBoSuuqny4XXI6Ir
 04ToYVHYrXRwa08USQWrcDrep1P9ACW8DE8CX3EfXf7FEJON/lZyK8hPKhNOwQHBtS
 gFANu6Q+ZvnMzq9MieFG5Mcf1yuhW3qO8jVGMF7g=
Date: Fri, 30 Oct 2020 14:37:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v3 3/9] ASoC: mediatek: mt8192: support i2s in platform
 driver
Message-ID: <20201030143729.GF4405@sirena.org.uk>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603526339-15005-4-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline
In-Reply-To: <1603526339-15005-4-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com,
 Bicycle.Tsai@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2020 at 03:58:53PM +0800, Jiaxin Yu wrote:

> +static const struct soc_enum mt8192_i2s_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8192_i2s_hd_str),
> +			    mt8192_i2s_hd_str),
> +};

Why is this declared as a single element array?  It just makes all the
usages look odd for no obvious gain.

> +static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
> +			    struct snd_kcontrol *kcontrol,
> +			    int event)

> +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> +		 __func__, w->name, event);

This should be dev_dbg() at most, _info() will be too noisy in the logs.
Same for a lot of functions, including the stream callbacks.

> +static int mtk_i2s_hd_en_event(struct snd_soc_dapm_widget *w,
> +			       struct snd_kcontrol *kcontrol,
> +			       int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +
> +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> +		 __func__, w->name, event);
> +
> +	return 0;
> +}

This should just be removed entirely, there's trace in the core if you
need logging in production systems - the tracepoints in particular are
good for just leaving on all the time without adding overhead.

> +	return (i2s_need_apll == cur_apll) ? 1 : 0;

Please write normal conditional statements to improve legiblity.

> +	if (rate == 44100)
> +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001B9000);
> +	else if (rate == 32000)
> +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x140000);
> +	else
> +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001E0000);

This would be better written as a switch statement.

> +	/* Calibration setting */
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON4, 0x00140000);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON9, 0x00036000);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON10, 0x0002FC00);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON6, 0x00007EF4);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON5, 0x00FF5986);

Are you sure this isn't system dependant?

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cJSgACgkQJNaLcl1U
h9DnGwf/Sz+4iEFnBKdf1ReJm/KrWBeuGXFTFFpFEUkbpz6hVY2oN3efMZmKihbx
SIG8+D3lwL24nhHvAO0EKiMWyoMbVLwdwglf2r94wOfAtkKcGvIGx7iNYJzZPohm
9zkngD3hK/ZhXjTMRpXzIrQ7yKFyTtC6kEtAsmmquSzIeWaY9ZanzmT1MJL/bG8B
EiH05GkWSRHPiJBtBDeeFs3r7oA2wJH7BZ1QIx56brGjtrNDQli+R+LxCAKt9ivj
PjeOeBuu1+g8HLqHG4z4amUG4j3GEnhsjw3JXwJqoLIO+Xo+judD9VmmE4ZfJnsc
L/jfSQ2e7b9D6e5N2jangPxVJuF9Fg==
=pCPx
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
