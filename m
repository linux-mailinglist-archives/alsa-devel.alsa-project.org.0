Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F32715D65
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 13:38:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D48A574C;
	Tue, 30 May 2023 13:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D48A574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685446714;
	bh=iXCnSpqvku5TBvKgY0SIrL7G7nudm6YESXMmzmXUbU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sJLF71DcRbHPD9A0Ssi//0rY/yz7sEkaixneafsZkK7q58oga8kVMjnSN/VsBW0b9
	 DsG94hS02+Fcx6Em2Q/H6+/M0lpOgG87RcP8mLfDtlGucHbK4iWR9qZLsJD6g75x0R
	 xCc/fyHydOF6h+qvH+CmUtMbbbCe3Zn9O+cxYS7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2717F80542; Tue, 30 May 2023 13:37:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB801F8026A;
	Tue, 30 May 2023 13:37:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22BFAF8042F; Tue, 30 May 2023 13:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49643F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 13:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49643F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GTcik89a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A20B62260;
	Tue, 30 May 2023 11:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E40C433EF;
	Tue, 30 May 2023 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685446607;
	bh=iXCnSpqvku5TBvKgY0SIrL7G7nudm6YESXMmzmXUbU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTcik89aH1GnRIFAEfVubBgatbsO1FId7GW/IRBcONL4z03EgtErF/yMgEsdsRQZA
	 WCHlU8TMmnjd2fEuOhJP9psrh5ZK3tq2H6sMZS5IVwsn1cqklw6knLDGF83906Mm3b
	 hV5DxEd/3g6UpXojZxw/xkh8dNMZdKcCeAjcLFEoV9tByq24DlBt/giTfLEVxcNORk
	 +Qo1KszQrpQG/fQhf174Ns/NlDzklyZLJezgBL+lEPX2RUnFo+Me7vUnP+oFyZDPKR
	 OCKfgjykoQy0fVdFmIdVZnNXgw/jZnRwyh7edoQyrn5XMt4KWCxJjHjmLUinu0zfBs
	 ZUMkezRxrGs2A==
Date: Tue, 30 May 2023 12:36:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	David Yang <yangxiaohua@everest-semi.com>,
	Daniel Drake <drake@endlessm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] ASoC: es8316: Increment max value for ALC Capture
 Target Volume control
Message-ID: <4a3f54a3-2cbd-4a22-9742-9ba60e78643b@sirena.org.uk>
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
 <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
 <5dbcbf84-602a-44de-ad99-268d4d5b4b2f@sirena.org.uk>
 <cfa23203-1626-440b-ec27-efe56cb297d2@collabora.com>
 <01fd1a9f-56c7-4864-bb2b-8b004284c8cc@sirena.org.uk>
 <3c6b67a4-4892-0057-3dfc-65ed6c7ebc37@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d7bOgmCsIJ4exiLW"
Content-Disposition: inline
In-Reply-To: <3c6b67a4-4892-0057-3dfc-65ed6c7ebc37@collabora.com>
X-Cookie: I've read SEVEN MILLION books!!
Message-ID-Hash: X7EFIM3HGBLSMNNQLE4VWC2ZHI5IRWFN
X-Message-ID-Hash: X7EFIM3HGBLSMNNQLE4VWC2ZHI5IRWFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7EFIM3HGBLSMNNQLE4VWC2ZHI5IRWFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--d7bOgmCsIJ4exiLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 09:11:49PM +0300, Cristian Ciocaltea wrote:

> -1.5 dB  |  50-51 %
> -0.0 dB  |  50-51 %

> So it seems the specs are correct, and the problem is the hardware default.

> Is there a better approach to handle this than extending the volume range?

The other option would be to change the value in the register during
probe to one that's in range, that wouldn't stop any existing saved
settings from generating errors but would mean there wouldn't be any new
ones.  Either approach is probably fine.

--d7bOgmCsIJ4exiLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR138cACgkQJNaLcl1U
h9AZDQf8CRVQJfTeFq5Qw9fVO1/pJlyLSgRpJGmTNzHtJqiQWeIHUvhUdQk308MA
F8c9ONRYZYqB1lr26oNF0MWRJYI8BQJC35xYxLiK2EyKYLvyiK7K9JekQybKdzpk
o4fAXlKCjlMHBqVF9ivHEBUjMyM2aZrLc7D0DSX2N+VhVP9evvNNNyccAKxGUE91
7UDcJARuzCs1ENlzyaJKrZxiGDKbVapt6KMcnz7evtqAQpKgjfdDYOoKWyZcRSAp
5yQjcYk7+XfGkn8KddHjGbgAV6ZJ9BKcZfJ4PwwMm9iJhoVTONpUBPn6UQMb4PN0
PmKgoDkU7j2X/W+b/zWraTxZvy6O/g==
=buze
-----END PGP SIGNATURE-----

--d7bOgmCsIJ4exiLW--
