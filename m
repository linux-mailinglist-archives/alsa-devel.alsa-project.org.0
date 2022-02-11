Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 620104B28D1
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 16:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0B01910;
	Fri, 11 Feb 2022 16:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0B01910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644592343;
	bh=yJSk4L5HsItHxMJcn7RPlOgarRlO8VBIH+WmTOcXLOg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oenuovCJNhMWeo+s7kIPLiB43VjOH4wwb6XXsgE7DYhvHu7VKedX/p9DkCLPOmU3l
	 A8OI45LhXS1mPZHtjlvdnE/tJPCAoKO6cZ9KIt4xRnWFUCD3Lt1M1SPkF1QNbDWEHj
	 e8Jic9eiiFpTGfD/P5OUW//+Cgch46wYpjhS1qWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53FE4F80054;
	Fri, 11 Feb 2022 16:11:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A54F80125; Fri, 11 Feb 2022 16:11:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52CA0F80125
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 16:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52CA0F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VEjL6R0Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D42C2B82A6D;
 Fri, 11 Feb 2022 15:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71801C340E9;
 Fri, 11 Feb 2022 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644592260;
 bh=yJSk4L5HsItHxMJcn7RPlOgarRlO8VBIH+WmTOcXLOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VEjL6R0ZUonlqNIwyPEtl0VSA6V/hI22RLzZDd+F6g1Cq+8+bQ5L9Qmirb0BqBdQO
 WAvvR81ULKp2sF0fIkQYe1Nf89uIkVTBZ1bA2yTOcP7CXJx03FC867IMwhFzDy0jaV
 l5uqea3U58VGTj8dXgFw5oVk71WbZpN+nXKNUhzKv2aC6Q5jv7qC+O9nqOon2kbHSb
 M7/Iyp0VQlewoMLx5W27UQSc9abaEpkYM1cCCaAk4hdbQJbgOTyzxV0pKu3gIDtAXh
 Edc3Pf30q0NK1nJisNoEYs9bhzdHXVSDc3N26fZKTlAjRA2WvHTTnBwn3ovnqWsIru
 K8X6vWgc0LNwA==
Date: Fri, 11 Feb 2022 15:10:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 03/15] ASoC: mediatek: mt8186: support adda in platform
 driver
Message-ID: <YgZ8fnvd4/Mxm3wp@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-4-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jQ99B0YRXDijfpGR"
Content-Disposition: inline
In-Reply-To: <20220211103818.8266-4-jiaxin.yu@mediatek.com>
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


--jQ99B0YRXDijfpGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:06PM +0800, Jiaxin Yu wrote:

This looks pretty good, there's some issues below but they're all very
minor, mostly stylistic things rather than anything substantial.

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MediaTek ALSA SoC Audio DAI ADDA Control
> + *
> + *  Copyright (c) 2022 MediaTek Inc.
> + *  Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol,
> +			     int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	int mtkaif_dmic = afe_priv->mtkaif_dmic;
> +
> +	dev_info(afe->dev, "%s(), name %s, event 0x%x, mtkaif_dmic %d\n",
> +		 __func__, w->name, event, mtkaif_dmic);

This should be dev_dbg() at most, otherwise the logs will get very noisy
(but note that there are trace points in the core which cover this).
There's a bunch of other dev_info() calls like this on DAPM events.

> +		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
> +			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x38);
> +		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
> +			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x30);
> +		else
> +			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x30);

This could be more clearly written as a switch statement.

> +			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0) {
> +				if (afe_priv->mtkaif_chosen_phase[0] < 0 &&
> +				    afe_priv->mtkaif_chosen_phase[1] < 0) {
> +					dev_info(afe->dev,
> +						 "%s(), calib fail mtkaif_chosen_phase[0/1]:%d/%d\n",
> +						 __func__,

Should this be a dev_err() given that the calibration failed?

> +/* mtkaif dmic */
> +static const char * const mt8186_adda_off_on_str[] = {
> +	"Off", "On"
> +};
> +
> +static const struct soc_enum mt8186_adda_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8186_adda_off_on_str),
> +			    mt8186_adda_off_on_str),
> +};

This is a simple on/off control so should be a standard numeric control
with a name ending in Switch to help UIs handle it properly.

> +static int mt8186_adda_dmic_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	int dmic_on;
> +
> +	if (ucontrol->value.enumerated.item[0] >= e->items)
> +		return -EINVAL;
> +
> +	dmic_on = ucontrol->value.integer.value[0];
> +
> +	dev_info(afe->dev, "%s(), kcontrol name %s, dmic_on %d\n",
> +		 __func__, kcontrol->id.name, dmic_on);
> +
> +	afe_priv->mtkaif_dmic = dmic_on;
> +	return 0;

This should return 1 if the value changed so an event is generated for
userspace.  You might want to run the mixer-test kselftest (ideally the
version that's in -next as there were a few bits added very recently),
it should detect issues like this.

--jQ99B0YRXDijfpGR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGfH0ACgkQJNaLcl1U
h9DHegf9FFOH5x7aOO8tIrLCjfLZFtOCnSo3V7OkQ8PJX+03uK3Ix78EZtr4fty8
+Kp/3NwD98U0ZtN8thMfTOozGdzcfWUFiKGiBLFN0lFXt6h4whktuTB+OJfhmwy1
mbmVi46mEJphnEyVhY6cS8b/AXeZ8usoZb3h/3meT8/nHKfP3ihQZKeBntk1y4Eh
Fj/mJtQIOA/ck+U6bMyaXaSZ8kYsBlpNin/MI+dPNxk50W2WSZJIFNe+PIMeGiuT
41F/eRkbYtv+nCmVmmdBuw3YLNUzSXLNYzttDYlofXvnz3mbraXvhny8qJ0ZA3X7
fBlHVaOI7kH11JdpDxFVoftYhH2YQg==
=N7WM
-----END PGP SIGNATURE-----

--jQ99B0YRXDijfpGR--
