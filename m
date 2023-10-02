Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4A7B5605
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 17:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B585E84B;
	Mon,  2 Oct 2023 17:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B585E84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696259360;
	bh=J+OwmH7fnLd3FjX0c5iBU4C0cZpYv0irsXmd/Nc8juo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YYAbsrirAtu68Irc8WggTvXPiKy2/ak+NZEx7sTDW5CSsggcAn5rXnJih6SHJBa8P
	 XbIvFl7tsk0tOyv4kO/+mA1ZQUY1a/mhwF+RMcsdnVf2FxLp1zXp15geQb/0KmF+q+
	 3gp+orJ4sdqA+X6dIUbzm4nwRUD3zujwar/nmoX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B80F802E8; Mon,  2 Oct 2023 17:08:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A17FDF802E8;
	Mon,  2 Oct 2023 17:08:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BD7F80310; Mon,  2 Oct 2023 17:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6258DF80166
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 17:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6258DF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=atF4iQwi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B74C3CE10E4;
	Mon,  2 Oct 2023 15:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED2AC433C7;
	Mon,  2 Oct 2023 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259284;
	bh=J+OwmH7fnLd3FjX0c5iBU4C0cZpYv0irsXmd/Nc8juo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atF4iQwivM2vmRHpHXqaQtNheefwRwC5MjGvX2c4mKcZwXwQvKGjY2e6hq8f8EVKj
	 0kStVfFoD8spZca0Kuo+IP28Cyj93OQ6KkOBjhTuBY0euutoi+jq2ZuwBhJ1Yye73X
	 SKAwqtIKHBgSW30WTST2zMd97Ix1lNTdBTqrUIv5rNMyLMo8Oszwlh3J5mePVyppfU
	 oT+gB8D+YpHaPxu+oEoJW/nTGLgR5Noi1z+Lflc0O1EO/zFSU4MKmAB5xP6p46hMh6
	 BO1V0QHJbtc3u91m60YTKhfJGBYbwP7ycVh25X3WDUb94drOOkHqa29unh+etrWD47
	 +8ktmKV608gCw==
Date: Mon, 2 Oct 2023 16:07:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v5 01/11] ASoC: fsl_asrc: define functions for memory
 to memory usage
Message-ID: <7af54654-d4d5-498e-bd53-78ad54e6d818@sirena.org.uk>
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
 <1695891619-32393-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KuYuv5Y+mxgMeyVy"
Content-Disposition: inline
In-Reply-To: <1695891619-32393-2-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: VN6A2IS5QUR5FQQGJ5NL5Y3NU55TZVDQ
X-Message-ID-Hash: VN6A2IS5QUR5FQQGJ5NL5Y3NU55TZVDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN6A2IS5QUR5FQQGJ5NL5Y3NU55TZVDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KuYuv5Y+mxgMeyVy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2023 at 05:00:09PM +0800, Shengjiu Wang wrote:

> m2m_start_part_one: first part of the start steps
> m2m_start_part_two: second part of the start steps
> m2m_stop_part_one: first part of stop steps
> m2m_stop_part_two: second part of stop steps, optional

The part_one/two naming isn't amazing here.  Looking at the rest of the
code it looks like this is a prepare/trigger type distinction where the
first part is configuring things prior to DMA setup and the second part
is actually starting the transfer.  Perhaps _config()/_start() instead?

--KuYuv5Y+mxgMeyVy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUa3MwACgkQJNaLcl1U
h9CpqAf+LBBYky8048zO16jau031dm9xveIOz9PkuENbvo2Uh2rQKQMPbnuhWDLH
h27vidoat8VGo5MFaqpCAKpJA+PReOLkzI4sk71WcW3RaNJ5MofIQO3E5ZIXanKo
ZqsjDFWImiT68/LPs/u7jjgl801Z3IgQ1ozVJgM0NyZr7w/mu603A8gnbenRNZyA
JLcybnLQ0CGi9P23UKjCLBJx4dZpvFgm6K31K175IcDnx+cOn5CBEyHe9nyhEI/S
iXFtO85ddjkuxyepQMqlED8ipo5sSZLgrHHGpTB13DmY08jDnFSQQH9czc/mLNty
KoKv69c+UgkKI6BSQ0hue4iiY/oIOg==
=Cq0X
-----END PGP SIGNATURE-----

--KuYuv5Y+mxgMeyVy--
