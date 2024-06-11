Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD1904108
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 18:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F26A4A;
	Tue, 11 Jun 2024 18:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F26A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718122747;
	bh=BXCo5tYRXnp4nFR9iSjOtaso98PV85SmlYISucj3UX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k1M5p76jETd9aWksBCh4ajMmqaLewrDlaIZwhdORV8PaGVSDE6ocxrEw4U2YOVtD7
	 EErIK3VLhWMMcInSNt6huLfyGWU6D3utYlQm7nzCI4aJgtqIlJ8RGYEpwyN4cCC6MX
	 egOrAT8doUGm2N6YE8Gk59pSU8Dz6FL2Sk7mG+sk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0654CF805B5; Tue, 11 Jun 2024 18:18:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47078F8010C;
	Tue, 11 Jun 2024 18:18:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BDB8F8057A; Tue, 11 Jun 2024 18:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CA3BF8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 18:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA3BF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ohSHEeJv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0A0460F2A;
	Tue, 11 Jun 2024 16:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E1EC32789;
	Tue, 11 Jun 2024 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718122705;
	bh=BXCo5tYRXnp4nFR9iSjOtaso98PV85SmlYISucj3UX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohSHEeJvbrchG5opz8XOjoL5wWczUKYg/j0J10BezKCKdWUHh+2BGYj+2R2VF18Mi
	 XxjPWUSuAVLzYTuQ4L1Id7Wk/3W+3mvM8csSpYEc2KuP9ce/ryb2HxUA1lkkXJbnAk
	 ycthwzrpLuDUuTuRkh4XlaBNI7nC+cxs+PpO8vDpg/C5wHFcqKDsn8W16QnZi0tH5Z
	 DIW824tseUEYQgmEu7R2mIUAN258cQpMsEFlGEu5cwIdxRTn3rfzKktZUsav89+1o0
	 AvPQP/2fbiglHKN++jvchzmV0lV14dKFjLkz9KQ4wYWeH0PdcZS9myKs7/inZQrZC/
	 7oaaF+7qiwjyw==
Date: Tue, 11 Jun 2024 17:18:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v5 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec
 support
Message-ID: <Zmh4z2F6Q0Z5tWnz@finisterre.sirena.org.uk>
References: <20240524035535.3119208-1-quic_mohs@quicinc.com>
 <171810116692.177725.17513047102055843084.b4-ty@kernel.org>
 <9a14cb7b-8d6a-14b3-1d3a-b61086e4d4a9@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9kuz/Ng8fSpME3+T"
Content-Disposition: inline
In-Reply-To: <9a14cb7b-8d6a-14b3-1d3a-b61086e4d4a9@quicinc.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: 2XXX2HTPLQIIJWOQC6XR5355MF3FBOJ7
X-Message-ID-Hash: 2XXX2HTPLQIIJWOQC6XR5355MF3FBOJ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XXX2HTPLQIIJWOQC6XR5355MF3FBOJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9kuz/Ng8fSpME3+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 05:43:19PM +0530, Mohammad Rafi Shaik wrote:
> On 6/11/2024 3:49 PM, Mark Brown wrote:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

> if possible please revert v5 and pick new v6 patch set.

As mentioned above please send incremental fixes for any issues, there's
already other changes on top of these.

--9kuz/Ng8fSpME3+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoeM4ACgkQJNaLcl1U
h9Cnawf/fREWTBnC0LJb0pWn2slZjuzkeDdemDwGEzINKR+3GWRSgkj7g8EfveZZ
uhpb4kMAETtZZFdqNipbdCdCn0rykBEAg1htIkvk8aCKlDiMKw18vomFlGCHuMyL
OJU3W0Bdj7gK/9It4OcoR5niYSCX8Qga0y+lanU+7yBgVX/tBlJCWduiQamUwig7
tzbtQB+/w+rIFk8hOTD7YDN2L3meLPqHqLxZxAf2VGFwti3ZazGFdDcQTPwFEGgL
uIPG39uCwDr3g1tmX0mcNgg2mOBnWNLreXER2BxaduXePl3qacANXkFpwD3BxNvn
sC6Abb/j+iurQFMG0e5eZVdgLBc3Pg==
=qvv7
-----END PGP SIGNATURE-----

--9kuz/Ng8fSpME3+T--
