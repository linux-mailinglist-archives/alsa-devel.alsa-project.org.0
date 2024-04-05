Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A527899FA8
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 16:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 938332D38;
	Fri,  5 Apr 2024 16:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 938332D38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712327341;
	bh=edtWDz0F9ERyIwkradda1dEIoOdPdwzXb2qVkEfqBV0=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nmv8ss0wYEOvgO72yYqLA2pELmwOiv4YvxJZnUAmEQqatkkuh510JdvdquJtFdrvU
	 Z4cvhmw5w7cUkfGMIaIh8FHy4O+V5wGqFxOML8PrVLv+IbN+pL1CaoYvyEZeSX5V/E
	 j4vhZOGJKVlkO4FxEjGkpRux8MGzMWSGIB0NLygs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AE5EF805A0; Fri,  5 Apr 2024 16:28:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE32F8055C;
	Fri,  5 Apr 2024 16:28:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95821F8020D; Fri,  5 Apr 2024 16:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E5F5F80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 16:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E5F5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JxFCDkut
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4162dd23df5so8887855e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712327280; x=1712932080;
 darn=alsa-project.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O7LERPVCSW+Wfgv7Cf7Coboc+jfMXyoBnYaZV6ymz4A=;
        b=JxFCDkutleLZPs8qlDiR8qD1B0rL6UB7fSrSk1J/tRVjlYqywlMABY9zenairsKlpm
         HZTKY6RBLUWLEABC1ksTQSdAqzj0q2QS20J55Fm6YdE2ESqJW3gclVvKFIKHt7iOhfiu
         LtspQXSFg4YgoCKB0yauly9a2vxoD+/OnukEGyrwMziUKCf0yw6VsbiyQ68EjiR13h9G
         H3K28LRp1pKafOpYHyuSDLGvTKDeP8jufRYXAzGFQLBO3BJJE532XhjTNpYlLHHtXK8M
         rUS0/yyQ/7+9CY3wJ3KT1qCjbOSHqA90fqEsDK4ZLpbe3mzzoamO73jr2wB+y3lcQ+jM
         lwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712327280; x=1712932080;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7LERPVCSW+Wfgv7Cf7Coboc+jfMXyoBnYaZV6ymz4A=;
        b=RHtVJjvYM42mrIKVdZ2/lHkDA3/9adSmGjHI0udpFIow7FoULaB8e1h8J3wTaByN9O
         YX1k+lMRFSzks9xk5pbgNs3gm1cORCi9T+mqSaGiRnB91iyLPjsNqtDkz6haHWdGnl9t
         HIQp0D/qZzoHXJq9TTkkNKRhYAvRmbx6L4Jg+INxwJ4LUnUnXw+2qT3BZgNYz6JGLUm/
         oZnfNy2p1dOUbQCPXbGwaR5l46czkuIfqZU3rqaAO8EnzpWhR3I6M6HnN5ZK3TOJPFOI
         uCWQBwt2+rbMlPs1/ls87MgWAY+Zdtg1UJ9pRvoi2RE7Cxvmp5OA2b7gWXyqhza0qSD1
         HAdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+3zjIXXEjfoUQziAUDC2UuBftFoyoS8mj5kf6D6RPg/0zHLFKdiIR0ojiMw/zuF0kSmhGfdWNBi9MhtQlB9EscAtkeStUPDV3A1A=
X-Gm-Message-State: AOJu0YyOc0MRvr6m9INnf1nbYdCTm6kBO/Y/IqJ4MXIsYfpm3SiapqW1
	m/v3Ai4cALkUoJ2B/NzSsGzCSTKmwT08qAGhMdhs+1pLbZIEYNbG
X-Google-Smtp-Source: 
 AGHT+IGmhovB4WvvEoGfhcQ7/7+9sQMUwNRkZ/ya0lVDZIypZ5bRpVOnEtbrPOgNbrIt2UzRbbBa6g==
X-Received: by 2002:a05:6000:188a:b0:343:39f4:3f2e with SMTP id
 a10-20020a056000188a00b0034339f43f2emr2164436wri.5.1712327279625;
        Fri, 05 Apr 2024 07:27:59 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b0041488691eb1sm6662907wmq.17.2024.04.05.07.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:27:59 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=2bced5962d6df3645374ca32f7e19dc7b5f911531a5e3e0d1afd7115069e;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 05 Apr 2024 16:27:58 +0200
Message-Id: <D0C9D05HXLMP.PNF08QRPH8O2@gmail.com>
To: "Sameer Pujar" <spujar@nvidia.com>, <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>
Cc: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lgirdwood@gmail.com>, <jonathanh@nvidia.com>, <mkumard@nvidia.com>,
 <stable@vger.kernel.org>
Subject: Re: [RESEND PATCH v2] ASoC: tegra: Fix DSPK 16-bit playback
From: "Thierry Reding" <thierry.reding@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240405104306.551036-1-spujar@nvidia.com>
In-Reply-To: <20240405104306.551036-1-spujar@nvidia.com>
Message-ID-Hash: F2XOR6X25FDUMMPMQB2C3TJFVEK2E5ZX
X-Message-ID-Hash: F2XOR6X25FDUMMPMQB2C3TJFVEK2E5ZX
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2XOR6X25FDUMMPMQB2C3TJFVEK2E5ZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--2bced5962d6df3645374ca32f7e19dc7b5f911531a5e3e0d1afd7115069e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 5, 2024 at 12:43 PM CEST, Sameer Pujar wrote:
> DSPK configuration is wrong for 16-bit playback and this happens because
> the client config is always fixed at 24-bit in hw_params(). Fix this by
> updating the client config to 16-bit for the respective playback.
>
> Fixes: 327ef6470266 ("ASoC: tegra: Add Tegra186 based DSPK driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  changes in v2:
>   * moved common setting to S32_LE switch case.
>
>  sound/soc/tegra/tegra186_dspk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2bced5962d6df3645374ca32f7e19dc7b5f911531a5e3e0d1afd7115069e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYQCm8ACgkQ3SOs138+
s6HsnRAAnbvXUuFwGeAoUlndo/z+e8xofUaZP2R83hBnA3JyUK5SdmWuf44y6VoJ
x0/RyQOZ20Wm0MGqRnalCMND9z5yNtfH0prJMBJlvhjKJFtMUI1+zpcfvqzMCxLJ
4qtwzO324JwLnPMMV64aWfiHY5unR6wvwf2Angf60yWrD61RjJ0LPUfY/9a/zAGO
ZKuGqslx+x7Xx3OZayaf/9sg+a1DcQEbCRsAzsWp22PGi52wp4PPgfDNUcTHGkhK
bWFTkm46ZWV7DdUTCnJ50xc2lcz/9hDRou6sEbaZZYtWHjZTj5V4omVyteP0xIsL
7dVC8lCT2Mf99iBcKlLRPy58NdWPnun5PCKMJ8s1GmFA+BYuGsUVxYko8Lnq5LDh
GV9uzOIYwzs6LWJ2cMEKnR6uNXJEtLoq8YFoBvSHxaBnvAi0jO20Ak5UlO4YTwEo
aUx8dpyjjCv6N+4U+9Y+rj0D7MsIvVbeBx8T8Ln6/0sw4mQ8qJe094/AzdU/UJEc
8jnJFmkf1ae6CkTBpOrOR/KUQO6jcdENhqzUV4NAQPKJOm5mQ/0Zxd7hK8fYHWOB
6ptE6q+mrMQJfsMdjl4X+MExHSX2LC8rCxawk0E4zoBQ7LBGDVLt5DtngAAVFBVP
DpZMRBOvlDBSWQtdg3Gwlgq9Tw8VfyBihA0izA/HBugbXG9VrYg=
=+hkQ
-----END PGP SIGNATURE-----

--2bced5962d6df3645374ca32f7e19dc7b5f911531a5e3e0d1afd7115069e--
