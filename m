Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9BC4B8B5F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 15:24:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD43B193B;
	Wed, 16 Feb 2022 15:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD43B193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645021482;
	bh=Cz6t+KNqb/a9PifgTzPgoxSkSJvHfKydrx5JXq3h+Y8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRy12ULrK8uZwUNhck8YjcmRxvIQLzb6OweLw2JaV3fTs/xZWOUuo4shmeUMAFBlW
	 TEiL4vfqZwU2NXv9LhbaEWgth7vUKzvufsa4ml5YTOJR5uLpse32fRncHFUTDR8p7t
	 eLKQkv+EwEgde9awhwi9Mm+57XxX9NpfKk2mTCyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EF29F80118;
	Wed, 16 Feb 2022 15:23:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAA93F80128; Wed, 16 Feb 2022 15:23:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40877F80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 15:23:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40877F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lM7kOT9I"
Received: by mail-lf1-x132.google.com with SMTP id e5so4107803lfr.9
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 06:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=va/yWTy9MrRSSdtZcieKKV2PhylVY4vI/a5Ddx5B+oU=;
 b=lM7kOT9InRBydE6wj3ozrEtILhkUXKE0lRwyZfwgVo0OE/7OXKVw/b4fE20H782RkQ
 vVFOPqY1UizuWCzYR2/nebNYI5nxSpXh+LET0j2L9i+Imfv8uCx6KM6NBwUWhLkRbvp3
 L3eYchz4fSa9N/CJ28phJ/9xRBxRVRvQUix6vKBVr7iowJS4yrn79a0rdWXhmjb+IFt6
 mfDeUb+5VpJgMfUW1ahMwkUvlu0MBFNn9O5+9favxP1ttxoON4/ujSgw+IJ90zlj6N+j
 XcKHVoqjp1ofl3L/ZPNyMEfULiyJ7jTMK4bNFwDANpC1iZSNSzc2SaczvhDhldXryhFH
 q28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=va/yWTy9MrRSSdtZcieKKV2PhylVY4vI/a5Ddx5B+oU=;
 b=TewPpFtq8sSU2F1c+OwYgktvhtsOiXF+yQVQM8NK0xUVu6Rxucp08XG5WYwVUYx1qi
 cTVnZ6O8A2amqfGqPxVXDQwK/LUpinnhRLKScMRQ+Hy9CkIyuhuO5R32UOnGMht1Hdi4
 nsg2MUYqHbMdEWNF0dSxF/WY97EBnXaNy6aY5HIRYfKzgQUamqOfY/64UI14OamsyLUv
 VyBOC3b/+lj9Ntihqqy7BTzrhxYOdGkLDxUd/K8TD1Ol/pFOI5YKTeQma+DETvV+OMNi
 /WUKt/P5br/4tGv2hv2TG61qum4/rR9D7GIafJX13D8VJXrNS0Kk84EGj2cl3DhZZ4oZ
 ghzw==
X-Gm-Message-State: AOAM533oNiL0dcwjNVB00a3V4WbbwqcWSwmX677u2hCQEllMz7LV5vfp
 ixZ5yD8Um39R11Ji9Jw9ikk=
X-Google-Smtp-Source: ABdhPJxvhWFbRVVGJ1Sq8mFAIA7VycYW4svgIQxOm7tAeOrNQS/KdIxux7uuPOhFeYxqpbqlDIld3Q==
X-Received: by 2002:a05:6512:12c3:b0:42b:461e:36a0 with SMTP id
 p3-20020a05651212c300b0042b461e36a0mr2309960lfg.462.1645021410687; 
 Wed, 16 Feb 2022 06:23:30 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id z9sm1250518lja.53.2022.02.16.06.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 06:23:29 -0800 (PST)
Date: Wed, 16 Feb 2022 15:23:27 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 0/6] Add Tegra234 HDA support
Message-ID: <Yg0I312RA5gh1Rra@orome>
References: <20220210065057.13555-1-mkumard@nvidia.com>
 <s5hmtiscl65.wl-tiwai@suse.de> <s5hk0dwckza.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WpdOLmAFG2mpJZKT"
Content-Disposition: inline
In-Reply-To: <s5hk0dwckza.wl-tiwai@suse.de>
User-Agent: Mutt/2.2 (7160e05a) (2022-02-12)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, spujar@nvidia.com,
 tiwai@suse.com, robh+dt@kernel.org, jonathanh@nvidia.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>
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


--WpdOLmAFG2mpJZKT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 02:34:01PM +0100, Takashi Iwai wrote:
> On Tue, 15 Feb 2022 14:29:54 +0100,
> Takashi Iwai wrote:
> >=20
> > On Thu, 10 Feb 2022 07:50:51 +0100,
> > Mohan Kumar wrote:
> > >=20
> > > This series add the support for TEGRA234 HDA driver support
> > >=20
> > > Mohan Kumar (6):
> > >   ALSA: hda/tegra: Add Tegra234 hda driver support
> > >   ALSA: hda/tegra: Hardcode GCAP ISS value on T234
> > >   ALSA: hda/tegra: Update scratch reg. communication
> > >   dt-bindings: Add HDA support for Tegra234
> > >   dt-bindings: Document Tegra234 HDA support
> > >   arm64: tegra: Add hda dts node for Tegra234
> >=20
> > Applied all six patches to for-next branch now.
>=20
> ... and now I realized that it's conflicting with the latest Tegra234
> reset stuff on linux-next.
>=20
> Maybe better to split the patches to be merged through several trees?

It's usually best for me to pick up at least the DT changes (patch 6)
into the Tegra tree, that way I can easily resolve conflicts there when
they arise.

The device tree bindings (patches 3 & 4) traditionally go along with
the driver changes, though.

If you prefer the patch series to be split, that's fine. For other
subsystems we usually deal with this by having one series and then the
subsystem maintainer picking up all the non-DT changes and I take the
rest.

Thierry

--WpdOLmAFG2mpJZKT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmINCNwACgkQ3SOs138+
s6EXuw/9F6JKANiIO2CI2JqhaJ2UxIofJCAM5RgH9vFvU5emWUcF9WDUvAx6C967
rd5ThJkit9WTy+Am+40xvky1siWsoQ3K3VfNI2oH6ZqTmM7aE62DF7eqUcz7Cwp/
k+09/jx+ESF9Pvrirk06EtPsKpz2nJmvqNEoZ4/81mAkyZBYK9lHp7GPUpYusxfq
t7bq9ru4sOyV/PA6sPeellMCmr5OBhoIs/GH4R0P0WimCG5+KP9rPQSGHX6ec3XL
WB4vQLAyHU+2kyuCq+Y4JQeprlkrIS1oeke8En7uRsH7gTOvdjonwZ5M2ttvOC6r
Vj3Sky6S+IirTA42LAVoPweJy4ZtygB7yeTc1xwO0vGBD0SlLocCmNmlvagbF/eK
ERlMgwT2XinPvtsJav0hrxB3yDN4qnkbUaK7GB+ixoiZ97HKhEqknAI9nA3QLjV0
Klgqr+HRURMYdOhUgQ+fUbV8yqcTidI+tjz1N9XTvhudlM9/jYTx1Y81WhPejqt+
NAV4PFWmn1iFaKDtlxl9owqkOmaaiwNiy/e6CCUIb7uF3t/ro0gayrW55gutW704
BT59C8XFocHSE8WO+6Ak7tADGUxgWZDw+evIXpkEPODEmI+AlSRMQrw//L0c7Xqe
bYqQyKtukPxQ6glL9fueg6OIFy/xQYxysXxMmk+1e0nRFHmyx48=
=tDWF
-----END PGP SIGNATURE-----

--WpdOLmAFG2mpJZKT--
