Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3269A743F3E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 17:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BEEB826;
	Fri, 30 Jun 2023 17:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BEEB826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688140514;
	bh=7OJfj3mRRwh7boKqkb9v7u3M1MnmPwlc5BEi+eCoD/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tLXb9H+XvFX0iKOnHDmgH0BfUm3KW2C5BvRJ8Eyekm9oLgcy+jl8bo6v38tamq/Ux
	 6Ht/KAe1SRLS0900KnaB4MqjKAxcIO10NrIXsuA+BvRlE40MdoHnckGaeD3Muff048
	 Lo57W76qsQxKSGCtHn9Rwu+ei+343s+xou3Z8sCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A724F800E3; Fri, 30 Jun 2023 17:54:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E74E4F80169;
	Fri, 30 Jun 2023 17:54:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ED92F80212; Fri, 30 Jun 2023 17:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82631F80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 17:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82631F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TkBi1TAg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC0646178A;
	Fri, 30 Jun 2023 15:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C4CC433C8;
	Fri, 30 Jun 2023 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688140450;
	bh=7OJfj3mRRwh7boKqkb9v7u3M1MnmPwlc5BEi+eCoD/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkBi1TAgIpC7ZQSW3Zk8aXoNhmgecjUToehHCp6xLMSLcf5FGOMITfg2wjUX9+JwW
	 qfgfb7bauqO3q3RwO9M5eK5jSkcIe4v5d0ie1cZSAJRSH2r1YYL7Wb4tYRcKuiW9vr
	 6jHGMXcF6ejiovEyzeF+mUC7P0sN50pUHR64dI0rMaZJW5dUO+jGsTubNHD/iaROmG
	 modtPW5nZix4xJYtW2K1rVngSC1mBZzIsjvbFO7lrzKQDGQJGqWTKf28Kbl5JpzOV3
	 ijBrWxhBCUuljye65qKslQIgHuv2BgyZ/dgoQ1DqZAmIgY11kKmoQ1dMia+EdUH0Bf
	 ikQCQe9nBxsew==
Date: Fri, 30 Jun 2023 16:54:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: codecs: wcd938x: fix mbhc impedance loglevel
Message-ID: <4dbc08d4-9e45-40d7-95f5-4c12d3034bf5@sirena.org.uk>
References: <20230630142717.5314-1-johan+linaro@kernel.org>
 <20230630142717.5314-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DCVMfBkLXgljzRQ6"
Content-Disposition: inline
In-Reply-To: <20230630142717.5314-2-johan+linaro@kernel.org>
X-Cookie: Old mail has arrived.
Message-ID-Hash: EORFJHZJVOJPWJFT2LRFDPPRXU4PSYUH
X-Message-ID-Hash: EORFJHZJVOJPWJFT2LRFDPPRXU4PSYUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EORFJHZJVOJPWJFT2LRFDPPRXU4PSYUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DCVMfBkLXgljzRQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 30, 2023 at 04:27:13PM +0200, Johan Hovold wrote:

> -	pr_err("%s: d1=%d, c1=%d, x1=0x%x, z_val=%d(milliOhm)\n",
> -		__func__, d1, c1, x1, *zdet);
> +	pr_debug("%s: d1=%d, c1=%d, x1=0x%x, z_val=%d (milliohm)\n",
> +		 __func__, d1, c1, x1, *zdet);

Indeed we should really be able to arrange to make this a dev_dbg().

--DCVMfBkLXgljzRQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSe+psACgkQJNaLcl1U
h9CDJgf+P+jaWniR0//IBmvy7CV+0jDyq6kdWfoTrfeLkWm5xzGHOnkC7rYuf2pz
cqpg7YPaH2ebAOd/MOyA4kuY8JM5bn+rPCjVeQCb2nEsC8srnMTP+Sel8lUQ0otD
3+w/0fAX6xVGQFAjTMVtgkGEkbJBv+NcWVDS3uVUv1KnIH0G0sh2PunuvhN37Fe/
/dXGEKMtqV0PlGpLN+VwbqEH5iK12SaW+5SoK8iFQkdxdWTXUDdu61mJRL5Xrg8O
wYe1hJIM4/Ne/Y6pOZ76TMGSEppI8kH/oKRwa4rSwl8rlIJfdzULzG+XFJH+DPZQ
BTig6ASZoMy9x1TP1/JHM91orIR/Mw==
=h3V6
-----END PGP SIGNATURE-----

--DCVMfBkLXgljzRQ6--
