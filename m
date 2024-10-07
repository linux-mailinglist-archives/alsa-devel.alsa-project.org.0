Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11502992DAC
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 15:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34EC11CF;
	Mon,  7 Oct 2024 15:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34EC11CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728308875;
	bh=yGFj/O5rnD5FErbWRKXzgdC/zozHjxSeh3qRyTdrHpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ru2kDiADuIfXnWQxZ4UyKJmNMfRzAOPBBUHnZQfyddSSp63731HFhGhJWSvzZijTL
	 W2CgrRGyby9uaS+fPKkzHJ1y59o4TMm9OyhffFviNIpeTPxnhru/etY5ITVGKfqKa0
	 MS+ZB9IV+aqy82jP/BQWHZeBapvu8nDHqpOqE7u8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE99F805A0; Mon,  7 Oct 2024 15:47:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C66FF805B1;
	Mon,  7 Oct 2024 15:47:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3561F80528; Mon,  7 Oct 2024 15:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 227BEF8001E
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 15:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 227BEF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WcKkyqix
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77209A4080B;
	Mon,  7 Oct 2024 13:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED8AC4CEC6;
	Mon,  7 Oct 2024 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728308833;
	bh=yGFj/O5rnD5FErbWRKXzgdC/zozHjxSeh3qRyTdrHpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcKkyqixZ6z9FTdcHN0rpj+oqcJa7DojRBwBguzjszsRUG+BXIOpEGXGGNAOtJiXP
	 eB/BJCu4bYYJ8InH9iZhMLfqq3EwZOds2+Lt2AinjfSok9aZZqxkn3YikXtMXCvI6n
	 EUn58tucHkdlPrnyJiX8s+GcOW1Tb4u1SdAKfcNBascNXYT3xTfbNetfsILRPFPFBt
	 i4iHr0s+DqqBVrliP8zvzEfQ4gBf5bJxDef72m4EAfLspRqHSBHViTsM9zFR+q+wYi
	 Ru+3HFHNa2wmjyc9PU7tMYWisHGw6nPds3whgWsEFNv8Iyw+h7Tx9Q8SYHPemURAyb
	 52KrkkclVeHwQ==
Date: Mon, 7 Oct 2024 14:47:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <ZwPmXVzXphEtvvhx@finisterre.sirena.org.uk>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
 <9be6b874-0c4d-4100-887f-0aa693985715@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9JgK+5okZLJh/tVY"
Content-Disposition: inline
In-Reply-To: <9be6b874-0c4d-4100-887f-0aa693985715@web.de>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: XC2IPNZKQS7YYH2JGHMCFY562CZP4T2P
X-Message-ID-Hash: XC2IPNZKQS7YYH2JGHMCFY562CZP4T2P
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XC2IPNZKQS7YYH2JGHMCFY562CZP4T2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9JgK+5okZLJh/tVY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 03:16:27PM +0200, Markus Elfring wrote:
> > A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
>=20
>                    call?
>=20
>=20
> > possibly return NULL pointer. NULL Pointer Dereference may be
>=20
> Can the term =E2=80=9Cnull pointer dereference=E2=80=9D be applied for
> the final commit message (including the summary phrase)?
>=20
>=20
> > triggerred without addtional check.
>=20
>   triggered?         additional?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--9JgK+5okZLJh/tVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcD5l0ACgkQJNaLcl1U
h9Bz3wf/Qjsm7YymNTSgU04NIuFJv7cm/idFHsogeWTEMXMQi8XF6YHHZnh5nqgT
S9nuoLxNBpHddndwDTkmZjPEn/uptCpBeMHJRYa3L2Xc4C605FUBt1uy2kM3LmRX
konGCd7t9CHNYWWErxvnOhPPgfIKInfEQHhBWl35R/zZRHWHLlN4DLb+SYCdx5JC
ELx7rjvdBW0o5zUfhUi38aW1m/Lj+CI8/3bBKjTy3HZFx05qpLL0n9X/J8UGBhYS
ZnNspHpLAo/qmNQBpB5HHYnNCG8YBnVgZvV48NHZJrvMJZ7T8oTOEhzArNcB/8Ou
srH8XkXcQcrwKLOj9NYITJdOtwxQ0Q==
=h7hN
-----END PGP SIGNATURE-----

--9JgK+5okZLJh/tVY--
