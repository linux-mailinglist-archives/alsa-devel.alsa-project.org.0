Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB42F2FB6
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:00:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95AFB16EB;
	Tue, 12 Jan 2021 13:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95AFB16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456410;
	bh=iU8urKKmAUoRddizHNQMmM4D1DiXy26zOMu7MLNPrpc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exq2c5bYuZzWcqoSdRZwMQpzmNnQyzRxBWLbtKVjXjPabX+o6gbV7rqERSmegZv6A
	 LgLvG8jdkTSB/3hI1iKT97IbQryuzkBs0FaO3rBxvPwzZpouVXI2YZzi4RHCcwT8oZ
	 Jcy/h7BqUWTWRwvJZ72JpHwoeuFFVVDlRgEA2BNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA3ADF804AA;
	Tue, 12 Jan 2021 13:58:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23B9FF80475; Tue, 12 Jan 2021 13:58:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8C25F8025E
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 13:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8C25F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="slCZ1s0n"
Received: by mail-io1-xd2b.google.com with SMTP id z5so3677286iob.11
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 04:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YafB9M+qZnE/nt5PVl5uoiIhZtLdagUggJ2HZtBPpoo=;
 b=slCZ1s0niVvQypVbz6PlWneerrA/X0C+iZjWZftfHUan8VIXBhN8ehLo/qgdsRFZJx
 ybWaaR6WLdsMs7sD7wGuw1P6NzvBoQx/lgR0TelTOekUkpcwWDjszTZDOk8KkifKQx0q
 yX0Gd4tzs8LqrCKfrLLReUcSRThmEeHGvye5GvBOxASEZNO2J+n78vQo68bVMYN1tDAs
 4xMGF8mVeLooTNV9jGaJD3Yp8V24Q2Q5t31V6QDa8RCr/dVSAOLGoc3Zqx/0qC54Bqzr
 NwQ4letDqwcRCLivmrimf1f7iM3c6AWOQoMBtUR/HmqGKw9JQr3MDwQzXfcPPnpglX5I
 Q5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YafB9M+qZnE/nt5PVl5uoiIhZtLdagUggJ2HZtBPpoo=;
 b=f6dlm+BVCXFA0nS07lWpBlsIU7mQsBUTXQVxV3H474OPV/eiaLlr7b0wixVi3RIRg/
 K4DHcQP69oJDXY0UeV5R01e3We8n1fB1FKZHvaXw4tArxHLlwRERNY9TMNAxeUWhleTr
 veceH9AuR3jKuMaFmsn1/SOCD0FdWZNhuNikBDZhBijI23qOAts3Ty4D7hE5M00sx3/B
 g62jEogx9O6yFQvCXSHAbmH+Espbr2OhQ3XBt9lQQFk+iGD4jYoFNI5hU8n62lMieark
 +Jk/604DJuotZNB1GPl3adb4BlcIgYyuN0fb5oiVODemge2HRjgBdHQz4Tul+2USw6E4
 tQPg==
X-Gm-Message-State: AOAM533+fYLFT4AXosgfd8dBuAIOpXDZ2vXKP58O8nwvX1NqfMmV9g5g
 FI8+XfPn0NxDaC5mx219zqs=
X-Google-Smtp-Source: ABdhPJywbjxLymotcPdnGX1DpYbIDcHERYl02nM8jXctCbtODKNlYwNeIxmbXGzxtI9IP7oPYtY32A==
X-Received: by 2002:a05:6e02:1a0c:: with SMTP id
 s12mr3918732ild.14.1610456312090; 
 Tue, 12 Jan 2021 04:58:32 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u8sm1864246iom.22.2021.01.12.04.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 04:58:30 -0800 (PST)
Date: Tue, 12 Jan 2021 13:58:28 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v2 1/2] clk: tegra30: Add hda clock default rates to
 clock driver
Message-ID: <X/2c9BiqgURAJWCa@ulmo>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <20210108135913.2421585-2-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x2yLJCQXx9a7mg5I"
Content-Disposition: inline
In-Reply-To: <20210108135913.2421585-2-pgwipeout@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Cc: alsa-devel@alsa-project.org, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Sameer Pujar <spujar@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
 Mohan Kumar <mkumard@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
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


--x2yLJCQXx9a7mg5I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 01:59:12PM +0000, Peter Geis wrote:
> Current implementation defaults the hda clocks to clk_m. This causes hda
> to run too slow to operate correctly. Fix this by defaulting to pll_p and
> setting the frequency to the correct rate.
>=20
> This matches upstream t124 and downstream t30.
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--x2yLJCQXx9a7mg5I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/9nPQACgkQ3SOs138+
s6FBPg/9EWWt+2cctRc+UkfJQ3+RYU8Wa7yl7XGS885r3BmnOC87IdRB0/sdjlAc
SUHqd2YbuCfOnfHmC9u5uKXlQTKKffNQSgE4QFM+81tXAU5E3RShLqsTAlYylOJb
COXR1sOfBFas9jYQ714tLnfvc10YLYdEzKYBVRXMu2g9u4sN4fWo+cUGR7cklBaB
WbZlRlzcRx7VUmcfwt2DGQzisg1CdyPat9OcQFwZAFT60Laa0zOYsiSRDTAD/JVj
5XxRJQb52tjEw3pRBfOsVBs7R4W2aY+SDrXTlcGSRonbMi2Tx0DhzyEniVafdDOw
u4cMVfqmsC6c9o2RjQmmzFdbDlsYJFS0dU2S4Zc2W3MarCrmEeI98qGMj4dRyV7H
9RjrwQ++sEtvdSwsRHIrn7dIDr4/F2tjSSXfV8g2BxChnqFtVh/c9jg5ZDNwXAto
25ejdqF2PlCnqLi+v3RpBzkSsoC+d1bTcGjJ9o2jBSHvwjjI3qWb9EMpEb4uuZ8O
1MYFNCANnx1Xw+1GMmUfYKBiiajrnPbFME/8Cbb3oeI3s9Yjit2jhR6Kl87k6bfN
OOW7RcO+Ljv57Ta+XYDVIg6aTsmcr9gXC48XYbnSkPeWmarbSNIawdIQvPemjDmu
vLB1K5a3KfO7hwe5iw44yoi7bdqcUS5shDov/SAheN/cavRE6iI=
=kKkO
-----END PGP SIGNATURE-----

--x2yLJCQXx9a7mg5I--
