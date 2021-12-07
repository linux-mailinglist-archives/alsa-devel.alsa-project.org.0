Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D846B595
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 09:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6885D23C4;
	Tue,  7 Dec 2021 09:19:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6885D23C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638865190;
	bh=c2nadOKM++kPJlWDT9GiraKTbebtc4kASxnP3/J8zWA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=No2ZOQ5tRhX7/WZyoJt7GlKqJofbwVKmtt4KybE38nL0uqcSjrJIwCHCXlxM6ZhxV
	 9Hbi/P5Lwy6671/BHmH/U2CDDJBtYFcRYXVld51cUqoz6A5ppqojno8MOM7c2WbOXm
	 mSURa9oifV4lUyo5i5OcBCEvYZqwWeqtLSpUxK+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA06F80217;
	Tue,  7 Dec 2021 09:18:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDBDCF8028D; Tue,  7 Dec 2021 09:18:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1EA6F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 09:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1EA6F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DJ/MU62L"
Received: by mail-wr1-x436.google.com with SMTP id t9so27725536wrx.7
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 00:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kRxFMkke8kPsT6dq9wGTXaXiuVZPZaBpHvXxKIHkW/E=;
 b=DJ/MU62Lho87CUKKXZOHyB/XjVG+kqXFCbwpqjKPOgLADuaLk3ZHR/jAQIT1xdea0t
 Hm6JijaouJ7A715fyom/jDb1RVq4bsOpjRfcYK106KlfN2XA33C70AVr1g6vT+2tIe1m
 6K8juYvMAAo/TX3imczXbhuRNNGN/c8j4QF9ZvDKMylQocMacpkCJzx08XyxSvtNovrP
 dd3J/X3CzhHbFsIqdQRzKEa4XHQud07VWVodbuOzwQmQRTj4DUQ8FnzuepBA2raVq+Gj
 EKfyJkoLDYN5B1ZpGuMtcjeWf3JYvBQ5iZcvXbF03JWqBAa3zb+mlPbf70CJS1rTBbqS
 LqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kRxFMkke8kPsT6dq9wGTXaXiuVZPZaBpHvXxKIHkW/E=;
 b=fzRW2utannMTsP4TTUI7wYVCsDCBz1OyVc8dIDraDiTyOhhstB6GJquVqEtsNEgF2a
 SwqXjT7NQcp3qi4ezFZQQLgEAvm5Ct7WF75y1bdvY1Cj/drZqO+ZdzEwSjd2udsGS3SH
 0EHBAg6kODZrYQYIhFjYeR+oerhxdhvUk2emxGDSJGdcD+L5oA3dwjgrn1JjezLExcr4
 DEpEBnjvfMsLJDcu/e/K70HWkykIgSRBFAmL+5XdHHv0K298WmPvUV4oPlcS8dsDFG5z
 cITjvVvLl+OoNyGZNJ8/5ZF2bzR8HjjQP3rm97rjQ81qPcw8OGdKPneudcm2c5q2v8HC
 MFFQ==
X-Gm-Message-State: AOAM531NBgPx695VfHoSz7k75DvOxPTAXo/xfENINelbdKjGLtE8wxcr
 lxYRaQQe0a53WO61RIMZ5QhOriXal7Hztg==
X-Google-Smtp-Source: ABdhPJy59QXG+VmaUQsLuNuwkqRjLh3Sjkyua7qwDgZMn0fBXE18S12L376YblPkWtxW0V4lyH7qlw==
X-Received: by 2002:a5d:6a47:: with SMTP id t7mr51218114wrw.367.1638865105805; 
 Tue, 07 Dec 2021 00:18:25 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id r7sm13631282wrq.29.2021.12.07.00.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 00:18:24 -0800 (PST)
Date: Tue, 7 Dec 2021 09:18:21 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 2/3] dt-bindings: sound: tegra: Update HDA resets
Message-ID: <Ya8YzUdUg+bFcx/2@orome.fritz.box>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IpL2ISpQCYw3FiPf"
Content-Disposition: inline
In-Reply-To: <1638858770-22594-3-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, broonie@kernel.org, linux-tegra@vger.kernel.org,
 digetx@gmail.com, jonathanh@nvidia.com
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


--IpL2ISpQCYw3FiPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 12:02:49PM +0530, Sameer Pujar wrote:
> Tegra194 HDA has only two resets unlike the previous generations of
> Tegra SoCs. Hence update the reset list accordingly.
>=20
> Fixes: 2d8f8955fe02 ("dt-bindings: tegra: Convert HDA doc to json-schema")
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml       | 13 +++++++=
++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.y=
aml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> index b55775e..70dbdff5 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> @@ -50,13 +50,18 @@ properties:
>        - const: hda2codec_2x
> =20
>    resets:
> +    minItems: 2
>      maxItems: 3
> =20
>    reset-names:
> -    items:
> -      - const: hda
> -      - const: hda2hdmi
> -      - const: hda2codec_2x
> +    oneOf:
> +      - items:
> +          - const: hda
> +          - const: hda2hdmi
> +          - const: hda2codec_2x
> +      - items:
> +          - const: hda
> +          - const: hda2hdmi

We could make this more specific using an if: conditional and match on
nvidia,tegra194-hda, but this would work as well, especially since I
presume that Tegra194's successors will also not have the hda2codec_2x
reset.

Acked-by: Thierry Reding <treding@nvidia.com>

--IpL2ISpQCYw3FiPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvGM0ACgkQ3SOs138+
s6HtrA//SQTJKoBonjblOXCfZCGpl4NiEuG+ksgtRENQH8uNYgFqFryy5n2X7VAL
QVBUOOJfRyW4RHy6+dfw7QIG8d6c7JhTZuB9f5I6P+l27UQ4QG8p4kc5wQ8oi47R
uTRhlfl8qnjJmmtsgqMXcSWkAFlOqWxzSWiyY6CSmrbx27tcbEyaRudtfY1oe05N
aKN56OGVYimjF3yTU6iv7scGgBJ9o+FGNIM9dUZsPWfkuxdpIESRUJ4pQ2QVoQDh
Kv/ykUPHnLhS62pDvctKOYjFyDsPkEww8mZra+rnIYg93vHzW9xaVF2UcAmpW3Ie
H+JGFZ33eixMpCzyqG7NjtOXxOp6ardsYbf56VTUgig2JMDwszKDHtWkfDcJpcC2
3UylGgNUo/wQuUnqVL3BHQdi9i5I9w81ZC8XlJEmGyBhR46oLGDSUjwxZuiKuaiT
hOQm62icc8QSiBb0AF4q0NRiO6kxGSFDITCSR3ZPTBnems4kn7+hgMpNYDFVQq3h
Tui2E/Hx5X0Yuv3Pn2VHzEPTOSB/Vo9i4hFAHWcYjJgZfnAsC3XRAoAVPPXlqUPu
PLQphJUdXvsKris2OJDhbUJIz8kThuzbTiNgiH1QKCHukn+pbWuyyE5qS30L0dKZ
3I5YoTjE79X+fDDtIeEbJcwZbKelyx6QgduhREVvNMs9Jk8s7QU=
=m28v
-----END PGP SIGNATURE-----

--IpL2ISpQCYw3FiPf--
