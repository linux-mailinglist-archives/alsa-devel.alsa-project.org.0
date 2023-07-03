Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5521745BBE
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 13:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02883E7;
	Mon,  3 Jul 2023 13:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02883E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688385440;
	bh=F2W2Yz29lXWIrZbzQBpiFGDh8BKRY5hjbFr5d6zCVrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sG92gkyqIoK2pioD2zloqgquglJDV0a7gyLvnu0UiI63AoV7879kkgML2igY50Y8f
	 lip3GmJ/xK1wHrmfBhvAUobwQuSVMQZqg1Fi6aYhTVzBLqgokHqMesdnaG++zP/MMc
	 guwP9BHXceR5meRGqESa3WDrzfwm9KvBbA/qC1qs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60056F80104; Mon,  3 Jul 2023 13:56:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E535F80124;
	Mon,  3 Jul 2023 13:56:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1111EF80125; Mon,  3 Jul 2023 13:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5160DF80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 13:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5160DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fewtM7a2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1BE460F06;
	Mon,  3 Jul 2023 11:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF4EC433C8;
	Mon,  3 Jul 2023 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688385381;
	bh=F2W2Yz29lXWIrZbzQBpiFGDh8BKRY5hjbFr5d6zCVrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fewtM7a2Cx5ya9V8+XoM9lpG+ndtxyx//S9nZtj4bgpbJVkqzfImc+/Ce7yZSkH7t
	 XYPVhzpx6urFRs4vv5FuaJxOQoTL+MvnIP4RtG44CUg0tqh2Vhn4KYXefdPF7xjVml
	 PTIMtAqxJjyOYiisqKpE82dB4t82txblOj5KTPHSrngfTJYNdNYe6ffxnvIYfzd7BA
	 DfD3qVdV4Yqc38x2utfEr1e59x4vhsvOuX2CZJnn0x9DlTuGjodYLy0fuf9EMAZVFi
	 +aphcOzB7muCt9hh2A2QP1N8s+RK1mFMjAtPkjaRUcEv+3v8eHcRc1AYeh3o4UyZ+f
	 8DKK6cwLZ7gJg==
Date: Mon, 3 Jul 2023 12:56:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Johan Hovold <johan@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <80183a58-78ba-46b0-8d2a-502b5b28ffe4@sirena.org.uk>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <ZKJ9UrB8FRkLzLc-@hovoldconsulting.com>
 <ZKKA6K44mp_vjwtp@hovoldconsulting.com>
 <877crh76ge.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U+PSF/XHDoszaQ30"
Content-Disposition: inline
In-Reply-To: <877crh76ge.wl-tiwai@suse.de>
X-Cookie: Please go away.
Message-ID-Hash: 2KNQYEAI7V32NQNHTFZQ2XDEAVUXXLVG
X-Message-ID-Hash: 2KNQYEAI7V32NQNHTFZQ2XDEAVUXXLVG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KNQYEAI7V32NQNHTFZQ2XDEAVUXXLVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--U+PSF/XHDoszaQ30
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 10:19:29AM +0200, Takashi Iwai wrote:

> Isn't it rather an issue about the error code passing in qcom driver?
> How about the change like below?
>=20
>=20
> Takashi
>=20
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1276,10 +1276,8 @@ int audioreach_tplg_init(struct snd_soc_component =
*component)
>  	}
> =20
>  	ret =3D snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw=
);
> -	if (ret < 0) {
> -		dev_err(dev, "tplg component load failed%d\n", ret);
> -		ret =3D -EINVAL;
> -	}
> +	if (ret < 0)
> +		dev_err_probe(dev, ret, "tplg component load failed %d\n", ret);

That looks like a sensible change in general anyway.

--U+PSF/XHDoszaQ30
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSit14ACgkQJNaLcl1U
h9CjtAf7B2p1IgCA8Co/ROslWsAioKfyEfS43xyuwkb1ytO0MD50aPa5lID+D70f
NRxVkywvv6oMZ26fvEFsebBNY/ZMyYdEv2j+hJ7HJjAvfv+JVDuTfFVekmaugM5N
sFM8Pxs5WL12SecXUA6/zWgNt0DTncRKRyEMS5frnfYm+uiB4yT/rCeARNvbfgk3
FKh5SAzmH/ELKlfy2Y0Sn2/J/1Yc5axqR0ZAgJZd0Yl/NHR3sa1taYpTlMGl5B3y
xkBoNudvJrMSWq8v8VVZtisHZiXe//tSssEaTkFY6/4eSu8P9bmLX/Ge87K8IV9G
3L8mkAUNnKXEPq/nH97/BUNtEe3Xrw==
=NvHF
-----END PGP SIGNATURE-----

--U+PSF/XHDoszaQ30--
