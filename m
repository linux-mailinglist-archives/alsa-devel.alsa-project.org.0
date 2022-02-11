Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996334B290A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 16:25:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4584E1A2B;
	Fri, 11 Feb 2022 16:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4584E1A2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644593138;
	bh=XDskYT+gPzjRfk5oDbdrltedXVUeMzqmkjFFDGb6NLg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B8ir8vmQG9uL3r0lvoomhSH5/QHe1Q8FULvFMURABWlmDeX63saRGGnznhrZd9AeS
	 oF43mOZDVvvCGANinmQwQuaQ7Xy42vxfsFgjQlePTz6v8C/z9gNyX0oGih1nd+IOV2
	 Elh13G2bKj6EuY+cts8rDkep8BuTxq4h4Rys8oiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CED9F80425;
	Fri, 11 Feb 2022 16:24:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96ADBF80311; Fri, 11 Feb 2022 16:24:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25897F80125
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 16:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25897F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BvpT7Oqv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83CF661FCB;
 Fri, 11 Feb 2022 15:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D89C340E9;
 Fri, 11 Feb 2022 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644593069;
 bh=XDskYT+gPzjRfk5oDbdrltedXVUeMzqmkjFFDGb6NLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BvpT7Oqvcfj4W8XiGWUycZmHiE3+Etza3fUd5xp8iddyoLealvqndsADzP2UgqpxZ
 gXh2j2xq76OojNzT7LTqG+HJDWzT7czRxj/id6794sYd6ipF26w03Zvgz8cneDMpGf
 9D2NV2IqSLW75FxIQQ4JAsazmCe5Lf80UZVOcMuDPfWoJQMUB+9ebkeyXT28ez2uPh
 zcAM7L1dsH/QiSktz4EXbvfPF27xiI6bG72oKHQsrq10o695oU7PlFeNTBWb7NF2lb
 yKEeRP8Y2nD1WJCYlf+J9H8pS+MGs+PGZxo9RsGaN6PSuuJ9bMigy/7usBecHoXVyd
 mD87gCcsvogcw==
Date: Fri, 11 Feb 2022 15:24:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 09/15] ASoC: mediatek: mt8186: support tdm in platform
 driver
Message-ID: <YgZ/pzrJqvcAuzmE@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-10-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N3h3NzMMytsYzN3d"
Content-Disposition: inline
In-Reply-To: <20220211103818.8266-10-jiaxin.yu@mediatek.com>
X-Cookie: do {
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
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


--N3h3NzMMytsYzN3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:12PM +0800, Jiaxin Yu wrote:

Again, mostly looks good just fairly small and easily fixable issues:

> +static int mtk_tdm_hd_en_event(struct snd_soc_dapm_widget *w,
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

This does nothing, you can just remove it.

> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> +		break;
> +	case SND_SOC_DAIFMT_NB_IF:
> +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> +		tdm_priv->lck_invert = TDM_LCK_INV;
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		tdm_priv->bck_invert = TDM_BCK_INV;
> +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> +		break;
> +	case SND_SOC_DAIFMT_IB_IF:
> +	default:
> +		tdm_priv->bck_invert = TDM_BCK_INV;
> +		tdm_priv->lck_invert = TDM_LCK_INV;

You should return an error in the default case rather than just picking
one of the behaviours to help spot any configuration errors.

> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		tdm_priv->slave_mode = false;
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		tdm_priv->slave_mode = true;

We're trying to move away from these defines and the master/slave
terminology to talk about clock providers instead - the new defines are
_PROVIDER_MASK, _DAIFMT_CBP_CFP and _DAIFMT_CBC_CFC.

--N3h3NzMMytsYzN3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGf6YACgkQJNaLcl1U
h9DaCQf/cvTLimeQ43iRd7ilDTcJcq6Hgfgbl+cTNCLiaWII83oyeXd7E9t7kCj1
yTaVBO8XyWDCXM+lr20knToRa/o/RCYIRdIa4LB6fu5N320nPDlo6CVRunRk0mMv
CEReCuzQdXSuXB5ai3QIwPHSTYE8yPrc3Pf8+bCjJB1ZtyIBnVgk/LWg306IehOt
Xbu8BhYTof0YFIBtFsP2zpoyoUbchd3qAVlRX6TW3s2bwGDzpufHPKI+Kh6pzsc/
GBZN69zzjoSbFCCvGEp9E/5oC1DwbooP6sGa3lHTtHOQH9GP6MWJP3nSK0Uw+Qio
+YgeERJyMEZuXJEFexP5LD4mqotXGA==
=YiTK
-----END PGP SIGNATURE-----

--N3h3NzMMytsYzN3d--
