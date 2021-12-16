Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F174775B4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 672DF20B2;
	Thu, 16 Dec 2021 16:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 672DF20B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639668011;
	bh=ScIXmYmFFoE8Sn9t1YIkc462Fei0/entw5YkV7HQgG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gEIPp6D56KRLlIzF2nVCsGizObc4yCKhWkUvXm/yjSHJVpcpvc1/E9ojImAISaN61
	 G2v24m+Hc1bZlFow83lq5zxl3urSDRFj4Vy5Kf4w9W0Ca7EGoSn1JxGOfilmdCle7A
	 TuanT9Q8eY6mL6V/i54qdOomTD1U1JreGxWFqVbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E34B5F800DE;
	Thu, 16 Dec 2021 16:19:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89952F8014C; Thu, 16 Dec 2021 16:19:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A6DF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A6DF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kRAuUi3p"
Received: by mail-wr1-x436.google.com with SMTP id q16so4024405wrg.7
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0NW4fFRtdMsPlhmkKhcfTmNZmyEs9QhErqbczxjv6B0=;
 b=kRAuUi3pHfp0vlymF4VGBZuEwSgT02dIRWqOT35hkagh6ntcNm8yIFOd8aC3cbEjeV
 oLvppbAZRB8W2b4GctTPRBCxTvug8AbYTh4eU9SKY464yhzZoIZbkU7NStoyhZo028uP
 30G79hCtFKOTQZ41pob7oCKdpmnUyzF/WOr8HOUrKPj7pgtBjorDAt1r+B0SffNGb2nx
 PWYlXg3FMnVSoyx70RZYYypH0u6HTgYkYxQ9HgAu5RfJiVfJbT+9OBeFuOIHwD+kdpCQ
 wyyVlh6+vxWWobNr7aCMpPy2K3Psu4wUGD2t3a6B0oxiAEEZJtpoBjFYAB3fPwOhvgRJ
 rXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0NW4fFRtdMsPlhmkKhcfTmNZmyEs9QhErqbczxjv6B0=;
 b=1naqgqtR1wAgbucPCI4pungx5FMRnd1P0/OAeztchtzyWNIfWpZ0eOvz+nQQxcealS
 g+l59b42Xdd0xvX0e6Ns4xiT3SNl/g3qFd4+bRevnJTBHI088Gchk3WmeEzJcnqbMEfj
 GhMtsHP+Nc8avXVP0QNVhvoDhqkc5Y0UMlgGFVttFUskhMFbFgwlHqSzY9vj3yIauhV9
 8JWta/Z7Rv6k4uU37k8x/+fbWgElvbhv1n0QlZrJ+tL/S8Qv5qMnubEirTV+cNFvqVyR
 kAxDaYIBCm0wn6GHs+6r4XXhqH0IJVzbYyX8449cj63EIxko/7DKLjaMFcDTEbCBRVu6
 k9Gg==
X-Gm-Message-State: AOAM530z6j+w9FUXmqXNqiX19qIYoSC8fHcrYEPJQzrvi6hk8nRnvpWt
 Cgf96Qv8aap1COUEOp+Akak=
X-Google-Smtp-Source: ABdhPJyy3q6RwT0+pTgk+dWoIRgzvgCOOBY61BwzAcTietGzu7v354AVmOOir3fo/hsmJoWX4Pt/IQ==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr8909726wrn.719.1639667930246; 
 Thu, 16 Dec 2021 07:18:50 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id q13sm1597560wrr.64.2021.12.16.07.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:18:48 -0800 (PST)
Date: Thu, 16 Dec 2021 16:18:45 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 08/22] ASoC: tegra20: spdif: Improve driver's code
Message-ID: <YbtY1TfX3rdVbkzG@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TtAaL1I0tfYEZFLw"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-9-digetx@gmail.com>
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


--TtAaL1I0tfYEZFLw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:11PM +0300, Dmitry Osipenko wrote:
> - Clean up whitespaces, defines and variables.
>=20
> - Remove obsolete code.
>=20
> - Adhere to upstream coding style.
>=20
> - Don't override returned error code.
>=20
> - Replace pr_err with dev_err.
>=20
> No functional changes are made by this patch. This is a minor code's
> refactoring that will ease further maintenance of the driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 49 ++++++++++++---------------------
>  1 file changed, 18 insertions(+), 31 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--TtAaL1I0tfYEZFLw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WNUACgkQ3SOs138+
s6GwvxAAvJ61geFKAbm8cP5N+pEbKgtEihkMw5PcFuU3W2atATXHSqSBZfJLV4ze
A8EQ0s+6vh51dP9aXYxgKU3eiuilqw97kCSNPEwmq9kOiDe/ls7Z/hoEW/Djsir5
wHOa7uBq4+10I4UNMlJQNs5XX9+bp1ajTmH5ia/KiTcburoqT1P/UllLwjboBgRm
k9P3LKjBckI8u9wRx9meYGxA712IxAyOmbdlfHa7SlGKwXZw7aO3K2wuls7QAdZw
NTSkpLHUbgQW9VIAyRIIA2iczZHlwm60Y43Bo6RRTlx8vH1pPlTikqFB+VMZHH4E
awm7aD0p+VpvM+gBN2+cjmwlWsUXvVp34rQYZ4dR+bY078R4EOTA+nyMS4Z+693G
kNwjF+02na0InBnxDg3VFKCCd+O72A+r5ydXcWDw88FhNy5D4kUIZl+EFBKBmMb4
AWl/HxMmM13IVSfu4NpgpCpjqNaOAQokybxCH4YHs9JIUcHAP9XZR2IKTVxZaerC
NxQqpp9BfrOiIevdNifxpp7XL7DA6yjpck7iYMFzrcZDkc2gmIb9jiS2Cn8Szwjq
emDETf5gob2Pn4atJkeP5koMR57wmi70y7ulhTqtJtNjGCUlW2ahYykNoTjaueiw
b/nN6nrnayfCg8YIh81xMas2Q81sANyy8a3JLwTj+0HqHBovOWI=
=wYWM
-----END PGP SIGNATURE-----

--TtAaL1I0tfYEZFLw--
