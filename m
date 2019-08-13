Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 077198C16D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 21:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC78A168F;
	Tue, 13 Aug 2019 21:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC78A168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565724064;
	bh=ojGhYFbzYJ0bXSn0r4bJwtIdsb5ZVwDfjFgcESrLtCw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPx5G2LwDewAy3DdDT0WL1Zua66IuF3Fj7W8dK2m1ltfM7mr9e3KV3qoFPH84xqYk
	 4XA+pR6X3X3d/m1WabyRid8gnfEMma6RBH8r0pX+gmi//gd09MNCLkadyPDCuhwawv
	 RdVXebI9yTSA3WkaJo0f1znKB35uoAikHNipiLN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E19AF8049A;
	Tue, 13 Aug 2019 21:20:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C17CDF80290; Tue, 13 Aug 2019 21:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3599F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 21:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3599F80120
Received: by mail-wm1-f98.google.com with SMTP id m125so2397311wmm.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 12:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kdNXJ8hZlcNjicps4RuD0AxoaO5Tr3w7XkkUVNHMbRc=;
 b=enTmZ/qshxYXPjv7W7tbXf3gKoMseGDNMhSgiocAtf+a1zxvQBu5msZmW7YEjiBwQ/
 l3OwQ6qK7yGCAely7nwTsomy5D0uFH/JwKa4aKnROkarguKsAuVozFTw9ZDHbcw0HtPZ
 rcPkC5GTEua8cQ6AsTv4SyDY06TPDX0sNOUl8gY+qMRihdZ8jq4E9wZL/M3F3cBItYNC
 d1E8Y8d21G09oDkB0mKD/x6ko+6WXJ0vX5XMTCNj4Yq88Lq9x61No2J1xtIBb4eOSvEB
 ZuSwYHWQAGiOYu9wOx6JozLhZFsG3SZPezwJLgH1V6n0Cre9ueRuGRV8uI26cMU/r0Nm
 JOXg==
X-Gm-Message-State: APjAAAWzBFOcHw9p7516IJDALSdw/dQOc/iUSNcZFzeL287GaOn3YGFe
 zTAuXr1816W92Ml7WO723ec3fRsJB8w2tHCRFgePJ9eAZzmeNsjEXkGWFF0UBPqYwQ==
X-Google-Smtp-Source: APXvYqxDXmnQpbTfnKHxwWKEHiAnm5HDPFf0Na5cPMw/tFx5BP6wBOsl5jdt0xMls7c23haoHM3VhwNlwb22
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr4601088wmj.62.1565723996474;
 Tue, 13 Aug 2019 12:19:56 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id q2sm1473920wre.51.2019.08.13.12.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 12:19:56 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxcKq-0000z7-1L; Tue, 13 Aug 2019 19:19:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 659F92742B44; Tue, 13 Aug 2019 20:19:55 +0100 (BST)
Date: Tue, 13 Aug 2019 20:19:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190813191955.GJ5093@sirena.co.uk>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <95c517ab-7c63-5d13-a03a-1db01812bb69@intel.com>
 <71fb21d0-3083-e590-db83-dbe489a4357e@linaro.org>
 <34a1a317-ac6b-bb1e-6b1b-08209f0d1923@intel.com>
MIME-Version: 1.0
In-Reply-To: <34a1a317-ac6b-bb1e-6b1b-08209f0d1923@intel.com>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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
Content-Type: multipart/mixed; boundary="===============8579676379919693659=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8579676379919693659==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Content-Disposition: inline


--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 07:29:50PM +0200, Cezary Rojewski wrote:
> On 2019-08-13 18:52, Srinivas Kandagatla wrote:
> > On 13/08/2019 17:03, Cezary Rojewski wrote:
> > > On 2019-08-13 10:35, Srinivas Kandagatla wrote:

> > > > +=A0=A0=A0 if (dai->driver->ops->get_sdw_stream)
> > > > +=A0=A0=A0=A0=A0=A0=A0 return dai->driver->ops->get_sdw_stream(dai,=
 direction);
> > > > +=A0=A0=A0 else
> > > > +=A0=A0=A0=A0=A0=A0=A0 return ERR_PTR(-ENOTSUPP);

> > > Drop redundant else.

> > Not all the dai drivers would implement this function, I guess else is
> > not redundant here!

> Eh. By that I meant dropping "else" keyword and reducing indentation for
> "return ERR_PTR(-ENOTSUPP);"

The above is the idiom used throughout the rest of the file.

--fmEUq8M7S0s+Fl0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1TDVoACgkQJNaLcl1U
h9Bc/Qf+N4icKyyTDGlB5i1IOi6wDoQsSE1SgcAlrHFKoE0fOmNhKrhSQvskWPhS
4k6/x6JLxBu8CH9ZJAq8njVhSJ6BdfPkPM7H6Nd0tA29DaUCwHR4IDeZ9iIuAMOi
pX+z060wwGKdMbQUbYMOR4P1eLL1LYlxVZx1zWjXSxsDoYQYvhg8lMkeNDc6xLFI
smVcoYd0fRYsLRZtZXfSRQORdKdlYh34z7uLXkSTQpQIJtLH3Okb3U6pdOhkD1fu
steqUnEf89sHiHNuXZ506xZP8iUlLK13pzSfizTyI/Zl6Qp9PrQuMtN3KW5P2ZBT
kdXtRZSolgTjhJT5CgVHQUA8yneXgQ==
=vuyE
-----END PGP SIGNATURE-----

--fmEUq8M7S0s+Fl0V--

--===============8579676379919693659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8579676379919693659==--
