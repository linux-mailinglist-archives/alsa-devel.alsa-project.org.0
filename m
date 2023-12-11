Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE880CABF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:21:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4FACA4A;
	Mon, 11 Dec 2023 14:21:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4FACA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702300874;
	bh=NL2ENmBjIwcpp92HnkgEm9ykKOp6EQ6nvP2PwYBmzhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qvk0tGtTWs4XLSTeGldwYILyXPBp9wkIeBs6aAtc/db5T7JqTP8ERCOY3e9kRfn5n
	 bK9AVhfprOnMiCBbcy1igPgDMmqVHP/Hi7ZwFVtbQieFdWU3Ue06j6Y2HST6IyTa2U
	 RXvYuDZ50FsT0NZLdn/4Z1xchD8wB34Fe5YqoxDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA84FF80588; Mon, 11 Dec 2023 14:20:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E0CF80571;
	Mon, 11 Dec 2023 14:20:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F1AFF80166; Mon, 11 Dec 2023 14:20:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9107F80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9107F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MPXvfAwb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11C5261275;
	Mon, 11 Dec 2023 13:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC935C433C8;
	Mon, 11 Dec 2023 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702300830;
	bh=NL2ENmBjIwcpp92HnkgEm9ykKOp6EQ6nvP2PwYBmzhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPXvfAwbh8hwH9ldAT97ah+Dne6RHbK0ZuNig1YOpLC+t55X4eYoHwuUdAaaqdqTM
	 WGFT9Tpt0Z59zzIQmiMNJkuku9/WKo8NIY8u4T75iZ04mnEyj8qEer5tPykpp072DA
	 TycX5gHHaqf0ZGER6vu/JXpABZHDqKQn1gqZfi2ow5U686W/Hi6w0m65tIAbuB7SUD
	 aWTxug3ffsCwizNBclY8bZmVAIMJp53/tXOvbZqlaULxn+6MhZaGJCrBQHR4+mw2zZ
	 uZsk7ItY/8cHhZ7Hi8iUfnltXOMkNtBdPvSAZhDSOYgR04NhPGF3aPzpP4nBZUC6xx
	 yMyiEvlMtPupw==
Date: Mon, 11 Dec 2023 13:20:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC, PATCH 1/2] ASoC: qcom: sdw: Add TDM support
Message-ID: <01cbe664-f344-45ee-a049-1c27b78ac9a7@sirena.org.uk>
References: <20231211095357.4629-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76L5gXG0TJhXaYup"
Content-Disposition: inline
In-Reply-To: <20231211095357.4629-1-lujianhua000@gmail.com>
X-Cookie: Better dead than mellow.
Message-ID-Hash: 3F5SMFZIQMXRLLJDEYVXDSX3GLELPJSE
X-Message-ID-Hash: 3F5SMFZIQMXRLLJDEYVXDSX3GLELPJSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3F5SMFZIQMXRLLJDEYVXDSX3GLELPJSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--76L5gXG0TJhXaYup
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 11, 2023 at 05:53:56PM +0800, Jianhua Lu wrote:

> +	}
> +}
> +EXPORT_SYMBOL_GPL(qcom_snd_tdm_hw_params);
> +

Why is this exported?

> @@ -125,6 +186,9 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
>  				*psruntime = sruntime;
>  		}
>  		break;
> +	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
> +		qcom_snd_tdm_hw_params(substream, params);
> +		break;
>  	}

The only caller is in the same file.

--76L5gXG0TJhXaYup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV3DJgACgkQJNaLcl1U
h9Cr+wf/Rh5mzsWfkvyzZL0kVpdllXEeA8Mjsmn1CqPrug3j1L5NGY75yRi15YFa
36Rq1DrvIR+rkp9HNzNRR/ME1rekfzACkvglWhuPWsvw00KrMqp0FuUHlL7z0Q4Q
ZRlQCS5qZb+UBbh2R+ePA9ImNeZcqqL/FS2XokbZt4SyFLXWqz68gVbAzVX+z2Ic
xJa8JERXDFzpZxSCmTGS1BmvlirtPMBJl1HrkFZzlkfEfp/9n9Ws+KJDCgeHMrxU
xC6PjSN/OOk/or784TaG0E8JCBh0zd0KaoDalQpeCB+qy0i5HygEnS2Rkxa6FIrs
VW4dV6u1NZ5wyIjoNqaORFiQ5W8TyQ==
=ENse
-----END PGP SIGNATURE-----

--76L5gXG0TJhXaYup--
