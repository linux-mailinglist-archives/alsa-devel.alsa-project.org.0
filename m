Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A25437D17F6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 23:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFF484A;
	Fri, 20 Oct 2023 23:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFF484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697836977;
	bh=BLrgnESXlM0bQhQQkhWCSUxl2XgKQbgE2i5fnpBrc3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AIi0sBIsplPnQkyE3OqmQFCa6A5ADemxqN10oHY06O0g64QdsvDtGjv2RgRqQLjqq
	 X/kaIis4kmG1ILOrZtmIVZwvyuOq2PILSShRscDn6KScGR2T1M9Y2oeQmTCNFMAdXA
	 JPIWf+KsEH06QvUVvCj/5vAABtpNYejGytaqFzDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FFDAF80553; Fri, 20 Oct 2023 23:22:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15636F8024E;
	Fri, 20 Oct 2023 23:22:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01D28F8025F; Fri, 20 Oct 2023 23:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6CD1F800C9;
	Fri, 20 Oct 2023 23:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CD1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tbAx+zdT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DAECACE2BE0;
	Fri, 20 Oct 2023 21:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2948C433C7;
	Fri, 20 Oct 2023 21:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697836915;
	bh=BLrgnESXlM0bQhQQkhWCSUxl2XgKQbgE2i5fnpBrc3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbAx+zdTw3EmJEMpY/z3xQDVT6pMUekObKYRuLy18CAvtNXOLDqT2TQkAHws9I/Ox
	 kbtovzNKZzwGZmJnhfSKgwZZwdkzmnBE7S6J+6Sl1bJbFOGiXPDOGNIbaiF7wOPGDc
	 7Zo1Ek8L3/NabFUuQoMPIMDPL6vfe/73k1XKI7nL/5SVtLcmovXnqihFFEDFOy50ge
	 4XjMZUEtakggZKWIykJMPZU2NPdHya4DravYwENNSY0TgOkS7TDL7jwt6Jp+vokjeP
	 o8YqjvoA92DhhxAviAa+UeWkU4AWlMO+fjcvpVM45IWFXR3zSA+toM2YMVXdBSg7B8
	 6DZAyiECd4psQ==
Date: Fri, 20 Oct 2023 22:21:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Curtis Malainey <cujomalainey@chromium.org>, stable@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v1] ALSA: SOF: sof-pci-dev: Fix community key quirk
 detection
Message-ID: <79d83b16-518c-4fb1-9652-662a552e3ef3@sirena.org.uk>
References: 
 <20231020145953.v1.1.Iaf5702dc3f8af0fd2f81a22ba2da1a5e15b3604c@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bvpm8AcR9ruTek1u"
Content-Disposition: inline
In-Reply-To: 
 <20231020145953.v1.1.Iaf5702dc3f8af0fd2f81a22ba2da1a5e15b3604c@changeid>
X-Cookie: teamwork, n.:
Message-ID-Hash: LXPHQIIR47RDXFN4YWIKZEHCLEABB6YS
X-Message-ID-Hash: LXPHQIIR47RDXFN4YWIKZEHCLEABB6YS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXPHQIIR47RDXFN4YWIKZEHCLEABB6YS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bvpm8AcR9ruTek1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 02:59:53PM -0600, Mark Hasemeyer wrote:
> Some Chromebooks do not populate the product family DMI value resulting
> in firmware load failures.
>=20
> Add another quirk detection entry that looks for "Google" in the BIOS
> version. Theoretically, PRODUCT_FAMILY could be replaced with
> BIOS_VERSION, but it is left as a quirk to be conservative.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--bvpm8AcR9ruTek1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUy72sACgkQJNaLcl1U
h9AxzAf/Ys7JElKki9A5mFI+I/HvoapP5WVYJNn5ppsCL/Dr6gn1KkfoZxqx7csY
OC1getUOZyrh8/6iqxWKOyyfd6M7wi/CrRYVyRVRnKngH9f9B92K8cKa8HQI3o2t
MvTmnMvg4w0Cpb3scmXznUv6XjdE7pkjHiK4A5OQ2KjiJqjXmqvo7OEOr/D4FNEn
VOMJOG7zCxIfqS121p9ko65ovDfgvrT5FeJBuHeURQkIKXphtP2W5NzwitML4c4H
wBqJd7ZwkikVYzZOSdAXRVQY6huD79jPrbERTp9bDIrEkFsDO47Q9XmxCnl1A4gs
lz5u3eUIF++Y/RxoX9dxNSj4Zh7DTg==
=Bm0n
-----END PGP SIGNATURE-----

--bvpm8AcR9ruTek1u--
