Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B5477600
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EAA92803;
	Thu, 16 Dec 2021 16:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EAA92803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639668747;
	bh=O0FvV42xoEVjtR1qbkZ2r7Ie951RAs2wc/oB6NLwYkg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdjzF6vytkLoMvXCnOvmDI1YAQiQXK4Torme5sRUxMN/P+LEizp9l42pbCMAhSkD8
	 mFrd9+Ug63P13cgD7qcNH/USYmGRkGBqPN77DE14pccTDlL4Ehaf1OHgNhcYAdwBqA
	 hhv8KRPYCzoanXEmqeFR7U5Rt/uhvqBO9PzHVFwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6983BF8025D;
	Thu, 16 Dec 2021 16:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDD9DF8016E; Thu, 16 Dec 2021 16:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24FE7F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24FE7F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OI/lA3kV"
Received: by mail-wr1-x434.google.com with SMTP id u17so44919697wrt.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sts3JGyfN1WuKgg88vZXBQQlHHEJeYISoHb+lIrYjpI=;
 b=OI/lA3kVbaJDD/afsQSi+J36E2JqDxVXvOowE3TBOFNTrX1O3LczxrTihQ1jr6Ux6f
 ovaLEraU36ANee/qN+2S8S2u/FdMucEzq/hFYUrnE5bdNBZUd2/3iL9s9yR8moc3CZMU
 Ag5+NZCv2EM7gw8WWiN98BkkFWIS5jCXHKWRcq8FrmRoZ5HDS0i5wSh3wcN+ZOwrtWWO
 O7YH0NPO0KSE+LDkUNWT/cRYfL/tKOdqbASlL9LB5xUnPbcqkw5Qjxu+maa3lETPxwPK
 Nnz1cAva20b7kryGV92hhutdsvoEydLKblUacrE1FntjJzhyX0BXb0uozsSWZ4q3IKDQ
 psfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sts3JGyfN1WuKgg88vZXBQQlHHEJeYISoHb+lIrYjpI=;
 b=BOSkzjXeVwesOY+ZA1bZjgOuGKsSUvXst0cj/dM3CgWl2AXfnquHD1TNOk4E6SIWuj
 wZsZnwhns40Q1emI3vGZVjbaxK5X1j/9oSk8oqirrF1i3+FhrtN99v1uTBYBCAXPbarb
 Os+P4dxEDYJwRZz0ucg7d0oiKHKH0vRaUaUiPUu5FZhdchjYoaknVeus0hMUXCi1pVnI
 e6eArd2jYhlP1V0VTRazGj5Zw/U+rYspCozaljRqCH7OFRqThgWuAlbj+Re19i6nPqcd
 IWUWZttXfrGyNgwuYso55j7DxxZ8URe7APkNvQI4ki1dQ7DyKybxsOPs2t3CpgrsBbEY
 OOkg==
X-Gm-Message-State: AOAM533OquW+bGorOcg+cRE6RzkX+Ol5KsJYu1SbZeExfdq/msVPQaCY
 16B/IqXvxeDyvnzrU5Tjdd0=
X-Google-Smtp-Source: ABdhPJx1GRSUJgkEQM02MsqnuDNU/r4aWmqUaySJJcyuR/EPQN8tAfIjZJbeWsV+oiDXQvB/S//viQ==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr7296693wrq.460.1639668684641; 
 Thu, 16 Dec 2021 07:31:24 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id d2sm1204462wrw.26.2021.12.16.07.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:31:23 -0800 (PST)
Date: Thu, 16 Dec 2021 16:31:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 13/22] ASoC: tegra20: i2s: Filter out unsupported rates
Message-ID: <Ybtbx8gQJaSsOjGM@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S1udWQXOrWShk0yg"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-14-digetx@gmail.com>
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


--S1udWQXOrWShk0yg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:16PM +0300, Dmitry Osipenko wrote:
> Support new nvidia,fixed-parent-rate device-tree property which instructs
> I2S that board wants parent clock rate to stay at a fixed rate. This allo=
ws
> to play audio over S/PDIF and I2S simultaneously. The root of the problem
> is that audio components on Tegra share the same audio PLL, and thus, only
> a subset of rates can be supported if we want to play audio simultaneousl=
y.
> Filter out audio rates that don't match parent clock rate if device-tree
> has the nvidia,fixed-parent-rate property.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_i2s.c | 49 +++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--S1udWQXOrWShk0yg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7W8cACgkQ3SOs138+
s6HSMxAAwX26l+Dg3mv4WaTtS1H3RdqOzt4vyKt0XKp31P44er319zd2Zg254d+i
TawtYdaIqqfVp0nnU21mXGkCdKeI3PYuKMAIkwxr/oqKEz0DXJ3x75+MqGDkX1Xb
CI8kio5xGDi/8WDUmEaItKjlQtysVAS+cqxVpJ6sQ2dCuG03laCvX/P7y/41nYDE
8cVJwGIUu4e7yQ2E9yi2kJqvOfFn/NyA4tyPjAYpFLRI0LiaHioczQNKGkhr3Ecm
FA71vbV3hF/pJ2ygRzKbHKu/9PE08xKkOl6pWgFJSkJ8LGXZjGs5Kx4f0V97r/hK
BrKqrPgG06GCrbI8q4UjGh18GKe4tt1Cu7cX6ak+t6s4tqvIVF45dHFPlHnltpFD
E4x83Tp0qJdcsAOEI8HdnvcIeCKXH9Pz5f+ekHaAVrify7kb+He2L+7b8GzEYwPz
zx5pG+3XisWQog3Ir9UJn4S9SxzLG66SQRVV0tChf6HRbBHp2GqnlmzlJk4nh69+
pCdGvwBd+JGXiuW0EEkh4eGdhYvN7rC9B9gTIJXBGtvEW7qRApHzMtSs8+LQJtat
apPcE2u1SQIL3QWH8SMNZjdkYOIM4CTkrLK2WotRkJajW5mmt7NZJMEfkSjGiOzL
eNMAkyoaWEU/Ne3yVSXk5P1nIvrecBIJnQMYh/fpb8tyFzgPDVo=
=8pKh
-----END PGP SIGNATURE-----

--S1udWQXOrWShk0yg--
