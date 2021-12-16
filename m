Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5694773BF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 14:57:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B9F1F57;
	Thu, 16 Dec 2021 14:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B9F1F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639663057;
	bh=7P3s+C8J0fU8hM7rCFPq8Ia4eHyLJrnSdtmSSUp5w6I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6EDg738mUs/EMIRZ3A8/DVds6jYfyUKWDUgKSKmgUJmmJZZB9Cj7L77SW4545uBM
	 9woo070PlvoezNbOs7fiY3ZVUDy92/nynpN5M5moLGyKAwVseZV3RNev9j2zxS1qqa
	 ceBUH9kW22fL7a7Djb7yrh085VVv65Qn5ehpP32o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A500F80165;
	Thu, 16 Dec 2021 14:56:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DEA9F8014C; Thu, 16 Dec 2021 14:56:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EF8CF8014C
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 14:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF8CF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Sli9mUlX"
Received: by mail-wm1-x32c.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so18175843wmc.2
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 05:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iMV003eLLznTLp6M2oBwJEaOYxC5vjXtghvIfAS3DNQ=;
 b=Sli9mUlXv3PM4/ikHFbKNIKTK8n/El4roMYCXwcZR6TA0taVYgveeSZ/E6mkGY2d9B
 2Q/GRx2Ra05xaCgyJCRROknh81z/QVO3snt9kGuajSRoO2CxsMxrToBDZqMGXi6pbJQ8
 i+OEZLBiCU5exBlYlKGHb+pr6wLCg81UuJC1yr/KJi0nFIwEig18l11joASXkKfddigC
 4JEYJ0YNTzFltL51s5+gVem2Q5s9DkBaFbSfzPvK5ZUujMWSl04a3ePok7sXaIDhSm28
 f5n2iHSdkLgoHYv/Z2AoMehKLk0cUCKE0rngVNJSV7bDjEJHre1wdjbcmDCWhD+MEr2g
 tAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iMV003eLLznTLp6M2oBwJEaOYxC5vjXtghvIfAS3DNQ=;
 b=Qu9BeYsB1uYjAFgsVNvRUV4Q0MO6GN+PjgXsLFI7bYkF4RmRT+UVHU2bm5mxINmcVT
 /h5SdSojy6BW7C+B813uG/bTzkYG2XPiV91HiY+7wQw+onU+nSFisot+tdisbYJqvy7S
 XGIVhwgt8t02lUSV+809poe08CVbN7e9yVQdJjYW6GPbAhDzDfpzMlog6lo/rS4r87bw
 c3741QsDq2fAi/3fP88Yb//WP2ms352/AIP+BXfAghdGnrTnFeIPczYSzoVWsRRu9iTY
 HOwA+D7caFnb13Ik7X3Ftast7+VGJKRcDWAIF8zxtCiCnlSKteitumm83wOFAHAltqif
 0aiw==
X-Gm-Message-State: AOAM532j3pp02vxm1l/CcIRO7dwyA0cyUTxmnaJmgdRYacu7s3/rH5LN
 WYjRPj1kaAw8BBe20HqCmng=
X-Google-Smtp-Source: ABdhPJwyzOoZu9zxfL+1OjtEMOMUMtdhsprxGBD+PcGf+w/+6ISQTTgbCC2+hySDGxg9pU8JhSYXEQ==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr5102355wmb.38.1639662983607; 
 Thu, 16 Dec 2021 05:56:23 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id p12sm5945219wrr.10.2021.12.16.05.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:56:22 -0800 (PST)
Date: Thu, 16 Dec 2021 14:56:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 01/22] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Message-ID: <YbtFg7t4cM9dV5Gw@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DYeD+wTM6cNwfNkf"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-2-digetx@gmail.com>
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


--DYeD+wTM6cNwfNkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:04PM +0300, Dmitry Osipenko wrote:
> Add device-tree binding for Tegra20 S/PDIF controller.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra2=
0-spdif.yaml

Acked-by: Thierry Reding <treding@nvidia.com>

--DYeD+wTM6cNwfNkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7RYMACgkQ3SOs138+
s6G3YBAAgNf/4lgE/tO88tQPV1jLl4JoqxFX/HSw2KtQ6EGrW6HXSk8heutahviv
QMpfJVkw2+bSfPz+MdO2jBSg3XQWNOVYMrdN0Z5VcuAgbankuYJPCCkwoJ8U1SIO
O3NuhaPHvLSsKTHb74u9xcZ7LBxcpWtPHJ7JiF7W+wicXg65vYmcamQJoQCO0CLS
yrS7z8183zb2RDMPVu7cPQ9xZA/ofS2A8SiuZCFdpEE/ONX8l301v6EH9p8KsoNV
cRKjLEPyaaSMMS70NiCD1pw5Gk3NtDnwUePvpDzotGqAr8HU8aLCf5F6PY+tEEZv
qF5u18vQGEc6S77qvYmpIGVcvzHFdmzZ3y05EpP+bSCBasGCqKkRJJQvUMc0AE4m
HKRTWOL0fln9k7D7GAfHKdGoGx40vsQwaaq0OyRWhAXYBr/SfRMUWcd/gEaUajd5
x/GJ7IuzjYmHTcYaVCo6NZsrQiWTRfescCB7PmEqQlJXaAO12Qx++2fmh2Aqsgk4
M65Ez3z/7TVwwvYP5IQCGw6LHFebrxMLMNZlEIf042houTzAEUCozC8hXlqRRSH8
/xAnSkcAqUd/SOye4O2yhSaLYBWlTrfe0gqvbVsCLvjXKNAoNwWBAuwRQ7UPNsi4
iPi8TgisuC6KHPPUuNoyDA+aQ+lh9RJF6/q99KaBDq8FaEh0wVY=
=zYcg
-----END PGP SIGNATURE-----

--DYeD+wTM6cNwfNkf--
