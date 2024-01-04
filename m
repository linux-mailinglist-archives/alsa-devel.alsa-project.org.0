Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AB48246E1
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 18:08:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA66EA1;
	Thu,  4 Jan 2024 18:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA66EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704388090;
	bh=n2SyW1ljH/rssFJkg/rVAYtLLFKTjt1n/COVQ2+M3E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hKl6HupjCwDLgJ/1cgqXOMHgMv3pQBr/Zgg1nRJT3su1T6AFRd4gIgC8ql2Ch7As6
	 voFStQZzbSqSo1D6WsmOLzVwColyJ19j9VDchSAtq2V19EI5RquX9zEou3XaTtGt6L
	 w9KCHHBp1uiKm6HauWavT9FCbwdjjnlxhbpmjdA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D0ECF8057B; Thu,  4 Jan 2024 18:07:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31CFCF8057F;
	Thu,  4 Jan 2024 18:07:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15068F804B0; Thu,  4 Jan 2024 18:07:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10C12F80086
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 18:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10C12F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SXgyVMVy
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so81866266b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Jan 2024 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704388046; x=1704992846;
 darn=alsa-project.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2SyW1ljH/rssFJkg/rVAYtLLFKTjt1n/COVQ2+M3E0=;
        b=SXgyVMVyaV1BdGNm4NwBkghEmKWmUxY0qXxoyvLsu1N/eH64Ldv3CErKBnWbHo/Vb0
         xX8JZ3WlwGC3FuEp1DjEWnN3QK2dgxSrtNlrWR8/y6jXe9x3NkGZ/FCoX94TTWUDO5Q6
         DLIAimXDowDJUAlRcMeu/i904rhfbnkDre3boEQ9YWdJ7TN0zKqdQ/rtvQXabdhwardp
         0D5lnsQodkg1ooVfslJYYRG8ATaphs11c74TUYLcsNwUyL8AcPlmdqWTYsAPQVhPXznq
         a//LSUKxCz1zeS8ZshjEV97YbOA7DqKT36Gv3rr2cbHAwqFJ6otrOZTVw+2HHeKsyFyE
         AbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704388046; x=1704992846;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2SyW1ljH/rssFJkg/rVAYtLLFKTjt1n/COVQ2+M3E0=;
        b=AQWz8rJ2yZT469lmPUlKTSrkRjqcOIoMQc9FMoYEuJcmEMJbbVwldcTLa3nbdNh1QK
         64Wh/OYq7F1N+s3Cxy2XICEFaCCwXfKRm7UxnxhKvJvmyQ5/1yjxtXH/8mPYS5KDWz+h
         N2K2WWAcUXcnr5vmX5YygSfPG+HhIzNZ7W+spaZyNcJ+T8yyhCffR+M2vKH9vccC/OqA
         OFo65KzufL1q6SGpE4h7E0DMDpegO7i11vviCXG9zDb217a2sQjlybxctdTqFE8APm69
         8j+x4gJ1kJnXlNR53G8HyLDLFXYx1bibZ0mW9U7qRnqhtzuUfmtoBy4JwTVHJ3dnQsvd
         ZPjg==
X-Gm-Message-State: AOJu0YwMgEq9ahCpGQDXC6kzT1ty4pbiSstOGwdBqQETYTDtYTsb7xsV
	+RibnoX+OBtLL/xY+9uuye4=
X-Google-Smtp-Source: 
 AGHT+IHGK9oYxAcGfl4yhjtI1jKqFpMVSateD+U2nEbIL02mypEg4sGmPDtlRR4zlNdUpqqj62pusw==
X-Received: by 2002:a17:906:e08:b0:a28:abc4:344d with SMTP id
 l8-20020a1709060e0800b00a28abc4344dmr400956eji.151.1704388045814;
        Thu, 04 Jan 2024 09:07:25 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b00a2714f1ba8asm8684722eja.160.2024.01.04.09.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 09:07:24 -0800 (PST)
Date: Thu, 4 Jan 2024 18:07:22 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	robh+dt@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
Message-ID: <ZZblyhfzQjzyoUc_@orome.fritz.box>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+KuTAd7PWpR8QEqv"
Content-Disposition: inline
In-Reply-To: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
Message-ID-Hash: 7GQY5YF3MJ4DNAL4MLLMJKTUWG73BU6F
X-Message-ID-Hash: 7GQY5YF3MJ4DNAL4MLLMJKTUWG73BU6F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GQY5YF3MJ4DNAL4MLLMJKTUWG73BU6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+KuTAd7PWpR8QEqv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:
> Hi Morimoto-san,
>=20
> This question is regarding audio-graph-card.c driver related DT binding.
>=20
> I am looking to enable following DAI link connection in device tree for
> Tegra audio:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /-----> codec1 endpoint
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /
> CPU endpoint \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \-----> codec2 endpoint
>=20
>=20
> I see that, "remote-endpoint" property can only specify single phandle
> object for connection to a remote endpoint. In other words, the link can =
be
> one-to-one. For illustration, please see below example. However I see it
> leads to a build error if phandle-array is provided for "remote-endpoint"
> property.
>=20
> =C2=A0cpu_port {
> =C2=A0=C2=A0=C2=A0=C2=A0 cpu_ep: endpoint {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&co=
dec1_ep>, <&codec2_ep>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0};
>=20
> =C2=A0codec1 {
> =C2=A0=C2=A0=C2=A0=C2=A0 codec1_ep: endpoint {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&cp=
u_ep>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0};
>=20
> =C2=A0codec2 {
> =C2=A0=C2=A0=C2=A0=C2=A0 codec2_ep: endpoint {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote-endpoint =3D <&cp=
u_ep>;
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0};
>=20
> Is there a possibility to re-use the same CPU endpoint for connecting to
> multiple codec endpoints like shown in above example?

Can you describe the use-case? Is there a need to switch between codec1
and codec2 endpoints or do they receive the same data in parallel all
the time?

Could this perhaps be described by adding multiple CPU ports with one
endpoint each?

Thierry

--+KuTAd7PWpR8QEqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWW5cgACgkQ3SOs138+
s6Hxog/+PQIdWB1f2Qc4wGtlaMYlXNfqoUR9wIQVXTDWszmtCbaGfCqsky+ybAyh
KTO9caYbfyg7bDLZ2At4OsORuHOsW9jlwTdgSr7UT5d2l5tVrgR2Q+fmIvYiNLGw
QED9fINtd4upTXiWjetmASmUSdv5wEtchRF5KwnGTlck1fd9BnSNqeyXKjab2gPN
Yexcn/NK0o+fLxHj7KIcYYLEoygZZHbalWjbeSE78JioqDseotKmk05ivBz/WpTQ
n3LOG4YpgY3XZxYoizdXODvyfr75ev5HzFGQ7xFDwTjycVJYfAGyqAuHhuIChGR2
/em3aqtxpasYGYXjZiGv18HqCyH8JSpAWC/3Yh61D88ikmwElT6+d+8hnLwocPeE
WMchN+IFsjodcPcS/y+cO+bekuFcTMY9+WnO1q77rAxhg+PyzG2eKgYBC8KG0TQk
SHG55K5lDgLzkbYNB984D8lZyPLsdCX0JQhAXgem8FAq901C6rYsN/xftZiq+1r5
XeChVV3LGuZVJV4uM0CH4XN8F6DQelfT5qzx1bVsLI6uq50v7JQPXMQ+yMqlqhHe
hSnzYv0rNSmsaIyEHz5EQUBc1Uf8PT4G7CwFMmYtPRe/+Q8DD3WCzut1viwV6KMo
PRfFQeONhFEKcjoiFLV70S5NdhJQESUqhF7bcbtzMqot6pHKav8=
=+yDn
-----END PGP SIGNATURE-----

--+KuTAd7PWpR8QEqv--
