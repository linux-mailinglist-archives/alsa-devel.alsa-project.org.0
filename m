Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC03B8765
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 19:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BE2A1662;
	Wed, 30 Jun 2021 19:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BE2A1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625072879;
	bh=GQgwqkZPT6KFEYV0EkiRwdYi3d1A4TUAD0n/gBgAuLY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YkVzUZAY4DYzUbEKELUN9BruXHTVgeyQsw25zV+//DS2mUEX1ashLVlXiyhzt6lPC
	 bSI0dEg+nhL/HasY+UetNNb6KyK12bYptO+Hiaj4DJ+V36AdmZUfR7qPHDFJfxCYxN
	 KVkfVn1f5r2woC4zWQdbyfmG9qcYbxn+JPCqeYjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA08BF80240;
	Wed, 30 Jun 2021 19:06:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD3D4F80229; Wed, 30 Jun 2021 19:06:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46462F8020C
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 19:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46462F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KSMt8I1u"
Received: by mail-ej1-x629.google.com with SMTP id bu12so5511825ejb.0
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iu5sFxaU8kKRhqgad7LJpaKxFYK9+ER2NkvqoVrkaOo=;
 b=KSMt8I1uExsygoWSB7BZJN3CHxPdTUelyHJbPDwNCAN35W+EASXVhDdw8cArkq3MVK
 x474AcgafFrPwFXOi1zH/nb2/26IgZK0DAGGHDeD+FbfMumwTVMo5EAJB/IQATkSHYvS
 gx/AWfb8udKIdM+FiAhA9XCl23XRfHcAJdjNp4oMtNff7xRUjPTfv+i9l1ABRVIcfAUA
 UpitpOP9am2v6AaGUZ7xzsbZbbhcjog8tgAZdaowyTNGP4niC14EYw3uXQzEqkuqhcpB
 eFBBVzxSaN1mPrVqkwxseJAME2ipKQ4FRrNrVq3heaOMaNqIXgufKRTp8FdRkWcktpQF
 9APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iu5sFxaU8kKRhqgad7LJpaKxFYK9+ER2NkvqoVrkaOo=;
 b=I4aTnlZ0sAhmMaMF+vUtsT6ATbs/MCpFIHbxYOOBoF3NjYn38u9ErntU7PmvjVXNd/
 5n9RAfeK0FzIkb520vFitcPRWdAqG1m02M409oZg+899Uolm+81kTj2VgvMogWN70mDI
 Vm+WnHiNQ2uXacaNCorBIK+eer7obF1Xc5GJRA+BzTdm8IjsFnu8Km6rF6ITIUH3aAX9
 zhnLI4TBPuey7Aq1SMGTFBIhoM0zfRbMXMsfrzlEdO1hiopDfGmFO1l9kYPR5nZbindW
 0CHC79cjAK9UlIDj1qrAS4TBYGa51keuv/NyPZyOO78iFEhJLbebz0Tp/H2CzRCDGiQn
 tjDg==
X-Gm-Message-State: AOAM531ZP0Oujl2llvVgt5XygOn2t4zpykPcw51H+Gxnd8qx0CuSrbzI
 oO1c8AE6IAWq+NCfo4RJVg4=
X-Google-Smtp-Source: ABdhPJzPHcvZoSH13U/U3KmwMD1wXsgCXKEcsfuPmMyb3D4n2+6TttGKaQkbbcqU6wlm49/Sd7h5tg==
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr36601117ejw.46.1625072784981; 
 Wed, 30 Jun 2021 10:06:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r17sm13121834edt.33.2021.06.30.10.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:06:24 -0700 (PDT)
Date: Wed, 30 Jun 2021 19:08:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: (subset) [PATCH 0/2] arm64: tegra: Enable audio IOMMU support on
 Tegra194
Message-ID: <YNylGG9RaM72CY2i@orome.fritz.box>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
 <162506854659.43525.4480397285287043164.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AO3+dklKfp1RO0kr"
Content-Disposition: inline
In-Reply-To: <162506854659.43525.4480397285287043164.b4-ty@kernel.org>
User-Agent: Mutt/2.1 (4b100969) (2021-06-12)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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


--AO3+dklKfp1RO0kr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 05:10:33PM +0100, Mark Brown wrote:
> On Mon, 28 Jun 2021 20:11:16 +0200, Thierry Reding wrote:
> > This small series addresses a minor issue with how IOMMU support is
> > wired up on various Tegra generations. Currently the virtual "card"
> > device is used to allocate DMA memory for, but since that device does
> > not actually exist, the path to memory cannot be correctly described.
> >=20
> > To address this, this series moves to using the ADMAIF as the DMA device
> > for audio. This is a real device that can have a proper DMA mask set and
> > with which a stream ID can be associated with in the SMMU. The memory
> > accesses technically originate from the ADMA controller (that the ADMAIF
> > uses), but DMA channel are dynamically allocated at runtime while DMA
> > memory is allocated at driver load time, drivers won't have access to
> > the ADMA device yet.
> >=20
> > [...]
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>=20
> Thanks!
>=20
> [1/2] ASoC: tegra: Use ADMAIF component for DMA allocations
>       commit: e6b66edfef64698d4d9ed3847c95cdfab9bde579
>=20
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>=20
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>=20
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>=20
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

Hi Mark,

Looks like I was a bit quick on the trigger with this one. Turns out
this breaks audio on Tegra186 because we had already merged the patch
that adds the iommus property to the wrong device tree node, so the
damage had already been done and we're going to have to provide a
backwards-compatibility fallback.

I've got a v2 of this series that incorporates the fallback (which is
just a two-line addition, luckily) but I wanted to give it another spin
in our test farm to make sure it's safe this time.

Could you drop this patch from your queue at this time? I can send out
the updated patch once I'm convinced it isn't going to regress further.

Thanks and sorry for the noise,
Thierry

--AO3+dklKfp1RO0kr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDcpRUACgkQ3SOs138+
s6G/2Q//QRCtwKfF7z1icysAmOshgHtawZ9IN6XraxSRkuhgQH9GY7X1Ay+BNNkX
v35Wck8fhtiQuT+6o0YGf38wc7Uu7Y0oBJkaotbbEemGxtG4EgRj5ADXqNkpIC3y
Dd08lSVhPA3nonta3PVf4/Rwcp/WjwFr1UMMFpT2GMuTK1hMdj2Mg9T7IVShSvlt
JXG2on2ybxJjHeLQCzeov92NWmZvcrGml+btt/3Ys/jVwjxcW+ipu/Sgjt5PhXFg
6GQhxd5a1xKIjmAOv69rfBEAzl7Q5MU4T7OUtVM4hnzlFVN5R0+yKBujsXl23eEN
iQlyz1Lcf2jpNVsB6iJB0oegE6SMKAqbu3CJA+BykQTufLDdtgIafLffINx0V+Yc
RWoKPI1nHt2bAwqnt799ua2icqRcPnUb8VWB54CgpwLC6zKUZRh37ns/7lXlWKMY
q4/bey5eTkve1g9ze0jLdFR3a7wzlzrxxo84/6y2KsmfoOnjKc5JH3hjpbYaUYpG
ZQFRXWeFt4x+Ph+8tI/a/A/AfYPWOcvYQ36rWXNJQg/b8uV4jhfHozL+gmSHFxil
ZK5GAf+YLM9eipc3idcLVsocmMquWhgef6M4x/g6UxOCkyLePtE9S1F+IP2R85GW
06ABdIC4WA7v4/RqVQvttQ5gk7v5VynLtXazMGilT1PG3/Z0zxU=
=lSrp
-----END PGP SIGNATURE-----

--AO3+dklKfp1RO0kr--
