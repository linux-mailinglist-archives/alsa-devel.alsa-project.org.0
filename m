Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9EA83699F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 17:06:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6962286F;
	Mon, 22 Jan 2024 17:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6962286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705939607;
	bh=1eEXVVdWTxV8z4waWaHTl3I6KXQypu95DXHvSvRdIHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=szlOBrIyLOW5Y+/Yod1TLN9p8SyJM0KTmWV4Y5fzBjOBZZAGemXmz9RMCxZEvJEZP
	 8hLFU4KSpJgQaPPj1uNc1hR1+uwi8iVgmGngsN08IBCw1gfrOqmxz7Bzc8JJytRJeP
	 o0GzJGlxa71sjw9hY8gv98ySHLDP1+u+UOG6BUfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64204F8056F; Mon, 22 Jan 2024 17:06:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B9B5F8057E;
	Mon, 22 Jan 2024 17:06:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5280DF8025F; Mon, 22 Jan 2024 17:06:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D9C4F8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 17:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D9C4F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HaE233g5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8B1EBB80EBC;
	Mon, 22 Jan 2024 16:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9638CC433C7;
	Mon, 22 Jan 2024 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705939542;
	bh=1eEXVVdWTxV8z4waWaHTl3I6KXQypu95DXHvSvRdIHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaE233g598PTRgikgKOs0OlamkpWc2K8+qqvyMr5yECHnFkRXLHBVd8n1YLmmP9Tf
	 ISU6bGw0CwPUbfzi3h0Jzvfb8UzIcTuVaJTnRYO47UCDLIIYyHC6xP/HGwpCc5b7DV
	 dZ+t7u9n93sPwykg6VBtD+lepTKcek9ZrBHV0EylXMaS6maq/v3qezUSWWaGew031B
	 4ZwX7ykVqUD5LIrz7ZNbEE4gARFKbKFlyekx5JHVdSdyRcJhYYXNUW8ao8UtCS52s3
	 DcchBjDXtJ1iE0DBabpPfSSKqzxCIBQiAJVKZHvIYAzqnqGf+qkHeodKZTH1zjZp/Q
	 N543OSbMlzpsQ==
Date: Mon, 22 Jan 2024 16:05:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <aca2b125-acf8-4791-a3eb-ea19826d3ee4@sirena.org.uk>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <20240119112420.7446-3-johan+linaro@kernel.org>
 <d54d3640-49bf-4a2f-903b-4beeb0ebd56c@sirena.org.uk>
 <Za4cR90XoAaATq8X@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pJm5Y4ijPdHAqAYt"
Content-Disposition: inline
In-Reply-To: <Za4cR90XoAaATq8X@hovoldconsulting.com>
X-Cookie: Nice guys don't finish nice.
Message-ID-Hash: ZPB3GPRLP3RTMNEOT5SDXRPWB3TWLRU3
X-Message-ID-Hash: ZPB3GPRLP3RTMNEOT5SDXRPWB3TWLRU3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPB3GPRLP3RTMNEOT5SDXRPWB3TWLRU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pJm5Y4ijPdHAqAYt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 08:41:59AM +0100, Johan Hovold wrote:
> On Mon, Jan 22, 2024 at 12:03:55AM +0000, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> These patches are based on Linus's tree after merging the sound updates
> and I just verified that they apply cleanly to 6.8-rc1.

> I couldn't find anything related in either linux-next or your ASoC tree
> that should interfere.

> Could you please try again or let me know which branch to rebase on?

I was applying it against v6.8-rc1.

--pJm5Y4ijPdHAqAYt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWuklAACgkQJNaLcl1U
h9AfJwf/VeyDwDQeh8AWh4NRdjUo5Pk5BLZ6jqdmO7SqBALZpLh5xFy5FGfLXf8N
UwJ6NHQih/rY3GI/hGT89cfC2I4UYOezJpjgdFxT9BG69bBIPHBoLcyMWFXXcMXz
47xHUGVsLK6ouYeyZpupNV7RuMeR6AyuPwltxzzcKwC6/wx9dC+hDM5AMmG6XCb/
yYOFjXRigXNlCVJVPMfwszrp0YhsRcIOR/mpEAazDmgNQGLnWuwAFMsDHt8HRT9b
tJhHaJpT8qdb9uS77JM/1Z7Fah2bh0g95qKTBT0TC3sr37ciK84kmUGP9bDVShxi
ba/11nuFNGeE381eTYk1OqblnnGwZw==
=it3K
-----END PGP SIGNATURE-----

--pJm5Y4ijPdHAqAYt--
