Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 473987461B7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 20:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46B2203;
	Mon,  3 Jul 2023 19:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46B2203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688407207;
	bh=XiKFb7V3OWMEwZYvzGXbVzuxPSM8FbOxPhs9OT74TMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jfTOBVh+6EjFWYMUUbmOEl5hpk2Y1V8gvxnHwcskY50n6fn8lLnQdJukhOiSdti9G
	 ERSMZfLpMRVaRyDwiEgdYHpJeVo9zO7/xsx07CnDCzjfkt5aKRSm6ZIeqfhyXMLXbU
	 cW3Mfh3qQUA105saMT4OEaolA1fhgUfRVuC/G+O0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 499ADF80100; Mon,  3 Jul 2023 19:59:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D744FF80124;
	Mon,  3 Jul 2023 19:59:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D216F80125; Mon,  3 Jul 2023 19:59:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 748EEF80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 19:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 748EEF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FhW9voFl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E70C960FE2;
	Mon,  3 Jul 2023 17:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2F4C433C8;
	Mon,  3 Jul 2023 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688407142;
	bh=XiKFb7V3OWMEwZYvzGXbVzuxPSM8FbOxPhs9OT74TMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhW9voFlWsg2QeJzEydQBhtOwjlMm8fZzCdy3Jg6bgRw3Esqh+f8rsZBYIA3SCaPx
	 AQz+Oc9EBN6nn93BEoFFPSg+57WrZmANomGNefAIrNciFIsppxAehBRnMqXAt/ywjm
	 z7iqgzyrENrfpeSnG308kL3EU9gR+y4v6L3MlpiOyNoivVjA3mh4bTEnyioySkQzgM
	 GxeHgvOxN6ShRkFj3TRimrwaeLvgUIl10cAmpoOAJRCAw3PSjPMnrlQB4GB7fHJBUf
	 S3+AIOJVoJNcN8mVzU6/cDqq2x4yEOq0egDriSpyLBXZ5+3puLj3beKYTz+4YpegCI
	 Yid4vMQ3ucBZQ==
Date: Mon, 3 Jul 2023 18:58:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
Message-ID: <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
 <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lxJuGwNgfQ7aT3CA"
Content-Disposition: inline
In-Reply-To: <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
X-Cookie: Please go away.
Message-ID-Hash: VVP5K3WI4GUUKW54634AGEWBHHQN3RYY
X-Message-ID-Hash: VVP5K3WI4GUUKW54634AGEWBHHQN3RYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVP5K3WI4GUUKW54634AGEWBHHQN3RYY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lxJuGwNgfQ7aT3CA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 03, 2023 at 03:12:55PM +0200, Hans Verkuil wrote:

> My main concern is that these cross-subsystem drivers are a pain to
> maintain. So there have to be good reasons to do this.

> Also it is kind of weird to have to use the V4L2 API in userspace to
> deal with a specific audio conversion. Quite unexpected.

> But in the end, that's a decision I can't make.

> So I wait for that feedback. Note that if the decision is made that this
> can use V4L2, then there is quite a lot more that needs to be done:
> documentation, new compliance tests, etc. It's adding a new API, and that
> comes with additional work...

Absolutely, I agree with all of this - my impression was that the target
here would be bypass of audio streams to/from a v4l2 device, without
bouncing through an application layer.  If it's purely for audio usage
with no other tie to v4l2 then involving v4l2 does just seem like
complication.

--lxJuGwNgfQ7aT3CA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSjDF4ACgkQJNaLcl1U
h9C2qQf/T1bo/x5kzUxZUiZwHmeGiBJp44klM7V/tJxivlJLnJasmtd1XuabJOck
svgGpJOHeeAAIAQIleix37Lwq5hMLYgRdPPAHw3+uw4mYtDzqo5dx8t7Wb8d7+px
152zx6Cv8YdJ1mK/UOKXC/+knHpkW0r9PtzwItAAnCTPpAIPjB0FAjSkhRuQr2bl
tlzLcAepTA/uPQYuK1FbwUZEcm0i/qo/aFpE5T7hYpY3IlFYrtMz8uNyqhXMsuM2
SMREMMIMF84hMJkJ3sRrf6609xv86w+Rkh6illa8jX/GCKDHQRNR0xa+0Gky5cah
eOW+Q5lSP6NtzVnkBdM3DUDl/+IaRg==
=ImD6
-----END PGP SIGNATURE-----

--lxJuGwNgfQ7aT3CA--
