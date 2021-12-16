Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E74775C5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:22:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC09120CF;
	Thu, 16 Dec 2021 16:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC09120CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639668171;
	bh=ARE4gkE2J/9sLOfruXpTgIpT5L9R6CeYq5uv+fgEy+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKMFSNrBkLQA/S8h9G3afMwX35zSI5WybvMHQXj74tmctGEEDFBAYKVcB+JaGEDtY
	 IXaXN5RSivfmEaY60lnqASdlzDtpnSy9HS1N7inlxCHpU4shhZxFKVSE6fBjYjeqTP
	 /kfcysNausXG+8QdeG6MDrblixDnOvYkf8Ov7MR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3045DF8015B;
	Thu, 16 Dec 2021 16:21:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B06D7F800DE; Thu, 16 Dec 2021 16:21:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF268F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF268F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VHbrRdbk"
Received: by mail-wm1-x332.google.com with SMTP id z206so4915581wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EDnhGOt5yt/Q5eHlMXrXDwNEP6fA2fIbiM7ZWpn1ct8=;
 b=VHbrRdbkAMmFFx50VrmdFx9wt32X9gRxBKtODT+TJlanscSWIdaAF192rfa9sWV/cy
 tVzlZmLMyzQay1zy8gagBymEOoZBs5xF6SmJD6a08yxZyWVOW4a2dBCDz3J+Zn2wEIja
 ylRxqj7soRPq0jFA6bIkTqWwz8NLSEsHwfuWjyqbeQwL+O0+nEU0fS2Kkls5J59wF+fr
 3pytUFm7qVuXCqBXBNvvu+ArGZNwhtqoA2+uk1vMiWV8wxFZGhxQvMjWWPGe+Fs2tvdU
 oUMDoANzX03Sg+eHQlL6DeWjKQULxnf6HgQVrWgfqmHQG3dL4qMfC3PWUxWR0vdIRX+i
 kh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EDnhGOt5yt/Q5eHlMXrXDwNEP6fA2fIbiM7ZWpn1ct8=;
 b=ZmG0/z4nGYFwdj4MsUxTrfwca8MiXixjSnBCHfYpVgXVCRpEepPAwKg+xkt4bhGIdy
 it811MZGPrthglC0jhteQh3cq6YytCSAcU35NQPWUHoPQlnWAsnvZmjRkd075MZ4dw+R
 AzcARbxLTcyvT+L2duIFZErPmb7ug9DgN0wSDRtAg5xkS8acsfeoyYl2P5fO1/PtauUg
 5J68mYR2UL2BybGYxjgO1mZFJQadKdXM1PfKsccaa+q6KfMU024u8YTjC5/Z3kSRMVGN
 TfpH7Ov7dHd4T+EO1tGLEiyOqjmSycNOOigIs8V/7sFxFu2Z7LPTp0f5Ka9mdp7yVIU7
 KEdw==
X-Gm-Message-State: AOAM533d0gnYBupUsVXbT5894B55Id0zXez8HThaYgkYWBuNzMGL/EEg
 WZBUS1ACe9Mx7sCIzfkR5/o=
X-Google-Smtp-Source: ABdhPJwilYtfCADToZ6QkaMbt5zJnumtsxOZMAuNZ4D/GKs7xcdpDggrZGVjGtSduqPc33LbKVcHpQ==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr1586709wmc.140.1639668090773; 
 Thu, 16 Dec 2021 07:21:30 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id j11sm4945091wrt.3.2021.12.16.07.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:21:30 -0800 (PST)
Date: Thu, 16 Dec 2021 16:21:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 09/22] ASoC: tegra20: spdif: Use more resource-managed
 helpers
Message-ID: <YbtZdqCz6qHS2JZL@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-10-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8bk+QQaNEhaPh30H"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-10-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--8bk+QQaNEhaPh30H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:12PM +0300, Dmitry Osipenko wrote:
> Use resource-managed helpers to make code cleaner. Driver's remove callba=
ck
> isn't needed anymore since driver is completely resource-managed now.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 33 +++++++++------------------------
>  sound/soc/tegra/tegra_pcm.c     |  6 ++++++
>  sound/soc/tegra/tegra_pcm.h     |  1 +
>  3 files changed, 16 insertions(+), 24 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--8bk+QQaNEhaPh30H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WXYACgkQ3SOs138+
s6HnzhAAhjmsSsHNiLAo22R/O+NXEzqlLxBG/882IqtVa8bWgdNLWvx5VilbasbL
lJUVTEs+mVr5JYQlrHEXsMKXfb9Cc+hq/dcWSU/aQaFIp5Vy/xhFZ4iKsbwJkr5J
JoWpkvNdSqSHUFOSib3Ck5mQqeByyQbm8RVDBUtsZpD1JskZRJyqgvHF14KOsEjF
PvKp73zUoSEAU/rhbn2NhgIqnmdwXBwdUSbr3JBOtIUKe5E5uxtVu0fsFvNnoSFg
3U7FLsVMR01x2zcJ1aebebVS/Ii/oQHXABzPra2sGcDPnfAM75db7fGdvyCPxrdC
Wy3WxVcAgz5jqSYF7m4CBX9JO0uLpFJGkeP6ok2HplasPrjvbrzyVXkaUdX0/NFW
aDdZXRMgt38QkLUxd5O5FsjlQSIPhI2/nXdB6cocmKzyOC+aBlEWc/K2zsJKkPcx
sL1y0YUGWJkYZZS/DKlplMR5FIwhuX3v8tJBIwfx/1Mrk2Spp4ggbh5xml8Wi+9m
uI1mXNZP5MyiO1V4CuRIAfi+vVT72uxrb8HT8WYRkrt7IYPhqujU2TCmw93Yzk5F
MHNkJOwsFmmY9TvA1dWb5GXi7gXPPiwEWv4uOvtc8T1hX9gGAyajEbQzIvwNO/DK
eOoAS1lWs84wnYx2OpOJKK+5MkxlvgklCor9YrSdKEDW44AraMI=
=XTa0
-----END PGP SIGNATURE-----

--8bk+QQaNEhaPh30H--
