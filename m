Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC768EE00
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 12:34:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C53382A;
	Wed,  8 Feb 2023 12:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C53382A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675856050;
	bh=Mca3FcgBsZopFClPoT5NY1FolrKttcq5bAiF2IL7fqw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p/mcXUCksMUIpQ1tCecazZo/9w9HbCy1X79G3mJtf+Ni9eiRFMEU2JIlc1Yd9r8Kc
	 8YfDlAR2ihKqsPYhYEHP2TJKqiagVXhu3Q2ZFcbe2ys27DMLjz31NoxJwn+isFrNwM
	 giFqk1YSm+E0/eHJCSLfKWPuq9/ZzFyoUyYZQyws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F25FF8012B;
	Wed,  8 Feb 2023 12:33:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B93F80152; Wed,  8 Feb 2023 12:33:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 082F7F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 12:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 082F7F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fXWANCuB
Received: by mail-ed1-x52d.google.com with SMTP id eq11so19991988edb.6
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 03:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIu5FMX5zzGn7W3WV4iDVGUOhSdTojc3bSXVJLsQvOI=;
        b=fXWANCuB/MzwMxY8e/PE9hMX6kQQgSi4nwzOxcZP1sqB8ClZa9gcDxf95xcMCFGA60
         8r4HPxPuojmsyiGZM5fo54iQbE21y+qmauAqwiUZ3JgfWGvn5hFl6n/jQnypHDEAEiIN
         BuyuO7rl564g2V4OrWmmn0okwkjZbGE1TCtQTMGjJTfw9GCV5cQzEBQZbHy2naOM6bpE
         uDbQrwann+eaSyPP4Qr1iDlD/kMNgp3Ia2Gz41p5KUz1dsAlq9DKH/Kv+GyzBHKHadV6
         bLLJuLtOY0ewEYZPIZXw0dCi5dG6BoEsrdfO+bUYCY7Ew7umVt4h/WIptyhk6gza7ptd
         eQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIu5FMX5zzGn7W3WV4iDVGUOhSdTojc3bSXVJLsQvOI=;
        b=SVTfKOTgEjI2Xyuer8C7z8a4+WcOUeY02t3NmpxfUhQ1H1E8qyw3AblvzkcoojfmHo
         wtReug7KUxSgsqYstFxQuwtANiy1IaUtKe5coQztKw2UQOikC6TLmTMbNFzGKTYlb1Pl
         KTArLdcn06LnaeEcesDlXufyh0Bsr2/Dpff1We9rCmS11bLbOss/IVUdkqXdbw8RyOtM
         0zzokKnsq0AlSc5CA/NpZy/WlgFBraUTvHbQhyjriAN+OW3DsOYhlpPQkc/VZQjFeBjG
         vinr7JinYjHCPyeoXfKDviyY87NvbBjU4FdXYU1CwIrWpXEAoQiHw0kuW+qXuQm+zVJd
         lhqA==
X-Gm-Message-State: AO0yUKU8Yp5HgR722U9y+UL+C92CJGRu7bC++2G3Sc2hbdY49lvukEGk
	U2dAn8CMEHXiH/zxKvDw1ZE=
X-Google-Smtp-Source: 
 AK7set+tg8yMsoPfm6aG9wW3C95mLbOW3tHfVXRDEHWicn13te2n5qII2lTooySpSVWWHaqcTV5FYg==
X-Received: by 2002:a50:9f25:0:b0:4aa:a517:b861 with SMTP id
 b34-20020a509f25000000b004aaa517b861mr7580201edf.30.1675855982063;
        Wed, 08 Feb 2023 03:33:02 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 y89-20020a50bb62000000b004aab193b8dbsm4424195ede.80.2023.02.08.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:33:01 -0800 (PST)
Date: Wed, 8 Feb 2023 12:33:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/3] ALSA: core: Make snd_card_free() return void
Message-ID: <Y+OIbIEn4QSQCB7M@orome>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
 <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D5qM/4zvEVCMgXpb"
Content-Disposition: inline
In-Reply-To: <20230207191907.467756-4-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
Message-ID-Hash: NR6EV3OCLKNMYVGTDDOMLOMSHXAGKMCO
X-Message-ID-Hash: NR6EV3OCLKNMYVGTDDOMLOMSHXAGKMCO
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NR6EV3OCLKNMYVGTDDOMLOMSHXAGKMCO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--D5qM/4zvEVCMgXpb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 08:19:07PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The function returns 0 unconditionally. Make it return void instead and
> simplify all callers accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  include/sound/core.h      | 2 +-
>  sound/core/init.c         | 6 ++----
>  sound/pci/hda/hda_tegra.c | 6 ++----
>  sound/ppc/snd_ps3.c       | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--D5qM/4zvEVCMgXpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjiGsACgkQ3SOs138+
s6GK+Q//ZiTKsijeECRfzHmIOgymJ77EeHGA/vhS4NBBfe9U296ifD3l2Iyv+64i
fI7nKoz7sr+HxnB675oWnqtDQNIogLRPrej9fG7qGtqk7JWxnUuGkELw43jefGp+
62Q7q/UXC7tSPNf3lZGD1Mcown6X1SkSwohIqvqhY5GLcSMV8/QMOIIQIHeeyjTZ
fxtr8htfD+XArBu+CD5gbo8mQezE3zwlOOnms6OfciwEK/RU70OPK/Do38/gDaIf
c7oJv32pu43UekdJES/C4HhfkdSi/xOUZSYRnl13V0xQ0imngncCPUU+sV+yRhGu
tSqIpDypo9GBzu/AyGMD7L+7wTOlhZKYcPCH7+wUil7H+7QNx5kqxTZQY+w6rMR6
Z7MHYsU5oTnhsgvJmTybU/NFp1Cb0jNlWzH+YvuJz82Wx9wD7p3l+HkOazLj63wv
e1Ktc1Dn9AOKMJR4R6IFwb8T9FiqtQ4MWdJmCbLSuRemo62DYAPzm2els+2lO7yG
/vzZSAi/655ELwubZcGkMQ6ng3nda0JRSqocaT/AzwpnWiTok+srqy2JuoLjE1uG
OLMieD4toJrYTzqR1wPK1lKtJu+qXgw2GsI0nbGJ//kcAK9l5rwKZT0ye8bwG+5N
BWkK1n+90YKZI00GffWXjiOaH/yuzSYrQZuDtzAizFJ0UX87E4k=
=sIaY
-----END PGP SIGNATURE-----

--D5qM/4zvEVCMgXpb--
