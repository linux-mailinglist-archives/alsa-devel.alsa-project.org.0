Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB73D477597
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:17:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A5F82056;
	Thu, 16 Dec 2021 16:16:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A5F82056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639667837;
	bh=7Czf00YTtYaiAdQR9r6e/NgMtQEV4sdUKGt6kBwHHZw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwwta9A4HkoV9Ecb6mlzWow4V5hkU6MXYpMfMQHfj3hU/bBhRugKgClpDdlbvnevV
	 3IHAc65qjWs4/ozTdB3XnwgMp8KZoNCsPu7YRXhwWyZ0TxWSyI+ql606GF11mUqCWa
	 SJdLQyF+c+rZmPlaNOSVi51FfBdSWifR3bFMbvPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F298F8027C;
	Thu, 16 Dec 2021 16:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20D3BF8025D; Thu, 16 Dec 2021 16:15:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D0B6F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D0B6F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K02jPVe6"
Received: by mail-wr1-x433.google.com with SMTP id u17so44835649wrt.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7wfg2/f35dLEMNUi0braWFcvM9LG6JIBQ4wa0N2N+9Q=;
 b=K02jPVe6FfJPLsLfOx6aLSp6p2GvtVyyz7N6wDtzqIwXsRCI4cTDLOe3AKp/5WWZ9g
 sa+qFEoZ3X2OCvjCH4yFnmUGwx5VQOjbev+QAKRnZUMDQcVfYWE2/yLAzske3Jr4Id5A
 SKidD2w+NPbkRjjo7K2D+Bx8A9tJl/jFxUABwzf/HbgUSInjC40geoKXb4UmyeJrkJMT
 97XSUhRI2rjVTebRnT6+dh5GvtcMvepH3YeRMrGljKYUG9YXfTRfIX0NHDA6F/4XJvEi
 hblnDIJzfcFP9Gssy37L4EB/WzIcSXrDZWLJ3iTgUAUDsEgCKhJfnOh8wHEsuIn3WDkX
 /kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7wfg2/f35dLEMNUi0braWFcvM9LG6JIBQ4wa0N2N+9Q=;
 b=XXarHSYdYFa7IEdzv1xZSiglHbkgKZb62lf9yXO+h6KqnZ47soiCL8E7X1nEHP0n03
 kiuqGyE2DSKuXVEHtoZo7wvbo4+PBaJixjlyNAVD8MW2156FzUIHen8r/Ms2srNczD4C
 ytqZ2/ZUK/j3CWDApKSTH5bMzl9X+9j0m3FC5DEnSQia9elm5NMFuo5IEhAHfnCkWP6x
 LEHgO5C+hPwMU4VvNQthvKAc8TowoSE+Pj1nuXBgQ4QMSo4woYJK8WLpQVWhKnyvHw16
 GtwlfaWqyou1LyYfKfpYQVwZlCn+qqUZ4H12HjAbG/cNcnqSQPujRw3OcAN8g6h6MifV
 bIsw==
X-Gm-Message-State: AOAM531GM1Pko/0tHhp2vdDQA0ZJeTa4PoS8VtaUlG8WzLZqzGuLX7Q2
 U3dYEkO7sKN6llvutEqRn5c=
X-Google-Smtp-Source: ABdhPJxIjZcHYAgIzHJzFSWBtF2xpwNn98/7KzUbICH6lYJeYtkqC0HoC7Z9nFPbaR5XJD+omsmD6Q==
X-Received: by 2002:a05:6000:18a8:: with SMTP id
 b8mr9330098wri.166.1639667736757; 
 Thu, 16 Dec 2021 07:15:36 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id n8sm3760461wri.47.2021.12.16.07.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:15:34 -0800 (PST)
Date: Thu, 16 Dec 2021 16:15:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 05/22] ASoC: tegra20: spdif: Set FIFO trigger level
Message-ID: <YbtYEml9OwaiO5IC@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2AOAozvC3BJfdqc4"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-6-digetx@gmail.com>
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


--2AOAozvC3BJfdqc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:08PM +0300, Dmitry Osipenko wrote:
> FIFO trigger level must be not less than the size of DMA burst, otherwise

"must be bigger than or equal to"?

> audio will be played x4 faster that it should be because part of the DMA

"faster than"

> data will be dropped on FIFO input buffer overflow.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Makes sense:

Acked-by: Thierry Reding <treding@nvidia.com>

--2AOAozvC3BJfdqc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WBAACgkQ3SOs138+
s6ESDA/8DbIeZESt+My1mOIlSYpY4fVQpZkFchjl7VTpEtVebjXYgEHv4vGjmjY/
OGd6DleF7MQc8GDZXXpTUgHXu6N3wR07FAPLv+2hwOy+ikYbSkvEcPRouU9bqXPP
q0YaU7Uk4Rap6tXZt5Hftj4s1bCaDY7IpLx+24RMJT2s8OJtgSnlqe1YOAiXyEBk
UZxAJztbek7OXcellOsfMj0ZctB68jS7cOt2/hQ/0W+q6hkwksORs2XbD69wDDsR
ffq4z7CoZhxtZe9dxxphzXb8UaRr+40QmIRmtGFXS986geXAybN37lh7WZvC+Q4E
FmQFh1xIdUqbGYdJfOCCsUnxdG1Fcp0+vuiJbRfWWgrKPQYvbSz1pyMyOFTgFxXH
GcBz20DGnj2X86pvObeTVeLJqz3s9joZwbzhTTgL6osmUp3urxyl7A4jhKVK6vYZ
lvUTBjpp9N7kKQ4HvKy3lc/mj3dt84Gn+Zxna1nw6MLlvwPp/81aUBq82sqISfiv
iX87GcjYWzna2P61nKCX0GvLDs3NIbvPPQeBJ+TCYYhnVuNphbgFNa7Br1eJH3PD
I7xZBuSgcMLy4LPatILEZHWk2fYrrX3Oa6kK4XbBiM+Cuux5orZ4VtDtWUtTxEX/
dT2QwTi4s7PLXBGNYeA55d1mVvcKhIMicExH/ZQam5cdA+zHQYw=
=Wn5s
-----END PGP SIGNATURE-----

--2AOAozvC3BJfdqc4--
