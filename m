Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B98B34C406
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 08:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE9141607;
	Mon, 29 Mar 2021 08:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE9141607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617000672;
	bh=rAhydRZT+vNpUPs88belNvMrn69GvEjkeVG+rjmHUq8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IoJPM1i/lXOfBytSqOAFTSmrqxte0jRFPi8taVlPlTCXvzxFtlSP69XpYnQ//lmWF
	 mVpiP7NJqAtUN/aEWLpPLXUKPXq4h7P7eSgcxA51ys0EVV3CaR0rI5iLmC7EN2qt4E
	 1fG/5/uuvT2h5UohzGZ8a5SNK/stJ9qUCEaduZl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B0CF800DD;
	Mon, 29 Mar 2021 08:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28806F8015A; Mon, 29 Mar 2021 08:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 105A5F800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 08:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105A5F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ew+I8Zx3"
Received: by mail-ed1-x52c.google.com with SMTP id y6so13003169eds.1
 for <alsa-devel@alsa-project.org>; Sun, 28 Mar 2021 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dvJrD38+Gd0ZZfT3SZAwY+e98dco9w+l9AERMmUkun4=;
 b=ew+I8Zx3kLnvSgMLoTHkAJaNu+rvPBxtmPFiLXJz1lS4Tx+N+rBMis1LTjcK9rRx7n
 2/Tav3DObTgXUf7PbtOWdAgB4s/F1Ie76PLgsyQ1HYFIUWAoviKOYes6dmy/GE0agGyh
 +1SicMn1MhsCW4Q/8Nfpj+YyExvb1w8F9jKEQPgdqplos5pV3py7PWTEyJ6l3TogDnhX
 NLp2uq5CavP+ukvEg73Z3axM8efl3Q4z1xbDKp17XSnuOKnrqFLcX+YgYMIiNyoup293
 6NEm7YDoEdCXL4N2fSNioyFawWwE5gXGKqnCm0V/RgX9XHg4wI4tQi6Go4Kos+xcrih1
 k7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dvJrD38+Gd0ZZfT3SZAwY+e98dco9w+l9AERMmUkun4=;
 b=TX7J4XnFXjE7SvOANVmQ8DSWIjGayxeHpT7xhj8yMa+eJCWbVtu/0VokC8/L8NvUZ0
 5zItVQx+PS2QApFWaGO1domIzGRosLs6jIUob5rqlBPDv9VQG1B/kMejlzZzfp5T56Z6
 wFNCyG9B8YUajUYOT+cdGukzSDl17OjL6idSDoBAaqErLKTIpVi9SdJtteO5aszUxLd2
 5PCZY8ta2NCO5pgorvLSMZ4HGwAd1FxMN0QGHym2Mjqm+QTqPGXVo/+ChR4Awiz9tbiz
 AMluQBJZMmkXburmAAaOQmByJmWcQnX+zz+GH6Z1Mz/j0lqhfVQ12cwWVVi66x/Kptrv
 3ARQ==
X-Gm-Message-State: AOAM531fI+6gRCnBqwauqGyictUi6tcQG5TjgmKhi+bFC+MrZwahAhdZ
 yP0HLhVH2t0s7qpPudj03VI=
X-Google-Smtp-Source: ABdhPJydy6eDabhN/L6gwqCNv1MYhFf0/Yc5thGJOO9FABN3b0uIVZgU/ie3tTad8ORQ3j1ow6MYgg==
X-Received: by 2002:aa7:cb90:: with SMTP id r16mr27693945edt.139.1617000573716; 
 Sun, 28 Mar 2021 23:49:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id eo22sm7682061ejc.0.2021.03.28.23.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 23:49:32 -0700 (PDT)
Date: Mon, 29 Mar 2021 08:49:57 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: nvidia,tegra210-ahub: Add missing
 child nodes
Message-ID: <YGF4laeEP3v7bP9X@orome.fritz.box>
References: <20210326195003.3756394-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ijQsMv6nekEBJq7o"
Content-Disposition: inline
In-Reply-To: <20210326195003.3756394-1-robh@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
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


--ijQsMv6nekEBJq7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 01:50:03PM -0600, Rob Herring wrote:
> The nvidia,tegra210-ahub binding is missing schema for child nodes. This
> results in warnings if 'additionalProperties: false' is set (or when the
> tools implement 'unevaluatedProperties' support). Add the child nodes
> and reference their schema if one exists.
>=20
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Also add 'dspk' child node
>=20
> This patch ideally should be applied before this series[1].
>=20
> [1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
> ---
>  .../bindings/sound/nvidia,tegra210-ahub.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--ijQsMv6nekEBJq7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBheJMACgkQ3SOs138+
s6GRJA//SwwwKllKwUX2o66Qc7knEWeus1NCiU3TvglA4jxSC+pf74q4wyOIWu3y
T/LTXQBUaDsagPelNfETPnOJbdMbUjpNwHFSy3tsMbmP9LDC9caNOhLHgx5EICdq
j//Ni9BhTN/GtLQup6XKKoE20g2Z+L9chB/8rh6lIBY98TTImJn5e/dZzEnhs00+
oIWn7jhIQLGyICN5K3RBbtLaB4gBlIZExABmYOXCRL9Or6ku1KjrNpVFIGlRIn0Z
FiaxFLJpDGAXITI+M8xVDFg6nEY2k0/iXLTC/dncmuWR7oyIJ3Z0eNB4vos3LNA6
b9Cchxrx5bkOoGErHtROtPdmuvwFFKwlM1SR782EkuVDUHinVmyndTlF5ax9q/2c
LK8T8/XPwr8V7Ip2EUxKcnotAsm3YK5KXma2O4pIxHdnFsgnMC4Rcz6WTQCsd1GV
aMIqtS/7rZb/CyxiHsuJ8BdUWxgl5hT588cGKbVaNWpgGDYdIGpvHwbShnnGb6Ow
P5O9EeBy93UxjrY5pZVWmBCOEPLuW1fSOhuGc9mYetjy4nJylBy9yDGkPQ6FxlgK
a2eGJqEx199Gq7TwCpLZcv87mW6Njm4DqJJ4Cu2yp09ig/0uzIfE67RUVKqnVjSi
DLBMBmqxdPzdjXYAfT7BXy/9TTcUKWR6wmh/LFZhALywMF+uT1Y=
=znco
-----END PGP SIGNATURE-----

--ijQsMv6nekEBJq7o--
