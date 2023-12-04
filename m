Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B997803A3D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 17:28:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E063383A;
	Mon,  4 Dec 2023 17:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E063383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701707281;
	bh=IQD+6ShDGEkoKp0dcPe5eVwpPIHahHs+5LKTlUYoWRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+qQkIAHVNJF8RSMUVZcnLTmX6vBJfjQP83Vsg2P5oL2Y23jatJidcMxbsAa55wJ/
	 QsDocFasziCHILXom/e/Bfgl2FN/pekr/VPx1777Ws0bj4khgyo+7UImbG8CpfPFr1
	 vhPYTNELdnKyPMBHiEkXVCKrcAWrJVDSebW1TGVA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17478F8057F; Mon,  4 Dec 2023 17:27:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B342F80571;
	Mon,  4 Dec 2023 17:27:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82CC1F8024E; Mon,  4 Dec 2023 17:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B4A2F800D2
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 17:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B4A2F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DZAz5lrX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6926BCE1002;
	Mon,  4 Dec 2023 16:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FBCC433C7;
	Mon,  4 Dec 2023 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701707237;
	bh=IQD+6ShDGEkoKp0dcPe5eVwpPIHahHs+5LKTlUYoWRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZAz5lrXF0MsmUxmKEUnEnrSGsVQrfEXwAPB2a1IgDjow5aNH8jFQttH/k+IbYv/k
	 BGw8SpLhg9MSOhaf+iz3WFFkFQm72fz7FVFMZuA4KSAzS44CRZ22vyAf92SBCcBD+y
	 cvRpFvkexiT3G/4gZ/reQh4isO78WL5jzBiCRoz2qC7Vt57pA3xgvfJLTvfZOhmMsi
	 ZGi3fQG1OgGbzh3RqXlTri40RwB/Nme1Dkx50n0GP9E5ChoSK235RQT766IVsGEYG7
	 WoEoqdjZ49zI3IrDicthfNo/e6Qpop4jSZ86zNk0oh6vSwgzxZqIXPJny9W1W8R+BI
	 AhPRVa/B4zv4A==
Date: Mon, 4 Dec 2023 16:27:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: qcom,sm8250: Add X1E80100 sound
 card
Message-ID: <20231204-salami-condone-f10b45e09828@spud>
References: <20231204100116.211898-1-krzysztof.kozlowski@linaro.org>
 <20231204100116.211898-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0c/XrDjxI3neAjwL"
Content-Disposition: inline
In-Reply-To: <20231204100116.211898-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: LAKCWZW7PW3CDPVAVZVQQBJXAJKLSAUM
X-Message-ID-Hash: LAKCWZW7PW3CDPVAVZVQQBJXAJKLSAUM
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LAKCWZW7PW3CDPVAVZVQQBJXAJKLSAUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0c/XrDjxI3neAjwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 11:01:16AM +0100, Krzysztof Kozlowski wrote:
> Document bindings for the Qualcomm X1E80100 SoC sound card.  The
> bindings are the same as for other newer Qualcomm ADSP sound cards, thus
> keep them in existing qcom,sm8250.yaml file, even though Linux driver is
> separate.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--0c/XrDjxI3neAjwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW393wAKCRB4tDGHoIJi
0uSaAP9t10prS2rDvL4Vjq/XD55wIkALOkf52ckItqXbEvt+rAD/YxHy9M/SpJrk
B2I6lPxE3KmwSmHKhi8KV/szOph/YQo=
=5fPr
-----END PGP SIGNATURE-----

--0c/XrDjxI3neAjwL--
