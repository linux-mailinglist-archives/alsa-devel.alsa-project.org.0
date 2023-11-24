Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BFF7F714B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 11:19:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 586B4DF4;
	Fri, 24 Nov 2023 11:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 586B4DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700821195;
	bh=OEZjeJvaa0W7vSTE88cnpZau4Nam/6qChCui4cXBaN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kQGnZ/LZdmnJYKUMn5LAEBoWFOwcqQmBY9kUqCu8oSdqA6u2WNn5g/Njz2cOC+AxX
	 5z+0aAUdLt0ICiUKoPtpYiqU0iHEixP1ys1Of05yGIkbKnnstOU+8EkBr/zLQl2Sfm
	 NargeKqxXBzwFp0fV/+qlX1uyOSo7Cr1EEyoddmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A43DF8055B; Fri, 24 Nov 2023 11:19:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5463F80254;
	Fri, 24 Nov 2023 11:19:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5093F802E8; Fri, 24 Nov 2023 11:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B669F80249
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 11:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B669F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EIQvHAcW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5D6FBB83006;
	Fri, 24 Nov 2023 10:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD8AC433C8;
	Fri, 24 Nov 2023 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700821150;
	bh=OEZjeJvaa0W7vSTE88cnpZau4Nam/6qChCui4cXBaN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIQvHAcWdH+aWdppBQyEJjgBwjnj5PnnQhO+8xHsqSeB6JHVnW6G1hVn2zzCxm480
	 H5bD3Fi5C1IuNoVzMIG9SgfodwjThbhDJjL0fgsXBSA5YCYGM1T0QVnzvKjJSkfVcC
	 PvGPze6kTiRqJHjygRYv9msfNlebGeRIyr9LPvNKLPrmKxODAccrpw463vn+mwFbUC
	 umgQVa122MGu4N+Yb3ab54opcbQZ+YXPTMLDqnfbqRgk4ic+347sp+IYJ5s9us5mZB
	 6eYz6vPGdNc2JP4GhfqOrjurYebJVCs8OIu2U0SIUxn1IXKANYUGg1cXvQsN6R319N
	 vXJKMdOHPjiDw==
Date: Fri, 24 Nov 2023 10:19:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <ZWB4myckLrpBYLm+@finisterre.sirena.org.uk>
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VQ2nRTjyMlGPMvXH"
Content-Disposition: inline
In-Reply-To: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: EERUMFTB5TDDJ5L37N7T7NIOYEDL7IC2
X-Message-ID-Hash: EERUMFTB5TDDJ5L37N7T7NIOYEDL7IC2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EERUMFTB5TDDJ5L37N7T7NIOYEDL7IC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VQ2nRTjyMlGPMvXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2023 at 03:49:15PM +0100, Neil Armstrong wrote:

> +	if (wcd939x->variant == WCD9390) {
> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
> +			dev_info(component->dev, "%s: Invalid HPH Mode, default to CLS_H_ULP\n",
> +				 __func__);
> +			mode_val = CLS_H_ULP;
> +		}
> +	}
> +	if (mode_val == CLS_H_NORMAL) {
> +		dev_info(component->dev, "%s: Invalid HPH Mode, default to class_AB\n",
> +			 __func__);
> +		mode_val = CLS_H_ULP;
> +	}

This lets people spam the logs from userspace, why not just return an
error?

> +	if (hphr)
> +		wcd939x->comp2_enable = value;
> +	else
> +		wcd939x->comp1_enable = value;

Are there really no constraints on the values for these things?

> +static const struct snd_kcontrol_new wcd9390_snd_controls[] = {
> +	SOC_ENUM_EXT("EAR PA GAIN", wcd939x_ear_pa_gain_enum,
> +		     wcd939x_ear_pa_gain_get, wcd939x_ear_pa_gain_put),

Gains should be be named Volume.  Is there no TLV information?

> +static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
> +{
> +	return IRQ_HANDLED;
> +}

Why even request the interrupt if it's just going to be ignored?

--VQ2nRTjyMlGPMvXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVgeJoACgkQJNaLcl1U
h9AZqgf9ER6M6fjDX85XA+DwqPsutTqM7mFbCjQypc4RvoCAFr404QMv94Pqj49B
yVWWJEJ450NwalztnrIUsq8eTs9Fs/KpIhqEh202WlqHHd2EKGoAyHh6IEqF/yni
F1YbWwejYTdL+16hOhMCtr0AtdhxEOe74omNJNcePl/yWCLx14CAA/snSAgVObjQ
NO1Uhh1AgnAEO+S1jOvuGb3BzIor2UpcFNqhvKa6jkgRpEk/ZEUQjzJ/1bGdOF5r
ny1HRvZgIcwIKyioGRREjdPmIGHFg+gLe3+LESxVy32YhpKkWaqYa4UT2wcVgtTp
ej3yYYHUfeYQ6XtbWTd/o/wtzwlIWQ==
=IuYR
-----END PGP SIGNATURE-----

--VQ2nRTjyMlGPMvXH--
