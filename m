Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 249817CA875
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 14:48:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A06C82B;
	Mon, 16 Oct 2023 14:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A06C82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697460517;
	bh=YdZ/IC4cH/K/iK8DSMpzreTp2d+CY6Vurg5t2QRe3vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WlxbitGo7bnbYjl/zTSePVIaH8S5Xn3om9XyqozGS8CJk6N6bSClRaRuqey/jY6hy
	 sSapjjZTddXVgzLF6jUIkS55Puq6QF0aGdaJd+rTwQYfLVWTzvMLB+dxwuVqzCVMVf
	 9wYHfTRWC7aedLqHR5Av930OhdVIATz2Y7fx7tYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CFD3F800C9; Mon, 16 Oct 2023 14:47:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29C3CF8024E;
	Mon, 16 Oct 2023 14:47:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE11F8025F; Mon, 16 Oct 2023 14:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 990D0F800C9
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 14:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 990D0F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gH0TchFa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B3D660F32;
	Mon, 16 Oct 2023 12:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5499BC433CD;
	Mon, 16 Oct 2023 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697460453;
	bh=YdZ/IC4cH/K/iK8DSMpzreTp2d+CY6Vurg5t2QRe3vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gH0TchFakMHau2l9pLD5LpA5U4mrjbZB0MO5T0FrSdU6ATt18vol282fxJmp3i7Q+
	 35WZ3GRlST6pcvKCnrKlyMBwyyLAmxwMVLTHupHiVZYWB21eN6CoFJFR7Jc/b69PkD
	 /Ntxuuvx36Llq5r7CQNvmpKjA1TxZq1P73irjmV+/klfyqIraGeozaLYb+o23QNIvY
	 ryyIkF3qMDKWdTr/+Jql/aAQQOJcsu4Q1+DDnh/E/DCYFERzox/nGgulTjw3VBnGvy
	 EvEX4Jmcbaup2OzEKK3XYEmbic0AjW0etjdjTx5gehDeu5j86fQH+G2FrlFmRHUf49
	 3BFW/8ichbUWA==
Date: Mon, 16 Oct 2023 13:47:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] ASoC: qcom: q6core: expose ADSP core firmware version
Message-ID: <6ff78ead-fe41-496f-afdc-a83eee27f652@sirena.org.uk>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-2-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BQn/BgTXOEM+y9sF"
Content-Disposition: inline
In-Reply-To: <20231014172624.75301-2-otto.pflueger@abscue.de>
X-Cookie: If you're happy, you're successful.
Message-ID-Hash: YT4PYEOMKYYLAGUFZAV6AHY32W25OZMH
X-Message-ID-Hash: YT4PYEOMKYYLAGUFZAV6AHY32W25OZMH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YT4PYEOMKYYLAGUFZAV6AHY32W25OZMH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BQn/BgTXOEM+y9sF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2023 at 07:26:22PM +0200, Otto Pfl=FCger wrote:

> +		for (i =3D 0; i < g_core->svc_version->num_services; i++) {
> +			struct avcs_svc_info *info;
> +
> +			info =3D &g_core->svc_version->svc_api_info[i];
> +			if (info->service_id !=3D APR_SVC_ADSP_CORE)
> +				continue;
> +
> +			switch (info->version) {
> +			case AVCS_CMDRSP_Q6_ID_2_6:
> +				core->adsp_version =3D Q6_ADSP_VERSION_2_6;
> +				break;
> +			case AVCS_CMDRSP_Q6_ID_2_7:
> +				core->adsp_version =3D Q6_ADSP_VERSION_2_7;
> +				break;
> +			case AVCS_CMDRSP_Q6_ID_2_8:
> +				core->adsp_version =3D Q6_ADSP_VERSION_2_8;
> +				break;
> +			}

This doesn't handle unknown versions at all.

--BQn/BgTXOEM+y9sF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUtMN8ACgkQJNaLcl1U
h9BmQQf/Tt7eqF9/o/Aud88rJCnftlQCY5L7byWqy2kWjodL0h14ennXe7c8R7zR
1aggmXULvZGMYavDQyshmC4J5b0OGXeaV67/Cm/El2MgNgrzi/cp6M/49DPCIKi9
fFV5OkrdPgPc+AmF0OY1pa4P64E64/4LL78KaR5JY/zBuYE+bNYCJMuVTagHeAcp
sd2nSfEJYgj28dv6chvjjMJ9Z1WO/p3sm6U0CXVu//GbSdWhUMgKIAUoNFfCJ+De
Kg4pf4qOR/viuvjU21yDQBHFjLzjlDFmSpcMS7DPp22E48NGNOOVrM6bMyVOxN2l
UJLvtMe21FLp2ka4HedvxQT2BGduqg==
=Yg2j
-----END PGP SIGNATURE-----

--BQn/BgTXOEM+y9sF--
